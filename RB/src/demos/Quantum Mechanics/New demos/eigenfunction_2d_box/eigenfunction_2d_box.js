/* global katex getGridlines STANDARD_COLORS Plotly */

// eslint-disable-next-line no-unused-vars
function renderLatex() {
	document.getElementById("text-eqn-wavefunction").innerHTML = katex.renderToString(
		`\\displaystyle\\psi(x,y)=\\sqrt{\\frac{2}{a}}\\sqrt{\\frac{2}{b}}\\sin\\left(\\frac{\\pi n_x x}{a}\\right)\\sin\\left(\\frac{\\pi n_y y}{b}\\right)`,
	);
	document.getElementById("text-eqn-energy").innerHTML = katex.renderToString(
		`\\displaystyle\\textrm{Energy}=\\frac{\\hbar^2 n_x^2}{2ma^2}+\\frac{\\hbar^2 n_y^2}{2mb^2}`,
	);
	// document.getElementById("text-eqn-amplitude").innerHTML = katex.renderToString(
	// 	`\\displaystyle A=\\textrm{Amplitude}=\\sqrt{\\frac{2}{L_x}}\\sqrt{\\frac{2}{L_y}}`,
	// );
}

const X_MIN = 0;
const X_MAX = 1;
const X_WIDTH = X_MAX - X_MIN;
const Y_MIN = 0;
const Y_MAX = 1;
const Y_WIDTH = Y_MAX - Y_MIN;
const MIN_VAL = 0.25;

const plot = document.getElementById("plot");

const triangulationInfo = (() => {
	const xMin = X_MIN;
	const xMax = X_MAX;
	const nXPoints = 101;
	const dx = (xMax - xMin) / (nXPoints - 1);

	const yMin = Y_MIN;
	const yMax = Y_MAX;
	const nYPoints = 103;
	const dy = (yMax - yMin) / (nYPoints - 1);

	const gridPoints = [];
	for (let i = 0; i < nXPoints; ++i) {
		const x = xMin + i * dx;
		for (let j = 0; j < nYPoints; ++j) {
			const y = yMin + j * dy;
			gridPoints.push([x, y, null]);
		}
	}

	const xs = gridPoints.map(p => p[0]);
	const ys = gridPoints.map(p => p[1]);

	const delaunay = d3.Delaunay.from(gridPoints);
	const { triangles } = delaunay;
	const i = d3.range(triangles.length / 3).map(i => triangles[3 * i]);
	const j = d3.range(triangles.length / 3).map(i => triangles[3 * i + 1]);
	const k = d3.range(triangles.length / 3).map(i => triangles[3 * i + 2]);

	return { gridPoints, xs, ys, i, j, k };
})();

function getXScale(lx) {
	const dx = (X_WIDTH - lx) / 2;
	return d3.scaleLinear([X_MIN, X_MAX], [X_MIN + dx, X_MAX - dx]);
}

function getYScale(ly) {
	const dy = (Y_WIDTH - ly) / 2;
	return d3.scaleLinear([Y_MIN, Y_MAX], [Y_MIN + dy, Y_MAX - dy]);
}

function getScaledTriangulationInfo(lx, ly) {
	const xScale = getXScale(lx);
	const yScale = getYScale(ly);

	const { i, j, k } = triangulationInfo;
	let { gridPoints, xs, ys } = triangulationInfo;
	gridPoints = gridPoints.map(([x, y, z]) => [xScale(x), yScale(y), z]);
	xs = xs.map(x => xScale(x));
	ys = ys.map(y => yScale(y));
	return { gridPoints, xs, ys, i, j, k };
}

function waveFunction(x, y, { nx, ny, lx, ly }) {
	return (
		(2 / lx) ** 0.5 *
		(2 / ly) ** 0.5 *
		Math.sin((Math.PI * nx * x) / lx) *
		Math.sin((Math.PI * ny * y) / ly)
	);
}

let currNx = 1,
	currNy = 1,
	currLx = 1,
	currLy = 1,
	firstPlot = true;

function update({ nx, ny, lx, ly } = {}) {
	if (nx === undefined) {
		nx = currNx;
	} else {
		currNx = nx;
	}

	if (ny === undefined) {
		ny = currNy;
	} else {
		currNy = ny;
	}

	if (lx === undefined) {
		lx = currLx;
	} else {
		currLx = lx;
	}

	if (ly === undefined) {
		ly = currLy;
	} else {
		currLy = ly;
	}

	const dx = X_WIDTH * ((X_MAX - lx) / 2);
	const xMin = X_MIN + dx;
	const xMax = X_MAX - dx;
	const dy = (Y_WIDTH * (Y_MAX - ly)) / 2;
	const yMin = Y_MIN + dy;
	const yMax = Y_MAX - dy;

	const surfaceLighting = {
		ambient: 0.7,
		roughness: 0.8,
		diffuse: 0.4,
		specular: 0.96,
	};

	const triangulationInfo = getScaledTriangulationInfo(lx, ly);
	const zs = triangulationInfo.gridPoints.map(([x, y]) =>
		waveFunction(x - dx, y - dy, { nx, ny, lx, ly }),
	);
	const maxZPossible = 2 / MIN_VAL;
	const maxZObtained = d3.max(zs);

	const meshDatum = {
		type: "mesh3d",
		x: triangulationInfo.xs,
		y: triangulationInfo.ys,
		z: zs,
		i: triangulationInfo.i,
		j: triangulationInfo.j,
		k: triangulationInfo.k,
		lighting: surfaceLighting,
		facecolor: triangulationInfo.i.map(() => STANDARD_COLORS.graphicPrimary),
	};

	const gridlineZShift = 0.004;
	const xGridlines = getGridlines({
		nGridlines: 17,
		xMin,
		xMax,
		yMin,
		yMax,
		nPointsPerGridline: 103,
		zFunc: (x, y) =>
			waveFunction(x - dx, y - dy, { nx, ny, lx, ly }) + gridlineZShift,
	});
	const yGridlines = getGridlines({
		nGridlines: 17,
		xMin: yMin,
		xMax: yMax,
		yMin: xMin,
		yMax: xMax,
		nPointsPerGridline: 103,
	}).map(gridline =>
		gridline.map(([x, y]) => [
			y,
			x,
			waveFunction(x - dy, y - dx, { nx: ny, ny: nx, lx: ly, ly: lx }),
		]),
	);

	const gridlinesData = [...xGridlines, ...yGridlines].map(gridline => ({
		type: "scatter3d",
		x: gridline.map(p => p[0]),
		y: gridline.map(p => p[1]),
		z: gridline.map(p => p[2]),
		mode: "lines",
		line: {
			color: "#000",
			width: 2.5,
		},
	}));

	const zRange = maxZPossible * 1.3;

	// const BOUND_SHIFT = 0.004;
	// const boundingVertices = [
	// 	// Bottom
	// 	[X_MIN, Y_MIN, -zRange],
	// 	[X_MIN, Y_MAX - BOUND_SHIFT, -zRange],
	// 	[X_MAX - BOUND_SHIFT, Y_MAX - BOUND_SHIFT, -zRange],
	// 	[X_MAX - BOUND_SHIFT, Y_MIN, -zRange],
	// 	// Left
	// 	[X_MIN, Y_MAX, -zRange + BOUND_SHIFT],
	// 	[X_MIN, Y_MAX, zRange],
	// 	[X_MAX - BOUND_SHIFT, Y_MAX, zRange],
	// 	[X_MAX - BOUND_SHIFT, Y_MAX, -zRange + BOUND_SHIFT],
	// 	// Right
	// 	[X_MAX, Y_MIN, -zRange + BOUND_SHIFT],
	// 	[X_MAX, Y_MIN, zRange],
	// 	[X_MAX, Y_MAX - BOUND_SHIFT, zRange],
	// 	[X_MAX, Y_MAX - BOUND_SHIFT, -zRange + BOUND_SHIFT],
	// 	// [X_MIN, Y_MAX, zRange],
	// 	// [X_MAX, Y_MIN, -zRange],
	// 	// [X_MAX, Y_MIN, zRange],
	// 	// [X_MAX, Y_MAX, -zRange],
	// 	// [X_MAX, Y_MAX, zRange],
	// ];
	// const boundingTriangles = [
	// 	// Bottom
	// 	[0, 1, 2],
	// 	[0, 2, 3],
	// 	// Left
	// 	[4, 5, 6],
	// 	[4, 6, 7],
	// 	// Top
	// 	[8, 9, 10],
	// 	[8, 10, 11],
	// ];

	// const barrierVertices = [
	// 	// Left near face
	// 	[X_MIN, yMax, -zRange],
	// 	[X_MIN, yMax, zRange],
	// 	[X_MIN, Y_MAX, -zRange],
	// 	[X_MIN, Y_MAX, zRange],
	// 	// Left far face
	// 	[xMax, yMax, -zRange],
	// 	[xMax, yMax, zRange],
	// 	[xMax, Y_MAX, -zRange],
	// 	[xMax, Y_MAX, zRange],
	// 	// Right near face
	// 	[xMax, Y_MIN, -zRange],
	// 	[xMax, Y_MIN, zRange],
	// 	[X_MAX, Y_MIN, -zRange],
	// 	[X_MAX, Y_MIN, zRange],
	// 	// Right far face
	// 	[X_MAX, yMax, -zRange],
	// 	[X_MAX, yMax, zRange],
	// ];

	// const barrierIndices = [
	// 	//// Left
	// 	// -z
	// 	[0, 2, 4],
	// 	[2, 4, 6],
	// 	// -y
	// 	[0, 4, 5],
	// 	[0, 1, 5],
	// 	// -x
	// 	[0, 2, 3],
	// 	[0, 1, 3],
	// 	// +x
	// 	[4, 5, 6],
	// 	[5, 6, 7],
	// 	// +y
	// 	// Don't add duplicate faces to avoid z-fighting (y-fighting?)
	// 	...(yMax === Y_MAX
	// 		? []
	// 		: [
	// 				[2, 3, 6],
	// 				[3, 6, 7],
	// 		  ]),
	// 	// +z
	// 	[1, 3, 5],
	// 	[3, 5, 7],

	// 	//// Right
	// 	// -z
	// 	[4, 8, 10],
	// 	[4, 10, 12],
	// 	// -y
	// 	[4, 8, 9],
	// 	[4, 5, 9],
	// 	// -x
	// 	[8, 9, 10],
	// 	[9, 10, 11],
	// 	// +x
	// 	// Don't add duplicate faces to avoid z-fighting (x-fighting?)
	// 	...(xMax === X_MAX
	// 		? []
	// 		: [
	// 				[10, 11, 12],
	// 				[12, 11, 13],
	// 		  ]),
	// 	// +y
	// 	[4, 5, 12],
	// 	[5, 12, 13],
	// 	// +z
	// 	[5, 9, 11],
	// 	[5, 11, 13],
	// ];

	// const barrierDatum = {
	// 	type: "mesh3d",
	// 	x: barrierVertices.map(p => p[0]),
	// 	y: barrierVertices.map(p => p[1]),
	// 	z: barrierVertices.map(p => p[2]),
	// 	i: barrierIndices.map(i => i[0]),
	// 	j: barrierIndices.map(i => i[1]),
	// 	k: barrierIndices.map(i => i[2]),
	// 	flatshading: true,
	// 	lighting: { facenormalepsilon: 0, ambient: 0.4, specular: 0.5, diffuse: 0.3 },
	// 	facecolor: boundingTriangles.map(() => "#555"),
	// };

	// const boundingVertices = [];
	// const boundingTriangles = [];

	// for (const { indices, face } of boundingTrianglesUnshifted) {
	// 	const vertices = indices.map(i => [...boundingVerticesUnshifted[i]]);)

	// 	if (face === "xy") {
	// 		for (const vertex of vertices){
	// 			if (vertex===)
	// 		}
	// 	}
	// }

	// const boundingSurface = {
	// 	type: "mesh3d",
	// 	x: boundingVertices.map(p => p[0]),
	// 	y: boundingVertices.map(p => p[1]),
	// 	z: boundingVertices.map(p => p[2]),
	// 	i: boundingTriangles.map(t => t[0]),
	// 	j: boundingTriangles.map(t => t[1]),
	// 	k: boundingTriangles.map(t => t[2]),
	// 	flatshading: true,
	// 	lighting: { facenormalepsilon: 0 },
	// 	facecolor: boundingTriangles.map(() => "#000"),
	// };

	const dd = 0.002;
	const boundingLines = [
		// Bottom square
		[
			[xMin, yMin, -zRange],
			[xMin, yMax, -zRange],
		],
		[
			[xMin, yMax, -zRange],
			[xMax, yMax, -zRange],
		],
		[
			[xMax, yMax, -zRange],
			[xMax, yMin, -zRange],
		],
		[
			[xMax, yMin, -zRange],
			[xMin, yMin, -zRange],
		],
		// Left square (minus the edge it shares with the bottom one)
		[
			[xMax, yMax, -zRange],
			[xMax, yMax, zRange],
		],
		[
			[xMax, yMax, zRange],
			[xMin, yMax, zRange],
		],
		[
			[xMin, yMax, zRange],
			[xMin, yMax, -zRange],
		],
		// Right square (minus the two edges it shares with the other two)
		[
			[xMax, yMax, zRange],
			[xMax, yMin, zRange],
		],
		[
			[xMax, yMin, zRange],
			[xMax, yMin, -zRange],
		],
	].map(points => ({
		type: "scatter3d",
		mode: "lines",
		x: points.map(p => {
			const x = p[0];
			return x === X_MIN ? x : x - dd;
		}),
		y: points.map(p => {
			const y = p[1];
			return y === Y_MIN ? y : y - dd;
		}),
		z: points.map(p => {
			const z = p[2];
			return z < 0 ? z + dd : z;
		}),
		line: {
			width: 5,
			color: "#bbb",
		},
	}));

	const AXIS_LINE_THICKNESS = 5;
	const AXIS_COLOR = "#bbb";
	// const axisLines = [
	// 	// Far lines
	// 	// [
	// 	// 	[X_MAX, Y_MAX, -zRange],
	// 	// 	[X_MIN, Y_MAX, -zRange],
	// 	// ],
	// 	// [
	// 	// 	[X_MAX, Y_MAX, -zRange],
	// 	// 	[X_MAX, Y_MIN, -zRange],
	// 	// ],
	// 	// [
	// 	// 	[X_MAX, Y_MAX, -zRange],
	// 	// 	[X_MAX, Y_MAX, zRange],
	// 	// ],
	// 	// Others
	// 	[
	// 		[X_MAX, Y_MAX, zRange],
	// 		[X_MIN, Y_MAX, zRange],
	// 	],
	// 	[
	// 		[X_MIN, Y_MAX, zRange],
	// 		[X_MIN, Y_MAX, -zRange],
	// 	],
	// 	[
	// 		[X_MAX, Y_MAX, zRange],
	// 		[X_MAX, Y_MIN, zRange],
	// 	],
	// 	[
	// 		[X_MAX, Y_MIN, zRange],
	// 		[X_MAX, Y_MIN, -zRange],
	// 	],
	// 	[
	// 		[X_MAX, Y_MIN, -zRange],
	// 		[xMax, Y_MIN, -zRange],
	// 	],
	// 	[
	// 		[X_MIN, Y_MAX, -zRange],
	// 		[X_MIN, yMin, -zRange],
	// 	],
	// ].map(points => ({
	// 	type: "scatter3d",
	// 	mode: "lines",
	// 	x: points.map(p => p[0]),
	// 	y: points.map(p => p[1]),
	// 	z: points.map(p => p[2]),
	// 	line: {
	// 		width: AXIS_LINE_THICKNESS - 1,
	// 		color: AXIS_COLOR,
	// 	},
	// }));

	const TICK_LENGTH = 0.03;
	const LABEL_DIST_FROM_TICK = 0.05;
	const axisTicksAndLabelsInfo = [
		// x axis ticks
		{ point: [xMin, yMin, -zRange], dir: "y", label: "0" },
		{ point: [xMax, yMin, -zRange], dir: "y", label: "𝑎" },
		// y axis ticks
		{ point: [xMin, yMin, -zRange], dir: "x", label: "0" },
		{ point: [xMin, yMax, -zRange], dir: "x", label: "𝑏" },
		// z axis ticks
		{ point: [xMin, yMax, -maxZObtained], dir: "x", label: "-𝐴" },
		{ point: [xMin, yMax, 0], dir: "x", label: "0" },
		{ point: [xMin, yMax, maxZObtained], dir: "x", label: "𝐴" },
	];
	const axisTicks = [];
	const axisLabels = [];
	for (const { point, dir, label } of axisTicksAndLabelsInfo) {
		const tickP1 = point;
		const tickP2 = [...point];
		const dirIndex = dir === "x" ? 0 : dir === "y" ? 1 : 2;
		tickP2[dirIndex] -= TICK_LENGTH;

		const labelPoint = [...tickP2];
		labelPoint[dirIndex] -= LABEL_DIST_FROM_TICK;

		const points = [tickP1, tickP2];
		axisTicks.push({
			type: "scatter3d",
			mode: "lines",
			x: points.map(p => p[0]),
			y: points.map(p => p[1]),
			z: points.map(p => p[2]),
			line: {
				width: AXIS_LINE_THICKNESS,
				color: "#ccc",
			},
		});

		axisLabels.push({
			type: "scatter3d",
			mode: "text",
			x: [labelPoint[0]],
			y: [labelPoint[1]],
			z: [labelPoint[2]],
			text: [label],
			textposition: "middle center",
			textfont: {
				size: 20,
				color: "white",
			},
		});
	}

	const data = [
		meshDatum,
		...gridlinesData,
		...boundingLines,
		// ...axisLines,
		...axisTicks,
		...axisLabels,
		// barrierDatum,
	];

	const axesAttrs = {
		visible: true,
		showgrid: false,
		showline: false,
		showspikes: false,
		ticks: false,
		linewidth: AXIS_LINE_THICKNESS,
		gridwidth: AXIS_LINE_THICKNESS,
		zerolinewidth: AXIS_LINE_THICKNESS,
		mirror: false,
		tickfont: { size: 16 },
		zeroline: false,
		showticklabels: false,
		color: AXIS_COLOR,
		gridcolor: "#999",
	};

	const TOTAL_TICK_LENGTH = TICK_LENGTH + LABEL_DIST_FROM_TICK;
	const layout = {
		width: 800,
		height: 800,
		paper_bgcolor: "black",
		margin: { t: 0, b: 0, l: 0, r: 0 },
		hovermode: false,
		showlegend: false,
		scene: {
			aspectmode: "manual",
			aspectratio: { x: 1.3, y: 1.3, z: 0.8 },
			xaxis: {
				...axesAttrs,
				title: "",
				range: [X_MIN - TOTAL_TICK_LENGTH, X_MAX + TOTAL_TICK_LENGTH],
			},
			yaxis: {
				...axesAttrs,
				title: "",
				range: [Y_MIN - TOTAL_TICK_LENGTH, Y_MAX + TOTAL_TICK_LENGTH],
			},
			zaxis: {
				...axesAttrs,
				title: "",
				showgrid: false,
				range: [-zRange, zRange],
			},
		},
	};

	if (firstPlot) {
		const cameraXYDist = 2.3;
		const cameraInitialAngle = (3 * Math.PI) / 2 - 0.4;
		const x = cameraXYDist * Math.cos(cameraInitialAngle);
		const y = cameraXYDist * Math.sin(cameraInitialAngle);
		layout.scene.camera = {
			up: { x: 0, y: 0, z: 1 },
			center: { x: 0, y: 0, z: 0 },
			eye: {
				x,
				y,
				z: 1.1,
			},
			projection: { type: "perspective" },
		};
		firstPlot = false;
	} else {
		layout.scene.camera = plot._fullLayout.scene._scene.getCamera();
	}

	const config = {
		displayModeBar: false,
		scrollZoom: false,
	};

	Plotly.react(plot, data, layout, config);
}

const SLIDER_STEP = 0.001;
d3.select("#slider-lx")
	.each(function () {
		this.min = MIN_VAL;
		this.max = X_MAX;
		this.step = SLIDER_STEP;
		this.value = X_MAX;
	})
	.on("input", function () {
		update({ lx: +this.value });
	});

d3.select("#slider-ly")
	.each(function () {
		this.min = MIN_VAL;
		this.max = Y_MAX;
		this.step = SLIDER_STEP;
		this.value = Y_MAX;
	})
	.on("input", function () {
		update({ ly: +this.value });
	});

d3.selectAll(".n-button").each(function () {
	const n = this.getAttribute("wavenumber");
	const axis = this.getAttribute("axis");
	const key = axis === "x" ? "nx" : "ny";
	d3.select(this).on("click", () => update({ [key]: n }));
});
update({});
