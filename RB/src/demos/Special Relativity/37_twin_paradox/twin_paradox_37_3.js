/* global lorentzFactor applyGraphicalObjs defineArrowhead STANDARD_COLORS */

const AXES = {
	x: { min: -0.5, max: 1.6 },
	y: { min: -0.1, max: 1.8 },
};

const MARGINS = { t: 50, b: 10, l: 5, r: 10 };

const HEIGHT = 400;
const WIDTH = (HEIGHT * (AXES.x.max - AXES.x.min)) / (AXES.y.max - AXES.y.min);

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const ARROWHEAD_ID = "arrowhead_";
const defs = svg.append("defs");
defineArrowhead(defs, { id: ARROWHEAD_ID, length: 14, width: 12, color: "white" });

const axisColor = "#fff";

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
		.attr("stroke-width", 2)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);
	svg.append("line")
		.attr("x1", xScale(0))
		.attr("y1", yScale(AXES.y.min))
		.attr("x2", xScale(0))
		.attr("y2", yScale(AXES.y.max))
		.attr("stroke", axisColor)
		.attr("stroke-width", 2)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);

	svg.append("text")
		.text("𝑡")
		.attr("x", xScale(0) - 12)
		.attr("y", yScale(AXES.y.max) + 5)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom");
	svg.append("text")
		.text("𝑥")
		.attr("x", xScale(AXES.x.max))
		.attr("y", yScale(0) + 20)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom");
}

drawGraph();

function fmtFloat(x, precision) {
	if (typeof precision === "undefined") {
		precision = 2;
	}
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const dotRadius = 4;
const colors = {
	path: STANDARD_COLORS.secondary,
	jump: STANDARD_COLORS.tertiary,
	awayTime: STANDARD_COLORS.quaternary,
	towardTime: "#aaa",
};
const dashes = "4 4";

function getPathPoints({ v, t }) {
	const origin = { x: xScale(0), t: yScale(0) };
	const turnaround = { x: xScale(t * v), t: yScale(t) };
	const end = { x: xScale(0), t: yScale(2 * t) };
	return { origin, turnaround, end };
}

function getPathObjects({ v, t, extraLines, extraTexts, circleToKeep }) {
	const { origin, turnaround, end } = getPathPoints({ v, t });
	const circles = (() => {
		const commonAttrs = {
			fill: colors.path,
			r: dotRadius,
			stroke: "#ddd",
		};

		const allCirclesData = [
			{ cx: origin.x, cy: origin.t },
			{ cx: turnaround.x, cy: turnaround.t },
			{ cx: end.x, cy: end.t },
		];

		const circlesData =
			typeof circleToKeep === "undefined"
				? allCirclesData
				: [allCirclesData[circleToKeep]];

		return {
			selector: "circle.c",
			data: circlesData.map(a => ({
				shape: "circle",
				class: "c",
				attrs: { ...commonAttrs, ...a },
			})),
		};
	})();
	const lines = (() => {
		const commonAttrs = {
			"stroke-width": 2,
			"stroke-dasharray": dashes,
			"marker-end": null,
		};
		return {
			selector: "line.c",
			data: [
				...(extraLines || []),
				{
					x1: origin.x,
					y1: origin.t,
					x2: turnaround.x,
					y2: turnaround.t,
					stroke: colors.path,
				},
				{
					x1: end.x,
					y1: end.t,
					x2: turnaround.x,
					y2: turnaround.t,
					stroke: colors.path,
				},
			].map(a => ({
				shape: "line",
				class: "c",
				attrs: { ...commonAttrs, ...a },
			})),
		};
	})();

	const texts = (() => {
		const commonAttrs = {
			fill: "white",
			"dominant-baseline": "middle",
			"text-anchor": "end",
		};
		return {
			selector: "text.c",
			data: [
				...(extraTexts || []),
				{
					text: "𝟤𝑇",
					attrs: {
						x: origin.x - 10,
						y: end.t,
					},
				},
			].map(a => {
				a.shape = "text";
				a.class = "c";
				a.attrs = { ...commonAttrs, ...a.attrs };
				return a;
			}),
		};
	})();

	return { circles, lines, texts, origin, turnaround, end };
}

function getEarthPerspective({ v, t }) {
	const { origin, turnaround } = getPathPoints({ v, t });

	const { circles, lines, texts } = getPathObjects({
		v,
		t,
		extraLines: [
			{
				x1: origin.x,
				y1: turnaround.t,
				x2: turnaround.x,
				y2: turnaround.t,
				stroke: "#bbb",
			},
		],
	});

	return [lines, circles, texts];
}

function getSpaceshipPerspectiveObjs({ v, t, circleToKeep }) {
	const { origin, turnaround } = getPathPoints({ v, t });
	const { extraLines, extraTexts } = (() => {
		const EPS = 0.01;
		const spacetimeLineLength = 1.7 * t;
		const getLine = slope => {
			const cosTheta = 1 / Math.sqrt(1 + slope * slope);
			const sinTheta = 1 / Math.sqrt(1 + 1 / (slope * slope));
			const lineEndX = spacetimeLineLength * cosTheta;
			const lineEndY = spacetimeLineLength * sinTheta;

			const lineStartX = slope < 1 ? origin.x : turnaround.x;
			const lineStartY = slope < 1 ? origin.t : turnaround.t;

			const dx = slope < 1 ? EPS : EPS / slope;
			const dy = slope < 1 ? EPS * slope : EPS;
			const lines = [
				{
					x1: xScale(lineEndX),
					y1: yScale(lineEndY),
					x2: lineStartX,
					y2: lineStartY,
					stroke: "white",
				},
				{
					x1: xScale(lineEndX),
					y1: yScale(lineEndY),
					x2: xScale(lineEndX + dx),
					y2: yScale(lineEndY + dy),
					stroke: "white",
					"stroke-dasharray": null,
					"marker-end": `url(#${ARROWHEAD_ID})`,
				},
			];

			const textDd = 0.06;
			const textDx = textDd * sinTheta;
			const textDy = textDd * cosTheta;
			const texts = [
				slope < 1
					? {
							text: "𝑥′",
							attrs: {
								x: xScale(lineEndX + textDx),
								y: yScale(lineEndY - textDy * 1.5),
								"dominant-baseline": "top",
								"text-anchor": "begin",
							},
					  }
					: {
							text: "𝑡′",
							attrs: {
								x: xScale(lineEndX - textDx * 0.2),
								y: yScale(lineEndY + textDy * 1.3),
								"dominant-baseline": "bottom",
								"text-anchor": "end",
							},
					  },
			];

			return { extraLines: lines, extraTexts: texts };
		};

		const tObjs = getLine(1 / v);
		const xObjs = getLine(v);

		return {
			extraLines: [...tObjs.extraLines, ...xObjs.extraLines],
			extraTexts: [...tObjs.extraTexts, ...xObjs.extraTexts],
		};
	})();

	return getPathObjects({
		v,
		t,
		extraLines,
		extraTexts,
		circleToKeep,
	});
}

function getSpaceshipPerspective({ v, t }) {
	const { circles, lines, texts } = getSpaceshipPerspectiveObjs({
		v,
		t,
		circleToKeep: 0,
	});
	return [lines, circles, texts];
}

const MIN_SLICE_X = -0.2;
const MAX_SLICE_X = 0.9;

function getOutboundPerspective({ v, t }) {
	const { circles, lines, texts, turnaround } = getSpaceshipPerspectiveObjs({
		v,
		t,
		circleToKeep: 1,
	});
	const timeSliceSlope = v;
	const timeSliceMaxYIntercept =
		yScale.invert(turnaround.t) - timeSliceSlope * xScale.invert(turnaround.x);
	const minX = MIN_SLICE_X;
	const maxX = MAX_SLICE_X;
	const nLines = 4;

	const timeSlices = d3.range(nLines).map(i => {
		const line = x =>
			timeSliceSlope * x + (timeSliceMaxYIntercept * i) / (nLines - 1);
		return {
			x1: xScale(minX),
			y1: yScale(line(minX)),
			x2: xScale(maxX),
			y2: yScale(line(maxX)),
			"stroke-dasharray": dashes,
		};
	});

	const tAxisLine = {
		x1: xScale(0),
		y1: yScale(0),
		x2: xScale(0),
		y2: yScale(timeSliceMaxYIntercept),
		"stroke-width": 2,
	};

	lines.data.push(
		...[...timeSlices, tAxisLine].map(a => ({
			shape: "line",
			class: "c",
			attrs: { stroke: colors.awayTime, ...a },
		})),
	);

	texts.data.push({
		shape: "text",
		class: "c",
		text: "𝑇₁",
		attrs: {
			x: xScale(0) - 10,
			y: yScale(timeSliceMaxYIntercept),
			fill: colors.awayTime,
			"dominant-baseline": "bottom",
			"text-anchor": "end",
		},
	});

	return [lines, circles, texts];
}

function getInboundJourneyObjs({ v, t, circleToKeep }) {
	const { origin, turnaround, end } = getPathPoints({ v, t });
	const { extraLines, extraTexts } = (() => {
		const EPS = 0.01;
		const spacetimeLineLength = 1.7 * t;
		const getLine = slope => {
			// Technically this is the negative of the slope
			const cosTheta = 1 / Math.sqrt(1 + slope * slope);
			const sinTheta = 1 / Math.sqrt(1 + 1 / (slope * slope));
			const _origLineEndX =
				xScale.invert(turnaround.x) - spacetimeLineLength * cosTheta;
			const _origLineEndY =
				yScale.invert(turnaround.t) + spacetimeLineLength * sinTheta;
			const adjustedSpacetimeLineLength =
				_origLineEndX < AXES.x.min + 0.17
					? (xScale.invert(turnaround.x) - (AXES.x.min + 0.17)) / cosTheta
					: _origLineEndY > AXES.y.max + 0.17
					? (AXES.y.max + 0.17 - yScale.invert(turnaround.t)) / sinTheta
					: spacetimeLineLength;

			const lineEndX =
				xScale.invert(turnaround.x) - adjustedSpacetimeLineLength * cosTheta;
			const lineEndY =
				yScale.invert(turnaround.t) + adjustedSpacetimeLineLength * sinTheta;

			const lineStartX = slope < 1 ? turnaround.x : end.x;
			const lineStartY = slope < 1 ? turnaround.t : end.t;

			const dx = -(slope < 1 ? EPS : EPS / slope);
			const dy = slope < 1 ? EPS * slope : EPS;
			const lines = [
				{
					x1: xScale(lineEndX),
					y1: yScale(lineEndY),
					x2: lineStartX,
					y2: lineStartY,
					stroke: "white",
				},
				{
					x1: xScale(lineEndX),
					y1: yScale(lineEndY),
					x2: xScale(lineEndX + dx),
					y2: yScale(lineEndY + dy),
					stroke: "white",
					"stroke-dasharray": null,
					"marker-end": `url(#${ARROWHEAD_ID})`,
				},
			];

			const textDd = 0.06;
			const textDx = textDd * sinTheta;
			const textDy = textDd * cosTheta;
			const texts = [
				slope < 1
					? {
							text: "𝑥′′",
							attrs: {
								x: xScale(lineEndX - textDx * 0.8),
								y: yScale(lineEndY - textDy * 2),
								"dominant-baseline": "top",
								"text-anchor": "end",
							},
					  }
					: {
							text: "𝑡′′",
							attrs: {
								x: xScale(lineEndX + textDx * 0.8),
								y: yScale(lineEndY + textDy * 0.5),
								"dominant-baseline": "bottom",
								"text-anchor": "begin",
							},
					  },
			];

			return { extraLines: lines, extraTexts: texts };
		};

		const tObjs = getLine(1 / v);
		const xObjs = getLine(v);

		const timeSliceSlope = v;
		const timeSliceMinYIntercept =
			yScale.invert(turnaround.t) + timeSliceSlope * xScale.invert(turnaround.x);
		const awayYIntercept =
			yScale.invert(turnaround.t) - timeSliceSlope * xScale.invert(turnaround.x);
		return {
			extraLines: [
				...tObjs.extraLines,
				...xObjs.extraLines,
				{
					x1: origin.x,
					y1: origin.t,
					x2: origin.x,
					y2: yScale(awayYIntercept),
					"stroke-width": 2,
					stroke: colors.awayTime,
					"stroke-dasharray": null,
				},
				{
					x1: origin.x,
					y1: yScale(awayYIntercept),
					x2: origin.x,
					y2: yScale(timeSliceMinYIntercept),
					"stroke-width": 2,
					stroke: colors.jump,
					"stroke-dasharray": null,
				},
			],
			extraTexts: [
				...tObjs.extraTexts,
				...xObjs.extraTexts,
				{
					shape: "text",
					class: "c",
					text: "𝑇₁",
					attrs: {
						x: xScale(0) - 10,
						y: yScale(awayYIntercept),
						fill: colors.awayTime,
						"dominant-baseline": "bottom",
						"text-anchor": "end",
					},
				},
				{
					shape: "text",
					class: "c",
					text: "𝑇₂",
					attrs: {
						x: xScale(0) - 10,
						y: yScale(timeSliceMinYIntercept),
						fill: colors.jump,
						"dominant-baseline": "bottom",
						"text-anchor": "end",
					},
				},
			],
		};
	})();

	return getPathObjects({
		v,
		t,
		extraLines,
		extraTexts,
		circleToKeep,
	});
}

function getFrameChangePerspective({ v, t }) {
	const { circles, lines, texts } = getInboundJourneyObjs({ v, t, circleToKeep: 1 });
	return [lines, circles, texts];
}

function getInboundPerspective({ v, t }) {
	const { circles, lines, texts, origin, turnaround, end } = getInboundJourneyObjs({
		v,
		t,
		circleToKeep: 2,
	});
	const timeSliceSlope = v;
	const timeSliceMinYIntercept =
		yScale.invert(turnaround.t) + timeSliceSlope * xScale.invert(turnaround.x);

	const minX = MIN_SLICE_X;
	const maxX = MAX_SLICE_X;
	const nLines = 4;

	const timeSlices = d3.range(nLines).map(i => {
		const line = x =>
			-timeSliceSlope * x +
			timeSliceMinYIntercept +
			((yScale.invert(end.t) - timeSliceMinYIntercept) * i) / (nLines - 1);
		return {
			x1: xScale(minX),
			y1: yScale(line(minX)),
			x2: xScale(maxX),
			y2: yScale(line(maxX)),
			"stroke-dasharray": dashes,
		};
	});

	const tAxisLines = [
		{
			x1: origin.x,
			y1: yScale(timeSliceMinYIntercept),
			x2: origin.x,
			y2: end.t,
			"stroke-width": 2,
		},
	];

	lines.data.push(
		...[...timeSlices, ...tAxisLines].map(a => ({
			shape: "line",
			class: "c",
			attrs: { stroke: colors.towardTime, ...a },
		})),
	);

	texts.data.push();

	return [lines, circles, texts];
}

const sliders = {
	v: document.getElementById("input-v"),
	t: document.getElementById("input-t"),
};

const persepctiveFuncs = {
	earth: getEarthPerspective,
	spaceship: getSpaceshipPerspective,
	outbound: getOutboundPerspective,
	frameChange: getFrameChangePerspective,
	inbound: getInboundPerspective,
	current: getEarthPerspective,
};

const buttons = {
	earth: document.getElementById("btn-e"),
	spaceship: document.getElementById("btn-ss"),
	outbound: document.getElementById("btn-ob"),
	frameChange: document.getElementById("btn-fc"),
	inbound: document.getElementById("btn-ib"),
};

const buttonTitles = {
	earth: "Earth Perspective",
	spaceship: "Spaceship Perspective",
	outbound: "Outbound Perspective",
	frameChange: "Frame Change",
	inbound: "Inbound Perspective",
};

const textItems = {
	v: document.getElementById("text-v"),
	t: document.getElementById("text-t"),
	t1: document.getElementById("text-t1"),
	t2: document.getElementById("text-t2"),
	ssTime: document.getElementById("text-ss-time"),
};

const hidables = {
	t1: document.getElementById("row-t1"),
	t2: document.getElementById("row-t2"),
	ssTime: document.getElementById("span-ss-time"),
};

const timeScale = d3
	.scaleLinear()
	.domain([0, +sliders.t.max])
	.range([0, 15]);

function update({ v, t, func }) {
	if (typeof v === "undefined") {
		v = sliders.v.value;
	}
	v = +v;

	if (typeof t === "undefined") {
		t = sliders.t.value;
	}
	t = +t;

	if (typeof func === "undefined") {
		func = persepctiveFuncs.current;
	} else {
		persepctiveFuncs.current = func;
	}

	const d = func({ v, t });
	for (const { selector, data } of d) {
		applyGraphicalObjs(svg, data, { selector });
	}

	const svgNode = svg.node();
	const circles = svgNode.querySelectorAll("circle.c");
	const texts = svgNode.querySelectorAll("text.c");

	for (const elems of [circles, texts]) {
		for (let i = 0; i < elems.length; ++i) {
			svgNode.appendChild(elems[i]);
		}
	}

	textItems.v.innerHTML = fmtFloat(v, 2);
	textItems.t.innerHTML = fmtFloat(timeScale(t), 2);

	const { turnaround } = getPathPoints({ v, t });
	const t1 = yScale.invert(turnaround.t) - v * xScale.invert(turnaround.x);
	textItems.t1.innerHTML = fmtFloat(timeScale(t1), 2);

	const t2 = yScale.invert(turnaround.t) + v * xScale.invert(turnaround.x);
	textItems.t2.innerHTML = fmtFloat(timeScale(t2), 2);

	const ssTime =
		((func === persepctiveFuncs.inbound ? 2 : 1) * t) /
		lorentzFactor({ fracOfC: v });
	textItems.ssTime.innerHTML = fmtFloat(timeScale(ssTime), 2);
}

function unhide(...visible) {
	if (typeof visible !== "undefined") {
		visible.forEach(h => (h.style.visibility = "visible"));
	}

	Object.values(hidables).forEach(h => {
		if (visible.indexOf(h) < 0) {
			h.style.visibility = "hidden";
		}
	});
}

function checkButton(buttonName) {
	Object.entries(buttons).forEach(([thisButtonName, button]) => {
		const text = buttonTitles[thisButtonName];
		const check = "✓";
		const hiddenCheck = `<span style="opacity:0;">${check}</span>`;
		button.innerHTML =
			thisButtonName === buttonName
				? `${hiddenCheck}${text} ${check}`
				: `${hiddenCheck}${text} ${hiddenCheck}`;
	});
}

// eslint-disable-next-line no-unused-vars
function clickButtonEarthPerspective() {
	update({ func: persepctiveFuncs.earth });
	[buttons.outbound, buttons.frameChange, buttons.inbound].forEach(
		button => (button.disabled = true),
	);

	unhide();
	checkButton("earth");
}

// eslint-disable-next-line no-unused-vars
function clickSpaceshipPerspective() {
	update({ func: persepctiveFuncs.spaceship });
	[buttons.outbound, buttons.frameChange, buttons.inbound].forEach(
		button => (button.disabled = false),
	);

	unhide();
	checkButton("spaceship");
}

// eslint-disable-next-line no-unused-vars
function clickOutboundPerspective() {
	update({ func: persepctiveFuncs.outbound });
	unhide(hidables.t1, hidables.ssTime);
	checkButton("outbound");
}

// eslint-disable-next-line no-unused-vars
function clickFrameChangePerspective() {
	update({ func: persepctiveFuncs.frameChange });
	unhide(hidables.t1, hidables.t2, hidables.ssTime);
	checkButton("frameChange");
}

// eslint-disable-next-line no-unused-vars
function clickInboundPerspective() {
	update({ func: persepctiveFuncs.inbound });
	unhide(hidables.t1, hidables.t2, hidables.ssTime);
	checkButton("inbound");
}

// hidables.t1.style.color = colors.awayTime;
// hidables.t2.style.color = colors.jump;

clickButtonEarthPerspective();
