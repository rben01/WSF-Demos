/* globals _addGraphicalObjs applyDatum lorentzFactor */

"use strict";

const C = 299792458;
const MUON_BASE_LIFESPAN = 2e-6;

const CANVAS_WIDTH = 600;
const CANVAS_HEIGHT = 350;
const AXIS_MARGINS = { top: 0.03, bottom: 0.1, left: 0.13, right: 0.06 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};

const USER_INFO = {
	newtonianLineIsVisible: true,
};

const canvas = d3
	.selectAll(".viz-canvas")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

const subcanvases = canvas
	.data([
		{
			originX: 0,
			originY: 0,
			width: CANVAS_WIDTH,
			height: CANVAS_HEIGHT,
		},
	])
	.each(function (d) {
		d3.select(this)
			.append("g")
			.attr("transform", `translate(0, ${d.originY})`)
			.classed("subcanvas", true);
	})
	.selectAll("g");

const newtonianAnswerSection = document.getElementById("sect-newtonian-answer");
const toggleNewtonianButton = document.getElementById("btn-toggle-show-newtonian");
const speedInputSlider = document.getElementById("input-muon-speed");
const speedTextSpan = document.getElementById("muon-speed-text");
const lfTextSpan = document.getElementById("lorentz-factor-text");
const disintegrationDistTextSpan = document.getElementById("text-disintigration-dist");
const newtonianDistTextSpan = document.getElementById("text-newtonian-answer");

const newtonianLineColor = "#777f";

function getSpeed(speedStr) {
	speedStr = typeof speedStr !== "undefined" ? speedStr : speedInputSlider.value;
	const floatVal = parseFloat(speedStr);
	if (floatVal < 0 || floatVal > 1) {
		throw new Error(`Got invalid speed (outside [0,1]): ${floatVal}`);
	}

	return floatVal;
}

function nonRelativisticMuonDistTraveled({ fracOfC }) {
	return fracOfC * C * MUON_BASE_LIFESPAN;
}

function muonDistTraveled({ fracOfC, lf }) {
	if (typeof lf === "undefined") {
		lf = lorentzFactor({ fracOfC });
	}
	return fracOfC * C * MUON_BASE_LIFESPAN * lf;
}

const xScale = d3.scaleLinear().domain([0, 1]).range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);

const yScale = d3
	.scaleLinear()
	.domain([0, muonDistTraveled({ fracOfC: speedInputSlider.max })])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);

const graphObjs = {};

function drawGraph() {
	const data = [[0, 0]];

	const base = 10;
	const startPrecision = 2;

	outer: for (let precision = startPrecision; precision < 5; ++precision) {
		const scale = Math.pow(base, -precision);
		const lower =
			precision === startPrecision
				? Math.pow(base, -precision)
				: 1 - Math.pow(base, -precision) * (base - 1);
		const nNums = precision === startPrecision ? Math.pow(base, precision) : base;
		for (let i = 0; i < nNums - 1; ++i) {
			const x = lower + i * scale;
			const y = muonDistTraveled({ fracOfC: x });

			if (y > Math.max(...yScale.domain())) {
				break outer;
			}

			data.push([x, y, xScale(x), yScale(y)]);
		}
	}

	console.log(data);

	subcanvases.each(function () {
		const subcanvas = d3.select(this);
		const curve = d3
			.line()
			.x(xy => xScale(xy[0]))
			.y(xy => yScale(xy[1]))
			.curve(d3.curveCardinal);

		// Add main curve showing gamma
		subcanvas
			.append("svg:path")
			.attr("d", curve(data))
			.attr("stroke", "#fffd")
			.attr("stroke-width", 4);

		// Add line for Newtonian prediction
		graphObjs.newtonianLine = subcanvas
			.append("svg:line")
			.attr("x1", AX_BOUNDS.xMin)
			.attr("x2", AX_BOUNDS.xMax)
			.attr(
				"y1",
				yScale(
					nonRelativisticMuonDistTraveled({
						fracOfC: 0,
					}),
				),
			)
			.attr(
				"y2",
				yScale(
					nonRelativisticMuonDistTraveled({
						fracOfC: 1,
					}),
				),
			)
			.attr("stroke", newtonianLineColor)
			.attr("stroke-width", 2)
			.attr("stroke-dasharray", "5 5")
			.classed("newtonian-prediction", true);

		// Add axes
		const commonAxesAttrs = {
			stroke: "#fff3",
			"stroke-width": 2,
		};
		const axesAttrs = [
			{
				class: "x-axis",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMax,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMin,
					...commonAxesAttrs,
				},
			},
			{
				class: "y-axis",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMin,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMax,
					...commonAxesAttrs,
				},
			},
		];

		subcanvas
			.selectAll()
			.data(axesAttrs)
			.enter()
			.append("svg:line")
			.each(applyDatum);

		// Make ticks
		const minorTickLength = 3;
		const commonTickAttrs = {
			stroke: "#fff4",
			"stroke-width": 1,
		};

		const xTicksData = xScale.ticks(21).map(x => {
			const tickX = xScale(x);
			return {
				class: "x-tick",
				attrs: {
					x1: tickX,
					x2: tickX,
					y1: AX_BOUNDS.yMin,
					y2: AX_BOUNDS.yMin - minorTickLength,
					...commonTickAttrs,
				},
			};
		});
		const yTicksData = yScale.ticks(21).map(y => {
			const tickY = yScale(y);
			return {
				class: "y-tick",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: AX_BOUNDS.xMin + minorTickLength,
					y1: tickY,
					y2: tickY,
					...commonTickAttrs,
				},
			};
		});

		subcanvas
			.selectAll()
			.data([...xTicksData, ...yTicksData])
			.enter()
			.append("svg:line")
			.each(applyDatum);

		// Add axis labels
		const commonAxisLabelAttrs = {
			"font-size": 15,
			fill: "white",
		};
		const xTickTextData = xScale.ticks(6).map(x => {
			return {
				class: "x-axis-label",
				text: x,
				attrs: {
					x: xScale(x),
					y: AX_BOUNDS.yMin + 22,
					"text-anchor": "middle",
					"dominant-baseline": "text-top",
					...commonAxisLabelAttrs,
				},
			};
		});

		const yTickTextData = yScale.ticks(4).map(y => {
			return {
				class: "y-axis-label",
				text: y,
				attrs: {
					x: AX_BOUNDS.xMin - 10,
					y: yScale(y),
					"text-anchor": "end",
					"dominant-baseline": "central",
					...commonAxisLabelAttrs,
				},
			};
		});

		subcanvas
			.selectAll()
			.data([...xTickTextData, ...yTickTextData])
			.enter()
			.append("svg:text")
			.each(applyDatum)
			.text(d => d.text);

		// Add v/c label to x axis
		// https://stackoverflow.com/a/22085843
		subcanvas
			.append("text")
			.selectAll()
			.data([
				{ char: "𝑣", height: 1 },
				{ char: "＿", height: 0.7 },
				{ char: "𝑐", height: 1 },
			])
			.enter()
			.append("tspan")
			.attr("x", AX_BOUNDS.xMax + 25)
			.attr("y", AX_BOUNDS.yMin - 16)
			.attr("dy", (d, i) => `${i * 0.6 + d.height}em`)
			.attr("font-size", 20)
			.attr("stroke", "white")
			.attr("fill", "white")
			.attr("text-anchor", "middle")
			.text(d => d.char)
			.classed("x-axis-unit", true);

		// Add distance label to y axis
		subcanvas
			.append("svg:text")
			.attr("x", AX_BOUNDS.xMin)
			.attr("y", AX_BOUNDS.yMax - 10)
			.attr("font-size", 20)
			.attr("fill", "white")
			.attr("text-anchor", "middle")
			.text("Distance (meters)");
	});
}

function getGridlinesData({ fracOfC }) {
	if (typeof fracOfC === "undefined") {
		fracOfC = 0.5;
	}

	const x = xScale(fracOfC);
	const y = yScale(muonDistTraveled({ fracOfC }));

	const commonLineAttrs = {
		stroke: "#fffb",
		"stroke-width": 3,
		"stroke-dasharray": "1.5 1.5",
	};
	return [
		{
			shape: "line",
			class: "gridline",
			type: "horizontal",
			attrs: {
				x1: AX_BOUNDS.xMin,
				x2: x,
				y1: y,
				y2: y,
				...commonLineAttrs,
			},
		},
		{
			shape: "line",
			class: "gridline",
			type: "vertical",
			attrs: {
				x1: x,
				x2: x,
				y1: AX_BOUNDS.yMin,
				y2: y,
				...commonLineAttrs,
			},
		},
		{
			shape: "circle",
			class: "gridline-dot",
			attrs: {
				cx: x,
				cy: y,
				r: 4,
				fill: "white",
			},
		},
	];
}

drawGraph();
graphObjs.gridLines = _addGraphicalObjs(subcanvases, getGridlinesData);

// eslint-disable-next-line no-unused-vars
function updateMuonSpeed(speedStr, { fromUserInput = true } = {}) {
	try {
		if (!fromUserInput) {
			speedInputSlider.value = speedStr;
		}

		const speed = getSpeed(speedStr);
		speedTextSpan.textContent = speed.toFixed(3);

		const lf = lorentzFactor({ fracOfC: speed });
		lfTextSpan.textContent = lf.toFixed(3);

		const newtonianDistTraveled = speed * C * MUON_BASE_LIFESPAN;
		newtonianDistTextSpan.textContent = newtonianDistTraveled.toFixed(2);

		const trueDistTraveled = newtonianDistTraveled * lf;
		disintegrationDistTextSpan.textContent = trueDistTraveled.toFixed(2);

		graphObjs.gridLines
			.data(getGridlinesData({ fracOfC: speed }))
			.each(function (d) {
				const transition = d3.select(this).transition().duration(10);
				Object.entries(d.attrs).forEach(([key, val]) => {
					transition.attr(key, val);
				});
			});
	} catch (e) {
		console.log(speedStr);
		throw e;
	}
}

// eslint-disable-next-line no-unused-vars
function hideNewtonianLine() {
	const transitionDurationMS = 150;

	USER_INFO.newtonianLineIsVisible = !USER_INFO.newtonianLineIsVisible;
	let opacity;
	if (USER_INFO.newtonianLineIsVisible) {
		toggleNewtonianButton.textContent = "Hide Newtonian Answer";
		opacity = 1;
	} else {
		toggleNewtonianButton.textContent = "Show Newtonian Answer";
		opacity = 0;
	}
	d3.select(newtonianAnswerSection)
		.transition()
		.duration(transitionDurationMS)
		.style("opacity", opacity);

	const color = USER_INFO.newtonianLineIsVisible ? newtonianLineColor : "#0000";
	graphObjs.newtonianLine
		.transition()
		.duration(transitionDurationMS)
		.attr("stroke", color);
}
