"use strict";

import * as d3 from "d3";

type Datum = {
	shape: string;
	attrs?: { [key: string]: any };
	styles?: { [key: string]: string };
	text?: string;
	class?: string;
	classes?: string[];
	children?: Datum[];
};

// eslint-disable-next-line no-unused-vars
export const C = 299792458;
// eslint-disable-next-line no-unused-vars
export const HL_COLOR = "#5df";
// eslint-disable-next-line no-unused-vars
export const STANDARD_COLORS = {
	highlighted: "#5df", // cyan used for variables
	secondary: "#f3c002", // yellow
	tertiary: "#14c778", // green
	quaternary: "#e5d", // pinkish
	graphicPrimary: "#27f", // brilliant blue
};

// https://stackoverflow.com/a/32538867
// eslint-disable-next-line no-unused-vars
export function isIterable(obj) {
	// checks for null and undefined
	if (obj === null || typeof obj === "undefined") {
		return false;
	}
	return typeof obj[Symbol.iterator] === "function";
}

export function applyDatum(
	datum: Datum,
	{ transition }: { transition?: d3.Transition<any, Datum, any, any> } = {},
) {
	const d3Obj = d3.select(this);
	d3Obj.datum(datum);

	if (
		(datum.class !== undefined || datum.classes !== undefined) &&
		this.hasAttribute("class")
	) {
		this.removeAttribute("class");
	}

	if (typeof datum.class !== "undefined") {
		d3Obj.classed(datum.class, true);
	}
	if (typeof datum.classes !== "undefined") {
		for (const c of datum.classes) {
			d3Obj.classed(c, true);
		}
	}

	const t = transition === undefined ? d3Obj : d3Obj.transition(transition);
	if (datum.attrs !== undefined) {
		Object.entries(datum.attrs).forEach(([key, val]) => {
			t.attr(key, val);
		});
	}

	if (datum.styles !== undefined) {
		Object.entries(datum.styles).forEach(([key, val]) => {
			t.style(key, val);
		});
	}

	if (datum.text !== undefined) {
		d3Obj.text(datum.text);
	}

	if (datum.children !== undefined) {
		// eslint-disable-next-line no-use-before-define
		applyGraphicalObjs(d3Obj, () => datum.children, {
			selector: function () {
				return this.children;
			},
			transition,
		});
	}
}

// eslint-disable-next-line no-unused-vars
export function applyGraphicalObjs(
	sel,
	data: Datum[] | (() => Datum[]),
	{
		key,
		selector,
		cssClass,
		transition,
	}: {
		key?: string;
		selector?: string | (() => void);
		cssClass?: string;
		transition?: d3.Transition<any, Datum, any, any>;
	} = {},
) {
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
export function lorentzFactor({ fracOfC }) {
	if (!fracOfC) {
		fracOfC = 0;
	}
	return 1 / Math.sqrt(1 - fracOfC * fracOfC);
}

// eslint-disable-next-line no-unused-vars
export function sign(x, epsilon) {
	if (typeof epsilon === "undefined") {
		epsilon = 1e-6;
	}
	return x < -epsilon ? -1 : x < epsilon ? 0 : 1;
}

// eslint-disable-next-line no-unused-vars
export function l2Norm(...vector) {
	const sum = vector.reduce((accum, currVal) => accum + currVal * currVal, 0);
	return Math.sqrt(sum);
}

export function __matMulHelper(mat1, mat2) {
	const mat1IsVector = typeof mat1[0].length === "undefined";
	if (mat1IsVector) {
		// Convert to row vector if necessary
		mat1 = [mat1];
	}

	const mat2IsVector = typeof mat2[0].length === "undefined";
	if (mat2IsVector) {
		// Convert to column vector if necessary
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

	if (mat1IsVector) {
		if (mat2IsVector) {
			// ans will look like [[x]]
			return ans[0][0];
		}
		// ans will look like [[x, y, z, ...]]
		return ans[0];
	} else if (mat2IsVector) {
		// ans will look like [[x], [y], [z], ...]
		return ans.map(row => row[0]);
	}

	return ans;
}

// eslint-disable-next-line no-unused-vars
export function matMul(...mats) {
	let ans = mats[0];
	for (let i = 1; i < mats.length; ++i) {
		ans = __matMulHelper(ans, mats[i]);
	}
	return ans;
}

// eslint-disable-next-line no-unused-vars
export function defineArrowhead(defs, { id, length, width, color, attrs, flip }) {
	attrs = attrs ?? {};
	// flip = flip ?? false;
	flip = false;

	const markerAttrs = {
		attrs: {
			refX: length / 2,
			refY: width / 2,
			markerUnits: "userSpaceOnUse",
			markerWidth: length,
			markerHeight: width,
			orient: "auto-start-reverse",
		},
	};

	const path = flip
		? `M ${length - 1} 1
		   L 1 ${width / 2}
			L ${length - 1} ${width - 1}
			L ${(2 * length) / 3} ${width / 2}
			z`
		: `M 1 1
		   L ${length - 1} ${width / 2}
			L 1 ${width - 1}
			L ${length / 3} ${width / 2}
			z`;

	const arrowheadAttrs = {
		attrs: {
			d: path,
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
export function groupBy(array, keyFunc, expectedKeys, asArray = true) {
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

// We'll use x and y terminology to describe gridlines running parallel to the y axis,
// but of course you can swap x and y in the returned array to get gridlines in the
// other direction. Returns an array of gridlines; each gridline is an array of points
// [x,y]
// eslint-disable-next-line no-unused-vars
export function getGridlines({
	nGridlines,
	xMin,
	xMax,
	yMin,
	yMax,
	zFunc,
	drawEdges,
	nPointsPerGridline,
	swapOrientation,
}) {
	drawEdges = drawEdges ?? false;
	swapOrientation = swapOrientation ?? false;
	nPointsPerGridline = nPointsPerGridline ?? 51;

	if (swapOrientation) {
		[xMin, yMin] = [yMin, xMin];
		[xMax, yMax] = [yMax, xMax];
	}

	const iMin = drawEdges ? 0 : 1;
	const iMaxPlus1 = drawEdges ? nGridlines : nGridlines - 1;

	const dx = (xMax - xMin) / (nGridlines - 1);
	const dy = (yMax - yMin) / (nPointsPerGridline - 1);
	const gridlines = [];
	for (let i = iMin; i < iMaxPlus1; ++i) {
		const x = xMin + i * dx;
		const gridline = [];
		for (let j = 0; j < nPointsPerGridline; ++j) {
			const y = yMin + j * dy;
			let trueX, trueY;
			if (!swapOrientation) {
				trueX = x;
				trueY = y;
			} else {
				trueX = y;
				trueY = x;
			}
			const point = [trueX, trueY];
			if (zFunc === null) {
				point.push(null);
			} else if (zFunc) {
				point.push(zFunc(trueX, trueY));
			}
			gridline.push(point);
		}
		gridlines.push(gridline);
	}

	return gridlines;
}

// eslint-disable-next-line no-unused-vars
export function sampleFromCdf(cdfPoints, n) {
	n = n ?? 1;
	const samples = [];
	const nPoints = cdfPoints.length;

	for (let i = 0; i < n; ++i) {
		const r = Math.random();
		let left = 0;
		let right = nPoints - 1;
		let currentIndex;

		while (left < right - 1) {
			currentIndex = Math.floor((left + right) / 2);
			const currentPoint = cdfPoints[currentIndex];
			const y = currentPoint[1];
			if (r > y) {
				left = currentIndex;
			} else {
				right = currentIndex;
			}
		}

		let value;
		if (left < nPoints - 1) {
			const [x1, y1] = cdfPoints[left];
			const [x2, y2] = cdfPoints[right];
			const t = (r - y1) / (y2 - y1);
			value = (1 - t) * x1 + t * x2;
		} else {
			value = cdfPoints[left][0];
		}
		samples.push(value);
	}

	return samples;
}

export function syncButtonState(button) {
	if (button.hasAttribute("data-button-checked")) {
		button.disabled = true;
	} else if (button.disabled) {
		button.setAttribute("data-button-checked", "");
	}
}
export function _initializeRadioButtons() {
	const radioButtonContainers = document.getElementsByClassName(
		"radio-button-container",
	);
	const thisElem = this as HTMLInputElement;

	for (let i = 0; i < radioButtonContainers.length; ++i) {
		const rbc = radioButtonContainers[i];

		const sel = d3
			.select(rbc)
			.selectAll("button")
			.each(function () {
				syncButtonState(this);
			});

		if (!rbc.classList.contains("manual-radio-buttons")) {
			sel.on("click._default", function () {
				thisElem.setAttribute("data-button-checked", "");
				thisElem.disabled = true;
				const siblings = Array.from(
					thisElem
						.closest(".radio-button-container")
						.querySelectorAll("button"),
				);
				for (const sibling of siblings) {
					if (this === sibling) {
						continue;
					}
					sibling.disabled = false;
					sibling.removeAttribute("data-button-checked");
				}
			});
		}
	}
}
_initializeRadioButtons();

export function _initializeHideableControlsContainer() {
	const MIN_DIST_FOR_FULL_OPACITY = 40;
	const MAX_DIST_FOR_NONZERO_OPACITY = 400;
	const opacityScale = d3
		.scaleLinear([MIN_DIST_FOR_FULL_OPACITY, MAX_DIST_FOR_NONZERO_OPACITY], [1, 0])
		.clamp(true);

	function adjustHidableElemOpacity(event) {
		const [mouseX, mouseY] = d3.pointer(event, document.body);

		const hidableElems = document.getElementsByClassName("hides-on-mouse-away");
		const nHidableElems = hidableElems.length;

		for (let i = 0; i < nHidableElems; ++i) {
			const elem = hidableElems[i] as HTMLElement;
			const { left, right, top, bottom } = elem.getBoundingClientRect();
			const horizontalDist = Math.max(0, left - mouseX, mouseX - right);
			const verticalDist = Math.max(0, top - mouseY, mouseY - bottom);
			const dist = (horizontalDist ** 2 + verticalDist ** 2) ** 0.5;

			const opacity = opacityScale(dist);

			elem.style.opacity = opacity.toString();
		}

		if (hidableElems.length === 0) {
			return;
		}
	}

	d3.select(document.body).on(
		"mousemove.hide-container-on-mouse-away",
		adjustHidableElemOpacity,
	);
}

_initializeHideableControlsContainer();
