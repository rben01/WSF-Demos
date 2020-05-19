"use strict";

// eslint-disable-next-line no-unused-vars
const AESTHETIC = {
	solidFill: "#4ff8",
	solidStroke: "#fff8",
	durationMSOfAnimationReset: 300,
	easingForAnimationReset: d3.easePoly.exponent(2.5),
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
