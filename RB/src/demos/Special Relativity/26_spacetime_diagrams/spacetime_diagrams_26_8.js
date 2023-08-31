/* global svg _updateDiagrams xScale yScale applyGraphicalObjs fmtFloat STANDARD_COLORS lorentzFactor */

const indVars = ["t", "x", "v"];
const sliders = {};
indVars.forEach(v => (sliders[v] = document.getElementById(`input-${v}`)));

const textSpans = {
	speed: document.getElementById("text-speed"),
};

const depVars = ["t", "x", "tp", "xp"];
depVars.forEach(v => (textSpans[v] = document.getElementById(`text-${v}`)));

const coordinatesClass = "coordinates";
function update({ t, x, v }) {
	const args = { t, x, v };
	Object.entries(args).forEach(([k, v]) => {
		if (typeof v === "undefined") {
			args[k] = sliders[k].value;
		}
		args[k] = +args[k];
	});
	({ t, x, v } = args);

	_updateDiagrams({
		v,
		speedSlider: sliders.v,
		speedText: textSpans.speed,
		axes: ["x", "t"],
		hideSecondaryAxesByDefault: false,
	});

	const lf = lorentzFactor({ fracOfC: v });

	const xp = lf * (x - v * t);
	const xpx = xp * lf;
	const xpt = xpx * v;

	const tp = lf * (t - v * x);
	const tpt = tp * lf;
	const tpx = tpt * v;

	const dashLength = 3.5;

	const lineAttrs = { "stroke-width": 2.5 };
	const primedLineAttrs = {
		...lineAttrs,
		"stroke-dasharray": `${dashLength - 0.5} ${dashLength + 0.5}`,
		stroke: STANDARD_COLORS.quaternary,
	};
	const unprimedLineAttrs = {
		...lineAttrs,
		"stroke-dasharray": `${dashLength - 0.5} ${dashLength + 0.5}`,
		"stroke-dashoffset": dashLength,
		stroke: STANDARD_COLORS.highlighted,
	};

	const lines = [
		{
			shape: "line",
			attrs: {
				x1: xScale(x),
				y1: yScale(t),
				x2: xScale(x),
				y2: yScale(0),
				...unprimedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(x),
				y1: yScale(t),
				x2: xScale(0),
				y2: yScale(t),
				...unprimedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(x),
				y1: yScale(t),
				x2: xScale(xpx),
				y2: yScale(xpt),
				...primedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(x),
				y1: yScale(t),
				x2: xScale(tpx),
				y2: yScale(tpt),
				...primedLineAttrs,
			},
		},
		{
			shape: "circle",
			attrs: {
				cx: xScale(x),
				cy: yScale(t),
				r: 4,
				fill: "white",
			},
		},
	];

	applyGraphicalObjs(svg, lines, {
		selector: `.${coordinatesClass}`,
		cssClass: coordinatesClass,
	});

	Object.entries({ x, t, xp, tp }).forEach(([k, v]) => {
		textSpans[k].innerHTML = fmtFloat(v, 3);
	});
}

update({});
