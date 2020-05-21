/* globals AESTHETIC isIterable _addGraphicalObjs lorentzFactor */

"use strict";

// If the program is bug-free, any reasonably scaled values of the axis bounds will work
const AX_MIN_X = 5;
const AX_MIN_Y = 3;
const AX_MAX_X = 10;
const AX_MAX_Y = 7;
const AX_WIDTH = AX_MAX_X - AX_MIN_X;
const AX_HEIGHT = AX_MAX_Y - AX_MIN_Y;
const AX_MID_Y = AX_MIN_Y + (AX_MAX_Y - AX_MIN_Y) / 2;

const POLE_PHYSICAL_SIZE = 9;
const BARN_PHYSICAL_SIZE = 6;

const POLE_BARN_RATIO = 1.5;
const BARN_WIDTH_PROPTN = 0.16;
const BARN_HEIGHT_PROPTN = 0.8;
const POLE_WIDTH_PROPTN = BARN_WIDTH_PROPTN * POLE_BARN_RATIO;

const AX_STARTPOINT_RATIO = 0.37; // Should be .37 but other values are useful for testing
const ANIMATION_AX_ENDPOINT = 0.13;

const AX_BARN_WIDTH = AX_WIDTH * BARN_WIDTH_PROPTN;
const AX_BARN_HEIGHT = AX_HEIGHT * BARN_HEIGHT_PROPTN;
const AX_POLE_WIDTH = AX_WIDTH * POLE_WIDTH_PROPTN;

const TIME_FOR_LIGHT_TO_TRAVERSE_SEC = 2; // seconds
const TIME_FOR_LIGHT_TO_TRAVERSE_MS = TIME_FOR_LIGHT_TO_TRAVERSE_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 100;

const ANIMATION_STATE = {
	hasNotYetStarted: 0,
	isPlaying: 1,
	hasFinishedPlaying: 2,
};

const BARN_DOOR_HEIGHT_PROPTN = 0.5;
const BARN_DOOR_OFFSET = CANVAS_WIDTH / 100;

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
	const data = { x, y, dx, dy };

	const iterableVars = {};
	const varsAsLists = {};

	Object.entries(data).forEach(([key, value]) => {
		const valueIsIterable = isIterable(value);

		iterableVars[key] = valueIsIterable;
		varsAsLists[key] = valueIsIterable ? value : [value];
	});

	const canvasCoords = {};
	Object.entries(varsAsLists).forEach(([key, value]) => {
		let coordFunc;
		switch (key) {
			case "x":
				coordFunc = x => ((x - AX_MIN_X) / AX_WIDTH) * canvasInfo.width;
				break;
			case "y":
				coordFunc = y => ((y - AX_MIN_Y) / AX_HEIGHT) * canvasInfo.height;
				break;
			case "dx":
				coordFunc = dx => (canvasInfo.width / AX_WIDTH) * dx;
				break;
			case "dy":
				coordFunc = dy => (canvasInfo.height / AX_HEIGHT) * dy;
				break;
			default:
				throw new Error(`Unexpected case ${key}`);
		}
		canvasCoords[key] = value.map(coordFunc);
	});

	const ans = {};
	Object.entries(canvasCoords).forEach(([key, coordsList]) => {
		ans[key] = iterableVars[key] ? coordsList : coordsList[0];
	});
	return ans;
}

function _getBarnData(canvasInfo, { fracOfC, progress = 0 } = {}) {
	if (canvasInfo.observerIsStandingOn === "barn") {
		fracOfC = 0;
	}

	if (canvasInfo.observerIsStandingOn === "barn") {
		progress = 0;
	}

	const lf = lorentzFactor({ fracOfC });

	const midAxXi = AX_MIN_X + AX_STARTPOINT_RATIO * AX_WIDTH;
	const midAxXf = AX_MIN_X + (1 - ANIMATION_AX_ENDPOINT) * AX_WIDTH;

	const barnMidAxX = (1 - progress) * midAxXi + progress * midAxXf;

	const barnMinAxX = barnMidAxX - (0.5 * AX_BARN_WIDTH) / lf;
	const barnMinAxY = AX_MID_Y - 0.5 * AX_BARN_HEIGHT;

	const barnDoorAxHeight = BARN_DOOR_HEIGHT_PROPTN * AX_BARN_HEIGHT;
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

	return [
		{
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
		},
	];
}

function _getPoleData(canvasInfo, { fracOfC, progress = 0 } = {}) {
	if (canvasInfo.observerIsStandingOn === "pole") {
		fracOfC = 0;
	}

	if (canvasInfo.observerIsStandingOn === "pole") {
		progress = 0;
	}

	const lf = lorentzFactor({ fracOfC });

	const midAxXi = AX_MIN_X + (1 - AX_STARTPOINT_RATIO) * AX_WIDTH;
	const midAxXf = AX_MIN_X + ANIMATION_AX_ENDPOINT * AX_WIDTH;

	const poleMidAxX = (1 - progress) * midAxXi + progress * midAxXf;

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

	return [
		{
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
		},
	];
}

function _getBarnDoorsData(
	canvasInfo,
	{ fracOfC, progress = 0, barnData, poleData } = {},
) {
	const barnDatum = barnData
		? barnData[0]
		: _getBarnData(canvasInfo, { fracOfC, progress })[0];
	const poleDatum = poleData
		? poleData[0]
		: _getPoleData(canvasInfo, { fracOfC, progress })[0];

	const { x, y, width, height } = barnDatum.attrs;
	const doorCanvasHeight = height * BARN_DOOR_HEIGHT_PROPTN;
	const doorMinCanvasY = y + (height - doorCanvasHeight) / 2;
	const doorMaxCanvasY = doorMinCanvasY + doorCanvasHeight;

	const doorCommonAttrs = {
		class: "barn-door",
		barn: barnDatum,
		shape: "line",
		closed: {
			y1: doorMinCanvasY,
			y2: doorMaxCanvasY,
		},
		open: {
			y1: doorMaxCanvasY,
			y2: doorMaxCanvasY + doorCanvasHeight,
		},
	};

	const doorCommonAttrAttrs = {
		stroke: "white",
		"stroke-width": 4,
	};

	const leftDoorX = x - BARN_DOOR_OFFSET;
	const rightDoorX = x + width + BARN_DOOR_OFFSET;

	const leftDoorIsClosed =
		poleDatum.attrs.x2 < leftDoorX || poleDatum.attrs.x1 > leftDoorX;
	const rightDoorIsClosed =
		poleDatum.attrs.x1 > rightDoorX || poleDatum.attrs.x2 < rightDoorX;

	// https://stackoverflow.com/a/39333479
	const getYs = ({ y1, y2 }) => ({ y1, y2 });

	const leftDoorY = leftDoorIsClosed
		? getYs(doorCommonAttrs.closed)
		: getYs(doorCommonAttrs.open);

	const rightDoorY = rightDoorIsClosed
		? getYs(doorCommonAttrs.closed)
		: getYs(doorCommonAttrs.open);

	return [
		{
			...doorCommonAttrs,
			baseX: leftDoorX,
			side: "left",
			isOpen: !leftDoorIsClosed,
			attrs: {
				x1: leftDoorX,
				x2: leftDoorX,
				...leftDoorY,
				...doorCommonAttrAttrs,
			},
		},
		{
			...doorCommonAttrs,
			baseX: rightDoorX,
			side: "right",
			isOpen: !rightDoorIsClosed,
			attrs: {
				x1: rightDoorX,
				x2: rightDoorX,
				...rightDoorY,
				...doorCommonAttrAttrs,
			},
		},
	];
}

function _getBarnAndPoleData(canvasInfo, { progress = 0 } = {}) {
	const fracOfC = getSpeed();

	const barnData = _getBarnData(canvasInfo, { fracOfC, progress });
	const barnDoorsData = _getBarnDoorsData(canvasInfo, { fracOfC, progress });
	const poleData = _getPoleData(canvasInfo, { fracOfC, progress });

	return {
		objects: {
			barnData: barnData,
			barnDoorsData: barnDoorsData,
			poleData,
		},
		data: [...barnData, ...barnDoorsData, ...poleData],
	};
}

function addBarnsAndPoles(subcanvases) {
	return _addGraphicalObjs(subcanvases, d => _getBarnAndPoleData(d).data);
}

addBarnsAndPoles(subcanvases);

const bothPlaybackInfo = {
	barnStationary: {
		stationary: "barn",
		animationState: ANIMATION_STATE.hasNotYetStarted,
		animationStartDate: null,
		animationTimer: null,
		beginButton: document.getElementById("btn-run-animation-barn-perspective"),
		resetButton: document.getElementById("btn-reset-animation-barn-perspective"),
	},
	poleStationary: {
		stationary: "pole",
		animationState: ANIMATION_STATE.hasNotYetStarted,
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
		if (speedStr || speedStr === 0) {
			speedTextSpan.textContent = speedStr;
		}

		[bothPlaybackInfo.barnStationary, bothPlaybackInfo.poleStationary].forEach(
			playbackInfo => {
				if (playbackInfo.animationState === ANIMATION_STATE.hasNotYetStarted) {
					playbackInfo.beginButton.disabled = speed === 0;
				}
			},
		);

		const BARN = ".barn";
		const POLE = ".pole";

		const {
			barn: barnApparentWidth,
			pole: poleApparentWidth,
		} = apparentWidthsMeters({
			fracOfC: speed,
		});

		subcanvases.each(function (d) {
			let stationaryObjKey,
				movingObjKey,
				getMovingObjDataFunc,
				getStationaryObjDataFunc,
				stationaryObjPlaybackInfo,
				textFieldID,
				apparentWidthStr,
				progress;

			const subcanvas = d3.select(this);
			if (d.observerIsStandingOn === "barn") {
				stationaryObjKey = BARN;
				movingObjKey = POLE;
				getStationaryObjDataFunc = _getBarnData;
				getMovingObjDataFunc = _getPoleData;
				stationaryObjPlaybackInfo = bothPlaybackInfo.barnStationary;
				textFieldID = "text-contracted-length-pole";
				apparentWidthStr = poleApparentWidth;
			} else {
				stationaryObjKey = POLE;
				movingObjKey = BARN;
				getStationaryObjDataFunc = _getPoleData;
				getMovingObjDataFunc = _getBarnData;
				stationaryObjPlaybackInfo = bothPlaybackInfo.poleStationary;
				textFieldID = "text-contracted-length-barn";
				apparentWidthStr = barnApparentWidth;
			}

			switch (stationaryObjPlaybackInfo.animationState) {
				case ANIMATION_STATE.hasNotYetStarted: {
					progress = 0;
					break;
				}
				case ANIMATION_STATE.isPlaying: {
					return;
				}
				case ANIMATION_STATE.hasFinishedPlaying: {
					progress = 1;
					break;
				}
				default: {
					throw new Error(
						`Unexpect case ${stationaryObjPlaybackInfo.animationState}`,
					);
				}
			}

			const dataMap = {
				[stationaryObjKey]: getStationaryObjDataFunc(d, {
					fracOfC: speed,
					progress,
				}),
				[movingObjKey]: getMovingObjDataFunc(d, { fracOfC: speed, progress }),
			};

			dataMap[".barn-door"] = _getBarnDoorsData(d, {
				barnData: dataMap[BARN],
				poleData: dataMap[POLE],
			});

			document.getElementById(textFieldID).textContent = apparentWidthStr.toFixed(
				2,
			);

			Object.entries(dataMap).forEach(([key, data]) => {
				const objs = subcanvas.selectAll(key);

				objs.data(data).each(function (d) {
					const transition = d3
						.select(this)
						.transition()
						.duration(100)
						.ease(d3.easeCubicOut);

					Object.entries(d.attrs).forEach(([key, val]) => {
						transition.attr(key, val);
					});
				});
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

	if (speed === 0) {
		return;
	}

	const netDurationMS = getDurationMS(speed);

	playbackInfo.animationState = ANIMATION_STATE.isPlaying;
	playbackInfo.animationStartDate = new Date();
	playbackInfo.beginButton.disabled = true;
	playbackInfo.resetButton.disabled = false;

	playbackInfo.animationTimer = setTimeout(() => {
		playbackInfo.animationEndDate = new Date();
		playbackInfo.animationState = ANIMATION_STATE.hasFinishedPlaying;
		updateRelativeSpeed();
	}, netDurationMS);

	const stationaryObject = playbackInfo.stationary;

	const easing = d3.easeLinear;

	const doorChangeStateDurationMS = 150;

	const BARN = ".barn";
	const POLE = ".pole";

	// All three maps are keyed by the moving object
	const getCanvasWidthMap = {
		[BARN]: datum => datum.attrs.width,
		[POLE]: datum => datum.attrs.x2 - datum.attrs.x1,
	};

	const endpointRatioMap = {
		[BARN]: 1 - ANIMATION_AX_ENDPOINT,
		[POLE]: ANIMATION_AX_ENDPOINT,
	};

	const getNetDistTraveledMap = {
		[BARN]: ({ datum, minCanvasXf }) => minCanvasXf - datum.attrs.x,
		[POLE]: ({ datum, minCanvasXf }) => datum.attrs.x1 - minCanvasXf,
	};

	subcanvases
		.filter(d => d.observerIsStandingOn === stationaryObject)
		.each(function (d) {
			const subcanvas = d3.select(this);
			const onBarn = d.observerIsStandingOn === "barn";

			const movingObjClass = onBarn ? POLE : BARN;
			const movingObj = d3.select(subcanvas.selectAll(movingObjClass).node());
			const movingObjDatum = movingObj.datum();
			const movingObjCanvasWidth = getCanvasWidthMap[movingObjClass](
				movingObjDatum,
			);
			const endpointRatio = endpointRatioMap[movingObjClass];
			const midCanvasXf = transAxisToCanvas(d, {
				x: AX_MIN_X + endpointRatio * AX_WIDTH,
			}).x;
			const minCanvasXf = midCanvasXf - movingObjCanvasWidth / 2;
			const netDistTraveled = getNetDistTraveledMap[movingObjClass]({
				datum: movingObjDatum,
				minCanvasXf,
			});

			let poleFinalPos, poleDatum, getBarnDoorXf;
			if (onBarn) {
				const poleX1f = minCanvasXf;
				const poleX2f = minCanvasXf + movingObjCanvasWidth;
				movingObj
					.transition()
					.duration(0)
					.attr("x1", movingObjDatum.attrs.x1)
					.attr("x2", movingObjDatum.attrs.x2)
					.transition()
					.duration(netDurationMS)
					.ease(easing)
					.attr("x1", poleX1f)
					.attr("x2", poleX2f);

				poleFinalPos = { x1: poleX1f, x2: poleX2f };

				poleDatum = movingObjDatum;
				getBarnDoorXf = baseX => baseX;
			} else {
				movingObj
					.transition()
					.duration(0)
					.attr("x", movingObjDatum.attrs.x)
					.transition()
					.duration(netDurationMS)
					.ease(easing)
					.attr("x", minCanvasXf);

				poleDatum = d3.select(subcanvas.selectAll(POLE).node()).datum();
				poleFinalPos = { x1: poleDatum.attrs.x1, x2: poleDatum.attrs.x2 };

				getBarnDoorXf = baseX => baseX + netDistTraveled;
			}

			subcanvas.selectAll(".barn-door").each(function (barnDoorDatum) {
				const barnDoor = d3.select(this);
				const baseX = barnDoorDatum.baseX;

				const distToPole = {
					// Magic numbers here were chosen so that they'd look good with the chosen value of doorChangeStateDurationMS
					enter: poleDatum.attrs.x1 - baseX - 3 * BARN_DOOR_OFFSET * speed,
					leave:
						poleDatum.attrs.x2 -
						baseX -
						(barnDoorDatum.side === "left" ? 1 : 2) *
							BARN_DOOR_OFFSET *
							speed,
				};

				const fracToPole = {
					enter: distToPole.enter / netDistTraveled,
					leave: distToPole.leave / netDistTraveled,
				};

				const doorChangeStateFrac = doorChangeStateDurationMS / netDurationMS;

				const xf = getBarnDoorXf(baseX);
				const doorIsOpenWhenFinished =
					poleFinalPos.x1 <= xf && xf <= poleFinalPos.x2;

				const yTweener = function (attr) {
					const yClosed = barnDoorDatum.closed[attr];
					const yOpen = barnDoorDatum.open[attr];
					const doorOpenInterpolator = d3.interpolateNumber(yClosed, yOpen);
					const doorCloseEasing =
						fracToPole.leave < 1 ? d3.easeCubicInOut : d3.easeCubicIn;

					const enterTime = fracToPole.enter;
					const leaveTime = fracToPole.leave;

					return function () {
						return t => {
							if (t < enterTime) {
								return yClosed;
							} else if (t < enterTime + doorChangeStateFrac) {
								const openFrac = (t - enterTime) / doorChangeStateFrac;
								return doorOpenInterpolator(
									d3.easeCubicInOut(openFrac),
								);
							} else if (t < leaveTime || doorIsOpenWhenFinished) {
								return yOpen;
							} else if (t < leaveTime + doorChangeStateFrac) {
								const closeFrac = (t - leaveTime) / doorChangeStateFrac;
								return doorOpenInterpolator(
									doorCloseEasing(1 - closeFrac),
								);
							} else {
								return yClosed;
							}
						};
					};
				};

				const transition = barnDoor
					.transition()
					.duration(0)
					.attr("x1", baseX)
					.attr("x2", baseX)
					.transition()
					.duration(netDurationMS)
					.ease(d3.easeLinear)
					.attrTween("y1", yTweener("y1"))
					.attrTween("y2", yTweener("y2"));

				if (!onBarn) {
					const xTweener = function () {
						const interpolator = d3.interpolateNumber(
							baseX,
							baseX + netDistTraveled,
						);
						return interpolator;
					};
					transition.attrTween("x1", xTweener).attrTween("x2", xTweener);
				}

				transition
					.transition()
					.duration(100)
					.ease(d3.easeCubicOut)
					.attr(
						"y1",
						doorIsOpenWhenFinished
							? barnDoorDatum.open.y1
							: barnDoorDatum.closed.y1,
					)
					.attr(
						"y2",
						doorIsOpenWhenFinished
							? barnDoorDatum.open.y2
							: barnDoorDatum.closed.y2,
					);
			});
		});
}

// eslint-disable-next-line no-unused-vars
function stopAnimation(playbackInfo) {
	playbackInfo.animationState = ANIMATION_STATE.hasNotYetStarted;
	clearTimeout(playbackInfo.animationTimer);

	playbackInfo.beginButton.disabled = false;
	playbackInfo.resetButton.disabled = true;

	updateRelativeSpeed();
}
