/* global STANDARD_COLORS defineArrowhead applyDatum */
const AXES = {
	x: { min: -2, max: 2 },
	y: { min: -2, max: 2 },
};

const MARGINS = { t: 20, b: 20, l: 20, r: 20 };
const AXES_EXTENT_PAST_DATA = 25;

const WIDTH = 400,
	HEIGHT = 400;

const svg = d3
	.select("#viz")
	.attr("width", 2 * WIDTH)
	.attr("height", HEIGHT);

const AXIS_ARROWHEAD_ID = "arrowhead_axis_";
const LINE_ARROWHEAD_ID = "arrowhead_line_";

const tickAlpha = "aa";
const lineColor = STANDARD_COLORS.secondary;
const tickAccent = `${lineColor}${tickAlpha}`;
const axisColor = "#eee";
const tickColor = `#eeeeee${tickAlpha}`;
const tickLength = 7;

// eslint-disable-next-line no-unused-vars
function fmtFloat(x, precision) {
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const defs = svg.append("svg:defs");
defineArrowhead(defs, {
	id: AXIS_ARROWHEAD_ID,
	length: 18,
	width: 15,
	color: "white",
	attrs: { "stroke-dasharray": 0 },
});
defineArrowhead(defs, {
	id: LINE_ARROWHEAD_ID,
	length: 18,
	width: 15,
	color: lineColor,
	attrs: { "stroke-dasharray": 0 },
});

(() => {
	const filter = defs
		.append("filter")
		.attr("x", 0)
		.attr("y", 0)
		.attr("width", 1)
		.attr("height", 1)
		.attr("id", "text-bg");
	filter.append("feFlood").attr("flood-color", "black");
	filter.append("feComposite").attr("in", "SourceGraphic").attr("operator", "atop");
})();

const graphs = svg
	.selectAll()
	.data([
		{ x: 0, left: true },
		{ x: WIDTH, left: false },
	])
	.join("g")
	.attr("transform", d => `translate(${d.x},0)`);

const xScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([
		MARGINS.l + AXES_EXTENT_PAST_DATA,
		WIDTH - MARGINS.r - AXES_EXTENT_PAST_DATA,
	]);
const yScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([
		HEIGHT - MARGINS.b - AXES_EXTENT_PAST_DATA,
		MARGINS.t + AXES_EXTENT_PAST_DATA,
	]);

const axisXMin = xScale(AXES.x.min) - AXES_EXTENT_PAST_DATA;
const axisXMax = xScale(AXES.x.max) + AXES_EXTENT_PAST_DATA;
const axisYMin = yScale(AXES.y.min) + AXES_EXTENT_PAST_DATA;
const axisYMax = yScale(AXES.y.max) - AXES_EXTENT_PAST_DATA;
const xTicks = d3.ticks(axisXMin + 5, axisXMax - 15, 20);
const yTicks = d3.ticks(axisYMin - 5, axisYMax + 15, 20);
function drawAxes() {
	graphs
		.selectAll()
		.data(d => xTicks.map(x => ({ x, left: d.left })))
		.join("line")
		.attr("x1", d => d.x)
		.attr("x2", d => d.x)
		.attr("y1", yScale(0) - tickLength / 2)
		.attr("y2", yScale(0) + tickLength / 2)
		.style("stroke", d => (d.left ? tickColor : tickAccent))
		.style("stroke-width", 1);

	graphs
		.selectAll()
		.data(d => yTicks.map(y => ({ y, left: d.left })))
		.join("line")
		.attr("x1", xScale(0) - tickLength / 2)
		.attr("x2", xScale(0) + tickLength / 2)
		.attr("y1", d => d.y)
		.attr("y2", d => d.y)
		.style("stroke", d => (d.left ? tickColor : tickAccent))
		.style("stroke-width", 1);

	graphs
		.append("line")
		.attr("x1", axisXMin)
		.attr("y1", yScale(0))
		.attr("x2", axisXMax)
		.attr("y2", yScale(0))
		.attr("stroke", d => (d.left ? axisColor : lineColor))
		.attr("stroke-width", 2)
		.attr("marker-end", d =>
			d.left ? `url(#${AXIS_ARROWHEAD_ID})` : `url(#${LINE_ARROWHEAD_ID}`,
		);
	graphs
		.append("line")
		.attr("x1", xScale(0))
		.attr("y1", axisYMin)
		.attr("x2", xScale(0))
		.attr("y2", axisYMax)
		.attr("stroke", d => (d.left ? axisColor : lineColor))
		.attr("stroke-width", 2)
		.attr("marker-end", d =>
			d.left ? `url(#${AXIS_ARROWHEAD_ID})` : `url(#${LINE_ARROWHEAD_ID})`,
		);

	graphs
		.append("text")
		.text(d => (d.left ? "𝑥" : "𝑥′"))
		.attr("x", xScale(AXES.x.max) + AXES_EXTENT_PAST_DATA)
		.attr("y", yScale(0) - 15)
		.attr("fill", "white")
		.attr("text-anchor", "right")
		.attr("dominant-baseline", "bottom");

	graphs
		.append("text")
		.text(d => (d.left ? "𝑡" : "𝑡′"))
		.attr("x", xScale(0) + 15)
		.attr("y", yScale(AXES.y.max) - AXES_EXTENT_PAST_DATA)
		.attr("fill", "white")
		.attr("text-anchor", "left")
		.attr("dominant-baseline", "middle");
}

drawAxes();

const sliders = {
	speed: document.getElementById("input-speed"),
};

const textSpans = {
	speed: document.getElementById("text-speed"),
};

const lineClass = "lines_";
// eslint-disable-next-line no-unused-vars
function update({ speed }) {
	if (typeof speed === "undefined") {
		speed = sliders.speed.value;
	}
	speed = +speed;

	function getLines(d) {
		const lineAttrs = {
			stroke: d.left ? lineColor : axisColor,
			"marker-end": `url(#${d.left ? LINE_ARROWHEAD_ID : AXIS_ARROWHEAD_ID})`,
			"stroke-width": 2,
		};
		const slope = d.left ? speed : -speed;
		const lines = { x: {}, t: {} };

		const thetaX = Math.atan(slope);
		lines.x.x1 = AXES.x.min * Math.cos(thetaX);
		lines.x.x2 = AXES.x.max * Math.cos(thetaX);

		// if (!d.left) {
		// 	[lines.x.x1, lines.x.x2] = [lines.x.x2, lines.x.x1];
		// }

		[lines.x.y1, lines.x.y2] = [lines.x.x1, lines.x.x2].map(x => slope * x);
		const lineX = {
			shape: "line",
			attrs: {
				x1: xScale(lines.x.x1),
				x2: xScale(lines.x.x2),
				y1: yScale(lines.x.y1),
				y2: yScale(lines.x.y2),
				...lineAttrs,
			},
		};

		const thetaY = Math.atan(1 / speed);
		lines.t.y1 = AXES.y.min * Math.sin(thetaY);
		lines.t.y2 = AXES.y.max * Math.sin(thetaY);
		[lines.t.x1, lines.t.x2] = [lines.t.y1, lines.t.y2].map(y => slope * y);
		const lineT = {
			shape: "line",
			attrs: {
				x1: xScale(lines.t.x1),
				x2: xScale(lines.t.x2),
				y1: yScale(lines.t.y1),
				y2: yScale(lines.t.y2),
				...lineAttrs,
			},
		};

		// const tickStroke = tickAccent;

		// const lineXTicks = xTicks
		// 	.filter(x => {
		// 		x = xScale.invert(x);
		// 		return AXES.x.min < x && x < AXES.x.max;
		// 	})
		// 	.map(dist => {
		// 		const x = xScale.invert(dist) * Math.cos(thetaX);
		// 		const y = slope * x;
		// 		const dx = (tickLength / 2) * Math.sin(thetaX);
		// 		const dy = (tickLength / 2) * Math.cos(thetaX);

		// 		return {
		// 			shape: "line",
		// 			attrs: {
		// 				x1: xScale(x) - dx,
		// 				y1: yScale(y) - dy,
		// 				x2: xScale(x) + dx,
		// 				y2: yScale(y) + dy,
		// 				stroke: tickStroke,
		// 			},
		// 		};
		// 	});
		// const lineYTicks = yTicks
		// 	.filter(y => {
		// 		y = yScale.invert(y);
		// 		return AXES.y.min < y && y < AXES.y.max;
		// 	})
		// 	.map(dist => {
		// 		const y = yScale.invert(dist) * Math.sin(thetaY);
		// 		const x = slope * y;
		// 		const dx = (tickLength / 2) * Math.sin(thetaY);
		// 		const dy = (tickLength / 2) * Math.cos(thetaY) * (d.left ? 1 : -1);

		// 		return {
		// 			shape: "line",
		// 			attrs: {
		// 				x1: xScale(x) - dx,
		// 				y1: yScale(y) - dy,
		// 				x2: xScale(x) + dx,
		// 				y2: yScale(y) + dy,
		// 				stroke: tickStroke,
		// 			},
		// 		};
		// 	});

		const textAttrs = {
			fill: "white",
			filter: `url(#text-bg)`,
		};
		const xLabel = {
			shape: "text",
			text: d.left ? "𝑥′" : "𝑥",
			attrs: {
				x: xScale(lines.x.x2) - 10,
				y: yScale(lines.x.y2) + 29,
				...textAttrs,
			},
		};
		const tLabel = {
			shape: "text",
			text: d.left ? "𝑡′" : "𝑡",
			attrs: {
				x: xScale(lines.t.x2) + (d.left ? -15 : 25),
				y: yScale(lines.t.y2) + (d.left ? 10 : 4),
				"text-anchor": "end",
				...textAttrs,
			},
		};

		return [lineX, lineT, xLabel, tLabel]; //...lineXTicks, ...lineYTicks
	}
	const lines = graphs
		.selectAll(`.${lineClass}`)
		.data(getLines)
		.join(enter => enter.append(d => d3.create(`svg:${d.shape}`).node()))
		.classed(lineClass, true);

	lines.each(function (d) {
		applyDatum.call(this, d);
	});

	textSpans.speed.innerHTML = fmtFloat(speed, 2);
}

update({});
