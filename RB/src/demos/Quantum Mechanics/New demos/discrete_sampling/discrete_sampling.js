/* global applyGraphicalObjs */

const MAX_DICE = 10;
const N_SIDES = 6;

const X_MAX = MAX_DICE + N_SIDES;
const X_MIN = 0;
const X_0 = 0;
const X_WIDTH = X_MAX - X_MIN;

const WAVEF_Y_MIN = -0.1;
const Y_MAX = 1.9;
const Y_0 = 0;
// eslint-disable-next-line no-unused-vars
const Y_WIDTH = Y_MAX - WAVEF_Y_MIN;

const _BIG_WIDTH = 900;
const _BIG_HEIGHT = 700;
const PROBA_WIDTH = _BIG_WIDTH;
const PROBA_HEIGHT = _BIG_HEIGHT;

const _margin = 5;

const probaXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, PROBA_WIDTH - _margin]);
const probaYScale = d3.scaleLinear([Y_0, Y_MAX * 1.4], [PROBA_HEIGHT - 30, _margin]);

const PROBA_Y_MIN = probaYScale.invert(PROBA_HEIGHT - _margin);

const probaPlot = d3
	.select("#experiment-plot")
	.attr("width", PROBA_WIDTH)
	.attr("height", PROBA_HEIGHT);

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

const numObjectsSlider = (() => {
	const slider = document.getElementById("slider-num-objects");
	slider.min = 1;
	slider.max = MAX_DICE;
	slider.value = 1;
	slider.step = 1;

	slider.oninput = () => {
		document.getElementById("text-num-objects").innerText = +slider.value;
	};

	return slider;
})();

// eslint-disable-next-line no-unused-vars
const experimentSpeedSlider = (() => {
	const slider = document.getElementById("experiment-speed-slider");
	slider.min = MIN_EXPERIMENT_SPEED;
	slider.max = MAX_EXPERIMENT_SPEED;
	slider.step = 1;
	slider.value = MIN_EXPERIMENT_SPEED;
	slider.oninput = updateExperimentSpeed;

	return slider;
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

function sampleDice(n) {
	let sum = 0;
	for (let i = 0; i < n; i++) {
		const roll = Math.floor(Math.random() * 6) + 1;
		sum += roll;
	}
	return sum;
}

function getDiceOutcomeCounts(n) {
	const maxRoll = n * N_SIDES + 1;
	// counts[i] = cummulative number of ways to roll a sum of i
	// each roll adds more to counts
	let rollSumCounts = Array(maxRoll).fill(0);
	rollSumCounts[0] = 1;

	for (let r = 0; r < n; r++) {
		const newCounts = Array(maxRoll).fill(0);
		for (let i = 0; i <= maxRoll; i++) {
			const currCount = rollSumCounts[i];
			for (let j = 0; j <= N_SIDES; j++) {
				const thisRollCount = j === 0 ? 0 : 1;

				const addedCount = currCount * thisRollCount;
				if (addedCount > 0) {
					newCounts[i + j] += addedCount;
				}
			}
		}
		rollSumCounts = newCounts;
	}

	return rollSumCounts;
}

function getAxesData({ nDice, yScaleFactor }) {
	yScaleFactor = yScaleFactor ?? 1;

	// let yMin, xScale, yScale, yAxisText;

	const yMin = PROBA_Y_MIN;
	const xScale = probaXScale;
	const yScale = probaYScale;
	const yAxisText = "Proportion";

	const curveStyle = d3.curveLinear;

	const diceCounts = getDiceOutcomeCounts(nDice);
	const pathPoints = diceCounts.map((c, i) => [i, c]);

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

			const indexOfClosestPointToX =
				searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
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
					wavefCurvePathPoints[curvePointsSelectedPointIndex][1] =
						wavefYScale.invert(cy);

					const wavefPath = wavefCurvePathGenerator(wavefCurvePathPoints);
					wavefPlot.selectAll(".axis-curve").attr("d", wavefPath);

					wavefunctionCurveTotalLength =
						wavefunctionGrabHandleNode.getTotalLength();
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
					const { x: xWavefScaled, y: yWavefScaled } =
						wavePath.getPointAtLength(length);
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
					const { x: xWavefScaled, y: yWavefScaled } =
						wavePath.getPointAtLength(length);
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
			curvePointsSelectedPointIndex =
				searchCurvePointsForIndexNearGivenX_InsertingPointIfNothingIsClose(
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
		return !didModifyOriginalShape && this.hasAttribute("data-button-checked");
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

	const [supportMin, supportMax] = didModifyOriginalShape
		? [X_MIN, X_MAX]
		: supports[selectedProbDist];
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
