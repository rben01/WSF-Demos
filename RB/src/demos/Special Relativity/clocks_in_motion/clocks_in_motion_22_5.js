/* global applyDatum applyGraphicalObjs lorentzFactor C */
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
const CANVAS_HEIGHT = 550;
const CANVAS_WIDTH = 550;
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const speedSlider = document.getElementById("input-speed");
const speedTextSpan = document.getElementById("text-speed");

const arrowColor = "#aaa";

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
			stroke: arrowColor,
			fill: arrowColor,
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

const RADIUS = (RANGES.axis.span / 2) * 0.8;
const line = d3
	.line()
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

const arcArrowDatum = (() => {
	const xys = [];
	const radius = RADIUS * 1.2;
	const span = RANGES.axis.span * 0.2;
	const dx = span / 100;
	const nx = Math.ceil(span / dx);
	for (let i = nx; i >= -nx; --i) {
		const x = RANGES.axis.mid + i * dx;
		const y =
			RANGES.axis.mid +
			Math.sqrt(Math.pow(radius, 2) - Math.pow(x - RANGES.axis.mid, 2));
		xys.push([x, y]);
	}

	const path = line(xys);

	return {
		shape: "path",
		class: "drawing",
		attrs: {
			id: "arc",
			d: path,
			stroke: arrowColor,
			"stroke-width": 3,
			"marker-end": `url(#${ARROWHEAD_ID})`,
		},
	};
})();

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

const COLORS = (() => {
	const c = d3.schemeCategory10.map(color => d3.interpolateRgb(color, "white")(0.05));
	c[5] = "#fe2";
	return c;
})();

// const COLORS = (() => {
// 	const colors = d3.schemeCategory10.filter((_, index) => index !== 5 && index !== 7);
// 	colors[6] = colors[5];
// 	colors[5] = "#ee3";
// 	return colors.map(color => d3.interpolateRgb(color, "white")(0.05));
// })();

function getSpokeDatum({ fracOfC, nSpokes, i }) {
	const klass = "drawing spoke";
	const id = `spoke-${i}`;
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
	}

	const lf = lorentzFactor({ fracOfC });
	const theta0 = Math.PI / 2 + (Math.PI / nSpokes) * i; // angle above the horizontal

	const xs = [];
	const dx = RANGES.axis.span / lf / 200;
	const nx = Math.ceil(RADIUS / dx);
	for (let i = -nx; i <= nx; ++i) {
		xs.push(RANGES.axis.mid + i * dx);
	}

	const v = fracOfC * C;

	const xys = xs
		.map(x => {
			const angle = theta0 + (x * lf * lf * fracOfC * fracOfC) / RADIUS;

			// A different branch of the tan function, which we don't want to include
			if (angle - EPSILON <= Math.PI * 0.5 || angle + EPSILON >= Math.PI * 1.5) {
				return null;
			}

			const y = x * lf * Math.tan(angle);
			return [x, y, angle, Math.tan(angle) / Math.PI];
		})
		.filter(p => p !== null);

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

function getWheelAndSpokeData({ fracOfC, nSpokes }) {
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

	// Remove duplicate ID that will be used up in the data join
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
		arcArrowDatum,
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

	speedTextSpan.textContent = fracOfC.toFixed(2);
}

const spokeButtons = (() => {
	const spokeLabel = document.getElementById("spoke-label");
	const buttons = [];
	for (let nSpokes = 4; nSpokes <= 6; ++nSpokes) {
		const button = document.createElement("button");
		button.textContent = nSpokes;
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
