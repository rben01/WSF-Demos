/* global applyGraphicalObjs katex */

const X_MIN = 0;
const X_MAX = 10;
const X_0 = 0;

const WAVEF_Y_MIN = -1;
const Y_MAX = 1;
const Y_0 = 0;
// eslint-disable-next-line no-unused-vars
const Y_WIDTH = Y_MAX - WAVEF_Y_MIN;

const _SMALL_WIDTH = 400;
const _SMALL_HEIGHT = 200;
const WAVEF_WIDTH = _SMALL_WIDTH;
const WAVEF_HEIGHT = _SMALL_HEIGHT;

const _BIG_WIDTH = 900;
const _BIG_HEIGHT = 750;
const PROBA_WIDTH = _BIG_WIDTH;
const PROBA_HEIGHT = _BIG_HEIGHT;

const _margin = 5;

const wavefXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, WAVEF_WIDTH - _margin]);
const wavefYScale = d3.scaleLinear(
	[WAVEF_Y_MIN, Y_MAX],
	[WAVEF_HEIGHT - _margin, _margin],
);

const _wavefXAxisY = wavefYScale(Y_0);

const probaXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, PROBA_WIDTH - _margin]);
const probaYScale = d3.scaleLinear(
	[Y_0, Y_MAX * 1.4],
	[_wavefXAxisY + PROBA_HEIGHT - WAVEF_HEIGHT - 30, _margin],
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

const sliders = {
	n: (() => {
		const slider = document.getElementById("eigen-n-slider");
		slider.step = 1;
		slider.min = 1;
		slider.max = 5;

		return slider;
	})(),
	L: (() => {
		const slider = document.getElementById("L-slider");
		slider.step = 0.01;
		slider.min = 2;
		slider.max = X_MAX;

		return slider;
	})(),
};

for (const slider of [sliders.n, sliders.L]) {
	// eslint-disable-next-line no-use-before-define
	d3.select(slider).on("input", update);
}

const MIN_EXPERIMENT_SPEED = 1;
const MAX_EXPERIMENT_SPEED = 100;
let experimentSpeed = MIN_EXPERIMENT_SPEED;
const experimentSpeedToTimeIntervalScale = speed => 1 / (15 * speed ** 1.4);
const experimentSpeedTextSpan = document.getElementById("experiment-speed");
function updateExperimentSpeed() {
	const speed = +(this.value ?? MIN_EXPERIMENT_SPEED);
	experimentSpeed = speed;
	experimentSpeedTextSpan.innerText = `${speed}x`;
}
updateExperimentSpeed();

// eslint-disable-next-line no-unused-vars
const experimentSpeedSlider = (() => {
	const slider = document.getElementById("experiment-speed-slider");
	slider.min = MIN_EXPERIMENT_SPEED;
	slider.max = MAX_EXPERIMENT_SPEED;
	slider.step = 1;
	slider.value = MIN_EXPERIMENT_SPEED;
	slider.oninput = updateExperimentSpeed;
})();

const MIN_NUM_MEASUREMENTS = 50;
const MAX_NUM_MEASUREMENTS = 100;
function numMeasurementsSliderScale(value) {
	// eslint-disable-next-line no-use-before-define
	value = value ?? +numMeasurementsSlider.value;

	if (value === MAX_NUM_MEASUREMENTS) {
		return Infinity;
	}
	return (
		MIN_NUM_MEASUREMENTS -
		Math.floor(1.121 ** MIN_NUM_MEASUREMENTS) +
		Math.floor(1.121 ** value)
	);
}

const numMeasurementsTextSpan = document.getElementById("num-measurements-text");
function updateNumMeasurementsText() {
	const value = +(this.value ?? MIN_NUM_MEASUREMENTS);
	const scaledValue = numMeasurementsSliderScale(value);
	const scaledText = isFinite(scaledValue) ? `${scaledValue}` : "Infinite";
	numMeasurementsTextSpan.innerText = scaledText;
}

const numMeasurementsSlider = (() => {
	const slider = document.getElementById("number-of-measurements-slider");
	slider.min = MIN_NUM_MEASUREMENTS;
	slider.max = MAX_NUM_MEASUREMENTS;
	slider.step = 1;
	slider.value = MAX_NUM_MEASUREMENTS - 1;
	slider.oninput = updateNumMeasurementsText;
	return slider;
})();

updateNumMeasurementsText.call(numMeasurementsSlider);

function sample(cdfPoints, n) {
	n = n ?? 1;
	const samples = [];

	for (let i = 0; i < n; ++i) {
		const r = Math.random();
		let left = 0;
		let right = cdfPoints.length - 1;
		let currentIndex;

		while (left < right - 1) {
			currentIndex = Math.floor((left + right) / 2);
			const currentPoint = cdfPoints[currentIndex];
			const y = currentPoint[1];
			if (y < r) {
				left = currentIndex;
			} else {
				right = currentIndex;
			}
		}
		const y1 = cdfPoints[left][1];
		const y2 = cdfPoints[right][1];

		let t = (r - y1) / (y2 - y1);
		if (isNaN(t)) {
			t = 0.5;
		}
		t = Math.max(0, Math.min(t, 1));
		const sampledIndex = left + (right - left) * t;

		samples.push(sampledIndex);
	}

	return samples;
}

function areaUnderCurve(points) {
	const len = points.length - 1;
	let area = 0;
	for (let i = 0; i < len; ++i) {
		const thisPoint = points[i];
		const nextPoint = points[i + 1];
		const dx = nextPoint[0] - thisPoint[0];
		const yAvg = (thisPoint[1] + nextPoint[1]) / 2;
		area += dx * yAvg;
	}
	return area;
}
function getCdf(pdfPoints) {
	const len = pdfPoints.length - 1;
	let cummArea = 0;
	const cdfPoints = [];
	cdfPoints.push([pdfPoints[0][0], 0]);

	for (let i = 0; i < len; ++i) {
		const thisPoint = pdfPoints[i];
		const nextPoint = pdfPoints[i + 1];
		const dx = nextPoint[0] - thisPoint[0];
		const yAvg = (thisPoint[1] + nextPoint[1]) / 2;
		cummArea += dx * yAvg;
		cdfPoints.push([nextPoint[0], cummArea]);
	}
	return cdfPoints;
}

let probaCurvePathPoints;

// function interpolatePoints(wavefPoints, func) {
// 	const points = [];

// 	// This has to be small for accurate sampling (since sampling is performed
// 	// numerically via the CDF), but too small and rendering becomes a bottleneck
// 	const distBtwnAddedPoints = 0.003; // In unscaled units
// 	for (let i = 0; i < wavefPoints.length - 1; ++i) {
// 		const thisPoint = wavefPoints[i];
// 		const nextPoint = wavefPoints[i + 1];

// 		const [x1, y1] = thisPoint;
// 		const [x2, y2] = nextPoint;
// 		const dist = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2);
// 		const nPoints = Math.ceil(dist / distBtwnAddedPoints);
// 		const dt = 1 / nPoints;
// 		for (let i = 0; i < nPoints; ++i) {
// 			const t = dt * i;
// 			const x = (1 - t) * x1 + t * x2;
// 			const y = func !== undefined ? func(x) : (1 - t) * y1 + t * y2;
// 			points.push([x, y]);
// 		}
// 	}
// 	points.push(wavefPoints[wavefPoints.length - 1]);
// 	return points;
// }

function getAxesData({ name, n, L, yScaleFactor }) {
	yScaleFactor = yScaleFactor ?? 1;
	const nPoints = 250;

	let yMin, xScale, yScale, yAxisText;
	if (name === WAVEFUNCTION) {
		yMin = WAVEF_Y_MIN;
		xScale = wavefXScale;
		yScale = wavefYScale;
		yAxisText = "|𝜓(𝑥)|";
	} else if (name === PROBABILITY) {
		yMin = PROBA_Y_MIN;
		xScale = probaXScale;
		yScale = probaYScale;
		yAxisText = "|𝜓(𝑥)|²";
	} else {
		throw new Error(`Invalid plot ${name}`);
	}

	const f = x => Math.sqrt(2 / L) * Math.sin(((n * Math.PI) / L) * x);

	const curveStyle = d3.curveCatmullRom;
	let pathPoints;

	pathPoints = d3.range(nPoints).map(i => {
		const x = X_MIN + (i / (nPoints - 1)) * (L - X_MIN);
		const y = f(x);
		return [x, y];
	});

	if (name === WAVEFUNCTION) {
		pathPoints = pathPoints.map(([x, y]) => [x, y * yScaleFactor]);
	} else {
		pathPoints = pathPoints.map(([x]) => [x, (f(x) * yScaleFactor) ** 2]);
		probaCurvePathPoints = [...pathPoints];
	}

	const line = d3
		.line()
		.curve(curveStyle)
		.x(p => xScale(p[0]))
		.y(p => yScale(p[1]));

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
				y2: yScale(Y_MAX) - 200,
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
				y: name === PROBABILITY ? yScale(Y_MAX) - 150 : yScale(Y_MAX) + 20,
			},
		},
		// these paths *must* go last to maintain order when moving them to the end
		// after adding histogram bars (this is simpler, if more brittle, than adding a
		// key for the join)
		{
			shape: "path",
			classes: ["axis", "axis-curve", "curve-background"],
			attrs: {
				d: path,
			},
		},
		...(name === WAVEFUNCTION
			? [
					{
						shape: "path",
						classes: ["axis", "axis-curve", "curve-grab-handle"],
						attrs: {
							d: path,
						},
					},
			  ]
			: []),
		{
			shape: "path",
			classes: ["axis", "axis-curve", "curve-foreground"],
			attrs: {
				d: path,
			},
		},
	];

	return { data, pathPoints };
}

let experimentAnimationFrame;

function update() {
	probaPlot.selectAll(".experiment-indicator").remove();

	const n = +sliders.n.value;
	const L = +sliders.L.value;

	if (typeof katex !== "undefined") {
		katex.render(`n=${n}`, document.getElementById("text-n"));
	}

	const initialProbaPathPoints = (() => {
		// Due to lack of foresight, this call is what updates the list of curve points
		const pathPoints = getAxesData({
			name: PROBABILITY,
			n,
			L,
		}).pathPoints;
		return pathPoints;
	})();

	const probaArea = areaUnderCurve(initialProbaPathPoints);
	const yScaleFactor = 1 / probaArea ** 0.5;

	d3.selectAll(".plot").each(function (d) {
		const { name } = d;
		const sel = d3.select(this);
		const data = getAxesData({
			name,
			n,
			L,
			yScaleFactor,
		}).data;

		applyGraphicalObjs(sel, data, { selector: ".axis" });
	});
}

function setElementsEnabled(enabled) {
	for (const elem of [sliders.n, sliders.L]) {
		elem.disabled = !enabled;
	}
}

function stopExperiment() {
	setElementsEnabled(true);
	d3.select("#btn-clear-experiment").property("disabled", false);
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	// clearInterval(experimentInterval);
	window.cancelAnimationFrame(experimentAnimationFrame);
	wavefPlot.selectAll("*").style("pointer-events", null);
}

// eslint-disable-next-line no-unused-vars
function clearExperiment() {
	probaPlot.selectAll(".experiment-indicator").remove();
	d3.select("#btn-clear-experiment").property("disabled", true);
}

function resetExperiment() {
	stopExperiment();
	probaPlot.selectAll(".experiment-indicator").remove();
}

// Will be adjusted to evenly divide the given probability function's support
const APPROX_BUCKET_WIDTH = 0.05;

d3.select("#btn-run").on("click._default", null);
d3.select("#btn-clear-experiment").on("click._default", null);

// eslint-disable-next-line no-unused-vars
function runExperiment() {
	resetExperiment();
	setElementsEnabled(false);

	d3.select("#btn-run").property("disabled", true);
	d3.select("#btn-stop").property("disabled", false);
	d3.select("#btn-clear-experiment").property("disabled", true);

	wavefPlot.selectAll("*").style("pointer-events", "none");

	const L = +sliders.L.value;

	const nMeasurements = numMeasurementsSliderScale();

	const cdf = getCdf(probaCurvePathPoints);
	const maxSamplesGathered = 1000;
	let sampleIndex = maxSamplesGathered;
	let sampledIndices;
	function sampleCdf() {
		if (sampleIndex === maxSamplesGathered) {
			sampledIndices = sample(cdf, maxSamplesGathered);
			sampleIndex = 0;
		}
		const s = sampledIndices[sampleIndex];
		sampleIndex += 1;
		return s;
	}

	const supportMin = X_MIN;
	const supportMax = L;
	const supportWidth = supportMax - supportMin;

	// Round bucket width down to next number that divides the width of the support
	const nBuckets = Math.ceil(supportWidth / APPROX_BUCKET_WIDTH);
	const bucketWidth = supportWidth / nBuckets;

	// `buckets` contains nBuckets+1 buckets, the first nBuckets of which are rendered
	// on screen and the last of which aggregates all buckets that don't fit on screen
	const buckets = d3
		.range(nBuckets + 1)
		.map(i => ({ x: supportMin + i * bucketWidth, n: 0 }));
	const catchallBucketIndex = nBuckets;

	const scaledX0 = probaXScale(X_0);
	const scaledY0 = probaYScale(Y_0);
	let nMeasurementsSoFar = 1;

	function nextUpdateTimeIntervalMS() {
		return 1000 * experimentSpeedToTimeIntervalScale(experimentSpeed);
	}

	let prevTimestampMS;
	let experimentRemainderFrac = 0;

	function updateExperimentUI(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		const timeBtwnSamplesMS = nextUpdateTimeIntervalMS();
		const nExperimentsExact =
			elapsedMS / timeBtwnSamplesMS + experimentRemainderFrac;
		const nExperiments = Math.floor(nExperimentsExact);
		experimentRemainderFrac = nExperimentsExact % 1;

		let bucketIndex;
		for (let i = 0; i < nExperiments; ++i) {
			const sampledIndex = sampleCdf();

			const left = Math.floor(sampledIndex);
			const right = Math.ceil(sampledIndex);
			const t = (sampledIndex - left) / (right - left);
			const sample = isNaN(t) ? left : cdf[left][0] * (1 - t) + cdf[right][0] * t;

			bucketIndex = Math.floor((sample - supportMin) / bucketWidth);
			if (bucketIndex < 0 || bucketIndex > nBuckets) {
				bucketIndex = catchallBucketIndex;
			}
			buckets[bucketIndex].n += 1;
			nMeasurementsSoFar += 1;
			if (nMeasurementsSoFar >= nMeasurements) {
				break;
			}
		}

		const currentAreaOfSamples =
			bucketWidth *
			(isFinite(nMeasurements) ? nMeasurements : nMeasurementsSoFar);
		const scale = 1 / currentAreaOfSamples;
		// Exclude the final, catch-all bucket
		const data = buckets.slice(0, nBuckets).map((bucket, i) => {
			const height = bucket.n * scale;
			const scaledY = probaYScale(Y_0 + height);
			const scaledHeight = scaledY0 - probaYScale(height);

			const classes = ["experiment-indicator", "experiment-bucket"];
			if (timeBtwnSamplesMS >= 20 && i === bucketIndex) {
				classes.push("experiment-selected-bucket");
			}

			return {
				shape: "rect",
				classes,
				attrs: {
					x: probaXScale(bucket.x),
					y: scaledY,
					width: probaXScale(bucketWidth) - scaledX0,
					height: scaledHeight,
				},
			};
		});

		data.push({
			shape: "text",
			text: `Measurements: ${nMeasurementsSoFar}`,
			classes: ["experiment-indicator", "experiment-measurement-counter"],
			attrs: {
				x: probaXScale(X_MIN) + 60,
				y: probaYScale(Y_0) + 20,
			},
		});

		applyGraphicalObjs(probaPlot, data, { selector: ".experiment-indicator" });

		if (nMeasurementsSoFar <= 1) {
			const probaPlotNode = probaPlot.node();
			probaPlotNode.appendChild(
				probaPlotNode.querySelector(".axis-curve.curve-background"),
			);
			probaPlotNode.appendChild(
				probaPlotNode.querySelector(".axis-curve.curve-foreground"),
			);
		}

		if (nMeasurementsSoFar >= nMeasurements) {
			stopExperiment();
		} else {
			experimentAnimationFrame = window.requestAnimationFrame(updateExperimentUI);
		}
	}
	experimentAnimationFrame = window.requestAnimationFrame(updateExperimentUI);
}

update();
