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

const T_MIN = 0;
const T_MAX = 1;

const timeSlider = (() => {
	const slider = document.getElementById("slider-t");

	slider.step = 0.001;
	slider.min = T_MIN;
	slider.max = T_MAX;
	slider.value = 0.1;

	slider.oninput = update;

	return slider;
})();

const TIME_INIT = 0.106;

const OBJECTS = [
	[-24, 1, "Radius of 1MeV neutrino"],
	[-21, 20.8, "Width of cosmic string (upper bound)"],
	[-19, 30.6, "de Broglie wavelength of protons at LHC"],
	[-17, 39, "Range of the Weak Force"],
	[-15, 43.8, "Proton radius"],
	[-12, 50.6, "Wavelength of hydrogen"],
	[-10, 60.4, "Atomic radius"],
	[-9, 67.4, "DNA helix"],
	[-6, 70.4, "Bacterium"],
	[-2, 80.4, "Marble"],
	[1.7, 93.3, "Human being"],
].map(([sizeMetersPow10, timeScale, name]) => ({
	size: sizeMetersPow10,
	time: timeScale,
	name,
}));

const graphSizeScale = d3.scaleLinear([T_MIN, T_MAX], [-23, 2.5]);

const N_OBJECTS = OBJECTS.length;

const timeScale = d3.scaleLinear(
	[T_MIN, T_MAX],
	[d3.min(OBJECTS, o => o.time), d3.max(OBJECTS, o => o.time)],
);

function infoFromUnscaledTime(t) {
	const scaledTime = timeScale(t);

	for (let i = 0; i < N_OBJECTS - 1; i++) {
		const { size: size1, time: time1 } = OBJECTS[i];
		const { size: size2, time: time2 } = OBJECTS[i + 1];
		if (time1 <= scaledTime && scaledTime <= time2) {
			const timeToSizescale = d3.scaleLinear([time1, time2], [size1, size2]);
			const scaledSize = timeToSizescale(scaledTime);
			return {
				lower: OBJECTS[i],
				upper: OBJECTS[i + 1],
				size: scaledSize,
				time: scaledTime * TIME_INIT,
				sizeAtEdge: graphSizeScale(t),
				sizeAtOrigin: graphSizeScale(t) - 2,
			};
		}
	}
}

function getData(info) {
	const { lower, upper, size, time } = info;
	console.log(info);
	const circleRad = 0.9 * (X_MAX - X_C);
	const bgData = [
		{
			shape: "line",
			class: "axis",
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
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: yScale(Y_C),
				y2: yScale(Y_C),
			},
		},
		{
			shape: "circle",
			class: "circle-bd",
			attrs: {
				cx: xScale(X_C),
				cy: yScale(Y_C),
				r: xScale(circleRad) - xScale(X_C),
			},
		},
	];

	// const markerX =
	// const variableData =

	return [...bgData];
}

function update() {
	const t = +timeSlider.value;
	const info = infoFromUnscaledTime(t);
	applyGraphicalObjs(canvas, getData(info));
}

update();
