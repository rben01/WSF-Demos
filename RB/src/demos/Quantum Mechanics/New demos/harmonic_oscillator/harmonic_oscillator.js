/* global applyGraphicalObjs defineArrowhead katex */

const WIDTH = 800;
const HEIGHT = 600;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const N_MIN = 0;
const N_MAX = 10;

const X_MIN = -6.3;
const X_MAX = 6.7;
const X_LEFT = -5;
const X_RIGHT = 5;
const X_0 = 0;

const Y_MAX = 11.5;
const Y_0 = 0;
const Y_MIN = -1;

const X_MARGIN = 8;
const Y_MARGIN = 10;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [X_MARGIN, WIDTH - X_MARGIN]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - Y_MARGIN, Y_MARGIN]);

const xsMin = xScale(X_LEFT);
const xs0 = xScale(X_0);
const xsMax = xScale(X_RIGHT);
const xInterp = d3.interpolateNumber(X_LEFT, X_RIGHT);
const ys0 = yScale(Y_0);
const ysMax = yScale(Y_MAX);

const sliders = {
	energyLevel: document.getElementById("slider-energy-level"),
};
{
	const slider = sliders.energyLevel;
	slider.min = N_MIN;
	slider.max = N_MAX;
	slider.step = 1;
	slider.value = N_MIN;
}

const defs = plot.selectAll("defs").data([0]).join("defs");
defineArrowhead(defs, {
	id: "arrowhead",
	length: 18,
	width: 14,
	color: "#ccc",
});
defineArrowhead(defs, {
	id: "arrowhead-small",
	length: 14,
	width: 10,
	color: "#ccc",
});
applyGraphicalObjs(defs, [
	{
		shape: "clipPath",
		attrs: {
			id: "parabola-clip-path",
		},
		children: [
			{
				shape: "rect",
				attrs: {
					x: 0,
					y: yScale(N_MAX + 1),
					width: WIDTH,
					height: HEIGHT,
				},
			},
		],
	},
]);

const PHI_FUNCTIONS = (() => {
	function getHermitePolynomial(n) {
		switch (n) {
			case 0:
				return () => 1;
			case 1:
				return x => 2 * x;
			case 2:
				return x => 4 * x ** 2 - 2;
			case 3:
				return x => 8 * x ** 3 - 12 * x;
			case 4:
				return x => 16 * x ** 4 - 48 * x ** 2 + 12;
			case 5:
				return x => 32 * x ** 5 - 160 * x ** 3 + 120 * x;
			case 6:
				return x => 64 * x ** 6 - 480 * x ** 4 + 720 * x ** 2 - 120;
			case 7:
				return x => 128 * x ** 7 - 1344 * x ** 5 + 3360 * x ** 3 - 1680 * x;
			case 8:
				return x =>
					256 * x ** 8 -
					3584 * x ** 6 +
					13440 * x ** 4 -
					13440 * x ** 2 +
					1680;
			case 9:
				return x =>
					512 * x ** 9 -
					9216 * x ** 7 +
					48384 * x ** 5 -
					80640 * x ** 3 +
					30240 * x;
			case 10:
				return x =>
					1024 * x ** 10 -
					23040 * x ** 8 +
					161280 * x ** 6 -
					403200 * x ** 4 +
					302400 * x ** 2 -
					30240;
		}
	}

	function factorial(n) {
		let acc = 1;
		for (let i = 2; i <= n; i++) {
			acc *= i;
		}
		return acc;
	}

	const AMPLITUDE = 0.5;

	const arr = [];
	for (let n = N_MIN; n <= N_MAX; n++) {
		const coef =
			AMPLITUDE *
			Math.pow(Math.PI, -0.25) *
			Math.pow(2 ** n * factorial(n), -0.5);
		const hp = getHermitePolynomial(n);
		arr.push(x => coef * hp(x) * Math.exp(x ** 2 / -2));
	}
	return arr;
})();

const SHOW_PROBA = 0;
const SHOW_WAVEF = 1;
let show = SHOW_PROBA;

// eslint-disable-next-line no-unused-vars
function showProbability() {
	show = SHOW_PROBA;
	// eslint-disable-next-line no-use-before-define
	update();
}

// eslint-disable-next-line no-unused-vars
function showWavefunction() {
	show = SHOW_WAVEF;
	// eslint-disable-next-line no-use-before-define
	update();
}

const LINE = d3.line().curve(d3.curveLinear);
const CURVE = d3
	.line()
	.curve(d3.curveNatural)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));
const FORMAT = d3.format(".1f");
function update() {
	const data = [];
	const selectedIndex = +sliders.energyLevel.value;
	const currN = selectedIndex - N_MIN;
	const currEnergy = currN + 0.5;

	// The axis stuff
	{
		const tickLength = 10;

		const xAxis = {
			shape: "path",
			classes: ["axis-axis", "x-axis"],
			attrs: {
				d: LINE([
					[xScale(X_LEFT) - 40, ys0],
					[xsMax, ys0],
				]),
				"marker-start": "url(#arrowhead)",
				"marker-end": "url(#arrowhead)",
			},
		};
		data.push(xAxis);

		const tickXMin = X_LEFT - 0.5;
		const width = X_RIGHT - tickXMin;
		const tickGapsPerUnit = 2;
		const nTicks = width * tickGapsPerUnit;
		const interp = d3.interpolateNumber(tickXMin, X_RIGHT);
		const xTickLocs = d3.range(1, nTicks).map(i => interp(i / nTicks));

		data.push(
			...xTickLocs.map(x => {
				const xs = xScale(x);
				return {
					shape: "line",
					classes: ["axis-tick", "x-axis"],
					attrs: {
						x1: xs,
						x2: xs,
						y1: ys0,
						y2: ys0 + tickLength,
					},
				};
			}),
		);

		const xLabelLocs = d3.range(-4, 5, 2);
		data.push(
			...xLabelLocs.map(x => {
				const xs = xScale(x);
				const text = `${x}`;
				return {
					shape: "text",
					classes: ["tick-label", "x-axis"],
					text,
					attrs: {
						x: xs,
						y: ys0 + tickLength + 20,
						"text-anchor": "middle",
						"dominant-baseline": "top",
					},
				};
			}),
		);

		data.push({
			shape: "text",
			text: "𝑥",
			classes: ["axis-label", "x-axis"],
			attrs: {
				x: xsMax,
				y: ys0 + 30,
				"text-anchor": "end",
				"dominant-baseline": "top",
			},
		});

		const yAxisOffset = 15;

		// y axis itself
		data.push(
			{
				shape: "line",
				classes: ["axis-axis", "y-axis"],
				attrs: {
					x1: xsMin - yAxisOffset,
					x2: xsMin - yAxisOffset,
					y1: ys0,
					y2: ysMax,
					"marker-end": "url(#arrowhead)",
				},
			},
			{
				shape: "text",
				classes: ["y-axis", "axis-label"],
				text: "𝐸",
				attrs: {
					x: xsMin - yAxisOffset - 20,
					y: yScale(N_MAX + 1.25),
					"text-anchor": "end",
					"dominant-baseline": "bottom",
				},
			},
		);

		// y axis ticks and labels
		const yLabelLocs = d3
			.range(N_MIN, N_MAX, 1)
			.concat(N_MAX)
			.map(n => n + 0.5);
		data.push(
			...yLabelLocs.flatMap((y, i) => {
				const ys = yScale(y);
				const text = FORMAT(y);
				return [
					{
						shape: "line",
						classes: [
							"axis-tick",
							"y-axis",
							...(i === currN ? ["selected"] : []),
						],
						attrs: {
							x1: xsMin - yAxisOffset,
							x2: xsMin - yAxisOffset - tickLength,
							y1: ys,
							y2: ys,
						},
					},
					{
						shape: "text",
						classes: [
							"tick-label",
							"y-axis",
							...(i === currN ? ["selected"] : []),
						],
						text,
						attrs: {
							x: xsMin - 35,
							y: ys,
							"text-anchor": "end",
							"dominant-baseline": "middle",
						},
					},
				];
			}),
		);

		// Label on right side of graph for \psi
		{
			const offset = 20;
			const text = show === SHOW_PROBA ? "|𝜓|²" : "𝜓";
			data.push(
				{
					shape: "line",
					classes: ["psi-axis", "axis-axis"],
					attrs: {
						x1: xsMax + offset,
						x2: xsMax + offset,
						y1: yScale(currEnergy + 0.5),
						y2: yScale(currEnergy - 0.5),
						"marker-start": "url(#arrowhead-small)",
						"marker-end": "url(#arrowhead-small)",
						stroke: "white",
					},
				},
				{
					shape: "text",
					classes: ["psi-axis", "axis-label"],
					text,
					attrs: {
						x: xsMax + offset + 10,
						y: yScale(currEnergy),
						"text-anchor": "start",
						"dominant-baseline": "middle",
					},
				},
			);
		}

		// Horizontal energy lines
		data.push(
			...yLabelLocs.map(y => {
				const ys = yScale(y);
				return {
					shape: "line",
					classes: ["energy-line"],
					attrs: {
						x1: xsMin,
						x2: xsMax,
						y1: ys,
						y2: ys,
					},
				};
			}),
		);

		//midline
		data.push({
			shape: "line",
			classes: ["midline"],
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: ys0,
				y2: ysMax,
			},
		});

		// parabola
		{
			const nPathPoints = 20;
			const parabola = [];
			for (let i = 0; i < nPathPoints; i++) {
				const x = xInterp(i / (nPathPoints - 1));
				const y = x ** 2 / 2;

				parabola.push([x, y]);
			}
			data.push({
				shape: "path",
				classes: ["parabola"],
				attrs: { d: CURVE(parabola), "clip-path": "url(#parabola-clip-path)" },
			});
		}
	}

	// the dynamic, wave stuff
	(() => {
		const nPathPoints = 30;
		const pathPoints = [];
		for (let n = N_MIN; n <= N_MAX; n++) {
			const thisPathPoints = [];
			const phi_func = PHI_FUNCTIONS[n];

			for (let i = 0; i < nPathPoints; i++) {
				const x = xInterp(i / (nPathPoints - 1));
				const y = phi_func(x);
				thisPathPoints.push([x, y]);
			}

			if (show === SHOW_PROBA) {
				for (let i = 0; i < nPathPoints; i++) {
					// Artificial amplitude expansion to make probabilities more visible
					thisPathPoints[i][1] = 2.5 * thisPathPoints[i][1] ** 2;
				}
			}

			for (let i = 0; i < nPathPoints; i++) {
				thisPathPoints[i][1] += n + 0.5;
			}

			pathPoints.push(thisPathPoints);
		}

		for (const klass of ["bg", "fg"]) {
			data.push(
				...pathPoints.map((thisPathPoints, i) => ({
					shape: "path",
					classes: ["function", klass, ...(i === currN ? ["selected"] : [])],
					attrs: { d: CURVE(thisPathPoints) },
				})),
			);
		}
	})();

	for (const datum of data) {
		if (!datum.classes) {
			datum.classes = [];
		}
		datum.classes.push("graphical-obj");
	}

	applyGraphicalObjs(plot, data, { selector: ".graphical-obj" });

	if (typeof katex !== "undefined") {
		katex.render(`n = ${selectedIndex}`, document.getElementById("text-index"));
	}
}

for (const slider of Object.values(sliders)) {
	d3.select(slider).on("input", function () {
		update();
	});
}

showWavefunction();
