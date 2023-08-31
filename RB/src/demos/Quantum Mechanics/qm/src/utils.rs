#![allow(non_upper_case_globals)]

#[allow(unused_imports)]
use wasm_bindgen::prelude::wasm_bindgen;

#[wasm_bindgen]
#[cfg(feature = "console_error_panic_hook")]
pub fn set_panic_hook() {
	console_error_panic_hook::set_once();
}
