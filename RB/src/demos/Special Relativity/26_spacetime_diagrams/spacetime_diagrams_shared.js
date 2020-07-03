/* global STANDARD_COLORS defineArrowhead applyDatum lorentzFactor */

const AXES = {
	x: { min: -2, max: 2 },
	y: { min: -2, max: 2 },
};

const MARGINS = { t: 10, b: 10, l: 10, r: 10 };
const AXES_EXTENT_PAST_DATA = 75;

const WIDTH = 500,
	HEIGHT = 500;

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const AXIS_ARROWHEAD_ID = "arrowhead_axis_";
const LINE_ARROWHEAD_ID = "arrowhead_line_";

const lineColor = STANDARD_COLORS.secondary;

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

const ticks = d3.range(AXES.x.min, AXES.x.max + 0.001, 1);
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
		.attr("x", xScale(AXES.x.max) + AXES_EXTENT_PAST_DATA)
		.attr("y", yScale(0) - 15)
		.attr("fill", "white")
		.attr("text-anchor", "right")
		.attr("dominant-baseline", "bottom");

	svg.append("text")
		.text("𝑡")
		.attr("x", xScale(0) + 15)
		.attr("y", yScale(AXES.y.max) - AXES_EXTENT_PAST_DATA)
		.attr("fill", "white")
		.attr("text-anchor", "left")
		.attr("dominant-baseline", "middle");
}

drawAxes();

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
		let t = svg.selectAll(`.${lineGroupsClass}`).filter(d => !d.alwaysVisible);
		if (state === ANIM_STATES.after) {
			t = t.transition().duration(200).style("opacity", 0);
		}

		state = ANIM_STATES.during;
		t.transition()
			.delay((d, i) => i * 400)
			.duration(1000)
			.style("opacity", 1)
			.end()
			.then(
				() => {
					state = ANIM_STATES.after;
					call(afterFinishCallback);
				},
				() => {},
			);
	} else {
		state = ANIM_STATES.before;
		call(beforeCancelCallback);
		svg.selectAll(`.${lineGroupsClass}`)
			.filter(d => !d.alwaysVisible)
			.transition()
			.duration(400)
			.style("opacity", 0)

			.end()
			.then(
				() => {
					call(afterCancelCallback);
				},
				() => {},
			);
	}
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

	const wasAnimating = state === ANIM_STATES.during;

	const nLinesAbove = 2;
	const lineGroups = axes
		.map(axis =>
			d3.range(2 * nLinesAbove + 1).map(i => {
				const index = -nLinesAbove + i;
				const alwaysVisible = index === 0 || !hideSecondaryAxesByDefault;
				const opacity = showSpacialSlices || alwaysVisible ? 1 : 0;
				return { axis, index, opacity, alwaysVisible };
			}),
		)
		.flat(Infinity);

	const gamma = lorentzFactor({ fracOfC: speed });
	const dataForGroup = d => {
		const index = d.index;
		const arrowheadOffset = 0.0001;
		let x1, y1, x2, y2, textPos, arrowheadX2, arrowheadY2, axisSymbol;
		if (d.axis === "t") {
			const x0 = index / gamma;
			({ min: y2, max: y1 } = AXES.y);
			[y1, y2] = [y1, y2].map(y => y * 1.2);
			[x1, x2] = [y1, y2].map(y => speed * y + x0);

			textPos = {
				x: xScale(x1) - 15,
				y: yScale(y1) - 14,
			};
			if (textPos.x > xScale(AXES.x.max) - 20 + AXES_EXTENT_PAST_DATA) {
				textPos.x = xScale(x2) - 10;
				textPos.y = yScale(y2) + 16;
			}

			arrowheadX2 = x1 + speed * arrowheadOffset;
			arrowheadY2 = y1 + arrowheadOffset;
			axisSymbol = "𝑥";
		} else if (d.axis === "x") {
			const y0 = index / gamma;
			({ min: x2, max: x1 } = AXES.x);
			[x1, x2] = [x1, x2].map(x => x * 1.2);
			[y1, y2] = [x1, x2].map(x => speed * x + y0);

			textPos = {
				x: xScale(x1) - 15,
				y: yScale(y1) - 12,
			};
			if (textPos.y < yScale(AXES.y.max) + 20 - AXES_EXTENT_PAST_DATA) {
				textPos.x = xScale(x2) - 10;
				textPos.y = yScale(y2) + 16;
			}

			arrowheadX2 = x1 + arrowheadOffset;
			arrowheadY2 = y1 + speed * arrowheadOffset;
			axisSymbol = "𝑡";
		} else {
			throw new Error(`Unexpected axis ${d.axis}`);
		}

		[x1, x2] = [x1, x2].map(xScale);
		[y1, y2] = [y1, y2].map(yScale);
		arrowheadX2 = xScale(arrowheadX2);
		arrowheadY2 = yScale(arrowheadY2);
		return [
			{
				shape: "line",
				attrs: {
					x1: x1,
					y1: y1,
					x2: x2,
					y2: y2,
					stroke: lineColor,
					"stroke-width": 2,
					"stroke-dasharray": "3 3",
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
					"font-size": "70%",
					filter: `url(#text-bg)`,
				},
			},
		];
	};
	const elems = svg
		.selectAll(`.${lineGroupsClass}`)
		.data(lineGroups)
		.join("g")
		.call(g => {
			if (!wasAnimating) {
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
