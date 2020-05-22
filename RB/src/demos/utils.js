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

function applyDatum(datum) {
	const d3Obj = d3.select(this);
	d3Obj.classed(datum.class, true);
	Object.entries(datum.attrs).forEach(([key, val]) => {
		d3Obj.attr(key, val);
	});
}

// eslint-disable-next-line no-unused-vars
function _addGraphicalObjs(sel, dataFunc) {
	return sel
		.selectAll()
		.data(dataFunc)
		.enter()
		.append(d => d3.create(`svg:${d.shape}`).node())
		.each(applyDatum);
}

// eslint-disable-next-line no-unused-vars
function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}
