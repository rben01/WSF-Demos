/* global CONFIG, USER_INFO, getRailroadTieParams */

"use-strict";

const X_MARGIN_PROPTN = 0.0;
const Y_MARGIN_PROPTN = 0.15;

const TRAIN_WIDTH_PROPTN = 0.75;
const TRAIN_HEIGHT_PROPTN = 0.6;

const THIS_DEMO_SPEED_MULTIPLIER = 0.5 / CONFIG.axDistTraveledAsFracOfTrainWidth;

// If the program is bug-free, any reasonably scaled values of the axis bounds will work
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
	return (
		fracOfC *
		AX_TRAIN_WIDTH *
		CONFIG.axDistTraveledAsFracOfTrainWidth *
		THIS_DEMO_SPEED_MULTIPLIER
	);
}

function transAxisToCanvas({ x, y, dx, dy }) {
	const xFrac = (x - AX_MIN_X) / AX_WIDTH;
	const yFrac = (y - AX_MIN_Y) / AX_HEIGHT;

	const xCanvasCoords =
		CANVAS_WIDTH * X_MARGIN_PROPTN +
		xFrac * CANVAS_WIDTH * (1 - 2 * X_MARGIN_PROPTN);
	const yCanvasCoords =
		CANVAS_HEIGHT * Y_MARGIN_PROPTN +
		yFrac * CANVAS_HEIGHT * (1 - 2 * Y_MARGIN_PROPTN);

	const dxCanvasCoords = (CANVAS_WIDTH / AX_WIDTH) * dx;
	const dyCanvasCoords = (CANVAS_HEIGHT / AX_HEIGHT) * dy;

	return {
		x: xCanvasCoords,
		y: yCanvasCoords,
		dx: dxCanvasCoords,
		dy: dyCanvasCoords,
	};
}

function x1(d) {
	return d.p1.x;
}

function y1(d) {
	return d.p1.y;
}

function x2(d) {
	return d.p2.x;
}

function y2(d) {
	return d.p2.y;
}

function addTrainAndLightSources(canvas) {
	const trainXMin = AX_MID_X - AX_TRAIN_WIDTH / 2;
	const trainYMin = AX_MID_Y - AX_TRAIN_HEIGHT / 2;

	const trainXMax = trainXMin + AX_TRAIN_WIDTH;
	const trainYMax = trainYMin + AX_TRAIN_HEIGHT;

	const trainMinCanvasCoords = transAxisToCanvas({
		x: trainXMin,
		y: trainYMin,
	});
	const trainMaxCanvasCoords = transAxisToCanvas({
		x: trainXMax,
		y: trainYMax,
	});

	const trainCanvasWidth = trainMaxCanvasCoords.x - trainMinCanvasCoords.x;
	const trainCanvasHeight = trainMaxCanvasCoords.y - trainMinCanvasCoords.y;

	CONFIG.configure(
		canvas
			.append("rect")
			.attr("x", trainMinCanvasCoords.x)
			.attr("y", trainMinCanvasCoords.y)
			.attr("width", trainCanvasWidth)
			.attr("height", trainCanvasHeight),
		CONFIG.trainCar,
	);

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

	CONFIG.configure(
		canvas
			.append("circle")
			.attr("cx", lsCanvasCenterX)
			.attr("cy", lsCanvasCenterY)
			.attr("r", lsRadius),
		CONFIG.trainLightSource,
	);

	const photonRadius = lsRadius / 2;

	const axDistLightTravels = transAxisToCanvas({
		dx: axDistTraveled({ fracOfC: 1 }),
	}).dx;
	const photonData = [
		{ x0: lsCanvasCenterX, x1: lsCanvasCenterX - axDistLightTravels },
		{ x0: lsCanvasCenterX, x1: lsCanvasCenterX + axDistLightTravels },
	];
	const photons = CONFIG.configure(
		canvas
			.selectAll()
			.data(photonData)
			.enter()
			.append("circle")
			.attr("cx", d => d.x0)
			.attr("cy", lsCanvasCenterY)
			.attr("r", photonRadius),
		CONFIG.trainPhoton,
	);

	return photons;
}

function addTracks(canvas) {
	const lineExtendPastFrac = 0.05;

	const trackInteriorAxMinX = AX_MIN_X + lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMaxX = AX_MAX_X - lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMinY = AX_MIN_Y + lineExtendPastFrac * AX_HEIGHT;
	const trackInteriorAxMaxY = AX_MAX_Y - lineExtendPastFrac * AX_HEIGHT;

	// "zoom in" to keep train/track ratios consistent between demos
	const nTiesVisible =
		(((CONFIG.nTiesVisible * CONFIG.trainWidthProptn) / TRAIN_WIDTH_PROPTN) *
			(AX_MAX_X - AX_MIN_X)) /
		(trackInteriorAxMaxX - trackInteriorAxMinX);

	const { axDistBtwnTies, initialTieAxX } = getRailroadTieParams({
		trackInteriorAxMinX,
		trackInteriorAxMaxX,
		nTiesVisible,
	});

	const nTiesTotal = Math.ceil(
		nTiesVisible +
			axDistTraveled({ fracOfC: CONFIG.maxTrainSpeed }) / axDistBtwnTies,
	);

	// make ties
	const tiesCanvasCoords = [];
	for (let i = 0; i < nTiesTotal; i++) {
		const tieAxX = initialTieAxX + i * axDistBtwnTies;

		const [p1, p2] = [
			{ x: tieAxX, y: AX_MIN_Y },
			{ x: tieAxX, y: AX_MAX_Y },
		].map(transAxisToCanvas);
		tiesCanvasCoords.push({
			p1,
			p2,
			baseX: p1.x,
		});
	}

	const ties = CONFIG.configure(
		canvas
			.selectAll()
			.data(tiesCanvasCoords)
			.enter()
			.append("line")
			.attr("x1", x1)
			.attr("y1", y1)
			.attr("x2", x2)
			.attr("y2", y2),
		CONFIG.railroadTie,
	);

	// make rails
	const railsCanvasCoords = [];
	[trackInteriorAxMinY, trackInteriorAxMaxY].forEach(railY => {
		const [p1, p2] = [
			{ x: AX_MIN_X, y: railY },
			{ x: AX_MAX_X, y: railY },
		].map(transAxisToCanvas);
		railsCanvasCoords.push({
			p1,
			p2,
		});
	});

	const rails = CONFIG.configure(
		canvas
			.selectAll()
			.data(railsCanvasCoords)
			.enter()
			.append("line")
			.attr("x1", x1)
			.attr("y1", y1)
			.attr("x2", x2)
			.attr("y2", y2),
		CONFIG.railroadRail,
	);

	return {
		ties,
		rails,
	};
}

const trackLines = addTracks(canvas);

const photons = addTrainAndLightSources(canvas);

const playbackInfo = {
	animationIsPlaying: false,
	animationStartDate: null,
	animationTimer: null,
	beginButton: document.getElementById("btn-run-animation"),
	resetButton: document.getElementById("btn-reset-animation"),
};

// eslint-disable-next-line no-unused-vars
function beginAnimation() {
	if (playbackInfo.animationIsPlaying) {
		return;
	}

	playbackInfo.animationIsPlaying = true;
	playbackInfo.animationStartDate = new Date();
	playbackInfo.beginButton.disabled = true;
	playbackInfo.resetButton.disabled = false;

	playbackInfo.animationTimer = setTimeout(() => {
		playbackInfo.animationIsPlaying = false;
		playbackInfo.animationEndDate = new Date();
	}, TOTAL_DURATION_MS);

	// I've sort of lost track of the math happening here, but empirically it all works out
	const distanceTrainTravels = transAxisToCanvas({
		dx: axDistTraveled({
			fracOfC: USER_INFO.trainSpeed,
		}),
	}).dx;

	trackLines.ties
		.transition()
		.duration(0)
		.attr("x1", d => d.baseX)
		.attr("x2", d => d.baseX)
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("x1", d => d.baseX - distanceTrainTravels)
		.attr("x2", d => d.baseX - distanceTrainTravels);

	photons
		.transition()
		.duration(0)
		.attr("cx", d => d.x0)
		.transition()
		.duration(TOTAL_DURATION_MS)
		.ease(d3.easeLinear)
		.attr("cx", d => d.x1);
}

// eslint-disable-next-line no-unused-vars
function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearTimeout(playbackInfo.animationTimer);

	playbackInfo.beginButton.disabled = false;
	playbackInfo.resetButton.disabled = true;

	const elapsedTimeMS =
		new Date().getTime() - playbackInfo.animationStartDate.getTime();

	const easing = CONFIG.easingForAnimationReset;
	const durationMS =
		CONFIG.durationMSOfAnimationReset *
		Math.min(1, 0.5 * (1 + elapsedTimeMS / TOTAL_DURATION_MS));

	trackLines.ties
		.transition()
		.duration(durationMS)
		.ease(easing)
		.attr("x1", d => d.baseX)
		.attr("x2", d => d.baseX);

	photons
		.transition()
		.duration(durationMS)
		.ease(easing)
		.attr("cx", d => d.x0);
}
