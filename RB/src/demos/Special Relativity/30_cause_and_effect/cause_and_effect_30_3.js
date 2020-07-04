/* global defineArrowhead STANDARD_COLORS */

const AXES = {
	x: { min: -1, max: 1, mid: 0, span: 2 },
	y: { min: -1, max: 1, mid: 0, span: 2 },
};

const MARGINS = { t: 20, b: 20, l: 20, r: 20 };

const ARROWHEAD_ID = "arrowhead_";

const WIDTH = 400,
	HEIGHT = 400;
const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

const sliders = {
	x: document.getElementById("input-x"),
	t: document.getElementById("input-t"),
};

const defs = svg.append("svg:defs");
defineArrowhead(defs, { id: ARROWHEAD_ID, length: 14, width: 12, color: "white" });

const canvasXScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([0, WIDTH]);
const canvasYScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT, 0]);

const graphXScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([MARGINS.l, WIDTH - MARGINS.r]);
const graphYScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT - MARGINS.b, MARGINS.t]);

const line = d3
	.line()
	.x(p => canvasXScale(p[0]))
	.y(p => canvasYScale(p[1]));

const causalID = "causally-connected-id";
const disconnectedID = "casaully-disconnected-id";
const lightConeClass = "light-cone-class";

const causalColor = STANDARD_COLORS.secondary;
const disconnectedColor = STANDARD_COLORS.quaternary;

document.getElementById("option-causal").style.color = causalColor;
document.getElementById("option-disconnected").style.color = disconnectedColor;

const opacity = 0.75;
function getBowtie(cx, cy, horizontal) {
	const xSpan = AXES.x.span;
	const ySpan = AXES.y.span;
	const center = [cx, cy];
	const topLeft = [cx - xSpan, cy + ySpan];
	const topRight = [cx + xSpan, cy + ySpan];
	const bottomLeft = [cx - xSpan, cy - ySpan];
	const bottomRight = [cx + xSpan, cy - ySpan];
	if (horizontal) {
		return [center, topLeft, bottomLeft, topRight, bottomRight, center];
	} else {
		return [center, topLeft, topRight, bottomLeft, bottomRight, center];
	}
}

const lightConeObjsClass = "cone-obj";

function drawGraph() {
	const axisColor = "white";
	const sw = 2;
	svg.append("line")
		.attr("x1", graphXScale(AXES.x.min))
		.attr("x2", graphXScale(AXES.x.max))
		.attr("y1", graphYScale(0))
		.attr("y2", graphYScale(0))
		.attr("stroke", axisColor)
		.attr("stroke-width", sw)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);
	svg.append("line")
		.attr("x1", graphXScale(0))
		.attr("x2", graphXScale(0))
		.attr("y1", graphYScale(AXES.y.min))
		.attr("y2", graphYScale(AXES.y.max))
		.attr("stroke", axisColor)
		.attr("stroke-width", sw)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);

	svg.append("text")
		.text("𝑥")
		.attr("x", graphXScale(AXES.x.max) - 5)
		.attr("y", graphYScale(0) - 12)
		.attr("fill", axisColor)
		.attr("text-anchor", "middle");
	svg.append("text")
		.text("𝑡")
		.attr("x", graphXScale(0) + 12)
		.attr("y", graphYScale(AXES.y.max) + 5)
		.attr("fill", axisColor)
		.attr("text-anchor", "begin");

	svg.append("path")
		.attr("d", line(getBowtie(AXES.x.mid, AXES.y.mid, false)))
		.classed(lightConeObjsClass, true)
		.attr("id", causalID)
		.attr("fill", causalColor)
		.attr("opacity", opacity);
	svg.append("path")
		.attr("d", line(getBowtie(AXES.x.mid, AXES.y.mid, true)))
		.classed(lightConeObjsClass, true)
		.attr("id", disconnectedID)
		.attr("fill", disconnectedColor)
		.attr("opacity", 0);
	svg.selectAll()
		.data([
			{ x1: -AXES.x.span, y1: -AXES.y.span, x2: AXES.x.span, y2: AXES.y.span },
			{ x1: -AXES.x.span, y1: AXES.y.span, x2: AXES.x.span, y2: -AXES.y.span },
		])
		.join("line")
		.classed(lightConeObjsClass, true)
		.classed(lightConeClass, true)
		.attr("x1", d => canvasXScale(d.x1))
		.attr("y1", d => canvasYScale(d.y1))
		.attr("x2", d => canvasXScale(d.x2))
		.attr("y2", d => canvasYScale(d.y2))
		.attr("stroke", axisColor)
		.attr("opacity", 0)
		.attr("stroke-width", 4);
	svg.append("circle")
		.classed(lightConeObjsClass, true)
		.attr("cx", graphXScale(AXES.x.mid))
		.attr("cy", graphYScale(AXES.y.mid))
		.attr("r", 5)
		.attr("fill", STANDARD_COLORS.highlighted);
}
drawGraph();

const lightConeObjs = {
	causal: svg.select(`#${causalID}`),
	disconnected: svg.select(`#${disconnectedID}`),
	lightCone: svg.selectAll(`.${lightConeClass}`),
};
const toggles = {
	causal: d3.select("#toggle-causal"),
	disconnected: d3.select("#toggle-disconnected"),
	lightCone: d3.select("#toggle-lightcone"),
};

const toggleStates = {
	causal: true,
	disconnected: null,
	lightCone: null,
};

Object.entries(toggleStates).forEach(([k, v]) => {
	console.log(k, v);
	toggles[k].property("checked", v);
});

// eslint-disable-next-line no-unused-vars
function update({ x, t, showCausal, showDisconnected, showLightCone }) {
	if (typeof x === "undefined") {
		x = sliders.x.value;
	}
	x = +x;

	if (typeof t === "undefined") {
		t = sliders.t.value;
	}
	t = +t;

	if (typeof showCausal === "undefined") {
		showCausal = toggles.causal.property("checked");
	}

	if (typeof showDisconnected === "undefined") {
		showDisconnected = toggles.disconnected.property("checked");
	}

	if (typeof showLightCone === "undefined") {
		showLightCone = toggles.lightCone.property("checked");
	}

	const transX = graphXScale(x) - graphXScale(AXES.x.mid);
	const transY = graphYScale(t) - graphYScale(AXES.y.mid);
	d3.selectAll(`.${lightConeObjsClass}`).attr(
		"transform",
		`translate(${transX},${transY})`,
	);

	const transition = d3.transition().duration(400);
	lightConeObjs.causal
		.transition(transition)
		.attr("opacity", showCausal ? opacity : 0);
	lightConeObjs.disconnected
		.transition(transition)
		.attr("opacity", showDisconnected ? opacity : 0);
	lightConeObjs.lightCone
		.transition(transition)
		.attr("opacity", showLightCone ? 0.9 : 0);
}
