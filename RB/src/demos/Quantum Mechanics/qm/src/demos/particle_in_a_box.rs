#![allow(non_snake_case)]

use crate::constants::{HBAR, PI};
use ndarray::prelude::*;
use num::{complex::ComplexFloat, NumCast, Zero};
use peroxide::numerical::integral::{integrate, Integral};
use serde::{Deserialize, Serialize};
use wasm_bindgen::prelude::wasm_bindgen;

const QUAD_METHOD: Integral = Integral::G30K61(1e-12);

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

	pub fn get_L(&self) -> Real {
		self.L
	}

	pub fn get_mu_0(&self) -> Real {
		self.μ_0
	}

	pub fn get_p_0(&self) -> Real {
		self.p_0
	}

	pub fn get_sigma_0(&self) -> Real {
		self.σ_0
	}

	pub fn get_m(&self) -> Real {
		self.m
	}
}

fn get_ψ_n(x: Real, n: usize, L: Real) -> Real {
	let n = <Real as NumCast>::from(n)
		.unwrap_or_else(|| panic!("could not convert usize {:?} to a f64", n));

	(2.0 / L).sqrt() * (n * PI * x / L).sin()
}

fn inner_product<S, T, F, G>(f: F, g: G, interval: (Real, Real)) -> Complex
where
	S: Into<Complex>,
	T: Into<Complex>,
	F: Fn(Real) -> S,
	G: Fn(Real) -> T,
{
	let integrand = |x| -> Complex { f(x).into().conj() * g(x).into() };
	let integral_re = integrate(|x| integrand(x).re, interval, QUAD_METHOD);
	let integral_im = integrate(|x| integrand(x).im, interval, QUAD_METHOD);

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
		let L = *L;

		let interval = (0.0, L);

		let ψ_norm_factor = (σ_0 * (2.0 * PI).sqrt()).sqrt();
		let ψ_unnormed = |x: Real| {
			Complex::new(-0.25 * ((x - μ_0) / σ_0).powi(2), p_0 * (x - μ_0) / HBAR).exp()
				/ ψ_norm_factor
		};

		let initial_norm = norm(ψ_unnormed, interval);
		let ψ = |x| ψ_unnormed(x) / initial_norm;

		{
			let ψ_norm = norm(ψ, interval);
			if (ψ_norm - 1.0).abs() >= 1e-6 {
				panic!(
					"\\Psi did not have a norm near 1; its norm was {:?}",
					ψ_norm
				)
			}
		}

		let mut eigen_coefs = Vec::new();

		let max_n_allowed = 2000_usize;

		for n in 1..=max_n_allowed {
			let ψ_n = |x| get_ψ_n(x, n, L);
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
	xs: Array1<Real>,
}

#[wasm_bindgen]
impl WavefunctionInitialConditions {
	pub fn new(params: &Parameters, xs: Vec<Real>) -> Self {
		let params = params.clone();
		let eigen_coefs = EigenfunctionCoefficients::new(&params, 1e-6);
		let xs = Array1::from(xs);

		Self {
			params,
			eigen_coefs,
			xs,
		}
	}

	pub fn n_max(&self) -> usize {
		self.eigen_coefs.len()
	}
}

#[wasm_bindgen]
pub struct Wavefunction {
	init_conds: WavefunctionInitialConditions,
	angle_cache: Array1<Complex>,
	ω_coef: Real,
	t: Real,
	Ψ_t: Array1<Complex>,
}

#[wasm_bindgen]
impl Wavefunction {
	pub fn new(params: &Parameters, xs: Vec<Real>) -> Self {
		let Ψ_t = Array1::zeros((xs.len(),));
		let init_conds = WavefunctionInitialConditions::new(params, xs);
		let angle_cache = Array1::zeros((init_conds.eigen_coefs.len(),));

		let ω_coef = {
			let Parameters { L, m, .. } = params;
			(PI * HBAR / L).powi(2) / (2.0 * m)
		};

		let mut wf = Self {
			init_conds,
			angle_cache,
			ω_coef,
			t: 0.0,
			Ψ_t,
		};

		wf.set_t(0.0);

		wf
	}

	pub fn set_t(&mut self, t: Real) {
		self.t = t;

		let Self {
			init_conds,
			angle_cache,
			ω_coef,
			Ψ_t,
			t: _,
		} = self;

		let init_conds = &*init_conds;
		let ω_coef = *ω_coef;
		let n_max = init_conds.n_max();

		let WavefunctionInitialConditions {
			params: Parameters { L, .. },
			eigen_coefs: EigenfunctionCoefficients { eigen_coefs },
			xs,
			..
		} = init_conds;

		let L = *L;

		Ψ_t.fill(Complex::zero());

		for i in 0..n_max {
			let n = i + 1;
			let c_n = eigen_coefs[i];
			let n_sq = <Real as NumCast>::from(n.pow(2))
				.unwrap_or_else(|| panic!("could not convert {:?} to f64", n.pow(2)));
			let ω_n = n_sq * ω_coef;

			angle_cache[i] = c_n * (-Complex::i() * ω_n * t).exp();
		}

		Ψ_t.zip_mut_with(xs, |Ψ_xt, &x| {
			for i in 0..n_max {
				let n = i + 1;
				let angle = self.angle_cache[i];
				let z = angle * get_ψ_n(x, n, L);

				*Ψ_xt += z;
			}
		});
	}

	pub fn tick(&mut self, dt: Real) {
		self.set_t(self.t + dt)
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
