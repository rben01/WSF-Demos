/* globals AESTHETIC CONFIG USER_INFO TOTAL_DURATION_MS isIterable playbackInfo subcanvases transAxisToCanvas axDistTraveled */

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

const POLE_BARN_RATIO = 1.5;
const BARN_WIDTH_PROPTN = 0.2;
const BARN_HEIGHT_PROPTN = 0.5;
const POLE_WIDTH_PROPTN = BARN_WIDTH_PROPTN * POLE_BARN_RATIO;

const AX_BARN_WIDTH = AX_WIDTH * BARN_WIDTH_PROPTN;
const AX_BARN_HEIGHT = AX_HEIGHT * BARN_HEIGHT_PROPTN;
const AX_POLE_WIDTH = AX_WIDTH * POLE_WIDTH_PROPTN;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 400;

const canvas = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const xyz = d3.selectAll("svg");

const subcanvases = canvas
	.data([
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
			observerIsStandingOn: "barn",
		},
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
			observerIsStandingOn: "pole",
		},
	])
	.each(function (d) {
		d3.select(this)
			.append("g")
			.attr("transform", `translate(0, ${d.originY})`)
			.classed("subcanvas", true);
	})
	.selectAll("g");

function lorentzFactor({ fracOfC }) {
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}

function transAxisToCanvas(canvasInfo, { x, y, dx, dy }) {
	const xList = isIterable(x) ? x : [x];
	const yList = isIterable(y) ? y : [y];
	const dxList = isIterable(dx) ? dx : [dx];
	const dyList = isIterable(dy) ? dy : [dy];

	const xFracList = xList.map(x => (x - AX_MIN_X) / AX_WIDTH);
	const yFracList = yList.map(y => (y - AX_MIN_Y) / AX_HEIGHT);

	const xCanvasCoordsList = xFracList.map(xFrac => xFrac * canvasInfo.width);
	const yCanvasCoordsList = yFracList.map(yFrac => yFrac * canvasInfo.height);

	const dxCanvasCoordsList = dxList.map(dx => (canvasInfo.width / AX_WIDTH) * dx);
	const dyCanvasCoordsList = dyList.map(dy => (canvasInfo.height / AX_HEIGHT) * dy);

	return {
		x: isIterable(x) ? xCanvasCoordsList : xCanvasCoordsList[0],
		y: isIterable(y) ? yCanvasCoordsList : yCanvasCoordsList[0],
		dx: isIterable(dx) ? dxCanvasCoordsList : dxCanvasCoordsList[0],
		dy: isIterable(dy) ? dyCanvasCoordsList : dyCanvasCoordsList[0],
	};
}

function _getBarnData(canvasInfo) {
	const barnMidAxX =
		canvasInfo.observerIsStandingOn === "barn"
			? AX_MIN_Y + (2 / 3) * AX_WIDTH
			: AX_MIN_Y + (1 / 3) * AX_WIDTH;
	const barnMidAxY = AX_MID_Y;

	const barnMinAxX = barnMidAxX - AX_BARN_WIDTH / 2;
	const barnMinAxY = barnMidAxY - AX_BARN_HEIGHT / 2;

	const barnDoorAxHeight = (1 / 3) * AX_BARN_HEIGHT;
	const barnSideWallAxHeight = (AX_BARN_HEIGHT - barnDoorAxHeight) / 2;

	const {
		x: [barnMidCanvasX, barnMinCanvasX],
		y: [barnMinCanvasY],
		dx: barnCanvasWidth,
		dy: [barnCanvasHeight, barnDoorCanvasHeight, barnDoorSideWallCanvasHeight],
	} = transAxisToCanvas(canvasInfo, {
		x: [barnMidAxX, barnMinAxX],
		y: [barnMinAxY],
		dx: AX_BARN_WIDTH,
		dy: [AX_BARN_HEIGHT, barnDoorAxHeight, barnSideWallAxHeight],
	});

	const dashArray = [
		barnCanvasWidth + barnDoorSideWallCanvasHeight,
		barnDoorCanvasHeight,
		barnDoorSideWallCanvasHeight + barnCanvasWidth + barnDoorSideWallCanvasHeight,
		barnDoorCanvasHeight,
		barnDoorSideWallCanvasHeight,
	].join(" ");

	return [
		{
			class: "barn-body",
			canvas: canvasInfo,
			shape: "rect",
			midX: barnMidCanvasX,
			attrs: {
				x: barnMinCanvasX,
				y: barnMinCanvasY,
				width: barnCanvasWidth,
				height: barnCanvasHeight,
				fill: AESTHETIC.solidFill,
				stroke: AESTHETIC.solidStroke,
				"stroke-dasharray": dashArray,
			},
		},
	];
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

function addBarns(subcanvases) {
	return _addGraphicalObjs(subcanvases, _getBarnData);
}

const barns = addBarns(subcanvases);

// const tracks = addTracks(subcanvases);
// const trainAndLightSources = addTrainAndLightSources(subcanvases);

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
			dx: axDistTraveled({ fracOfC: USER_INFO.trainSpeed }),
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

			d3.select(this)
				.selectAll(`.${CONFIG.trainPhoton.class}`)
				.each(function (d) {
					const xf =
						d.direction === "left"
							? d.x0 - distanceLightTravels + distanceTrainTravels
							: d.x0 + distanceLightTravels + distanceTrainTravels;
					d3.select(this)
						.transition()
						.duration(0)
						.attr("cx", d.x0)
						.transition()
						.duration(TOTAL_DURATION_MS)
						.ease(d3.easeLinear)
						.attr("cx", xf);
				});
		}
	});
}
