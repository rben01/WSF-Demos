/* globals AESTHETIC CONFIG isIterable */

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

const POLE_PHYSICAL_SIZE = 9;
const BARN_PHYSICAL_SIZE = 6;

const POLE_BARN_RATIO = 1.5;
const BARN_WIDTH_PROPTN = 0.2;
const BARN_HEIGHT_PROPTN = 0.8;
const POLE_WIDTH_PROPTN = BARN_WIDTH_PROPTN * POLE_BARN_RATIO;

const AX_BARN_WIDTH = AX_WIDTH * BARN_WIDTH_PROPTN;
const AX_BARN_HEIGHT = AX_HEIGHT * BARN_HEIGHT_PROPTN;
const AX_POLE_WIDTH = AX_WIDTH * POLE_WIDTH_PROPTN;

const TIME_FOR_LIGHT_TO_TRAVERSE_SEC = 2; // seconds
const TIME_FOR_LIGHT_TO_TRAVERSE_MS = TIME_FOR_LIGHT_TO_TRAVERSE_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 100;

const USER_INFO = { relativeSpeed: 0.1 };

const canvas = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

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
	if (typeof fracOfC === "undefined") {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}

function apparentWidthsMeters({ fracOfC }) {
	const lf = lorentzFactor({ fracOfC });
	return {
		barn: BARN_PHYSICAL_SIZE / lf,
		pole: POLE_PHYSICAL_SIZE / lf,
	};
}

const speedInputSlider = document.getElementById("input-relative-speed");
const speedTextSpan = document.getElementById("relative-speed-text");

function getSpeed(speedStr) {
	speedStr = typeof speedStr !== "undefined" ? speedStr : speedInputSlider.value;
	const floatVal = parseFloat(speedStr);
	if (floatVal < 0 || floatVal > 1) {
		throw new Error(`Got invalid speed (outside [0,1]): ${floatVal}`);
	}

	return floatVal;
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

function _getBarnDatum(canvasInfo, { fracOfC }) {
	const lf = lorentzFactor({ fracOfC });

	const barnMidAxX = AX_MIN_X + (1 / 3) * AX_WIDTH;

	const barnMinAxX = barnMidAxX - (0.5 * AX_BARN_WIDTH) / lf;
	const barnMinAxY = AX_MID_Y - 0.5 * AX_BARN_HEIGHT;

	const barnDoorAxHeight = (1 / 2) * AX_BARN_HEIGHT;
	const barnSideWallAxHeight = (AX_BARN_HEIGHT - barnDoorAxHeight) / 2;
	const {
		x: [barnMidCanvasX, barnMinCanvasX],
		y: barnMinCanvasY,
		dx: barnCanvasWidth,
		dy: [barnCanvasHeight, barnDoorCanvasHeight, barnDoorSideWallCanvasHeight],
	} = transAxisToCanvas(canvasInfo, {
		x: [barnMidAxX, barnMinAxX],
		y: barnMinAxY,
		dx: AX_BARN_WIDTH / lf,
		dy: [AX_BARN_HEIGHT, barnDoorAxHeight, barnSideWallAxHeight],
	});

	const barnDashArray = [
		barnCanvasWidth + barnDoorSideWallCanvasHeight,
		barnDoorCanvasHeight,
		barnDoorSideWallCanvasHeight + barnCanvasWidth + barnDoorSideWallCanvasHeight,
		barnDoorCanvasHeight,
		barnDoorSideWallCanvasHeight + 100,
	].join(" ");

	return {
		class: "barn",
		canvas: canvasInfo,
		shape: "rect",
		midX: barnMidCanvasX,
		attrs: {
			x: barnMinCanvasX,
			y: barnMinCanvasY,
			width: barnCanvasWidth,
			height: barnCanvasHeight,
			fill: AESTHETIC.solidFill,
			stroke: "white",
			"stroke-width": 5,
			"stroke-linecap": "square",
			"stroke-dasharray": barnDashArray,
		},
	};
}

function _getPoleDatum(canvasInfo, { fracOfC }) {
	const lf = lorentzFactor({ fracOfC });
	const poleMidAxX = AX_MIN_X + (2 / 3) * AX_WIDTH;
	const poleMinAxX = poleMidAxX - (0.5 * AX_POLE_WIDTH) / lf;
	const poleMaxAxX = poleMidAxX + (0.5 * AX_POLE_WIDTH) / lf;

	const poleMidAxY = AX_MID_Y;

	const {
		x: [poleMinCanvasX, poleMidCanvasX, poleMaxCanvasX],
		y: poleMidCanvasY,
	} = transAxisToCanvas(canvasInfo, {
		x: [poleMinAxX, poleMidAxX, poleMaxAxX],
		y: poleMidAxY,
	});

	return {
		class: "pole",
		canvas: canvasInfo,
		shape: "line",
		midX: poleMidCanvasX,
		attrs: {
			x1: poleMinCanvasX,
			y1: poleMidCanvasY,
			x2: poleMaxCanvasX,
			y2: poleMidCanvasY,
			stroke: "white",
			"stroke-width": 5,
		},
	};
}

function _getBarnAndPoleData(canvasInfo) {
	const fracOfC = getSpeed();
	let barnSpeed, poleSpeed;
	if (canvasInfo.observerIsStandingOn === "barn") {
		barnSpeed = 0;
		poleSpeed = fracOfC;
	} else {
		barnSpeed = fracOfC;
		poleSpeed = 0;
	}
	return [
		_getBarnDatum(canvasInfo, { fracOfC: barnSpeed }),
		_getPoleDatum(canvasInfo, { fracOfC: poleSpeed }),
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

function addBarnsAndPoles(subcanvases) {
	return _addGraphicalObjs(subcanvases, _getBarnAndPoleData);
}

addBarnsAndPoles(subcanvases);

const bothPlaybackInfo = {
	barnStationary: {
		stationary: "barn",
		frozen: false,
		animationIsPlaying: false,
		animationStartDate: null,
		animationTimer: null,
		beginButton: document.getElementById("btn-run-animation-barn-perspective"),
		resetButton: document.getElementById("btn-reset-animation-barn-perspective"),
	},
	poleStationary: {
		stationary: "pole",
		frozen: false,
		animationIsPlaying: false,
		animationStartDate: null,
		animationTimer: null,
		beginButton: document.getElementById("btn-run-animation-pole-perspective"),
		resetButton: document.getElementById("btn-reset-animation-pole-perspective"),
	},
};

// eslint-disable-next-line no-unused-vars
function updateRelativeSpeed(speedStr) {
	try {
		const speed = getSpeed(speedStr);
		USER_INFO.trainSpeed = speed;
		if (speedStr) {
			speedTextSpan.textContent = speedStr;
		}

		const {
			barn: barnApparentWidth,
			pole: poleApparentWidth,
		} = apparentWidthsMeters({
			fracOfC: speed,
		});

		subcanvases.each(function (d) {
			const [barnDatum, poleDatum] = _getBarnAndPoleData(d);
			const subcanvas = d3.select(this);
			let datum, d3Obj;
			if (d.observerIsStandingOn === "barn") {
				if (bothPlaybackInfo.barnStationary.frozen) {
					return;
				}
				document.getElementById(
					"text-contracted-length-pole",
				).textContent = poleApparentWidth.toFixed(2);

				datum = poleDatum;
				d3Obj = subcanvas.select(".pole");
			} else {
				if (bothPlaybackInfo.poleStationary.frozen) {
					return;
				}
				document.getElementById(
					"text-contracted-length-barn",
				).textContent = barnApparentWidth.toFixed(2);
				datum = barnDatum;
				d3Obj = subcanvas.select(".barn");
			}

			const transition = d3Obj.transition().duration(100).ease(d3.easeCubicOut);
			Object.keys(datum.attrs).forEach(key => {
				transition.attr(key, datum.attrs[key]);
			});
		});
	} catch (e) {
		console.log(speedStr);
		throw e;
	}
}

function getDurationMS(speed) {
	return TIME_FOR_LIGHT_TO_TRAVERSE_MS / speed;
}

// eslint-disable-next-line no-unused-vars
function beginAnimation(playbackInfo) {
	updateRelativeSpeed();

	if (playbackInfo.animationIsPlaying) {
		return;
	}

	const speed = getSpeed();
	const durationMS = getDurationMS(speed);

	playbackInfo.animationIsPlaying = true;
	playbackInfo.animationStartDate = new Date();
	playbackInfo.beginButton.disabled = true;
	playbackInfo.resetButton.disabled = false;
	playbackInfo.frozen = true;

	playbackInfo.animationTimer = setTimeout(() => {
		playbackInfo.animationIsPlaying = false;
		playbackInfo.animationEndDate = new Date();
	}, durationMS);

	const stationaryObject = playbackInfo.stationary;

	const easing = d3.easeLinear;
	const lf = lorentzFactor({ fracOfC: speed });

	subcanvases
		.filter(d => d.observerIsStandingOn === stationaryObject)
		.each(function (d) {
			const subcanvas = d3.select(this);
			if (stationaryObject === "barn") {
				const pole = subcanvas.select(".pole");
				const poleDatum = _getPoleDatum(d, { fracOfC: speed });

				const poleAxisWidth = AX_POLE_WIDTH / lf;

				const poleMidAxXFinal = AX_MIN_X + 0.1 * AX_WIDTH;
				const {
					x: poleMidCanvasXFinal,
					dx: poleCanvasWidth,
				} = transAxisToCanvas(d, {
					x: poleMidAxXFinal,
					dx: poleAxisWidth,
				});

				const poleMinCanvasXFinal = poleMidCanvasXFinal - poleCanvasWidth / 2;
				const poleMaxCanvasXFinal = poleMinCanvasXFinal + poleCanvasWidth;

				pole.transition()
					.duration(0)
					.attr("x1", poleDatum.attrs.x1)
					.attr("x2", poleDatum.attrs.x2)
					.transition()
					.duration(durationMS)
					.ease(easing)
					.attr("x1", poleMinCanvasXFinal)
					.attr("x2", poleMaxCanvasXFinal);
			} else {
				const barn = subcanvas.select(".barn");
				const barnDatum = _getBarnDatum(d, { fracOfC: speed });
				console.log(barnDatum);
				const barnAxisWidth = AX_BARN_WIDTH / lf;

				const barnMidAxXFinal = AX_MIN_X + 0.9 * AX_WIDTH;
				const {
					x: barnMidCanvasXFinal,
					dx: barnCanvasWidth,
				} = transAxisToCanvas(d, {
					x: barnMidAxXFinal,
					dx: barnAxisWidth,
				});

				const barnMinCanvasXFinal = barnMidCanvasXFinal - barnCanvasWidth / 2;
				console.log(barnMinCanvasXFinal);
				console.log(barnDatum);
				console.log(durationMS);

				barn.transition()
					.duration(0)
					.attr("x", barnDatum.attrs.x)
					.transition()
					.duration(durationMS)
					.ease(easing)
					.attr("x", barnMinCanvasXFinal);
			}
		});
}

// eslint-disable-next-line no-unused-vars
function stopAnimation(playbackInfo) {
	playbackInfo.frozen = false;
	playbackInfo.animationIsPlaying = false;
	clearTimeout(playbackInfo.animationTimer);

	playbackInfo.beginButton.disabled = false;
	playbackInfo.resetButton.disabled = true;

	const elapsedTimeMS =
		new Date().getTime() - playbackInfo.animationStartDate.getTime();

	const stationaryObject = playbackInfo.stationary;

	const speed = getSpeed();
	const easing = AESTHETIC.easingForAnimationReset;
	const durationMS =
		AESTHETIC.durationMSOfAnimationReset *
		Math.min(1, 0.5 * (1 + elapsedTimeMS / getDurationMS(speed)));

	subcanvases
		.filter(d => d.observerIsStandingOn === stationaryObject)
		.each(function (d) {
			const subcanvas = d3.select(this);
			if (stationaryObject === "barn") {
				const pole = subcanvas.select(".pole");
				const poleDatum = _getPoleDatum(d, { fracOfC: speed });

				pole.transition()
					.duration(durationMS)
					.ease(easing)
					.attr("x1", poleDatum.attrs.x1)
					.attr("x2", poleDatum.attrs.x2)
					.on("end", updateRelativeSpeed());
			} else {
				const barn = subcanvas.select(".barn");
				const barnDatum = _getBarnDatum(d, { fracOfC: speed });

				barn.transition()
					.duration(durationMS)
					.ease(easing)
					.attr("x", barnDatum.attrs.x)
					.on("end", updateRelativeSpeed());
			}
		});
}
