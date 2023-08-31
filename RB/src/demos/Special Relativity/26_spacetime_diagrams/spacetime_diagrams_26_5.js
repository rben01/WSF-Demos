/* global  _toggleSlices svg  _updateDiagrams */

const sliders = {
	speed: document.getElementById("input-speed"),
};

const textSpans = {
	speed: document.getElementById("text-speed"),
};

function update({ speed }) {
	_updateDiagrams({
		axes: "x",
		speed,
		speedSlider: sliders.speed,
		speedText: textSpans.speed,
	});
}

update({});

const buttons = { stop: document.getElementById("button") };
// eslint-disable-next-line no-unused-vars
function toggle() {
	const b = buttons.stop;
	_toggleSlices(svg, b, {
		sliceType: "spatial",
		afterFinishCallback: () => {
			b.innerText = "Hide Spatial Slices";
		},
		afterResetCallback: () => {
			b.innerText = "Show Spatial Slices";
		},
	});
}
