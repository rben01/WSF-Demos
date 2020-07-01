/* global lorentzFactor applyGraphicalObjs applyDatum defineArrowhead */

const AXES = {
	x: { min: -1, origin: 0, max: 1 },
	y: { min: -1, origin: 0, max: 1 },
};

const MARGINS = { t: 10, b: 10, l: 10, r: 10 };

const HEIGHT = 500;
const WIDTH = (HEIGHT * (AXES.x.max - AXES.x.min)) / (AXES.y.max - AXES.y.min);

const colors = (() => {
	const makeTransparent = color => {
		const c = d3.color(color);
		c.opacity = 0.35;
		return c.formatRgb();
	};
	const barn = "#0af";
	const pole = "#fe2";
	return {
		barn,
		barnFill: makeTransparent(barn),
		pole,
		poleFill: makeTransparent(pole),
		backDoorOpens: "#fb0",
		backDoorCloses: "#f30",
		frontDoorOpens: "#c1f",
		frontDoorCloses: "#0cf",
	};
})();

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const ARROWHEAD_ID = "arrowhead_";
const defs = svg.append("defs");
defineArrowhead(defs, { id: ARROWHEAD_ID, length: 14, width: 12, color: "white" });
defs.append("clipPath")
	.attr("id", "axes-clip")
	.append("rect")
	.attr("x", MARGINS.l)
	.attr("y", MARGINS.t)
	.attr("width", WIDTH - MARGINS.l - MARGINS.r)
	.attr("height", HEIGHT - MARGINS.t - MARGINS.b);

const legend = (() => {
	const legendWidth = 150;
	const legendHeight = 300;
	const legend = d3
		.select("#legend")
		.attr("width", legendWidth)
		.attr("height", legendHeight);

	const strokeWidth = 3;
	const x1 = 10;
	const x2 = 25;
	const dy = 24;
	const textX = x2 + 10;

	const textAttrs = {
		fill: "white",
		"dominant-baseline": "middle",
		"text-anchor": "begin",
		"font-size": "small",
	};

	const lineData = [
		{ text: "Barn", color: colors.barn },
		{ text: "Pole", color: colors.pole },
	];

	const lines = lineData.map((ld, i) => ({
		shape: "line",
		attrs: {
			x1,
			x2,
			y1: (i + 1) * dy,
			y2: (i + 1) * dy,
			stroke: ld.color,
			"stroke-width": strokeWidth,
		},
	}));

	const lineText = lineData.map((ld, i) => ({
		shape: "text",
		text: ld.text,
		attrs: {
			x: textX,
			y: (i + 1) * dy,
			...textAttrs,
		},
	}));

	const cx = (x1 + x2) / 2;
	const r = 3;
	const events = [
		{ text: "Back door closes", color: colors.backDoorCloses },
		{ text: "Back door opens", color: colors.backDoorOpens },
		{ text: "Front door closes", color: colors.frontDoorCloses },
		{ text: "Front door opens", color: colors.frontDoorOpens },
	];
	const circles = events.map((event, i) => ({
		shape: "circle",
		attrs: {
			cx,
			cy: i * dy + 10,
			r,
			fill: event.color,
			id: event.text.replace(/ /g, "_"),
		},
	}));
	const circleText = events.map((event, i) => ({
		shape: "text",
		text: event.text,
		attrs: {
			x: textX,
			y: i * dy + 10,
			...textAttrs,
		},
	}));

	legend
		.selectAll()
		.data([
			{ ty: 0, class: "lines" },
			{ ty: 75, class: "events" },
		])
		.join("g")
		.each(function (d) {
			d3.select(this).classed(d.class, true);
		})
		.attr("transform", d => `translate(0 ${d.ty})`)
		.call(applyGraphicalObjs, (_, i) => {
			return i === 0
				? [...lines, ...lineText].map(obj => ({ ...obj, class: "l" }))
				: [...circles, ...circleText].map(obj => ({ ...obj, class: "k" }));
		});

	return legend;
})();

const axisColor = "#fff";

const xScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([MARGINS.l, WIDTH - MARGINS.r]);
const yScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT - MARGINS.b, MARGINS.t]);

function getAxes() {
	return [
		{
			x1: xScale(AXES.x.min),
			y1: yScale(AXES.y.origin),
			x2: xScale(AXES.x.max),
			y2: yScale(AXES.y.origin),
		},
		{
			x1: xScale(AXES.x.origin),
			y1: yScale(AXES.y.min),
			x2: xScale(AXES.x.origin),
			y2: yScale(AXES.y.max),
		},
	].map(attrs => ({
		shape: "line",
		attrs: {
			...attrs,
			stroke: axisColor,
			"stroke-width": 2,
			"marker-end": `url(#${ARROWHEAD_ID})`,
		},
	}));
}

function fmtFloat(x, precision) {
	if (typeof precision === "undefined") {
		precision = 2;
	}
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const barnLength = 0.3;
const poleLength = 1.3 * barnLength;

const radius = d3.scaleLinear().domain([0, 6]).range([7, 3]).clamp(true);

const dashes = "4 4";

const widths = { stationary: 5, moving: 2 };

const line = d3
	.line()
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

const yTimeScale = d3.scaleLinear().domain([0, 1]).range(yScale.domain());

const sliders = {
	v: document.getElementById("input-v"),
	t: document.getElementById("input-t"),
};

const buttons = {
	perspective: {
		barn: document.getElementById("btn-persp-barn"),
		pole: document.getElementById("btn-persp-pole"),
	},
	slices: {
		both: document.getElementById("btn-slice-both"),
		barn: document.getElementById("btn-slice-barn"),
		pole: document.getElementById("btn-slice-pole"),
	},
	playPause: document.getElementById("play-pause"),
};

function makeSubscript(text) {
	return {
		shape: "tspan",
		class: "subsubscript",
		text,
		attrs: { "font-size": "65%", dy: ".3em" },
	};
}

const BARN = 0;
const POLE = 1;
const BOTH = 2;

function getSlices({ v, slicesToShow, perspective }) {
	const dt = 0.23;
	const nSlicesAbove = Math.floor((AXES.y.max - AXES.y.origin) / dt) + 5;
	const nSlicesBelow = Math.floor((AXES.y.origin - AXES.y.min) / dt) + 5;
	const sliceYIntercepts = d3
		.range(-nSlicesBelow, nSlicesAbove + 0.1)
		.map(i => AXES.y.origin + i * dt);

	function _getSliceAttrs(slope) {
		return sliceYIntercepts.map(y0 => {
			const x1 = AXES.x.min;
			const x2 = AXES.x.max;
			return {
				shape: "line",
				class: "s",
				attrs: {
					x1: xScale(x1),
					y1: yScale(y0 + slope * x1),
					x2: xScale(x2),
					y2: yScale(y0 + slope * x2),
					stroke: "#fff5",
					"stroke-dasharray": dashes,
					"clip-path": `url(#axes-clip)`,
				},
			};
		});
	}

	function getBarnSliceAttrs() {
		const slope = perspective === BARN ? 0 : v;
		return _getSliceAttrs(slope);
	}

	function getPoleSliceAttrs() {
		const slope = perspective === BARN ? -v : 0;
		return _getSliceAttrs(slope);
	}

	if (slicesToShow === BARN) {
		return getBarnSliceAttrs();
	} else if (slicesToShow === POLE) {
		return getPoleSliceAttrs();
	} else if (slicesToShow === BOTH) {
		return [...getBarnSliceAttrs(), ...getPoleSliceAttrs()];
	} else {
		throw new Error(`Unexpected which: ${slicesToShow}`);
	}
}

function getEventPoints({ v, y, barnRelLength, poleRelLength, perspective }) {
	const transition = legend.selectAll(".events").transition().duration(100);
	if (poleRelLength > barnLength) {
		transition.style("opacity", 0);
		return [];
	}

	transition.style("opacity", 1);

	const scaledY = yScale(y);

	let frontDoorOpensX,
		frontDoorOpensT,
		frontDoorClosesX,
		frontDoorClosesT,
		backDoorOpensX,
		backDoorOpensT,
		backDoorClosesX,
		backDoorClosesT;

	if (perspective === BARN) {
		frontDoorOpensX = barnLength;
		frontDoorOpensT = AXES.y.origin;

		frontDoorClosesX = barnLength;
		frontDoorClosesT = -(frontDoorClosesX - poleRelLength) / v;

		backDoorOpensX = AXES.x.origin;
		backDoorOpensT = -backDoorOpensX / v;

		backDoorClosesX = AXES.x.origin;
		backDoorClosesT = -(frontDoorClosesX - poleRelLength) / v;
	} else if (perspective === POLE) {
		frontDoorOpensX = barnRelLength / (1 - v * v);
		frontDoorOpensT = (1 / v) * (frontDoorOpensX - barnRelLength);

		frontDoorClosesX = poleLength;
		frontDoorClosesT = (1 / v) * (frontDoorClosesX - barnRelLength);

		backDoorOpensX = AXES.x.origin;
		backDoorOpensT = AXES.y.origin;

		backDoorClosesX = (frontDoorClosesT - v * frontDoorClosesX) / (1 / v - v);
		backDoorClosesT = backDoorClosesX / v;
	} else {
		throw new Error(`Unexpected perspective ${perspective}`);
	}

	const frontDoorOpensAttrs = {
		cx: frontDoorOpensX,
		cy: frontDoorOpensT,
		fill: colors.frontDoorOpens,
	};
	const frontDoorClosesAttrs = {
		cx: frontDoorClosesX,
		cy: frontDoorClosesT,
		fill: colors.frontDoorCloses,
	};

	const backDoorOpensAttrs = {
		cx: backDoorOpensX,
		cy: backDoorOpensT,
		fill: colors.backDoorOpens,
	};

	const backDoorClosesAttrs = {
		cx: backDoorClosesX,
		cy: backDoorClosesT,
		fill: colors.backDoorCloses,
	};

	return [
		frontDoorOpensAttrs,
		frontDoorClosesAttrs,
		backDoorOpensAttrs,
		backDoorClosesAttrs,
	].map(attrs => {
		const scaledCy = yScale(attrs.cy);
		const r = radius(Math.abs(scaledCy - scaledY));

		legend
			.selectAll("circle.k")
			.filter(d => d.attrs.fill === attrs.fill)
			.attr("r", r);
		return {
			shape: "circle",
			attrs: {
				...attrs,
				cx: xScale(attrs.cx),
				cy: scaledCy,
				r,
			},
		};
	});
}

function getBarnPerspective({ v, t, slices }) {
	const barnRect = [
		...[AXES.y.min, AXES.y.max].map(y => [AXES.x.origin, y]),
		...[AXES.y.max, AXES.y.min].map(y => [AXES.x.origin + barnLength, y]),
	];

	const poleRelLength = poleLength / lorentzFactor({ fracOfC: v });
	const poleParallelogram = [
		...[AXES.y.min, AXES.y.max].map(y => [-v * y, y]),
		...[AXES.y.max, AXES.y.min].map(y => [-v * y + poleRelLength, y]),
	];

	const y = yTimeScale(t);
	const scaledY = yScale(y);

	const eventPoints = getEventPoints({
		v,
		y,
		poleRelLength,
		perspective: BARN,
	});

	const axisLabelSubscript = makeSubscript("𝖡");

	return [
		{
			shape: "path",
			attrs: {
				d: line(barnRect),
				fill: colors.barnFill,
				"stroke-opacity": 0,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "path",
			attrs: {
				d: line(poleParallelogram),
				fill: colors.poleFill,
				"stroke-opacity": 0,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(AXES.x.origin),
				x2: xScale(AXES.x.origin + barnLength),
				y1: scaledY,
				y2: scaledY,
				stroke: colors.barn,
				"stroke-width": widths.stationary,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(-v * y),
				x2: xScale(-v * y + poleRelLength),
				y1: scaledY,
				y2: scaledY,
				stroke: colors.pole,
				"stroke-width": widths.moving,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "text",
			text: "𝑡",
			attrs: {
				x: xScale(AXES.x.origin) + 12,
				y: yScale(AXES.y.max) + 5,
				fill: "white",
				"text-anchor": "begin",
				"dominant-baseline": "top",
			},
			children: [axisLabelSubscript],
		},
		{
			shape: "text",
			text: "𝑥",
			attrs: {
				x: xScale(AXES.x.max) - 15,
				y: yScale(AXES.y.origin) - 15,
				fill: "white",
				"text-anchor": "begin",
				"dominant-baseline": "bottom",
			},
			children: [axisLabelSubscript],
		},
		...getAxes(),
		...slices,
		...eventPoints,
	].map(obj => ({ class: "c", ...obj }));
}

function getPolePerspective({ v, t, slices }) {
	const poleRect = [
		...[AXES.y.min, AXES.y.max].map(y => [AXES.x.origin, y]),
		...[AXES.y.max, AXES.y.min].map(y => [AXES.x.origin + poleLength, y]),
	];

	const poleRelLength = poleLength / lorentzFactor({ fracOfC: v });
	const barnRelLength = barnLength / lorentzFactor({ fracOfC: v });
	const barnParallelogram = [
		...[AXES.y.min, AXES.y.max].map(y => [v * y, y]),
		...[AXES.y.max, AXES.y.min].map(y => [v * y + barnRelLength, y]),
	];

	const y = yTimeScale(t);
	const scaledY = yScale(y);

	const eventPoints = getEventPoints({
		v,
		y,
		barnRelLength,
		poleRelLength,
		perspective: POLE,
	});

	const axisLabelSubscript = makeSubscript("𝖡");

	return [
		{
			shape: "path",
			attrs: {
				d: line(barnParallelogram),
				fill: colors.barnFill,
				"stroke-opacity": 0,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "path",
			attrs: {
				d: line(poleRect),
				fill: colors.poleFill,
				"stroke-opacity": 0,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(AXES.x.origin),
				x2: xScale(AXES.x.origin + poleLength),
				y1: scaledY,
				y2: scaledY,
				stroke: colors.pole,
				"stroke-width": widths.moving,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(v * y),
				x2: xScale(v * y + barnRelLength),
				y1: scaledY,
				y2: scaledY,
				stroke: colors.barn,
				"stroke-width": widths.stationary,
				"clip-path": "url(#axes-clip)",
			},
		},
		{
			shape: "text",
			text: "𝑡",
			attrs: {
				x: xScale(AXES.x.origin) + 12,
				y: yScale(AXES.y.max) + 5,
				fill: "white",
				"text-anchor": "begin",
				"dominant-baseline": "top",
			},
			children: [axisLabelSubscript],
		},
		{
			shape: "text",
			text: "𝑥",
			attrs: {
				x: xScale(AXES.x.max) - 15,
				y: yScale(AXES.y.origin) - 15,
				fill: "white",
				"text-anchor": "begin",
				"dominant-baseline": "bottom",
			},
			children: [axisLabelSubscript],
		},
		...getAxes(),
		...slices,
		...eventPoints,
	].map(obj => ({ class: "c", ...obj }));
}

let currentPerspective = BARN;
let currentSlices = BARN;

function groupBy(array, keyFunc, expectedKeys, asArray = true) {
	const grouped = {};
	for (const elem of array) {
		const key = keyFunc(elem);
		if (key in grouped) {
			grouped[key].push(elem);
		} else {
			grouped[key] = [elem];
		}
	}

	for (const k of expectedKeys) {
		if (!(k in grouped)) {
			grouped[k] = [];
		}
	}

	if (asArray) {
		return Object.entries(grouped);
	}
	return grouped;
}

function getKeyFromDatum(d) {
	return `${d.shape}.${d.class}`;
}

const FPS = 37;
const ANIMATION_DURATION_SEC = 5;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const N_FRAMES = ANIMATION_DURATION_SEC * FPS;
const playbackInfo = {
	isPlaying: false,
	animationTimer: null,
	currFrame: 0,
	frameToTimeInterpolator: d3
		.scaleLinear()
		.domain([0, N_FRAMES])
		.range([+sliders.t.min, +sliders.t.max]),
};

function stopAnimation() {
	playbackInfo.isPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	buttons.playPause.innerText = "Start";
}

function update({ v, t, perspective, slicesToShow, updatedFromTimer } = {}) {
	if (typeof v === "undefined") {
		v = sliders.v.value;
	}
	v = +v;

	if (typeof t === "undefined") {
		t = sliders.t.value;
	} else {
		sliders.t.value = t;
		if (typeof updatedFromTimer === "undefined" || !updatedFromTimer) {
			playbackInfo.currFrame = playbackInfo.frameToTimeInterpolator.invert(t);
			stopAnimation();
		}
	}
	t = +t;

	if (typeof perspective === "undefined") {
		perspective = currentPerspective;
	} else {
		currentPerspective = perspective;
	}

	if (typeof slicesToShow === "undefined") {
		slicesToShow = currentSlices;
	} else {
		currentSlices = slicesToShow;
	}

	const slices = getSlices({ v, perspective, slicesToShow });
	const data =
		perspective === BARN
			? getBarnPerspective({ v, t, slices })
			: getPolePerspective({ v, t, slices });

	const groups = groupBy(data, getKeyFromDatum, ["line.c", "path.c", "circle.c"]);

	for (const [selector, items] of groups) {
		applyGraphicalObjs(svg, items, {
			selector,
		});
	}

	buttons.perspective.barn.disabled = perspective === BARN;
	buttons.perspective.pole.disabled = perspective === POLE;

	buttons.slices.barn.disabled = slicesToShow === BARN;
	buttons.slices.pole.disabled = slicesToShow === POLE;
	buttons.slices.both.disabled = slicesToShow === BOTH;
}

// eslint-disable-next-line no-unused-vars
function toggleAnimation() {
	if (playbackInfo.isPlaying) {
		stopAnimation();
		return;
	}

	playbackInfo.isPlaying = true;
	buttons.playPause.innerText = "Pause";
	if (playbackInfo.currFrame >= N_FRAMES) {
		playbackInfo.currFrame = 0;
	}

	playbackInfo.animationTimer = setInterval(() => {
		if (playbackInfo.currFrame >= N_FRAMES) {
			update({ t: sliders.t.max });
			stopAnimation();
			return;
		}

		playbackInfo.currFrame += 1;
		const t = playbackInfo.frameToTimeInterpolator(playbackInfo.currFrame);
		update({ t, updatedFromTimer: true });
	}, ANIMATION_DURATION_MS / N_FRAMES);
}

update({
	v: sliders.v.value,
	t: sliders.t.value,
	perspective: POLE,
	slicesToShow: BOTH,
});
