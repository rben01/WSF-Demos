/* global d3 */

const AX_MIN_X = 5;
const AX_MIN_Y = 3;
const AX_MAX_X = 10;
const AX_MAX_Y = 7;
const AX_WIDTH = AX_MAX_X - AX_MIN_X;
const AX_HEIGHT = AX_MAX_Y - AX_MIN_Y;
const AX_MID_X = AX_MIN_X + (AX_MAX_X - AX_MIN_X) / 2;
const AX_MID_Y = AX_MIN_Y + (AX_MAX_Y - AX_MIN_Y) / 2;

const TRAIN_WIDTH_PROPTN = 0.75;
const TRAIN_HEIGHT_PROPTN = 0.5;

const USER_INFO = {
	trainSpeed: 0.1,
};

const TOTAL_DURATION_SEC = 3.5;
const TOTAL_DURATION_MS = TOTAL_DURATION_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 400;
const X_MARGIN_PROPTN = 0.0;
const Y_MARGIN_PROPTN = 0.2;

const canvas = d3
	.select("#canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.style("background-color", "black");

function totalDistTraveled({ speed }) {
	return TOTAL_DURATION_SEC * speed * 3;
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

function transCanvasToAxis({ x, y, dx, dy }) {
	const xFrac =
		(x - CANVAS_WIDTH * X_MARGIN_PROPTN) / (CANVAS_WIDTH * (1 - 2 * X_MARGIN_PROPTN));

	const yFrac =
		(y - CANVAS_HEIGHT * Y_MARGIN_PROPTN) / (CANVAS_HEIGHT * (1 - 2 * Y_MARGIN_PROPTN));

	const xAxisCoords = AX_MIN_X + xFrac * AX_WIDTH;
	const yAxisCoords = AX_MIN_Y + yFrac * AX_HEIGHT;

	const dxAxisCoords = (AX_WIDTH / CANVAS_WIDTH) * dx;
	const dyAxisCoords = (AX_HEIGHT / CANVAS_HEIGHT) * dy;

	return {
		x: xAxisCoords,
		y: yAxisCoords,
		dx: dxAxisCoords,
		dy: dyAxisCoords,
	};
}

function addTrainAndLightSources(canvas) {
	const trainWidth = TRAIN_WIDTH_PROPTN * AX_WIDTH;
	const trainHeight = TRAIN_HEIGHT_PROPTN * AX_HEIGHT;

	const trainXMin = AX_MID_X - trainWidth / 2;
	const trainYMin = AX_MID_Y - trainHeight / 2;

	const trainXMax = trainXMin + trainWidth;
	const trainYMax = trainYMin + trainHeight;

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
		nTiesVisible + totalDistTraveled({ speed: 1 }) / distBtwnTies,
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

	const trackLines = {
		tieXLocs: ties.map(tieLine => {
			return tieLine.p1.x;
		}),
	};
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

	return trackLines;
}

const trackLines = addTracks(canvas);
console.log(trackLines);

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
	for (var i = 0; i < trackLines.tieXLocs.length; i++) {
		["x1", "x2"].forEach(attr => {
			trackLines.ties[i].attr(attr, transAxisToCanvas({ x: trackLines.tieXLocs[i] }).x);
		});
	}

	trackLines.ties.forEach(tie => {
		const p1AxisCoords = transCanvasToAxis({ x: tie.attr("x1") });
		const p2AxisCoords = transCanvasToAxis({ x: tie.attr("x2") });

		[p1AxisCoords, p2AxisCoords].forEach(ac => {
			ac.x -= totalDistTraveled({ speed: USER_INFO.trainSpeed });
		});

		console.log(p1AxisCoords);
		console.log(p2AxisCoords);
		tie
			.transition()
			.duration(TOTAL_DURATION_MS)
			.ease(d3.easeLinear)
			.attr("x1", transAxisToCanvas(p1AxisCoords).x)
			.attr("x2", transAxisToCanvas(p2AxisCoords).x);
	});

	photons.photon1.attr("cx", photons.x0);
	photons.photon2.attr("cx", photons.x0);

	photons.photon1
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("cx", photons.xMin);

	photons.photon2
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("cx", photons.xMax);
}
