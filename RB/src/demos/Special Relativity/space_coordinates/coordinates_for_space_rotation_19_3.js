/* global applyDatum, applyGraphicalObjs */

"use strict";

const RANGES = {
	x: { min: -2, max: 2 },
	y: { min: -10, max: 10 },
};
Object.keys(RANGES).forEach(k => {
	const v = RANGES[k];
	v.mid = ((v.max + v.min) * 3) / 4;
	v.posDist = v.max - v.mid;
	v.negDist = v.mid - v.min;
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
	const sin = Math.sin(angleRad);
	const cos = Math.cos(angleRad);
	console.log(sin, cos);

	const rotAxesAttrs = {
		"stroke-width": 3,
	};

	// Remember, in canvas coords, +y is down, -y is up
	const xMidCanvas = xScale(RANGES.x.mid);
	const yMidCanvas = yScale(RANGES.y.mid);
	const xPosDistCanvas = xScale(RANGES.x.max) - xMidCanvas;
	const xNegDistCanvas = xMidCanvas - xScale(RANGES.x.min);
	const yPosDistCanvas = yMidCanvas - yScale(RANGES.y.max);
	const yNegDistCanvas = yScale(RANGES.y.min) - yMidCanvas;

	const rotAxesData = [
		{
			shape: "line",
			class: "rot-axis-x",
			attrs: {
				x1: xMidCanvas - xNegDistCanvas * cos,
				y1: yMidCanvas + xNegDistCanvas * sin,
				x2: xMidCanvas + xPosDistCanvas * cos,
				y2: yMidCanvas - xPosDistCanvas * sin,
				stroke: "#bdf",
				...rotAxesAttrs,
			},
		},
		{
			shape: "line",
			class: "rot-axis-y",
			attrs: {
				x1: xMidCanvas + yNegDistCanvas * sin,
				y1: yMidCanvas + yNegDistCanvas * cos,
				x2: xMidCanvas - yPosDistCanvas * sin,
				y2: yMidCanvas - yPosDistCanvas * cos,
				stroke: "#c45",
				...rotAxesAttrs,
			},
		},
	];
	return rotAxesData;
}

drawGraph();

function updateAngle({ angleRad }) {
	applyGraphicalObjs(subcanvases, () => getLinesData({ angleRad }), {
		selector: ".graph-obj",
		cssClass: "graph-obj",
	});
}
