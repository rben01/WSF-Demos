/* global applyGraphicalObjs */
const WIDTH = 500;
const HEIGHT = 500;

const X_MIN = -3;
const X_MAX = -X_MIN;

const Y_MIN = -10;
const Y_MAX = 20;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

const m = 1.2;
const L = 1.2;
const U = 15;
const hbar = 0.3;

const line = d3.line();

function $alpha(U, E) {
	return (2 * m * (U - E)) ** 0.5 / hbar;
}

function $k(E) {
	return (2 * m * E) ** 0.5 / hbar;
}

function $CEven(alpha, k) {
	const Lk = L * k;
	return Math.sqrt(
		alpha *
			k *
			Math.exp(L * alpha) *
			((1 + Math.cos(Lk)) /
				(L * alpha * k + alpha * Math.sin(Lk) + k * Math.cos(Lk) + k)),
	);
}

function $BEven(alpha, k) {
	return ($CEven(alpha, k) * Math.exp((-alpha * L) / 2)) / Math.cos((k * L) / 2);
}

function psiEven(alpha, k, energy, x) {
	return (
		energy +
		(x < -L / 2
			? $CEven(alpha, k) * Math.exp(alpha * x)
			: x < L / 2
			? $BEven(alpha, k) * Math.cos(k * x)
			: $CEven(alpha, k) * Math.exp(-alpha * x))
	);
}

function $COdd(alpha, k) {
	const Lk = L * k;
	return Math.sqrt(
		alpha *
			k *
			Math.exp(L * alpha) *
			((1 - Math.cos(Lk)) /
				(L * alpha * k - alpha * Math.sin(Lk) - k * Math.cos(Lk) + k)),
	);
}

function $BOdd(alpha, k) {
	return (-$COdd(alpha, k) * Math.exp((-alpha * L) / 2)) / Math.sin((k * L) / 2);
}

function psiOdd(alpha, k, energy, x) {
	return (
		energy +
		(x < -L / 2
			? $COdd(alpha, k) * Math.exp(alpha * x)
			: x < L / 2
			? $BOdd(alpha, k) * Math.sin(k * x)
			: -$COdd(alpha, k) * Math.exp(-alpha * x))
	);
}

function energyEquation(E, even) {
	const trigFunction = even ? Math.cos : Math.sin;
	return E ** 0.5 / trigFunction((L * (2 * m * E) ** 0.5) / (2 * hbar));
}

function findEnergies2({ even }) {
	const nPointsSearched = 100000;

	const u0 = ((m * L ** 2 * U) / (2 * hbar ** 2)) ** 0.5;
	const errorFunc = even
		? v => Math.abs(v * Math.tan(v) - (u0 ** 2 - v ** 2) ** 0.5)
		: v => Math.abs(-v / Math.tan(v) - (u0 ** 2 - v ** 2) ** 0.5);

	let energies = [u0 / 2];
	const N = Math.ceil((2 * u0) / Math.PI);
	// console.log(even, N);

	for (let n = 0; n < 2; ++n) {
		const energyCandidates = [...energies];
		// console.log(energyCandidates);
		energies = [];

		const searchHalfWidth = (u0 / 2) * nPointsSearched ** -n;
		for (const ec of energyCandidates) {
			if (ec > N) {
				continue;
			}
			const EMin = ec - searchHalfWidth;
			const EMax = ec + searchHalfWidth;
			const dE = (EMax - EMin) / (nPointsSearched - 1);

			let isDescending = false;
			let prevEnergy;
			let prevError = Infinity;

			for (let i = 0; i < nPointsSearched; ++i) {
				const energy = EMin + (i + 1) * dE;
				const error = errorFunc(energy);

				if (isDescending && error > prevError) {
					energies.push(prevEnergy);
				}

				isDescending = error < prevError;
				prevEnergy = energy;
				prevError = error;
			}
		}
	}

	energies.sort((a, b) => a - b);
	console.log(energies);
	energies = energies
		.map(v => (2 * hbar ** 2 * v ** 2) / (m * L ** 2))
		.filter(energy => energy < U);
	console.log(energies);

	return energies;
}

function findEnergies({ even }) {
	const nPointsSearched = 1000;

	const trigFunction = even ? Math.cos : Math.sin;
	const sqrtU = U ** 0.5;
	const errorFunc = energy =>
		Math.abs(
			sqrtU -
				energy ** 0.5 /
					trigFunction((L * (2 * m * energy) ** 0.5) / (2 * hbar)),
		);

	let energies = [U / 2];

	for (let n = 0; n < 2; ++n) {
		const energyCandidates = [...energies];
		// console.log(energyCandidates);
		energies = [];

		const precision = (U / 2) * nPointsSearched ** -n;
		for (const ec of energyCandidates) {
			const EMin = ec - precision;
			const EMax = ec + precision;
			const dE = (EMax - EMin) / (nPointsSearched - 1);

			let isDescending = false;
			let prevEnergy;
			let prevError = Infinity;

			for (let i = 0; i < nPointsSearched; ++i) {
				const energy = EMin + (i + 1) * dE;
				const error = errorFunc(energy);

				if (isDescending && error > prevError) {
					energies.push(prevEnergy);
				}

				isDescending = error < prevError;
				prevEnergy = energy;
				prevError = error;
			}
		}
	}

	energies.sort((a, b) => a - b);
	energies = energies.filter(energy => errorFunc(energy) < 1e-3);

	return energies;
}

function update(energy0) {
	const nPoints = 500;
	const dx = (X_MAX - X_MIN) / (nPoints - 1);
	const energyCurves = [];

	for (const even of [true, false]) {
		const psi = even ? psiEven : psiOdd;
		const energies = energy0 !== undefined ? [energy0] : findEnergies2({ even });
		console.log(even, energies);
		for (const energy of energies) {
			const alpha = $alpha(U, energy);
			const k = $k(energy);

			console.log(energy, alpha, k * Math.tan((k * L) / 2));
			// console.log(alpha, k, $CEven(alpha, k), $BEven(alpha, k), (k * L) / 2);

			const points = [];
			for (let i = 0; i < nPoints; ++i) {
				const x = X_MIN + i * dx;
				const y = psi(alpha, k, energy, x);
				points.push([xScale(x), yScale(y)]);
			}
			energyCurves.push({
				shape: "path",
				class: "curve",
				attrs: {
					d: line(points),
					stroke: even ? "white" : "#0f0",
					fill: "none",
					"stroke-width": 2,
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
		.attr("y1", yScale(Y_MIN))
		.attr("y2", yScale(Y_MAX))
		.attr("stroke", "#22ccff")
		.attr("stroke-width", 2);

	applyGraphicalObjs(plot, energyCurves, { selector: ".curve" });
}

update();
