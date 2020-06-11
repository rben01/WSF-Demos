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

const frameButtons = {};
const speedPlaceholders = {};
const speedSpans = {};
const movingTextSpans = {};

["a", "b"].forEach(frameLetter => {
	frameButtons[frameLetter] = document.getElementById(
		`input-ref-frame-${frameLetter}`,
	);
	speedPlaceholders[frameLetter] = document.getElementsByClassName(
		`frame-${frameLetter}-speed-placeholder`,
	);
	speedSpans[frameLetter] = document.getElementById(`frame-${frameLetter}-speed`);
	movingTextSpans[frameLetter] = document.getElementById(
		`frame-${frameLetter}-moving-text`,
	);
});

const AXIS_MARGINS = {
	top: 0.05,
	bottom: 0.15,
	left: 0.05,
	right: 0.05,
};
const CANVAS_HEIGHT = 150;
const CANVAS_WIDTH = 800;
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
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
			refY: 2.5,
			markerUnits: "strokeWidth",
			markerWidth: 7,
			markerHeight: 5,
			orient: "auto",
		},
	};
	const pathAttrs = {
		attrs: {
			d: "M 1 1 L 5 2.5 L 1 4 L 2 2.5 z",
			"stroke-linejoin": "miter",
			stroke: highlightFGColor,
			fill: highlightFGColor,
		},
	};
	const defs = canvases.append("svg:defs");

	defs.append("svg:marker")
		.attr("id", ARROWHEAD_ID)
		.each(function () {
			applyDatum.call(this, markerAttrs);
		})
		.append("svg:path")
		.each(function () {
			applyDatum.call(this, pathAttrs);
		});
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

function getTimeDelta({ x, fracOfC }) {
	return lorentzFactor({ fracOfC }) * x * fracOfC;
}

function getTextClassName(frameName) {
	return `text-frame-${frameName}`;
}

function getArrowClassName(frameName) {
	return `arrow-frame-${frameName}`;
}

function getGraphData(d) {
	const y0s = yScale(0);
	const frameName = d.isTopFrame ? "a" : "b";

	function getBoxesAndTextData() {
		const lineColor = "white";
		const fillColor = "#5c4e29";
		const boxHeightAboveGround = 0.3;

		const boxData = [];
		const lineData = [];
		const textData = [];

		const boxXLocs = xScale.ticks(RANGES.x.span / 2);
		const boxWidth = 1.8;
		const boxHeight = 0.25;
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

	function getArrowDatum() {
		return {
			shape: "line",
			class: getArrowClassName(frameName),
			attrs: {
				x1: xScale((d.isTopFrame ? 1 : -1) * 6),
				y1: yScale(0.75),
				x2: xScale(2),
				y2: yScale(0.75),
				opacity: 0,
				stroke: "#5df",
				"stroke-width": 5,
				"marker-end": `url(#${ARROWHEAD_ID})`,
			},
		};
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

	return [...getBoxesAndTextData(), getArrowDatum(), ...getAxesData()];
}

function timeToStr(referenceMinute, secondsAfterReferenceMinute) {
	secondsAfterReferenceMinute = Math.round(secondsAfterReferenceMinute);
	const minutesAfterReferenceMinute = Math.floor(secondsAfterReferenceMinute / 60);

	const second = secondsAfterReferenceMinute - minutesAfterReferenceMinute * 60;
	const minute = referenceMinute + minutesAfterReferenceMinute;

	const minuteStr = minute.toFixed(0).padStart(2, "0");
	const secondStr = second.toFixed(0).padStart(2, "0");

	return `${minuteStr}:${secondStr}`;
}

function updateClocks({ fracOfC, referenceFrame } = {}) {
	if (typeof fracOfC === "undefined") {
		fracOfC = speedSlider.value;
	}
	fracOfC = +fracOfC;

	if (typeof referenceFrame === "undefined") {
		referenceFrame = frameButtons.a.checked ? "a" : "b";
	}

	const frameAIsStationary = referenceFrame === "a";

	const stationaryMovingFrameLetters = frameAIsStationary ? ["a", "b"] : ["b", "a"];
	const stationaryMovingArrowClasses = stationaryMovingFrameLetters.map(
		getArrowClassName,
	);
	const stationaryMovingTextClasses = stationaryMovingFrameLetters.map(
		getTextClassName,
	);

	const [stationaryArrow, movingArrow] = stationaryMovingArrowClasses.map(className =>
		d3.selectAll(`.${className}`),
	);
	const [stationaryText, movingText] = stationaryMovingTextClasses.map(className =>
		d3.selectAll(`.${className}`),
	);

	stationaryArrow.attr("opacity", 0);

	const movingArrowAbsX2 = 6.5 + fracOfC * 4;
	movingArrow
		.attr("x2", xScale((frameAIsStationary ? -1 : 1) * movingArrowAbsX2))
		.attr("opacity", 1);

	stationaryText.each(function () {
		const text = d3.select(this);
		text.text(timeToStr(10, 0));
	});

	const speedSign = frameAIsStationary ? 1 : -1;
	movingText.each(function (d) {
		const x = d.x;
		const dtSeconds = getTimeDelta({ x: x, fracOfC: speedSign * fracOfC });

		const text = d3.select(this);
		text.text(timeToStr(10, dtSeconds));
	});

	const speedStr = (-speedSign * fracOfC).toFixed(2);
	const speedPlaceholdersToUpdate = frameAIsStationary
		? speedPlaceholders.b
		: speedPlaceholders.a;

	for (let i = 0; i < speedPlaceholdersToUpdate.length; ++i) {
		const placeholder = speedPlaceholdersToUpdate[i];
		placeholder.textContent = speedStr;
	}

	if (frameAIsStationary) {
		speedSpans.a.style.visibility = "hidden";
		speedSpans.b.style.visibility = "visible";

		movingTextSpans.a.textContent = "At Rest";
		movingTextSpans.b.textContent = "Moving";
	} else {
		speedSpans.a.style.visibility = "visible";
		speedSpans.b.style.visibility = "hidden";

		movingTextSpans.a.textContent = "Moving";
		movingTextSpans.b.textContent = "At Rest";
	}
}

subcanvases.each(function (d) {
	const subcanvas = d3.select(this);
	applyGraphicalObjs(subcanvas, () => getGraphData(d));
});

updateClocks();
