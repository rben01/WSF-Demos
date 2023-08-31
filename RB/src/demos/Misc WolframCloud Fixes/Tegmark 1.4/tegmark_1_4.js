/* global applyGraphicalObjs katex */
const WIDTH = 400;
const HEIGHT = 650;
const MARGIN = 15;

const canvas = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

const X_MIN = -1;
const X_MID = 0;
const X_EARTH = 0.5;
const X_MAX = 1;

const Y_MIN = -0.5;
const Y_SUN = 2;
const Y_MAX = 12;

const xScale = d3.scaleLinear([X_MIN, X_MAX], [MARGIN, WIDTH - MARGIN]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - MARGIN, MARGIN]);

const AU = 149_597_870.7; // kilometers
const pxToDistScale = d3.scaleLinear(
	[0, Math.abs(xScale(X_EARTH) - xScale(X_MID))],
	[0, AU],
);

// Confusing: this is the y-axis in the viz (the variable x is on the y-axis)
const xSlider = (() => {
	const slider = document.getElementById("input-x");

	slider.min = yScale.invert(yScale(Y_SUN) - pxToDistScale.domain()[1]);
	slider.max = 11;
	slider.value = 8;
	slider.step = 0.001;

	return slider;
})();

function getXsAtYsOnLine([x1, y1], [x2, y2], ys) {
	const m = (y2 - y1) / (x2 - x1);
	return ys.map(y => x1 + (y - y1) / m);
}

function getData(dist) {
	const [xBotLeft, xTopLeft] = getXsAtYsOnLine(
		[-X_EARTH, Y_SUN],
		[X_MID, dist],
		[Y_MIN, Y_MAX],
	);
	const [xBotRight, xTopRight] = getXsAtYsOnLine(
		[X_EARTH, Y_SUN],
		[X_MID, dist],
		[Y_MIN, Y_MAX],
	);

	const dataUnscaled = [
		{
			shape: "line",
			class: "diag-line",
			attrs: {
				x1: xBotLeft,
				x2: xTopLeft,
				y1: Y_MIN,
				y2: Y_MAX,
			},
		},
		{
			shape: "line",
			class: "diag-line",
			attrs: {
				x1: xBotRight,
				x2: xTopRight,
				y1: Y_MIN,
				y2: Y_MAX,
			},
		},
		{
			shape: "circle",
			class: "earth-orbit",
			attrs: {
				r: xScale(X_EARTH) - xScale(X_MID),
				transform: `translate(${xScale(X_MID)} ${yScale(Y_SUN)}) rotate(90)`,
			},
		},
		{
			shape: "line",
			class: "diameter-line",
			attrs: {
				x1: -X_EARTH,
				x2: X_EARTH,
				y1: Y_SUN,
				y2: Y_SUN,
			},
		},
		{
			shape: "line",
			class: "dist-line",
			attrs: {
				x1: X_MID,
				x2: X_MID,
				y1: Y_SUN,
				y2: dist,
			},
		},
		{
			shape: "line",
			class: "mid-line",
			attrs: {
				x1: X_MID,
				x2: X_MID,
				y1: Y_MIN,
				y2: Y_MAX,
			},
		},
		{
			shape: "circle",
			class: "the-sun",
			attrs: {
				r: 20,
				transform: `translate(${xScale(X_MID)} ${yScale(Y_SUN)}) rotate(90)`,
			},
		},
		{
			shape: "text",
			class: "label sun-label",
			text: "Sun",
			attrs: {
				x: X_MID,
				y: Y_SUN,
				"dominant-baseline": "middle",
			},
		},
		...[-1, 1].flatMap(sgn => [
			{
				shape: "circle",
				class: "the-earth",
				attrs: {
					cx: sgn * X_EARTH,
					cy: Y_SUN,
					r: 13,
				},
			},
			{
				shape: "text",
				class: "label earth-orbit-label",
				text: "𝑑",
				attrs: {
					x: (sgn * X_EARTH) / 2,
					y: Y_SUN,
					dy: -8,
				},
			},
			{
				shape: "text",
				class: `label text-label earth-perspective-label epl-${
					sgn < 0 ? "l" : "r"
				}`,
				text: "Earth",
				attrs: {
					x: sgn * (X_EARTH + 0.05),
					y: Y_SUN + 0.8,
				},
			},
			{
				shape: "text",
				class: `label text-label earth-perspective-label epl-${
					sgn < 0 ? "l" : "r"
				}`,
				text: `viewpoint ${sgn < 0 ? 1 : 2}`,
				attrs: {
					x: sgn * (X_EARTH + 0.05),
					y: Y_SUN + 0.8,
					dy: "1em",
				},
			},
			{
				shape: "text",
				class: "label theta-label",
				text: "𝜃",
				attrs: {
					x: sgn * 0.05,
					y: 0.83 * dist + 0.02,
				},
			},
		]),
		{
			shape: "text",
			class: "dist-label",
			text: "𝑥",
			attrs: {
				x: X_MID,
				y: (Y_SUN + dist) / 2,
				dx: 7,
			},
		},
		{
			shape: "circle",
			class: "far-object",
			attrs: {
				cx: X_MID,
				cy: dist,
				r: 12,
			},
		},
		{
			shape: "text",
			class: "label text-label obj-label",
			text: "Object",
			attrs: {
				x: X_MID,
				y: dist,
				dx: 22,
				"dominant-baseline": "central",
			},
		},
	];

	const dataScaled = dataUnscaled.map(o => {
		const a = o.attrs;
		let xScaledAttrs;
		let yScaledAttrs;
		switch (o.shape) {
			case "line":
				xScaledAttrs = ["x1", "x2"];
				yScaledAttrs = ["y1", "y2"];
				break;
			case "circle":
				xScaledAttrs = ["cx"];
				yScaledAttrs = ["cy"];
				break;
			case "text":
				xScaledAttrs = ["x"];
				yScaledAttrs = ["y"];
				break;
			default:
				xScaledAttrs = [];
				yScaledAttrs = [];
		}
		return {
			...o,
			attrs: {
				...a,
				...Object.fromEntries([
					...[
						[xScaledAttrs, xScale],
						[yScaledAttrs, yScale],
					].flatMap(([attrs, scale]) =>
						attrs.map(attr => [attr, scale(a[attr])]),
					),
				]),
			},
		};
	});

	return dataScaled;
}

const textAngleValue = document.getElementById("var-px-angle");
const textObjDist = document.getElementById("var-obj-dist");

const angleFormatter = d3.format(".4r");
const distFormatter = d3.format(",.3f");

function update() {
	const dist = +xSlider.value;
	const distPx = Math.abs(yScale(dist) - yScale(Y_SUN));
	const distDist = pxToDistScale(distPx);
	const theta = (Math.atan2(AU, distDist) * 180) / Math.PI;

	applyGraphicalObjs(canvas, getData(dist), { selector: "*" });

	if (typeof katex !== "undefined") {
		katex.render(
			String.raw`\theta = ${angleFormatter(theta)}^\circ`,
			textAngleValue,
			{
				throwOnError: false,
			},
		);
		katex.render(
			String.raw`x = ${distFormatter(distDist / 1e8)}\times10^8\,\textrm{km}`,
			textObjDist,
			{
				throwOnError: false,
			},
		);
	}
}

update();
