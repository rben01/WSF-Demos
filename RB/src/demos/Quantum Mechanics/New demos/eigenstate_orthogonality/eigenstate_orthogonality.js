/* global applyGraphicalObjs katex */

const WIDTH = 650;
const HEIGHT = 300;

d3.selectAll(".plot").attr("width", WIDTH).attr("height", HEIGHT);

const SINGLE = "single";
const PRODUCT = "product";

const GRAPH_TYPES = [SINGLE, PRODUCT];

const plots = {
	[SINGLE]: d3.select("#plot-single"),
	[PRODUCT]: d3.select("#plot-product"),
};

const textSpans = {
	labelN1: document.getElementById("text-n-1"),
	labelN2: document.getElementById("text-n-2"),
	graphKeyN1: document.getElementById("text-eqn-n1"),
	graphKeyN2: document.getElementById("text-eqn-n2"),
	productIntegral: document.getElementById("text-product"),
};

// x's have units of pi
const X_MIN = -0.2;
const X_0 = 0;
const X_1 = 1;
const X_MAX = 1.2;

const Y_MIN = -1.1;
const Y_0 = 0;
const Y_MAX = -Y_MIN;

const _xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const _yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

const xScales = {
	[SINGLE]: _xScale,
	[PRODUCT]: _xScale,
};

const yScales = {
	[SINGLE]: _yScale,
	[PRODUCT]: _yScale,
};

const N_MIN = 1;
const N_MAX = 9;

d3.selectAll(".n-slider").each(function () {
	this.min = N_MIN;
	this.max = N_MAX;
	this.step = 1;
	this.value = 1;
	// eslint-disable-next-line no-use-before-define
	d3.select(this).on("input", update);
});

const sliderN1 = document.getElementById("slider-n-1");
const sliderN2 = document.getElementById("slider-n-2");

function getAxesData(whichGraph) {
	const xScale = xScales[whichGraph];
	const yScale = yScales[whichGraph];

	const xs0 = xScale(X_0);
	const ys0 = yScale(Y_0);

	const axes = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xScale(X_0),
				x2: xScale(X_1),
				y1: ys0,
				y2: ys0,
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
	];

	const tickLength = 9;

	const xAxisTickLocs = [
		[0.25, "0.25"],
		[0.5, "0.5"],
		[0.75, "0.75"],
		[1, "1.0"],
	];
	const xAxisLabels = xAxisTickLocs.flatMap(([x, scalar]) => {
		// const prefix = scalar === null ? "" : `${scalar}`;
		const text = `${scalar}`;
		return ["axis-label-bg", "axis-label-fg"].map(labelClass => ({
			shape: "text",
			text,
			class: `axis axis-obj x-axis axis-label x-axis-label ${labelClass}`,
			attrs: {
				x: xScale(x),
				y: ys0 + tickLength + 5,
			},
		}));
	});
	const xAxisTicks = xAxisTickLocs.map(([x]) => {
		const xs = xScale(x);
		return {
			shape: "line",
			class: "axis axis-obj x-axis axis-tick x-axis-tick",
			attrs: {
				x1: xs,
				x2: xs,
				y1: ys0,
				y2: ys0 + tickLength,
			},
		};
	});

	const yAxisTickLocs = [
		[-1, "-1.0"],
		[-0.5, "-0.5"],
		[0.5, "0.5"],
		[1, "1.0"],
	];
	const yAxisLabels = yAxisTickLocs.map(([y, label]) => {
		return {
			shape: "text",
			text: label,
			class: "axis axis-obj axis-label y-axis-label",
			attrs: {
				x: xs0 - tickLength - 6,
				y: yScale(y),
			},
		};
	});
	const yAxisTicks = yAxisTickLocs.map(([y]) => {
		const ys = yScale(y);
		return {
			shape: "line",
			class: "axis axis-obj axis-tick y-axis-tick",
			attrs: {
				x1: xs0,
				x2: xs0 - tickLength,
				y1: ys,
				y2: ys,
			},
		};
	});

	return [...axes, ...xAxisLabels, ...xAxisTicks, ...yAxisLabels, ...yAxisTicks];
}

for (const graphType of GRAPH_TYPES) {
	applyGraphicalObjs(plots[graphType], getAxesData(graphType), { selector: ".axis" });
}

function sinePoints(n) {
	const nPoints = 300;
	const xMin = X_0;
	const xMax = X_1;
	const dx = (xMax - xMin) / (nPoints - 1);
	const points = [];
	for (let i = 0; i < nPoints; ++i) {
		const x = xMin + i * dx;
		const y = Math.sin(Math.PI * n * x);
		points.push([x, y]);
	}
	return points;
}

const line = d3.line().curve(d3.curveCatmullRom);
const straightLine = d3.line().curve(d3.curveLinear);
function update() {
	const n1 = +sliderN1.value;
	const n2 = +sliderN2.value;

	if (typeof katex !== "undefined") {
		katex.render(`n_1=${n1}`, textSpans.labelN1);
		katex.render(`n_2=${n2}`, textSpans.labelN2);
		const n1Str = n1 === 1 ? "" : n1;
		const n2Str = n2 === 1 ? "" : n2;
		katex.render(`\\psi_1(x)=\\sin(${n1Str}\\pi x)`, textSpans.graphKeyN1);
		katex.render(`\\psi_2(x)=\\sin(${n2Str}\\pi x)`, textSpans.graphKeyN2);

		const integralValue = n1 === n2 ? 1 : 0;
		katex.render(
			`\\langle\\psi_1,\\psi_2\\rangle=\\textrm{Integral}=${integralValue}`,
			textSpans.productIntegral,
		);
	}

	let strokeDasharray = null;
	const dashLength = 8;
	if (n1 === n2) {
		strokeDasharray = `${dashLength} ${2 * dashLength}`;
	}

	const curve1Points = sinePoints(n1);
	const curve2Points = sinePoints(n2);

	const singleCurveData = [
		{
			curvePoints: curve1Points,
			curveClass: "curve-n1",
			strokeDashoffset: 0,
		},
		{
			curvePoints: curve2Points,
			curveClass: "curve-n2",
			strokeDashoffset: 1.5 * dashLength,
		},
	].flatMap(({ curvePoints, curveClass, strokeDashoffset }) => {
		const points = curvePoints.map(([x, y]) => [
			xScales[SINGLE](x),
			yScales[SINGLE](y),
		]);
		const d = line(points);
		return ["curve-background", "curve-foreground"].map(fgbgClass => ({
			shape: "path",
			class: `curve ${fgbgClass} ${curveClass}`,
			attrs: {
				d,
				"stroke-dasharray": strokeDasharray,
				"stroke-dashoffset": strokeDashoffset,
			},
		}));
	});

	const barriers = Object.fromEntries(
		[SINGLE, PRODUCT].map(type => {
			const xScale = xScales[type];
			const pathDy = 1;
			const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - pathDy, pathDy]);
			const barriers = [
				{
					shape: "rect",
					class: "barrier solid",
					attrs: {
						x: xScale(X_MIN),
						y: yScale(Y_MAX),
						width: xScale(X_0) - xScale(X_MIN),
						height: HEIGHT,
					},
				},
				{
					shape: "rect",
					class: "barrier solid",
					attrs: {
						x: xScale(1),
						y: yScale(Y_MAX),
						width: xScale(X_MAX) - xScale(0),
						height: HEIGHT,
					},
				},
				{
					shape: "path",
					class: "barrier edge",
					attrs: {
						d: straightLine(
							[
								[X_MIN, Y_MAX],
								[X_0, Y_MAX],
								[X_0, Y_MIN],
								[X_MIN, Y_MIN],
							].map(([x, y]) => [xScale(x), yScale(y)]),
						),
					},
				},
				{
					shape: "path",
					class: "barrier edge",
					attrs: {
						d: straightLine(
							[
								[X_MAX, Y_MAX],
								[X_1, Y_MAX],
								[X_1, Y_MIN],
								[X_MAX, Y_MIN],
							].map(([x, y]) => [xScale(x), yScale(y)]),
						),
					},
				},
			];
			return [type, barriers];
		}),
	);

	const productPointsScaled = curve1Points.map((p1, i) => {
		const p2 = curve2Points[i];
		const x = p1[0];
		const y = p1[1] * p2[1];
		return [xScales[PRODUCT](x), yScales[PRODUCT](y)];
	});
	const productD = line(productPointsScaled);
	const productCurveData = ["curve-background", "curve-foreground"].map(
		fgbgClass => ({
			shape: "path",
			class: `curve ${fgbgClass} curve-product`,
			attrs: {
				id: `curve-product-${fgbgClass}`,
				d: productD,
			},
		}),
	);

	const productZeros = [
		...new Set([n1, n2].flatMap(n => d3.range(n + 1).map(i => i / n))),
	].sort();
	const nZeros = productZeros.length;
	const nPointsPerUnit = 300;
	const filledRegionsData = [];
	for (let i = 0; i < nZeros - 1; ++i) {
		const thisZero = productZeros[i];
		const nextZero = productZeros[i + 1];
		const nPoints = Math.ceil((nextZero - thisZero) * nPointsPerUnit);
		const dx = (nextZero - thisZero) / (nPoints - 1);
		const thisRegionPoints = [];
		for (let j = 0; j < nPoints; ++j) {
			const x = thisZero + j * dx;
			const y = Math.sin(Math.PI * n1 * x) * Math.sin(Math.PI * n2 * x);
			thisRegionPoints.push([xScales[PRODUCT](x), yScales[PRODUCT](y)]);
		}
		const midX = (thisZero + nextZero) / 2;
		const valueAtMidpoint =
			Math.sin(Math.PI * n1 * midX) * Math.sin(Math.PI * n2 * midX);
		const posNegClass = valueAtMidpoint > 0 ? "filled-positive" : "filled-negative";
		const lastRegionClass = i === nZeros - 2 ? "last-region" : "";
		filledRegionsData.push({
			shape: "path",
			class: `curve filled-region ${posNegClass} ${lastRegionClass}`,
			attrs: {
				d: line(thisRegionPoints),
			},
		});
	}

	for (const [type, barrierData] of Object.entries(barriers)) {
		console.log(type);
		applyGraphicalObjs(plots[type], barrierData, { selector: ".barrier" });
	}

	applyGraphicalObjs(plots[SINGLE], singleCurveData, { selector: ".curve" });
	applyGraphicalObjs(plots[PRODUCT], [...filledRegionsData, ...productCurveData], {
		selector: ".curve",
	});

	const lastFilledRegion = plots[PRODUCT].selectAll(".last-region").node();
	const productPlotNode = plots[PRODUCT].node();

	plots[PRODUCT].selectAll(".axis").each(function () {
		productPlotNode.insertBefore(this, lastFilledRegion);
	});

	d3.selectAll(".plot").each(function () {
		const thisPlotNode = this;
		const barriers = d3.select(this).selectAll(".barrier");
		const firstAxisObj = d3.select(this).selectAll(".axis").node();
		console.log(thisPlotNode);
		barriers.each(function () {
			thisPlotNode.insertBefore(this, firstAxisObj);
		});
	});
}

update();
