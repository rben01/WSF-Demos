/* global svg _updateDiagrams xScale yScale applyGraphicalObjs fmtFloat */

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

	const xp = v === 0 ? x : (x / v - t) / (1 / v - v);
	const xpt = v === 0 ? 0 : xp * v;

	const tpx = v === 0 ? 0 : (t - x * v) / (1 / v - v);
	const tp = v === 0 ? t : tpx / v;

	const lineAttrs = { "stroke-width": 2, "stroke-dasharray": "2 2" };
	const primedLineAttrs = { ...lineAttrs, stroke: "#f21" };
	const unprimedLineAttrs = { ...lineAttrs, stroke: "#6f4" };

	const lines = [
		{
			shape: "line",
			attrs: {
				x1: xScale(x),
				y1: yScale(0),
				x2: xScale(x),
				y2: yScale(t),
				...unprimedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(0),
				y1: yScale(t),
				x2: xScale(x),
				y2: yScale(t),
				...unprimedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(xp),
				y1: yScale(xpt),
				x2: xScale(x),
				y2: yScale(t),
				...primedLineAttrs,
			},
		},
		{
			shape: "line",
			attrs: {
				x1: xScale(tpx),
				y1: yScale(tp),
				x2: xScale(x),
				y2: yScale(t),
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
