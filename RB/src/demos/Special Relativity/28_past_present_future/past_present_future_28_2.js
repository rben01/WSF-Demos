/* global applyDatum applyGraphicalObjs C STANDARD_COLORS */

const AXES = {
	x: { min: -2.5, max: 10 },
	y: { min: -2000, max: 2000 },
};

const MARGINS = { t: 50, b: 10, l: 5, r: 5 };

const WIDTH = 600,
	HEIGHT = 400;

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const arrowColor = "white";
const ARROWHEAD_ID = "arrowhead_";
const ARROWTAIL_ID = "arrowtail_";
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
	const arrowheadAttrs = {
		attrs: {
			d: "M 1 1 L 5 2.5 L 1 4 L 2 2.5 z",
			"stroke-linejoin": "miter",
			stroke: arrowColor,
			fill: arrowColor,
		},
	};
	const arrowtailAttrs = {
		attrs: {
			d: "M 6 1 L 2 2.5 L 6 4 L 5 2.5 z",
			"stroke-linejoin": "miter",
			stroke: arrowColor,
			fill: arrowColor,
		},
	};
	const defs = svg.append("svg:defs");

	for (const [attrs, id] of [
		[arrowheadAttrs, ARROWHEAD_ID],
		[arrowtailAttrs, ARROWTAIL_ID],
	]) {
		defs.append("svg:marker")
			.attr("id", id)
			.each(function () {
				applyDatum.call(this, markerAttrs);
			})
			.append("svg:path")
			.each(function () {
				applyDatum.call(this, attrs);
			});
	}
})();

const axisColor = "#666";
const tickLength = 10;

const colors = { obs1: STANDARD_COLORS.quaternary, obs2: STANDARD_COLORS.secondary };

const xScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([MARGINS.l, WIDTH - MARGINS.r]);
const yScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT - MARGINS.b, MARGINS.t]);

function drawGraph() {
	svg.append("line")
		.attr("x1", xScale(AXES.x.min))
		.attr("y1", yScale(0))
		.attr("x2", xScale(AXES.x.max))
		.attr("y2", yScale(0))
		.attr("stroke", axisColor)
		.attr("stroke-width", 1);
	svg.append("line")
		.attr("x1", xScale(0))
		.attr("y1", yScale(AXES.y.min))
		.attr("x2", xScale(0))
		.attr("y2", yScale(AXES.y.max))
		.attr("stroke", axisColor)
		.attr("stroke-width", 1);

	const xTicks = xScale.ticks(30);
	svg.selectAll()
		.data(xTicks)
		.join("line")
		.attr("x1", xScale)
		.attr("x2", xScale)
		.attr("y1", yScale(0))
		.attr("y2", yScale(0) + tickLength)
		.style("stroke", axisColor)
		.style("stroke-width", 1);

	const yTicks = yScale.ticks(20);
	svg.selectAll()
		.data(yTicks)
		.join("line")
		.attr("x1", xScale(0))
		.attr("x2", xScale(0) + tickLength)
		.attr("y1", yScale)
		.attr("y2", yScale)
		.style("stroke", axisColor)
		.style("stroke-width", 1);

	svg.append("text")
		.text("𝑡 (yrs)")
		.attr("x", xScale(0))
		.attr("y", yScale(AXES.y.max) - 20)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom")
		.attr("font-size", "smaller");

	svg.append("text")
		.text("𝑥 (lyrs)")
		.attr("x", xScale(AXES.x.max) - 30)
		.attr("y", yScale(0) + 30)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom")
		.attr("font-size", "smaller");

	svg.selectAll()
		.data(yTicks)
		.join("text")
		.text(t => {
			if (t % 500 === 0 && t !== 0) {
				return `${t}`;
			}
			return "";
		})
		.attr("x", xScale(0) - 3)
		.attr("y", yScale)
		.attr("text-anchor", "end")
		.attr("dominant-baseline", "middle")
		.attr("fill", "white")
		.attr("font-size", "50%");
}

drawGraph();

function fmtFloat(x, precision) {
	if (typeof precision === "undefined") {
		precision = 2;
	}
	return x.toPrecision(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const sliders = {
	speed: document.getElementById("input-speed"),
	distance: document.getElementById("input-distance"),
};

const textSpans = {
	vel: document.getElementById("obs-vel"),
	dist: document.getElementById("obs-dist"),
	yearsThem: document.getElementById("text-years-them"),
	yearsUs: document.getElementById("text-years-us"),
	pastFuture: document.getElementById("past-future"),
};

const MAX_SPEED = 50;
function update({ speed, distance }) {
	if (typeof speed === "undefined") {
		speed = sliders.speed.value;
	}
	speed = +speed;

	if (typeof distance === "undefined") {
		distance = sliders.distance.value;
	}
	distance = +distance;

	speed *= MAX_SPEED;

	const line = x => (speed * (x - distance) * 1e9) / C;
	const [x1, x2] = xScale.domain();
	const [t1, t2] = [x1, x2].map(line);
	// console.log([0].map(x => slope * x * C + y0));

	const radius = 5;
	const distArrowY = 400;
	const data = [
		{
			shape: "line",
			attrs: {
				x1: xScale(distance),
				y1: yScale(0),
				x2: xScale(x1),
				y2: yScale(t1),
				stroke: colors.obs2,
				"stroke-width": 2,
				"stroke-dasharray": "3 3",
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(distance),
				y1: yScale(0),
				x2: xScale(x2),
				y2: yScale(t2),
				stroke: colors.obs2,
				"stroke-width": 2,
				"stroke-dasharray": "3 3",
			},
		},
		{
			shape: "circle",
			attrs: {
				cx: xScale(0),
				cy: yScale(0),
				r: radius,
				fill: colors.obs1,
			},
		},
		{
			shape: "circle",
			attrs: {
				cx: xScale(distance),
				cy: yScale(0),
				r: radius,
				fill: colors.obs2,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(0) + 3.5,
				y1: yScale(distArrowY),
				x2: xScale(distance) - 3,
				y2: yScale(distArrowY),
				stroke: "white",
				"stroke-width": 1.5,
				"marker-start": `url(#${ARROWTAIL_ID})`,
				"marker-end": `url(#${ARROWHEAD_ID})`,
			},
		},
		{
			shape: "rect",
			attrs: {
				x: Math.max(
					Math.max(xScale(distance / 2), xScale(0) + 70) - 65,
					xScale(0) + tickLength,
				),
				y: yScale(2 * distArrowY) - 2,
				width: 150,
				height: yScale(0) - yScale(distArrowY) - 2,
				fill: "black",
			},
		},
		{
			shape: "text",
			attrs: {
				id: "graph-dist-text",
				x: Math.max(xScale(distance / 2), xScale(0) + 70),
				y: yScale(distArrowY) - 10,
				fill: "#5df",
				"text-anchor": "middle",
			},
		},
	];

	applyGraphicalObjs(svg, data, {
		cssClass: "graph-shape",
		selector: ".graph-shape",
	});

	for (const [textId, attrs] of [["graph-dist-text", { fill: "#5df" }]]) {
		const t = svg
			.select(`#${textId}`)
			.selectAll("tspan")
			.data([
				{
					text: `${distance.toPrecision(3)} ·10`,
					"font-size": null,
					dy: null,
				},
				{
					text: `9`,
					fontSize: "70%",
					dy: "-.7em",
				},
				{
					text: ` lyrs`,
					fontSize: "100%",
					dy: ".49em",
				},
			])
			.join("tspan")
			.text(d => d.text)
			.attr("font-size", d => d.fontSize)
			.attr("dy", d => d.dy);

		for (const [key, value] of Object.entries(attrs)) {
			t.attr(key, value);
		}
	}

	textSpans.vel.innerHTML = fmtFloat(speed, 3);
	textSpans.dist.innerHTML = fmtFloat(distance, 3);

	const t0 = line(0);
	textSpans.yearsThem.innerHTML = fmtFloat(t0, 4);
	textSpans.yearsUs.innerHTML = fmtFloat(Math.abs(t0), 4);
	textSpans.pastFuture.innerHTML = t0 < 0 ? "past" : "future";
}

update({});

svg.append("rect")
	.attr("x", 10)
	.attr("width", 90)
	.attr("y", 65)
	.attr("height", 40)
	.attr("fill", "black");

const legend = svg
	.selectAll()
	.data([
		{ color: colors.obs1, text: "Observer 1" },
		{ color: colors.obs2, text: "Observer 2" },
	])
	.join("g")
	.attr("transform", `translate(${xScale(AXES.x.min) + 10}, ${yScale(1750)})`)
	.attr("background", "black");

legend
	.append("rect")
	.attr("x", 0)
	.attr("y", (_, i) => i * 20)
	.attr("width", 10)
	.attr("height", 10)
	.attr("fill", d => d.color);
// .style("stroke", "black")
// .style("stroke-width", 3);
legend
	.append("text")
	.attr("x", 20)
	.attr("y", (_, i) => 5 + i * 20)
	.text(d => d.text)
	.attr("fill", "white")
	.attr("font-size", "12px")
	.attr("dy", ".5px")
	.attr("text-anchor", "begin")
	.attr("dominant-baseline", "middle");
