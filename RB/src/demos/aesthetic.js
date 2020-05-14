// eslint-disable-next-line no-unused-vars
const CONFIG = {
	durationMSOfAnimationReset: 300,
	easingForAnimationReset: d3.easePoly.exponent(2.5),
	xMarginProptn: 0,
	yMarginProptn: 0.15,
	trainWidthProptn: 0.4,
	trainHeightProptn: 0.6,

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
	axDistTraveledAsFracOfTrainWidth: 1.2,
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
};

// https://stackoverflow.com/a/196991
// eslint-disable-next-line no-unused-vars
function toTitleCase(str) {
	return str.replace(/\b\w+/g, function (txt) {
		return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
	});
}
