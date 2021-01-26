/* global applyGraphicalObjs Complex katex */

const WIDTH = 750;
const HEIGHT = 350;

const X_MIN = -6;
const X_0 = 0;
const X_MAX = -X_MIN;

const ABOVE_BELOW_X_AXIS_RATIO = 3;

const Y_MIN = -0.5;
const Y_0 = 0;
const Y_MAX = ABOVE_BELOW_X_AXIS_RATIO * -Y_MIN;

const PHASE_MIN = -3 * Math.PI;
const PHASE_MAX = ABOVE_BELOW_X_AXIS_RATIO * -PHASE_MIN;

const plots = d3.selectAll(".plot").attr("width", WIDTH).attr("height", HEIGHT);
const plotX = d3.select("#plot-x-space").datum({ space: "x" });
const plotP = d3.select("#plot-p-space").datum({ space: "p" });

plots
	.append("g")
	.classed("plot-key", true)
	.selectAll()
	.data([
		{ color: "#f3c002", text: "Magnitude" },
		{ color: "#5df", text: "Phase" },
	])
	.join("g")
	.attr("transform", (_, i) => `translate(30,  ${20 + 30 * i})`)
	.each(function (d) {
		const row = d3.select(this);
		row.append("rect")
			.attr("x", 0)
			.attr("y", 5)
			.attr("width", 25)
			.attr("height", 6)
			.attr("fill", d.color);
		row.append("text")
			.classed("key-text", true)
			.attr("x", 35)
			.attr("y", 0)
			.text(d.text);
	});

function configureSlider(sliderId, attribute, type) {
	let min, max, value;
	if (type === "mean") {
		min = -3;
		max = 3;
		value = 0;
	} else if (type === "width") {
		min = 0.5;
		max = 2;
		value = 1;
	} else {
		throw new Error(`Invalid type ${type}`);
	}

	const slider = document.getElementById(sliderId);
	slider.min = min;
	slider.max = max;
	slider.step = 0.01;
	slider.value = value;

	d3.select(slider).on("input", function () {
		// eslint-disable-next-line no-use-before-define
		update({ [attribute]: +this.value });
	});

	return slider;
}

const sliderXMean = configureSlider("slider-x-mean", "xSpaceMean", "mean");
const sliderXWidth = configureSlider("slider-x-width", "xSpaceWidth", "width");
const sliderPMean = configureSlider("slider-p-mean", "pSpaceMean", "mean");
const sliderPWidth = configureSlider("slider-p-width", "pSpaceWidth", "width");

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScaleMagnitude = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);
const yScalePhase = d3.scaleLinear([PHASE_MIN, PHASE_MAX], [HEIGHT, 0]);

plots
	.selectAll()
	.data(d =>
		d.space === "x"
			? [
					{ x: xScale(X_MAX) - 50, y: yScaleMagnitude(Y_0), math: "x" },
					// {
					// 	x: xScale(X_0) + 5,
					// 	y: yScaleMagnitude(Y_MAX) + 15,
					// 	math: "\\psi(x)",
					// },
			  ]
			: [
					{ x: xScale(X_MAX) - 50, y: yScaleMagnitude(Y_0) + 3, math: "p" },
					// {
					// 	x: xScale(X_0) + 5,
					// 	y: yScaleMagnitude(Y_MAX) + 15,
					// 	math: "(\\mathcal F\\psi)(k)",
					// },
			  ],
	)
	.join("foreignObject")
	.attr("x", d => d.x)
	.attr("y", d => d.y)
	.attr("width", 100)
	.attr("height", 50)
	.html(d => `<span>\\(${d.math}\\)</span>`);

const curveGenerator = d3
	.line()
	.curve(d3.curveCatmullRom)
	.x(p => p[0])
	.y(p => p[1]);

function getData(mu, sigma, phase) {
	const sqrtSigma = sigma ** 0.5;
	const fourthRootPi = Math.PI ** 0.25;
	function gaussian(x) {
		return Complex.fromPolar(
			(1 / (sqrtSigma * fourthRootPi)) * Math.exp(-0.5 * ((x - mu) / sigma) ** 2),
			(x - mu) * phase,
		);
	}

	function fourieredGaussian(w) {
		return Complex.fromPolar(
			(sqrtSigma / fourthRootPi) * Math.exp(-0.5 * ((w - phase) * sigma) ** 2),
			-w * mu,
		);
	}

	const nPoints = 200;

	const axesData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: yScaleMagnitude(Y_0),
				y2: yScaleMagnitude(Y_0),
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xScale(X_0),
				x2: xScale(X_0),
				y1: yScaleMagnitude(Y_MIN),
				y2: yScaleMagnitude(Y_MAX),
			},
		},
	];

	const dx = 1 / (nPoints - 1);

	const points = [];

	for (let i = 0; i < nPoints; ++i) {
		const x = X_MIN + (X_MAX - X_MIN) * i * dx;

		const original = gaussian(x);
		const fouriered = fourieredGaussian(x);
		points.push({
			x,
			original_magnitude: original.magnitude,
			original_phase: original.phase,
			fouriered_magnitude: fouriered.magnitude,
			fouriered_phase: fouriered.phase,
		});
	}

	const curveDatas = {};

	for (const key of Object.keys(points[0])) {
		if (key === "x") {
			continue;
		}

		// curve is either "original" or "fouriered"
		// attribute is either "magnitude" or "phase"
		const [curve, attribute] = key.split("_");
		const yScale = attribute === "magnitude" ? yScaleMagnitude : yScalePhase;

		const xy = points.map(point => [xScale(point.x), yScale(point[key])]);

		curveDatas[key] = [
			{
				shape: "path",
				class: `curve curve-background ${curve} ${attribute}`,
				attrs: {
					d: curveGenerator(xy),
				},
			},
			{
				shape: "path",
				class: `curve curve-foreground ${curve} ${attribute}`,
				attrs: {
					d: curveGenerator(xy),
				},
			},
		];
	}

	return { axesData, curveDatas };
}

const textSpans = {
	positionWidth: document.getElementById("text-position-width"),
	positionMean: document.getElementById("text-position-mean"),
	momentumWidth: document.getElementById("text-momentum-width"),
	momentumMean: document.getElementById("text-momentum-mean"),
};

const floatFormatter = x => d3.format(".1f")(x).replace("−", "-");

function updateText({ xSpaceMean, xSpaceWidth, pSpaceMean, pSpaceWidth } = {}) {
	if (typeof katex === "undefined") {
		return;
	}

	if (xSpaceMean !== undefined) {
		katex.render(`\\sigma=${floatFormatter(xSpaceMean)}`, textSpans.positionMean);
	}
	if (xSpaceWidth !== undefined) {
		katex.render(`\\mu=${floatFormatter(xSpaceWidth)}`, textSpans.positionWidth);
	}
	if (pSpaceMean !== undefined) {
		katex.render(`\\theta=${floatFormatter(pSpaceMean)}`, textSpans.momentumMean);
	}
	if (pSpaceWidth !== undefined) {
		katex.render(
			`\\sigma^{-1}=${floatFormatter(pSpaceWidth)}`,
			textSpans.momentumWidth,
		);
	}
}

function update({ xSpaceMean, xSpaceWidth, pSpaceMean, pSpaceWidth, initial } = {}) {
	initial = initial ?? false;

	if (xSpaceWidth !== undefined) {
		pSpaceWidth = 1 / xSpaceWidth;
	} else if (pSpaceWidth !== undefined) {
		xSpaceWidth = 1 / pSpaceWidth;
	}

	const textUpdates = {};
	if (xSpaceMean === undefined) {
		xSpaceMean = +sliderXMean.value;
		if (initial) {
			textUpdates.xSpaceMean = xSpaceMean;
		}
	} else {
		sliderXMean.value = xSpaceMean;
		textUpdates.xSpaceMean = xSpaceMean;
	}

	if (xSpaceWidth === undefined) {
		xSpaceWidth = +sliderXWidth.value;
		if (initial) {
			textUpdates.xSpaceWidth = xSpaceWidth;
		}
	} else {
		sliderXWidth.value = xSpaceWidth;
		textUpdates.xSpaceWidth = xSpaceWidth;
	}

	if (pSpaceMean === undefined) {
		pSpaceMean = +sliderPMean.value;
		if (initial) {
			textUpdates.pSpaceMean = pSpaceMean;
		}
	} else {
		sliderPMean.value = pSpaceMean;
		textUpdates.pSpaceMean = pSpaceMean;
	}

	if (pSpaceWidth === undefined) {
		pSpaceWidth = +sliderPWidth.value;
		if (initial) {
			textUpdates.pSpaceWidth = pSpaceWidth;
		}
	} else {
		sliderPWidth.value = pSpaceWidth;
		textUpdates.pSpaceWidth = pSpaceWidth;
	}

	updateText(textUpdates);

	const mu = xSpaceMean;
	const sigma = xSpaceWidth;
	const phase = pSpaceMean;

	const { axesData, curveDatas } = getData(mu, sigma, phase);

	applyGraphicalObjs(plots, axesData, { selector: ".axis" });

	applyGraphicalObjs(plotX, curveDatas.original_phase, {
		selector: ".curve.original.phase",
	});
	applyGraphicalObjs(plotX, curveDatas.original_magnitude, {
		selector: ".curve.original.magnitude",
	});

	applyGraphicalObjs(plotP, curveDatas.fouriered_phase, {
		selector: ".curve.fouriered.phase",
	});
	applyGraphicalObjs(plotP, curveDatas.fouriered_magnitude, {
		selector: ".curve.fouriered.magnitude",
	});
}

update();
