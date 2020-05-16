"use strict";

// eslint-disable-next-line no-unused-vars
const USER_INFO = { trainSpeed: 0.1 };

// eslint-disable-next-line no-unused-vars
const CONFIG = Object.freeze({
	durationMSOfAnimationReset: 300,
	easingForAnimationReset: d3.easePoly.exponent(2.5),

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
			fill: "#4ff8",
			stroke: "#fff8",
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
	configure: function (d3Obj, config) {
		Object.keys(config).forEach(key => {
			const value = config[key];
			if (key === "attrs") {
				const attrs = value;
				Object.keys(attrs).forEach(attr => {
					d3Obj.attr(attr, attrs[attr]);
				});
			} else if (key === "class") {
				d3Obj.classed(value, true);
			} else {
				throw new Error(`Unexpected key ${key}`);
			}
		});

		return d3Obj;
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
		document.getElementById("train-speed-text").textContent = trainSpeedInputValue;
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
