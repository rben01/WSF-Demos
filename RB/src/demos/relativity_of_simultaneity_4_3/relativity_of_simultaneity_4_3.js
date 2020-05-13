/* global d3 */

const X_MARGIN_PROPTN = 0.0;
const Y_MARGIN_PROPTN = 0.2;

const TRAIN_WIDTH_PROPTN = 0.75;
const TRAIN_HEIGHT_PROPTN = 0.6;

const AX_MIN_X = 5;
const AX_MIN_Y = 3;
const AX_MAX_X = 10;
const AX_MAX_Y = 7;
const AX_WIDTH = AX_MAX_X - AX_MIN_X;
const AX_HEIGHT = AX_MAX_Y - AX_MIN_Y;
const AX_MID_X = AX_MIN_X + (AX_MAX_X - AX_MIN_X) / 2;
const AX_MID_Y = AX_MIN_Y + (AX_MAX_Y - AX_MIN_Y) / 2;

const AX_TRAIN_WIDTH = AX_WIDTH * TRAIN_WIDTH_PROPTN;
const AX_TRAIN_HEIGHT = AX_HEIGHT * TRAIN_HEIGHT_PROPTN;

const USER_INFO = {
	trainSpeed: 0.1,
};

const TOTAL_DURATION_SEC = 3;
const TOTAL_DURATION_MS = TOTAL_DURATION_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 400;

const canvas = d3
	.select("#canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.style("background-color", "black");

// Photon goes from center of train to end of train over the course of the animation
function axDistTraveled({ fracOfC }) {
	return (fracOfC * AX_TRAIN_WIDTH) / 2;
}

function transAxisToCanvas({ x, y, dx, dy }) {
	const xFrac = (x - AX_MIN_X) / AX_WIDTH;
	const yFrac = (y - AX_MIN_Y) / AX_HEIGHT;

	const xCanvasCoords =
		CANVAS_WIDTH * X_MARGIN_PROPTN + xFrac * CANVAS_WIDTH * (1 - 2 * X_MARGIN_PROPTN);
	const yCanvasCoords =
		CANVAS_HEIGHT * Y_MARGIN_PROPTN + yFrac * CANVAS_HEIGHT * (1 - 2 * Y_MARGIN_PROPTN);

	const dxCanvasCoords = (CANVAS_WIDTH / AX_WIDTH) * dx;
	const dyCanvasCoords = (CANVAS_HEIGHT / AX_HEIGHT) * dy;

	return {
		x: xCanvasCoords,
		y: yCanvasCoords,
		dx: dxCanvasCoords,
		dy: dyCanvasCoords,
	};
}

function addTrainAndLightSources(canvas) {
	const trainXMin = AX_MID_X - AX_TRAIN_WIDTH / 2;
	const trainYMin = AX_MID_Y - AX_TRAIN_HEIGHT / 2;

	const trainXMax = trainXMin + AX_TRAIN_WIDTH;
	const trainYMax = trainYMin + AX_TRAIN_HEIGHT;

	const trainMinCanvasCoords = transAxisToCanvas({ x: trainXMin, y: trainYMin });
	const trainMaxCanvasCoords = transAxisToCanvas({ x: trainXMax, y: trainYMax });

	const trainCanvasWidth = trainMaxCanvasCoords.x - trainMinCanvasCoords.x;
	const trainCanvasHeight = trainMaxCanvasCoords.y - trainMinCanvasCoords.y;

	canvas
		.append("rect")
		.attr("x", trainMinCanvasCoords.x)
		.attr("y", trainMinCanvasCoords.y)
		.attr("width", trainCanvasWidth)
		.attr("height", trainCanvasHeight)
		.attr("fill", "#4ff5");

	const lsCenterX = AX_MID_X;
	const lsCenterY = AX_MID_Y;
	const lsRadiusX = 0.03 * AX_WIDTH;
	const lsRadiusY = 0.03 * AX_HEIGHT;

	const {
		x: lsCanvasCenterX,
		y: lsCanvasCenterY,
		dx: lsCanvasRadiusX,
		dy: lsCanvasRadiusY,
	} = transAxisToCanvas({
		x: lsCenterX,
		y: lsCenterY,
		dx: lsRadiusX,
		dy: lsRadiusY,
	});

	const lsRadius = Math.min(lsCanvasRadiusX, lsCanvasRadiusY);

	canvas
		.append("circle")
		.attr("cx", lsCanvasCenterX)
		.attr("cy", lsCanvasCenterY)
		.attr("r", lsRadius)
		.attr("fill", "#fb3f")
		.attr("stroke", "#ffff");

	const photonRadius = lsRadius / 2;
	const photons = {};

	["photon1", "photon2"].forEach(photon => {
		photons[photon] = canvas
			.append("circle")
			.attr("cx", lsCanvasCenterX)
			.attr("cy", lsCanvasCenterY)
			.attr("r", photonRadius)
			.attr("fill", "#fd0f")
			.attr("stroke", "#ffff");
	});

	photons.xMin = trainMinCanvasCoords.x;
	photons.xMax = trainMaxCanvasCoords.x;
	photons.x0 = lsCanvasCenterX;

	return photons;
}

function addTracks(canvas) {
	const nTiesVisible = 11;
	const lineExtendPastFrac = 0.05;

	const trackInteriorXMin = AX_MIN_X + lineExtendPastFrac * AX_WIDTH;
	const trackInteriorXMax = AX_MAX_X - lineExtendPastFrac * AX_WIDTH;
	const trackInteriorYMin = AX_MIN_Y + lineExtendPastFrac * AX_HEIGHT;
	const trackInteriorYMax = AX_MAX_Y - lineExtendPastFrac * AX_HEIGHT;

	const distBtwnTies = (trackInteriorXMax - trackInteriorXMin) / (nTiesVisible - 1);

	// make rails
	const rails = [];
	[trackInteriorYMin, trackInteriorYMax].forEach(railY => {
		rails.push({
			p1: {
				x: AX_MIN_X,
				y: railY,
			},
			p2: {
				x: AX_MAX_X,
				y: railY,
			},
		});
	});

	const nTiesTotal = Math.ceil(
		nTiesVisible + axDistTraveled({ fracOfC: 1 }) / distBtwnTies,
	);

	// make ties
	const ties = [];
	for (var i = 0; i < nTiesTotal; i++) {
		const tieX = trackInteriorXMin + i * distBtwnTies;

		ties.push({
			p1: {
				x: tieX,
				y: AX_MIN_Y,
			},
			p2: {
				x: tieX,
				y: AX_MAX_Y,
			},
		});
	}

	const trackLines = {};

	const tieXCanvasLocs = [];
	[
		{
			name: "rails",
			lineArray: rails,
		},
		{
			name: "ties",
			lineArray: ties,
		},
	].forEach(obj => {
		const { name, lineArray } = obj;
		const lines = [];

		for (const line of lineArray) {
			const p1 = transAxisToCanvas(line.p1);
			const p2 = transAxisToCanvas(line.p2);

			if (name == "ties") {
				tieXCanvasLocs.push(p1.x);
			}

			lines.push(
				canvas
					.append("line")
					.style("stroke", "white")
					.style("stroke-width", 5)
					.attr("x1", p1.x)
					.attr("y1", p1.y)
					.attr("x2", p2.x)
					.attr("y2", p2.y),
			);
		}
		trackLines[name] = lines;
	});

	trackLines.tieXCanvasLocs = tieXCanvasLocs;

	return trackLines;
}

const trackLines = addTracks(canvas);

const photons = addTrainAndLightSources(canvas);

// eslint-disable-next-line no-unused-vars
function updateTrainSpeed(speed) {
	const trainSpeedInputValue =
		typeof speed != "undefined"
			? speed
			: document.getElementById("input-train-speed").value;

	try {
		const floatStr = Math.max(0, Math.min(parseFloat(trainSpeedInputValue), 1));
		USER_INFO.trainSpeed = floatStr;
		document.getElementById("train-speed-text").textContent = trainSpeedInputValue;
	} catch (e) {
		console.log(trainSpeedInputValue);
	}
}

// eslint-disable-next-line no-unused-vars
function beginAnimation() {
	document.getElementById("btn-run-animation").innerText = "Restart animation";
	const distanceTraveled = transAxisToCanvas({
		dx: axDistTraveled({ fracOfC: USER_INFO.trainSpeed }),
	}).dx;
	for (var i = 0; i < trackLines.tieXCanvasLocs.length; i++) {
		const tie = trackLines.ties[i];
		["x1", "x2"].forEach(attr => {
			const x0 = trackLines.tieXCanvasLocs[i];
			tie
				.transition()
				.duration(0)
				.attr(attr, x0)
				.transition()
				.duration(TOTAL_DURATION_MS)
				.ease(d3.easeLinear)
				.attr("x1", x0 - distanceTraveled)
				.attr("x2", x0 - distanceTraveled);
		});
	}

	// trackLines.ties.forEach(tie => {
	// const p1CanvasCoords = tie.attr("x1");
	// const p2CanvasCoords = tie.attr("x2");

	// const p1AxisCoords = transCanvasToAxis({ x: tie.attr("x1") });
	// const p2AxisCoords = transCanvasToAxis({ x: tie.attr("x2") });

	// console.log(p1AxisCoords);
	// console.log(p2AxisCoords);
	// [p1AxisCoords, p2AxisCoords].forEach(ac => {
	// 	ac.x -= axDistTraveled({ fracOfC: USER_INFO.trainSpeed }) * 1;
	// });

	// console.log(axDistTraveled({ fracOfC: USER_INFO.trainSpeed }));
	// console.log(p1AxisCoords);
	// console.log(p2AxisCoords);
	// 	tie
	// 		.transition()
	// 		.duration(TOTAL_DURATION_MS)
	// 		.ease(d3.easeLinear)
	// 		.attr("x1", tie.attr("x1") - distanceTraveled)
	// 		.attr("x2", tie.attr("x2") - distanceTraveled);
	// });

	photons.photon1
		.transition()
		.duration(0)
		.attr("cx", photons.x0)
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("cx", photons.xMin);

	photons.photon2
		.transition()
		.duration(0)
		.attr("cx", photons.x0)
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("cx", photons.xMax);
}
