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
	const d3Obj = d3.select(this).datum(datum);

	if (typeof datum.class !== "undefined") {
		d3Obj.classed(datum.class, true);
	}
	const t = typeof transition === "undefined" ? d3Obj : d3Obj.transition(transition);
	Object.entries(datum.attrs).forEach(([key, val]) => {
		t.attr(key, val);
	});

	if (typeof datum.text !== "undefined") {
		t.text(datum.text);
	}
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
function applyGraphicalObjs(sel, dataFunc, { selector, cssClass, transition } = {}) {
	const s = sel
		.selectAll(selector)
		.data(dataFunc)
		.join(enter => enter.append(d => d3.create(`svg:${d.shape}`).node()))
		.each(function (d) {
			applyDatum.call(this, d, { transition });
		});

	if (typeof cssClass !== "undefined") {
		s.classed(cssClass, true);
	}

	return s;
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

// eslint-disable-next-line no-unused-vars
function l2Norm(...vector) {
	const sum = vector.reduce((accum, currVal) => accum + currVal * currVal, 0);
	return Math.sqrt(sum);
}
