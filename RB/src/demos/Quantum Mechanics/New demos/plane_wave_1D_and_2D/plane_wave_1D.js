/* global applyGraphicalObjs Complex */

const WIDTH = 800;
const HEIGHT = 400;

const X_MIN = -12.2;
const X_0 = 0;
const X_MAX = -X_MIN;

const Y_MIN = -1.1;
const Y_0 = 0;
const Y_MAX = 1.1;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

const curveGenerator = d3
	.line()
	.curve(d3.curveCatmullRom)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

const phaseLineGenerator = d3
	.line()
	.curve(d3.curveLinear)
	.defined(p => p !== null)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

let currentTimeMS = 0;
let isAnimating = false;

const DISPERSION = {
	nonrelativistic: 0,
	relativistic: 1,
	free: 2,
};

let currentDispersion = DISPERSION.nonrelativistic;
let prevOmega;

const omegaSlider = (() => {
	const slider = document.getElementById("slider-omega");
	slider.min = 0;
	slider.max = 5;
	slider.step = 0.0001;
	slider.oninput = function () {
		const phaseAtX0 = prevOmega * (currentTimeMS / 1000);
		const currOmega = +this.value;
		currentTimeMS = (phaseAtX0 / currOmega) * 1000;
		prevOmega = currOmega;
	};
	return slider;
})();

const wavenumberSlider = (() => {
	const slider = document.getElementById("slider-wavenumber");
	slider.min = 0.01;
	slider.max = 2;
	slider.step = 0.0001;
	slider.value = 1;
	slider.oninput = function () {
		// eslint-disable-next-line no-use-before-define
		updateOmega();
		// eslint-disable-next-line no-use-before-define
		update();
	};
	return slider;
})();

const nonRelativisticDispersionScale = d3
	.scalePow(
		[+wavenumberSlider.min, +wavenumberSlider.max],
		[+omegaSlider.min, +omegaSlider.max],
	)
	.exponent(2);

const relativisticDispersionScale = d3.scaleLinear(
	[+wavenumberSlider.min, +wavenumberSlider.max],
	[+omegaSlider.min, +omegaSlider.max],
);

function updateOmega() {
	if (currentDispersion === DISPERSION.free) {
		return;
	}

	const wavenumber = +wavenumberSlider.value;
	let currOmega;

	if (currentDispersion === DISPERSION.nonrelativistic) {
		currOmega = nonRelativisticDispersionScale(wavenumber);
	} else if (currentDispersion === DISPERSION.relativistic) {
		currOmega = relativisticDispersionScale(wavenumber);
	} else {
		throw new Error(`Unexpected dispersion ${currentDispersion}`);
	}

	if (prevOmega !== undefined && currOmega !== 0) {
		const phaseAtX0 = prevOmega * (currentTimeMS / 1000);
		currentTimeMS = (phaseAtX0 / currOmega) * 1000;
	}

	omegaSlider.value = currOmega;
	prevOmega = currOmega;
}

function setDispersion(value) {
	currentDispersion = value;
	omegaSlider.disabled = true;
	updateOmega();
}

// eslint-disable-next-line no-unused-vars
function setDispersionNonrelativistic() {
	setDispersion(DISPERSION.nonrelativistic);
}

// eslint-disable-next-line no-unused-vars
function setDispersionRelativistic() {
	setDispersion(DISPERSION.relativistic);
}

// eslint-disable-next-line no-unused-vars
function setDispersionFree() {
	currentDispersion = DISPERSION.free;
	omegaSlider.disabled = false;
}

setDispersionNonrelativistic();

function getAxisData() {
	const tickLength = 7;

	const xAxisTicks = xScale.ticks(20).filter(x => x !== X_0);
	const nXAxisLabels = 5;
	const xAxisLabelTicks = xScale.ticks(nXAxisLabels).filter(x => x !== X_0);
	const xAxisFormatter = xScale.tickFormat(nXAxisLabels);

	const yAxisTicks = yScale.ticks(5).filter(y => y !== Y_0);
	const nYAxisLabels = 5;
	const yAxisLabelTicks = yScale.ticks(nYAxisLabels).filter(y => y !== Y_0);
	const yAxisFormatter = yScale.tickFormat(nYAxisLabels, "~g");

	const xs0 = xScale(X_0);
	const ys0 = yScale(Y_0);

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
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
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
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
			class: "axis axis-label x-axis-label x-axis-name",
			text: "𝑡",
			attrs: {
				x: xScale(X_MAX) - 40,
				y: ys0 + 10,
			},
		},
	];

	return axisData;
}
applyGraphicalObjs(plot, getAxisData(), { selector: ".axis" });

function getData() {
	const wavenumber = +wavenumberSlider.value;
	const omega = +omegaSlider.value;

	const tSec = currentTimeMS / 1000; // currentPhase / omega; // timeMS / 1000;

	const nPointsPerPeriod = 35;

	const periodWidth = (2 * Math.PI) / wavenumber;
	const nPeriods = Math.ceil((X_MAX - X_MIN) / periodWidth);
	const dx = periodWidth / (nPointsPerPeriod - 1);

	const curvePoints = []; // list of points [x, real, imag]
	for (let p = 0; p < nPeriods; ++p) {
		const periodX0 = X_MIN + p * periodWidth;
		for (let i = 0; i < nPointsPerPeriod; ++i) {
			const x = periodX0 + i * dx;
			const phase = wavenumber * x - omega * tSec;

			const z = Complex.cis(phase);
			const re = z.x;
			const im = z.y;

			curvePoints.push({ x, re, im });
		}
	}

	function nForX(x) {
		return (wavenumber * x - omega * tSec) / (2 * Math.PI);
	}
	const nMin = Math.floor(nForX(X_MIN));
	const nMax = Math.ceil(nForX(X_MAX));

	const phaseCurvePoints = d3.range(nMin, nMax + 1).flatMap(n => {
		const xMid = (omega * tSec + 2 * Math.PI * n) / wavenumber;
		const xMin = xMid - periodWidth / 2;
		const xMax = xMid + periodWidth / 2;
		return [[xMin, -1], [xMax, 1], null];
	});

	const curveData = [
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} phase`,
			attrs: {
				d: phaseLineGenerator(phaseCurvePoints),
			},
		})),
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} imag-part`,
			attrs: {
				d: curveGenerator(curvePoints.map(({ x, im }) => [x, im])),
			},
		})),
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} real-part`,
			attrs: {
				d: curveGenerator(curvePoints.map(({ x, re }) => [x, re])),
			},
		})),
	];

	return curveData;
}

function update() {
	applyGraphicalObjs(plot, getData(), { selector: ".curve" });
}

update();

let animationFrame;
// eslint-disable-next-line no-unused-vars
function play() {
	isAnimating = true;
	wavenumberSlider.disabled = true;

	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		currentTimeMS += elapsedMS;
		// currentPhase += (elapsedMS / 1000) * +omegaSlider.value;
		prevTimestampMS = timestampMS;

		update();

		if (isAnimating) {
			animationFrame = window.requestAnimationFrame(step);
		}
	}

	animationFrame = window.requestAnimationFrame(step);
}

function stop() {
	window.cancelAnimationFrame(animationFrame);
	isAnimating = false;
	wavenumberSlider.disabled = false;
}

// eslint-disable-next-line no-unused-vars
function reset() {
	stop();
	currentTimeMS = 0;
	update();
}
