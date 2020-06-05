/* global Plotly */

const EPSILON = 0.000001;
const LAMBDA = 0.13;
const R_MAX = 10;

const graphDiv = document.getElementById("graph-0");

const temperatures = [];
for (let t = 3.6; t > 0; t -= 0.05) {
	temperatures.push(t);
}
const temperatureSlider = document.getElementById("input-temp");
temperatureSlider.min = 0;
temperatureSlider.max = temperatures.length - 1;
temperatureSlider.step = 1;
temperatureSlider.value = temperatureSlider.min;

const T_CRIT_SLIDER_INDEX = (() => {
	for (let i = 0; i < temperatures.length; ++i) {
		const t = temperatures[i];
		if (Math.abs(t - 1) < 0.01) {
			return i;
		}
	}
})();

const temperatureTextSpan = document.getElementById("text-temp-inequality");
const phiTextSpan = document.getElementById("text-phi");

const phis = [];
for (let p = -8.5; p <= 8.5; p += 0.1) {
	phis.push(p);
}
const phiSlider = document.getElementById("input-phi");
phiSlider.min = 0;
phiSlider.max = phis.length - 1;
phiSlider.step = 1;
phiSlider.value = (phis.length - 1) / 2;

const MAX_BEND_DESIRED = 175;
const HAT_BEND_MAX_R = (() => {
	const temp = temperatures[0];
	const temp2 = temp * temp;
	return Math.sqrt((temp2 - 1) / (2 * LAMBDA));
})();

function higgs(x, y, temp) {
	const r2 = x * x + y * y;
	const r4 = r2 * r2;

	const a = temp >= 1 ? 1 : LAMBDA * R_MAX * R_MAX * (2 - temp) * 0.4;
	const b = Math.min(1, temp);

	return a * (1 - temp * temp) * r2 + b * LAMBDA * r4;
}

function phiAdjStr(phi) {
	return ((MAX_BEND_DESIRED * phi) / HAT_BEND_MAX_R).toPrecision(4);
}

function getData({ f, rMax, dx, dy, nCircularLines, nRadialLines }) {
	const d = { x: dx, y: dy };
	const n = { x: Math.ceil(rMax / dx) + 1, y: Math.ceil(rMax / dy) + 1 };

	const grid = { x: [], y: [], z: [] };

	["x", "y"].forEach(v => {
		for (let i = -n[v]; i <= n[v]; ++i) {
			grid[v].push(i * d[v]);
		}
	});

	for (const x of grid.x) {
		const zRow = [];
		for (const y of grid.y) {
			const z = f(x, y);
			zRow.push(z);
		}

		grid.z.push(zRow);
	}

	const dTheta = Math.PI / nRadialLines;
	const radialLines = [];
	for (let i = 0; i < nRadialLines; ++i) {
		const thisRadialLine = { x: [], y: [], z: [] };
		const theta = i * dTheta;
		const dr = 0.1;
		const nr = Math.ceil(rMax / dr);
		for (let ir = -nr; ir <= nr; ++ir) {
			const r = ir * dr;
			// if (r < -rMax - EPSILON || r > rMax + EPSILON) {
			// 	continue;
			// }

			const x = r * Math.cos(theta);
			const y = r * Math.sin(theta);

			thisRadialLine.x.push(x);
			thisRadialLine.y.push(y);
			thisRadialLine.z.push(f(x, y));
		}
		radialLines.push(thisRadialLine);
	}

	const dCircularLine = rMax / nCircularLines;
	const circularLines = [];
	for (let i = 0; i <= nCircularLines; ++i) {
		const thisCircularLine = { x: [], y: [], z: [] };
		const r = i < nCircularLines ? dCircularLine * i : rMax;
		const dTheta = 0.02;
		for (let theta = 0; theta < Math.PI * 2 + dTheta; theta += dTheta) {
			const x = r * Math.cos(theta);
			const y = r * Math.sin(theta);

			thisCircularLine.x.push(x);
			thisCircularLine.y.push(y);
			thisCircularLine.z.push(f(x, y));
		}
		circularLines.push(thisCircularLine);
	}

	return { grid, radialLines, circularLines };
}

function getTraceDataForTemp({
	temperature,
	rMax,
	dx,
	dy,
	nCircularLines,
	nRadialLines,
}) {
	const temp2 = temperature * temperature;

	const f = (x, y) => higgs(x, y, temperature);

	const { grid, radialLines, circularLines } = getData({
		f,
		rMax,
		dx,
		dy,
		nCircularLines,
		nRadialLines,
	});

	const nInterpolatedPoints = 0;
	const data2d = [];
	for (let i = 0; i < grid.x.length; ++i) {
		const givenX = grid.x[i];
		data2d.push({ x: givenX, z: f(givenX, 0) });

		if (i < grid.x.length - 1) {
			for (let r = 1; r <= nInterpolatedPoints; ++r) {
				const l = nInterpolatedPoints + 1 - r;
				const interpolatedX =
					(l * grid.x[i] + r * grid.x[i + 1]) / (nInterpolatedPoints + 1);
				data2d.push({ x: interpolatedX, z: f(interpolatedX, 0) });
			}
		}

		// if (i < grid.x.length - 1) {
		// 	xs2d.push((grid.x[i] + grid.x[i + 1]) / 2);
		// }
		// data2d.push({ x: grid.x[i], z: middleZRow[i] });
	}
	console.log(data2d);

	const hatBendR2 = (temp2 - 1) / (2 * LAMBDA);

	const zMax2d = Math.max(
		...data2d.filter(({ x }) => x * x > hatBendR2).map(({ z }) => z),
	);

	for (let i = 0; i < grid.z.length; ++i) {
		const x = grid.x[i];
		const x2 = x * x;

		const zRow = grid.z[i];
		for (let j = 0; j < zRow.length; ++j) {
			const y = grid.y[j];
			const z = zRow[j];

			if (x > 0 && y > 0) {
				zRow[j] = null;
				continue;
			}

			const y2 = y * y;
			if (x2 + y2 > hatBendR2 && z > zMax2d) {
				zRow[j] = null;
				continue;
			}
		}
	}

	for (const lineList of [radialLines, circularLines]) {
		for (const line of lineList) {
			for (let i = 0; i < line.x.length; ++i) {
				const x = line.x[i];
				const y = line.y[i];

				if (x > EPSILON && y > EPSILON) {
					line.z[i] = null;
				}
			}
		}
	}

	const hatBendR = hatBendR2 > 0 ? Math.sqrt(hatBendR2) : 0;

	return {
		data2d,
		data3d: grid,
		radialLines,
		circularLines,
		hatBendR,
		hatBendZ: f(hatBendR, 0),
		zMax: f(rMax, 0),
	};
}

function getParticleInfo({ particlePhi }) {
	const particleRadius = 10;

	const currTemp = temperatures[+temperatureSlider.value];
	const hatBendR = (() => {
		if (currTemp <= 1) {
			return 0;
		}
		const r2 = Math.sqrt((currTemp * currTemp - 1) / (2 * LAMBDA));
		return r2;
	})();
	const slope = Math.abs(
		2 * (1 - currTemp * currTemp) * particlePhi +
			4 * LAMBDA * Math.pow(particlePhi, 3),
	);
	const maxHiggs = higgs(R_MAX, 0, currTemp);
	const z =
		higgs(particlePhi, 0, currTemp) +
		particleRadius +
		Math.pow(slope, 1.05) / 7 +
		300 / maxHiggs +
		maxHiggs * 0.02 -
		5;

	const particleTrace2d = {
		x: [particlePhi],
		y: [z],
		type: "scatter",
		mode: "markers",
		marker: { size: particleRadius, color: "red" },
		xaxis: "x2",
		yaxis: "y2",
	};

	const particleTrace3d = {
		x: [0],
		y: [particlePhi],
		z: [
			z +
				// Math.pow(slope, 1.05) / 40 +
				Math.pow(Math.max(0, Math.abs(particlePhi) - hatBendR) / R_MAX, 0.8) *
					0.1 *
					0.9 *
					Math.pow(maxHiggs, 0.8) +
				// (Math.abs(Math.abs(particlePhi) - hatBendR) / R_MAX) * 5 +
				// (Math.cos(((Math.PI / 2) * 1.2 * particlePhi) / R_MAX) * 20) /
				// 	Math.pow(maxHiggs, 0.5) +
				(Math.sin(((Math.PI / 1.5) * 1.2 * Math.abs(particlePhi / 2)) / R_MAX) *
					slope *
					0.5 *
					10000) /
					(maxHiggs * maxHiggs) +
				slope * 0.01 +
				(particlePhi === 0 ? maxHiggs * 0.001 : 0),
		],
		type: "scatter3d",
		mode: "markers",
		marker: { size: particleRadius * 0.9, color: "red" },
		showscale: false,
		scene: "scene1",
	};

	return { trace2d: particleTrace2d, trace3d: particleTrace3d };
}

function getPlotInfo({ temperature, phi, setCamera }) {
	const traces = [];

	const {
		data2d,
		data3d,
		radialLines,
		circularLines,
		hatBendR,
		hatBendZ,
		zMax,
	} = getTraceDataForTemp({
		temperature,
		rMax: R_MAX,
		dx: 0.3, // Minimum value to avoid spiky crown syndrome is ~0.3
		dy: 0.3,
		nCircularLines: 20,
		nRadialLines: 18,
	});

	const trace2d = {
		x: data2d.map(d => d.x),
		y: data2d.map(d => d.z),
		type: "line",
		showgrid: false,
		showlegend: false,
		xaxis: "x2",
		yaxis: "y2",
	};
	traces.push(trace2d);

	const particleInfo = getParticleInfo({ particlePhi: phi });

	traces.push(particleInfo.trace2d);

	const trace3d = {
		...data3d,
		type: "surface",
		showscale: false,
		scene: "scene1",
		// surfacecolor: data3d.z.map(zRow =>
		// 	zRow.map(() => {
		// 		return "rgb(0.1,0.1,0.1)";
		// 	}),
		// ),
		colorscale: [
			[0, "rgba(0.3,0.3,0.4)"],
			[1, "rgb(0.7,0.8,0.9)"],
		],
		contours: {
			x: { highlight: false },
			y: { highlight: false },
			z: { show: false },
		},
		// opacity: 0.999,
	};
	traces.push(trace3d);

	traces.push(particleInfo.trace3d);

	for (const line of [...radialLines, ...circularLines]) {
		traces.push({
			type: "scatter3d",
			mode: "lines",
			...line,
			line: {
				color: "#ccc",
				width: 2.5,
			},
			showscale: false,
			scene: "scene1",
		});
	}

	const isStable = hatBendR < EPSILON;
	const annotTextAttrs = {
		bordercolor: "black",
		borderwidth: 1,
		bgcolor: "#fffde0",
	};

	const yOffsetBottom = 163;
	const annotations = [];
	if (isStable) {
		annotations.push({
			x: 0,
			y: -40,
			xref: "x2",
			yref: "y2",
			showarrow: true,
			arrowhead: 2,
			arrowcolor: "red",
			text: "Stable (𝜙 = 0 GeV)",
			yanchor: "top",
			ax: 0,
			ay: 20,
			...annotTextAttrs,
		});
	} else {
		[-hatBendR, hatBendR].forEach((x, index) => {
			const sign = index === 0 ? 1 : -1;

			annotations.push({
				x: x + (sign * hatBendR) / 50,
				y: hatBendZ - 45 + Math.pow(hatBendR, 1.7) * 1.2,
				xref: "x2",
				yref: "y2",
				showarrow: true,
				arrowhead: 2,
				ax: sign * hatBendR * 3,
				ay: Math.pow(hatBendR, 0.6) * 5 + 18,
				arrowcolor: "red",
				text: "",
				yanchor: "top",
			});
		});
		annotations.push({
			x: 0,
			y: 40 + 100 / (Math.pow(hatBendR, 1) + 2),
			xref: "x2",
			yref: "y2",
			showarrow: true,
			arrowhead: 2,
			text: "Unstable (𝜙 = 0 GeV)",
			xanchor: "middle",
			yanchor: "bottom",
			arrowcolor: "red",
			ax: 0,
			ay: -29,
			...annotTextAttrs,
		});

		const phiStr = phiAdjStr(hatBendR);
		annotations.push({
			x: 0,
			y: hatBendZ * 0.65 - yOffsetBottom,
			xref: "x2",
			yref: "y2",
			showarrow: false,
			text: `Stable (𝜙 = ±${phiStr} GeV)`,
			xanchor: "middle",
			yanchor: "top",
			...annotTextAttrs,
		});
	}

	const layout = {
		showlegend: false,
		showgrid: false,
		hovermode: false,
		yaxis2: {
			anchor: "x2",
			domain: [0, 1],
			showgrid: false,
			visible: false,
			fixedrange: true,
		},
		xaxis2: {
			anchor: "y2",
			domain: [0, 0.45],
			showgrid: false,
			visible: false,
			fixedrange: true,
		},
		scene1: {
			domain: { x: [0.55, 1], y: [0, 1] },
			xaxis: { showgrid: false, visible: false, showspikes: false },
			yaxis: { showgrid: false, visible: false, showspikes: false },
			zaxis: {
				showgrid: false,
				visible: false,
				showspikes: false,
				range: [hatBendZ, zMax],
			},
			margin: { t: 0, b: 0, l: 0, r: 0 },
			hovermode: false,
		},
		annotations: annotations,
		// sliders: sliders,
	};

	if (setCamera) {
		layout.scene1.camera = {
			up: { x: 0, y: 0, z: 1 },
			center: { x: 0, y: 0, z: 0 },
			eye: {
				x: 1,
				y: 1,
				z: 0.8,
			},
			projection: { type: "perspective" },
		};
	} else {
		layout.scene1.camera = graphDiv._fullLayout.scene._scene.getCamera();
	}

	const config = { displayModeBar: false, scrollZoom: false };

	return { traces, layout, config };
}

// eslint-disable-next-line no-unused-vars
function update() {
	const temperatureIndex = temperatureSlider.value;
	const phi = (() => {
		const p = phis[phiSlider.value];
		if (Math.abs(p) < EPSILON) {
			return 0;
		}
		return p;
	})();

	const plotInfo = getPlotInfo({
		temperature: temperatures[temperatureIndex],
		phi,
		setCamera: !graphDiv.__hasBeenInitialized,
	});

	Plotly.react(graphDiv, plotInfo.traces, plotInfo.layout, plotInfo.config);
	if (!graphDiv.__hasBeenInitialized) {
		graphDiv.__hasBeenInitialized = true;
	}

	if (temperatureIndex < T_CRIT_SLIDER_INDEX) {
		temperatureTextSpan.textContent = "<";
	} else if (temperatureIndex < T_CRIT_SLIDER_INDEX + 2) {
		temperatureTextSpan.textContent = "=";
	} else {
		temperatureTextSpan.textContent = ">";
	}

	const phiStr = (() => {
		if (phi === 0) {
			return ` ${phiAdjStr(0)}`;
		}
		const p = phiAdjStr(phi);
		if (!p.startsWith("-")) {
			return `+${p}`;
		}
		return p;
	})();

	phiTextSpan.textContent = phiStr;
}

update();
// updateSelectedPhiIndex(0);
