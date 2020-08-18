/* global AESTHETIC  */

"use strict";

const USER_INFO = { trainSpeed: 0.1 };

const CONFIG = Object.freeze({
	xMarginProptn: 0,
	yMarginProptn: 0.15,
	trainWidthProptn: 0.4,
	trainHeightProptn: 0.6,
	nTiesVisible: 9,
	axDistTraveledAsFracOfTrainWidth: 1.2,
	maxTrainSpeed: 0.99,

	trainCar: {
		class: "train-car",
		attrs: {
			fill: AESTHETIC.solidFill,
			stroke: AESTHETIC.solidStroke,
		},
	},
	trainLightSource: {
		class: "train-light-source",
		attrs: {
			fill: "white",
			stroke: "white",
		},
	},
	trainPhoton: {
		class: "train-photon",
		attrs: {
			fill: "#fff8",
			stroke: "white",
		},
	},
	railroadTie: {
		class: "railroad-tie",
		attrs: {
			stroke: "white",
			"stroke-width": 6,
		},
	},
	railroadRail: {
		class: "railroad-rail",
		attrs: {
			stroke: "white",
			"stroke-width": 5,
		},
	},
	canvasText: {
		attrs: {
			fill: "white",
			"font-size": "30px",
			"font-family": "sans-serif",
		},
	},
});

// https://stackoverflow.com/a/196991
function toTitleCase(str) {
	return str.replace(/\b\w+/g, function (txt) {
		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	});
}

// eslint-disable-next-line no-unused-vars
function getRailroadTieParams({
	trackInteriorAxMinX,
	trackInteriorAxMaxX,
	nTiesVisible,
	gamma,
}) {
	if (gamma === undefined) {
		gamma = 1;
	}

	nTiesVisible *= gamma;

	const trackInteriorAxWidth = trackInteriorAxMaxX - trackInteriorAxMinX;

	const axDistBtwnTies = trackInteriorAxWidth / (nTiesVisible - 1);

	const middleTieAxX = (trackInteriorAxMinX + trackInteriorAxMaxX) / 2;
	const initialTieAxX =
		middleTieAxX - Math.floor((nTiesVisible + 10) / 2) * axDistBtwnTies;

	return {
		axDistBtwnTies,
		initialTieAxX,
	};
}

document.getElementById("input-train-speed").max = `${CONFIG.maxTrainSpeed}`;

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

function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
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

function _getTrainAndLightSourcesData(canvasInfo, v) {
	const gamma =
		canvasInfo.observerIsStandingOn === "train" ? 1 : lorentzFactor({ fracOfC: v });

	const trainWidth = AX_TRAIN_WIDTH / gamma;

	const trainXMin = AX_MID_X - trainWidth / 2;
	const trainYMin = AX_MID_Y - AX_TRAIN_HEIGHT / 2;

	const trainXMax = trainXMin + trainWidth;
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
			attrs: photonAttrAttrs,
			direction: "right",
		},
	];
}

function _getTracksData(canvasInfo, v) {
	const gamma =
		canvasInfo.observerIsStandingOn === "ground"
			? 1
			: lorentzFactor({ fracOfC: v });

	const lineExtendPastFrac = 0.05;

	const trackInteriorAxMinX = AX_MIN_X + lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMaxX = AX_MAX_X - lineExtendPastFrac * AX_WIDTH;
	const trackInteriorAxMinY = AX_MIN_Y + lineExtendPastFrac * AX_HEIGHT;
	const trackInteriorAxMaxY = AX_MAX_Y - lineExtendPastFrac * AX_HEIGHT;

	const { axDistBtwnTies, initialTieAxX } = getRailroadTieParams({
		trackInteriorAxMinX,
		trackInteriorAxMaxX,
		nTiesVisible: CONFIG.nTiesVisible,
		gamma,
	});

	const nTiesTotal =
		canvasInfo.observerIsStandingOn === "ground"
			? CONFIG.nTiesVisible + 10
			: Math.ceil(
					CONFIG.nTiesVisible * lorentzFactor({ fracOfC: 0.991 }) +
						20 +
						axDistTraveled({ fracOfC: CONFIG.maxTrainSpeed }) /
							axDistBtwnTies,
			  );

	console.log(nTiesTotal, v);

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
				"stroke-width": CONFIG.railroadTie.attrs["stroke-width"] / gamma,
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

function _addGraphicalObjs(subcanvases, dataFunc, { selector, classes } = {}) {
	return subcanvases
		.selectAll(selector)
		.data(dataFunc)
		.join(
			enter => enter.append(d => d3.create(`svg:${d.shape}`).node()),
			update => update,
			exit => exit.remove(),
		)
		.each(function (d) {
			const d3Obj = d3.select(this).classed(d.class, true);

			d3Obj.classed("c", true);
			for (const c of classes) {
				d3Obj.classed(c, true);
			}

			Object.keys(d.attrs).forEach(key => {
				d3Obj.attr(key, d.attrs[key]);
			});

			return d3Obj;
		});
}

const sliders = {
	v: document.getElementById("input-train-speed"),
};

function addTracks(subcanvases, { selector } = {}) {
	const v = +sliders.v.value;
	return _addGraphicalObjs(subcanvases, canvasInfo => _getTracksData(canvasInfo, v), {
		selector,
		classes: ["tracks"],
	});
}

function addTrain(subcanvases, { selector } = {}) {
	const v = +sliders.v.value;
	return _addGraphicalObjs(
		subcanvases,
		canvasInfo =>
			_getTrainAndLightSourcesData(canvasInfo, v).filter(
				d => d.class === CONFIG.trainCar.class,
			),
		{ selector, classes: ["train"] },
	);
}

function addLights(subcanvases, { selector } = {}) {
	const v = +sliders.v.value;
	return _addGraphicalObjs(
		subcanvases,
		canvasInfo =>
			_getTrainAndLightSourcesData(canvasInfo, v).filter(
				d => d.class !== CONFIG.trainCar.class,
			),
		{ selector, classes: ["light"] },
	);
}

let tracks = addTracks(subcanvases);
let trains = addTrain(subcanvases);
let lights = addLights(subcanvases);

const playbackInfo = {
	animationStartDate: null,
	animationTimer: null,
	animationIsPlaying: false,
	isInitialized: true,
	beginButton: document.getElementById("btn-run-animation"),
	resetButton: document.getElementById("btn-reset-animation"),
};

let timer = null;

// eslint-disable-next-line no-unused-vars
function updateTrainSpeed(speed) {
	const trainSpeedInputValue =
		typeof speed !== "undefined"
			? speed
			: document.getElementById("input-train-speed").value;

	try {
		const floatVal = parseFloat(trainSpeedInputValue);
		if (floatVal < 0 || floatVal > 1) {
			console.log(`Got invalid speed (outside [0,1]): ${floatVal}`);
		}
		const clamped = Math.max(0, Math.min(floatVal, 1));
		USER_INFO.trainSpeed = clamped;
		document.getElementById(
			"train-speed-text",
		).textContent = (+trainSpeedInputValue).toFixed(3);

		clearTimeout(timer);
		const timeElapsedMS = new Date() - playbackInfo.animationStartDate;

		const animationWasPlaying = playbackInfo.animationIsPlaying;
		timer = setTimeout(
			() => {
				subcanvases.each(function (canvasInfo) {
					const subcanvas = d3.select(this);
					const tracksData = _getTracksData(
						canvasInfo,
						+trainSpeedInputValue,
					);
					const ties = tracksData.filter(d => d.class === "railroad-tie");
					subcanvas
						.selectAll(".railroad-tie")
						.data(ties)
						.join(
							enter =>
								enter
									.append("line")
									.attr("stroke", d => d.attrs.stroke)
									.classed("railroad-tie", true),
							update => update,
							exit => exit.remove(),
						)
						.transition()
						.duration(animationWasPlaying ? 200 : 0)
						.attr("x1", d => d.attrs.x1)
						.attr("x2", d => d.attrs.x2)
						.attr("y1", d => d.attrs.y1)
						.attr("y2", d => d.attrs.y2)
						.attr("stroke-width", d => d.attrs["stroke-width"]);

					const trainAndLightsData = _getTrainAndLightSourcesData(
						canvasInfo,
						+trainSpeedInputValue,
					);
					const trainData = trainAndLightsData.filter(
						d => d.class === CONFIG.trainCar.class,
					);
					const distanceTrainTravels = transAxisToCanvas(canvasInfo, {
						dx: axDistTraveled({ fracOfC: +clamped }),
					}).dx;
					subcanvas
						.selectAll(".train-car")
						.data(trainData)
						.join(
							enter =>
								enter
									.append("rect")
									.attr("fill", d => d.attrs.fill)
									.attr("stroke", d => d.attrs.stroke)
									.attr("y", d => d.attrs.y)
									.attr("height", d => d.attrs.height)
									.classed("train-car", true),
							update => update,
							exit => exit.remove(),
						)
						.transition()
						.duration(animationWasPlaying ? 200 : 0)
						.attr(
							"x",
							d =>
								d.x0 +
								(canvasInfo.observerIsStandingOn === "ground" &&
								!playbackInfo.isInitialized
									? distanceTrainTravels
									: 0),
						)
						.attr("width", d => d.attrs.width);

					const lightSourceData = trainAndLightsData.filter(
						d => d.class === "train-light-source",
					);
					subcanvas
						.selectAll(".train-light-source")
						.data(lightSourceData)
						.join(
							enter =>
								enter
									.append("circle")
									.attr("fill", d => d.attrs.fill)
									.attr("stroke", d => d.attrs.stroke)
									.attr("cy", d => d.attrs.cy)
									.attr("r", d => d.attrs.r)
									.classed("train-car", true),
							update => update,
							exit => exit.remove(),
						)
						.transition()
						.duration(animationWasPlaying ? 200 : 0)
						.attr(
							"cx",
							d =>
								d.x0 +
								(canvasInfo.observerIsStandingOn === "ground" &&
								!playbackInfo.isInitialized
									? distanceTrainTravels
									: 0),
						);
				});
			},
			animationWasPlaying ? TOTAL_DURATION_MS - timeElapsedMS : 0,
		);
	} catch (e) {
		console.log(trainSpeedInputValue);
	}
}

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

	setTimeout(() => {
		playbackInfo.isInitialized = true;
	}, durationMS + 10);

	tracks
		.filter(function (d) {
			const o = d3.select(this);
			return (
				o.classed("railroad-tie") && d.canvas.observerIsStandingOn === "train"
			);
		})
		.transition()
		.duration(durationMS)
		.ease(easing)
		.attr("x1", d => d.x0)
		.attr("x2", d => d.x0);

	for (const objs of [trains, lights]) {
		objs.each(function (d) {
			d3.select(this)
				.transition()
				.duration(durationMS)
				.ease(easing)
				.attr(d.originXAttr, d.x0);
		});
	}
}
