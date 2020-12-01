/* global applyGraphicalObjs katex STANDARD_COLORS */

const WIDTH = 1000;
const HEIGHT = 600;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);
const equationDiv = document.getElementById("eqn-container");

const X_MIN = -0.1;
const X_0 = 0;
const X_MAX = 1.07;

// y min and max of the full plotting area; the sine functions use a smaller amplitude
const Y_MAX = 2.3;
const Y_MIN = -Y_MAX;

const X_MARGIN = 5;
const Y_MARGIN = 30;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [X_MARGIN, WIDTH - X_MARGIN]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - Y_MARGIN, Y_MARGIN]);

const HATCH_ROTATION_DEG = 30;
const COS_HATCH_ROTATION = Math.cos((Math.PI / 180) * HATCH_ROTATION_DEG);

const equationOpacityScale = d3.scaleLinear([0.2, 0.95], [0, 1]).clamp(true);
const waveStrokeScale = d3.interpolateRgb("#2225", "#ffff");

const sliders = {
	width: document.getElementById("slider-width"),
	wavenumber: document.getElementById("slider-wavenumber"),
};
(() => {
	const slider = sliders.width;
	slider.min = 0.5;
	slider.max = 1;
	slider.step = 0.002;
	slider.value = 0.75;
})();
(() => {
	const slider = sliders.wavenumber;
	slider.min = 0;
	slider.max = 6;
	slider.step = 0.002;
	slider.value = 1;
})();

const latexSpans = {
	width: document.getElementById("latex-width"),
	wavenumber: document.getElementById("latex-wavenumber"),
};

function updateLatex({ width, wavenumber }) {
	if (width !== undefined) {
		const widthStr = width.toFixed(2);
		latexSpans.width.innerHTML = katex.renderToString(`L=${widthStr} `);
	}
	if (wavenumber !== undefined) {
		const wavenumberStr = wavenumber.toFixed(2);
		latexSpans.wavenumber.innerHTML = katex.renderToString(
			`\\displaystyle k=\\frac{2\\pi}{\\lambda}=${wavenumberStr}`,
		);
	}
}

function getAmplitude(width) {
	return (2 / width) ** 0.5;
}

function getAxesData(width) {
	const x0_Scaled = xScale(X_0);
	const y0_scaled = yScale(0);
	const barrierXScaled = xScale(X_0 + width);
	const yTickLoc = getAmplitude(width);

	const yAxisLabelHeight = 40;
	const yAxisBaseDx = -50;

	return [
		{
			shape: "rect",
			classes: ["axis", "empty-space"],
			attrs: {
				x: barrierXScaled,
				y: yScale(Y_MAX),
				width: xScale(X_MAX) - barrierXScaled,
				height: yScale(Y_MIN) - yScale(Y_MAX),
				fill: "url(#diagonalHatch)",
			},
		},
		{
			shape: "line",
			classes: ["axis", "axis-axis", "x-axis"],
			attrs: {
				x1: xScale(X_MIN),
				x2: barrierXScaled,
				y1: y0_scaled,
				y2: y0_scaled,
			},
		},
		{
			shape: "line",
			classes: ["axis", "axis-axis", "y-axis"],
			attrs: {
				x1: x0_Scaled,
				x2: x0_Scaled,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		{
			shape: "line",
			classes: ["axis", "axis-axis", "barrier"],
			attrs: {
				x1: barrierXScaled,
				x2: barrierXScaled,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		...[-yTickLoc, yTickLoc].map(y => {
			const yScaled = yScale(y);
			return {
				shape: "line",
				classes: ["axis", "axis-tick", "y-axis-tick"],
				attrs: {
					x1: x0_Scaled,
					x2: x0_Scaled - 8,
					y1: yScaled,
					y2: yScaled,
				},
			};
		}),
		{
			shape: "text",
			classes: ["axis", "x-axis-label"],
			text: "𝐿",
			attrs: {
				x: barrierXScaled,
				y: y0_scaled,
				dx: 15,
				dy: 10,
				"text-anchor": "middle",
				"dominant-baseline": "hanging",
			},
		},
		{
			shape: "foreignObject",
			sign: -1,
			classes: ["axis", "y-axis-label-fo"],
			attrs: {
				x: x0_Scaled + yAxisBaseDx - 12,
				y: yScale(-yTickLoc) - yAxisLabelHeight / 2,
				width: 1,
				height: 1,
				overflow: "visible",
			},
		},
		{
			shape: "foreignObject",
			sign: 1,
			classes: ["axis", "y-axis-label-fo"],
			attrs: {
				x: x0_Scaled + yAxisBaseDx,
				y: yScale(yTickLoc) - yAxisLabelHeight / 2,
				width: 1,
				height: 1,
				overflow: "visible",
			},
		},
	];
}

function getWavesData({ width, wavenumber }) {
	updateLatex({ width, wavenumber });

	const line = d3.line().curve(d3.curveNatural);

	const amplitude = getAmplitude(width);
	function wavenumberToPath(wavenumber, xArray) {
		function f(x) {
			return amplitude * Math.sin((Math.PI * wavenumber * x) / width);
		}
		return line(xArray.map(x => [xScale(x), yScale(f(x))]));
	}
	const nPointsPerMaxWidth = 199;

	function getXArray(maxX) {
		const nPoints = Math.floor(nPointsPerMaxWidth * (maxX - X_0));
		return d3.range(nPoints).map(i => X_0 + ((maxX - X_0) * i) / (nPoints - 1));
	}

	const staticWaveXFracArray = getXArray(width);
	const dynamicWaveXFracArray = getXArray(X_MAX);

	const wavenumbers = [...d3.range(1, 7), wavenumber];
	let maxWaveHighlightAmount = -Infinity;
	let maxWaveHighlightWavenumber = null;
	const waveData = wavenumbers.map((k, i) => {
		const isDynamicWave = i === wavenumbers.length - 1;
		let xArray,
			waveType,
			waveHighlightAmount,
			strokeVisibility,
			strokeWidth,
			stroke;
		if (isDynamicWave) {
			xArray = dynamicWaveXFracArray;
			waveHighlightAmount = 1;
			waveType = "dynamic";
			strokeVisibility = 1;
			strokeWidth = "4px";
			stroke = STANDARD_COLORS.highlighted;
		} else {
			xArray = staticWaveXFracArray;
			waveType = "static";
			const wavenumberDiff = Math.abs(k - wavenumber);
			waveHighlightAmount = 1 - 1.2 * wavenumberDiff;

			if (waveHighlightAmount > maxWaveHighlightAmount) {
				maxWaveHighlightAmount = waveHighlightAmount;
				maxWaveHighlightWavenumber = k;
			}

			strokeVisibility = Math.max(0.3, waveHighlightAmount);
			strokeWidth = `${Math.max(5, 8 * waveHighlightAmount)}px`;
			stroke = waveStrokeScale(strokeVisibility);
		}
		return {
			shape: "path",
			classes: ["wave", waveType],
			attrs: {
				id: `wave-wavenumber-${k}`,
				d: wavenumberToPath(k, xArray),
				stroke,
				"stroke-width": strokeWidth,
			},
			waveType,
			wavenumber: k,
			fore: false,
		};
	});

	for (const datum of waveData) {
		if (
			datum.waveType === "dynamic" ||
			(datum.waveType === "static" &&
				datum.wavenumber === maxWaveHighlightWavenumber)
		) {
			datum.fore = true;
		}
	}

	const wavenumberData = {
		wavenumber: maxWaveHighlightWavenumber,
		amount: maxWaveHighlightAmount,
	};

	return { waveData, wavenumberData };
}

function update() {
	const width = +sliders.width.value;
	const wavenumber = +sliders.wavenumber.value;

	applyGraphicalObjs(plot, getAxesData(width), { selector: ".axis" });
	plot.selectAll(".y-axis-label-fo").each(function (d) {
		const baseLatex = "\\sqrt{\\frac{2}{L}}";
		const fullLatex = `${d.sign < 0 ? "-" : ""}${baseLatex}`;
		this.innerHTML = `<div xmlns="http://www.w3.org/1999/xhtml" style="font-size:20px;"></div>`;
		this.querySelector("div").innerHTML = katex.renderToString(fullLatex);
	});

	const barrierXScaled = xScale(X_0 + width);
	const barrierTranslateX = barrierXScaled * COS_HATCH_ROTATION;

	document
		.getElementById("diagonalHatch")
		.setAttribute(
			"patternTransform",
			`rotate(${HATCH_ROTATION_DEG},0,0) translate(${barrierTranslateX}, 0)`,
		);

	const { waveData, wavenumberData } = getWavesData({ width, wavenumber });

	applyGraphicalObjs(plot, waveData, { selector: ".wave" });
	plot.selectAll(".wave").each(function (d) {
		if (d.fore) {
			plot.node().append(this);
		}
	});

	const opacity = equationOpacityScale(wavenumberData.amount);
	const highlightedWavenumber = wavenumberData.wavenumber;
	equationDiv.innerHTML = katex.renderToString(
		`\\textrm{Energy} = E_{${highlightedWavenumber}} = \\frac{\\hbar^2\\pi^2}{2mL^2}`,
	);
	equationDiv.style.opacity = opacity;
}

update();
for (const slider of Object.values(sliders)) {
	d3.select(slider).on("input", function () {
		update();
	});
}
