"use strict";

// eslint-disable-next-line no-unused-vars
const C = 299792458;
const HL_COLOR = "#5df";

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

	if (typeof datum.children !== "undefined") {
		// eslint-disable-next-line no-use-before-define
		applyGraphicalObjs(t, () => datum.children, { transition });
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
function applyGraphicalObjs(sel, data, { key, selector, cssClass, transition } = {}) {
	const s = sel
		.selectAll(selector)
		.data(data, key)
		.join(
			enter => enter.append(d => d3.create(`svg:${d.shape}`).node()),
			update => update,
			exit => exit.remove(),
		)
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

function __matMulHelper(mat1, mat2) {
	if (typeof mat1[0].length === "undefined") {
		mat1 = [mat1];
	}

	const squeezeAns = typeof mat2[0].length === "undefined";
	if (squeezeAns) {
		mat2 = mat2.map(elem => [elem]);
	}

	const m = mat1.length;
	const k = mat2.length;
	const n = mat2[0].length;

	const ans = [];
	for (let r = 0; r < m; ++r) {
		const rowAns = [];
		for (let c = 0; c < n; ++c) {
			let sum = 0;
			for (let i = 0; i < k; ++i) {
				sum += mat1[r][i] * mat2[i][c];
			}
			rowAns.push(sum);
		}
		ans.push(rowAns);
	}

	if (squeezeAns) {
		return ans.map(row => row[0]);
	}

	return ans;
}

// eslint-disable-next-line no-unused-vars
function matMul(...mats) {
	let ans = mats[0];
	for (let i = 1; i < mats.length; ++i) {
		ans = __matMulHelper(ans, mats[i]);
	}
	return ans;
}

// eslint-disable-next-line no-unused-vars
function defineArrowhead(defs, { id, length, width, color, attrs }) {
	const markerAttrs = {
		attrs: {
			refX: length / 2,
			refY: width / 2,
			markerUnits: "userSpaceOnUse",
			markerWidth: length,
			markerHeight: width,
			orient: "auto",
		},
	};
	const arrowheadAttrs = {
		attrs: {
			d: `M 1 1 L ${length - 1} ${width / 2} L 1 ${width - 1} L ${length / 3} ${
				width / 2
			} z`,
			"stroke-linejoin": "miter",
			stroke: color,
			fill: color,
			...attrs,
		},
	};
	defs.append("svg:marker")
		.attr("id", id)
		.each(function () {
			applyDatum.call(this, markerAttrs);
		})
		.append("svg:path")
		.each(function () {
			applyDatum.call(this, arrowheadAttrs);
		});
}
