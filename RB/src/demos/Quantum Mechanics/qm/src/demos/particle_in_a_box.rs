#![allow(non_snake_case)]

use crate::constants::{HBAR, PI};
use ndarray::prelude::*;
use num::{complex::ComplexFloat, NumCast};
use peroxide::numerical::integral::{integrate, Integral};
use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::wasm_bindgen;

const QUAD_METHOD: Integral = Integral::G20K41(1e-6);

type Real = f64;
type Complex = num::Complex<Real>;

#[wasm_bindgen]
#[derive(Clone, Serialize, Deserialize)]
pub struct Parameters {
	L: Real,
	μ_0: Real,
	p_0: Real,
	σ_0: Real,
	m: Real,
}

#[wasm_bindgen]
impl Parameters {
	pub fn new(L: Real, μ_0: Real, p_0: Real, σ_0: Real, m: Real) -> Self {
		Self {
			L,
			μ_0,
			p_0,
			σ_0,
			m,
		}
	}
}

fn ψ_n(x: Real, n: usize, L: Real) -> Real {
	let n = <Real as NumCast>::from(n)
		.unwrap_or_else(|| panic!("could not convert usize {:?} to a f64", n));

	(2.0 / L).sqrt() * (n * PI * x / L)
}

fn inner_product<S, T, F, G>(f: F, g: G, (a, b): (Real, Real)) -> Complex
where
	S: Into<Complex>,
	T: Into<Complex>,
	F: Fn(Real) -> S,
	G: Fn(Real) -> T,
{
	let integrand = |x| -> Complex { f(x).into().conj() * g(x).into() };
	let integral_re = integrate(|x| integrand(x).re, (a, b), QUAD_METHOD);
	let integral_im = integrate(|x| integrand(x).im, (a, b), QUAD_METHOD);

	Complex::new(integral_re, integral_im)
}

fn norm(f: impl Fn(Real) -> Complex, (a, b): (Real, Real)) -> Real {
	integrate(|x| f(x).norm_sqr(), (a, b), QUAD_METHOD).sqrt()
}

#[wasm_bindgen]
pub struct EigenfunctionCoefficients {
	eigen_coefs: Array1<Complex>,
}

#[wasm_bindgen]
impl EigenfunctionCoefficients {
	pub fn len(&self) -> usize {
		self.eigen_coefs.len()
	}

	pub fn is_empty(&self) -> bool {
		self.len() == 0
	}

	pub fn coefs_js(&self) -> *const Complex {
		self.eigen_coefs.as_ptr()
	}

	pub fn new(params: &Parameters, tol: Real) -> Self {
		let Parameters {
			L,
			μ_0,
			p_0,
			σ_0,
			m: _,
		} = params;

		let interval = (0.0, *L);

		let ψ_unnormed = |x: Real| {
			let norm_factor = (σ_0 * (2.0 * PI).sqrt()).sqrt();
			Complex::new(-0.25 * ((x - μ_0) / σ_0).powi(2), p_0 * (x - μ_0) / HBAR).exp()
				/ norm_factor
		};

		let initial_norm = norm(ψ_unnormed, interval);
		let ψ = |x| ψ_unnormed(x) / initial_norm;

		if (norm(ψ, interval) - 1.0).abs() >= 1e-6 {
			panic!(
				"\\Psi did not have a norm near 1; its norm was {:?}",
				norm(ψ, interval)
			)
		}

		let mut eigen_coefs = Vec::new();

		let max_n_allowed = 1000_usize;

		for n in 1..=max_n_allowed {
			let ψ_n = |x| ψ_n(x, n, *L);
			let cn = inner_product(ψ_n, ψ, interval);
			eigen_coefs.push(cn)
		}

		Self {
			eigen_coefs: eigen_coefs.into(),
		}
	}
}

#[wasm_bindgen]
pub struct WavefunctionInitialConditions {
	params: Parameters,
	eigen_coefs: EigenfunctionCoefficients,
	ψ_n_cache: Array2<Real>,
}

#[wasm_bindgen]
impl WavefunctionInitialConditions {
	pub fn new(params: &Parameters, xs: &[Real]) -> Self {
		let params = params.clone();
		let eigen_coefs = EigenfunctionCoefficients::new(&params, 1e-6);
		let n_max = eigen_coefs.len();
		let mut ψ_n_cache = Array2::zeros((n_max, xs.len()));

		// Fill ψ_n_cache; `n_max` rows and `xs.len()` columns. Row `n-1` is the result of
		// `psi_n` on `xs` (since rows go from 0 to n_max-1 but n goes from 1 to n_max).
		// Column `c` is the result of all psi_n's on `xs[c]`.
		for i in 0..n_max {
			let n = i + 1;
			let mut row_n = ψ_n_cache.index_axis_mut(Axis(0), i);
			row_n.zip_mut_with(&ArrayView1::from(xs), |elem, &x| {
				*elem = ψ_n(x, n, params.L)
			});
		}

		Self {
			params,
			eigen_coefs,
			ψ_n_cache,
		}
	}

	pub fn n_max(&self) -> usize {
		self.eigen_coefs.len()
	}
}

#[wasm_bindgen]
pub struct Wavefunction {
	init_conds: WavefunctionInitialConditions,
	Ψ_t: Array1<Complex>,
	t: Real,
}

#[wasm_bindgen]
impl Wavefunction {
	pub fn new(params: &Parameters, xs: &[Real]) -> Self {
		let Ψ_t = Array1::zeros((xs.len(),));
		let init_conds = WavefunctionInitialConditions::new(params, xs);
		let mut wf = Self {
			init_conds,
			Ψ_t,
			t: 0.0,
		};

		wf.set_t(0.0);

		wf
	}

	pub fn set_t(&mut self, t: Real) {
		self.t = t;

		let WavefunctionInitialConditions {
			params,
			eigen_coefs,
			ψ_n_cache,
			..
		} = &self.init_conds;
		let EigenfunctionCoefficients { eigen_coefs } = &eigen_coefs;

		let Ψ_t = &mut self.Ψ_t;

		let Parameters { L, m, .. } = params;
		let ω_coef = (PI * HBAR / L).powi(2) / (2.0 * m);

		for (i, c_n) in (0..self.init_conds.n_max()).zip(eigen_coefs.iter()).rev() {
			let n = i + 1;
			let n_sq = <Real as NumCast>::from(n.pow(2))
				.unwrap_or_else(|| panic!("could not convert {:?} to f64", n.pow(2)));
			let ω_n = n_sq * ω_coef;

			Ψ_t.zip_mut_with(&ψ_n_cache.index_axis(Axis(0), i), |elem, &ψ_n_val| {
				*elem += c_n * ψ_n_val * (-Complex::i() * ω_n * t).exp();
			})
		}
	}

	pub fn curr_t(&self) -> Real {
		self.t
	}

	pub fn psi_t_ptr(&self) -> *const Complex {
		self.Ψ_t.as_ptr()
	}

	/// Ψ_t contains complex numbers, which are two floats each
	pub fn buffer_len(&self) -> usize {
		2 * self.Ψ_t.len()
	}
}
