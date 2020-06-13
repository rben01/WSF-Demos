/* global applyDatum applyGraphicalObjs lorentzFactor */
const EPSILON = 0.0000001;

const RANGES = {
	axis: { min: -1, max: 1 },
};

Object.values(RANGES).forEach(range => {
	range.mid = (range.max + range.min) / 2;
	range.span = range.max - range.min;
});

const AXIS_MARGINS = {
	top: 0.05,
	bottom: 0.05,
	left: 0.05,
	right: 0.05,
};
const CANVAS_HEIGHT = 400;
const CANVAS_WIDTH = 400;
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const speedSlider = document.getElementById("input-speed");
// const nSpokesSlider = document.getElementById("input-n-spokes");

const highlightFGColor = "#5df";

const canvases = d3
	.select("#viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const ARROWHEAD_ID = "marker-arrowhead";

(() => {
	const markerAttrs = {
		attrs: {
			refX: 4,
			refY: 2.5,
			markerUnits: "strokeWidth",
			markerWidth: 7,
			markerHeight: 5,
			orient: "auto",
		},
	};
	const pathAttrs = {
		attrs: {
			d: "M 1 1 L 5 2.5 L 1 4 L 2 2.5 z",
			"stroke-linejoin": "miter",
			stroke: highlightFGColor,
			fill: highlightFGColor,
		},
	};
	const defs = canvases.append("svg:defs");

	defs.append("svg:marker")
		.attr("id", ARROWHEAD_ID)
		.each(function () {
			applyDatum.call(this, markerAttrs);
		})
		.append("svg:path")
		.each(function () {
			applyDatum.call(this, pathAttrs);
		});
})();

const subcanvases = canvases
	.selectAll("g")
	.data(() => [
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
		},
	])
	.join("g")
	.attr("transform", d => `translate(0, ${d.originY})`)
	.classed("subcanvas", true);

const xScale = d3
	.scaleLinear()
	.domain([RANGES.axis.min, RANGES.axis.max])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);
const yScale = d3
	.scaleLinear()
	.domain([RANGES.axis.min, RANGES.axis.max])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);
const xDistScale = d3
	.scaleLinear()
	.domain([0, RANGES.axis.span])
	.range([0, AX_BOUNDS.xMax - AX_BOUNDS.xMin]);
const yDistScale = d3
	.scaleLinear()
	.domain([0, RANGES.axis.span])
	.range([0, AX_BOUNDS.yMin - AX_BOUNDS.yMax]);

const RADIUS = (RANGES.axis.span / 2) * 0.9;
const line = d3
	.line()
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

const spokeXes = (() => {
	const x = [];
	const dx = RANGES.axis.span / 300;
	const nx = Math.ceil(RADIUS / dx);
	for (let i = -nx; i <= nx; ++i) {
		x.push(RANGES.axis.mid + i * dx);
	}
	return x;
})();

const COLORS = d3.schemeSet1;

function getSpokeDatum({ fracOfC, nSpokes, i }) {
	const klass = "drawing spoke";
	const id = `spoke_${i}`;
	const color = COLORS[i % COLORS.length];
	if (i === 0) {
		const xMid = xScale(RANGES.axis.mid);
		return {
			shape: "line",
			class: klass,
			attrs: {
				id,
				x1: xMid,
				y1: yScale(RANGES.axis.mid - RADIUS),
				x2: xMid,
				y2: yScale(RANGES.axis.mid + RADIUS),
				stroke: color,
				"stroke-width": 3,
			},
		};
	} else {
		const lf = lorentzFactor({ fracOfC });
		const theta0 = Math.PI / 2 + (Math.PI / nSpokes) * i;
		const xys = spokeXes
			.map(x => {
				const angle = theta0 + (x * lf * fracOfC * fracOfC) / RADIUS;

				// A different branch of the tan function, which we don't want to include
				if (
					angle - EPSILON <= Math.PI * 0.5 ||
					angle + EPSILON >= Math.PI * 1.5
				) {
					return null;
				}
				const y = x * lf * Math.tan(angle);
				return [x, y, angle, Math.tan(angle) / Math.PI];
			})
			.filter(p => p !== null);
		// if (i === nSpokes - 1) {
		// 	console.log(xys);
		// }

		const path = line(xys);
		return {
			shape: "path",
			class: klass,
			attrs: {
				id,
				d: path,
				stroke: color,
				"fill-opacity": 0,
				"stroke-width": 3,
				"clip-path": "url(#wheelClip)",
			},
		};
	}
}

function getWheelAndSpokeData({ fracOfC, nSpokes }) {
	const wheelGhostDatum = {
		shape: "circle",
		class: "drawing wheel-fixed",
		attrs: {
			id: "fixed-wheel",
			cx: xScale(RANGES.axis.mid),
			cy: yScale(RANGES.axis.mid),
			r: xDistScale(RADIUS),
			stroke: "#aaa",
			"fill-opacity": 0,
			"stroke-width": 1,
			"stroke-dasharray": "2 2",
		},
	};

	const movingWheelDatum = {
		shape: "ellipse",
		class: "drawing wheel-moving",
		attrs: {
			id: "moving-wheel",
			cx: xScale(RANGES.axis.mid),
			cy: yScale(RANGES.axis.mid),
			rx: xDistScale(RADIUS / lorentzFactor({ fracOfC })),
			ry: yDistScale(RADIUS),
			stroke: "white",
			"stroke-width": 3,
			"fill-opacity": 0,
		},
	};

	const movingWheelClip = {
		shape: "clipPath",
		class: "drawing",
		attrs: {
			id: "wheelClip",
		},
		children: [{ ...movingWheelDatum, attrs: { ...movingWheelDatum.attrs } }],
	};

	// Remove class to avoid catching the clip's child in the selection, and remove duplicate ID that will be used up in the data join
	movingWheelClip.children.forEach(child => {
		delete child.attrs.id;
	});

	const spokesData = [];
	for (let i = 0; i < nSpokes; ++i) {
		const spokeDatum = getSpokeDatum({ fracOfC, nSpokes, i });
		spokesData.push(spokeDatum);
	}

	const centralDotDatum = {
		shape: "circle",
		class: "drawing",
		attrs: {
			id: "hub",
			cx: xScale(RANGES.axis.mid),
			cy: yScale(RANGES.axis.mid),
			r: 5,
			fill: "white",
		},
	};

	return [
		wheelGhostDatum,
		...spokesData,
		movingWheelClip,
		movingWheelDatum,
		centralDotDatum,
	];
}

let currNSpokes = 4;

function update({ fracOfC, nSpokes } = {}) {
	if (typeof fracOfC === "undefined") {
		fracOfC = speedSlider.value;
	}
	fracOfC = +fracOfC;

	if (typeof nSpokes === "undefined") {
		nSpokes = currNSpokes;
	} else {
		currNSpokes = nSpokes;
		// eslint-disable-next-line no-use-before-define
		spokeButtons.forEach(button => {
			button.disabled = +button.value === +nSpokes;
		});
	}
	nSpokes = +nSpokes;

	applyGraphicalObjs(subcanvases, getWheelAndSpokeData({ fracOfC, nSpokes }), {
		key: d => (d ? d.attrs.id : this.id),
		selector: ".drawing",
	});
}

const spokeButtons = (() => {
	const spokeLabel = document.getElementById("spoke-label");
	const buttons = [];
	for (let nSpokes = 4; nSpokes <= 6; ++nSpokes) {
		const button = document.createElement("button");
		button.textContent = nSpokes;
		button.id = `spoke-button-${nSpokes}`;
		button.classList.add("spoke-button");
		button.value = nSpokes;
		button.disabled = nSpokes === currNSpokes;
		button.onclick = function () {
			update({ nSpokes: this.value });
		};
		buttons.push(button);

		spokeLabel.appendChild(button);
	}

	return buttons;
})();

update();
