/* global CONFIG, toTitleCase */

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

const TOTAL_DURATION_SEC = 3;
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
		CONFIG.configure(
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

	const lsRadius = Math.min(lsCanvasRadiusX, lsCanvasRadiusY);

	const photonRadius = lsRadius / 2;

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
		r: lsRadius,
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
			attrs: photonAttrAttrs,
			direction: "right",
		},
	];
}

function _getTracksData(canvasInfo) {
	console.log(canvasInfo);
	const nTiesVisible = 9;
	const lineExtendPastFrac = 0.05;

	const trackInteriorAxMinX = AX_MIN_X + lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMaxX = AX_MAX_X - lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMinY = AX_MIN_Y + lineExtendPastFrac * AX_HEIGHT;
	const trackInteriorAxMaxY = AX_MAX_Y - lineExtendPastFrac * AX_HEIGHT;

	const axDistBtwnTies =
		(trackInteriorAxMaxX - trackInteriorAxMinX) / (nTiesVisible - 1);

	const nTiesTotal = Math.ceil(
		nTiesVisible + axDistTraveled({ fracOfC: 1 }) / axDistBtwnTies,
	);

	// make ties
	const data = [];
	for (let i = 0; i < nTiesTotal; i++) {
		const tieAxX = trackInteriorAxMinX + i * axDistBtwnTies;

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

	// make rails
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
		.append(function (d) {
			return d3.create(`svg:${d.shape}`).node();
		})
		.each(function (d) {
			let d3Obj = d3.select(this).classed(d.class, true);

			Object.keys(d.attrs).forEach(key => {
				d3Obj = d3Obj.attr(key, d.attrs[key]);
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

	subcanvases.each(function (canvasInfo) {
		const distanceTrainTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: CONFIG.trainSpeed }),
		}).dx;

		const distanceLightTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: 1 }),
		}).dx;

		if (canvasInfo.observerIsStandingOn === "train") {
			d3.select(this)
				.selectAll(`.${CONFIG.railroadTie.class}`)
				.transition()
				.duration(0)
				.attr("x1", d => d.x0)
				.attr("x2", d => d.x0)
				.transition()
				.duration(TOTAL_DURATION_MS)
				.ease(d3.easeLinear)
				.attr("x1", d => d.x0 - distanceTrainTravels)
				.attr("x2", d => d.x0 - distanceTrainTravels);
		} else if (canvasInfo.observerIsStandingOn === "ground") {
			d3.select(this)
				.selectAll(
					`.${CONFIG.trainCar.class}, .${CONFIG.trainLightSource.class}`,
				)
				.each(function (d) {
					d3.select(this)
						.transition()
						.duration(0)
						.attr(d.originXAttr, d.x0)
						.transition()
						.duration(TOTAL_DURATION_MS)
						.ease(d3.easeLinear)
						.attr(d.originXAttr, d.x0 + distanceTrainTravels);
				});
		}

		d3.select(this)
			.selectAll(`.${CONFIG.trainPhoton.class}`)
			.each(function (d) {
				const xf =
					d.direction === "left"
						? d.x0 - distanceLightTravels
						: d.x0 + distanceLightTravels;
				d3.select(this)
					.transition()
					.duration(0)
					.attr("cx", d.x0)
					.transition()
					.duration(TOTAL_DURATION_MS)
					.ease(d3.easeLinear)
					.attr("cx", xf);
			});
	});
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
