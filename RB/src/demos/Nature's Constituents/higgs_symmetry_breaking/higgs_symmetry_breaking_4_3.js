/* global Plotly sign */

const EPSILON = 0.000001;
const graphDiv = document.getElementById("graph-0");
const temperatures = [];
for (let t = 4; t > 0; t -= 0.05) {
	temperatures.push(t);
}

const temperatureSlider = document.getElementById("input-temp");
temperatureSlider.min = 0;
temperatureSlider.max = temperatures.length - 1;
temperatureSlider.step = 1;
temperatureSlider.value = 0;

function getData({ f, rMax, dx, dy, nCircularLines, nRadialLines }) {
	const data = [];
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
			data.push({ x, y, z });
			zRow.push(z);
		}

		grid.z.push(zRow);
	}

	const dTheta = Math.PI / nRadialLines;
	const radialLines = [];
	for (let i = 0; i < nRadialLines; ++i) {
		const thisRadialLine = { x: [], y: [], z: [] };
		const theta = i * dTheta;
		const dr = dx;
		const nr = Math.ceil(rMax / dr) + 1;
		for (let ir = -nr; ir <= nr; ++ir) {
			const r = ir * dr;
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
	for (let i = 0; i < nCircularLines; ++i) {
		const thisCircularLine = { x: [], y: [], z: [] };
		const r = dCircularLine * i;
		const dTheta = 0.01;
		for (let theta = 0; theta < Math.PI * 2 + dTheta; theta += dTheta) {
			const x = r * Math.cos(theta);
			const y = r * Math.sin(theta);

			thisCircularLine.x.push(x);
			thisCircularLine.y.push(y);
			thisCircularLine.z.push(f(x, y));
		}
		circularLines.push(thisCircularLine);
	}

	return { data, grid, radialLines, circularLines };
}

function getTraceDataForTemp({
	temperature,
	lambda,
	rMax,
	dx,
	dy,
	nCircularLines,
	nRadialLines,
}) {
	const temp2 = temperature * temperature;

	const f = (x, y) => {
		const r2 = x * x + y * y;
		const r4 = r2 * r2;
		return (1 - temp2) * r2 + lambda * r4;
	};

	const { grid, radialLines, circularLines } = getData({
		f,
		rMax,
		dx,
		dy,
		nCircularLines,
		nRadialLines,
	});

	const middleZRow = grid.z[(grid.z.length - 1) / 2];
	const data2d = [];
	for (let i = 0; i < grid.x.length; ++i) {
		data2d.push({ x: grid.x[i], z: middleZRow[i] });
	}

	const temp2m1 = temp2 - 1;
	const hatBendR2 = temp2m1 / (2 * lambda);

	const zMax2d = Math.max(
		...data2d.filter(({ x }) => x * x > hatBendR2).map(({ z }) => z),
	);

	const r2ForZMax =
		(temp2m1 + Math.sqrt(temp2m1 * temp2m1 + 4 * lambda * zMax2d)) / (2 * lambda);

	for (let i = 0; i < grid.z.length; ++i) {
		const x = grid.x[i];
		const signedDx = sign(x) * dx;
		const x2 = x * x;
		const xFartherFromOrigin2 = (x + signedDx) * (x + signedDx);
		const zRow = grid.z[i];
		for (let j = 0; j < zRow.length; ++j) {
			const y = grid.y[j];
			const y2 = y * y;

			const z = zRow[j];

			if (x > 0 && y > 0) {
				zRow[j] = null;
			} else if (x2 + y2 > hatBendR2 && z > zMax2d) {
				zRow[j] = null;
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
	};
}

function getPlotInfo({ index, setCamera }) {
	const lambda = 0.5;
	const rMax = 5;

	const traces = [];

	const temperature = temperatures[index];

	const {
		data2d,
		data3d,
		radialLines,
		circularLines,
		hatBendR,
		hatBendZ,
	} = getTraceDataForTemp({
		temperature,
		lambda,
		rMax,
		dx: 0.2,
		dy: 0.2,
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

	traces.push(trace2d);
	traces.push(trace3d);

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
	const annotationXLocs = isStable ? [0] : [-hatBendR, hatBendR];
	// const annotations = annotationXLocs.map((x, index) => {
	// 	const sign = index === 0 ? 1 : -1;
	// 	const scale = index === 0 ? 1 : 0.8;
	// 	const annotationText = isStable
	// 		? "Stable<br>𝜙=0"
	// 		: index === 0
	// 		? `Unstable<br>𝜙=${hatBendR.toFixed(2)}`
	// 		: "";
	// 	return {
	// 		x: x,
	// 		y: hatBendZ,
	// 		xref: "x2",
	// 		yref: "y2",
	// 		showarrow: true,
	// 		arrowhead: 3,
	// 		ax: sign * scale * 30,
	// 		ay: scale * 40,
	// 		arrowcolor: "red",
	// 		text: "",
	// 	};
	// });

	console.log(hatBendR);
	const annotations = [];
	const annotAttrs = {
		bordercolor: "black",
		borderwidth: 1,
		bgcolor: "#fffde0bb",
	};
	if (isStable) {
		annotations.push({
			x: 0,
			y: -40,
			xref: "x2",
			yref: "y2",
			showarrow: false,
			text: "Stable<br>𝜙=0",
			...annotAttrs,
		});
	} else {
		[-hatBendR, hatBendR].forEach((x, index) => {
			const sign = index === 0 ? -1 : 1;

			annotations.push({
				x: x,
				y: hatBendZ,
				xref: "x2",
				yref: "y2",
				showarrow: true,
				arrowhead: 3,
				ax: sign * 10,
				ay: 30,
				arrowcolor: "red",
				text: "",
			});
		});
		annotations.push({
			x: 0,
			y: -40,
			xref: "x2",
			yref: "y2",
			showarrow: false,
			text: `Unstable<br>|𝜙|=${hatBendR.toFixed(2)}`,
			...annotAttrs,
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
			domain: [0, 0.5],
			showgrid: false,
			visible: false,
			fixedrange: true,
		},
		scene1: {
			domain: { x: [0.5, 1], y: [0, 1] },
			xaxis: { showgrid: false, visible: false, showspikes: false },
			yaxis: { showgrid: false, visible: false, showspikes: false },
			zaxis: {
				showgrid: false,
				visible: false,
				showspikes: false,
			},
			margin: { t: 0, b: 0, l: 0, r: 0 },
			// hovermode: false,
		},
		annotations: annotations,
		// sliders: sliders,
	};

	if (setCamera) {
		layout.scene1.camera = {
			up: { x: 0, y: 0, z: 1 },
			center: { x: 0, y: 0, z: 0 },
			eye: {
				x: 0.9519232993369161,
				y: 1.0389494860696102,
				z: 0.4231501161615341,
			},
			projection: { type: "perspective" },
		};
	} else {
		layout.scene1.camera = graphDiv._fullLayout.scene._scene.getCamera();
	}

	const config = { displayModeBar: false };

	return { traces, layout, config };
}

// eslint-disable-next-line no-unused-vars
function updateSelectedTemperatureIndex(selectedIndex) {
	if (typeof selectedIndex === "undefined") {
		selectedIndex = 0;
	} else {
		selectedIndex = +selectedIndex;
	}

	const plotInfo = getPlotInfo({
		index: selectedIndex,
		setCamera: !graphDiv.__hasBeenInitialized,
	});

	Plotly.react(graphDiv, plotInfo.traces, plotInfo.layout, plotInfo.config);
	if (!graphDiv.__hasBeenInitialized) {
		graphDiv.__hasBeenInitialized = true;
		// graphDiv.on("plotly_relayout", () => {
		// 	prevCamera = graphDiv.layout.scene.camera;
		// });
	} else {
		// Plotly.react();
	}
}

updateSelectedTemperatureIndex(0);
