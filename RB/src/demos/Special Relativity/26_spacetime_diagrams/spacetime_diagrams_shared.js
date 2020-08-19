/* global STANDARD_COLORS defineArrowhead applyDatum lorentzFactor */

const AXES = {
	x: { min: -2, max: 2 },
	y: { min: -2, max: 2 },
};

const MARGINS = { t: 10, b: 10, l: 10, r: 10 };
const AXES_EXTENT_PAST_DATA = 90;

const WIDTH = 550,
	HEIGHT = 550;

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const AXIS_ARROWHEAD_ID = "arrowhead_axis_";
const LINE_ARROWHEAD_ID = "arrowhead_line_";

const lineColor = STANDARD_COLORS.secondary;

(() => {
	const speedSlider = document.getElementById("input-speed");
	if (speedSlider) {
		speedSlider.max = 0.7;
	}
})();

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
const tickColor = "#ccc";
const tickLength = 5;

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

const ticks = d3.range(-2, 2 + 0.001, 1);
function drawAxes() {
	svg.append("rect")
		.attr("x", 0)
		.attr("y", 0)
		.attr("width", WIDTH)
		.attr("height", HEIGHT)
		.attr("fill", "black");

	svg.selectAll()
		.data(ticks)
		.join("line")
		.attr("x1", xScale)
		.attr("x2", xScale)
		.attr("y1", yScale(0) - tickLength / 2)
		.attr("y2", yScale(0) + tickLength / 2)
		.style("stroke", tickColor)
		.style("stroke-width", 1.5);

	svg.selectAll()
		.data(ticks)
		.join("line")
		.attr("x1", xScale(0) - tickLength / 2)
		.attr("x2", xScale(0) + tickLength / 2)
		.attr("y1", yScale)
		.attr("y2", yScale)
		.style("stroke", tickColor)
		.style("stroke-width", 1.5);

	svg.append("line")
		.attr("x1", xScale(AXES.x.min) - AXES_EXTENT_PAST_DATA)
		.attr("y1", yScale(0))
		.attr("x2", xScale(AXES.x.max) + AXES_EXTENT_PAST_DATA)
		.attr("y2", yScale(0))
		.attr("stroke", axisColor)
		.attr("stroke-width", 1)
		.attr("marker-end", `url(#${AXIS_ARROWHEAD_ID})`);
	svg.append("line")
		.attr("x1", xScale(0))
		.attr("y1", yScale(AXES.y.min) + AXES_EXTENT_PAST_DATA)
		.attr("x2", xScale(0))
		.attr("y2", yScale(AXES.y.max) - AXES_EXTENT_PAST_DATA)
		.attr("stroke", axisColor)
		.attr("stroke-width", 1)
		.attr("marker-end", `url(#${AXIS_ARROWHEAD_ID})`);

	svg.append("text")
		.text("𝑥")
		.attr("x", xScale(AXES.x.max) + AXES_EXTENT_PAST_DATA - 4)
		.attr("y", yScale(0) - 15)
		.attr("font-size", 24)
		.attr("fill", "white")
		.attr("text-anchor", "right")
		.attr("dominant-baseline", "bottom");

	svg.append("text")
		.text("𝑡")
		.attr("x", xScale(0) + 15)
		.attr("y", yScale(AXES.y.max) - AXES_EXTENT_PAST_DATA)
		.attr("font-size", 24)
		.attr("fill", "white")
		.attr("text-anchor", "left")
		.attr("dominant-baseline", "middle");
}

drawAxes();

const lineGroupsClass = "spatial-slice-group";

const ANIM_STATES = { before: 0, during: 1, after: 2 };
const states = { spatial: ANIM_STATES.before, temporal: ANIM_STATES.before };
const showSlices = { spatial: false, temporal: false };

// eslint-disable-next-line no-unused-vars
function _toggleSlices(
	svg,
	button,
	{ sliceType, beforeBeginCallback, afterFinishCallback, afterResetCallback },
) {
	function call(callback) {
		if (typeof callback !== "undefined") {
			callback(button);
		}
	}

	const state = states[sliceType];
	showSlices[sliceType] = state === ANIM_STATES.before;

	call(beforeBeginCallback);
	button.disabled = true;

	let t = svg
		.selectAll(`.${lineGroupsClass}`)
		.filter(
			d =>
				(sliceType === undefined || d.sliceType === sliceType) &&
				!d.alwaysVisible,
		);

	if (state === ANIM_STATES.before) {
		t.transition()
			.delay((d, i) => i * 400)
			.duration(1000)
			.style("opacity", 1)
			.end()
			.then(
				() => {
					states[sliceType] = ANIM_STATES.after;
					call(afterFinishCallback);
					button.disabled = false;
				},
				() => {},
			);
	} else if (state === ANIM_STATES.after) {
		t = t
			.transition()
			.duration(200)
			.style("opacity", 0)
			.end()
			.then(
				() => {
					call(afterResetCallback);
					states[sliceType] = ANIM_STATES.before;
					button.disabled = false;
				},
				() => {},
			);
		return;
	} else {
		throw new Error(`Invalid state ${state}`);
	}

	states[sliceType] = ANIM_STATES.during;
}

const lineElemsClass = "spatial-elem";
// eslint-disable-next-line no-unused-vars
function _updateDiagrams({
	axes,
	speed,
	speedSlider,
	speedText,
	hideSecondaryAxesByDefault,
}) {
	if (typeof speed === "undefined") {
		speed = speedSlider.value;
	}
	speed = +speed;

	if (typeof axes === "string") {
		axes = [axes];
	}

	if (typeof hideSecondaryAxesByDefault === "undefined") {
		hideSecondaryAxesByDefault = true;
	}

	const nLinesAbove = 2;
	const lineGroups = axes
		.map(axis =>
			d3.range(2 * nLinesAbove + 1).map(i => {
				const index = -nLinesAbove + i;
				const alwaysVisible = index === 0 || !hideSecondaryAxesByDefault;
				const sliceType = axis === "x" ? "spatial" : "temporal";
				const opacity = showSlices[sliceType] || alwaysVisible ? 1 : 0;
				return {
					axis,
					index,
					opacity,
					alwaysVisible,
					wasAnimating: states[sliceType] !== ANIM_STATES.before,
					sliceType,
				};
			}),
		)
		.flat(Infinity);

	const gamma = lorentzFactor({ fracOfC: speed });
	function dataForGroup(d) {
		const index = d.index;
		const arrowheadOffset = 0.0001;
		let x1, y1, x2, y2, axisSymbol;

		const vectorScale = 2.3;
		if (d.axis === "t") {
			const x0 = index / gamma;
			({ min: y2, max: y1 } = AXES.y);
			[x1, x2] = [y1, y2].map(y => speed * y + x0);

			axisSymbol = "𝑥";
		} else if (d.axis === "x") {
			const y0 = index / gamma;
			({ min: x2, max: x1 } = AXES.x);
			[y1, y2] = [x1, x2].map(x => speed * x + y0);

			axisSymbol = "𝑡";
		} else {
			throw new Error(`Unexpected axis ${d.axis}`);
		}

		const midX = (x1 + x2) / 2;
		const midY = (y1 + y2) / 2;

		const dx1 = Math.abs(x1 - midX);
		const dy1 = Math.abs(y1 - midY);
		const mag1 = (dx1 ** 2 + dy1 ** 2) ** 0.5;
		x1 = midX + (vectorScale * dx1) / mag1;
		y1 = midY + (vectorScale * dy1) / mag1;

		const dx2 = -Math.abs(x2 - midX);
		const dy2 = -Math.abs(y2 - midY);
		const mag2 = (dx2 ** 2 + dy2 ** 2) ** 0.5;
		x2 = midX + (vectorScale * dx2) / mag2;
		y2 = midY + (vectorScale * dy2) / mag2;

		let arrowheadX2, arrowheadY2;
		if (d.axis === "t") {
			arrowheadX2 = x1 + speed * arrowheadOffset;
			arrowheadY2 = y1 + arrowheadOffset;
		} else if (d.axis === "x") {
			arrowheadX2 = x1 + arrowheadOffset;
			arrowheadY2 = y1 + speed * arrowheadOffset;
		} else {
			throw new Error(`Unexpected axis ${d.axis}`);
		}

		const dx = d.axis === "t" ? 0 : -15;
		const dy = d.axis === "t" ? -15 : -12;
		const textPos = {
			x: xScale(x1) + dx,
			y: yScale(y1) + dy,
		};
		if (textPos.x > xScale(AXES.x.max) - 20 + AXES_EXTENT_PAST_DATA) {
			textPos.x = xScale(x2) - 10;
			textPos.y = yScale(y2) + 16;
		}

		[x1, x2] = [x1, x2].map(xScale);
		[y1, y2] = [y1, y2].map(yScale);
		arrowheadX2 = xScale(arrowheadX2);
		arrowheadY2 = yScale(arrowheadY2);

		const lineAttrs = {
			stroke: lineColor,
			"stroke-width": 2,
			"stroke-dasharray": "3 3",
			"stroke-dashoffset": 1.5,
		};
		return [
			{
				shape: "line",
				attrs: {
					x1: (x1 + x2) / 2,
					y1: (y1 + y2) / 2,
					x2: x1,
					y2: y1,
					...lineAttrs,
				},
			},
			{
				shape: "line",
				attrs: {
					x1: (x1 + x2) / 2,
					y1: (y1 + y2) / 2,
					x2: x2,
					y2: y2,
					...lineAttrs,
				},
			},
			{
				shape: "line",
				attrs: {
					x1: x1,
					y1: y1,
					x2: arrowheadX2,
					y2: arrowheadY2,
					stroke: lineColor,
					"stroke-width": 2,
					"marker-end": `url(#${LINE_ARROWHEAD_ID})`,
				},
			},
			{
				shape: "text",
				text: `${axisSymbol}′ = ${index}`.replace("-", "−"),
				attrs: {
					...textPos,
					fill: "white",
					"font-size": 17,
					"text-anchor": d.axis === "t" ? "middle" : "begin",
					"dominant-baseline": d.axis === "t" ? "bottom" : "center",
					filter: `url(#text-bg)`,
				},
			},
		];
	}
	const elems = svg
		.selectAll(`.${lineGroupsClass}`)
		.data(lineGroups)
		.join("g")
		.each(function (d) {
			const g = d3.select(this);
			if (!d.wasAnimating) {
				g.style("opacity", d => d.opacity);
			}
		})
		.classed(lineGroupsClass, true)
		.selectAll(`.${lineElemsClass}`)
		.data(dataForGroup)
		.join(enter => enter.append(d => d3.create(`svg:${d.shape}`).node()))
		.classed(lineElemsClass, true);

	elems.each(function (d) {
		applyDatum.call(this, d);
	});

	speedText.innerHTML = fmtFloat(speed, 2);
}
