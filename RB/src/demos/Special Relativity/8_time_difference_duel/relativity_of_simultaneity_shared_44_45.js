/* global AESTHETIC CONFIG, toTitleCase, getRailroadTieParams */

"use strict";

// If the program is bug-free, any reasonably scaled values of the axis bounds will work
const AX_MIN_X = 5;
const AX_MIN_Y = 3;
const AX_MAX_X = 10;
const AX_MAX_Y = 7;
const AX_WIDTH = AX_MAX_X - AX_MIN_X;
const AX_HEIGHT = AX_MAX_Y - AX_MIN_Y;
const AX_MID_X = AX_MIN_X + (AX_MAX_X - AX_MIN_X) / 2;
const AX_MID_Y = AX_MIN_Y + (AX_MAX_Y - AX_MIN_Y) / 2;

const AX_TRAIN_WIDTH = AX_WIDTH * CONFIG.trainWidthProptn;
const AX_TRAIN_HEIGHT = AX_HEIGHT * CONFIG.trainHeightProptn;

const TOTAL_DURATION_SEC = 4.5;
const TOTAL_DURATION_MS = TOTAL_DURATION_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 550;

const canvas = d3
	.select("#canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const subcanvases = canvas
	.selectAll()
	.data([
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT / 2,
			observerIsStandingOn: "train",
		},
		{
			originX: 0,
			originY: CANVAS_HEIGHT / 2,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT / 2,
			observerIsStandingOn: "ground",
		},
	])
	.enter()
	.append("g")
	.attr("transform", d => `translate(0, ${d.originY})`)
	.each(function (d) {
		AESTHETIC.configure(
			d3
				.select(this)
				.append("text")
				.text(toTitleCase(`Events as seen from ${d.observerIsStandingOn}`))
				.attr("y", d.height / 10),
			CONFIG.canvasText,
		);
	})
	.classed("subcanvas", true);

// How far something traveling at fracOfC should travel
function axDistTraveled({ fracOfC }) {
	return fracOfC * AX_TRAIN_WIDTH * CONFIG.axDistTraveledAsFracOfTrainWidth;
}

function transAxisToCanvas(canvasInfo, { x, y, dx, dy }) {
	const xFrac = (x - AX_MIN_X) / AX_WIDTH;
	const yFrac = (y - AX_MIN_Y) / AX_HEIGHT;

	const xCanvasCoords =
		canvasInfo.width * CONFIG.xMarginProptn +
		xFrac * canvasInfo.width * (1 - 2 * CONFIG.xMarginProptn);
	const yCanvasCoords =
		canvasInfo.height * CONFIG.yMarginProptn +
		yFrac * canvasInfo.height * (1 - 2 * CONFIG.yMarginProptn);

	const dxCanvasCoords = (canvasInfo.width / AX_WIDTH) * dx;
	const dyCanvasCoords = (canvasInfo.height / AX_HEIGHT) * dy;

	return {
		x: xCanvasCoords,
		y: yCanvasCoords,
		dx: dxCanvasCoords,
		dy: dyCanvasCoords,
	};
}

function _getTrainAndLightSourcesData(canvasInfo) {
	const trainXMin = AX_MID_X - AX_TRAIN_WIDTH / 2;
	const trainYMin = AX_MID_Y - AX_TRAIN_HEIGHT / 2;

	const trainXMax = trainXMin + AX_TRAIN_WIDTH;
	const trainYMax = trainYMin + AX_TRAIN_HEIGHT;

	const trainMinCanvasCoords = transAxisToCanvas(canvasInfo, {
		x: trainXMin,
		y: trainYMin,
	});
	const trainMaxCanvasCoords = transAxisToCanvas(canvasInfo, {
		x: trainXMax,
		y: trainYMax,
	});

	const trainCanvasWidth = trainMaxCanvasCoords.x - trainMinCanvasCoords.x;
	const trainCanvasHeight = trainMaxCanvasCoords.y - trainMinCanvasCoords.y;

	const lsCenterX = AX_MID_X;
	const lsCenterY = AX_MID_Y;
	const lsRadiusX = 0.03 * AX_WIDTH;
	const lsRadiusY = 0.03 * AX_HEIGHT;

	const {
		x: lsCanvasCenterX,
		y: lsCanvasCenterY,
		dx: lsCanvasRadiusX,
		dy: lsCanvasRadiusY,
	} = transAxisToCanvas(canvasInfo, {
		x: lsCenterX,
		y: lsCenterY,
		dx: lsRadiusX,
		dy: lsRadiusY,
	});

	const lightSourceRadius = Math.min(lsCanvasRadiusX, lsCanvasRadiusY);

	const photonRadius = lightSourceRadius / 2;

	const circleTopLevelAttrs = {
		shape: "circle",
		x0: lsCanvasCenterX,
		originXAttr: "cx",
	};

	const _circleAttrAttrs = {
		cx: lsCanvasCenterX,
		cy: lsCanvasCenterY,
	};

	const lightSourceAttrs = {
		..._circleAttrAttrs,
		r: lightSourceRadius,
		...CONFIG.trainLightSource.attrs,
	};

	const photonAttrAttrs = {
		..._circleAttrAttrs,
		r: photonRadius,
		...CONFIG.trainPhoton.attrs,
	};

	return [
		{
			class: CONFIG.trainCar.class,
			canvas: canvasInfo,
			shape: "rect",
			x0: trainMinCanvasCoords.x,
			originXAttr: "x",
			attrs: {
				x: trainMinCanvasCoords.x,
				y: trainMinCanvasCoords.y,
				width: trainCanvasWidth,
				height: trainCanvasHeight,
				...CONFIG.trainCar.attrs,
			},
		},
		{
			class: CONFIG.trainLightSource.class,
			canvas: canvasInfo,
			...circleTopLevelAttrs,
			attrs: lightSourceAttrs,
		},
		{
			class: CONFIG.trainPhoton.class,
			canvas: canvasInfo,
			...circleTopLevelAttrs,
			attrs: photonAttrAttrs,
			direction: "left",
		},
		{
			class: CONFIG.trainPhoton.class,
			canvas: canvasInfo,
			...circleTopLevelAttrs,
			attrs: { ...photonAttrAttrs, fill: "#4ad8" },
			direction: "right",
		},
	];
}

function _getTracksData(canvasInfo) {
	const lineExtendPastFrac = 0.05;

	const trackInteriorAxMinX = AX_MIN_X + lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMaxX = AX_MAX_X - lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMinY = AX_MIN_Y + lineExtendPastFrac * AX_HEIGHT;
	const trackInteriorAxMaxY = AX_MAX_Y - lineExtendPastFrac * AX_HEIGHT;

	const { axDistBtwnTies, initialTieAxX } = getRailroadTieParams({
		trackInteriorAxMinX,
		trackInteriorAxMaxX,
		nTiesVisible: CONFIG.nTiesVisible,
	});

	const nTiesTotal =
		canvasInfo.observerIsStandingOn === "ground"
			? CONFIG.nTiesVisible
			: Math.ceil(
					CONFIG.nTiesVisible +
						axDistTraveled({ fracOfC: CONFIG.maxTrainSpeed }) /
							axDistBtwnTies,
			  );

	// make ties
	const data = [];
	for (let i = 0; i < nTiesTotal; i++) {
		const tieAxX = initialTieAxX + i * axDistBtwnTies;

		const [p1, p2] = [
			{ x: tieAxX, y: AX_MIN_Y },
			{ x: tieAxX, y: AX_MAX_Y },
		].map(p => transAxisToCanvas(canvasInfo, p));

		data.push({
			class: CONFIG.railroadTie.class,
			canvas: canvasInfo,
			x0: p1.x,
			shape: "line",
			attrs: {
				x1: p1.x,
				y1: p1.y,
				x2: p2.x,
				y2: p2.y,
				...CONFIG.railroadTie.attrs,
			},
		});
	}

	// make rails -- has to go after ties because in SVGs the z-order is determined by order created, so if rails are supposed to lie above the ties...
	[trackInteriorAxMinY, trackInteriorAxMaxY].forEach(railY => {
		const [p1, p2] = [
			{ x: AX_MIN_X, y: railY },
			{ x: AX_MAX_X, y: railY },
		].map(p => transAxisToCanvas(canvasInfo, p));

		data.push({
			class: CONFIG.railroadRail.class,
			canvas: canvasInfo,
			shape: "line",
			attrs: {
				x1: p1.x,
				y1: p1.y,
				x2: p2.x,
				y2: p2.y,
				...CONFIG.railroadRail.attrs,
			},
		});
	});

	return data;
}

function _addGraphicalObjs(subcanvases, dataFunc) {
	return subcanvases
		.selectAll()
		.data(dataFunc)
		.enter()
		.append(d => d3.create(`svg:${d.shape}`).node())
		.each(function (d) {
			const d3Obj = d3.select(this).classed(d.class, true);

			Object.keys(d.attrs).forEach(key => {
				d3Obj.attr(key, d.attrs[key]);
			});

			return d3Obj;
		});
}

function addTracks(subcanvases) {
	return _addGraphicalObjs(subcanvases, _getTracksData);
}

function addTrainAndLightSources(subcanvases) {
	return _addGraphicalObjs(subcanvases, _getTrainAndLightSourcesData);
}

const tracks = addTracks(subcanvases);
const trainAndLightSources = addTrainAndLightSources(subcanvases);

const playbackInfo = {
	animationIsPlaying: false,
	animationStartDate: null,
	animationTimer: null,
	beginButton: document.getElementById("btn-run-animation"),
	resetButton: document.getElementById("btn-reset-animation"),
};

// eslint-disable-next-line no-unused-vars
function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearTimeout(playbackInfo.animationTimer);

	playbackInfo.beginButton.disabled = false;
	playbackInfo.resetButton.disabled = true;

	const elapsedTimeMS =
		new Date().getTime() - playbackInfo.animationStartDate.getTime();

	const easing = AESTHETIC.easingForAnimationReset;
	const durationMS =
		AESTHETIC.durationMSOfAnimationReset *
		Math.min(1, 0.5 * (1 + elapsedTimeMS / TOTAL_DURATION_MS));

	tracks
		.filter(
			d =>
				d.class === CONFIG.railroadTie.class &&
				d.canvas.observerIsStandingOn === "train",
		)
		.transition()
		.duration(durationMS)
		.ease(easing)
		.attr("x1", d => d.x0)
		.attr("x2", d => d.x0);

	trainAndLightSources.each(function (d) {
		d3.select(this)
			.transition()
			.duration(durationMS)
			.ease(easing)
			.attr(d.originXAttr, d.x0);
	});
}
