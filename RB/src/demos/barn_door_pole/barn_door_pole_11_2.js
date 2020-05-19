/* globals AESTHETIC isIterable _addGraphicalObjs */

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

function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
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

function _getBarnData(canvasInfo, { fracOfC }) {
	if (canvasInfo.observerIsStandingOn === "barn") {
		fracOfC = 0;
	}

	const lf = lorentzFactor({ fracOfC });

	const barnMidAxX = AX_MIN_X + (1 / 3) * AX_WIDTH;

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

function _getPoleData(canvasInfo, { fracOfC }) {
	if (canvasInfo.observerIsStandingOn === "pole") {
		fracOfC = 0;
	}

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

function _getBarnDoorsData(barnDatum) {
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

	return [
		{
			...doorCommonAttrs,
			baseX: leftDoorX,
			attrs: {
				x1: leftDoorX,
				y1: doorCommonAttrs.closed.y1,
				x2: leftDoorX,
				y2: doorCommonAttrs.closed.y2,
				...doorCommonAttrAttrs,
			},
		},
		{
			...doorCommonAttrs,
			baseX: rightDoorX,
			attrs: {
				x1: rightDoorX,
				y1: doorCommonAttrs.closed.y1,
				x2: rightDoorX,
				y2: doorCommonAttrs.closed.y2,
				...doorCommonAttrAttrs,
			},
		},
	];
}

function _getBarnAndPoleData(canvasInfo) {
	const fracOfC = getSpeed();

	const barnData = _getBarnData(canvasInfo, { fracOfC: fracOfC });
	const barnDoorsData = _getBarnDoorsData(barnData[0]);
	const poleData = _getPoleData(canvasInfo, { fracOfC: fracOfC });

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
			const { barnData, barnDoorsData, poleData } = _getBarnAndPoleData(
				d,
			).objects;
			const subcanvas = d3.select(this);
			if (d.observerIsStandingOn === "barn") {
				if (bothPlaybackInfo.barnStationary.frozen) {
					return;
				}
				document.getElementById(
					"text-contracted-length-pole",
				).textContent = poleApparentWidth.toFixed(2);
			} else {
				if (bothPlaybackInfo.poleStationary.frozen) {
					return;
				}
				document.getElementById(
					"text-contracted-length-barn",
				).textContent = barnApparentWidth.toFixed(2);
			}

			const dataMap = {
				".barn": barnData,
				".pole": poleData,
				".barn-door": barnDoorsData,
			};

			Object.entries(dataMap).forEach(([key, data]) => {
				const objs = subcanvas.selectAll(key);

				objs.data(data);
				objs.each(function (d) {
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

function _tweenDoors({ transition, toX, toY, xEase, yEase }) {
	["x1", "x2"].forEach(attr => {
		transition = transition.attrTween(attr, function () {
			const interpolator = d3.interpolateNumber(this.getAttribute(attr), toX);
			return t => interpolator(xEase(t));
		});
	});

	["y1", "y2"].forEach(attr => {
		transition = transition.attrTween(attr, function () {
			const interpolator = d3.interpolateNumber(
				this.getAttribute(attr),
				toY[attr],
			);
			return t => interpolator(yEase(t));
		});
	});

	return transition;
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

	const doorChangeStateDurationMS = 150;
	subcanvases
		.filter(d => d.observerIsStandingOn === stationaryObject)
		.each(function (d) {
			// I apologize to the world for this monstrosity
			const subcanvas = d3.select(this);
			if (stationaryObject === "barn") {
				const poles = subcanvas.selectAll(".pole");
				const poleData = _getPoleData(d, { fracOfC: speed });

				poles.data(poleData).each(function (poleDatum) {
					const pole = d3.select(this);

					const poleAxisWidth = AX_POLE_WIDTH / lf;
					const poleMidAxXFinal = AX_MIN_X + 0.1 * AX_WIDTH;
					const {
						x: poleMidCanvasXFinal,
						dx: poleCanvasWidth,
					} = transAxisToCanvas(poleDatum.canvas, {
						x: poleMidAxXFinal,
						dx: poleAxisWidth,
					});

					const poleMinCanvasXFinal =
						poleMidCanvasXFinal - poleCanvasWidth / 2;
					const poleMaxCanvasXFinal = poleMinCanvasXFinal + poleCanvasWidth;

					const distTraveled = poleDatum.attrs.x1 - poleMinCanvasXFinal;

					pole.transition()
						.duration(0)
						.attr("x1", poleDatum.attrs.x1)
						.attr("x2", poleDatum.attrs.x2)
						.transition()
						.duration(durationMS)
						.ease(easing)
						.attr("x1", poleMinCanvasXFinal)
						.attr("x2", poleMaxCanvasXFinal);

					subcanvas.selectAll(".barn-door").each(function (barnDoorDatum) {
						const barnDoor = d3.select(this);
						const distToBarnDoor = {
							enter:
								poleDatum.attrs.x1 -
								barnDoorDatum.baseX -
								2 * BARN_DOOR_OFFSET * speed,
							leave:
								poleDatum.attrs.x2 -
								barnDoorDatum.baseX -
								6 * BARN_DOOR_OFFSET * speed,
						};

						const durationMSToBarnDoor = {
							enter: durationMS * (distToBarnDoor.enter / distTraveled),
							leave: durationMS * (distToBarnDoor.leave / distTraveled),
						};

						const transition = barnDoor
							.transition()
							.delay(durationMSToBarnDoor.enter)
							.duration(doorChangeStateDurationMS)
							.ease(d3.easeCubicInOut)
							.attr("y1", barnDoorDatum.open.y1)
							.attr("y2", barnDoorDatum.open.y2);

						if (poleDatum.attrs.x2 - barnDoorDatum.baseX <= distTraveled) {
							transition
								.transition()
								.delay(
									durationMSToBarnDoor.leave -
										durationMSToBarnDoor.enter,
								)
								.duration(doorChangeStateDurationMS)
								.ease(d3.easeCubicInOut)
								.attr("y1", barnDoorDatum.closed.y1)
								.attr("y2", barnDoorDatum.closed.y2);
						}

						console.log(durationMSToBarnDoor);
					});
				});
			} else {
				const barns = subcanvas.selectAll(".barn");
				const barnData = _getBarnData(d, { fracOfC: speed });

				barns.data(barnData).each(function (barnDatum) {
					const barn = d3.select(this);
					const barnAxisWidth = AX_BARN_WIDTH / lf;

					const barnMidAxXFinal = AX_MIN_X + 0.9 * AX_WIDTH;
					const {
						x: barnMidCanvasXFinal,
						dx: barnCanvasWidth,
					} = transAxisToCanvas(barnDatum.canvas, {
						x: barnMidAxXFinal,
						dx: barnAxisWidth,
					});

					const barnMinCanvasXFinal =
						barnMidCanvasXFinal - barnCanvasWidth / 2;

					const distTraveled = barnMinCanvasXFinal - barnDatum.attrs.x;

					barn.transition()
						.duration(0)
						.attr("x", barnDatum.attrs.x)
						.transition()
						.duration(durationMS)
						.ease(easing)
						.attr("x", barnMinCanvasXFinal);

					subcanvas.selectAll(".barn-door").each(function (barnDoorDatum) {
						const barnDoor = d3.select(this);
						const baseX = barnDoorDatum.baseX;
						subcanvas.selectAll(".pole").each(poleDatum => {
							const distToPole = {
								enter:
									poleDatum.attrs.x1 -
									baseX -
									3 * BARN_DOOR_OFFSET * speed,
								leave:
									poleDatum.attrs.x2 -
									baseX -
									2 * BARN_DOOR_OFFSET * speed,
							};

							const durationMSToPole = {
								enter: durationMS * (distToPole.enter / distTraveled),
								leave: durationMS * (distToPole.leave / distTraveled),
							};
							console.log(durationMSToPole);
							const doorBeginOpenX = baseX + distToPole.enter;
							const doorEndOpenX =
								doorBeginOpenX +
								distTraveled * (doorChangeStateDurationMS / durationMS);

							const transitionToPreOpen = barnDoor
								.transition()
								.duration(0)
								.attr("x1", baseX)
								.attr("x2", baseX)
								.transition()
								.duration(durationMSToPole.enter)
								.ease(easing)
								.attr("x1", doorBeginOpenX)
								.attr("x2", doorBeginOpenX);

							const transitionOpen = _tweenDoors({
								transition: transitionToPreOpen
									.transition()
									.duration(doorChangeStateDurationMS),
								toX: doorEndOpenX,
								toY: barnDoorDatum.open,
								xEase: d3.easeLinear,
								yEase: d3.easeCubicInOut,
							});

							const doorXFinal = baseX + distTraveled;

							// At this point the door has just finished opening
							if (
								poleDatum.attrs.x2 - barnDoorDatum.baseX <=
								distTraveled
							) {
								const poleEffectiveWidth =
									baseX + distToPole.leave - doorEndOpenX;
								const traversePoleDurationMS =
									durationMS * (poleEffectiveWidth / distTraveled);
								const doorBeginCloseX = baseX + distToPole.leave;
								const doorEndCloseX =
									doorBeginCloseX +
									distTraveled *
										(doorChangeStateDurationMS / durationMS);

								const remainingDurationMS =
									durationMS *
									(1 -
										(doorEndCloseX - barnDoorDatum.baseX) /
											distTraveled);

								const atPreCloseLoc = transitionOpen
									.transition()
									.duration(traversePoleDurationMS)
									.ease(easing)
									.attr("x1", doorBeginCloseX)
									.attr("x2", doorBeginCloseX);

								if (doorEndCloseX <= doorXFinal) {
									// The door will fully close before it stops moving horizontally
									_tweenDoors({
										transition: atPreCloseLoc
											.transition()
											.duration(doorChangeStateDurationMS),
										toX: doorEndCloseX,
										toY: barnDoorDatum.closed,
										xEase: d3.easeLinear,
										yEase: d3.easeCubicInOut,
									})
										.transition()
										.duration(remainingDurationMS)
										.ease(easing)
										.attr("x1", barnDoorDatum.baseX + distTraveled)
										.attr("x2", barnDoorDatum.baseX + distTraveled);
								} else {
									// The door will fully close after it stops moving horizontally, so we have to break the closing animation into two parts, one with horizontal movement and one without
									const moveToFinalXDurationMS =
										durationMS *
										((doorXFinal - doorBeginCloseX) / distTraveled);
									const closeRatio =
										moveToFinalXDurationMS /
										doorChangeStateDurationMS;
									const midway = {
										y1:
											barnDoorDatum.open.y1 +
											(barnDoorDatum.closed.y1 -
												barnDoorDatum.open.y1) *
												closeRatio,
										y2:
											barnDoorDatum.open.y2 +
											(barnDoorDatum.closed.y2 -
												barnDoorDatum.open.y2) *
												closeRatio,
									};

									_tweenDoors({
										transition: atPreCloseLoc
											.transition()
											.duration(moveToFinalXDurationMS),
										toX: doorXFinal,
										toY: midway,
										xEase: d3.easeLinear,
										yEase: d3.easeCubicIn,
									})
										.transition()
										.duration(
											doorChangeStateDurationMS -
												moveToFinalXDurationMS,
										)
										.ease(d3.easeCubicOut)
										.attr("y1", barnDoorDatum.closed.y1)
										.attr("y2", barnDoorDatum.closed.y2);
								}
							} else {
								const remainingTimeMS =
									durationMS *
									((doorXFinal - doorEndOpenX) / distTraveled);
								console.log(remainingTimeMS, doorXFinal, doorEndOpenX);
								transitionOpen
									.transition()
									.duration(remainingTimeMS)
									.ease(d3.easeLinear)
									.attr("x1", doorXFinal)
									.attr("x2", doorXFinal);
							}
						});
					});
				});
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
			subcanvas
				.selectAll(".barn-door")
				.transition()
				.duration(durationMS / 2)
				.attr("y1", d => d.open.y1)
				.attr("y2", d => d.open.y2);
			// .transition()
			// .duration(durationMS / 2)
			// .attr("y1", d => d.closed.y1)
			// .attr("y2", d => d.closed.y2);

			if (stationaryObject === "barn") {
				const poles = subcanvas.selectAll(".pole");
				const poleData = _getPoleData(d, { fracOfC: speed });

				poles.data(poleData).each(function (d) {
					const pole = d3.select(this);
					pole.transition()
						.duration(durationMS)
						.ease(easing)
						.attr("x1", d.attrs.x1)
						.attr("x2", d.attrs.x2)
						.on("end", updateRelativeSpeed());
				});
			} else {
				const barns = subcanvas.selectAll(".barn");
				const barnData = _getBarnData(d, { fracOfC: speed });

				barns.data(barnData).each(function (d) {
					const barn = d3.select(this);
					barn.transition()
						.duration(durationMS)
						.ease(easing)
						.attr("x", d.attrs.x)
						.on("end", updateRelativeSpeed());
				});
			}
		});
}
