/* global applyGraphicalObjs */

const X_MAX = 1.1;
const X_MIN = -X_MAX;
const X_0 = 0;
const X_WIDTH = X_MAX - X_MIN;

const WAVEF_Y_MIN = -0.1;
const Y_MAX = 1.9;
const Y_0 = 0;
// eslint-disable-next-line no-unused-vars
const Y_WIDTH = Y_MAX - WAVEF_Y_MIN;

const _SMALL_WIDTH = 400;
const _SMALL_HEIGHT = 300;
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

const shapeButtonContainer = d3.select("#wavefunction-shape-buttons");

const MIN_EXPERIMENT_SPEED = 1;
const MAX_EXPERIMENT_SPEED = 100;
let experimentSpeed = MIN_EXPERIMENT_SPEED;
const experimentSpeedToTimeIntervalScale = d3.scaleLog(
	[MIN_EXPERIMENT_SPEED, MAX_EXPERIMENT_SPEED],
	[0.5, 0.0001],
);
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

	// Since the wavefunction is a guassian, the probability function is a (normalized)
	// square of a gaussian, which is also gaussian but with a different variance
	const sigma = GAUSSIAN_SIGMA / 2 ** 0.5;

	return GAUSSIAN_MU + sigma * standardGaussianRV;
}

function triangle(x) {
	return Math.max(0, 1 - Math.abs(x));
}

// The absolute x-value of where the square function goes from zero to nonzero (as a
// wavefunction, when squared it must integrate to 1)
function _squareThreshold(magnitude) {
	return 1 / (2 * magnitude ** 2);
}

function _genericSquare(x, magnitude) {
	const threshold = _squareThreshold(magnitude);
	return Math.abs(x) > threshold ? 0 : magnitude;
}

// CDF of square is line with slope `magnitude**2` passing through (0, .5)
function _genericSquareSample(magnitude) {
	const y = Math.random();
	return (y - 0.5) / magnitude ** 2;
}

const SQUARE_MAGNITUDE = 0.8;
function square(x) {
	return _genericSquare(x, SQUARE_MAGNITUDE);
}

function squareSample() {
	return _genericSquareSample(SQUARE_MAGNITUDE);
}

const SMALL_SQUARE_MAGNITUDE = 1.29;
function smallSquare(x) {
	return _genericSquare(x, SMALL_SQUARE_MAGNITUDE);
}

function smallSquareSample() {
	return _genericSquareSample(SMALL_SQUARE_MAGNITUDE);
}

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
		samples.push(cdfPoints[currentIndex][0]);
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

const supports = {
	gaussian: [X_MIN, X_MAX],
	triangle: [-1, 1],
	square: [-1, 1].map(sign => sign * _squareThreshold(SQUARE_MAGNITUDE)),
	smallSquare: [-1, 1].map(sign => sign * _squareThreshold(SMALL_SQUARE_MAGNITUDE)),
};

let wavefCurvePathPoints;
let probaCurvePathPoints;

function interpolatePoints(wavefPoints, func) {
	const points = [];

	// This has to be small for accurate sampling (since sampling is performed
	// numerically via the CDF), but too small and rendering becomes a bottleneck
	const distBtwnAddedPoints = 0.003; // In unscaled units
	for (let i = 0; i < wavefPoints.length - 1; ++i) {
		const thisPoint = wavefPoints[i];
		const nextPoint = wavefPoints[i + 1];

		const [x1, y1] = thisPoint;
		const [x2, y2] = nextPoint;
		const dist = Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2);
		const nPoints = Math.ceil(dist / distBtwnAddedPoints);
		const dt = 1 / nPoints;
		for (let i = 0; i < nPoints; ++i) {
			const t = dt * i;
			const x = (1 - t) * x1 + t * x2;
			const y = func !== undefined ? func(x) : (1 - t) * y1 + t * y2;
			points.push([x, y]);
		}
	}
	points.push(wavefPoints[wavefPoints.length - 1]);
	return points;
}

function getAxesData({ name, f, probDistName, yScaleFactor }) {
	yScaleFactor = yScaleFactor ?? 1;
	const nPoints = 33;

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

	const curveStyle =
		probDistName === "gaussian" ? d3.curveCatmullRom : d3.curveLinear;
	const squareDx = 0.01;
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
			[supports.square[0] - squareDx, Y_0],
			[supports.square[0], SQUARE_MAGNITUDE],
			[supports.square[1], SQUARE_MAGNITUDE],
			[supports.square[1] + squareDx, Y_0],
			[X_MAX, Y_0],
		];
	} else if (probDistName === "smallSquare") {
		pathPoints = [
			[X_MIN, Y_0],
			[supports.smallSquare[0] - squareDx, Y_0],
			[supports.smallSquare[0], SMALL_SQUARE_MAGNITUDE],
			[supports.smallSquare[1], SMALL_SQUARE_MAGNITUDE],
			[supports.smallSquare[1] + squareDx, Y_0],
			[X_MAX, Y_0],
		];
	} else {
		throw new Error(`Invalid probDistName ${probDistName}`);
	}

	if (name === WAVEFUNCTION) {
		pathPoints = pathPoints.map(([x, y]) => [x, y * yScaleFactor]);
		wavefCurvePathPoints = [...pathPoints];
	} else {
		pathPoints = interpolatePoints(pathPoints).map(([x]) => [
			x,
			(f(x) * yScaleFactor) ** 2,
		]);
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

const probabilityDistributions = {
	gaussian,
	triangle,
	square,
	smallSquare,
};

let experimentAnimationFrame;

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

const SNAP_THRESHOLD = 0.05;
function searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
	curvePathPoints,
	xUnscaled,
	yUnscaled,
	{ insertionDistThreshold, allowInsertion } = {},
) {
	insertionDistThreshold = insertionDistThreshold ?? SNAP_THRESHOLD; // In unscaled units (where axes go from approx. -1 to 1)
	allowInsertion = allowInsertion ?? true;

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
			return currentIndex;
		} else {
			right = currentIndex;
		}
	}

	const leftPoint = curvePathPoints[left];
	const rightPoint = curvePathPoints[right];

	const leftDist = Math.abs(leftPoint[0] - xUnscaled);
	const rightDist = Math.abs(rightPoint[0] - xUnscaled);

	if (
		allowInsertion &&
		leftDist > insertionDistThreshold &&
		rightDist > insertionDistThreshold
	) {
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
const wavefCurvePathGenerator = d3
	.line()
	.curve(d3.curveLinear)
	.x(p => wavefXScale(p[0]))
	.y(p => wavefYScale(p[1]));
const probaCurvePathGenerator = d3
	.line()
	.x(p => probaXScale(p[0]))
	.y(p => probaYScale(p[1]));

let selectedProbDist;
let didModifyOriginalShape = false;
function update(probDistName) {
	didModifyOriginalShape = false;
	probaPlot.selectAll(".experiment-indicator").remove();

	selectedProbDist = probDistName;
	const baseFunc = probabilityDistributions[probDistName];
	const initialProbaPathPoints = (() => {
		// Due to lack of foresight, this call is what updates the list of curve points
		const pathPoints = getAxesData({
			name: PROBABILITY,
			probDistName,
			f: baseFunc,
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
			probDistName,
			f: baseFunc,
			yScaleFactor,
		}).data;

		applyGraphicalObjs(sel, data, { selector: ".axis" });
	});

	if (probDistName === "gaussian") {
		wavefCurvePathGenerator.curve(d3.curveCatmullRom);
	} else {
		wavefCurvePathGenerator.curve(d3.curveLinear);
	}

	const wavefunctionGrabHandle = wavefPlot.selectAll(".curve-grab-handle");
	const wavefunctionGrabHandleNode = wavefunctionGrabHandle.node();
	wavefunctionCurveTotalLength = wavefunctionGrabHandleNode.getTotalLength();
	let grabIndicator;
	let grabIndicatorVerticalLine;
	let initialX;
	let curvePointsSelectedPointIndex;
	let workInProgress = false;

	wavefPlot
		.on("mousemove", function (event) {
			if (isDraggingGrabHandle) {
				document.body.style.cursor = "grabbing";
			} else if (mouseIsOnGrabPath) {
				document.body.style.cursor = "grab";
			} else {
				document.body.style.cursor = null;
			}

			const [xUnsnappedScaled, yScaled] = d3.pointer(event);

			const indexOfClosestPointToX = searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
				wavefCurvePathPoints,
				wavefXScale.invert(xUnsnappedScaled),
				wavefYScale.invert(yScaled),
				{ allowInsertion: false },
			);
			let xSnappedScaled = wavefXScale(
				wavefCurvePathPoints[indexOfClosestPointToX][0],
			);
			if (
				Math.abs(xSnappedScaled - xUnsnappedScaled) >
				wavefXScale(SNAP_THRESHOLD) - wavefXScale(0)
			) {
				xSnappedScaled = xUnsnappedScaled;
			}

			const yMin = wavefYScale(Y_MAX * 0.7);
			const yMax = wavefYScale(0);

			// Three choices: 1. dragging the handle to move the curve point; 2. simply
			// hovering over the path without dragging; 3. neither, in which case the
			// grab indicator shouldn't be shown
			if (isDraggingGrabHandle) {
				const cy = Math.max(yMin, Math.min(yScaled, yMax));
				if (grabIndicator !== undefined) {
					grabIndicator.attr("cx", initialX).attr("cy", cy);
				}
				if (curvePointsSelectedPointIndex !== undefined) {
					wavefCurvePathPoints[
						curvePointsSelectedPointIndex
					][1] = wavefYScale.invert(cy);

					const wavefPath = wavefCurvePathGenerator(wavefCurvePathPoints);
					wavefPlot.selectAll(".axis-curve").attr("d", wavefPath);

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
					xSnappedScaled,
					undefined,
					probDistName,
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
				wavefPlot
					.selectAll(".wavef-grab-indicator")
					.style("visibility", "hidden");
				wavefPlot.selectAll(".wavef-grab-v-line").style("visibility", "hidden");
				grabIndicator = undefined;
				curvePointsSelectedPointIndex = undefined;
				grabIndicatorVerticalLine = undefined;
			}
		})
		.on("mouseup", function () {
			workInProgress = true;
			if (isDraggingGrabHandle) {
				const wavePath = wavefPlot
					.selectAll(".axis-curve.curve-foreground")
					.node();
				const nPoints = 1500;
				const dl = 1 / (nPoints - 1);

				const totalLengthInitial = wavePath.getTotalLength();
				probaCurvePathPoints = [];
				for (let i = 0; i < nPoints; ++i) {
					const length = totalLengthInitial * i * dl;
					const {
						x: xWavefScaled,
						y: yWavefScaled,
					} = wavePath.getPointAtLength(length);
					const x = wavefXScale.invert(xWavefScaled);
					const y = wavefYScale.invert(yWavefScaled) ** 2;
					probaCurvePathPoints.push([x, y]);
				}
				const pathArea = areaUnderCurve(probaCurvePathPoints);
				wavefCurvePathPoints = wavefCurvePathPoints.map(([x, y]) => [
					x,
					y / pathArea ** 0.5,
				]);
				const wavefPath = wavefCurvePathGenerator(wavefCurvePathPoints);
				wavefPlot.selectAll(".axis-curve").attr("d", wavefPath);

				const totalLengthFinal = wavePath.getTotalLength();
				probaCurvePathPoints = [];
				for (let i = 0; i < nPoints; ++i) {
					const length = totalLengthFinal * i * dl;
					const {
						x: xWavefScaled,
						y: yWavefScaled,
					} = wavePath.getPointAtLength(length);
					const x = wavefXScale.invert(xWavefScaled);
					const y = wavefYScale.invert(yWavefScaled) ** 2;
					probaCurvePathPoints.push([x, y]);
				}

				const probaPath = probaCurvePathGenerator(probaCurvePathPoints);
				probaPlot.selectAll(".axis-curve").attr("d", probaPath);
			}

			isDraggingGrabHandle = false;
			if (!mouseIsOnGrabPath) {
				wavefPlot
					.selectAll(".wavef-grab-indicator")
					.style("visibility", "hidden");
				wavefPlot.selectAll(".wavef-grab-v-line").style("visibility", "hidden");
			}

			document.body.style.cursor = mouseIsOnGrabPath ? "grab" : null;

			workInProgress = false;
		});

	wavefunctionGrabHandle
		.on("mouseover", function () {
			mouseIsOnGrabPath = true;
			grabIndicatorVerticalLine = wavefPlot
				.selectAll(".wavef-grab-v-line")
				.data([0])
				.join("line")
				.classed("wavef-grab-v-line", true)
				.style("visibility", "visible");
			grabIndicator = wavefPlot
				.selectAll(".wavef-grab-indicator")
				.data([0])
				.join("circle")
				.classed("wavef-grab-indicator", true)
				.style("visibility", "visible")
				.attr("r", 15);
		})
		.on("mouseout", function () {
			mouseIsOnGrabPath = false;
		})
		.on("mousedown", function (event) {
			mouseIsOnGrabPath = true;
			isDraggingGrabHandle = true;
			if (workInProgress) {
				return;
			}
			didModifyOriginalShape = true;
			const [mouseX, mouseY] = d3.pointer(event);
			initialX = mouseX;
			curvePointsSelectedPointIndex = searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
				wavefCurvePathPoints,
				wavefXScale.invert(initialX),
				wavefYScale.invert(mouseY),
			);
			wavefPlot
				.selectAll(".axis-curve")
				.attr("d", wavefCurvePathGenerator(wavefCurvePathPoints));
			shapeButtonContainer.selectAll(".shape-button").property("disabled", false);

			document.body.style.cursor = "grabbing";
		});
}

function enableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = false;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", function () {
		return !didModifyOriginalShape && this.hasAttribute("button-checked");
	});
}

function disableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = true;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", true);
	// shapeButtonContainer.selectAll("input").on("change", function () {});
}

function stopExperiment() {
	enableShapeButtons();
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
	disableShapeButtons();

	d3.select("#btn-run").property("disabled", true);
	d3.select("#btn-stop").property("disabled", false);
	d3.select("#btn-clear-experiment").property("disabled", true);

	wavefPlot.selectAll("*").style("pointer-events", "none");

	const nMeasurements = numMeasurementsSliderScale();

	const cdf = getCdf(probaCurvePathPoints);
	const maxSamplesGathered = 1000;
	let sampleIndex = maxSamplesGathered;
	let samples;
	function sampleCdf() {
		if (sampleIndex === maxSamplesGathered) {
			samples = sample(cdf, maxSamplesGathered);
			sampleIndex = 0;
		}
		const s = samples[sampleIndex];
		sampleIndex += 1;
		return s;
	}

	const samplingFunc = didModifyOriginalShape
		? sampleCdf
		: selectedProbDist === "gaussian"
		? gaussianSample
		: selectedProbDist === "square"
		? squareSample
		: selectedProbDist === "smallSquare"
		? smallSquareSample
		: sampleCdf;

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
			const sample = samplingFunc();
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

shapeButtonContainer.selectAll(".shape-button").on("click.select-shape", function () {
	update(this.getAttribute("shape"));
});

update("gaussian");
