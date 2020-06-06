/* global applyDatum, applyGraphicalObjs */

"use strict";

const RANGES = {
	x: { min: -15, max: 15 },
	y: { min: -15, max: 15 },
};
Object.keys(RANGES).forEach(k => {
	const v = RANGES[k];
	v.mid = ((v.max + v.min) * 3) / 4;
	v.posDist = v.max - v.mid;
	v.negDist = v.mid - v.min;
	v.span = v.max - v.min;
});

const CANVAS_WIDTH = 400;
const CANVAS_HEIGHT = 400;
const AXIS_MARGINS = { top: 0.05, bottom: 0.05, left: 0.05, right: 0.05 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const ANGLES = {
	n: 1001,
	min: -Math.PI * 0.4,
	max: Math.PI * 0.4,
};

const sliders = {};
["x", "y"].forEach(v => {
	const slider = document.getElementById(`input-${v}-coord`);
	sliders[v] = slider;

	slider.min = -10;
	slider.max = 10;
	slider.step = 0.001;
	slider.value = 0;
});
sliders.angle = (() => {
	const angleSlider = document.getElementById("input-angle-rad");
	angleSlider.min = 0;
	angleSlider.max = ANGLES.n - 1;
	angleSlider.step = 1;
	angleSlider.value = (ANGLES.n - 1) / 2;
	return angleSlider;
})();

const textSpans = {
	angle: document.getElementById("text-angle"),
	upright: {
		x: document.getElementById("text-upright-x"),
		y: document.getElementById("text-upright-y"),
	},
	rotated: {
		x: document.getElementById("text-rotated-x"),
		y: document.getElementById("text-rotated-y"),
	},
};

const highlightFGColor = "#5df";

const canvas = d3
	.select("#viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const ARROWHEAD_IDS = {
	upright: "marker-arrowhead-upright",
	rotated: "marker-arrowhead-rotated",
};
(() => {
	const markerAttrs = {
		attrs: {
			refX: 4,
			refY: 4,
			markerUnits: "strokeWidth",
			markerWidth: 10,
			markerHeight: 8,
			orient: "auto",
		},
	};
	const pathAttrs = { attrs: { d: "M 0 0 L 10 4 L 0 8 L 4 4 z" } };
	const defs = canvas.append("svg:defs");

	[
		[ARROWHEAD_IDS.upright, "white"],
		[ARROWHEAD_IDS.rotated, highlightFGColor],
	].forEach(([id, color]) => {
		defs.append("svg:marker")
			.attr("id", id)
			.each(function () {
				applyDatum.call(this, markerAttrs);
			})
			.append("svg:path")
			.each(function () {
				applyDatum.call(this, pathAttrs);
			})
			.attr("stroke", color)
			.attr("fill", color);
	});
})();

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

function scalarMult(a, vec) {
	return vec.map(x => a * x);
}

function getUnitVector(v) {
	const sumSq = v.reduce((accum, currVal) => accum + currVal * currVal, 0);
	const norm = Math.sqrt(sumSq);
	return scalarMult(1 / norm, v);
}

function dotProd(x, y) {
	if (x.length !== y.length) {
		throw new Error("Got vectors of different lengths");
	}

	let dp = 0;
	for (let i = 0; i < x.length; ++i) {
		dp += x[i] * y[i];
	}
	return dp;
}

function projection(a, b) {
	const unitB = getUnitVector(b);
	const magnitude = dotProd(a, unitB);
	return scalarMult(magnitude, unitB);
}

function getAngleFromIndex(angleIndex) {
	return -(ANGLES.min + (angleIndex / ANGLES.n) * (ANGLES.max - ANGLES.min));
}

function drawGraph() {
	subcanvases.each(function () {
		const subcanvas = d3.select(this);
		const axisAttrs = {
			stroke: "white",
			"stroke-width": 2,
			"marker-end": `url(#${ARROWHEAD_IDS.upright})`,
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

		subcanvas
			.selectAll("text")
			.data([
				{
					shape: "text",
					class: "axis-x-label",
					attrs: {
						x: xScale(RANGES.x.max),
						y: yScale(RANGES.y.mid + RANGES.y.span * 0.05),
						fill: "white",
						// stroke: "white",
					},
					text: "𝑥",
				},
				{
					shape: "text",
					class: "axis-y-label",
					attrs: {
						x: xScale(RANGES.x.mid + RANGES.x.span * 0.05),
						y: yScale(RANGES.y.max),
						fill: "white",
						// stroke: "white",
					},
					text: "𝑦",
				},
			])
			.enter()
			.append("svg:text")
			.each(applyDatum)
			.text(d => d.text);
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
		angleRad = +getAngleFromIndex(sliders.angle.value);
	}

	// Reverse direction of slider as it pertains to angles
	// angleRad = -angleRad;

	const sin = Math.sin(angleRad);
	const cos = Math.cos(angleRad);

	const rotAxesAttrs = {
		"stroke-width": 2,
		"marker-end": `url(#${ARROWHEAD_IDS.rotated})`,
	};

	const rotXAxPosEndX = RANGES.x.mid + RANGES.x.posDist * cos;
	const rotXAxPosEndY = RANGES.y.mid + RANGES.x.posDist * sin;

	const rotYAxPosEndX = RANGES.x.mid - RANGES.y.posDist * sin;
	const rotYAxPosEndY = RANGES.y.mid + RANGES.y.posDist * cos;

	const rotAxesData = [
		{
			shape: "line",
			class: "rot-axis-x",
			attrs: {
				x1: xScale(RANGES.x.mid - RANGES.x.negDist * cos),
				y1: yScale(RANGES.y.mid - RANGES.x.negDist * sin),
				x2: xScale(rotXAxPosEndX),
				y2: yScale(rotXAxPosEndY),
				...rotAxesAttrs,
				stroke: highlightFGColor,
			},
		},
		{
			shape: "line",
			class: "rot-axis-y",
			attrs: {
				x1: xScale(RANGES.x.mid + RANGES.y.negDist * sin),
				y1: yScale(RANGES.y.mid - RANGES.y.negDist * cos),
				x2: xScale(rotYAxPosEndX),
				y2: yScale(rotYAxPosEndY),
				...rotAxesAttrs,
				stroke: highlightFGColor,
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

	const m = Math.tan(angleRad);
	const bbb = [rotXAxPosEndX, rotXAxPosEndY];
	const xxx = projection([x, y], bbb);
	console.log(
		bbb,
		getUnitVector(bbb),
		dotProd(getUnitVector(bbb), [x, y]),
		Math.sqrt(dotProd(xxx, xxx)),
		xxx,
	);
	const rotXAxX1 = (m * y + x) / (m * m + 1);
	const rotXAxY1 = y - (1 / m) * (rotXAxX1 - x);
	const rotYAxX1 = (x * m - y) / (m + 1 / m);
	const rotYAxY1 = y + m * (rotYAxX1 - x);

	const rotatedLinesAttrs = {
		stroke: highlightFGColor,
		"stroke-width": 2,
		"stroke-dasharray": "5 5",
	};
	const rotatedLinesData = [
		{
			shape: "line",
			class: "rotated-line-vertical",
			attrs: {
				x1: xScale(rotXAxX1),
				y1: yScale(rotXAxY1),
				x2: xScale(x),
				y2: yScale(y),
				...rotatedLinesAttrs,
			},
		},
		{
			shape: "line",
			class: "rotated-line-horizontal",
			attrs: {
				x1: xScale(rotYAxX1),
				y1: yScale(rotYAxY1),
				x2: xScale(x),
				y2: yScale(y),
				...rotatedLinesAttrs,
			},
		},
	];

	const axisLabelDist = 0.03 * RANGES.x.span;
	const axisLabelAttrs = {
		fill: highlightFGColor,
	};
	const xBeginAppearAngle = 0.12;
	const xFullyAppearAngle = 0.15;
	const rotatedAxisLabelsData = [
		{
			shape: "text",
			class: "rotated-x-axis-label",
			attrs: {
				x: xScale(rotXAxPosEndX + axisLabelDist * -sin),
				y: yScale(
					rotXAxPosEndY + axisLabelDist * cos + Math.max(0, angleRad / 2),
				),
				...axisLabelAttrs,
				opacity: Math.min(
					angleRad < 0
						? (angleRad + xBeginAppearAngle) / -xFullyAppearAngle
						: (angleRad - xBeginAppearAngle) / xFullyAppearAngle,
					1,
				),
				"text-anchor": "start",
			},
			text: "𝑥′",
		},
		{
			shape: "text",
			class: "rotated-y-axis-label",
			attrs: {
				x: xScale(rotYAxPosEndX + axisLabelDist * cos),
				y: yScale(rotYAxPosEndY + axisLabelDist * sin + angleRad * 0.6),
				...axisLabelAttrs,
				opacity: Math.min(
					angleRad < 0
						? (angleRad + xBeginAppearAngle) / -xFullyAppearAngle
						: (angleRad - xBeginAppearAngle) / xFullyAppearAngle,
					1,
				),
				"text-anchor": "start",
			},
			text: "𝑦′",
		},
	];

	const pointDatum = {
		shape: "circle",
		class: "marked-point",
		attrs: {
			cx: xScale(x),
			cy: yScale(y),
			r: 4,
			fill: "#ed0",
		},
	};

	// The way to determine the sign of the projection onto the rotated axes is by taking the inner product between the positive end of the rotated axis and the x,y point in the upright axis; the sign is positive when the two things point mostly in the same direction (inner product >= 0)
	const rotXAxDist = Math.sqrt(rotXAxX1 * rotXAxX1 + rotXAxY1 * rotXAxY1);
	const rotXAxSign = x * rotXAxPosEndX + y * rotXAxPosEndY >= 0 ? 1 : -1;

	const rotYAxDist = Math.sqrt(rotYAxX1 * rotYAxX1 + rotYAxY1 * rotYAxY1);
	const rotYAxSign = x * rotYAxPosEndX + y * rotYAxPosEndY >= 0 ? 1 : -1;

	return {
		data: [
			...rotAxesData,
			...uprightLinesData,
			...rotatedLinesData,
			...rotatedAxisLabelsData,
			pointDatum,
		],
		rotCoords: {
			xAxXCoord: rotXAxSign * rotXAxDist,
			yAxYCoord: rotYAxDist * rotYAxSign,
		},
	};
}

drawGraph();

function updateAngle({ x, y, angleIndex, userInput = true } = {}) {
	if (typeof angleIndex === "undefined") {
		angleIndex = sliders.angle.value;
	}
	angleIndex = +angleIndex;

	const angleRad = getAngleFromIndex(angleIndex);

	const { data, rotCoords } = getLinesData({ x, y, angleRad });
	applyGraphicalObjs(subcanvases, () => data, {
		selector: ".graph-obj",
		cssClass: "graph-obj",
	});

	textSpans.upright.x.textContent = (+sliders.x.value).toFixed(2);
	textSpans.upright.y.textContent = (+sliders.y.value).toFixed(2);
	textSpans.rotated.x.textContent = rotCoords.xAxXCoord.toFixed(2);
	textSpans.rotated.y.textContent = rotCoords.yAxYCoord.toFixed(2);

	if (!userInput || typeof angleRad !== "undefined") {
		textSpans.angle.textContent = (angleIndex === (ANGLES.n - 1) / 2
			? +0
			: angleRad
		).toFixed(2);
	}
}

updateAngle({ angleRad: 0, userInput: false });
