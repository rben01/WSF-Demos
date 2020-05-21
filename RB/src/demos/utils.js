"use strict";

// https://stackoverflow.com/a/32538867
// eslint-disable-next-line no-unused-vars
function isIterable(obj) {
	// checks for null and undefined
	if (obj === null || typeof obj === "undefined") {
		return false;
	}
	return typeof obj[Symbol.iterator] === "function";
}

// eslint-disable-next-line no-unused-vars
function _addGraphicalObjs(subcanvases, dataFunc) {
	return subcanvases
		.selectAll()
		.data(dataFunc)
		.enter()
		.append(d => d3.create(`svg:${d.shape}`).node())
		.each(function (d) {
			const d3Obj = d3.select(this);

			d3Obj.classed(d.class, true);

			Object.entries(d.attrs).forEach(([key, val]) => {
				d3Obj.attr(key, val);
			});
		});
}

// eslint-disable-next-line no-unused-vars
function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}
