/* global applyGraphicalObjs sampleFromCdf */

const MAX_DICE = 10;
const N_SIDES = 6;

const X_MAX = MAX_DICE * N_SIDES;
const X_MIN = 0;
const X_0 = 0;

const Y_MAX = 1 / 6;
const Y_0 = 0;
const Y_MIN = -0.02;
// eslint-disable-next-line no-unused-vars

const _BIG_WIDTH = 900;
const _BIG_HEIGHT = 700;
const PROBA_WIDTH = _BIG_WIDTH;
const PROBA_HEIGHT = _BIG_HEIGHT;

const _margin = 5;

const probaXScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, PROBA_WIDTH - _margin]);
const probaYScale = d3.scaleLinear([Y_MIN, Y_MAX * 1.4], [PROBA_HEIGHT - 30, _margin]);

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
		// eslint-disable-next-line no-use-before-define
		update();
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

// function sampleDice(n) {
// 	let sum = 0;
// 	for (let i = 0; i < n; i++) {
// 		const roll = Math.floor(Math.random() * 6) + 1;
// 		sum += roll;
// 	}
// 	return sum;
// }

function getDiceOutcomeCounts(n) {
	const maxRoll = MAX_DICE * N_SIDES;
	// counts[i] = cummulative number of ways to roll a sum of i
	// each roll adds more to counts
	let rollSumCounts = Array(maxRoll + 1).fill(0);
	rollSumCounts[0] = 1;

	for (let r = 0; r < n; r++) {
		const newCounts = Array(maxRoll + 1).fill(0);
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

function getAxesData({ nDice }) {
	const yMin = PROBA_Y_MIN;
	const xScale = probaXScale;
	const yScale = probaYScale;
	const yAxisText = "Proportion";

	const diceCounts = getDiceOutcomeCounts(nDice);

	const pathPoints = [];
	const maxOutcome = diceCounts.length - 1;
	const nOutcomes = diceCounts.reduce((a, b) => a + b);

	for (let i = 0; i <= maxOutcome; i++) {
		const c1 = diceCounts[i];
		const c2 = diceCounts[i + 1] ?? 0;
		const bucketCenter = i + 0.5;
		pathPoints.push(
			[bucketCenter, c1],
			[bucketCenter + 0.5, c1],
			[bucketCenter + 0.5, c2],
		);
	}

	pathPoints.push([maxOutcome + 1, 0]);

	const line = d3
		.line()
		.curve(d3.curveLinear)
		.x(p => xScale(p[0]))
		.y(p => yScale(p[1] / nOutcomes));

	const xTicks = probaXScale.ticks(50).slice(1, -1);
	const xLabels = xTicks.filter(x => x % 5 === 0);

	const y0s = probaYScale(Y_0);

	const path = line(pathPoints);
	const data = [
		...xLabels.map(x => {
			return {
				shape: "text",
				text: `${x}`,
				class: "axis axis-label x-axis-label",
				attrs: {
					x: probaXScale(x + 0.5),
					y: y0s,
					dy: 20,
					"dominant-baseline": "top",
					"text-anchor": "center",
				},
			};
		}),
		...xTicks.map(x => {
			const xs = probaXScale(x);
			return {
				shape: "line",
				class: "axis axis-tick x-axis-tick",
				attrs: {
					x1: xs,
					x2: xs,
					y1: y0s,
					y2: y0s + 8,
				},
			};
		}),
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
				y: yScale(Y_MAX) - 150,
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

	const initialProbaPathPoints = (() => {
		// Due to lack of foresight, this call is what updates the list of curve points
		const pathPoints = getAxesData({
			nDice: +numObjectsSlider.value,
		}).pathPoints;
		return pathPoints;
	})();
	applyGraphicalObjs(probaPlot, initialProbaPathPoints, { selector: ".axis" });

	const yScaleFactor = 0.5;

	d3.selectAll(".plot").each(function () {
		const sel = d3.select(this);
		const data = getAxesData({
			nDice: +numObjectsSlider.value,
			yScaleFactor,
		}).data;

		applyGraphicalObjs(sel, data, { selector: ".axis" });
	});
}

function stopExperiment() {
	d3.select("#slider-num-objects").property("disabled", false);
	d3.select("#btn-clear-experiment").property("disabled", false);
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	// clearInterval(experimentInterval);
	window.cancelAnimationFrame(experimentAnimationFrame);
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

d3.select("#btn-run").on("click._default", null);
d3.select("#btn-clear-experiment").on("click._default", null);

// eslint-disable-next-line no-unused-vars
function runExperiment() {
	resetExperiment();

	d3.select("#slider-num-objects").property("disabled", true);
	d3.select("#btn-run").property("disabled", true);
	d3.select("#btn-stop").property("disabled", false);
	d3.select("#btn-clear-experiment").property("disabled", true);

	const nMeasurements = numMeasurementsSliderScale();

	const outcomeCounts = getDiceOutcomeCounts(+numObjectsSlider.value);
	const maxOutcome = outcomeCounts.length - 1;
	const nOutcomes = outcomeCounts.reduce((a, b) => a + b);

	const cdf = (() => {
		const cdf = Array(maxOutcome + 1);
		let runningSum = 0;

		for (let i = 0; i <= maxOutcome; i++) {
			const c = outcomeCounts[i];
			runningSum += c / nOutcomes;
			cdf[i] = [i, runningSum];
		}

		return cdf;
	})();

	const maxSamplesGathered = 1000;
	let sampleIndex = maxSamplesGathered;
	let samples;
	function sampleCdf() {
		if (sampleIndex === maxSamplesGathered) {
			samples = sampleFromCdf(cdf, maxSamplesGathered).map(x =>
				Math.floor(1 + x),
			);
			sampleIndex = 0;
		}
		const s = samples[sampleIndex];
		sampleIndex += 1;
		return s;
	}

	const buckets = Array(maxOutcome + 1).fill(0);

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
			const sample = sampleCdf();
			buckets[sample] += 1;
			nMeasurementsSoFar += 1;
			if (nMeasurementsSoFar >= nMeasurements) {
				break;
			}
		}

		const currentAreaOfSamples = isFinite(nMeasurements)
			? nMeasurements
			: nMeasurementsSoFar;
		const scale = 1 / currentAreaOfSamples;
		const data = buckets.map((bucket, i) => {
			const height = bucket * scale;
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
					x: probaXScale(i),
					y: scaledY,
					width: probaXScale(1) - scaledX0,
					height: scaledHeight,
				},
			};
		});

		data.push({
			shape: "text",
			text: `Measurements: ${nMeasurementsSoFar}`,
			classes: ["experiment-indicator", "experiment-measurement-counter"],
			attrs: {
				x: probaXScale(X_MIN) + 20,
				y: probaYScale(Y_0) + 60,
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
