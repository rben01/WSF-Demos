/* global Plotly lorentzFactor matMul ARROWHEAD_POINTS */
const STEP = 0.01;

const variables = ["vx", "vy", "vz", "vr"];
const sliders = {};
variables.forEach(v => {
	sliders[v] = document.getElementById(`input-${v}`);
});

const plotDiv = document.getElementById("plot");

const config = { displayModeBar: false, scrollZoom: false };

const axesAttrs = {
	type: "scatter3d",
	mode: "lines",
	line: {
		color: "#888",
		width: 2,
	},
};

const axisLabelAttrs = {
	type: "scatter3d",
	mode: "text",
	textposition: "center center",
	textfont: {
		color: "#fff",
		size: 18,
	},
};

const velocityVectorAttrs = {
	type: "scatter3d",
	mode: "lines",
	line: {
		color: "#4c3",
		width: 5,
	},
};

function getDefault(v, name) {
	let x = v[name];
	if (typeof x === "undefined") {
		x = sliders[name].value;
	}
	x = +x;
	return x;
}

function fmtFloat(x) {
	return x.toFixed(2).replace(/^-/, '<span class="minus-sign">−</span>');
}

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

const isNeg = { vx: false, vy: false, vz: false };

function update(vars, { restoreCamera } = {}) {
	const givenVal = Object.keys(vars)[0];

	if (typeof restoreCamera === "undefined") {
		restoreCamera = true;
	}

	variables.forEach(k => {
		const v = getDefault(vars, k);
		vars[k] = v;
		isNeg[k] = v < 0;
	});

	let { vx, vy, vz } = vars;
	const { vr } = vars;

	let v = Math.sqrt(vx * vx + vy * vy + vz * vz);

	if (v >= 1) {
		const roundToStep = x => Math.floor(x / STEP) * STEP;
		if (givenVal === "vx") {
			vx = roundToStep(Math.sqrt(0.999999999999 - vy * vy - vz * vz));
			if (isNeg.vx) {
				vx *= -1;
			}
			sliders[givenVal].value = vx;
		} else if (givenVal === "vy") {
			vy = roundToStep(Math.sqrt(0.999999999999 - vx * vx - vz * vz));
			if (isNeg.vy) {
				vy *= -1;
			}
			sliders[givenVal].value = vy;
		} else if (givenVal === "vz") {
			vz = roundToStep(Math.sqrt(0.999999999999 - vx * vx - vy * vy));
			if (isNeg.vz) {
				vz *= -1;
			}
			sliders[givenVal].value = vz;
		}

		v = Math.sqrt(vx * vx + vy * vy + vz * vz) * 0.99999999999;
	}

	const theta = Math.atan2(vy, vx);

	const r = Math.sqrt(vx * vx + vy * vy);
	const phi = Math.atan2(vz, r);

	const vxp = (vx - vr) / (1 - vx * vr);
	const vyp = (Math.sqrt(1 - vr * vr) * vy) / (1 - vx * vr);
	const vzp = (Math.sqrt(1 - vr * vr) * vz) / (1 - vx * vr);

	const primedTheta = Math.atan2(vyp, vxp);
	const primedR = Math.sqrt(vxp * vxp + vyp * vyp);
	const primedPhi = Math.atan2(vzp, primedR);

	const baseArrowhead = ARROWHEAD_POINTS.arrowhead;
	const arrowheads = [];
	[
		{
			velocity: [vx, vy, vz],
			rotTrans: matMul(getRz(theta), getRy(-phi)),
			scene: "scene1",
		},
		{
			velocity: [vxp, vyp, vzp],
			rotTrans: matMul(getRz(primedTheta), getRy(-primedPhi)),
			scene: "scene2",
		},
	].forEach(({ velocity, rotTrans, scene }) => {
		const transArrowhead = { x: [], y: [], z: [] };
		for (let i = 0; i < baseArrowhead.x.length; ++i) {
			const coords = [baseArrowhead.x, baseArrowhead.y, baseArrowhead.z].map(
				l => l[i],
			);
			const newPoint = matMul(rotTrans, coords);

			for (let i = 0; i < 3; ++i) {
				newPoint[i] += velocity[i];
			}

			transArrowhead.x.push(newPoint[0]);
			transArrowhead.y.push(newPoint[1]);
			transArrowhead.z.push(newPoint[2]);
		}
		const i = baseArrowhead.simplices.map(s => s[0]);
		const j = baseArrowhead.simplices.map(s => s[1]);
		const k = baseArrowhead.simplices.map(s => s[2]);
		const facecolor = baseArrowhead.simplices.map(
			() => velocityVectorAttrs.line.color,
		);
		arrowheads.push({
			type: "mesh3d",
			scene,
			...transArrowhead,
			i,
			j,
			k,
			facecolor,
		});
	});

	const text = ["𝑥", "𝑦", "𝑧"];
	const primedText = text.map(t => `${t}′`);

	const zero = [0, 0];
	const line = [-1, 1];
	const axisLabelDist = 1.1;
	const perGraphData = [
		{
			x: line,
			y: zero,
			z: zero,
			...axesAttrs,
		},
		{
			x: zero,
			y: line,
			z: zero,
			...axesAttrs,
		},
		{
			x: zero,
			y: zero,
			z: line,
			...axesAttrs,
		},
	];

	const data = [
		...perGraphData.map(d => ({ scene: "scene1", ...d })),
		...perGraphData.map(d => ({ scene: "scene2", ...d })),
		...arrowheads,
	];

	data.push(
		{
			x: [axisLabelDist, 0, 0],
			y: [0, axisLabelDist, 0],
			z: [0, 0, axisLabelDist],
			text: text,
			scene: "scene1",
			...axisLabelAttrs,
		},
		{
			x: [axisLabelDist, 0, 0],
			y: [0, axisLabelDist, 0],
			z: [0, 0, axisLabelDist],
			text: primedText,
			scene: "scene2",
			...axisLabelAttrs,
		},
		{
			x: [0, vx],
			y: [0, vy],
			z: [0, vz],
			scene: "scene1",
			...velocityVectorAttrs,
		},
		{
			x: [0, vxp],
			y: [0, vyp],
			z: [0, vzp],
			scene: "scene2",
			...velocityVectorAttrs,
		},
	);
	const sceneAttrs = (() => {
		const axisAttrs = {
			showgrid: false,
			visible: false,
			showspikes: false,
		};
		const sceneAttrs = {
			xaxis: axisAttrs,
			yaxis: axisAttrs,
			zaxis: axisAttrs,
			aspectmode: "cube",
		};
		return sceneAttrs;
	})();
	const layout = {
		width: 700,
		height: 300,
		hovermode: false,
		showlegend: false,
		margin: { t: 0, b: 0, l: 0, r: 0 },
		paper_bgcolor: "black",
		scene1: {
			domain: { x: [0, 0.45], y: [0, 1] },
			...sceneAttrs,
		},
		scene2: {
			domain: { x: [0.55, 1], y: [0, 1] },
			...sceneAttrs,
		},
		text: {
			color: "#fff",
			size: 14,
		},
	};

	["scene1", "scene2"].forEach(scene => {
		if (restoreCamera) {
			const sceneName = scene === "scene1" ? "scene" : scene;
			layout[scene].camera = plotDiv._fullLayout[sceneName]._scene.getCamera();
		} else {
			layout[scene].camera = {
				up: { x: 0, y: 0, z: 1 },
				center: { x: 0, y: 0, z: 0 },
				eye: {
					x: 0.3,
					y: -1,
					z: 0.9,
				},
				projection: { type: "perspective" },
			};
		}
	});

	Plotly.react(plotDiv, data, layout, config);

	const velocities = { vx, vy, vz, vxp, vyp, vzp, vr };
	Object.entries(velocities).forEach(([k, v]) => {
		document.getElementById(`text-${k}`).innerHTML = fmtFloat(v);
	});
}

function reset() {
	update({ vx: 0, vy: 0, vz: 0, vr: 0 }, { restoreCamera: false });
}
reset();

let isRelayingOut = false;
plotDiv.on("plotly_relayout", sceneInfo => {
	if (typeof sceneInfo === "undefined" || Object.keys(sceneInfo).length === 0) {
		return;
	}
	const camera = Object.values(sceneInfo)[0];

	if (isRelayingOut) {
		return;
	}
	// console.log(sceneCam, camera);

	isRelayingOut = true;
	Promise.all(
		["scene.camera", "scene2.camera"].map(sceneCam =>
			Plotly.relayout(plotDiv, sceneCam, camera),
		),
	).then(() => (isRelayingOut = false));
});
