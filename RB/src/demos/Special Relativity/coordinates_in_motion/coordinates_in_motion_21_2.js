/* global C lorentzFactor applyDatum applyGraphicalObjs */
"use strict";

const RANGES = {
	x: { min: -11, max: 11 },
	y: { min: 0, max: 1 },
};

Object.values(RANGES).forEach(range => {
	range.mid = (range.max + range.min) / 2;
	range.span = range.max - range.min;
});

const speedSlider = document.getElementById("input-speed");

const AXIS_MARGINS = {
	top: 0.05,
	bottom: 0.1,
	left: 0.05,
	right: 0.05,
};
const CANVAS_HEIGHT = 200;
const CANVAS_WIDTH = 800;
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const textSpans = {
	frameA: document.getElementById("text-frame-a"),
	frameB: document.getElementById("text-frame-b"),
};

const highlightFGColor = "#5df";

const canvases = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const ARROWHEAD_ID = "marker-arrowhead";

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
	const defs = canvases.append("svg:defs");

	defs.append("svg:marker")
		.attr("id", ARROWHEAD_ID)
		.each(function () {
			applyDatum.call(this, markerAttrs);
		})
		.append("svg:path")
		.each(function () {
			applyDatum.call(this, pathAttrs);
		})
		.attr("stroke", highlightFGColor)
		.attr("fill", highlightFGColor);
})();

const subcanvases = canvases
	.selectAll("g")
	.data((_, index) => [
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
			isTopFrame: index === 0,
		},
	])
	.join("g")
	.attr("transform", d => `translate(0, ${d.originY})`)
	.classed("subcanvas", true);

const xScale = d3
	.scaleLinear()
	.domain([RANGES.x.min, RANGES.x.max])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);
const yScale = d3
	.scaleLinear()
	.domain([RANGES.y.min, RANGES.y.max])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);
const widthScale = d3
	.scaleLinear()
	.domain([0, RANGES.x.span])
	.range([0, AX_BOUNDS.xMax - AX_BOUNDS.xMin]);
const heightScale = d3
	.scaleLinear()
	.domain([0, RANGES.y.span])
	.range([0, AX_BOUNDS.yMin - AX_BOUNDS.yMax]);

function getTimeDelta({ dx, fracOfC }) {
	return (lorentzFactor({ fracOfC }) * dx * fracOfC) / 10;
}

function getTextClassName(frameName) {
	return `text-frame-${frameName}`;
}

function getGraphData(d) {
	const y0s = yScale(0);

	function getBoxesAndTextData() {
		const lineColor = "white";
		const fillColor = "brown";
		const boxHeightAboveGround = 0.2;

		const boxData = [];
		const lineData = [];
		const textData = [];

		const boxXLocs = xScale.ticks(RANGES.x.span / 2);
		const boxWidth = 1.8;
		const boxHeight = 0.2;
		boxXLocs.forEach(x => {
			boxData.push({
				shape: "rect",
				class: "box",
				attrs: {
					x: xScale(x - boxWidth / 2),
					y: yScale(boxHeightAboveGround + boxHeight),
					width: widthScale(boxWidth),
					height: heightScale(boxHeight),
					stroke: lineColor,
					"stroke-width": 2,
					fill: fillColor,
				},
			});

			const xs = xScale(x);

			lineData.push({
				shape: "line",
				class: "box-line",
				attrs: {
					x1: xs,
					y1: y0s,
					x2: xs,
					y2: yScale(boxHeightAboveGround),
					stroke: lineColor,
					"stroke-width": 2,
				},
			});

			const frameName = d.isTopFrame ? "a" : "b";
			textData.push({
				shape: "text",
				class: getTextClassName(frameName),
				text: "10:00",
				x: x,
				attrs: {
					x: xs,
					y: yScale(boxHeightAboveGround + boxHeight / 2),
					"font-size": 18,
					fill: "#5f5",
					"text-anchor": "middle",
					"alignment-baseline": "middle",
				},
			});
		});

		return [...boxData, ...lineData, ...textData];
	}

	function getAxesData() {
		const axisColor = "#999";

		const [minX, maxX] = xScale.domain().map(xScale);
		const axisDatum = {
			class: "x-axis",
			shape: "line",
			attrs: {
				x1: minX,
				y1: y0s,
				x2: maxX,
				y2: y0s,
				stroke: axisColor,
				"stroke-width": 1,
			},
		};

		const ticksData = xScale.ticks(RANGES.x.span).map(x => {
			const xs = xScale(x);
			return {
				class: "x-axis-tick",
				shape: "line",
				attrs: {
					x1: xs,
					y1: y0s,
					x2: xs,
					y2: yScale(0.03),
					stroke: axisColor,
					"stroke-width": 1,
				},
			};
		});

		const labelsData = xScale.ticks(5).map(x => {
			const xs = xScale(x);
			return {
				class: "x-axis-label",
				shape: "text",
				text: `${x}`,
				attrs: {
					x: xs,
					y: yScale(-AXIS_MARGINS.bottom / 2),
					fill: axisColor,
					"font-size": 12,
					"text-anchor": "middle",
					"alignment-baseline": "middle",
				},
			};
		});

		return [axisDatum, ...ticksData, ...labelsData];
	}

	return [...getBoxesAndTextData(), ...getAxesData()];
}

function timeToStr(referenceMinute, secondsAfterReferenceMinute) {
	secondsAfterReferenceMinute = Math.round(secondsAfterReferenceMinute);
	const minutesAfterReferenceMinute = Math.floor(secondsAfterReferenceMinute / 60);

	const second = secondsAfterReferenceMinute - minutesAfterReferenceMinute * 60;
	const minute = referenceMinute + minutesAfterReferenceMinute;
	console.log(minute, second, secondsAfterReferenceMinute);

	const minuteStr = minute.toFixed(0).padStart(2, "0");
	const secondStr = second.toFixed(0).padStart(2, "0");

	return `${minuteStr}:${secondStr}`;
}

function updateClocks({ fracOfC, topFrameIsStationary }) {
	const stationaryFrameName = getTextClassName(topFrameIsStationary ? "a" : "b");
	const movingFrameName = getTextClassName(topFrameIsStationary ? "b" : "a");

	const stationaryText = d3.selectAll(`.${stationaryFrameName}`);
	const movingText = d3.selectAll(`.${movingFrameName}`);

	stationaryText.each(function () {
		const text = d3.select(this);
		text.text(timeToStr(10, 0));
	});

	movingText.each(function (d) {
		const x = d.x;
		const dtSeconds = getTimeDelta({ dx: x, fracOfC: fracOfC });

		const text = d3.select(this);
		text.text(timeToStr(10, dtSeconds));
	});
}

subcanvases.each(function (d) {
	const subcanvas = d3.select(this);
	applyGraphicalObjs(subcanvas, () => getGraphData(d));
});

updateClocks({ fracOfC: -0.9999, topFrameIsStationary: true });
