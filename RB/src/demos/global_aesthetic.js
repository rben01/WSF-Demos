"use strict";

// eslint-disable-next-line no-unused-vars
const AESTHETIC = {
	solidFill: "#4ff8",
	solidStroke: "#fff8",
	durationMSOfAnimationReset: 300,
	easingForAnimationReset: d3.easePoly.exponent(2.5),
	configure: function (d3Obj, config) {
		Object.entries(config).forEach(([key, value]) => {
			if (key === "attrs") {
				const attrs = value;
				Object.entries(attrs).forEach(([attr, val]) => {
					d3Obj.attr(attr, val);
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
