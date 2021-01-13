/* global sampleFromCdf */

const WIDTH = 925;
const HEIGHT_EXPECTED = 150;
const HEIGHT_ACTUAL = 500;

const DPI = window.devicePixelRatio;

d3.select("#plot-expected")
	.style("width", `${WIDTH}px`)
	.style("height", `${HEIGHT_EXPECTED}px`);
d3.select("#plot-actual")
	.style("width", `${WIDTH}px`)
	.style("height", `${HEIGHT_ACTUAL}px`);

const canvasExpected = document.getElementById("plot-expected");
canvasExpected.width = WIDTH * DPI;
canvasExpected.height = HEIGHT_EXPECTED * DPI;
const contextExpected = canvasExpected.getContext("2d");

const canvasActual = document.getElementById("plot-actual");
canvasActual.width = WIDTH * DPI;
canvasActual.height = HEIGHT_ACTUAL * DPI;
const contextActual = canvasActual.getContext("2d");

const X_MIN = -1e-1;
const X_MAX = -X_MIN;

const Y_MIN = 0;
const Y_MAX = 1;

const L = 1;

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const margin = 5 * DPI;
const yScaleExpected = d3.scaleLinear(
	[Y_MIN, Y_MAX],
	[HEIGHT_EXPECTED - margin, margin],
);
const yScaleActual = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT_ACTUAL - margin, margin]);

const colorScale = t =>
	d3.interpolateRgb(d3.interpolateSinebow((1 - t) * 0.7), "white")(0.05);

const wavelengthScale = d3.scaleLinear([0, 1], [400e-9, 700e-9]);

const wavelengthSlider = (() => {
	const slider = document.getElementById("slider-wavelength");
	const [min, max] = wavelengthScale.domain();
	slider.min = min;
	slider.max = max;
	slider.step = 0.0001;
	slider.value = (min + max) / 2;

	const wavelenthFormatter = (() => {
		const intFormatter = d3.format(".3r");
		return wavelengthMeters => intFormatter(wavelengthMeters * 1e9);
	})();
	const wavelengthTextSpan = document.getElementById("text-wavelength");

	slider.oninput = function () {
		const wavelength = +this.value;
		wavelengthTextSpan.innerText = wavelenthFormatter(wavelengthScale(wavelength));
		// eslint-disable-next-line no-use-before-define
		update();
	};
	wavelengthTextSpan.innerText = wavelenthFormatter(wavelengthScale(+slider.value));

	return slider;
})();

const slitSepScale = d3.scaleLinear([0, 1], [20e-6, 40e-6]);

const slitSepSlider = (() => {
	const slider = document.getElementById("slider-slit-sep");
	const [min, max] = wavelengthScale.domain();
	slider.min = min;
	slider.max = max;
	slider.step = 0.0001;
	slider.value = (min + max) / 2;

	const slitSepFormatter = (() => {
		const intFormatter = d3.format(".3r");
		return slitSepMeters => intFormatter(slitSepMeters * 1e6);
	})();
	const slitSepTextSpan = document.getElementById("text-slit-sep");

	slider.oninput = function () {
		const slitSep = +this.value;
		slitSepTextSpan.innerText = slitSepFormatter(slitSepScale(slitSep));
		// eslint-disable-next-line no-use-before-define
		update();
	};
	slitSepTextSpan.innerText = slitSepFormatter(slitSepScale(+slider.value));

	return slider;
})();

const numPhotonsScale = d3.scaleLinear().domain([0, 1]).rangeRound([500, 10000]);

const numPhotonsSlider = (() => {
	const slider = document.getElementById("slider-num-photons");
	const [min, max] = numPhotonsScale.domain();
	slider.min = min;
	slider.max = max;
	slider.step = 0.0001;
	slider.value = (min + max) / 2;

	const numPhotonsFormatter = (() => {
		const intFormatter = d3.format(",");
		return numPhotons => intFormatter(numPhotons);
	})();
	const numPhotonsTextSpan = document.getElementById("text-num-photons");

	slider.oninput = function () {
		const numPhotons = +this.value;
		numPhotonsTextSpan.innerText = numPhotonsFormatter(numPhotonsScale(numPhotons));
		// eslint-disable-next-line no-use-before-define
		update();
	};
	numPhotonsTextSpan.innerText = numPhotonsFormatter(numPhotonsScale(+slider.value));

	return slider;
})();

function sinc(x) {
	if (x === 0) {
		return 1;
	}
	return Math.sin(x) / x;
}

function pdf(x, slitSep, wavelength, intensity) {
	const a = 3e-6;
	const sinTheta = x / (x ** 2 + L ** 2) ** 0.5;
	const n = (Math.PI * sinTheta) / wavelength;
	return intensity * Math.cos(slitSep * n) ** 2 * sinc(a * n) ** 2;
}

function cdf(xMin, xMax, slitSep, wavelength, intensity) {
	intensity = intensity ?? 1;
	const boundPdf = x => pdf(x, slitSep, wavelength, intensity);

	const nIntervals = 1000;
	const dx = (xMax - xMin) / nIntervals;
	let cummArea = 0;
	const cdfPoints = [];
	for (let i = 0; i < nIntervals; ++i) {
		const x1 = xMin + i * dx;
		const y1 = boundPdf(x1);

		const x2 = x1 + dx;
		const y2 = boundPdf(x2);

		const yAvg = (y1 + y2) / 2;
		cummArea += dx * yAvg;

		cdfPoints.push([x2, cummArea]);
	}

	return cdfPoints.map(([x, area]) => [x, area / cummArea]);
}

function sample(n, slitSep, wavelength, intensity) {
	intensity = intensity ?? 1;

	const xMin = X_MIN;
	const xMax = X_MAX;
	const cdfPoints = cdf(xMin, xMax, slitSep, wavelength, intensity);
	// console.log(cdfPoints);
	const samples = sampleFromCdf(cdfPoints, n);

	return samples.map(x => [x, Y_MIN + (Y_MAX - Y_MIN) * Math.random()]);
}

function update() {
	const wavelength = wavelengthScale(+wavelengthSlider.value);
	const slitSep = slitSepScale(+slitSepSlider.value);
	const numPhotons = numPhotonsScale(+numPhotonsSlider.value);

	const samples = sample(numPhotons, slitSep, wavelength);
	// console.log(samples.map(([x, y]) => [xScale(x), yScale(y)]));

	const color = colorScale(+wavelengthSlider.value);
	const r = 2.5 * DPI;
	const borderThickness = 0.5 * DPI;

	contextActual.clearRect(0, 0, WIDTH * DPI, HEIGHT_ACTUAL * DPI);
	contextExpected.clearRect(0, 0, WIDTH * DPI, HEIGHT_EXPECTED * DPI);

	for (const sample of samples) {
		const cx = xScale(sample[0]) * DPI;
		const cy = yScaleActual(sample[1]) * DPI;

		contextActual.beginPath();
		contextActual.arc(cx, cy, r, 0, 2 * Math.PI, false);
		contextActual.fillStyle = color;
		contextActual.fill();
		contextActual.lineWidth = borderThickness;
		contextActual.strokeStyle = "#000000";
		contextActual.stroke();
	}

	const boundPdf = x => pdf(x, slitSep, wavelength, 1);
	const nCurvePoints = 1000;
	const dx = (X_MAX - X_MIN) / (nCurvePoints - 1);

	for (const { lineWidth, strokeStyle } of [
		// {
		// 	lineWidth: 10 * DPI,
		// 	strokeStyle: "#000000",
		// },
		{
			lineWidth: 5 * DPI,
			strokeStyle: "#ffffff",
		},
	]) {
		contextExpected.beginPath();
		contextExpected.lineWidth = lineWidth;
		contextExpected.strokeStyle = strokeStyle;
		for (let i = 0; i < nCurvePoints; ++i) {
			const x = X_MIN + i * dx;
			const y = boundPdf(x);
			contextExpected.lineTo(xScale(x) * DPI, yScaleExpected(y) * DPI);
		}
		contextExpected.stroke();
	}
}

update();
