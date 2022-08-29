#![allow(non_snake_case)]

use crate::constants::{HBAR, PI};
use ndarray::prelude::*;
use num::{complex::ComplexFloat, Zero};
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
	let n = n as Real;
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

fn norm(f: impl Fn(Real) -> Complex, interval: (Real, Real)) -> Real {
	integrate(|x| f(x).norm_sqr(), interval, QUAD_METHOD).sqrt()
}

#[wasm_bindgen]
pub struct WavefunctionInitialConditionsComputer {
	params: Parameters,
	eigen_coefs: Vec<Complex>,
}

#[wasm_bindgen]
impl WavefunctionInitialConditionsComputer {
	pub fn clone_(&self) -> Self {
		let Self {
			params,
			eigen_coefs,
		} = self;
		Self {
			params: params.clone(),
			eigen_coefs: eigen_coefs.clone(),
		}
	}
}

#[wasm_bindgen]
impl WavefunctionInitialConditionsComputer {
	pub fn new(params: Parameters) -> Self {
		Self {
			params,
			eigen_coefs: Vec::new(),
		}
	}

	pub fn n_max(&self) -> usize {
		self.eigen_coefs.len()
	}

	pub fn step_compute(&mut self, n_adtl_coefs: usize) {
		let Parameters {
			L,
			μ_0,
			p_0,
			σ_0,
			m: _,
		} = &self.params;
		let L = *L;

		let interval = (0.0, L);

		let ψ_norm_factor = (σ_0 * (2.0 * PI).sqrt()).sqrt();
		let ψ_unnormed = |x: Real| {
			Complex::new(-0.25 * ((x - μ_0) / σ_0).powi(2), p_0 * (x - μ_0) / HBAR).exp()
				/ ψ_norm_factor
		};

		let initial_norm = norm(ψ_unnormed, interval);
		let ψ = |x| ψ_unnormed(x) / initial_norm;

		#[cfg(debug_assertions)]
		{
			let ψ_norm = norm(ψ, interval);
			if (ψ_norm - 1.0).abs() >= 1e-6 {
				panic!(
					"\\Psi did not have a norm near 1; its norm was {:?}",
					ψ_norm
				)
			}
		}

		let prev_n_max = self.n_max();
		for dn in 1..=n_adtl_coefs {
			let n = prev_n_max + dn;
			let ψ_n = |x| get_ψ_n(x, n, L);
			let cn = inner_product(ψ_n, ψ, interval);
			self.eigen_coefs.push(cn)
		}
	}

	pub fn eigen_coef_sq_sum(&self) -> Real {
		self.eigen_coefs
			.iter()
			.fold(0.0, |acc, x| acc + x.norm_sqr())
	}

	pub fn reinit(&mut self, params: Parameters) {
		self.params = params;
		self.eigen_coefs.clear();
	}
}

#[wasm_bindgen]
pub struct WavefunctionInitialConditions {
	params: Parameters,
	eigen_coefs: Array1<Complex>,
	ω_coef: Real,
	n_max: usize,
}

#[wasm_bindgen]
impl WavefunctionInitialConditions {
	fn from(wf_ic_computer: WavefunctionInitialConditionsComputer) -> Self {
		let n_max = wf_ic_computer.n_max();
		let WavefunctionInitialConditionsComputer {
			params,
			eigen_coefs,
		} = wf_ic_computer;

		let ω_coef = {
			let Parameters { L, m, .. } = &params;
			(PI * HBAR / L).powi(2) / (2.0 * m)
		};

		let eigen_coefs = eigen_coefs.into();

		Self {
			params,
			eigen_coefs,
			ω_coef,
			n_max,
		}
	}

	pub fn n_max(&self) -> usize {
		self.n_max
	}
}

#[wasm_bindgen]
pub struct Wavefunction {
	init_conds: WavefunctionInitialConditions,
	xs: Array1<Real>,
	t: Real,
	Ψ_t: Array1<Complex>,
}

#[wasm_bindgen]
impl Wavefunction {
	pub fn new(wf_ic_computer: WavefunctionInitialConditionsComputer, xs: Vec<Real>) -> Self {
		let init_conds = WavefunctionInitialConditions::from(wf_ic_computer);

		let Ψ_t = Array1::zeros((xs.len(),));
		let xs = xs.into();

		let mut wf = Self {
			init_conds,
			xs,
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
			xs,
			Ψ_t,
			t: _,
		} = self;

		let WavefunctionInitialConditions {
			params: Parameters { L, .. },
			eigen_coefs,
			ω_coef,
			n_max,
		} = &*init_conds;

		let L = *L;
		let ω_coef = *ω_coef;
		let n_max = *n_max;

		Ψ_t.fill(Complex::zero());

		Ψ_t.zip_mut_with(xs, |Ψ_xt, &x| {
			for i in 0..n_max {
				let n = i + 1;
				let n_sq = n.pow(2) as Real;
				let ω_n = n_sq * ω_coef;

				let c_n = eigen_coefs[i];
				let angle = c_n * (-Complex::i() * ω_n * t).exp();

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
