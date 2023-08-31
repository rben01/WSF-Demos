use rand::{
	distributions::{Distribution, Uniform},
	prelude::thread_rng,
};
use wasm_bindgen::prelude::wasm_bindgen;

type Real = f64;

#[wasm_bindgen]
pub fn sample_index_from_cdf(cdf_values: &[Real], sampled_y: Real) -> Real {
	// get random number from uniform(0, 1)
	let mut left = 0;
	let mut right = cdf_values.len() - 1;

	// binary search the cdf points for the (floating-point) index where `r` should go
	while left < right - 1 {
		let index = (left + right) / 2;
		let y = cdf_values[index];
		if y < sampled_y {
			left = index;
		} else {
			right = index;
		}
	}

	// linearly interpolate between the two adjacent indices to get the sampled index
	let y1 = cdf_values[left];
	let y2 = cdf_values[right];
	let t = (sampled_y - y1) / (y2 - y1);

	(left as f64) + t * ((right - left) as f64)
}

#[wasm_bindgen]
pub struct HistBucket {
	x: Real,
	count: usize,
}

#[wasm_bindgen]
pub struct Experiment {
	xs: Vec<Real>,
	cdf_values: Vec<Real>,
	buckets: Vec<HistBucket>,
	hist_bucket_approx_width: Real,
}

#[wasm_bindgen]
impl Experiment {
	pub fn new(cdf_points: Vec<(Real, Real)>, hist_bucket_approx_width: Real) -> Self {

		let n_buckets =
		Self {
			xs,
			cdf_values,
			buckets: Vec::new(),
			hist_bucket_approx_width,
		}
	}
}
