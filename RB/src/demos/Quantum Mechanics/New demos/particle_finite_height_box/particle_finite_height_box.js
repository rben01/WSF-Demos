/* global applyGraphicalObjs */
const WIDTH = 500;
const HEIGHT = 500;

const X_MIN = -3;
const X_MAX = -X_MIN;

const Y_MIN = -1;
const Y_MAX = 20;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

const HBAR = 0.3;
const AMPLITUDE = 0.7;

const line = d3.line();

const widthSlider = (() => {
	const slider = document.getElementById("slider-width");
	const min = 0.1;
	const max = (X_MAX - X_MIN) / 2;

	slider.min = min;
	slider.max = max;
	slider.step = 0.001;
	slider.value = (min + max) / 2;
	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;
	return slider;
})();

const heightSlider = (() => {
	const slider = document.getElementById("slider-height");
	const min = 1;
	const max = Y_MAX * 0.8;

	slider.min = min;
	slider.max = max;
	slider.step = 0.001;
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
	slider.step = 0.001;
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
	const energyCurves = [];
	const energyLines = [];

	for (const even of [true, false]) {
		const energies = findEnergies({ m, L, V, even });
		for (const energy of energies) {
			const psi = makePsiFunction({ even, V, L, m, energy });
			// console.log(energy, alpha, k * Math.tan((k * L) / 2));
			// console.log(alpha, k, $CEven(alpha, k), $BEven(alpha, k), (k * L) / 2);

			const points = [];
			for (let i = 0; i < nPoints; ++i) {
				const x = X_MIN + i * dx;
				const y = psi(x);
				points.push([xScale(x), yScale(y)]);
			}
			energyCurves.push({
				shape: "path",
				class: "energy-curve",
				attrs: {
					d: line(points),
					stroke: even ? "white" : "#0f0",
					fill: "none",
					"stroke-width": 2,
				},
			});

			const energyY = yScale(energy);
			energyLines.push({
				shape: "line",
				class: "energy-line",
				attrs: {
					x1: xScale(X_MIN),
					x2: xScale(X_MAX),
					y1: energyY,
					y2: energyY,
					stroke: "red",
				},
			});
		}
	}

	plot.selectAll(".well")
		.data([
			{
				x: xScale(-L / 2),
			},
			{
				x: xScale(L / 2),
			},
		])
		.join("line")
		.classed("well", true)
		.attr("x1", d => d.x)
		.attr("x2", d => d.x)
		.attr("y1", yScale(0))
		.attr("y2", yScale(V))
		.attr("stroke", "#22ccff")
		.attr("stroke-width", 2);

	applyGraphicalObjs(plot, energyLines, { selector: ".energy-line" });
	applyGraphicalObjs(plot, energyCurves, { selector: ".energy-curve" });
}

update();
