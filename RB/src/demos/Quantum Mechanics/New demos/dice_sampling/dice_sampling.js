/* global applyGraphicalObjs */

const MAX_DICE = 10;
const N_SIDES = 6;
const MAX_ROLL = MAX_DICE * N_SIDES;
const N_OUTCOMES = MAX_ROLL + 1; // since 0 counts, in a sense

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

const DICE_WIDTH = 300;
const DICE_HEIGHT = 240;

const dicePlot = d3
	.select("#dice-plot")
	.attr("width", DICE_WIDTH)
	.attr("height", DICE_HEIGHT);

const diceXScale = d3.scaleLinear([0, 1], [_margin, DICE_WIDTH - _margin]);
const diceYScale = d3.scaleLinear(
	[0, (DICE_HEIGHT - 2 * _margin) / (DICE_WIDTH - 2 * _margin)],
	[_margin, DICE_HEIGHT - _margin],
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

const numObjectsSlider = (() => {
	const slider = document.getElementById("slider-num-objects");
	slider.min = 1;
	slider.max = MAX_DICE;
	slider.value = 1;
	slider.step = 1;

	slider.oninput = function () {
		document.getElementById("text-num-objects").innerText = +slider.value;

		// eslint-disable-next-line no-use-before-define
		const diceData = getDiceData({ nDice: +this.value });
		applyGraphicalObjs(dicePlot, diceData, {
			key: d => d.key,
			selector: ".die",
		});

		// eslint-disable-next-line no-use-before-define
		update();

		document.getElementById("text-dice-sum").innerText = "";

		document.getElementById("btn-clear-experiment").disabled = true;
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

function rollNDice(n) {
	return new Int8Array(n).map(() => 1 + Math.floor(Math.random() * 6));
}

// function sampleDice(n) {
// 	let sum = 0;
// 	for (let i = 0; i < n; i++) {
// 		const roll = Math.floor(Math.random() * 6) + 1;
// 		sum += roll;
// 	}
// 	return sum;
// }

function getDiceOutcomeCounts(n) {
	// counts[i] = cummulative number of ways to roll a sum of i
	// each roll adds more to counts
	let rollSumCounts = Array(MAX_ROLL + 1).fill(0);
	rollSumCounts[0] = 1;

	for (let r = 0; r < n; r++) {
		const newCounts = Array(MAX_ROLL + 1).fill(0);
		for (let i = 0; i <= MAX_ROLL; i++) {
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

	const pathPoints = [[0, 0]];
	const nOutcomes = diceCounts.reduce((a, b) => a + b);

	for (let i = 0; i <= MAX_ROLL; i++) {
		const c1 = diceCounts[i];
		const c2 = diceCounts[i + 1] ?? 0;
		const bucketCenter = i + 0.5;
		pathPoints.push(
			[bucketCenter, c1],
			[bucketCenter + 0.5, c1],
			[bucketCenter + 0.5, c2],
		);
	}

	pathPoints.push([MAX_ROLL + 1, 0]);

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

// Get the data used to draw the dice
function getDiceData({ diceRoll, nDice } = {}) {
	const DICE_PER_ROW = 4;
	const DIE_SIZE = 0.2;
	const DIE_X_MARGIN = (1 - DICE_PER_ROW * DIE_SIZE) / (DICE_PER_ROW - 1);
	const DIE_Y_MARGIN =
		diceYScale.invert(diceXScale(DIE_X_MARGIN) - diceXScale(0)) -
		diceYScale.invert(0);

	// For the pips
	// Diff, Small, Medium, Large
	const D = 0.225;
	const M = 0.5;
	const S = M - D;
	const L = M + D;

	const pip = {
		topLeft: [S, S],
		topMid: [M, S],
		topRight: [L, S],
		midLeft: [S, M],
		midMid: [M, M],
		midRight: [L, M],
		botLeft: [S, L],
		botMid: [M, L],
		botRight: [L, L],
	};

	if (diceRoll === undefined) {
		diceRoll = Array(nDice ?? +numObjectsSlider.value).fill(0);
	}

	const diceData = Array.from(diceRoll).flatMap((value, i) => {
		const x = (i % DICE_PER_ROW) * (DIE_SIZE + DIE_X_MARGIN);
		const y = Math.floor(i / DICE_PER_ROW) * (DIE_SIZE + DIE_Y_MARGIN);

		const pips = (() => {
			if (value === 0) {
				return [];
			}

			const rotated = Math.random() < 0.5;

			if (value === 1) {
				return [pip.midMid, pip.midMid];
			} else if (value === 2) {
				return rotated
					? [pip.topLeft, pip.botRight]
					: [pip.topRight, pip.botLeft];
			} else if (value === 3) {
				return rotated
					? [pip.topLeft, pip.midMid, pip.botRight]
					: [pip.topRight, pip.midMid, pip.botLeft];
			} else if (value === 4) {
				return [pip.topLeft, pip.topRight, pip.botLeft, pip.botRight];
			} else if (value === 5) {
				return [
					pip.topLeft,
					pip.topRight,
					pip.midMid,
					pip.botLeft,
					pip.botRight,
				];
			} else if (value === 6) {
				return rotated
					? [
							pip.topLeft,
							pip.topMid,
							pip.topRight,
							pip.botLeft,
							pip.botMid,
							pip.botRight,
					  ]
					: [
							pip.topLeft,
							pip.topRight,
							pip.midLeft,
							pip.midRight,
							pip.botLeft,
							pip.botRight,
					  ];
			}
		})();

		const x0s = diceXScale(0);

		const rectX = diceXScale(x);
		const rectY = diceYScale(y);
		const sideLength = diceXScale(DIE_SIZE) - x0s;

		return [
			{
				shape: "rect",
				class: "die body",
				key: `die-${i}`,
				attrs: {
					x: rectX,
					y: rectY,
					width: sideLength,
					height: sideLength,
					rx: 10,
					ry: 10,
				},
			},
			...pips.map(([cx, cy], j) => ({
				shape: "circle",
				class: "die pip",
				key: `pip-${i}-${j}`,
				attrs: {
					cx: diceXScale(cx * DIE_SIZE) - x0s + rectX,
					cy: diceYScale(cy * DIE_SIZE) - x0s + rectY,
					r: 4.5,
					fill: "black",
				},
			})),
		];
	});

	return diceData;
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

let buckets;
function initializeBuckets() {
	buckets = Array(N_OUTCOMES).fill(0);
}
initializeBuckets();

function stopExperiment() {
	document.getElementById("slider-num-objects").disabled = true;
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

	document.getElementById("slider-num-objects").disabled = false;
	document.getElementById("btn-clear-experiment").disabled = true;
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	document.getElementById("number-of-measurements-slider").disabled = false;
	initializeBuckets();
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
	document.getElementById("slider-num-objects").disabled = true;
	document.getElementById("btn-clear-experiment").disabled = false;
	document.getElementById("btn-run").disabled = true;
	document.getElementById("btn-stop").disabled = false;
	document.getElementById("number-of-measurements-slider").disabled = true;

	const nDice = +numObjectsSlider.value;

	const maxSamplesGathered = 1000;
	let sampleIndex = maxSamplesGathered;
	let samples;
	function sampleCdf() {
		if (sampleIndex === maxSamplesGathered) {
			samples = Array(maxSamplesGathered + 1)
				.fill(0)
				.map(() => rollNDice(nDice));
			sampleIndex = 0;
		}
		sampleIndex += 1;
		return samples[sampleIndex];
	}

	const scaledX0 = probaXScale(X_0);
	const scaledY0 = probaYScale(Y_0);

	const nMeasurements = numMeasurementsSliderScale();
	let nMeasurementsSoFar = buckets.reduce((a, b) => a + b);
	console.log("nm", nMeasurementsSoFar);

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

		let lastDiceRoll;
		for (let i = 0; i < nExperiments; ++i) {
			const diceRoll = sampleCdf();
			const sum = diceRoll.reduce((a, b) => a + b);
			buckets[sum] += 1;

			lastDiceRoll = diceRoll;

			nMeasurementsSoFar += 1;
			if (nMeasurementsSoFar >= nMeasurements) {
				break;
			}
		}

		if (lastDiceRoll !== undefined) {
			const diceData = getDiceData({ diceRoll: lastDiceRoll });

			applyGraphicalObjs(dicePlot, diceData, {
				key: d => d.key,
				selector: ".die",
			});

			document.getElementById("text-dice-sum").innerText = lastDiceRoll.reduce(
				(a, b) => a + b,
			);
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
numObjectsSlider.oninput();
