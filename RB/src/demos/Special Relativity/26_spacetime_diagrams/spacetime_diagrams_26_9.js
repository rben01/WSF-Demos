/* global svg _updateDiagrams AXES ticks applyGraphicalObjs xScale yScale */

const sliders = {
	speed: document.getElementById("input-speed"),
};

const textSpans = {
	speed: document.getElementById("text-speed"),
};

// Draw gridlines
(() => {
	const ticks = d3.range(-2, 2 + 0.000001, 1);
	const nonzeroTicks = ticks.filter(t => t !== 0);
	const lines = [
		...nonzeroTicks.map(x => ({ x1: x, x2: x, y1: -2.2, y2: 2.2 })),
		...nonzeroTicks.map(y => ({ x1: -2.2, x2: 2.2, y1: y, y2: y })),
	].map(attrs => ({
		shape: "line",
		attrs: {
			...attrs,
			x1: xScale(attrs.x1),
			x2: xScale(attrs.x2),
			y1: yScale(attrs.y1),
			y2: yScale(attrs.y2),
			stroke: "white",
			"stroke-width": 1,
			"stroke-dasharray": "1 2",
		},
	}));

	applyGraphicalObjs(svg, lines);
})();

function update({ speed }) {
	_updateDiagrams({
		axes: ["x", "t"],
		speed,
		speedSlider: sliders.speed,
		speedText: textSpans.speed,
		hideSecondaryAxesByDefault: false,
	});
}

update({ axes: ["x", "t"] });
