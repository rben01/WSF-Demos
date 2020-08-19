/* global defineArrowhead applyGraphicalObjs STANDARD_COLORS */
"use strict";

const RANGES = {
	x: { min: -11, max: 11 },
	y: { min: 0, max: 1 },
};

Object.values(RANGES).forEach(range => {
	range.mid = (range.max + range.min) / 2;
	range.span = range.max - range.min;
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

const sliders = {
	t: document.getElementById("input-t"),
};
let currentClock = 0;

const highlightFGColor = "#5df";

const canvases = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const ARROWHEAD_ID = "marker-arrowhead";
const defs = canvases.append("defs");
defineArrowhead(defs, {
	id: ARROWHEAD_ID,
	length: 20,
	width: 18,
	color: highlightFGColor,
});

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

// x has units of light-minutes
function getTimeDeltaMinutes({ x, fracOfC }) {
	return x * fracOfC;
}

function getGraphData() {
	const y0s = yScale(0);

	function getBoxesAndTextData() {
		const lineColor = "white";
		const fillColor = d3.interpolateRgb("#5c4e29", "black")(0.7);
		const boxHeightAboveGround = 0.3;

		const boxData = [];
		const lineData = [];
		const textData = [];

		const boxXLocs = xScale.ticks(RANGES.x.span / 2);
		const boxWidth = 1.8;
		const boxHeight = 0.25;
		boxXLocs.forEach((x, index) => {
			boxData.push({
				shape: "rect",
				class: "box",
				index,
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
				xs,
				index,
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
				class: "box-text",
				text: "00:00",
				x: x,
				index,
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
					y: yScale(-AXIS_MARGINS.bottom / 2) + 4,
					fill: d3.interpolateRgb(axisColor, "white")(0.3),
					"font-size": 17,
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
	secondsAfterReferenceMinute = Math.floor(secondsAfterReferenceMinute);
	const minutesAfterReferenceMinute = Math.floor(secondsAfterReferenceMinute / 60);

	const second = secondsAfterReferenceMinute - minutesAfterReferenceMinute * 60;
	const minute = referenceMinute + minutesAfterReferenceMinute;

	const minuteStr = minute.toFixed(0).padStart(2, "0");
	const secondStr = second.toFixed(0).padStart(2, "0");

	return `${minuteStr}:${secondStr}`;
}

const clockTimes = [];

function updateArrow(clock, animate, t) {
	if (animate === undefined) {
		animate = true;
	}

	const boxLines = subcanvases.selectAll(".box-line");
	const thisClockBoxLine = boxLines.filter((_, i) => i === clock);
	const xs = thisClockBoxLine.datum().xs;

	const boxes = subcanvases.selectAll(".box");
	const thisClockBox = boxes.filter((_, i) => i === clock);
	const ys = thisClockBox.datum().attrs.y;

	applyGraphicalObjs(
		subcanvases,
		[
			{
				shape: "line",
				attrs: {
					x1: xs,
					x2: xs,
					y1: ys - 80,
					y2: ys - 20,
					stroke: STANDARD_COLORS.highlighted,
					"stroke-width": 4,
					"marker-end": `url(#${ARROWHEAD_ID})`,
					opacity: 1,
				},
			},
		],
		{
			selector: ".arrow-indicator",
			cssClass: "arrow-indicator",
			transition: animate
				? d3
						.transition()
						.duration(130)
						.on("end", () => {
							sliders.t.value = t;
						})
				: undefined,
		},
	);
}

function updateTime(clockIndex, t) {
	subcanvases
		.selectAll(".box-text")
		.filter((_, i) => i === clockIndex)
		.text(timeToStr(0, t));
}

const buttons = {
	playPause: document.getElementById("play-pause"),
	reset: document.getElementById("reset"),
};

const timers = {
	timeouts: [],
	intervals: [],
};

const clockSelector = d3.select(document.getElementById("clock-selector"));
// eslint-disable-next-line no-unused-vars
function beginFlash() {
	subcanvases
		.selectAll(".arrow-indicator")
		.transition()
		.duration(150)
		.attr("opacity", 0);

	buttons.playPause.disabled = true;
	buttons.reset.disabled = false;

	clockSelector.selectAll(".radio").style("opacity", 0.4);
	clockSelector.selectAll(".radio-radio").property("disabled", true);
	d3.select(sliders.t).property("disabled", true).style("opacity", 0.4);

	const texts = subcanvases.selectAll(".box-text"); // Expected to have an odd number of texts
	texts.style("opacity", 0.4);

	const durationMS = texts.size() * 1000;
	subcanvases
		.selectAll(".light-flash")
		.data(["left", "right"])
		.join("circle")
		.classed("light-flash", true)
		.attr("cx", xScale(RANGES.x.mid))
		.attr("cy", yScale(0))
		.attr("r", 8)
		.attr("fill", STANDARD_COLORS.secondary)
		.attr("opacity", 0.8)
		.transition("x")
		.duration(durationMS)
		.ease(d3.easeLinear)
		.attr("cx", d =>
			d === "left" ? xScale(RANGES.x.min + 1) : xScale(RANGES.x.max - 1),
		)
		.transition("o")
		.duration(durationMS / 10)
		.ease(d3.easeLinear)
		.attr("cx", d => (d === "left" ? xScale(RANGES.x.min) : xScale(RANGES.x.max)))
		.attr("opacity", 0);

	const middleIndex = (texts.size() - 1) / 2;
	const tickIntervalMS = durationMS / (texts.size() - 1);
	texts.each(function (_, i) {
		const text = d3.select(this);
		const distance = Math.abs(i - middleIndex);
		const delay = distance * tickIntervalMS * 2;
		let timer;

		timers.timeouts.push(
			setTimeout(() => {
				text.style("opacity", 1);
				let dt = 1;
				timer = setInterval(() => {
					text.text(timeToStr(0, clockTimes[i] + dt));
					dt += 1;
				}, tickIntervalMS);
				timers.intervals.push(timer);
			}, delay),
		);
	});
}

// eslint-disable-next-line no-unused-vars
function __reset() {
	for (const timer of timers.intervals) {
		clearInterval(timer);
	}
	for (const timer of timers.timeouts) {
		clearTimeout(timer);
	}

	subcanvases
		.selectAll(".arrow-indicator")
		.transition()
		.duration(100)
		.attr("opacity", 1);

	buttons.reset.disabled = true;

	clockSelector.selectAll(".radio").style("opacity", 1);
	d3.selectAll(".radio-radio").property("disabled", false);
	d3.select(sliders.t).property("disabled", false).style("opacity", 1);

	subcanvases
		.selectAll(".box-text")
		.text((_, i) => timeToStr(0, clockTimes[i]))
		.style("opacity", 1);

	const flashes = subcanvases.selectAll(".light-flash");
	flashes
		.transition("o")
		.duration(300)
		.attr("opacity", 0)
		.on("end", function (_, i) {
			d3.select(this)
				.transition("x")
				.duration(0)
				.attr("cx", xScale(RANGES.x.mid))
				.end()
				.then(() => {
					if (i === 0) {
						buttons.playPause.disabled = false;
					}
				});
		});

	// t.end().then(() => {
	// });
}

function updateClocks({ clockIndex, t } = {}) {
	const clockProvided = clockIndex !== undefined;
	if (!clockProvided) {
		clockIndex = currentClock;
	} else {
		currentClock = +clockIndex;
	}
	clockIndex = +clockIndex;

	const tProvided = t !== undefined;
	if (!tProvided) {
		t = clockTimes[clockIndex];
	} else {
		clockTimes[clockIndex] = +t;
	}
	t = +t;

	updateArrow(clockIndex, clockProvided, t);

	if (tProvided) {
		updateTime(clockIndex, t);
	}
}

// Add radio buttons for clock selection
(() => {
	currentClock = 0;

	for (let i = 0; i < 11; ++i) {
		const label = clockSelector.append("label").classed("radio", true);

		const radio = label
			.append("input")
			.classed("radio-radio", true)
			.attr("type", "radio")
			.attr("id", `clock-radio-${i}`)
			.attr("name", "clock-inputs")
			.attr("value", i)
			.on("change", () => updateClocks({ clockIndex: i }));
		label
			.append("span")
			.classed("radio-label", true)
			.text(i + 1);

		if (i === 0) {
			label.style("padding-left", "5px");
			radio.property("checked", true);
		}

		clockTimes[i] = 0;
	}
})();

subcanvases.each(function (d) {
	const subcanvas = d3.select(this);
	applyGraphicalObjs(subcanvas, () => getGraphData(d));
});

updateClocks({ t: 0 });
