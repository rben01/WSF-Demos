/* globals applyDatum */

"use strict";

const CANVAS_WIDTH = 500;
const CANVAS_HEIGHT = 450;
const AXIS_MARGINS = { top: 0.13, bottom: 0.08, left: 0.13, right: 0.17 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};
const galileanFgColor = "#aaaf";

const ROCKET = "rocket";
const PROJECTILE = "projectile";

const canvas = d3
	.select("#canvas-rocket-projectile")
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

const groundFrameProjectileSpeedTextSpan = document.getElementById(
	"text-ground-frame-projectile-speed",
);
const galileanSpeedPredictionTextSpan = document.getElementById(
	"text-galilean-speed-prediction",
);

const galileanDescription = document.getElementById("text-galilean-prediction");
const galileanButton = document.getElementById("btn-hide-newtonian");

const OBJECTS = {
	[ROCKET]: {
		speed: 0,
		speedSlider: document.getElementById("input-rocket-speed"),
		textSpan: document.getElementById("text-ground-frame-rocket-speed"),
	},
	[PROJECTILE]: {
		speed: 0,
		speedSlider: document.getElementById("input-projectile-speed"),
		textSpan: document.getElementById("text-rocket-frame-projectile-speed"),
	},
};

function _getSpeedHelper(speedStr, { obj }) {
	speedStr =
		typeof speedStr !== "undefined" ? speedStr : OBJECTS[obj].speedSlider.value;
	const floatVal = parseFloat(speedStr);
	if (floatVal < 0 || floatVal > 1) {
		throw new Error(`Got invalid speed (outside [0,1]): ${floatVal}`);
	}

	return floatVal;
}

function getRocketSpeed(speedStr) {
	return _getSpeedHelper(speedStr, { obj: ROCKET });
}
function getProjectileSpeed(speedStr) {
	return _getSpeedHelper(speedStr, { obj: PROJECTILE });
}

function getRelativisticProjectileSpeed({
	rocketFracOfC,
	projectileFracOfCRelativeToRocket,
} = {}) {
	if (typeof rocketFracOfC === "undefined") {
		rocketFracOfC = getRocketSpeed();
	}

	if (typeof projectileFracOfCRelativeToRocket === "undefined") {
		projectileFracOfCRelativeToRocket = getProjectileSpeed();
	}

	return (
		(rocketFracOfC + projectileFracOfCRelativeToRocket) /
		(1 + rocketFracOfC * projectileFracOfCRelativeToRocket)
	);
}

function getGalileanProjectileSpeed({
	rocketFracOfC,
	projectileFracOfCRelativeToRocket,
}) {
	return rocketFracOfC + projectileFracOfCRelativeToRocket;
}

const xScale = d3
	.scaleLinear()
	.domain([-0.02, 1])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);

const yScale = d3
	.scaleLinear()
	.domain([-0.04, 2])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);

const graphObjs = {};

// eslint-disable-next-line no-unused-vars
function drawGraph({ baseObject }) {
	return subcanvases.each(function () {
		const subcanvas = d3.select(this);

		// subcanvas
		// 	.append("svg:line")
		// 	.attr("x1", xScale(0))
		// 	.attr("x2", xScale(1))
		// 	.attr("y1", yScale(0))
		// 	.attr("y2", yScale(2))
		// 	.attr("stroke", "white")
		// 	.attr("stroke-width", 2);

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

		// Add v/c label to x and y axes
		const apostropheWidth = 3;
		const subscriptXOffset = 4;
		const subscriptYOffset = 2;
		const fracBarYOffset = 7;
		const fracBarWidth = 19;
		const denominatorYOffset = 20;

		// x axis
		const xLabelX = xScale.range()[1] + 30;
		const xLabelY = AX_BOUNDS.yMin;
		// https://stackoverflow.com/a/22085843
		const xAxisText = subcanvases
			.append("text")
			.attr("x", xLabelX)
			.attr("y", xLabelY)
			.attr("font-size", 21)
			.attr("stroke", "white")
			.attr("fill", "white")
			.attr("text-anchor", "middle");
		// .attr("text-rendering", "geometricPrecision");
		xAxisText
			.append("tspan")
			.attr("x", xLabelX)
			.text(`𝑣${baseObject === ROCKET ? " " : "′"}`);
		xAxisText
			.append("tspan")
			.text(baseObject === ROCKET ? "rocket" : "projectile")
			.attr("font-size", 12)
			.attr("font-weight", 8)
			.attr("text-anchor", "start")
			.attr(
				"x",
				xLabelX +
					subscriptXOffset +
					(baseObject === PROJECTILE ? 0 : apostropheWidth),
			)
			.attr("dy", subscriptYOffset);
		xAxisText
			.append("svg:tspan")
			.text("𝑐")
			.attr("x", xLabelX)
			.attr("dy", denominatorYOffset);
		subcanvas
			.append("line")
			.attr("x1", xLabelX - fracBarWidth / 2)
			.attr("x2", xLabelX + fracBarWidth / 2)
			.attr("y1", xLabelY + fracBarYOffset)
			.attr("y2", xLabelY + fracBarYOffset)
			.attr("stroke", "white")
			.attr("stroke-width", 2);

		// Add distance label to y axis
		const yLabelX = AX_BOUNDS.xMin;
		const yLabelY = AX_BOUNDS.yMax - 40;
		const yAxisText = subcanvas
			.append("text")
			.attr("x", yLabelX)
			.attr("y", yLabelY)
			.attr("font-size", 21)
			.attr("stroke", "white")
			.attr("fill", "white")
			.attr("text-anchor", "middle");
		yAxisText.append("tspan").attr("x", xScale.range()[0]).text("𝑣");
		yAxisText
			.append("tspan")
			.text("projectile")
			.attr("font-size", 12)
			.attr("font-weight", 8)
			.attr("text-anchor", "start")
			.attr("x", yLabelX + subscriptXOffset + 4)
			.attr("dy", subscriptYOffset);
		yAxisText
			.append("tspan")
			.text("𝑐")
			.attr("x", xScale.range()[0])
			.attr("dy", denominatorYOffset);
		subcanvas
			.append("line")
			.attr("x1", yLabelX - fracBarWidth / 2)
			.attr("x2", yLabelX + fracBarWidth / 2)
			.attr("y1", yLabelY + fracBarYOffset)
			.attr("y2", yLabelY + fracBarYOffset)
			.attr("stroke", "white")
			.attr("stroke-width", 2);
	});
}

const graphAttrs = {
	[ROCKET]: { stroke: "#4c4f" },
	[PROJECTILE]: { stroke: "red" },
	common: { "stroke-width": 4, fill: "#0000" },
};
function getGraphData({ baseObject }) {
	const speeds = {
		[ROCKET]: getRocketSpeed(),
		[PROJECTILE]: getProjectileSpeed(),
	};

	const xBounds = {
		min: 0,
		max: Math.max(...xScale.domain()),
	};
	const yBounds = {
		min: 0,
		max: Math.max(...yScale.domain()),
	};

	function getCurveData() {
		const data = [];

		if (baseObject === ROCKET) {
			data.push([0, speeds[PROJECTILE]]);
		} else {
			data.push([0, speeds[ROCKET]]);
		}

		const base = 10;
		const startPrecision = 2;

		let y;
		for (let precision = startPrecision; precision < 5; ++precision) {
			const scale = Math.pow(base, -precision);
			const lower =
				precision === startPrecision
					? Math.pow(base, -precision)
					: 1 - Math.pow(base, -precision) * (base - 1);
			const nNums =
				precision === startPrecision ? Math.pow(base, precision) : base;
			for (let i = 0; i < nNums - 1; ++i) {
				const x = lower + i * scale;
				if (baseObject === ROCKET) {
					y = getRelativisticProjectileSpeed({
						rocketFracOfC: x,
						projectileFracOfCRelativeToRocket: speeds[PROJECTILE],
					});
				} else {
					y = getRelativisticProjectileSpeed({
						rocketFracOfC: speeds[ROCKET],
						projectileFracOfCRelativeToRocket: x,
					});
				}

				if (
					xBounds.min < x &&
					x <= xBounds.max &&
					yBounds.min < y &&
					y <= yBounds.max
				) {
					data.push([x, y, xScale(x), yScale(y)]);
				}
			}
		}

		const curve = d3
			.line()
			.x(xy => xScale(xy[0]))
			.y(xy => yScale(xy[1]))
			.curve(d3.curveCardinal);

		return [
			{
				shape: "path",
				class: "curve",
				attrs: {
					d: curve(data),
					...graphAttrs[baseObject],
					...graphAttrs.common,
				},
			},
			{
				shape: "line",
				galilean: true,
				class: "galilean galilean-line",
				attrs: {
					x1: xScale(xBounds.min),
					x2: xScale(xBounds.max),
					y1: yScale(data[0][1]),
					y2: yScale(
						getGalileanProjectileSpeed({
							rocketFracOfC:
								baseObject === ROCKET ? xBounds.max : speeds[ROCKET],
							projectileFracOfCRelativeToRocket:
								baseObject === PROJECTILE
									? xBounds.max
									: speeds[PROJECTILE],
						}),
					),
					stroke: galileanFgColor,
					"stroke-width": 4,
					"stroke-dasharray": "5 3",
				},
			},
		];
	}

	function getGridlinesData() {
		const x =
			baseObject === ROCKET ? xScale(speeds[ROCKET]) : xScale(speeds[PROJECTILE]);
		const y = yScale(
			getRelativisticProjectileSpeed({
				rocketFracOfC: speeds[ROCKET],
				projectileFracOfCRelativeToRocket: speeds[PROJECTILE],
			}),
		);

		const fgColor = "#fd2f";

		const commonLineAttrs = {
			"stroke-width": 2,
			"stroke-dasharray": "1.5 1.5",
		};

		const galileanY = yScale(
			getGalileanProjectileSpeed({
				rocketFracOfC:
					baseObject === ROCKET ? xScale.invert(x) : speeds[ROCKET],
				projectileFracOfCRelativeToRocket:
					baseObject === PROJECTILE ? xScale.invert(x) : speeds[PROJECTILE],
			}),
		);

		// Galilean line must go first so that it's drawn over by the other line
		return [
			{
				shape: "line",
				class: "galilean galilean-gridline",
				galilean: true,
				type: "horizontal",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: x,
					y1: galileanY,
					y2: galileanY,
					stroke: galileanFgColor,
					...commonLineAttrs,
				},
			},
			{
				shape: "line",
				class: "galilean galilean-gridline",
				galilean: true,
				type: "horizontal",
				attrs: {
					x1: x,
					x2: x,
					y1: y,
					y2: galileanY,
					stroke: galileanFgColor,
					...commonLineAttrs,
				},
			},
			{
				shape: "circle",
				galilean: true,
				class: "galilean galilean-gridline-dot",
				attrs: {
					cx: x,
					cy: galileanY,
					r: 4,
					fill: "#ddd",
				},
			},
			{
				shape: "line",
				class: "gridline",
				type: "horizontal",
				attrs: {
					x1: AX_BOUNDS.xMin,
					x2: x,
					y1: y,
					y2: y,
					stroke: fgColor,
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
					stroke: fgColor,
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
					fill: fgColor,
				},
			},
		];
	}

	return [...getCurveData(), ...getGridlinesData()];
}

let showNewtonian = true;

// eslint-disable-next-line no-unused-vars
function toggleNewtonian() {
	showNewtonian = !showNewtonian;

	const durationMS = 100;
	const opacity = showNewtonian ? 1 : 0;

	graphObjs.features
		.filter(d => d.galilean)
		.each(function () {
			d3.select(this).transition().duration(durationMS).style("opacity", opacity);
		});

	d3.select(galileanDescription)
		.transition()
		.duration(durationMS)
		.style("opacity", opacity);
	galileanButton.textContent = `${
		showNewtonian ? "Hide" : "Show"
	} Galilean Prediction`;
}

// eslint-disable-next-line no-unused-vars
function _updateSpeedHelper(speedStr, { fromUserInput = true, obj, baseObject } = {}) {
	try {
		if (!fromUserInput) {
			OBJECTS[obj].speedSlider.value = speedStr;
		}

		const origSpeed = OBJECTS[obj].speed;

		const speed = _getSpeedHelper(speedStr, { obj });
		OBJECTS[obj].speed = speed;
		OBJECTS[obj].textSpan.textContent = speed.toFixed(3);

		const rocketSpeed = getRocketSpeed();
		const projectileSpeed = getProjectileSpeed();

		const relSpeed = Math.min(
			getRelativisticProjectileSpeed({
				rocketFracOfC: rocketSpeed,
				projectileFracOfCRelativeToRocket: projectileSpeed,
			}),
			0.999,
		);
		groundFrameProjectileSpeedTextSpan.textContent = relSpeed.toFixed(3);

		const galileanSpeed = rocketSpeed + projectileSpeed;
		galileanSpeedPredictionTextSpan.textContent = galileanSpeed.toFixed(3);

		const duration = fromUserInput ? Math.abs(origSpeed - speed) * 1000 * 0.2 : 0;
		const transition = d3.transition().duration(duration);
		graphObjs.features
			.data(() => getGraphData({ baseObject }))
			.each(function (datum) {
				return applyDatum.call(this, datum, { transition });
			});
	} catch (e) {
		console.log(speedStr);
		throw e;
	}
}
