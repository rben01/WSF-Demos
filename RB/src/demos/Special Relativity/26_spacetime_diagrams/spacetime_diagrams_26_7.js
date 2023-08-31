/* global _toggleSlices svg _updateDiagrams */

const sliders = {
	speed: document.getElementById("input-speed"),
};

const textSpans = {
	speed: document.getElementById("text-speed"),
};

function update({ speed }) {
	_updateDiagrams({
		axes: ["x", "t"],
		speed,
		speedSlider: sliders.speed,
		speedText: textSpans.speed,
	});
}

update({ axes: ["x", "t"] });

const buttons = {
	spatial: document.getElementById("button-spatial"),
	temporal: document.getElementById("button-temporal"),
};

buttons.spatial.textContent = "Show Spatial Slices";

function _toggle(sliceType) {
	const b = sliceType === "spatial" ? buttons.spatial : buttons.temporal;
	const buttonText = sliceType.charAt(0).toUpperCase() + sliceType.slice(1);
	_toggleSlices(svg, b, {
		sliceType,
		afterFinishCallback: () => {
			b.innerText = `Hide ${buttonText} Slices`;
		},
		afterResetCallback: () => {
			b.innerText = `Show ${buttonText} Slices`;
		},
	});
}

// eslint-disable-next-line no-unused-vars
function toggleSpatial() {
	_toggle("spatial");
}

// eslint-disable-next-line no-unused-vars
function toggleTemporal() {
	_toggle("temporal");
}
