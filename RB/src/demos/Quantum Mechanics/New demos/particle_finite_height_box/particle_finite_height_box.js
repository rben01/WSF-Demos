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

const m = 1;
const L = 0.9;
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

function findEnergies({ even }) {
	const nPointsSearched = 1000;

	const trigFunction = even ? Math.cos : Math.sin;
	const energyEquation = E =>
		E ** 0.5 / trigFunction((L * (2 * m * E) ** 0.5) / (2 * hbar));

	const sqrtU = U ** 0.5;
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

			let prevDiffFromU = -Infinity;
			let currDiffFromU = Infinity;

			for (let i = 0; i < nPointsSearched - 1; ++i) {
				const E = EMin + (i + 1) * dE;
				const valueThatShouldBeCloseToU = energyEquation(E);
				const nextDiffFromU = Math.abs(sqrtU - valueThatShouldBeCloseToU);
				if (currDiffFromU < prevDiffFromU && currDiffFromU < nextDiffFromU) {
					energies.push(EMin + i * dE);
				}

				prevDiffFromU = currDiffFromU;
				currDiffFromU = nextDiffFromU;
			}
		}
	}

	energies.sort((a, b) => a - b);
	energies = energies.filter(
		(E, i) =>
			Math.abs(energyEquation(E) - sqrtU) < 1 &&
			(i === energies.length - 1 || Math.abs(E - energies[i + 1]) > 1e-4),
	);

	return energies;
}

function update() {
	const nPoints = 500;
	const dx = (X_MAX - X_MIN) / (nPoints - 1);
	const energyCurves = [];

	for (const even of [true, false]) {
		const psi = even ? psiEven : psiOdd;
		const energies = findEnergies({ even });
		console.log(even, energies);
		for (const energy of energies) {
			const alpha = $alpha(U, energy);
			const k = $k(energy);

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
