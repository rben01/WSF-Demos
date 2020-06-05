"use strict";

// eslint-disable-next-line no-unused-vars
const C = 299792458;

// https://stackoverflow.com/a/32538867
// eslint-disable-next-line no-unused-vars
function isIterable(obj) {
	// checks for null and undefined
	if (obj === null || typeof obj === "undefined") {
		return false;
	}
	return typeof obj[Symbol.iterator] === "function";
}

function applyDatum(datum, { transition } = {}) {
	const d3Obj = d3.select(this);
	d3Obj.classed(datum.class, true);
	const t = typeof transition === "undefined" ? d3Obj : d3Obj.transition(transition);
	Object.entries(datum.attrs).forEach(([key, val]) => {
		t.attr(key, val);
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
function applyGraphicalObjs(sel, dataFunc, { selector, cssClass }) {
	return sel
		.selectAll(selector)
		.data(dataFunc)
		.join(enter => enter.append(d => d3.create(`svg:${d.shape}`).node()))
		.each(applyDatum)
		.classed(cssClass, true);
}

// eslint-disable-next-line no-unused-vars
function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}

// eslint-disable-next-line no-unused-vars
function sign(x, epsilon) {
	if (typeof epsilon === "undefined") {
		epsilon = 1e-6;
	}
	return x < -epsilon ? -1 : x < epsilon ? 0 : 1;
}
