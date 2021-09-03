/* global applyGraphicalObjs */

const WIDTH = 600;
const HEIGHT = WIDTH;
const MARGIN = 10;

const canvas = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

const X_MIN = -1;
const X_C = 0;
const X_MAX = 1;
const xScale = d3.scaleLinear(
	[X_MIN, X_MAX].map(x => 1.1 * x),
	[MARGIN, WIDTH - MARGIN],
);

const Y_MIN = -1;
const Y_C = 0;
const Y_MAX = 1;
const yScale = d3.scaleLinear(
	[Y_MIN, Y_MAX].map(y => 1.1 * y),
	[HEIGHT - MARGIN, MARGIN],
);

const CIRCLE_RADIUS = 0.9 * (X_MAX - X_C);

const T_MIN = 0;
const T_MAX = 1;

const timeSlider = (() => {
	const slider = document.getElementById("slider-t");

	slider.step = 0.001;
	slider.min = T_MIN;
	slider.max = T_MAX;
	slider.value = T_MIN;

	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;

	return slider;
})();

const labels = {
	age: document.getElementById("text-age"),
	sizeMantissa: document.getElementById("text-size-mantissa"),
	sizeExp: document.getElementById("text-size-exp"),
};

const TIME_INIT = 0.106;

const OBJECTS = [
	[-24, 1, "Radius of 1MeV neutrino"],
	[-21, 20.8, ["Width of cosmic string", "(upper bound)"]],
	[-19, 30.6, ["de Broglie wavelength", "of protons at LHC"]],
	[-17, 39, ["Range of the", "Weak Force"]],
	[-15, 43.8, "Proton radius"],
	[-12, 50.6, "Wavelength of hydrogen"],
	[-10, 60.4, ["Atomic", "radius"]],
	[-9, 67.4, "DNA helix"],
	[-6, 70.4, "Bacterium"],
	[-2, 80.4, "Marble"],
	[1.7, 93.3, "Human being"],
].map(([sizeMetersPow10, timeScale, fullName]) => ({
	size: sizeMetersPow10,
	time: timeScale,
	fullName,
	name: Array.isArray(fullName) ? fullName.join(" ") : fullName,
}));

const N_OBJECTS = OBJECTS.length;

const timeScale = d3.scaleLinear(
	[T_MIN, T_MAX],
	[d3.min(OBJECTS, o => o.time), d3.max(OBJECTS, o => o.time)],
);

const fmtPower = d3.format("d");

function infoFromUnscaledTime(t) {
	const scaledTime = timeScale(t);

	for (let i = 0; i < N_OBJECTS - 1; i++) {
		const { size: size1, time: time1 } = OBJECTS[i];
		const { size: size2, time: time2 } = OBJECTS[i + 1];
		if (time1 <= scaledTime && scaledTime <= time2) {
			const timeToSizescale = d3.scaleLinear([time1, time2], [size1, size2]);
			const scaledSize = timeToSizescale(scaledTime);
			return {
				// lower: OBJECTS[i],
				// upper: OBJECTS[i + 1],
				size: scaledSize,
				time: scaledTime * TIME_INIT,
				sizeAtOrigin: scaledSize - 1.5,
				sizeAtEdge: scaledSize + 1.5,
			};
		}
	}
}

function getData(info) {
	const { sizeAtOrigin, sizeAtEdge } = info;
	// console.log(info);
	const bgData = [
		{
			shape: "line",
			class: "axis",
			id: "x-axis",
			attrs: {
				x1: xScale(X_C),
				x2: xScale(X_C),
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		{
			shape: "line",
			class: "axis",
			id: "y-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: yScale(Y_C),
				y2: yScale(Y_C),
			},
		},
		{
			shape: "text",
			class: "text y-axis-lab",
			text: "Radius (m)",
			attrs: {
				x: xScale(X_C),
				y: yScale(CIRCLE_RADIUS),
				dx: 10,
				dy: -10,
				"text-anchor": "begin",
			},
		},
	];

	const includedObjects = OBJECTS.filter(
		o => sizeAtOrigin < o.size && o.size < sizeAtEdge,
	);
	const sizeToXScale = d3.scaleLinear(
		[sizeAtOrigin, sizeAtEdge],
		[X_C, CIRCLE_RADIUS],
	);
	const xOpacityScale = d3
		.scalePow(
			[sizeAtOrigin, (sizeAtOrigin + sizeAtEdge) / 2, sizeAtEdge],
			[0.1, 1, 0.1],
		)
		.exponent(0.5);
	const yOpacityScale = d3
		.scalePow(
			[
				sizeAtOrigin,
				(sizeAtOrigin + sizeAtEdge) / 2,
				sizeAtOrigin * 0.1 + sizeAtEdge * 0.9,
				sizeAtEdge,
			],
			[0.5, 0.95, 1, 0.05],
		)
		.exponent(0.5);

	const x0s = xScale(X_C);
	const y0s = yScale(Y_C);
	const tickLength = 10;

	const xObjs = includedObjects.flatMap(o => {
		const xs = xScale(sizeToXScale(o.size));

		const tick = {
			shape: "line",
			class: "tick x-tick",
			id: `tick-x-${o.name}`,
			attrs: {
				x1: xs,
				x2: xs,
				y1: y0s,
				y2: y0s + tickLength,
			},
		};

		const textYs = y0s + tickLength + 15;
		const text = {
			shape: "text",
			class: "text name",
			id: `label-${o.name}`,
			attrs: {
				x: xs,
				y: textYs,
				"font-size": 14,
				opacity: xOpacityScale(o.size),
			},
		};
		if (Array.isArray(o.fullName)) {
			text.children = o.fullName.map((part, i) => ({
				shape: "tspan",
				class: "subname",
				text: part,
				attrs: {
					x: xs,
					y: textYs,
					dy: i * 20,
				},
			}));
		} else {
			text.text = o.name;
		}

		return [tick, text];
	});

	const lowerSize = Math.ceil(sizeAtOrigin);
	const upperSize = Math.floor(sizeAtEdge);
	const yObjs = d3.range(lowerSize, upperSize + 1).flatMap(pow => {
		const ys = yScale(sizeToXScale(pow));

		const tick = {
			shape: "line",
			class: "tick y-tick",
			id: `tick-y-${pow}`,
			attrs: {
				x1: x0s,
				x2: x0s - tickLength,
				y1: ys,
				y2: ys,
			},
		};

		const text = {
			shape: "text",
			class: "text y-tick-label",
			attrs: {
				x: x0s - tickLength - 8,
				y: ys,
				"font-size": 14,
				dy: ".25em",
				opacity: yOpacityScale(pow),
			},
			children: [
				{
					shape: "tspan",
					text: "10",
				},
				{
					shape: "tspan",
					class: "t-sup",
					text: fmtPower(pow),
					attrs: { "font-size": 10, dx: ".2em", dy: "-.65em" },
				},
			],
		};

		return [tick, text];
	});

	// console.log(includedObjects, xObjs);

	const data = [
		...bgData,
		...xObjs,
		...yObjs,
		{
			shape: "circle",
			class: "circle-bd",
			id: "round-boi",
			attrs: {
				cx: xScale(X_C),
				cy: yScale(Y_C),
				r: xScale(CIRCLE_RADIUS) - xScale(X_C),
			},
		},
	];

	for (const datum of data) {
		datum.class = [datum.class ?? null, "graph-obj"].join(" ");
	}

	return data;
}

const formatFloat = d3.format(".3f");
const formatInt = d3.format("d");

function update() {
	const t = +timeSlider.value;
	const info = infoFromUnscaledTime(t);

	applyGraphicalObjs(canvas, getData(info), {
		selector: ".graph-obj",
		key: d => d.id,
	});

	labels.age.innerText = formatFloat(info.time);

	const universeSizeNicedLog10 = Math.floor(info.sizeAtEdge);
	const mantissa = Math.pow(10, info.sizeAtEdge - universeSizeNicedLog10);

	labels.sizeMantissa.innerText = formatFloat(mantissa);
	labels.sizeExp.innerText = formatInt(universeSizeNicedLog10);
}

update();
