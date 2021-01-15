/* global applyGraphicalObjs defineArrowhead */
const WIDTH = 1100;
const HEIGHT = 750;

const X_MIN = -2;
const X_MAX = -X_MIN;

const Y_MIN = 0;
const Y_MAX = 10;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);
const defs = plot.append("defs");
const wellContainer = plot.append("g");
const energyLinesContainer = plot.append("g");
const energyCurvesContainer = plot.append("g");

const XS_MIN = 150;
const XS_MAX = WIDTH - 100;
const YS_MAX = HEIGHT - 100;
defs.append("clipPath")
	.attr("id", "clip-path")
	.append("rect")
	.attr("x", XS_MIN)
	.attr("width", XS_MAX - XS_MIN - 2)
	.attr("y", 0)
	.attr("height", HEIGHT);

const arrowheadLength = 15;
const arrowheadWidth = 15;
defineArrowhead(defs, {
	id: "arrowhead-start",
	length: arrowheadLength,
	width: arrowheadWidth,
	color: "white",
	flip: true,
});

defineArrowhead(defs, {
	id: "arrowhead-end",
	length: arrowheadLength,
	width: arrowheadWidth,
	color: "white",
});
defineArrowhead(defs, {
	id: "arrowhead-start-small",
	length: arrowheadLength / 2,
	width: arrowheadWidth / 2,
	color: "white",
	flip: true,
});

defineArrowhead(defs, {
	id: "arrowhead-end-small",
	length: arrowheadLength / 2,
	width: arrowheadWidth / 2,
	color: "white",
});

const xScale = d3.scaleLinear([X_MIN, X_MAX], [XS_MIN, XS_MAX]); // leaving room for axis
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [YS_MAX, 0]);

const HBAR = 0.3;
const AMPLITUDE = 0.3;

const line = d3.line();

const widthSlider = (() => {
	const slider = document.getElementById("slider-width");
	const min = 0.3;
	const max = (X_MAX - X_MIN) * 0.7;

	slider.min = min;
	slider.max = max;
	slider.step = 0.01;
	slider.value = (min + max) / 2;
	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;
	return slider;
})();

const heightSlider = (() => {
	const slider = document.getElementById("slider-height");
	const min = 1;
	const max = Y_MAX * 0.95;

	slider.min = min;
	slider.max = max;
	slider.step = 0.01;
	slider.value = (min + max) / 2;
	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;
	return slider;
})();

const massSlider = (() => {
	const slider = document.getElementById("slider-mass");
	const min = 0.2;
	const max = 3;

	slider.min = min;
	slider.max = max;
	slider.step = 0.01;
	slider.value = (min + max) / 2;
	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;
	return slider;
})();

function $alpha({ V, m, energy }) {
	return (2 * m * (V - energy)) ** 0.5 / HBAR;
}

function $k({ m, energy }) {
	return (2 * m * energy) ** 0.5 / HBAR;
}

function $CEven(alpha, k, L) {
	const Lk = L * k;
	return Math.sqrt(
		alpha *
			k *
			Math.exp(L * alpha) *
			((1 + Math.cos(Lk)) /
				(L * alpha * k + alpha * Math.sin(Lk) + k * Math.cos(Lk) + k)),
	);
}

function $COdd(alpha, k, L) {
	const Lk = L * k;
	return Math.sqrt(
		alpha *
			k *
			Math.exp(L * alpha) *
			((1 - Math.cos(Lk)) /
				(L * alpha * k - alpha * Math.sin(Lk) - k * Math.cos(Lk) + k)),
	);
}

function makePsiFunction({ even, V, L, m, energy }) {
	const alpha = $alpha({ V, m, energy });
	const k = $k({ m, energy });
	if (even) {
		const c = $CEven(alpha, k, L);
		const b = (c * Math.exp((-alpha * L) / 2)) / Math.cos((k * L) / 2);
		return x =>
			energy +
			AMPLITUDE *
				(x < -L / 2
					? c * Math.exp(alpha * x)
					: x < L / 2
					? b * Math.cos(k * x)
					: c * Math.exp(-alpha * x));
	} else {
		const c = $COdd(alpha, k, L);
		const b = (-c * Math.exp((-alpha * L) / 2)) / Math.sin((k * L) / 2);

		return x =>
			energy +
			AMPLITUDE *
				(x < -L / 2
					? c * Math.exp(alpha * x)
					: x < L / 2
					? b * Math.sin(k * x)
					: -c * Math.exp(-alpha * x));
	}
}

// Just... read this:
// https://en.wikipedia.org/wiki/Finite_potential_well#Finding_wavefunctions_for_the_bound_state
function findEnergies({ m, L, V, even }) {
	const nPointsSearched = 20000;

	const u0_Sqrd = (m * L ** 2 * V) / (2 * HBAR ** 2);
	const u0 = u0_Sqrd ** 0.5;
	const errorFunc = even
		? v => Math.abs(v * Math.tan(v) - (u0_Sqrd - v ** 2) ** 0.5)
		: v => Math.abs(-v / Math.tan(v) - (u0_Sqrd - v ** 2) ** 0.5);

	let solutions = [u0 / 2];

	// Summary of the solving algorithm:
	// Pick a starting point and a neighborhood (nhbd) around that point to search in
	// Traverse the neighborhood from left to right. Track whether the error associated with each point in the neighborhood is smaller or larger than that of the previous point
	// If the previous error was smaller than the one before it, but the current error is larger than the previous error, then the previous point was a local minimum. Add it to the list of candidate solutions.
	// Once we've traversed every neighborhood of every point, start over using a smaller neighborhood around each of aformentioned candidate solution. Do this until satisfied with precision of solutions (below, while n < 2).
	// Algorithm assumptions:
	// The function is smooth enough that there won't be any spurious local minima
	for (let n = 0; n < 2; ++n) {
		const solnCandidates = [...solutions];
		solutions = [];

		const nhbdHalfWidth = (u0 / 2) * nPointsSearched ** -n;
		for (const candidate of solnCandidates) {
			const nhbdMin = candidate - nhbdHalfWidth;
			const nhbdRight = candidate + nhbdHalfWidth;
			const du = (nhbdRight - nhbdMin) / (nPointsSearched - 1);

			let isDescending = false;
			let prevU;
			let prevError = Infinity;

			for (let i = 0; i < nPointsSearched; ++i) {
				const u = nhbdMin + (i + 1) * du;
				const error = errorFunc(u);

				if (isDescending && error > prevError) {
					solutions.push(prevU);
				}

				isDescending = error < prevError;
				prevU = u;
				prevError = error;
			}
		}
	}

	solutions = solutions
		.map(v => (2 * HBAR ** 2 * v ** 2) / (m * L ** 2))
		.filter(energy => energy < V); // filter shouldn't be necessary, but just in case

	return solutions;
}

function update() {
	const m = +massSlider.value;
	const V = +heightSlider.value;
	const L = +widthSlider.value;

	const nPoints = 500;
	const dx = (X_MAX - X_MIN) / (nPoints - 1);

	const energyLines = [];
	const energyCurves = [];

	for (const even of [true, false]) {
		const energies = findEnergies({ m, L, V, even });

		for (let index = 0; index < energies.length; ++index) {
			const energy = energies[index];
			const psi = makePsiFunction({ even, V, L, m, energy });
			// console.log(energy, alpha, k * Math.tan((k * L) / 2));
			// console.log(alpha, k, $CEven(alpha, k), $BEven(alpha, k), (k * L) / 2);

			const points = [];
			for (let i = 0; i < nPoints; ++i) {
				const x = X_MIN + i * dx;
				const y = psi(x);
				points.push([xScale(x), yScale(y)]);
			}

			const energyId = `index:${index};even:${even}`;

			const energyY = yScale(energy);
			energyLines.push({
				shape: "g",
				class: "energy-line-container",
				energyId,
				energy,
				children: [
					{
						shape: "line",
						class: "energy energy-line visible",
						energyId,
						energy,
						attrs: {
							x1: XS_MIN,
							x2: xScale(X_MAX),
							y1: energyY,
							y2: energyY,
						},
					},
					{
						shape: "line",
						class: "energy energy-line invisible hoverable",
						energyId,
						energy,
						attrs: {
							x1: XS_MIN,
							x2: xScale(X_MAX),
							y1: energyY,
							y2: energyY,
						},
					},
				],
			});

			const path = line(points);
			energyCurves.push({
				shape: "g",
				class: "energy-curve-container",
				energyId,
				energy,
				children: [
					{
						shape: "path",
						class: "energy energy-curve visible curve-background",
						energyId,
						energy,
						attrs: {
							d: path,
						},
					},
					{
						shape: "path",
						class: `energy energy-curve visible curve-foreground ${
							even ? "even" : "odd"
						}`,
						energyId,
						energy,
						attrs: {
							d: path,
						},
					},
					{
						shape: "path",
						class: "energy energy-curve mouse-event-catcher hoverable",
						energyId,
						energy,
						attrs: {
							d: path,
						},
					},
				],
			});
		}
	}

	for (const objs of [energyCurves, energyLines]) {
		objs.sort((a, b) => a.energy - b.energy).forEach((d, i) => {
			const energyLevelIndex = i + 1;
			d.energyLevelIndex = energyLevelIndex;
			if (d.children !== undefined) {
				for (const child of d.children) {
					child.energyLevelIndex = energyLevelIndex;
				}
			}
		});
	}

	const wellInnerLeft = xScale(-L / 2);
	const wellInnerRight = xScale(L / 2);
	const wellTop = yScale(V);
	const wellBot = yScale(Y_MIN);
	const verticalAxisOffset = 70;
	const horizontalAxisOffset = 25;
	const axisLabelOffsetFromAxis = 10;

	const wellData = [
		...[xScale(X_MIN), xScale(L / 2) - 1].map(x => ({
			shape: "rect",
			class: "well",
			attrs: {
				x,
				width: xScale(X_MAX) - xScale(L / 2) - 1,
				y: wellTop,
				height: wellBot - wellTop - 1,
			},
		})),
		{
			shape: "line",
			class: "well axis vertical-axis",
			attrs: {
				x1: XS_MIN - verticalAxisOffset,
				x2: XS_MIN - verticalAxisOffset,
				y1: wellBot - arrowheadLength / 2,
				y2: wellTop + arrowheadLength / 2,
				"marker-start": `url(#arrowhead-start)`,
				"marker-end": `url(#arrowhead-end)`,
			},
		},
		{
			shape: "text",
			class: "well axis-label vertical-axis-label",
			text: "𝐸 = 𝑉",
			attrs: {
				x: XS_MIN - (verticalAxisOffset + axisLabelOffsetFromAxis),
				y: wellTop,
				dx: -5,
				"dominant-baseline": "middle",
			},
		},
		{
			shape: "text",
			class: "well axis-label vertical-axis-label",
			text: "𝐸 = 𝟢",
			attrs: {
				x: XS_MIN - (verticalAxisOffset + axisLabelOffsetFromAxis),
				y: wellBot,
				dx: -5,
				"dominant-baseline": "middle",
			},
		},
		{
			shape: "line",
			class: "well axis horizontal-axis",
			attrs: {
				x1: wellInnerLeft + arrowheadLength / 2,
				x2: wellInnerRight - arrowheadLength / 2,
				y1: YS_MAX + horizontalAxisOffset,
				y2: YS_MAX + horizontalAxisOffset,
				"marker-start": `url(#arrowhead-start)`,
				"marker-end": `url(#arrowhead-end)`,
			},
		},
		{
			shape: "text",
			class: "well axis-label horizontal-axis-label",
			text: "𝑥 = −½𝐿",
			attrs: {
				x: xScale(-L / 2),
				y: YS_MAX + horizontalAxisOffset + axisLabelOffsetFromAxis,
				"dominant-baseline": "hanging",
			},
		},
		{
			shape: "text",
			class: "well axis-label horizontal-axis-label",
			text: "𝑥 = ½𝐿",
			attrs: {
				x: xScale(L / 2),
				y: YS_MAX + horizontalAxisOffset + axisLabelOffsetFromAxis,
				"dominant-baseline": "hanging",
			},
		},
	];

	applyGraphicalObjs(wellContainer, wellData, { selector: ".well" });
	applyGraphicalObjs(energyLinesContainer, energyLines, {
		selector: ".energy-line-container",
	});
	applyGraphicalObjs(energyCurvesContainer, energyCurves, {
		selector: ".energy-curve-container",
	});

	const psiAxisOffset = 15;
	plot.selectAll(".hoverable")
		.on("mouseover", function (_, thisDatum) {
			const thisEnergyId = thisDatum.energyId;
			const thisEnergy = thisDatum.energy;
			const thisEnergyIndex = thisDatum.energyLevelIndex;
			plot.selectAll(".energy-line.visible").each(function (d) {
				if (d.energyId !== thisEnergyId) {
					d3.select(this).style("opacity", 0.2);
				}
			});
			plot.selectAll(".energy-curve.visible").each(function (d) {
				if (d.energyId !== thisEnergyId) {
					d3.select(this).style("opacity", 0.1);
				}
			});

			const wavefunctionContainer = wellContainer
				.selectAll(".wavefunction-container")
				.data([0])
				.join("g")
				.classed("wavefunction-container", true)
				.style("visibility", "visible");

			applyGraphicalObjs(
				wavefunctionContainer,
				[
					{
						shape: "line",
						class: "axis vertical-axis",
						attrs: {
							x1: XS_MIN - psiAxisOffset,
							x2: XS_MIN - psiAxisOffset,
							y1: yScale(thisEnergy - AMPLITUDE),
							y2: yScale(thisEnergy + AMPLITUDE),
							"marker-start": "url(#arrowhead-start-small)",
							"marker-end": "url(#arrowhead-end-small)",
						},
					},
					{
						shape: "text",
						class: "axis-label vertical-axis-label",
						text: "𝜓",
						attrs: {
							x: XS_MIN - psiAxisOffset - axisLabelOffsetFromAxis,
							y: yScale(thisEnergy),
							"dominant-baseline": "middle",
						},
					},
					{
						shape: "text",
						class: "axis-label vertical-axis-label axis-label-right",
						text: `𝑛 = ${thisEnergyIndex}`,
						attrs: {
							x: XS_MAX + axisLabelOffsetFromAxis,
							y: yScale(thisEnergy),
							"dominant-baseline": "middle",
						},
					},
				],
				{ selector: "*" },
			);
		})
		.on("mouseout", function () {
			plot.selectAll(".visible").each(function () {
				d3.select(this).style("opacity", 1);
			});
			wellContainer
				.selectAll(".wavefunction-container")
				.style("visibility", "hidden");
		});
}

update();
