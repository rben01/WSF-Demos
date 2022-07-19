/* global applyGraphicalObjs katex */
const WIDTH = 650;
const HEIGHT = 600;

const X_MAX = 10;
const X_0 = 0;
const X_MIN = -X_MAX;

const Y_0 = 0;
const [Y_MIN, Y_MAX] = (() => {
	const aspect = WIDTH / HEIGHT;
	const yMin = Y_0 + (X_MIN - X_0) / aspect;
	const yMax = Y_0 + (X_MAX - X_0) / aspect;
	return [yMin, yMax];
})();

const plot2D = d3.select("#plot-2D").attr("width", WIDTH).attr("height", HEIGHT);

const MARGIN = 0;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [MARGIN, WIDTH - MARGIN]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - MARGIN, MARGIN]);
const y0s = yScale(Y_0);

const HYPERBOLA_X_MIN = -20;
const HYPERBOLA_X_MAX = -HYPERBOLA_X_MIN;
const HYPERBOLA_WIDTH = 400;
const HYPERBOLA_HEIGHT = 600;
const [HYPERBOLA_Y_MIN, HYPERBOLA_Y_MAX] = (() => {
	const aspect = HYPERBOLA_WIDTH / HYPERBOLA_HEIGHT;
	const yMin = Y_0 + (HYPERBOLA_X_MIN - X_0) / aspect;
	const yMax = Y_0 + (HYPERBOLA_X_MAX - X_0) / aspect;
	return [yMin, yMax];
})();

const plotHyperbola = d3
	.select("#plot-hyperbola")
	.attr("width", HYPERBOLA_WIDTH)
	.attr("height", HYPERBOLA_HEIGHT);
const hyperbolaXScale = d3.scaleLinear(
	[HYPERBOLA_X_MIN, HYPERBOLA_X_MAX],
	[MARGIN, HYPERBOLA_WIDTH - MARGIN],
);
const hyperbolaYScale = d3.scaleLinear(
	[HYPERBOLA_Y_MIN, HYPERBOLA_Y_MAX],
	[HYPERBOLA_HEIGHT - MARGIN, MARGIN],
);

let currentTime = 0;

const sliders = {
	v: (() => {
		const slider = document.getElementById("slider-v");
		slider.min = 0;
		slider.max = 0.9;
		slider.step = 0.001;
		slider.value = (+slider.min + +slider.max) / 2;

		return slider;
	})(),
	R: (() => {
		const slider = document.getElementById("slider-R");
		slider.min = 0.1;
		slider.max = 0.7;
		slider.step = 0.001;
		slider.value = (+slider.min + +slider.max) / 2;

		return slider;
	})(),
	B: (() => {
		const slider = document.getElementById("slider-B");
		slider.min = 0.0;
		slider.max = 0.85;
		slider.step = 0.001;
		slider.value = (+slider.min + +slider.max) / 2;

		return slider;
	})(),
	z0: (() => {
		const slider = document.getElementById("slider-z0");
		const maxDistFrac = 0.9;
		slider.min = maxDistFrac * X_MIN;
		slider.max = maxDistFrac * X_MAX;
		slider.step = 0.001;
		slider.value = (+slider.min + +slider.max) / 2;

		return slider;
	})(),
	speed: (() => {
		const slider = document.getElementById("slider-speed");
		slider.min = 0.1;
		slider.max = 1.2;
		slider.step = 0.001;
		slider.value = (+slider.min + +slider.max) / 2;

		return slider;
	})(),
};

function sliderValues() {
	const v = +sliders.v.value;
	const B = +sliders.B.value;

	const gamma = (1 - v ** 2) ** -0.5;
	const Gamma = (1 - B ** 2) ** -0.5;

	const z0 = +sliders.z0.value;
	const R = +sliders.R.value;
	const dist = 2 * gamma * Math.PI * R;
	return { v, R, B, z0, gamma, Gamma, dist };
}

d3.selectAll(".slider").on("input", () => {
	// eslint-disable-next-line no-use-before-define
	update();
});

function getHyperbolaAxisData() {
	const tickLength = 4;

	const xAxisTicks = hyperbolaXScale.ticks(20).filter(x => x !== X_0);
	const nXAxisLabels = 10;
	const xAxisLabelTicks = hyperbolaXScale
		.ticks(nXAxisLabels)
		.filter(x => x !== X_0)
		.slice(1, -1);
	const xAxisFormatter = hyperbolaXScale.tickFormat(nXAxisLabels);

	const yAxisTicks = hyperbolaYScale.ticks(15).filter(y => y !== Y_0);
	const nYAxisLabels = 7;
	const yAxisLabelTicks = hyperbolaYScale.ticks(nYAxisLabels).filter(y => y !== Y_0);
	const yAxisFormatter = hyperbolaYScale.tickFormat(nYAxisLabels);

	const xs0 = hyperbolaXScale(X_0);
	const ys0 = hyperbolaYScale(Y_0);

	const [xMin, xMax] = hyperbolaXScale.range();
	const [yMin, yMax] = hyperbolaYScale.range();

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xMin - 1.5,
				x2: xMax + 1.5,
				y1: ys0,
				y2: ys0,
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: yMin,
				y2: yMax,
			},
		},
		...xAxisTicks.map(x => {
			const xs = hyperbolaXScale(x);
			return {
				shape: "line",
				class: "axis axis-tick x-axis-tick",
				attrs: {
					x1: xs,
					x2: xs,
					y1: ys0,
					y2: ys0 + tickLength,
				},
			};
		}),
		...xAxisLabelTicks.map(x => {
			const xs = hyperbolaXScale(x);
			return {
				shape: "text",
				class: "axis axis-label x-axis-label",
				text: xAxisFormatter(x),
				attrs: {
					x: xs,
					y: hyperbolaYScale(Y_0) + 12,
				},
			};
		}),
		...yAxisTicks.map(y => {
			const ys = hyperbolaYScale(y);
			return {
				shape: "line",
				class: "axis axis-tick y-axis-tick",
				attrs: {
					x1: xs0,
					x2: xs0 - tickLength,
					y1: ys,
					y2: ys,
				},
			};
		}),
		...yAxisLabelTicks.map(y => {
			const ys = hyperbolaYScale(y);
			return {
				shape: "text",
				class: "axis axis-label y-axis-label",
				text: yAxisFormatter(y),
				attrs: {
					x: xs0 - 10,
					y: ys,
				},
			};
		}),
		{
			shape: "text",
			class: "axis hyperbola axis-label x-axis-label axis-name x-axis-name",
			text: "𝑥″",
			attrs: {
				x: hyperbolaXScale.range()[1] - 14,
				y: hyperbolaYScale(Y_0) + 5,
			},
		},
		{
			shape: "text",
			class: "axis hyperbola axis-label axis-name",
			text: "𝑡″",
			attrs: {
				x: hyperbolaXScale(0) + 10,
				y: hyperbolaYScale.range()[1] + 5,
				"text-anchor": "start",
				"dominant-baseline": "hanging",
			},
		},
	];

	return axisData;
}
applyGraphicalObjs(plotHyperbola, getHyperbolaAxisData(), { selector: ".axis" });

function getPlotAxisData() {
	const tickLength = 7;

	const xAxisTicks = xScale.ticks(20).filter(x => x !== X_0);
	const nXAxisLabels = 10;
	const xAxisLabelTicks = xScale
		.ticks(nXAxisLabels)
		.filter(x => x !== X_0)
		.slice(1, -1);
	const xAxisFormatter = xScale.tickFormat(nXAxisLabels);

	const yAxisTicks = yScale.ticks(15).filter(y => y !== Y_0);
	const nYAxisLabels = 7;
	const yAxisLabelTicks = yScale.ticks(nYAxisLabels).filter(y => y !== Y_0);
	const yAxisFormatter = yScale.tickFormat(nYAxisLabels, "~g");

	const xs0 = xScale(X_0);
	const ys0 = yScale(Y_0);

	const [xMin, xMax] = xScale.range();
	const [yMin, yMax] = yScale.range();

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xMin - 1.5,
				x2: xMax + 1.5,
				y1: ys0,
				y2: ys0,
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: yMin,
				y2: yMax,
			},
		},
		...xAxisTicks.map(x => {
			const xs = xScale(x);
			return {
				shape: "line",
				class: "axis axis-tick x-axis-tick",
				attrs: {
					x1: xs,
					x2: xs,
					y1: ys0,
					y2: ys0 + tickLength,
				},
			};
		}),
		...xAxisLabelTicks.map(x => {
			const xs = xScale(x);
			return {
				shape: "text",
				class: "axis axis-label x-axis-label",
				text: xAxisFormatter(x),
				attrs: {
					x: xs,
					y: ys0 + 12,
				},
			};
		}),
		...yAxisTicks.map(y => {
			const ys = yScale(y);
			return {
				shape: "line",
				class: "axis axis-tick y-axis-tick",
				attrs: {
					x1: xs0,
					x2: xs0 - tickLength,
					y1: ys,
					y2: ys,
				},
			};
		}),
		...yAxisLabelTicks.map(y => {
			const ys = yScale(y);
			return {
				shape: "text",
				class: "axis axis-label y-axis-label",
				text: yAxisFormatter(y),
				attrs: {
					x: xs0 - 10,
					y: ys,
				},
			};
		}),
		{
			shape: "text",
			class: "axis axis-label x-axis-label axis-name x-axis-name",
			text: "𝑧″",
			attrs: {
				x: xScale.range()[1] - 40,
				y: ys0 + 20,
			},
		},
		{
			shape: "text",
			class: "axis axis-label axis-name",
			text: "𝑥″",
			attrs: {
				x: xs0 + 15,
				y: yScale.range()[1] + 5,
				"text-anchor": "start",
				"dominant-baseline": "hanging",
			},
		},
	];

	return axisData;
}
applyGraphicalObjs(plot2D, getPlotAxisData(), { selector: ".axis" });

const maxV = +sliders.v.max;
const dopplerMaxMagnitude = Math.sqrt((1 + maxV) / (1 - maxV));
const colorInterpolator = d3.scalePow(
	[1 / dopplerMaxMagnitude, 1, dopplerMaxMagnitude],
	["#FF2200", "#FFF000", "#0090FF"],
);

function getHyperbolaDatum({ index, x0, y0, r, color }) {
	// const diff = (r - y0) ** 2 - y0 ** 2;
	const distToXppAxis = Math.abs(x0);
	if (r <= distToXppAxis) {
		return [];
	}

	const dy = Math.sqrt(r ** 2 - x0 ** 2);

	const yTop = x0 + dy;
	const yBot = x0 - dy;

	return [
		["top", yTop],
		["bot", yBot],
	].flatMap(([side, xVal]) => ({
		shape: "circle",
		class: `hyperbola dotdatumthing`,
		key: `hyper-${index}-${side}`,
		attrs: {
			cx: hyperbolaXScale(xVal),
			cy: hyperbolaYScale(r),
			r: 3,
			stroke: "black",
			fill: color,
		},
	}));
}

function getData2D() {
	const { v, dist: interSourceDistX, z0, gamma, Gamma, B } = sliderValues();
	const interSourceDistY = interSourceDistX * v * B * Gamma;

	const C = WIDTH / (X_MAX - X_MIN); // scale factor to make angles work out, idk

	const nLightSourcesLeft = Math.floor(Math.abs(X_MIN - X_0) / interSourceDistX);
	const nLightSourcesBelow = Math.floor(Math.abs(Y_MIN - Y_0) / interSourceDistY);

	const nLightSourcesRight = Math.floor(Math.abs(X_MAX - X_0) / interSourceDistX);
	const nLightSourcesAbove = Math.floor(Math.abs(Y_MAX - Y_0) / interSourceDistY);

	const nLightSourcesMid = 1;

	const nLightSourcesHorizontal =
		nLightSourcesLeft + nLightSourcesMid + nLightSourcesRight;
	const nLightSourcesVertical =
		nLightSourcesBelow + nLightSourcesMid + nLightSourcesAbove;

	const widerThanTall = nLightSourcesHorizontal <= nLightSourcesVertical;

	const nLightSources = widerThanTall
		? nLightSourcesHorizontal
		: nLightSourcesVertical;
	const nLightSourcesQuadrant1 = widerThanTall
		? nLightSourcesRight
		: nLightSourcesAbove;
	const nLightSourcesQuadrant3 = widerThanTall
		? nLightSourcesLeft
		: nLightSourcesBelow;

	const t0 = (nLightSourcesQuadrant1 * interSourceDistX * v * Gamma) / B;
	const t = currentTime - t0;

	const dopplerMagnitude = Math.sqrt((1 + v) / (1 - v));

	const hyperbolaData = [];

	const lightSourcesUnsorted = d3.range(nLightSources).flatMap(i => {
		const k = i - nLightSourcesQuadrant3;
		const x = k * interSourceDistX;
		const y = x * v * B * Gamma;

		const doppler = k < 0 ? "red-shift" : k === 0 ? "no-shift" : "blue-shift";

		const emissionTime = (-v * Gamma * x) / B;
		const tElapsed = t - emissionTime;
		const r = Math.max(tElapsed * C, 0);
		const attrs = {
			cx: xScale(x),
			cy: yScale(y),
			r,
		};

		const mod = ((k % 3) + 3) % 3;
		const dashStyle =
			mod === 0
				? "solid"
				: mod === 1
				? "dashed"
				: mod === 2
				? "dotted"
				: undefined;

		const color = colorInterpolator(dopplerMagnitude ** Math.sign(k));

		// const rUnscaled = yScale.invert(r) - Y_0;
		hyperbolaData.push({
			index: i,
			x0: x,
			y0: y,
			r: tElapsed,
			color,
		});

		const circleVisibility = tElapsed >= 0.01 ? "visible" : "hidden";
		const lightSourceVisibility = tElapsed >= 0.01 ? "visible" : "hidden";
		return [
			...["bg", "fg"].map(class_ => {
				const r = class_ === "bg" ? 6 : 4;

				return {
					shape: "circle",
					class: `data source-dot ${class_} ${doppler}`,
					key: `dot-${class_}-${i}`,
					kind: "dot",
					attrs: {
						...attrs,
						r,
						fill: color,
						visibility: lightSourceVisibility,
					},
				};
			}),
			{
				shape: "circle",
				class: "data source light-source bg",
				key: `lc-bg-${i}`,
				kind: "ring",
				attrs: { ...attrs, stroke: "black", visibility: circleVisibility },
			},
			{
				shape: "circle",
				class: `data source light-source fg ${dashStyle} ${doppler}`,
				key: `lc-fg-${i}`,
				kind: "ring",
				attrs: { ...attrs, stroke: color, visibility: circleVisibility },
			},
		];
	});

	const lightSources = (() => {
		const dots = lightSourcesUnsorted.filter(d => d.kind === "dot");
		const rings = lightSourcesUnsorted.filter(d => d.kind === "ring");

		return [...dots, ...rings];
	})();

	const z0s = xScale(z0);
	const zSourceR = Math.max((t - -v * z0) * C, 0);

	const zSources = (() => {
		const attrs = {
			cx: z0s,
			cy: y0s,
			r: zSourceR,
		};

		return ["bg", "fg"].map(class_ => ({
			shape: "circle",
			class: `data source z-source ${class_}`,
			key: `z-source-${class_}`,
			attrs,
		}));
	})();

	const DOT_BG_R = 6;
	const DOT_FG_R = 3;

	const zSourceDotY = zSourceR / C;

	const zSourceDots = (() => {
		const attrs = {
			cx: z0s,
			cy: yScale(zSourceDotY),
		};

		return ["bg", "fg"].map(class_ => {
			return {
				shape: "circle",
				class: `data dot z-dot ${class_}`,
				key: `z-dot-${class_}`,
				attrs: { ...attrs, r: class_ === "bg" ? DOT_BG_R : DOT_FG_R },
			};
		});
	})();

	const zs = xScale(z0);
	const zLine = {
		shape: "line",
		class: "data z-line",
		key: "z-line",
		attrs: {
			x1: zs,
			x2: zs,
			y1: yScale(Y_MIN),
			y2: yScale(Y_MAX),
		},
	};

	const slopeLines = (() => {
		const { x0, x1, x2, y0, y1, y2 } = (() => {
			let x0, x1, x2, y0, y1, y2;
			if (Math.abs(v) < 1e-5) {
				x0 = X_MIN;
				x1 = X_MIN;
				x2 = X_MAX;

				[y0, y1, y2] = [x0, x1, x2].map(x => gamma * (v * x + t));
			} else {
				y0 = Y_0;
				y1 = Y_MIN;
				y2 = Y_MAX;

				[x0, x1, x2] = [y0, y1, y2].map(y => (y / gamma - t) / v);
			}
			return { x0, x1, x2, y0, y1, y2 };
		})();

		return [-1, 1].flatMap(sign => {
			const signName = sign < 0 ? "neg" : "pos";

			const attrses = [
				{
					x1: xScale(x0),
					x2: xScale(x1),
					y1: yScale(sign * y0),
					y2: yScale(sign * y1),
				},
				{
					x1: xScale(x0),
					x2: xScale(x2),
					y1: yScale(sign * y0),
					y2: yScale(sign * y2),
				},
			];

			return attrses.flatMap((attrs, i) => {
				return ["bg", "fg"].map(class_ => ({
					shape: "line",
					class: `data slope-line ${class_} slope-line-${
						i + 1
					} slope-line-${signName}`,
					key: `slope-line-${class_}-${signName}`,
					attrs,
				}));
			});
		});
	})();

	const slopeLineYAtZ0 = gamma * (v * z0 + t);

	const slopeLineDots = (() => {
		const attrs = {
			cx: z0s,
			cy: yScale(slopeLineYAtZ0),
		};

		return ["bg", "fg"].map(class_ => {
			return {
				shape: "circle",
				class: `data dot slope-dot ${class_}`,
				key: `slope-dot-${class_}`,
				attrs: { ...attrs, r: class_ === "bg" ? DOT_BG_R : DOT_FG_R },
			};
		});
	})();

	const slopeLineConnectors = (() => {
		// y1 is closer to the x-axis
		const [y1abs, y2abs] = d3.sort([zSourceDotY, slopeLineYAtZ0]);

		if (t - -v * z0 < 0.1 || v === 0) {
			return [];
		}

		return [-1, 1].flatMap(sign => {
			const attrs = {
				x1: z0s,
				x2: z0s,
			};

			return ["bg", "fg"].map(class_ => {
				// dy should be half the difference between the bg and fg lines' stroke widths
				const dy = class_ === "bg" ? 2 : 0;
				const y1 = yScale(sign * y1abs) + sign * dy;
				const y2 = yScale(sign * y2abs) - sign * dy;

				const signName = sign < 0 ? "neg" : "pos";

				return {
					shape: "line",
					class: `data connector-line ${class_} connector-${signName}`,
					key: `connector-line-${class_} connector-line-${signName}`,
					attrs: { ...attrs, y1, y2 },
				};
			});
		});
	})();

	return {
		lights: [
			zLine,
			...lightSources,
			...zSources,
			...slopeLines,
			...zSourceDots,
			...slopeLineDots,
			...slopeLineConnectors,
		],
		hyperbola: hyperbolaData.flatMap(getHyperbolaDatum),
	};
	// const points = [];
	// for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
	// 	const x = wavefunctionPoints[2 * i];
	// 	const z = wavefunctionPoints[2 * i + 1];
	// 	points.push([xScale(x), yScale2D(z.magnitude ** 2)]);
	// }

	// const barrierX = xScale(currentLength);

	// const data = [
	// 	{
	// 		shape: "path",
	// 		class: "curve curve-background",
	// 		attrs: {
	// 			d: line(points),
	// 		},
	// 	},
	// 	{
	// 		shape: "path",
	// 		class: "curve curve-foreground",
	// 		attrs: {
	// 			d: line(points),
	// 		},
	// 	},
	// 	{
	// 		shape: "line",
	// 		class: "curve barrier",
	// 		attrs: {
	// 			x1: barrierX,
	// 			x2: barrierX,
	// 			y1: yScale2D(0),
	// 			y2: yScale2D(y2dMax),
	// 		},
	// 	},
	// ];
	// return data;
}

function update(dtMS) {
	dtMS = dtMS ?? 0;
	const speed = +sliders.speed.value;
	currentTime += (speed * dtMS) / 1000;

	const data = getData2D();
	applyGraphicalObjs(plot2D, data.lights, { key: d => d.key, selector: ".data" });
	applyGraphicalObjs(plotHyperbola, data.hyperbola, {
		key: d => d.key,
		selector: ".hyperbola.dotdatumthing",
	});

	// if (typeof katex !== "undefined") {
	// 	katex.render(`m=${floatFormatter(m)}`, textSpans.m);
	// 	katex.render(`\\sigma=${floatFormatter(sigma)}`, textSpans.sigma);
	// 	katex.render(`p=${floatFormatter(p)}`, textSpans.p);
	// }
}

update();

let isAnimating = false;
let animationFrame;
// eslint-disable-next-line no-unused-vars
function play() {
	isAnimating = true;

	d3.selectAll(".slider.disablable").property("disabled", true);

	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		update(elapsedMS);

		if (isAnimating) {
			animationFrame = window.requestAnimationFrame(step);
		}
	}

	animationFrame = window.requestAnimationFrame(step);
}

function pause() {
	window.cancelAnimationFrame(animationFrame);
	isAnimating = false;
}

// eslint-disable-next-line no-unused-vars
function reset() {
	pause();
	d3.selectAll(".slider").property("disabled", false);
	currentTime = 0;
	update(0, true);
}
