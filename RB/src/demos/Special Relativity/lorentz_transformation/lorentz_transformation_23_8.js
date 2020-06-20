/* global applyGraphicalObjs Plotly TORUS_POINTS lorentzFactor */
const speedSlider = document.getElementById("input-v");
const speedSpan = document.getElementById("text-v");
const gammaSpan = document.getElementById("text-gamma");
const graphDiv = document.getElementById("plot");
const playButton = document.getElementById("start-button");

const MAJOR_RADIUS = 3;
const MINOR_RADIUS = 1.5001;

const XMIN = -1;
const XMAX = 1;
const XMID = (XMIN + XMAX) / 2;
const YMIN = -1;
const YMAX = 1;
const YMID = (YMIN + YMAX) / 2;

const KNOB_RADIUS = 0.2;

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

const knobCoords = { x: XMIN + KNOB_RADIUS, y: YMID };
const thetaScale = d3
	.scaleLinear()
	.domain([XMIN + KNOB_RADIUS, XMAX - KNOB_RADIUS])
	.range([Math.PI, 0])
	.clamp(true);
const phiScale = d3
	.scaleLinear()
	.domain([YMIN + KNOB_RADIUS, YMAX - KNOB_RADIUS])
	.range([-Math.PI / 2, Math.PI / 2])
	.clamp(true);

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

	const nThetas = 20;
	const nPhis = 12;
	const nPointsPerRing = 79;
	const dTheta = (2 * Math.PI) / nThetas;
	const dPhi = (2 * Math.PI) / nPhis;
	const dRingPoints = (2 * Math.PI) / nPointsPerRing;

	const ringTraceAttrs = {
		type: "scatter3d",
		mode: "lines",
		line: {
			width: 2,
			color: "#333",
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

	const velRotateTransformation = matMul(getRz(-theta), getRy(-phi));

	const velMag = 6.51;
	const [velPointHead, velPointTail] = [velMag - 0.9, -velMag].map(vm =>
		matMul(velRotateTransformation, [vm, 0, 0]),
	);

	const scatterPoints = [velPointHead, velPointTail];

	const arrowhead = TORUS_POINTS.arrowhead;
	const rotArrowhead = { x: [], y: [], z: [] };
	for (let i = 0; i < arrowhead.x.length; ++i) {
		const coords = [arrowhead.x, arrowhead.y, arrowhead.z].map(l => l[i]);
		const newPoint = matMul(velRotateTransformation, coords);

		rotArrowhead.x.push(newPoint[0]);
		rotArrowhead.y.push(newPoint[1]);
		rotArrowhead.z.push(newPoint[2]);
	}

	const lighting = {
		ambient: 0.7,
		roughness: 0.9,
		diffuse: 0.9,
		specular: 0.1,
	};

	const speedColor = "#38e";
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
			facecolor: TORUS_POINTS.simplices.map(() => "#f21200"),
			lighting,
			lightposition: null,

			// marker: { size: 1, color: "red" },
		},
		{
			type: "scatter3d",
			scene: "scene1",
			x: scatterPoints.map(p => p[0]),
			y: scatterPoints.map(p => p[1]),
			z: scatterPoints.map(p => p[2]),
			mode: "lines",
			line: { width: 10, color: speedColor },
			lightposition: null,
		},
		{
			type: "mesh3d",
			scene: "scene1",
			x: rotArrowhead.x,
			y: rotArrowhead.y,
			z: rotArrowhead.z,
			i: arrowhead.simplices.map(s => s[0]),
			j: arrowhead.simplices.map(s => s[1]),
			k: arrowhead.simplices.map(s => s[2]),
			facecolor: TORUS_POINTS.arrowhead.simplices.map(() => speedColor),
			// lighting: { ...lighting, ambient: 0.8 },
			lightposition: null,
		},
		...getRingTraces(transformation),
	];
	console.log(data.slice(0, 2));

	const axesAttrs = {
		showgrid: false,
		visible: false,
		showspikes: false,
	};

	const axisRange = (() => {
		const range = 14;
		return [-range, range];
	})();

	const layout = {
		width: 450,
		height: 450,
		hovermode: false,
		showlegend: false,
		margin: { t: 0, b: 0, l: 0, r: 0 },
		paper_bgcolor: "black",
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
				y: -0.5,
				z: 0.45,
			},
			projection: { type: "perspective" },
		};
	}

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
		{ x1: XMIN, y1: knobCoords.y, x2: XMAX, y2: knobCoords.y },
		{ x1: knobCoords.x, y1: YMIN, x2: knobCoords.x, y2: YMAX },
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
			r: xScale(KNOB_RADIUS) - xScale(0),
			fill: joystickAttrs.knobColor,
			stroke: joystickAttrs.knobOutline,
			"stroke-width": 1,
			filter: "url(#knob-shadow)",
		},
	},
]);

function moveJoystick(ex, ey) {
	const cx = xScale.invert(ex);
	const cy = yScale.invert(ey);

	if (!(XMIN < cx && cx < XMAX && YMIN < cy && cy < YMAX)) {
		return;
	}

	const x = Math.max(XMIN + KNOB_RADIUS, Math.min(cx, XMAX - KNOB_RADIUS));
	const y = Math.max(YMIN + KNOB_RADIUS, Math.min(cy, YMAX - KNOB_RADIUS));

	knobCoords.x = x;
	knobCoords.y = y;

	const sx = xScale(x);
	const sy = yScale(y);

	knob.attr("cx", xScale(x)).attr("cy", yScale(y));

	lines
		.data([
			{ x1: xScale(XMIN), y1: sy, x2: xScale(XMAX), y2: sy },
			{ x1: sx, y1: yScale(YMIN), x2: sx, y2: yScale(YMAX) },
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

const ANIMATION_DURATION_SEC = 7;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const FPS = 37;
const N_FRAMES = ANIMATION_DURATION_SEC * FPS;
const playbackInfo = {
	animationIsPlaying: false,
	animationTimer: null,
	currFrame: 0,
	speeds: {
		min: 0,
		max: parseFloat(speedSlider.max),
	},
};

// eslint-disable-next-line no-unused-vars
function updateSpeed({ speed, fromUserInteraction } = { fromUserInteraction: false }) {
	speed = parseFloat(speed);
	speedSlider.value = speed;

	plotTorus({ speed });

	if (fromUserInteraction) {
		playbackInfo.currFrame = Math.round(speed * N_FRAMES);
	}
}

function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	playButton.innerText = "Start";
}

// eslint-disable-next-line no-unused-vars
function toggleAnimation() {
	console.log(playbackInfo.animationIsPlaying);

	if (playbackInfo.animationIsPlaying) {
		stopAnimation();
		return;
	}

	playbackInfo.animationIsPlaying = true;
	playButton.textContent = "Pause";

	if (playbackInfo.currFrame >= N_FRAMES) {
		playbackInfo.currFrame = 0;
	}

	const interpolator = d3.interpolateNumber(
		playbackInfo.speeds.min,
		playbackInfo.speeds.max,
	);

	playbackInfo.animationTimer = setInterval(() => {
		if (playbackInfo.currFrame > N_FRAMES) {
			updateSpeed({ speed: speedSlider.max });
			stopAnimation();
			return;
		}

		const t = playbackInfo.currFrame / N_FRAMES;
		const speed = interpolator(t);

		updateSpeed({ speed });
		playbackInfo.currFrame += 2;
	}, ANIMATION_DURATION_MS / N_FRAMES);
}
