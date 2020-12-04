"use strict";

// eslint-disable-next-line no-unused-vars
const C = 299792458;
// eslint-disable-next-line no-unused-vars
const HL_COLOR = "#5df";
// eslint-disable-next-line no-unused-vars
const STANDARD_COLORS = {
	highlighted: "#5df", // cyan used for variables
	secondary: "#f3c002", // yellow
	tertiary: "#14c778", // green
	quaternary: "#e5d", // pinkish
	graphicPrimary: "#27f", // brilliant blue
};

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
	d3Obj.datum(datum);

	if (typeof datum.class !== "undefined") {
		d3Obj.classed(datum.class, true);
	}
	if (typeof datum.classes !== "undefined") {
		for (const c of datum.classes) {
			d3Obj.classed(c, true);
		}
	}

	const t = typeof transition === "undefined" ? d3Obj : d3Obj.transition(transition);
	Object.entries(datum.attrs).forEach(([key, val]) => {
		t.attr(key, val);
	});

	if (datum.styles !== undefined) {
		Object.entries(datum.styles).forEach(([key, val]) => {
			t.style(key, val);
		});
	}

	if (typeof datum.text !== "undefined") {
		d3Obj.text(datum.text);
	}

	if (typeof datum.children !== "undefined") {
		// eslint-disable-next-line no-use-before-define
		applyGraphicalObjs(d3Obj, () => datum.children, { selector: "*", transition });
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
			exit =>
				(transition !== undefined
					? exit.transition(transition).style("opacity", 0)
					: exit
				).remove(),
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

// eslint-disable-next-line no-unused-vars
function groupBy(array, keyFunc, expectedKeys, asArray = true) {
	const grouped = {};
	for (const elem of array) {
		const key = keyFunc(elem);
		if (key in grouped) {
			grouped[key].push(elem);
		} else {
			grouped[key] = [elem];
		}
	}

	if (expectedKeys) {
		for (const k of expectedKeys) {
			if (!(k in grouped)) {
				grouped[k] = [];
			}
		}
	}

	if (asArray) {
		return Object.entries(grouped);
	}
	return grouped;
}

function _initializeRadioButtons() {
	const radioButtonContainers = document.getElementsByClassName(
		"radio-button-container",
	);

	function selectButton() {
		this.classList.add("checked-label");
		const siblingLabels = this.parentNode.getElementsByTagName("label");
		for (let j = 0; j < siblingLabels.length; ++j) {
			const label = siblingLabels[j];
			if (label === this) {
				continue;
			}
			label.classList.remove("checked-label");
		}
	}

	for (let i = 0; i < radioButtonContainers.length; ++i) {
		const rbc = radioButtonContainers[i];

		d3.select(rbc)
			.selectAll("label")
			.each(function () {
				if (this.querySelector("input").checked) {
					selectButton.call(this);
				}
			})
			.on("click", selectButton);
	}
}
_initializeRadioButtons();
