/* global AESTHETIC */
"use strict";

// eslint-disable-next-line no-unused-vars
const USER_INFO = { trainSpeed: 0.1 };

// eslint-disable-next-line no-unused-vars
const CONFIG = Object.freeze({
	xMarginProptn: 0,
	yMarginProptn: 0.15,
	trainWidthProptn: 0.4,
	trainHeightProptn: 0.6,
	nTiesVisible: 9,
	axDistTraveledAsFracOfTrainWidth: 1.2,
	maxTrainSpeed: 0.5,

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
// eslint-disable-next-line no-unused-vars
function toTitleCase(str) {
	return str.replace(/\b\w+/g, function (txt) {
		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	});
}

// eslint-disable-next-line no-unused-vars
function updateTrainSpeed(speed, { initial = false } = {}) {
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
	} catch (e) {
		console.log(trainSpeedInputValue);
	}
}

// eslint-disable-next-line no-unused-vars
function getRailroadTieParams({
	trackInteriorAxMinX,
	trackInteriorAxMaxX,
	nTiesVisible,
}) {
	const trackInteriorAxWidth = trackInteriorAxMaxX - trackInteriorAxMinX;

	const axDistBtwnTies = trackInteriorAxWidth / (nTiesVisible - 1);

	const middleTieAxX = (trackInteriorAxMinX + trackInteriorAxMaxX) / 2;
	const initialTieAxX =
		middleTieAxX - Math.floor((nTiesVisible - 1) / 2) * axDistBtwnTies;

	return {
		axDistBtwnTies,
		initialTieAxX,
	};
}

document.getElementById("input-train-speed").max = `${CONFIG.maxTrainSpeed}`;
