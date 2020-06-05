/* global applyDatum, applyGraphicalObjs */

"use strict";

const RANGES = {
	x: { min: -1, max: 1 },
	y: { min: -1, max: 1 },
};
Object.keys(RANGES).forEach(k => {
	const v = RANGES[k];
	const sqrt2 = Math.sqrt(2);
	v.mid = ((v.max + v.min) * 3) / 4;
	v.posDist = (v.max - v.mid) * sqrt2;
	v.negDist = (v.mid - v.min) * sqrt2;
});

const CANVAS_WIDTH = 400;
const CANVAS_HEIGHT = 400;
const AXIS_MARGINS = { top: 0, bottom: 0, left: 0, right: 0 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const sliders = {};
["x", "y"].forEach(v => {
	const slider = document.getElementById(`input-${v}-coord`);
	sliders[v] = slider;

	slider.min = RANGES[v].min;
	slider.max = RANGES[v].max;
	slider.step = 0.001;
	slider.value = 0;
});
sliders.angle = (() => {
	const angleSlider = document.getElementById("input-angle-rad");
	angleSlider.min = "-1";
	angleSlider.max = "1";
	angleSlider.step = ".001";
	angleSlider.value = "-1";
	return angleSlider;
})();

const canvas = d3
	.select("#viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

canvas
	.append("svg:defs")
	.append("svg:marker")
	.attr("id", "marker-arrowhead")
	.attr("refX", 15)
	.attr("refY", -1.5)
	.attr("markerWidth", 6)
	.attr("markerHeight", 6)
	.attr("orient", "auto")
	.append("path")
	.attr("d", "M 0 -5 10 10")
	.attr("stroke", "white")
	.attr("fill", "white");

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

const xScale = d3
	.scaleLinear()
	.domain([RANGES.x.min, RANGES.x.max])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);
const yScale = d3
	.scaleLinear()
	.domain([RANGES.y.min, RANGES.y.max])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);

function drawGraph() {
	subcanvases.each(function () {
		const subcanvas = d3.select(this);
		const axisAttrs = {
			stroke: "white",
			"stroke-width": 2,
		};
		subcanvas
			.selectAll()
			.data([
				{
					shape: "line",
					class: "axis-x",
					attrs: {
						x1: xScale(RANGES.x.min),
						x2: xScale(RANGES.x.max),
						y1: yScale(RANGES.y.mid),
						y2: yScale(RANGES.y.mid),
						...axisAttrs,
					},
				},
				{
					shape: "line",
					class: "axis-y",
					attrs: {
						x1: xScale(RANGES.x.mid),
						x2: xScale(RANGES.x.mid),
						y1: yScale(RANGES.y.min),
						y2: yScale(RANGES.y.max),
						...axisAttrs,
					},
				},
			])
			.enter()
			.append("svg:line")
			.each(applyDatum);
	});
}

function getLinesData({ x, y, angleRad }) {
	if (typeof x === "undefined") {
		x = +sliders.x.value;
	}

	if (typeof y === "undefined") {
		y = +sliders.y.value;
	}

	if (typeof angleRad === "undefined") {
		angleRad = +sliders.angle.value;
	}

	const sin = Math.sin(angleRad);
	const cos = Math.cos(angleRad);

	const rotAxesAttrs = {
		"stroke-width": 3,
	};

	const rotAxesData = [
		{
			shape: "line",
			class: "rot-axis-x",
			attrs: {
				x1: xScale(RANGES.x.mid - RANGES.x.negDist * cos),
				y1: yScale(RANGES.y.mid - RANGES.x.negDist * sin),
				x2: xScale(RANGES.x.mid + RANGES.x.posDist * cos),
				y2: yScale(RANGES.y.mid + RANGES.x.posDist * sin),
				stroke: "#bdf",
				...rotAxesAttrs,
			},
		},
		{
			shape: "line",
			class: "rot-axis-y",
			attrs: {
				x1: xScale(RANGES.x.mid + RANGES.y.negDist * sin),
				y1: yScale(RANGES.y.mid - RANGES.y.negDist * cos),
				x2: xScale(RANGES.x.mid - RANGES.y.posDist * sin),
				y2: yScale(RANGES.y.mid + RANGES.y.posDist * cos),
				stroke: "#c45",
				...rotAxesAttrs,
			},
		},
	];

	const uprightLinesAttrs = {
		stroke: "white",
		"stroke-width": 2,
		"stroke-dasharray": "5 5",
	};
	const uprightLinesData = [
		{
			shape: "line",
			class: "upright-line-horizontal",
			attrs: {
				x1: xScale(0),
				y1: yScale(y),
				x2: xScale(x),
				y2: yScale(y),
				...uprightLinesAttrs,
			},
		},
		{
			shape: "line",
			class: "upright-line-vertical",
			attrs: {
				x1: xScale(x),
				y1: yScale(0),
				x2: xScale(x),
				y2: yScale(y),
				...uprightLinesAttrs,
			},
		},
	];

	const m = Math.tan(angleRad, angleRad);
	const rotLine1X1 = (x * m - y) / (m + 1 / m);
	const rotLine1Y1 = y + m * (rotLine1X1 - x);
	const rotLine2X1 = (m * y + x) / (m * m + 1);
	const rotLine2Y1 = y - (1 / m) * (rotLine2X1 - x);

	const rotatedLinesAttrs = {
		stroke: "red",
		"stroke-width": 2,
		"stroke-dasharray": "5 5",
	};
	const rotatedLinesData = [
		{
			shape: "line",
			class: "rotated-line-horizontal",
			attrs: {
				x1: xScale(rotLine1X1),
				y1: yScale(rotLine1Y1),
				x2: xScale(x),
				y2: yScale(y),
				...rotatedLinesAttrs,
			},
		},
		{
			shape: "line",
			class: "rotated-line-vertical",
			attrs: {
				x1: xScale(rotLine2X1),
				y1: yScale(rotLine2Y1),
				x2: xScale(x),
				y2: yScale(y),
				...rotatedLinesAttrs,
			},
		},
	];

	return [...rotAxesData, ...uprightLinesData, ...rotatedLinesData];
}

drawGraph();

function updateAngle({ x, y, angleRad }) {
	applyGraphicalObjs(subcanvases, () => getLinesData({ x, y, angleRad }), {
		selector: ".graph-obj",
		cssClass: "graph-obj",
	});
}
