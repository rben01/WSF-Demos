/* global Plotly */

function getData({ f, rMax, dx, dy, nCircularLines, nRadialLines }) {
	const data = [];
	const nx = Math.ceil((2 * rMax) / dx) + 1;
	const ny = Math.ceil((2 * rMax) / dy) + 1;

	const grid = { x: [], y: [], z: [] };

	for (let ix = 0; ix < nx; ++ix) {
		const x = -rMax + ix * dx;
		if (x > rMax) {
			break;
		}

		grid.x.push(x);

		const zRow = [];
		for (let iy = 0; iy < ny; ++iy) {
			const y = -rMax + iy * dy;
			if (y > rMax) {
				break;
			}

			const z = f(x, y);
			data.push({ x, y, z });

			if (ix === 0) {
				grid.y.push(y);
			}

			zRow.push(z);
		}

		grid.z.push(zRow);
	}

	const dTheta = Math.PI / nRadialLines;
	const radialLines = [];
	for (let i = 0; i < nRadialLines; ++i) {
		const thisRadialLine = { x: [], y: [], z: [] };
		const theta = i * dTheta;
		for (let r = -rMax; r <= rMax; r += 0.05) {
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
		for (let theta = 0; theta <= Math.PI * 2; theta += 0.05) {
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

function getDataForTemp({
	temperature,
	lambda,
	rMax,
	dx,
	dy,
	nCircularLines,
	nRadialLines,
}) {
	const temp2 = temperature * temperature;

	const allData = getData({
		f: (x, y) => {
			const r2 = x * x + y * y;
			const r4 = r2 * r2;
			return (1 - temp2) * r2 + lambda * r4;
		},
		rMax,
		dx,
		dy,
		nCircularLines,
		nRadialLines,
	});

	let minAbsY = Math.abs(allData.data[0].y);
	for (const d of allData.data) {
		const yAbs = Math.abs(d.y);
		if (yAbs < minAbsY) {
			minAbsY = yAbs;
		}
	}
	const data2d = allData.data.filter(({ y }) => y === minAbsY);

	const data3d = allData.grid;
	const hatBendR2 = (temp2 - 1) / (2 * lambda);
	const hatBendR = temp2 < 1 ? 0 : Math.sqrt(hatBendR2);
	const zMax2d = Math.max(
		...data2d.filter(({ x }) => Math.abs(x) > hatBendR).map(({ z }) => z),
	);

	for (let i = 0; i < data3d.z.length; ++i) {
		const x = data3d.x[i];
		const x2 = x * x;
		const zRow = data3d.z[i];
		for (let j = 0; j < zRow.length; ++j) {
			const y = data3d.y[j];
			const y2 = y * y;

			if ((x2 + y2 >= hatBendR2 && zRow[j] > zMax2d) || (x > 0 && y > 0)) {
				zRow[j] = null;
			}
		}
	}

	const radialLines = allData.radialLines;
	const circularLines = allData.circularLines;
	for (const lineList of [radialLines, circularLines]) {
		for (const line of lineList) {
			for (let i = 0; i < line.x.length; ++i) {
				const x = line.x[i];
				const y = line.y[i];

				if (x > 0 && y > 0) {
					line.z[i] = null;
				}
			}
		}
	}

	return { data2d, data3d, radialLines, circularLines };
}

const temperatures = [0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4];

function getGraphID(index) {
	return `graph-${index}`;
}

function makePlot({ index, graphDiv }) {
	const lambda = 0.5;
	const rMax = 5;

	const traces = [];

	const temperature = temperatures[index];

	const { data2d, data3d, radialLines, circularLines } = getDataForTemp({
		temperature,
		lambda,
		rMax,
		dx: 0.04,
		dy: 0.04,
		nCircularLines: 10,
		nRadialLines: 12,
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
			[0, "rgb(0.3,0.3,0.4)"],
			[1, "rgb(0.7,0.7,0.9)"],
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
				width: 2,
			},
			showscale: false,
			scene: "scene1",
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
		},
		xaxis2: {
			anchor: "y2",
			domain: [0, 0.5],
			showgrid: false,
			visible: false,
		},
		scene1: {
			camera: { eye: { x: 1, y: 1, z: 0.3 } },
			domain: { x: [0.5, 1], y: [0, 1] },
			xaxis: { showgrid: false, visible: false, showspikes: false },
			yaxis: { showgrid: false, visible: false, showspikes: false },
			zaxis: { showgrid: false, visible: false, showspikes: false },
			margin: { t: 0, b: 0, l: 0, r: 0 },
			hovermode: false,
		},
		// sliders: sliders,
	};

	const config = { displayModeBar: false };

	console.log(traces);
	Plotly.newPlot(graphDiv, traces, layout, config);

	return { traces, layout };
}

const rootDiv = document.getElementById("content");

const temperatureSlider = document.getElementById("input-temp");
temperatureSlider.min = 0;
temperatureSlider.max = temperatures.length - 1;
temperatureSlider.step = 1;
temperatureSlider.value = 0;

// eslint-disable-next-line no-unused-vars
function updateSelectedTemperatureIndex(selectedIndex) {
	if (typeof selectedIndex === "undefined") {
		selectedIndex = 0;
	} else {
		selectedIndex = +selectedIndex;
	}

	const id = getGraphID(selectedIndex);
	let graphDiv = document.getElementById(id);

	if (graphDiv === null) {
		graphDiv = document.createElement("div");
		graphDiv.id = id;
		graphDiv.class = "graph";
		graphDiv.style.width = "600px";
		graphDiv.style.height = "400px";
		rootDiv.appendChild(graphDiv);
		makePlot({ index: selectedIndex, graphDiv });
	}

	for (let i = 0; i < temperatures.length; ++i) {
		const id = getGraphID(i);
		const graphDiv = document.getElementById(id);
		if (graphDiv !== null) {
			graphDiv.style.display = i === selectedIndex ? "block" : "none";
		}
	}
}

updateSelectedTemperatureIndex(0);