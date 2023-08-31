/* global applyGraphicalObjs katex */

const WIDTH = 500;
const HEIGHT = 400;
const MARGIN = 13;

const canvas = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

const X_MIN = 0;
const X_MAX = 500;

const Y_MIN = 0;
const Y_MAX = 35000;

const xScale = d3.scaleLinear([X_MIN, X_MAX], [MARGIN + 50, WIDTH - MARGIN]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - MARGIN - 25, MARGIN]);

const SUPERNOVAE = [
	{ name: "1995D", dist: 36.14, speed: 2400, label: { dx: -4, dy: -2 } },
	{ name: "1995E", dist: 55.72, speed: 3600, label: { dx: 24, dy: -20 } },
	{ name: "1996C", dist: 145.88, speed: 8400, label: { dx: 14 } },
	{ name: "1990af", dist: 215.77, speed: 15000 },
	{ name: "1992bs", dist: 335.74, speed: 19200 },
	{ name: "1992aq", dist: 463.45, speed: 30300 },
];

const slopeScale = d3.scalePow([0, 1], [20, 175]).exponent(2);

const slopeSlider = (() => {
	const slider = document.getElementById("input-slope");

	[slider.min, slider.max] = slopeScale.domain();
	slider.step = 0.001;
	slider.value = slider.min;

	return slider;
})();

function getAxisData() {
	const axisBorderVertices = [
		[X_MIN, Y_MIN],
		[X_MIN, Y_MAX],
		[X_MAX, Y_MAX],
		[X_MAX, Y_MIN],
	].map(([x, y]) => [xScale(x), yScale(y)]);

	const axisBorders = axisBorderVertices.map(([x1, y1], i) => {
		const [x2, y2] = axisBorderVertices[(i + 1) % 4];
		const isHorizontal = y1 === y2;
		const isVertical = !isHorizontal;
		const extension = 0.5;
		return {
			shape: "line",
			class: "axis",
			attrs: {
				x1: x1 + Math.sign(x1 - x2) * isHorizontal * extension,
				x2: x2 - Math.sign(x1 - x2) * isHorizontal * extension,
				y1: y1 + Math.sign(y1 - y2) * isVertical * extension,
				y2: y2 - Math.sign(y1 - y2) * isVertical * extension,
			},
		};
	});

	const majorTickLength = 8;
	const minorTickLength = 4;

	// X ticks

	const nXMajorTicks = xScale.ticks(5).length;
	const nXMinorTicks = 4 * (nXMajorTicks - 1) + 1;

	const [xMin, xMax] = xScale.range();
	const [yMin, yMax] = yScale.range();

	const xTickObjs = [
		...d3.range(nXMajorTicks).map(i => [i, nXMajorTicks, true]),
		...d3.range(nXMinorTicks).map(i => [i, nXMinorTicks, false]),
	].flatMap(([i, nTicks, isMajor]) => {
		const x = xMin + (i * (xMax - xMin)) / (nTicks - 1);
		const y1 = yScale(Y_MIN);
		const y2 = yScale(Y_MIN) - (isMajor ? majorTickLength : minorTickLength);
		const tick = {
			shape: "line",
			class: "axis axis-tick x-axis-tick",
			attrs: {
				x1: x,
				x2: x,
				y1,
				y2,
			},
		};

		const data = [tick];

		if (isMajor) {
			const xLabel = d3.interpolate(X_MIN, X_MAX)(i / (nTicks - 1));

			data.push({
				shape: "text",
				class: "axis axis-label x-axis-label",
				text: xLabel,
				attrs: {
					x,
					y: y1 + 16,
					"text-anchor": "middle",
				},
			});
		}

		return data;
	});

	xTickObjs.push({
		shape: "text",
		class: "axis axis-label x-axis-title",
		text: "Distance (Mpc)",
		attrs: {
			x: (xMin + xMax) / 2,
			y: yMin + 35,
			"text-anchor": "middle",
		},
	});

	// Y Ticks

	const nYMajorTicks = yScale.ticks(7).length;
	const nYMinorTicks = 4 * (nYMajorTicks - 1) + 1;

	const yTickObjs = [
		...d3.range(nYMajorTicks).map(i => [i, nYMajorTicks, true]),
		...d3.range(nYMinorTicks).map(i => [i, nYMinorTicks, false]),
	].flatMap(([i, nTicks, isMajor]) => {
		const y = yMin + (i * (yMax - yMin)) / (nTicks - 1);
		const x1 = xScale(X_MIN);
		const x2 = xScale(Y_MIN) + (isMajor ? majorTickLength : minorTickLength);
		const tick = {
			shape: "line",
			class: "axis axis-tick y-axis-tick",
			attrs: {
				x1,
				x2,
				y1: y,
				y2: y,
			},
		};

		const data = [tick];

		if (isMajor) {
			const formatter = d3.format(".3~s");
			const yLabel = formatter(d3.interpolate(Y_MIN, Y_MAX)(i / (nTicks - 1)));

			data.push({
				shape: "text",
				class: "axis axis-label y-axis-label",
				text: yLabel,
				attrs: {
					x: x1 - 6,
					y,
					"text-anchor": "end",
					"dominant-baseline": "middle",
				},
			});
		}

		return data;
	});

	yTickObjs.push({
		shape: "text",
		class: "axis axis-label y-axis-title",
		text: "Receding Speed (km/s)",
		attrs: {
			"text-anchor": "middle",
			transform: `translate(${xMin - 45} ${(yMin + yMax) / 2}) rotate(-90)`,
		},
	});

	const points = SUPERNOVAE.flatMap(({ name, dist, speed, label: labelInfo }) => {
		const x = xScale(dist);
		const y = yScale(speed);
		const dx = (labelInfo ?? {}).dx ?? 0;
		const dy = 18 + ((labelInfo ?? {}).dy ?? 0);

		const point = {
			shape: "circle",
			class: "point",
			attrs: {
				cx: x,
				cy: y,
				r: 4,
			},
		};

		const label = {
			shape: "text",
			class: "point-label",
			text: name,
			attrs: {
				x,
				y: y,
				dx,
				dy,
				"dominant-baseline": "top",
			},
		};

		return [point, label];
	});

	const slopeLine = {
		shape: "line",
		class: "slope-line",
	};

	return [slopeLine, ...axisBorders, ...xTickObjs, ...yTickObjs, ...points];
}

const slopeFormatter = d3.format(".3r");
function update() {
	const slope = slopeScale(+slopeSlider.value);

	const xTop = X_MIN + (Y_MAX - Y_MIN) / slope;
	const yRight = Y_MIN + (X_MAX - X_MIN) * slope;

	let x2, y2;
	if (xTop > X_MAX) {
		// It hits the right edge before the top edge
		x2 = X_MAX;
		y2 = yRight;
	} else {
		// It hits the top edge before the right edge
		x2 = xTop;
		y2 = Y_MAX;
	}

	// console.log(slope, xTop, yRight);

	const line = {
		shape: "line",
		class: "slope-line",
		attrs: {
			x1: xScale(X_MIN),
			x2: xScale(x2),
			y1: yScale(Y_MIN),
			y2: yScale(y2),
		},
	};

	applyGraphicalObjs(canvas, [line], { selector: ".slope-line" });

	if (typeof katex !== "undefined") {
		katex.render(
			`\\displaystyle H_0 = \\frac{v}{d} = ${slopeFormatter(
				slope,
			)}\\frac{\\textrm{km}/\\textrm{s}}{\\textrm{Mpc}}`,
			document.getElementById("eqn-h0"),
			{ displayMode: true },
		);

		const universeAgeSec = 3e19 / slope;
		const universeAgeYears = universeAgeSec / (60 * 60 * 24 * 365.25);
		const ageFormattingRegex = /([\d.]+)e\+(\d+)/;

		const [ageSecMantissa, ageSecExponent] = universeAgeSec
			.toExponential()
			.match(ageFormattingRegex)
			.slice(1);
		const [ageYearsMantissa, ageYearsExponent] = universeAgeYears
			.toExponential()
			.match(ageFormattingRegex)
			.slice(1);

		katex.render(
			`\\textrm{Age}
			=\\frac{3\\times 10^{19}\\,\\textrm{km}/\\textrm{Mpc}}{H_0}
			=${(+ageSecMantissa).toFixed(2)}\\times 10^{${ageSecExponent}}\\,\\textrm{s}
			=${(+ageYearsMantissa).toFixed(2)}\\times 10^{${ageYearsExponent}}\\,\\textrm{yrs}`,
			document.getElementById("eqn-age"),
			{ displayMode: true },
		);
	}
}

applyGraphicalObjs(canvas, getAxisData());

update();
