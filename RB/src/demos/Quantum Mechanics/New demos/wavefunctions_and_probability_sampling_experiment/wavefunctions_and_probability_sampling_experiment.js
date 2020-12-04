/* global applyGraphicalObjs */

const X_MAX = 1.1;
const X_MIN = -X_MAX;
const X_0 = 0;
const X_WIDTH = X_MAX - X_MIN;

const WAVEF_Y_MIN = -0.1;
const Y_MAX = 1.5;
const Y_0 = 0;
const Y_WIDTH = Y_MAX - WAVEF_Y_MIN;

const _ASPECT_RATIO = X_WIDTH / Y_WIDTH;

const _SMALL_WIDTH = 400;
const _SMALL_HEIGHT = _SMALL_WIDTH / _ASPECT_RATIO;
const WAVEF_WIDTH = _SMALL_WIDTH;
const WAVEF_HEIGHT = _SMALL_HEIGHT;

const _BIG_WIDTH = 900;
const _BIG_HEIGHT = _BIG_WIDTH / _ASPECT_RATIO;
const PROBA_WIDTH = _BIG_WIDTH;
const PROBA_HEIGHT = _BIG_HEIGHT;

const N_PIXELS_PER_CURVE_POINT = 3;

const _margin = 5;

const wavefXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, WAVEF_WIDTH - _margin]);
const wavefYScale = d3.scaleLinear(
	[WAVEF_Y_MIN, Y_MAX],
	[WAVEF_HEIGHT - _margin, _margin],
);

const _wavefXAxisY = wavefYScale(Y_0);

const probaXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, PROBA_WIDTH - _margin]);
const probaYScale = d3.scaleLinear(
	[Y_0, Y_MAX],
	[_wavefXAxisY + PROBA_HEIGHT - WAVEF_HEIGHT, _margin],
);

const PROBA_Y_MIN = probaYScale.invert(PROBA_HEIGHT - _margin);

const WAVEFUNCTION = "wavefunction";
const PROBABILITY = "probability";

const wavefPlot = d3
	.select("#wavefunction-plot")
	.datum({ name: WAVEFUNCTION })
	.attr("width", WAVEF_WIDTH)
	.attr("height", WAVEF_HEIGHT);
const probaPlot = d3
	.select("#experiment-plot")
	.datum({ name: PROBABILITY })
	.attr("width", PROBA_WIDTH)
	.attr("height", PROBA_HEIGHT);

const MIN_NUM_MEASUREMENTS = 30;
const MAX_NUM_MEASUREMENTS = 80;
function sliderScale(value) {
	// eslint-disable-next-line no-use-before-define
	value = value ?? +numMeasurementsSlider.value;

	if (value === MAX_NUM_MEASUREMENTS) {
		return Infinity;
	}
	return (
		MIN_NUM_MEASUREMENTS -
		Math.floor(1.1 ** MIN_NUM_MEASUREMENTS) +
		Math.floor(1.1 ** value)
	);
}

const numMeasurementsTextSpan = document.getElementById("num-measurements-text");
function updateNumMeasurementsText() {
	const value = +(this.value ?? MIN_NUM_MEASUREMENTS);
	const scaledValue = sliderScale(value);
	const scaledText = isFinite(scaledValue) ? `${scaledValue}` : "Infinite";
	numMeasurementsTextSpan.innerText = scaledText;
}

const numMeasurementsSlider = (() => {
	const slider = document.getElementById("number-of-measurements-slider");
	slider.min = MIN_NUM_MEASUREMENTS;
	slider.max = MAX_NUM_MEASUREMENTS;
	slider.step = 1;
	slider.value = MIN_NUM_MEASUREMENTS;
	slider.oninput = updateNumMeasurementsText;
	return slider;
})();

updateNumMeasurementsText.call(numMeasurementsSlider);

function getAxesData({ name, f, width, nPixelsPerCurvePoint }) {
	width = +width;
	const nPoints = width / (nPixelsPerCurvePoint ?? N_PIXELS_PER_CURVE_POINT);

	let yMin, xScale, yScale, yAxisText;
	if (name === WAVEFUNCTION) {
		yMin = WAVEF_Y_MIN;
		xScale = wavefXScale;
		yScale = wavefYScale;
		yAxisText = "𝜓(𝑥)";
	} else if (name === PROBABILITY) {
		yMin = PROBA_Y_MIN;
		xScale = probaXScale;
		yScale = probaYScale;
		yAxisText = "|𝜓(𝑥)|²";
	} else {
		throw new Error(`Invalid plot ${name}`);
	}

	const line = d3.line().curve(d3.curveLinear);
	const pathPoints = d3.range(nPoints).map(i => {
		const x = X_MIN + (i / (nPoints - 1)) * X_WIDTH;
		const y = f(x);
		return [xScale(x), yScale(y)];
	});
	const path = line(pathPoints);

	const data = [
		{
			shape: "line",
			classes: ["axis", "axis-axis", "x-axis"],
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: yScale(Y_0),
				y2: yScale(Y_0),
			},
		},
		{
			shape: "line",
			classes: ["axis", "axis-axis", "y-axis"],
			attrs: {
				x1: xScale(X_0),
				x2: xScale(X_0),
				y1: yScale(yMin),
				y2: yScale(Y_MAX),
			},
		},
		{
			shape: "path",
			classes: ["axis", "axis-curve"],
			attrs: {
				d: path,
			},
		},
		{
			shape: "text",
			text: "𝑥",
			classes: ["axis", "axis-label", "axis-x-label"],
			attrs: {
				x: xScale(X_MAX) - 15,
				y: yScale(Y_0) + 20,
			},
		},
		{
			shape: "text",
			text: yAxisText,
			classes: ["axis", "axis-label", "axis-y-label"],
			attrs: {
				x: xScale(X_0) + 10,
				y: yScale(Y_MAX) + 20,
			},
		},
	];

	return data;
}

function gaussian(x) {
	const mu = 0;
	const sigma = 0.3;
	return Math.exp(-0.5 * ((x - mu) / sigma) ** 2) / (2 * Math.PI * sigma ** 2) ** 0.5;
}

// https://en.wikipedia.org/wiki/Box–Muller_transform
function gaussianSample() {
	const rand = Math.random;
	let u = rand(),
		v = rand();
	while (u === 0) {
		u = rand();
	}
	while (v === 0) {
		v = rand();
	}
	return Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);
}

function triangle(x) {
	return Math.max(0, 1 - Math.abs(x));
}

// CDF of triangle function y=1-abs(x) is Piecewise[{{1/2+x+x^2/2, x<0}, {1/2+x-x^2/2, x>0}}] for -1<x<1
function triangleSample() {
	const y = Math.random();
	if (y < 0.5) {
		// solve .5+x+x^2/2 = y; you get two solutions; take the larger one
		return (2 * y) ** 0.5 - 1;
	} else {
		// solve .5+x-x^2/2 = y; you get two solutions; take the smaller one
		return 1 - (2 - 2 * y) ** 0.5;
	}
}

function _squareThreshold(magnitude) {
	return 1 / (2 * magnitude);
}

function _genericSquare(x, magnitude) {
	const threshold = _squareThreshold(magnitude);
	return Math.abs(x) > threshold ? 0 : magnitude;
}

// CDF of square is line with slope `magnitude` passing through (0, .5)
function _genericSquareSample(magnitude) {
	// if y = .5 + m*x, then x = (y - .5)/m
	const y = Math.random();
	return (y - 0.5) / magnitude;
}

const SQUARE_MAGNITUDE = 0.8;
function square(x) {
	return _genericSquare(x, SQUARE_MAGNITUDE);
}

function squareSample() {
	return _genericSquareSample(SQUARE_MAGNITUDE);
}

const SMALL_SQUARE_MAGNITUDE = 1.3;
function smallSquare(x) {
	return _genericSquare(x, SMALL_SQUARE_MAGNITUDE);
}

function smallSquareSample() {
	return _genericSquareSample(SMALL_SQUARE_MAGNITUDE);
}

const probabilityDistributions = {
	gaussian,
	triangle,
	square,
	smallSquare,
};

const samplingFunctions = {
	gaussian: gaussianSample,
	triangle: triangleSample,
	square: squareSample,
	smallSquare: smallSquareSample,
};

const supports = {
	gaussian: [X_MIN, X_MAX],
	triangle: [-1, 1],
	square: [-1, 1].map(sign => sign * _squareThreshold(SQUARE_MAGNITUDE)),
	smallSquare: [-1, 1].map(sign => sign * _squareThreshold(SMALL_SQUARE_MAGNITUDE)),
};

let selectedProbDist;
function update(probDistName) {
	selectedProbDist = probDistName;
	const baseFunc = probabilityDistributions[probDistName];

	d3.selectAll(".plot").each(function (d) {
		const { name } = d;
		const f = name === "probability" ? x => baseFunc(x) ** 0.5 : baseFunc;
		const sel = d3.select(this);
		const data = getAxesData({ name, width: sel.attr("width"), f });
		applyGraphicalObjs(sel, data, { selector: ".axis" });
	});
}

function takeMeasurementAndReturnNewData({
	samplingFunc,
	bucketScale,
	buckets,
	scale,
}) {
	const sample = samplingFunc();
	const bucketIndex = bucketScale(sample);
	buckets[bucketIndex].n += 1;

	const scaledX0 = probaXScale(X_0);
	return buckets.map(bucket => {
		const height = bucket.n * scale;
		const scaledHeight = probaYScale(height);
		return {
			shape: "rect",
			classes: ["experiment-bucket"],
			attrs: {
				x: probaXScale(bucket.x),
				y: scaledHeight,
				width: probaXScale(bucket.width) - scaledX0,
				height: scaledHeight,
			},
		};
	});
}

// Will be adjusted to evenly divide the given probability function's support
const APPROX_BUCKET_WIDTH = 0.05;

function runExperiment() {
	const nMeasurements = sliderScale();

	const [supportMin, supportMax] = supports[selectedProbDist];
	const supportWidth = supportMax - supportMin;

	// Round bucket width down to next number that divides the width of the support
	const bucketWidth = supportWidth / Math.ceil(supportWidth / APPROX_BUCKET_WIDTH);

}

update("gaussian");
