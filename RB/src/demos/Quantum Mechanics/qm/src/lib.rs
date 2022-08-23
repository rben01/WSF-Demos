mod demos;
mod utils;

pub use demos::constants;
pub use demos::particle_in_a_box::{
	EigenfunctionCoefficients, Parameters, Wavefunction, WavefunctionInitialConditions,
};

use wasm_bindgen::prelude::*;

// When the `wee_alloc` feature is enabled, use `wee_alloc` as the global
// allocator.
#[cfg(feature = "wee_alloc")]
#[global_allocator]
static ALLOC: wee_alloc::WeeAlloc = wee_alloc::WeeAlloc::INIT;

// https://rustwasm.github.io/wasm-bindgen/examples/console-log.html
#[wasm_bindgen]
extern "C" {
	// Use `js_namespace` here to bind `console.log(..)` instead of just
	// `log(..)`
	#[wasm_bindgen(js_namespace = console, js_name=log)]
	fn js_log(s: &str);
}
