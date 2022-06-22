/* global applyGraphicalObjs katex */
const WIDTH = 800;
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

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);
const y0s = yScale(Y_0);

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
	const gamma = 1 / Math.sqrt(1 - v ** 2);

	const R = +sliders.R.value;
	const dist = 2 * gamma * Math.PI * R;
	return { v, R, z0: +sliders.z0.value, gamma, dist };
}

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => update(0, true));

function getAxisData() {
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
				x1: xMin,
				x2: xMax,
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
			text: "𝑧′",
			attrs: {
				x: xScale.range()[1] - 40,
				y: ys0 + 20,
			},
		},
		{
			shape: "text",
			class: "axis axis-label axis-name",
			text: "𝑥′",
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
applyGraphicalObjs(plot2D, getAxisData(), { selector: ".axis" });

const maxV = +sliders.v.max;
const dopplerMaxMagnitude = Math.sqrt((1 + maxV) / (1 - maxV));
const colorInterpolator = d3.scalePow(
	[1 / dopplerMaxMagnitude, 1, dopplerMaxMagnitude],
	["#FF2200", "#FFF000", "#0090FF"],
);

function getData2D() {
	const { v, dist: interSourceDist, z0, gamma } = sliderValues();
	const C = WIDTH / (X_MAX - X_MIN); // scale factor to make angles work out, idk

	const nLightSourcesLeft = Math.floor(Math.abs(X_MIN - X_0) / interSourceDist);
	const nLightSourcesRight = Math.floor(Math.abs(X_MAX - X_0) / interSourceDist);
	const nLightSourcesMid = 1;
	const nLightSources = nLightSourcesLeft + nLightSourcesMid + nLightSourcesRight;

	const t0 = nLightSourcesRight * interSourceDist * v;
	const t = currentTime - t0;

	const dopplerMagnitude = Math.sqrt((1 + v) / (1 - v));
	console.log(
		dopplerMagnitude,
		dopplerMaxMagnitude,
		colorInterpolator(dopplerMagnitude),
	);

	const lightSources = d3.range(nLightSources).flatMap(i => {
		const k = i - nLightSourcesLeft;
		const x = k * interSourceDist;

		const doppler = k < 0 ? "red-shift" : k === 0 ? "no-shift" : "blue-shift";

		const emissionTime = -v * x;
		const r = Math.max((t - emissionTime) * C, 0);
		const attrs = {
			cx: xScale(x),
			cy: y0s,
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

		return [
			{
				shape: "circle",
				class: "data source light-source bg",
				key: `lc-bg-${i}`,
				attrs: { ...attrs, stroke: "black" },
			},
			{
				shape: "circle",
				class: `data source light-source fg ${dashStyle} ${doppler}`,
				key: `lc-fg-${i}`,
				attrs: { ...attrs, stroke: color },
			},
			...["bg", "fg"].map(class_ => {
				const r = class_ === "bg" ? 6 : 4;

				return {
					shape: "circle",
					class: `data source-dot ${class_} ${doppler}`,
					attrs: { ...attrs, r, fill: color },
				};
			}),
		];
	});

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

		if (t - -v * z0 < 0.1) {
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

	return [
		zLine,
		...lightSources,
		...zSources,
		...slopeLines,
		...zSourceDots,
		...slopeLineDots,
		...slopeLineConnectors,
	];
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

	applyGraphicalObjs(plot2D, getData2D(), { key: d => d.key, selector: ".data" });

	// if (typeof katex !== "undefined") {
	// 	katex.render(`m=${floatFormatter(m)}`, textSpans.m);
	// 	katex.render(`\\sigma=${floatFormatter(sigma)}`, textSpans.sigma);
	// 	katex.render(`p=${floatFormatter(p)}`, textSpans.p);
	// }
}

update(0, true);

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
