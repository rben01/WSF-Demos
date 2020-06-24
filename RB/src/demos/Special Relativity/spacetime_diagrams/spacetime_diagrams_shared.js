/* global HL_COLOR defineArrowhead */

const AXES = {
	x: { min: -1, max: 1 },
	y: { min: -1, max: 1 },
};

const MARGINS = { t: 10, b: 10, l: 10, r: 10 };

const WIDTH = 400,
	HEIGHT = 400;

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const AXIS_ARROWHEAD_ID = "arrowhead_axis_";
const LINE_ARROWHEAD_ID = "arrowhead_line_";

const lineColor = HL_COLOR;

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

const axisColor = "#eee";
const tickColor = "#999";
const tickLength = 5;

const xScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([MARGINS.l, WIDTH - MARGINS.r]);
const yScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT - MARGINS.b, MARGINS.t]);

function drawGraph() {
	svg.append("rect")
		.attr("x", 0)
		.attr("y", 0)
		.attr("width", WIDTH)
		.attr("height", HEIGHT)
		.attr("fill", "black");

	const ticks = d3.range(AXES.x.min * 0.8, AXES.x.max * 0.8 + 0.001, 0.4);
	svg.selectAll()
		.data(ticks)
		.join("line")
		.attr("x1", xScale)
		.attr("x2", xScale)
		.attr("y1", yScale(0) - tickLength / 2)
		.attr("y2", yScale(0) + tickLength / 2)
		.style("stroke", tickColor)
		.style("stroke-width", 1);

	svg.selectAll()
		.data(ticks)
		.join("line")
		.attr("x1", xScale(0) - tickLength / 2)
		.attr("x2", xScale(0) + tickLength / 2)
		.attr("y1", yScale)
		.attr("y2", yScale)
		.style("stroke", tickColor)
		.style("stroke-width", 1);

	svg.append("line")
		.attr("x1", xScale(AXES.x.min))
		.attr("y1", yScale(0))
		.attr("x2", xScale(AXES.x.max))
		.attr("y2", yScale(0))
		.attr("stroke", axisColor)
		.attr("stroke-width", 1)
		.attr("marker-end", `url(#${AXIS_ARROWHEAD_ID})`);
	svg.append("line")
		.attr("x1", xScale(0))
		.attr("y1", yScale(AXES.y.min))
		.attr("x2", xScale(0))
		.attr("y2", yScale(AXES.y.max))
		.attr("stroke", axisColor)
		.attr("stroke-width", 1)
		.attr("marker-end", `url(#${AXIS_ARROWHEAD_ID})`);

	svg.append("text")
		.text("𝑥")
		.attr("x", xScale(AXES.x.max))
		.attr("y", yScale(0) - 15)
		.attr("fill", "white")
		.attr("text-anchor", "right")
		.attr("dominant-baseline", "bottom");

	svg.append("text")
		.text("𝑡")
		.attr("x", xScale(0) + 15)
		.attr("y", yScale(AXES.y.max))
		.attr("fill", "white")
		.attr("text-anchor", "left")
		.attr("dominant-baseline", "middle");
}

drawGraph();

let showSpacialSlices = false;
const lineGroupsClass = "spatial-slice-group";

const ANIM_STATES = { before: 0, during: 1, after: 2 };
let state = ANIM_STATES.before;

// eslint-disable-next-line no-unused-vars
function _toggleSlices(
	svg,
	{
		beforeBeginCallback,
		beforeCancelCallback,
		afterFinishCallback,
		afterCancelCallback,
	},
) {
	const call = callback => {
		if (typeof callback !== "undefined") {
			callback();
		}
	};

	if (showSpacialSlices && state === ANIM_STATES.during) {
		showSpacialSlices = false;
	} else {
		showSpacialSlices = true;
	}
	if (state !== ANIM_STATES.during) {
		call(beforeBeginCallback);
		let t = svg.selectAll(`.${lineGroupsClass}`).filter(d => d.index !== 0);
		if (state === ANIM_STATES.after) {
			t = t.transition().duration(200).style("opacity", 0);
		}
		state = ANIM_STATES.during;
		t.transition()
			.delay((d, i) => i * 400)
			.duration(1000)
			.style("opacity", 1)
			.transition()
			.on("end", () => {
				state = ANIM_STATES.after;
				call(afterFinishCallback);
			});
	} else {
		call(beforeCancelCallback);
		svg.selectAll(`.${lineGroupsClass}`)
			.filter(d => d.index !== 0)
			.transition()
			.duration(200)
			.style("opacity", 0)
			.transition()
			.on("end", () => {
				state = ANIM_STATES.before;
				call(afterCancelCallback);
			});
	}
}
