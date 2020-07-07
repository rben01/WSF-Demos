/* globals applyDatum C groupBy applyGraphicalObjs lorentzFactor STANDARD_COLORS */

"use strict";

const CANVAS_WIDTH = 550;
const CANVAS_HEIGHT = 500;
const AXIS_MARGINS = { top: 0.13, bottom: 0.08, left: 0.13, right: 0.17 };
const AX_BOUNDS = {
	xMin: CANVAS_WIDTH * AXIS_MARGINS.left,
	xMax: CANVAS_WIDTH * (1 - AXIS_MARGINS.right),
	yMin: CANVAS_HEIGHT * (1 - AXIS_MARGINS.bottom),
	yMax: CANVAS_HEIGHT * AXIS_MARGINS.top,
};
const galileanFgColor = "#bbb";

const svg = d3
	.select("#viz")
	.attr("width", CANVAS_WIDTH)
	.attr("height", CANVAS_HEIGHT)
	.attr("background-color", "black");

function getRelativisticKineticEnergy(fracOfC, mass) {
	const gamma = lorentzFactor({ fracOfC });
	return (mass * (C / 1e8) * (C / 1e8) * (gamma - 1)) / 10;
}

function getNewtonianKineticEnergy(fracOfC, mass) {
	return (0.5 * mass * fracOfC * fracOfC * (C / 1e8) * (C / 1e8)) / 10;
}

const sliders = {
	v: document.getElementById("input-v"),
	m: document.getElementById("input-m"),
};

const xScale = d3
	.scaleLinear()
	.domain([-0.03, 1])
	.range([AX_BOUNDS.xMin, AX_BOUNDS.xMax]);

const yScale = d3
	.scaleLinear()
	.domain([-0.15, +getRelativisticKineticEnergy(+sliders.v.max, +sliders.m.max)])
	.range([AX_BOUNDS.yMin, AX_BOUNDS.yMax]);

const defs = svg.append("defs");
defs.append("clipPath")
	.attr("id", "graph-clip")
	.append("rect")
	.attr("x", xScale(0))
	.attr("y", yScale.range()[1])
	.attr("width", Math.abs(xScale.range()[1] - xScale.range()[0]))
	.attr("height", Math.abs(yScale.range()[1] - yScale.range()[0]));

// eslint-disable-next-line no-unused-vars
function drawGraph() {
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

	svg.selectAll().data(axesAttrs).enter().append("svg:line").each(applyDatum);

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

	svg.selectAll()
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

	const yTickTextData = yScale.ticks(7).map(y => {
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

	svg.selectAll()
		.data([...xTickTextData, ...yTickTextData])
		.enter()
		.append("svg:text")
		.each(applyDatum)
		.text(d => d.text);

	// Add v/c label to x and y axes
	// const apostropheWidth = 3;
	// const subscriptXOffset = 4;
	// const subscriptYOffset = 2;
	const fracBarYOffset = 7;
	const fracBarWidth = 19;
	const denominatorYOffset = 20;

	// x axis
	const xLabelX = xScale.range()[1] + 30;
	const xLabelY = AX_BOUNDS.yMin;
	// https://stackoverflow.com/a/22085843
	const xAxisText = svg
		.append("text")
		.attr("x", xLabelX)
		.attr("y", xLabelY)
		.attr("font-size", 21)
		.attr("stroke", "white")
		.attr("fill", "white")
		.attr("text-anchor", "middle");
	// .attr("text-rendering", "geometricPrecision");
	xAxisText.append("tspan").attr("x", xLabelX).text(`𝑣`);
	xAxisText
		.append("svg:tspan")
		.text("𝑐")
		.attr("x", xLabelX)
		.attr("dy", denominatorYOffset);
	svg.append("line")
		.attr("x1", xLabelX - fracBarWidth / 2)
		.attr("x2", xLabelX + fracBarWidth / 2)
		.attr("y1", xLabelY + fracBarYOffset)
		.attr("y2", xLabelY + fracBarYOffset)
		.attr("stroke", "white")
		.attr("stroke-width", 2);

	// Add distance label to y axis
	const yLabelX = AX_BOUNDS.xMin - 5;
	const yLabelY = AX_BOUNDS.yMax - 55;
	const yAxisText = svg
		.append("text")
		.attr("x", yLabelX)
		.attr("y", yLabelY)
		.attr("font-size", 18)
		.attr("fill", "white")
		.attr("text-anchor", "middle");
	yAxisText
		.append("tspan")
		.text("KE")
		.attr("x", yLabelX + 12);
	yAxisText.append("svg:tspan").text("10").attr("x", yLabelX).attr("dy", 28);
	yAxisText
		.append("svg:tspan")
		.text("17")
		.attr("x", yLabelX + 17)
		.attr("dy", -8)
		.attr("font-size", "small");
	yAxisText
		.append("svg:tspan")
		.text("J")
		.attr("x", yLabelX + 30)
		.attr("dy", 7.5);
	svg.append("line")
		.attr("x1", yLabelX - fracBarWidth / 2)
		.attr("x2", yLabelX + 34)
		.attr("y1", yLabelY + fracBarYOffset)
		.attr("y2", yLabelY + fracBarYOffset)
		.attr("stroke", "white")
		.attr("stroke-width", 2);
}

const graphAttrs = {
	common: { stroke: STANDARD_COLORS.highlighted, "stroke-width": 4, fill: "#0000" },
};
function getGraphData(speed, mass) {
	const xBounds = {
		min: 0,
		max: Math.max(...xScale.domain()),
	};
	const yBounds = {
		min: 0,
		max: Math.max(...yScale.domain()),
	};

	function getCurveData() {
		const relativisticData = [[0, getRelativisticKineticEnergy(0, mass)]];
		const newtonianData = [[0, getNewtonianKineticEnergy(0, mass)]];

		const base = 10;
		const startPrecision = 2;

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
				const yRelativistic = getRelativisticKineticEnergy(x, mass);
				const yNewtonian = getNewtonianKineticEnergy(x, mass);

				relativisticData.push([
					x,
					yRelativistic,
					xScale(x),
					yScale(yRelativistic),
				]);

				newtonianData.push([x, yNewtonian]);
			}
		}

		const curve = d3
			.line()
			.x(xy => xScale(xy[0]))
			.y(xy => yScale(xy[1]));
		// .curve(d3.curveCardinal);

		return [
			{
				shape: "path",
				class: "curve",
				attrs: {
					d: curve(newtonianData),
					...graphAttrs,
					...graphAttrs.common,
					stroke: galileanFgColor,
					"clip-path": "url(#graph-clip)",
					// "stroke-dasharray": baseObject === ROCKET ? null : "3 1",
				},
			},
			{
				shape: "path",
				class: "curve",
				attrs: {
					d: curve(relativisticData),
					...graphAttrs,
					...graphAttrs.common,
					stroke: STANDARD_COLORS.highlighted,
					"clip-path": "url(#graph-clip)",
					// "stroke-dasharray": baseObject === ROCKET ? null : "3 1",
				},
			},
		];
	}

	function getGridlinesData() {
		const x = xScale(speed);
		const y = yScale(getRelativisticKineticEnergy(speed, mass));

		const commonLineAttrs = {
			"stroke-width": 2,
			"stroke-dasharray": "1.5 1.5",
		};

		const galileanY = yScale(getNewtonianKineticEnergy(speed, mass));

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
				shape: "circle",
				galilean: true,
				class: "galilean galilean-gridline-dot",
				attrs: {
					cx: x,
					cy: galileanY,
					r: 4,
					fill: galileanFgColor,
					stroke: "#bbb",
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
					stroke: STANDARD_COLORS.secondary,
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
					stroke: STANDARD_COLORS.highlighted,
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
					fill: STANDARD_COLORS.secondary,
					stroke: "#ddd",
				},
			},
		];
	}

	return [...getCurveData(), ...getGridlinesData()].map(o => {
		const classes = [...o.class.split(/ +/g), "c"];
		delete o.class;
		o.classes = classes;
		return o;
	});
}

drawGraph();

const textSpans = {
	v: document.getElementById("text-v"),
	m: document.getElementById("text-m"),
	keRltv: document.getElementById("text-ke-sr"),
	keNtwn: document.getElementById("text-ke-newton"),
};

function fmtFloat(x, precision) {
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

function fmtPow10(x, precision, defaultPower) {
	if (x === 0) {
		return `<span class="sci-num">${fmtFloat(x, precision)}</span>`;
	}
	let power = defaultPower;
	while (x < 1) {
		x *= 10;
		power -= 1;
	}
	return `<span class="sci-num">${fmtFloat(
		x,
		precision,
	)}<span class="operator">·</span>10<span class="superscript">${power}</span></span>`;
}

function update({ v, m }) {
	if (v === undefined) {
		v = sliders.v.value;
	} else {
		sliders.v.value = v;
	}
	v = +v;

	if (m === undefined) {
		m = sliders.m.value;
	} else {
		sliders.m.value = m;
	}
	m = +m;

	textSpans.v.innerHTML = fmtFloat(v, 2);
	textSpans.m.innerHTML = fmtFloat(m, 2);

	const keRltv = getRelativisticKineticEnergy(v, m);
	const keNtwn = getNewtonianKineticEnergy(v, m);

	textSpans.keRltv.innerHTML = fmtPow10(keRltv, 2, 17);
	textSpans.keNtwn.innerHTML = fmtPow10(keNtwn, 2, 17);

	const allData = getGraphData(v, m);
	const shapes = groupBy(
		allData,
		d => `${d.shape}.c`,
		["line", "circle", "path"].map(shape => `${shape}.c`),
	);

	for (const [selector, data] of shapes) {
		applyGraphicalObjs(svg, data, { selector });
	}
}

update({ v: 0, m: 1 });
