/* globals _addGraphicalObjs applyDatum lorentzFactor STANDARD_COLORS */

"use strict";

const CANVAS_WIDTH = 1000;
const CANVAS_HEIGHT = 600;
const AXIS_MARGINS = { top: 0.1, bottom: 0.1, left: 0.13, right: 0.06 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const curve = d3
	.line()
	.x((xy) => xScale(xy[0]))
	.y((xy) => yScale(xy[1]))
	.curve(d3.curveCardinal);

const canvas = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const subcanvases = canvas
	.data([
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
		},
	])
	.each(function (d) {
		d3.select(this)
			.append("g")
			.attr("transform", `translate(0, ${d.originY})`)
			.classed("subcanvas", true);
	})
	.selectAll("g");

const speedInputSlider = document.getElementById("input-particle-speed");
const speedTextSpan = document.getElementById("particle-speed-text");
const relMassTextSpan = document.getElementById("particle-rel-mass-text");

function getSpeed(speedStr) {
	speedStr =
		typeof speedStr !== "undefined" ? speedStr : speedInputSlider.value;
	const floatVal = Number.parseFloat(speedStr);
	if (floatVal < 0) {
		return 0;
	}
	if (floatVal > 1) {
		return 1;
	}

	return floatVal;
}

function getLF({ fracOfC, lf }) {
	if (typeof lf === "undefined") {
		lf = lorentzFactor({ fracOfC });
	}
	return lf;
}

const xScale = d3
	.scaleLinear()
	.domain([0, 1])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);

const yScale = d3
	.scaleLinear()
	.domain([0, getLF({ fracOfC: speedInputSlider.max })])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);

const graphObjs = {};
let data = [[0, 1]];

function drawGraph() {
	const base = 10;
	const startPrecision = 2;

	console.log(data);

	subcanvases.each(function () {
		const subcanvas = d3.select(this);

		// Add axes
		const commonAxesAttrs = {
			stroke: "#666",
			"stroke-width": 2,
			"stroke-linecap": "square",
		};
		const axesAttrs = [
			{
				class: "x-axis",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMax,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMin,
					...commonAxesAttrs,
				},
			},
			{
				class: "y-axis",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMin,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMax,
					...commonAxesAttrs,
				},
			},
		];

		subcanvas
			.selectAll()
			.data(axesAttrs)
			.enter()
			.append("svg:line")
			.each(applyDatum);

		// Make ticks
		const minorTickLength = 3;
		const commonTickAttrs = {
			stroke: "#666",
			"stroke-width": 1,
			opacity: 0,
		};

		const xTicksData = xScale.ticks(21).map((x) => {
			const tickX = xScale(x);
			return {
				class: "x-tick",
				attrs: {
					x1: tickX,
					x2: tickX,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMin - minorTickLength,
					...commonTickAttrs,
				},
			};
		});
		const yTicksData = yScale.ticks(21).map((y) => {
			const tickY = yScale(y);
			return {
				class: "y-tick",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMin + minorTickLength,
					y1: tickY,
					y2: tickY,
					...commonTickAttrs,
				},
			};
		});

		subcanvas
			.selectAll()
			.data([...xTicksData, ...yTicksData])
			.enter()
			.append("svg:line")
			.each(applyDatum);

		// Add axis labels
		const commonAxisLabelAttrs = {
			"font-size": 15,
			fill: "white",
		};
		const xTickTextData = [];

		// xScale.ticks(6).map((x) => {
		// 	return {
		// 		class: "x-axis-label",
		// 		text: x,
		// 		attrs: {
		// 			x: xScale(x),
		// 			y: AX_BOUNDS.yMin + 22,
		// 			"text-anchor": "middle",
		// 			"dominant-baseline": "text-top",
		// 			...commonAxisLabelAttrs,
		// 		},
		// 	};
		// });

		const yTickTextData = [];
		// yScale.ticks(4).map((y) => {
		// 	return {
		// 		class: "y-axis-label",
		// 		text: y,
		// 		attrs: {
		// 			x: AX_BOUNDS.xMin - 10,
		// 			y: yScale(y),
		// 			"text-anchor": "end",
		// 			"dominant-baseline": "central",
		// 			...commonAxisLabelAttrs,
		// 		},
		// 	};
		// });

		subcanvas
			.selectAll()
			.data([...xTickTextData, ...yTickTextData])
			.enter()
			.append("svg:text")
			.each(applyDatum)
			.text((d) => d.text);

		// Add v/c label to x axis
		// https://stackoverflow.com/a/22085843
		subcanvas
			.append("text")
			.attr("x", (AX_BOUNDS.xMin + AX_BOUNDS.xMax) / 2)
			.attr("y", AX_BOUNDS.yMin + 24)
			.attr("font-size", 21)
			.attr("stroke", "none")
			.attr("fill", "white")
			.attr("text-anchor", "middle")
			.text("speed")
			.classed("x-axis-unit", true);

		// Add distance label to y axis
		subcanvas
			.append("text")
			.attr("x", AX_BOUNDS.xMin - 18)
			.attr("y", (AX_BOUNDS.yMin + AX_BOUNDS.yMax) / 2)
			.attr("font-size", 21)
			.attr("stroke", "none")
			.attr("fill", "white")
			.attr("text-anchor", "middle")
			.attr(
				"transform",
				`rotate(-90, ${AX_BOUNDS.xMin - 18}, ${(AX_BOUNDS.yMin + AX_BOUNDS.yMax) / 2})`,
			)
			.text("mass");

		subcanvas
			.append("svg:line")
			.attr("x1", AX_BOUNDS.xMax)
			.attr("x2", AX_BOUNDS.xMax)
			.attr("y1", AX_BOUNDS.yMin)
			.attr("y2", AX_BOUNDS.yMax)
			.attr("stroke", "#8ff")
			.attr("stroke-width", 2)
			.attr("stroke-dasharray", 4);
	});
}

function getGridlinesData({ fracOfC }) {
	if (typeof fracOfC === "undefined") {
		fracOfC = 0.5;
	}

	fracOfC = Math.min(fracOfC, +speedInputSlider.max);

	const x = xScale(fracOfC);
	const y = yScale(getLF({ fracOfC }));

	data = [];
	for (let v = 0; v < fracOfC; v += 0.001) {
		data.push([v, getLF({ fracOfC: v })]);
	}
	data.push([fracOfC, getLF({ fracOfC })]);

	const commonLineAttrs = {
		"stroke-width": 3,
		"stroke-dasharray": "1.5 1.5",
	};
	return [
		{
			shape: "line",
			class: "gridline horizontal",
			type: "horizontal",
			attrs: {
				x1: AX_BOUNDS.xMin,
				x2: x,
				y1: y,
				y2: y,
				stroke: STANDARD_COLORS.secondary,
				...commonLineAttrs,
			},
		},
		{
			shape: "line",
			class: "gridline vertical",
			type: "vertical",
			attrs: {
				x1: x,
				x2: x,
				y1: AX_BOUNDS.yMin,
				y2: y,
				stroke: STANDARD_COLORS.highlighted,
				...commonLineAttrs,
			},
		},

		{
			shape: "path",
			attrs: {
				d: curve(data),
				stroke: "#fffd",
				"stroke-width": 4,
				fill: "none",
			},
		},
		{
			shape: "circle",
			class: "gridline-dot",
			attrs: {
				cx: x,
				cy: y,
				r: 4,
				fill: "white",
			},
		},
	];
}

drawGraph();
graphObjs.gridLines = _addGraphicalObjs(subcanvases, getGridlinesData);

// eslint-disable-next-line no-unused-vars
function updateParticleSpeed(speedStr, { fromUserInput = true } = {}) {
	try {
		if (!fromUserInput) {
			speedInputSlider.value = speedStr;
		}

		const speed = getSpeed(speedStr);
		speedTextSpan.textContent = speed.toFixed(3);

		const relMass = getLF({ fracOfC: speed });
		relMassTextSpan.textContent = relMass.toFixed(2);

		graphObjs.gridLines
			.data(getGridlinesData({ fracOfC: speed }))
			.each(function (d) {
				const self = d3.select(this);
				for (const [key, val] of Object.entries(d.attrs)) {
					self.attr(key, val);
				}
			});
	} catch (e) {
		console.log(speedStr);
		throw e;
	}
}

const playButton = document.getElementById("btn-play");
d3.select(playButton).on("click", () => {
	playButton.disabled = true;

	const durationMS = 10000;
	const speedInterp = d3.interpolateNumber(
		+speedInputSlider.min,
		+speedInputSlider.max,
	);

	let startMS;

	function step(timestampMS) {
		if (startMS === undefined) {
			startMS = timestampMS;
		}

		const elapsedMS = timestampMS - startMS;
		const durationFrac = elapsedMS / durationMS;
		const speed = speedInterp(durationFrac);

		updateParticleSpeed(speed, { fromUserInput: false });

		if (elapsedMS < durationMS) {
			window.requestAnimationFrame(step);
		} else {
			playButton.disabled = false;
			playButton.innerText = "Play again";
		}
	}
	window.requestAnimationFrame(step);
});
