/* global d3 */

const X_MARGIN_PROPTN = 0.0;
const Y_MARGIN_PROPTN = 0.15;

const TRAIN_WIDTH_PROPTN = 0.5;
const TRAIN_HEIGHT_PROPTN = 0.6;

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

const USER_INFO = {
	trainSpeed: 0.1,
};

const TOTAL_DURATION_SEC = 3;
const TOTAL_DURATION_MS = TOTAL_DURATION_SEC * 1000;

const CANVAS_WIDTH = 800;
const CANVAS_HEIGHT = 550;

const canvas = d3
	.select("#canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.style("background-color", "black");

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
	.classed("subcanvas", true);

// Photon goes from center of train to end of train over the course of the animation
function axDistTraveled({ fracOfC }) {
	return (fracOfC * AX_TRAIN_WIDTH) / 2;
}

function transAxisToCanvas(canvasInfo, { x, y, dx, dy }) {
	const xFrac = (x - AX_MIN_X) / AX_WIDTH;
	const yFrac = (y - AX_MIN_Y) / AX_HEIGHT;

	const xCanvasCoords =
		canvasInfo.width * X_MARGIN_PROPTN +
		xFrac * canvasInfo.width * (1 - 2 * X_MARGIN_PROPTN);
	const yCanvasCoords =
		canvasInfo.height * Y_MARGIN_PROPTN +
		yFrac * canvasInfo.height * (1 - 2 * Y_MARGIN_PROPTN);

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
	};

	const _circleAttrAttrs = {
		cx: lsCanvasCenterX,
		cy: lsCanvasCenterY,
	};

	const lightSourceAttrs = {
		..._circleAttrAttrs,
		r: lsRadius,
		fill: "#fb3f",
		stroke: "#ffff",
	};

	const photonAttrAttrs = {
		..._circleAttrAttrs,
		r: photonRadius,
		fill: "#fd0f",
		stroke: "#ffff",
	};

	return [
		{
			type: "train",
			class: "train-car",
			canvas: canvasInfo,
			shape: "rect",
			x0: trainMinCanvasCoords.x,
			attrs: {
				x: trainMinCanvasCoords.x,
				y: trainMinCanvasCoords.y,
				width: trainCanvasWidth,
				height: trainCanvasHeight,
				fill: "#4ff8",
			},
		},
		{
			type: "lightSource",
			class: "train-light-source",
			canvas: canvasInfo,
			...circleTopLevelAttrs,
			attrs: lightSourceAttrs,
		},
		{
			type: "photon",
			class: "train-photon",
			canvas: canvasInfo,
			...circleTopLevelAttrs,
			attrs: photonAttrAttrs,
			direction: "left",
		},
		{
			type: "photon",
			class: "train-photon",
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
	for (var i = 0; i < nTiesTotal; i++) {
		const tieAxX = trackInteriorAxMinX + i * axDistBtwnTies;

		const [p1, p2] = [
			{ x: tieAxX, y: AX_MIN_Y },
			{ x: tieAxX, y: AX_MAX_Y },
		].map(p => transAxisToCanvas(canvasInfo, p));

		data.push({
			type: "railroadTie",
			class: "railroad-tie",
			canvas: canvasInfo,
			x0: p1.x,
			shape: "line",
			attrs: {
				x1: p1.x,
				y1: p1.y,
				x2: p2.x,
				y2: p2.y,
				stroke: "#997f39",
				"stroke-width": 20,
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
			type: "railroadRail",
			class: "railroad-rail",
			canvas: canvasInfo,
			shape: "line",
			attrs: {
				x1: p1.x,
				y1: p1.y,
				x2: p2.x,
				y2: p2.y,
				stroke: "white",
				"stroke-width": 5,
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
			var d3Obj = d3.select(this).classed(d.class, true);

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
console.log(tracks);
const trainObjs = addTrainAndLightSources(subcanvases);

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
	subcanvases.each(canvasInfo => {
		const distanceTrainTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: USER_INFO.trainSpeed }),
		}).dx;

		const distanceLightTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: 1 }),
		}).dx;

		tracks
			.filter(d => d.type == "railroadTie" && d.canvas.observerIsStandingOn == "train")
			.each(function (d) {
				d3.select(this)
					.transition()
					.duration(0)
					.attr("x1", d => d.x0)
					.attr("x2", d => d.x0)
					.transition()
					.duration(TOTAL_DURATION_MS)
					.ease(d3.easeLinear)
					.attr("x1", d.x0 - distanceTrainTravels)
					.attr("x2", d.x0 - distanceTrainTravels);
			});

		trainObjs.each(function (d) {
			if (d.type == "photon") {
				let xf;
				if (d.direction == "left") {
					xf = d.x0 - distanceLightTravels;
				} else {
					xf = d.x0 + distanceLightTravels;
				}
				d3.select(this)
					.transition()
					.duration(0)
					.attr("cx", d.x0)
					.transition()
					.duration(TOTAL_DURATION_MS)
					.ease(d3.easeLinear)
					.attr("cx", xf);
			} else if (
				d.canvas.observerIsStandingOn == "ground" &&
				(d.type == "train" || d.type == "lightSource")
			) {
				let xAttr;
				if (d.type == "train") {
					xAttr = "x";
				} else if (d.type == "lightSource") {
					xAttr = "cx";
				}

				d3.select(this)
					.transition()
					.duration(0)
					.attr(xAttr, d.x0)
					.transition()
					.duration(TOTAL_DURATION_MS)
					.ease(d3.easeLinear)
					.attr(xAttr, d.x0 + distanceTrainTravels);
			}
		});
	});
}
