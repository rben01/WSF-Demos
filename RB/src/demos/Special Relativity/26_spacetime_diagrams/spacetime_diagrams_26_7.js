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

const buttons = { stop: document.getElementById("button") };
const buttonText = "Show Spatial and Temporal Slices";
buttons.stop.textContent = buttonText;

// eslint-disable-next-line no-unused-vars
function toggle() {
	_toggleSlices(svg, {
		beforeBeginCallback: () => (buttons.stop.innerText = "Stop"),
		afterFinishCallback: () => (buttons.stop.innerText = buttonText),
		beforeCancelCallback: () => (buttons.stop.innerText = buttonText),
	});
}
