/* global applyGraphicalObjs */

const X_MAX = 1.1;
const X_MIN = -X_MAX;
const X_0 = 0;
const X_WIDTH = X_MAX - X_MIN;

const WAVEF_Y_MIN = -0.1;
const Y_MAX = 1.7;
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

const N_PIXELS_PER_CURVE_POINT = 20;

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

const shapeButtonContainer = d3.select("#wavefunction-shape-buttons");

const MIN_EXPERIMENT_SPEED = 1;
const MAX_EXPERIMENT_SPEED = 250;
let experimentSpeed = MIN_EXPERIMENT_SPEED;
const experimentSpeedToTimeIntervalScale = d3.scaleLog(
	[MIN_EXPERIMENT_SPEED, MAX_EXPERIMENT_SPEED],
	[0.5, 0.00001],
);
const experimentSpeedTextSpan = document.getElementById("experiment-speed");
function updateExperimentSpeed() {
	const speed = +(this.value ?? MIN_EXPERIMENT_SPEED);
	experimentSpeed = speed;
	experimentSpeedTextSpan.innerText = `${speed}x`;
}
updateExperimentSpeed();

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
		Math.floor(1.1 ** MIN_NUM_MEASUREMENTS) +
		Math.floor(1.1 ** value)
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
	slider.value = MAX_NUM_MEASUREMENTS; //MIN_NUM_MEASUREMENTS;
	slider.oninput = updateNumMeasurementsText;
	return slider;
})();

updateNumMeasurementsText.call(numMeasurementsSlider);
const GAUSSIAN_MU = 0;
const GAUSSIAN_SIGMA = 0.35;

function gaussian(x) {
	return (
		Math.exp(-0.5 * ((x - GAUSSIAN_MU) / GAUSSIAN_SIGMA) ** 2) /
		(GAUSSIAN_SIGMA * (2 * Math.PI) ** 0.5)
	);
}

// https://en.wikipedia.org/wiki/Box–Muller_transform
function gaussianSample() {
	const rand = Math.random;
	let u, v;

	do {
		u = rand();
	} while (u === 0);

	do {
		v = rand();
	} while (v === 0);

	const standardGaussianRV = Math.sqrt(-2 * Math.log(u)) * Math.cos(2 * Math.PI * v);

	return GAUSSIAN_MU + GAUSSIAN_SIGMA * standardGaussianRV;
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

// The absolute value of where the square function goes from zero to nonzero (it must
// integrate to 1)
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

const supports = {
	gaussian: [X_MIN, X_MAX],
	triangle: [-1, 1],
	square: [-1, 1].map(sign => sign * _squareThreshold(SQUARE_MAGNITUDE)),
	smallSquare: [-1, 1].map(sign => sign * _squareThreshold(SMALL_SQUARE_MAGNITUDE)),
};

let wavefCurvePathPoints;
function getAxesData({ name, f, width, probDistName, nPixelsPerCurvePoint }) {
	width = +width;
	const nPoints = width / (nPixelsPerCurvePoint ?? N_PIXELS_PER_CURVE_POINT);

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

	const curveStyle = probDistName === "gaussian" ? d3.curveNatural : d3.curveLinear;
	let pathPoints;
	if (probDistName === "gaussian") {
		pathPoints = d3.range(nPoints).map(i => {
			const x = X_MIN + (i / (nPoints - 1)) * X_WIDTH;
			const y = f(x);
			return [x, y];
		});
	} else if (probDistName === "triangle") {
		pathPoints = [
			[X_MIN, Y_0],
			[supports.triangle[0], Y_0],
			[X_0, 1],
			[supports.triangle[1], Y_0],
			[X_MAX, Y_0],
		];
	} else if (probDistName === "square") {
		pathPoints = [
			[X_MIN, Y_0],
			[supports.square[0], Y_0],
			[supports.square[0], SQUARE_MAGNITUDE],
			[supports.square[1], SQUARE_MAGNITUDE],
			[supports.square[1], Y_0],
			[X_MAX, Y_0],
		];
	} else if (probDistName === "smallSquare") {
		pathPoints = [
			[X_MIN, Y_0],
			[supports.smallSquare[0], Y_0],
			[supports.smallSquare[0], SMALL_SQUARE_MAGNITUDE],
			[supports.smallSquare[1], SMALL_SQUARE_MAGNITUDE],
			[supports.smallSquare[1], Y_0],
			[X_MAX, Y_0],
		];
	} else {
		throw new Error(`Invalid probDistName ${probDistName}`);
	}

	const line = d3
		.line()
		.curve(curveStyle)
		.x(p => xScale(p[0]))
		.y(p => yScale(p[1]));

	const path = line(pathPoints);
	if (name === WAVEFUNCTION) {
		wavefCurvePathPoints = [...pathPoints];
	}

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

	return data;
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

let experimentInterval;

let wavefunctionCurveTotalLength;
function searchCurveForPointNearGivenX(curveNode, x, precision) {
	if (precision === undefined) {
		precision = 0.2; // Whatever units SVG uses (pretty sure it's pixels)
	}
	let leftLength = 0;
	let rightLength = wavefunctionCurveTotalLength ?? curveNode.getTotalLength();
	let point;
	while (leftLength < rightLength - precision) {
		const currentLength = (leftLength + rightLength) / 2;
		point = curveNode.getPointAtLength(currentLength);
		const pointX = point.x;

		if (pointX < x - precision) {
			leftLength = currentLength;
		} else if (pointX < x + precision) {
			break;
		} else {
			rightLength = currentLength;
		}
	}
	return point;
}

function searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
	curvePathPoints,
	xUnscaled,
	yUnscaled,
	insertionDistThreshold,
) {
	insertionDistThreshold = insertionDistThreshold ?? 0.1;

	let left = 0;
	let right = curvePathPoints.length - 1;
	let currentIndex;
	let point;
	while (left < right - 1) {
		currentIndex = Math.floor((left + right) / 2);
		point = curvePathPoints[currentIndex];
		const pointX = point[0];

		if (pointX < xUnscaled) {
			left = currentIndex;
		} else if (pointX === xUnscaled) {
			break;
		} else {
			right = currentIndex;
		}
	}

	if (point.x === xUnscaled) {
		return currentIndex;
	}

	const leftPoint = curvePathPoints[left];
	const rightPoint = curvePathPoints[right];

	const leftDist = Math.abs(leftPoint[0] - xUnscaled);
	const rightDist = Math.abs(rightPoint[0] - xUnscaled);
	if (leftDist > insertionDistThreshold && rightDist > insertionDistThreshold) {
		const insertionIndex = left + 1;
		curvePathPoints.splice(insertionIndex, 0, [xUnscaled, yUnscaled]);
		return insertionIndex;
	} else if (leftDist < rightDist) {
		return left;
	} else {
		return right;
	}
}

let mouseIsOnGrabPath = false;
let isDraggingGrabHandle = false;
const curvePathGenerator = d3
	.line()
	.x(p => wavefXScale(p[0]))
	.y(p => wavefYScale(p[1]));

let selectedProbDist;
function update(probDistName) {
	probaPlot.selectAll(".experiment-indicator").remove();

	selectedProbDist = probDistName;
	const baseFunc = probabilityDistributions[probDistName];

	d3.selectAll(".plot").each(function (d) {
		const { name } = d;
		const f = name === "probability" ? baseFunc : x => baseFunc(x) ** 0.5;
		const sel = d3.select(this);
		const data = getAxesData({
			name,
			width: sel.attr("width"),
			probDistName,
			f,
		});
		applyGraphicalObjs(sel, data, { selector: ".axis" });
	});

	const wavefunctionGrabHandle = wavefPlot.selectAll(".curve-grab-handle");
	const wavefunctionGrabHandleNode = wavefunctionGrabHandle.node();
	wavefunctionCurveTotalLength = wavefunctionGrabHandleNode.getTotalLength();
	let grabIndicator;
	let grabIndicatorVerticalLine;
	let initialX;
	let curvePointsSelectedPointIndex;

	wavefPlot
		.on("mousemove", function (event) {
			if (mouseIsOnGrabPath) {
				document.body.style.cursor = "grab";
			} else if (!isDraggingGrabHandle) {
				document.body.style.cursor = null;
			}

			const [x, y] = d3.pointer(event);
			const yMin = wavefYScale(Y_MAX * 0.8);
			const yMax = wavefYScale(0);

			// Three choices: 1. dragging the handle to move the curve point; 2. simply
			// hovering over the path without dragging; 3. neither, in which case the
			// grab indicator shouldn't be shown
			if (isDraggingGrabHandle) {
				const cy = Math.max(yMin, Math.min(y, yMax));
				if (grabIndicator !== undefined) {
					grabIndicator.attr("cx", initialX).attr("cy", cy);
				}
				if (curvePointsSelectedPointIndex !== undefined) {
					wavefCurvePathPoints[
						curvePointsSelectedPointIndex
					][1] = wavefYScale.invert(cy);
					const path = curvePathGenerator(wavefCurvePathPoints);
					wavefPlot.selectAll(".axis-curve").attr("d", path);
					wavefunctionCurveTotalLength = wavefunctionGrabHandleNode.getTotalLength();
				}
				if (grabIndicatorVerticalLine !== undefined) {
					grabIndicatorVerticalLine
						.attr("x1", initialX)
						.attr("x2", initialX)
						.attr("y1", yMin)
						.attr("y2", yMax);
				}
			} else if (mouseIsOnGrabPath) {
				const point = searchCurveForPointNearGivenX(
					wavefunctionGrabHandleNode,
					x,
				);
				if (grabIndicator !== undefined) {
					grabIndicator.attr("cx", point.x).attr("cy", point.y);
				}
				if (grabIndicatorVerticalLine !== undefined) {
					grabIndicatorVerticalLine
						.attr("x1", point.x)
						.attr("x2", point.x)
						.attr("y1", yMin)
						.attr("y2", yMax);
				}
			} else {
				wavefPlot.selectAll(".wavef-grab-indicator").data([]).join("circle");
				wavefPlot.selectAll(".wavef-grab-v-line").data([]).join("line");
				grabIndicator = undefined;
				curvePointsSelectedPointIndex = undefined;
				grabIndicatorVerticalLine = undefined;
			}
		})
		.on("mouseup", function () {
			isDraggingGrabHandle = false;
			if (!mouseIsOnGrabPath) {
				grabIndicator = wavefPlot
					.selectAll(".wavef-grab-indicator")
					.data([])
					.join("circle");
			}
		});

	wavefunctionGrabHandle
		.on("mouseover", function () {
			mouseIsOnGrabPath = true;
			grabIndicatorVerticalLine = wavefPlot
				.selectAll(".wavef-grab-v-line")
				.data([0])
				.join("line")
				.classed("wavef-grab-v-line", true);
			grabIndicator = wavefPlot
				.selectAll(".wavef-grab-indicator")
				.data([0])
				.join("circle")
				.classed("wavef-grab-indicator", true)
				.attr("r", 15);
		})
		.on("mouseout", function () {
			mouseIsOnGrabPath = false;
		})
		.on("mousedown", function (event) {
			const [mouseX, mouseY] = d3.pointer(event);
			initialX = mouseX;
			curvePointsSelectedPointIndex = searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
				wavefCurvePathPoints,
				wavefXScale.invert(initialX),
				wavefYScale.invert(mouseY),
			);
			isDraggingGrabHandle = true;
			shapeButtonContainer.selectAll(".shape-button").property("disabled", false);
			if (probDistName === "gaussian") {
				curvePathGenerator.curve(d3.curveNatural);
			} else {
				curvePathGenerator.curve(d3.curveLinear);
			}
		});
}

function enableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = false;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", function () {
		return this.hasAttribute("button-checked");
	});
}

function disableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = true;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", true);
	// shapeButtonContainer.selectAll("input").on("change", function () {});
}

function stopExperiment() {
	enableShapeButtons();
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	clearInterval(experimentInterval);
}

function resetExperiment() {
	stopExperiment();
	probaPlot.selectAll(".experiment-indicator").remove();
}

// Will be adjusted to evenly divide the given probability function's support
const APPROX_BUCKET_WIDTH = 0.05;

// eslint-disable-next-line no-unused-vars
function runExperiment() {
	resetExperiment();
	disableShapeButtons();

	const nMeasurements = numMeasurementsSliderScale();
	const samplingFunc = samplingFunctions[selectedProbDist];

	const [supportMin, supportMax] = supports[selectedProbDist];
	const supportWidth = supportMax - supportMin;

	// Round bucket width down to next number that divides the width of the support
	const nBuckets = Math.ceil(supportWidth / APPROX_BUCKET_WIDTH);
	const bucketWidth = supportWidth / nBuckets;

	// `buckets` contains nBuckets+1 buckets, the first nBuckets of which are rendered
	// on screen and the last of which aggregates all buckets that don't fit on screen
	const buckets = d3
		.range(nBuckets + 1)
		.map(i => ({ x: supportMin + i * bucketWidth, n: 0 }));

	const scaledX0 = probaXScale(X_0);
	const scaledY0 = probaYScale(Y_0);
	let nMeasurementsSoFar = 1;

	function nextUpdateTimeIntervalMS() {
		return 1000 * experimentSpeedToTimeIntervalScale(experimentSpeed);
		// return 0.1 * Math.exp(-nMeasurementsSoFar / 300) * 1000;
	}

	function takeMeasurement() {
		const currentAreaOfSamples =
			bucketWidth *
			(isFinite(nMeasurements) ? nMeasurements : nMeasurementsSoFar);
		const scale = 1 / currentAreaOfSamples;

		// Take sample, update corresponding bucket. If sample is out of axis bounds, apply
		// it to the last bucket, which is a catch-all for non-rendered samples
		const sample = samplingFunc();
		const nBuckets = buckets.length - 1;
		let bucketIndex = Math.floor((sample - supportMin) / bucketWidth);
		if (bucketIndex < 0 || bucketIndex > nBuckets) {
			bucketIndex = nBuckets;
		}
		buckets[bucketIndex].n += 1;

		const waitTimeMS = nextUpdateTimeIntervalMS();

		// Exclude the final, catch-all bucket
		const data = buckets.slice(0, nBuckets).map((bucket, i) => {
			const height = bucket.n * scale;
			const scaledY = probaYScale(Y_0 + height);
			const scaledHeight = scaledY0 - probaYScale(height);

			const classes = ["experiment-indicator", "experiment-bucket"];
			if (waitTimeMS >= 20 && i === bucketIndex) {
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

		// data.push({
		// 	shape: "circle",
		// 	classes: ["experiment-indicator", "measurement-marker"],
		// 	attrs: {
		// 		cx: probaXScale(sample),
		// 		cy: probaYScale(Y_0) + 10,
		// 		r: 4,
		// 	},
		// });

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

		nMeasurementsSoFar += 1;
		if (nMeasurementsSoFar > nMeasurements) {
			stopExperiment();
		} else {
			experimentInterval = setTimeout(takeMeasurement, waitTimeMS);
		}
	}

	experimentInterval = setTimeout(takeMeasurement, nextUpdateTimeIntervalMS());
}

shapeButtonContainer.selectAll(".shape-button").on("click.select-shape", function () {
	update(this.getAttribute("shape"));
});

update("gaussian");
