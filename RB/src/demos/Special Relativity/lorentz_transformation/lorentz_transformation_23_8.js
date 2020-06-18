/* global applyGraphicalObjs Plotly TORUS_POINTS lorentzFactor */
const speedSlider = document.getElementById("input-v");
const speedSpan = document.getElementById("text-v");
const gammaSpan = document.getElementById("text-gamma");
const graphDiv = document.getElementById("plot");

const MAJOR_RADIUS = 3;
const MINOR_RADIUS = 1.0001;

const XMIN = -1;
const XMAX = 1;
const XMID = (XMIN + XMAX) / 2;
const YMIN = -1;
const YMAX = 1;
const YMID = (YMIN + YMAX) / 2;

const joystickAttrs = {
	width: 100,
	height: 100,
	cornerRadius: 5,
	bgColor: "#ddd",
	lineColor: "#888",
	knobColor: "#eee",
	knobOutline: "#aaa",
};
const xScale = d3.scaleLinear().domain([XMIN, XMAX]).range([0, joystickAttrs.width]);
const yScale = d3.scaleLinear().domain([YMIN, YMAX]).range([joystickAttrs.height, 0]);

const knobCoords = { x: XMID, y: YMID };
const thetaScale = d3.scaleLinear().domain([XMIN, XMAX]).range([-Math.PI, Math.PI]);
const phiScale = d3
	.scaleLinear()
	.domain([YMIN, YMAX])
	.range([-Math.PI / 2, Math.PI / 2]);

function matMulHelper(mat1, mat2) {
	if (typeof mat1[0].length === "undefined") {
		mat1 = [mat1];
	}

	const squeezeAns = typeof mat2[0].length === "undefined";
	if (squeezeAns) {
		mat2 = mat2.map(elem => [elem]);
	}

	const m = mat1.length;
	const k = mat2.length;
	const n = mat2[0].length;

	const ans = [];
	for (let r = 0; r < m; ++r) {
		const rowAns = [];
		for (let c = 0; c < n; ++c) {
			let sum = 0;
			for (let i = 0; i < k; ++i) {
				sum += mat1[r][i] * mat2[i][c];
			}
			rowAns.push(sum);
		}
		ans.push(rowAns);
	}

	if (squeezeAns) {
		return ans.map(row => row[0]);
	}

	return ans;
}

function matMul(...mats) {
	let ans = mats[0];
	for (let i = 1; i < mats.length; ++i) {
		ans = matMulHelper(ans, mats[i]);
	}
	return ans;
}

function getRingTraces(transformation) {
	function addPoint(primedRing, theta, phi) {
		const x = (MAJOR_RADIUS + MINOR_RADIUS * Math.cos(phi)) * Math.cos(theta);
		const y = (MAJOR_RADIUS + MINOR_RADIUS * Math.cos(phi)) * Math.sin(theta);
		const z = MINOR_RADIUS * Math.sin(phi);

		const [xp, yp, zp] = matMul(transformation, [x, y, z]);
		primedRing.x.push(xp);
		primedRing.y.push(yp);
		primedRing.z.push(zp);
	}

	const traces = [];

	const nThetas = 17;
	const nPhis = 7;
	const nPointsPerRing = 79;
	const dTheta = (2 * Math.PI) / nThetas;
	const dPhi = (2 * Math.PI) / nPhis;
	const dRingPoints = (2 * Math.PI) / nPointsPerRing;

	const ringTraceAttrs = {
		type: "scatter3d",
		mode: "lines",
		line: {
			width: 2,
			color: "#444",
		},
	};

	for (let i = 0; i <= nThetas; ++i) {
		const primedRing = { x: [], y: [], z: [] };
		const theta = i * dTheta;
		for (let j = 0; j <= nPointsPerRing; ++j) {
			const phi = j * dRingPoints;
			addPoint(primedRing, theta, phi);
		}
		traces.push({
			...primedRing,
			...ringTraceAttrs,
		});
	}
	for (let i = 0; i <= nPhis; ++i) {
		const primedRing = { x: [], y: [], z: [] };
		const phi = i * dPhi;
		for (let j = 0; j <= nPointsPerRing; ++j) {
			const theta = j * dRingPoints;
			addPoint(primedRing, theta, phi);
		}
		traces.push({
			...primedRing,
			...ringTraceAttrs,
		});
	}

	return traces;
}

function plotTorus({ speed, theta, phi, restoreCamera } = {}) {
	if (typeof speed === "undefined") {
		speed = speedSlider.value;
	}
	speed = +speed;

	if (typeof theta === "undefined") {
		theta = thetaScale(knobCoords.x);
	}

	if (typeof phi === "undefined") {
		phi = phiScale(knobCoords.y);
	}

	if (typeof restoreCamera === "undefined") {
		restoreCamera = true;
	}

	const gamma = lorentzFactor({ fracOfC: speed });

	function getRy(angle) {
		const c = Math.cos(angle);
		const s = Math.sin(angle);
		return [
			[c, 0, s],
			[0, 1, 0],
			[-s, 0, c],
		];
	}
	function getRz(angle) {
		const c = Math.cos(angle);
		const s = Math.sin(angle);
		return [
			[c, -s, 0],
			[s, c, 0],
			[0, 0, 1],
		];
	}
	function getLx() {
		return [
			[1 / gamma, 0, 0],
			[0, 1, 0],
			[0, 0, 1],
		];
	}

	const unrotatePhiAngle = Math.atan2(Math.sin(phi), Math.cos(phi) / gamma);

	const transformation = matMul(
		getRz(-theta),
		getRy(-unrotatePhiAngle),
		getLx(),
		getRy(phi),
		getRz(theta),
	);

	const torusPrime = { x: [], y: [], z: [] };
	for (let i = 0; i < TORUS_POINTS.x.length; ++i) {
		const coords = [TORUS_POINTS.x, TORUS_POINTS.y, TORUS_POINTS.z].map(l => l[i]);
		const newPoint = matMul(transformation, coords);

		torusPrime.x.push(newPoint[0]);
		torusPrime.y.push(newPoint[1]);
		torusPrime.z.push(newPoint[2]);
	}

	const velMag = 4.5;
	const velPoint = matMul(getRz(-theta), getRy(-phi), [velMag, 0, 0]);
	const scatterPoints = [velPoint, velPoint.map(c => -c)];

	const speedColor = "#28d";
	const data = [
		{
			type: "mesh3d",
			scene: "scene1",
			x: torusPrime.x,
			y: torusPrime.y,
			z: torusPrime.z,
			i: TORUS_POINTS.simplices.map(s => s[0]),
			j: TORUS_POINTS.simplices.map(s => s[1]),
			k: TORUS_POINTS.simplices.map(s => s[2]),
			facecolor: TORUS_POINTS.simplices.map(() => "#e20"),
			// marker: { size: 1, color: "red" },
		},
		{
			type: "scatter3d",
			scene: "scene1",
			x: scatterPoints.map(p => p[0]),
			y: scatterPoints.map(p => p[1]),
			z: scatterPoints.map(p => p[2]),
			mode: "lines",
			line: { width: 3, color: speedColor },
		},
		{
			type: "scatter3d",
			scene: "scene1",
			x: [velPoint[0]],
			y: [velPoint[1]],
			z: [velPoint[2]],
			mode: "markers",
			marker: { symbol: "diamond", color: speedColor },
		},
		...getRingTraces(transformation),
	];
	console.log(velPoint);

	const axesAttrs = {
		// showgrid: false,
		// visible: false,
		showspikes: false,
	};

	const axisRange = (() => {
		const range = 4.8;
		return [-range, range];
	})();

	const layout = {
		width: 450,
		height: 450,
		hovermode: false,
		showlegend: false,
		margin: { t: 0, b: 0, l: 0, r: 0 },
		scene1: {
			xaxis: { range: axisRange, ...axesAttrs },
			yaxis: { range: axisRange, ...axesAttrs },
			zaxis: { range: axisRange, ...axesAttrs },
			aspectmode: "cube",
		},
	};

	if (restoreCamera) {
		layout.scene1.camera = graphDiv._fullLayout.scene._scene.getCamera();
	} else {
		layout.scene1.camera = {
			up: { x: 0, y: 0, z: 1 },
			center: { x: 0, y: 0, z: 0 },
			eye: {
				x: 0,
				y: -1.7,
				z: 1,
			},
			projection: { type: "perspective" },
		};
	}
	console.log(layout.scene1.camera);

	const config = { displayModeBar: false, scrollZoom: false };

	Plotly.react("plot", data, layout, config);

	speedSpan.textContent = speed.toFixed(3);
	gammaSpan.textContent = gamma.toFixed(3);
}

const joystick = d3
	.select("#velocity-dir-input")
	.attr("width", joystickAttrs.width)
	.attr("height", joystickAttrs.height);

joystick
	.append("rect")
	.attr("x", 0)
	.attr("y", 0)
	.attr("width", joystickAttrs.width)
	.attr("height", joystickAttrs.height)
	.attr("fill", joystickAttrs.bgColor)
	.attr("rx", joystickAttrs.cornerRadius)
	.attr("pointer-events", "all");

const lines = applyGraphicalObjs(
	joystick,
	[
		{ x1: XMIN, y1: YMID, x2: XMAX, y2: YMID },
		{ x1: XMID, y1: YMIN, x2: XMID, y2: YMAX },
	].map(attrs => {
		const x1 = xScale(attrs.x1);
		const y1 = yScale(attrs.y1);
		const x2 = xScale(attrs.x2);
		const y2 = yScale(attrs.y2);

		return {
			shape: "line",
			attrs: {
				x1,
				y1,
				x2,
				y2,
				stroke: joystickAttrs.lineColor,
				"stroke-width": 2,
			},
		};
	}),
);

const knob = applyGraphicalObjs(joystick, [
	{
		shape: "circle",
		attrs: {
			cx: xScale(knobCoords.x),
			cy: yScale(knobCoords.y),
			r: 10,
			fill: joystickAttrs.knobColor,
			stroke: joystickAttrs.knobOutline,
			"stroke-width": 1,
			filter: "url(#knob-shadow)",
		},
	},
]);

function moveJoystick(ex, ey) {
	const x = xScale.invert(ex);
	const y = yScale.invert(ey);

	if (!(XMIN < x && x < XMAX && YMIN < y && y < YMAX)) {
		return;
	}

	knob.attr("cx", ex).attr("cy", ey);

	knobCoords.x = x;
	knobCoords.y = y;

	lines
		.data([
			{ x1: xScale(XMIN), y1: ey, x2: xScale(XMAX), y2: ey },
			{ x1: ex, y1: yScale(YMIN), x2: ex, y2: yScale(YMAX) },
		])
		.attr("x1", d => d.x1)
		.attr("y1", d => d.y1)
		.attr("x2", d => d.x2)
		.attr("y2", d => d.y2);

	plotTorus();
}

let mouseIsDown = false;
joystick
	.on("mousedown", function () {
		mouseIsDown = true;
		const [ex, ey] = d3.mouse(this);
		moveJoystick(ex, ey);
	})
	.on("mousemove", function () {
		if (mouseIsDown) {
			const [ex, ey] = d3.mouse(this);
			moveJoystick(ex, ey);
		}
	})
	.on("mouseup", function () {
		mouseIsDown = false;
	});

plotTorus({ restoreCamera: false });
