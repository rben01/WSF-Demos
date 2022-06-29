/* global applyGraphicalObjs */

const COLORS = ["red", "yellow", "green", "blue"];
const MAX_PER_COLOR = 10;

const X_MAX = 4;
const X_MIN = 0;
const X_0 = 0;

const Y_MAX = 1;
const Y_0 = 0;
const Y_MIN = -0.1;
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

const BALLS_WIDTH = 300;
const BALLS_HEIGHT = 150;

const ballsPlot = d3
	.select("#balls-plot")
	.attr("width", BALLS_WIDTH)
	.attr("height", BALLS_HEIGHT);

const diceXScale = d3.scaleLinear([0, 1], [_margin, BALLS_WIDTH - _margin]);
const diceYScale = d3.scaleLinear(
	[0, (BALLS_HEIGHT - 2 * _margin) / (BALLS_WIDTH - 2 * _margin)],
	[_margin, BALLS_HEIGHT - _margin],
);

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

const ballSliders = (() => {
	function makeBallSlider(color) {
		const slider = document.getElementById(`slider-num-${color}s`);
		slider.min = 0;
		slider.max = MAX_PER_COLOR;
		slider.value = color === "red" ? 1 : 0;
		slider.step = 1;

		slider.oninput = function () {
			document.getElementById(`text-num-${color}`).innerText = +this.value;

			// eslint-disable-next-line no-use-before-define
			const { ballCounts, nBalls } = getBallCounts();
			// eslint-disable-next-line no-use-before-define
			const ballData = getBallData(ballCounts, nBalls);
			applyGraphicalObjs(ballsPlot, ballData, {
				key: d => d.key,
				selector: ".ball",
			});

			// eslint-disable-next-line no-use-before-define
			update();

			// eslint-disable-next-line no-use-before-define
			document.getElementById("btn-run").disabled = allSlidersAreZero();
		};

		return slider;
	}

	return COLORS.map(color => makeBallSlider(color));
})();

function allSlidersAreZero() {
	return ballSliders.every(slider => +slider.value === 0);
}

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
	const scaledText = isFinite(scaledValue) ? `${scaledValue}` : "Inf.";
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

function getBallCounts() {
	const ballCounts = ballSliders.map(slider => +slider.value);
	const nBalls = ballCounts.reduce((a, b) => a + b);
	return { ballCounts, nBalls };
}

// ballCounts is an array of ints
// returns the (random) rolled index as well as the index of the selected ball
function grabBall(ballCounts, nBalls) {
	const rolledIndex = Math.floor(Math.random() * nBalls);
	let rolledIndexRemaining = rolledIndex;
	for (let i = 0, len = ballCounts.length; i < len; i++) {
		const count = ballCounts[i];
		if (rolledIndexRemaining < count) {
			return { rolled: rolledIndex, ball: i };
		}
		rolledIndexRemaining -= count;
	}
}

function getAxesData(ballCounts, nBalls) {
	const yMin = PROBA_Y_MIN;
	const xScale = probaXScale;
	const yScale = probaYScale;
	const yAxisText = "Proportion";

	const barHorizMargin = 0.1;
	const barMinX = barHorizMargin;
	const barMaxX = 1 - barHorizMargin;

	const classes = ["axis", "ball-cap"];
	if (allSlidersAreZero()) {
		classes.push("hidden");
	}

	const caps = ballCounts.flatMap((c, i) => {
		const proportion = c / nBalls;
		const y = yScale(proportion);

		return [
			{
				shape: "line",
				classes: [...classes, "bg"],
				key: `cap-${i}-bg`,
				attrs: {
					x1: xScale(i + barMinX) - 2,
					x2: xScale(i + barMaxX) + 2,
					y1: y,
					y2: y,
				},
			},
			{
				shape: "line",
				classes: [...classes, "fg"],
				key: `cap-${i}-fg`,
				attrs: {
					x1: xScale(i + barMinX),
					x2: xScale(i + barMaxX),
					y1: y,
					y2: y,
				},
			},
		];
	});

	const labels = COLORS.map((c, i) => {
		return {
			shape: "circle",
			class: `x-axis-circle fill-${c}`,
			key: `label-${i}`,
			attrs: {
				cx: xScale(i + 0.5),
				cy: yScale(-0.05),
				r: 14,
			},
		};
	});

	const data = [
		{
			shape: "line",
			classes: ["axis", "axis-axis", "x-axis"],
			key: "x-axis",
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
			key: "y-axis",
			attrs: {
				x1: xScale(X_0),
				x2: xScale(X_0),
				y1: yScale(yMin),
				y2: yScale(Y_MAX) - 200,
			},
		},
		{
			shape: "text",
			text: "Color",
			classes: ["axis", "axis-label", "axis-x-label"],
			key: "x-label",
			attrs: {
				x: xScale(X_MAX) - 65,
				y: yScale(Y_0) + 55,
			},
		},
		{
			shape: "text",
			text: yAxisText,
			classes: ["axis", "axis-label", "axis-y-label"],
			key: "y-label",
			attrs: {
				x: xScale(X_0) + 10,
				y: yScale(Y_MAX) - 150,
			},
		},
		...caps,
		...labels,
	];

	return data;
}

// Get the data used to draw the balls
function getBallData(ballCounts, rolledIndex) {
	const BALLS_PER_ROW = 10;
	const BALL_SIZE = 0.1;
	const BALL_X_MARGIN = (1 - BALLS_PER_ROW * BALL_SIZE) / BALLS_PER_ROW;
	const BALL_Y_MARGIN =
		diceYScale.invert(diceXScale(BALL_X_MARGIN) - diceXScale(0)) -
		diceYScale.invert(0);

	let i = 0;
	const data = [];
	for (let bi = 0, len = ballCounts.length; bi < len; bi++) {
		const bc = ballCounts[bi];
		for (let j = 0; j < bc; j++) {
			const xi = i % BALLS_PER_ROW;
			const x = (xi + 0.5) * (BALL_SIZE + BALL_X_MARGIN);

			const yi = Math.floor(i / BALLS_PER_ROW);
			const y = (yi + 0.5) * (BALL_SIZE + BALL_Y_MARGIN);

			const cx = diceXScale(x);
			const cy = diceYScale(y);

			const classes = ["ball", "body", `fill-${COLORS[bi]}`];
			if (i === rolledIndex) {
				classes.push("rolled");
			}

			data.push({
				shape: "circle",
				classes,
				key: `axis ball-${i}`,
				attrs: {
					cx,
					cy,
					r: 9,
				},
			});

			i += 1;
		}
	}

	return data;
}

let experimentAnimationFrame;

function update() {
	probaPlot.selectAll(".experiment-indicator").remove();

	const { nBalls, ballCounts } = getBallCounts();

	d3.selectAll(".plot").each(function () {
		const sel = d3.select(this);
		const data = getAxesData(ballCounts, nBalls);

		applyGraphicalObjs(sel, data, { key: d => d.key, selector: ".axis" });
	});
}

let buckets;
function initializeBuckets() {
	buckets = Array(4).fill(0);
}
initializeBuckets();

function stopExperiment() {
	ballSliders.forEach(slider => (slider.disabled = true));
	document.getElementById("btn-clear-experiment").disabled = false;
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	document.getElementById("number-of-measurements-slider").disabled = true;
	// clearInterval(experimentInterval);
	window.cancelAnimationFrame(experimentAnimationFrame);
}

// eslint-disable-next-line no-unused-vars
function clearExperiment() {
	stopExperiment();

	ballSliders.forEach(slider => (slider.disabled = false));
	document.getElementById("btn-clear-experiment").disabled = true;
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	document.getElementById("number-of-measurements-slider").disabled = false;
	initializeBuckets();
	probaPlot.selectAll(".experiment-indicator").remove();
	d3.select("#btn-clear-experiment").property("disabled", true);
}

d3.select("#btn-run").on("click._default", null);
d3.select("#btn-clear-experiment").on("click._default", null);

// eslint-disable-next-line no-unused-vars
function runExperiment() {
	ballSliders.forEach(slider => (slider.disabled = true));
	document.getElementById("btn-clear-experiment").disabled = false;
	document.getElementById("btn-run").disabled = true;
	document.getElementById("btn-stop").disabled = false;
	document.getElementById("number-of-measurements-slider").disabled = true;

	const { ballCounts, nBalls } = getBallCounts();

	const maxSamplesGathered = 1000;
	let sampleIndex = maxSamplesGathered;
	let samples;
	function sampleCdf() {
		if (sampleIndex === maxSamplesGathered) {
			samples = Array(maxSamplesGathered + 1)
				.fill(0)
				.map(() => grabBall(ballCounts, nBalls));
			sampleIndex = 0;
		}
		sampleIndex += 1;
		return samples[sampleIndex];
	}

	const scaledY0 = probaYScale(Y_0);

	const nMeasurements = numMeasurementsSliderScale();
	let nMeasurementsSoFar = buckets.reduce((a, b) => a + b);

	if (nMeasurementsSoFar >= nMeasurements) {
		initializeBuckets();
		nMeasurementsSoFar = 0;
	}

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

		let lastRolled;
		for (let i = 0; i < nExperiments; ++i) {
			const { rolled, ball } = sampleCdf();
			buckets[ball] += 1;

			lastRolled = rolled;

			nMeasurementsSoFar += 1;
			if (nMeasurementsSoFar >= nMeasurements) {
				break;
			}
		}

		if (lastRolled !== undefined) {
			const ballsData = getBallData(ballCounts, lastRolled);

			applyGraphicalObjs(ballsPlot, ballsData, {
				key: d => d.key,
				selector: ".ball",
			});
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
			// if (timeBtwnSamplesMS >= 20 && i === bucketIndex) {
			// 	classes.push("experiment-selected-bucket");
			// }

			return {
				shape: "rect",
				classes,
				attrs: {
					x: probaXScale(i + 0.1),
					y: scaledY,
					width: probaXScale(0.9) - probaXScale(0.1),
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
				y: probaYScale(Y_0) + 67,
			},
		});

		applyGraphicalObjs(probaPlot, data, {
			key: d => d.key,
			selector: ".experiment-indicator",
		});

		{
			const probaPlotNode = probaPlot.node();
			for (const node of probaPlotNode.querySelectorAll(".axis.ball-cap.bg")) {
				probaPlotNode.appendChild(node);
			}
			for (const node of probaPlotNode.querySelectorAll(".axis.ball-cap.fg")) {
				probaPlotNode.appendChild(node);
			}
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
ballSliders.forEach(slider => slider.oninput());
