import { memory } from "particle_in_a_box/demo_bg.wasm";
import * as wasm from "particle_in_a_box";
import * as utils from "common/utils";
import * as three_utils from "common/three_utils";

import * as d3 from "d3";
import { range } from "d3-array";
import * as THREE from "three";

import katex from "katex";
import renderMathInElement from "katex/contrib/auto-render";

import "common/qm_demo.css";
import "./style.css";

const WIDTH = 800;
const HEIGHT = 325;
const HEIGHT_3D = 325;

const X_MIN = -1;
const X_0 = 0;
const X_MAX = 80;

const CAMERA_EXTENT = 11;
const xScale3D = d3.scaleLinear(
	[X_MIN, X_MAX],
	[-CAMERA_EXTENT * 0.95, CAMERA_EXTENT * 0.95],
);

const Y_MAX = 1.1;
const Y_0 = 0;
const Y_MIN = -Y_MAX;

const yScale3D = d3.scaleLinear([0, 1], [0, 3]);

const Z_MAX = Y_MAX;
const Z_0 = 0;
const Z_MIN = -Z_MAX;

const zScale3D = yScale3D;

const N_WAVEFUNCTION_POINTS = 250;
let eigen_computer;
let xs;
let wf;
let Psi_t;

const canvas = document.getElementById("plot-3D") as HTMLCanvasElement;
d3.select(canvas).attr("width", WIDTH).attr("height", HEIGHT_3D);
const scene = new THREE.Scene();
const camera = new THREE.OrthographicCamera(
	-CAMERA_EXTENT,
	CAMERA_EXTENT,
	(CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	(-CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	-50,
	50,
);
const renderer = three_utils.makeRenderer(canvas);
renderer.setSize(WIDTH, HEIGHT_3D);

// z will be up
scene.add(new THREE.AmbientLight(0xffffff, 0.7));
scene.add(
	(() => {
		const pointLight = new THREE.PointLight(0xffffff, 1);
		pointLight.position.set(0, -3, 20);
		return pointLight;
	})(),
);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(1.4, -5.7, 2.2);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const CAMERA_UP = new THREE.Vector3(0, 0, 1);

three_utils.enableDragToRotateCamera({
	canvas,
	camera,
	scene,
	renderer,
	pointOfFocus: CAMERA_POINT_OF_FOCUS,
	up: CAMERA_UP,
});

const AXIS_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xaaaaaa,
	side: THREE.DoubleSide,
	transparent: false,
});
const WAVE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x3366ff,
	side: THREE.DoubleSide,
	transparent: false,
});
const SHADOW_MATERIAL = new THREE.LineBasicMaterial({
	color: 0x5599ff,
	linewidth: 3,
	// side: THREE.DoubleSide,
	// transparent: false,
});

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const plot2D = d3.select("#plot-2D").attr("width", WIDTH).attr("height", HEIGHT);

const xScale2D = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH - 10]);
const y2dMax = 0.25;
const yScale2D = d3.scaleLinear([-0.04, y2dMax], [HEIGHT - 25, 0]);

let isAnimating = false;

const buttons = Object.fromEntries(
	["play", "pause", "reset", "more-coefs"].map(name => [
		name,
		document.getElementById(`btn-${name}`),
	]),
) as {
	play: HTMLInputElement;
	pause: HTMLInputElement;
	reset: HTMLInputElement;
	"more-coefs": HTMLInputElement;
};

function makeSlider(
	id: string,
	min: number,
	max: number,
	step?: number,
	value?: number,
): HTMLInputElement {
	step ??= 0.01;
	value ??= (min + max) / 2;

	const slider = document.getElementById(id) as HTMLInputElement;
	slider.step = step.toString();
	slider.min = min.toString();
	slider.max = max.toString();
	slider.value = value.toString();
	return slider;
}

const sliders = {
	L: makeSlider("slider-L", 20, X_MAX - 1),
	m: makeSlider("slider-m", 1, 5),
	sigma: makeSlider("slider-sigma", 0.05, 0.1, 0.001),
	p0: makeSlider("slider-p0", -3, 3),
};

function getParams() {
	const [L, m, sigma, p0] = ["L", "m", "sigma", "p0"].map(k => +sliders[k].value);
	return wasm.Parameters.new(L, L / 2, p0, sigma * L, m);
}

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => {
	// eslint-disable-next-line no-use-before-define
	initialize();
	// eslint-disable-next-line no-use-before-define
	update(0, true);
});

function getAxisData() {
	const xs0 = xScale2D(X_0);
	const ys0 = yScale2D(Y_0);

	const [xMin, xMax] = xScale2D.range();
	const [yMin, yMax] = yScale2D.range();

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xMin,
				x2: xMax,
				y1: ys0,
				y2: ys0,
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: yMin,
				y2: yMax,
			},
		},
		{
			shape: "text",
			class: "axis axis-label x-axis-label axis-name x-axis-name",
			text: "𝑥",
			attrs: {
				x: xScale2D.range()[1] - 40,
				y: ys0 + 20,
			},
		},
		{
			shape: "text",
			class: "axis axis-label axis-name",
			text: "|𝜓|²",
			attrs: {
				x: xs0 + 60,
				y: yScale2D.range()[1] + 5,
				"text-anchor": "end",
				"dominant-baseline": "hanging",
			},
		},
	];

	return axisData;
}
utils.applyGraphicalObjs(plot2D, getAxisData(), { selector: ".axis" });

function getWavefunctionPath3D() {
	const pathPoints: THREE.Vector3[] = [];
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const x = xs[i];
		const re = Psi_t[2 * i];
		const im = Psi_t[2 * i + 1];

		pathPoints.push(new THREE.Vector3(xScale3D(x), yScale3D(-im), zScale3D(re)));
	}
	return pathPoints;
}

function makeAxisLabel(text) {
	return three_utils.makeTextSprite(text, { fontface: "Times", fontsize: 20 });
}

const xMin = xScale3D(X_MIN);
const xs0 = xScale3D(X_0);
const xMax = xScale3D(X_MAX);

const yMin = yScale3D(Y_MIN);
const ys0 = yScale3D(Y_0);
const yMax = yScale3D(Y_MAX);

const zMin = zScale3D(Z_MIN);
const zs0 = zScale3D(Z_0);
const zMax = zScale3D(Z_MAX);

const objs3d: {
	empty: boolean;
	wave?: {
		wave: THREE.Mesh;
		yzShadow: THREE.Mesh;
		xzShadow: THREE.Mesh;
		xyShadow: THREE.Mesh;
	};
} = {
	empty: true,
};

function update3D() {
	const arrowheadRadius = 0.25;
	const arrowheadHeight = 0.7;
	const arrowheadGeometry = new THREE.ConeGeometry(arrowheadRadius, arrowheadHeight);

	if (objs3d.empty) {
		objs3d.empty = false;
		const axisRadius = 0.06;

		// x axis
		(() => {
			const xAxixGeometry = new THREE.TubeGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(xMin, ys0, zs0),
					new THREE.Vector3(xMax, ys0, zs0),
				),
				64,
				axisRadius * 1.2,
				8,
			);
			const xAxis = new THREE.Mesh(xAxixGeometry, AXIS_MATERIAL);

			// arrowhead rotation code from https://stackoverflow.com/a/11060965
			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			arrowhead.rotateZ(-Math.PI / 2);
			arrowhead.position.set(xMax, ys0, zs0);

			scene.add(xAxis, arrowhead);
		})();

		// y axis
		(() => {
			const yAxixGeometry = new THREE.TubeGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(xs0, yMin, zs0),
					new THREE.Vector3(xs0, yMax, zs0),
				),
				64,
				axisRadius,
				8,
			);
			const yAxis = new THREE.Mesh(yAxixGeometry, AXIS_MATERIAL);

			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			arrowhead.rotateX(Math.PI);
			arrowhead.position.set(xs0, yMin, zs0);

			scene.add(yAxis, arrowhead);
		})();

		// z axis
		(() => {
			const zAxixGeometry = new THREE.TubeGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(xs0, ys0, zMin),
					new THREE.Vector3(xs0, ys0, zMax),
				),
				64,
				axisRadius,
				8,
			);
			const zAxis = new THREE.Mesh(zAxixGeometry, AXIS_MATERIAL);

			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			arrowhead.rotateX(Math.PI / 2);
			arrowhead.position.set(xs0, ys0, zMax);

			scene.add(zAxis, arrowhead);
		})();

		// axis labels
		(() => {
			const xAxisLabel = makeAxisLabel("𝑥");
			xAxisLabel.position.x = xMax;
			xAxisLabel.position.y = ys0;
			xAxisLabel.position.z = zs0;
			scene.add(xAxisLabel);

			const yAxisLabel = makeAxisLabel("Im[𝜓]");
			yAxisLabel.position.x = xs0;
			yAxisLabel.position.y = yMin - 0.1;
			yAxisLabel.position.z = -0.2;
			scene.add(yAxisLabel);

			const zAxisLabel = makeAxisLabel("Re[𝜓]");
			zAxisLabel.position.x = xs0 + 0.1;
			zAxisLabel.position.y = ys0 + 0.2;
			zAxisLabel.position.z = zMax;
			scene.add(zAxisLabel);
		})();

		// wave template geometry
		(() => {
			const wave = new THREE.Mesh(new THREE.BufferGeometry(), WAVE_MATERIAL);
			const [yzShadow, xzShadow, xyShadow] = d3.range(3).map(() => {
				const mesh = new THREE.Mesh(
					new THREE.BufferGeometry(),
					SHADOW_MATERIAL,
				);
				mesh.visible = false;
				return mesh;
			});

			scene.add(wave, yzShadow, xzShadow, xyShadow);

			objs3d.wave = { wave, yzShadow, xzShadow, xyShadow };
		})();
	}

	const { wave, yzShadow, xzShadow, xyShadow } = objs3d.wave;

	const wfPathPoints = getWavefunctionPath3D();

	const wavePath = new THREE.CatmullRomCurve3(wfPathPoints);
	const shadowDistance = 0.9;
	const yzShadowPath = new THREE.CatmullRomCurve3(
		wfPathPoints.map(vec => new THREE.Vector3(xScale3D(X_0), vec.y, vec.z)),
	);
	const xzShadowPath = new THREE.CatmullRomCurve3(
		wfPathPoints.map(
			vec => new THREE.Vector3(vec.x, yScale3D(shadowDistance), vec.z),
		),
	);
	const xyShadowPath = new THREE.CatmullRomCurve3(
		wfPathPoints.map(
			vec => new THREE.Vector3(vec.x, vec.y, yScale3D(-shadowDistance)),
		),
	);

	const shadowRadius = 0.025;
	const shadowRadiusSegments = 4;
	const objPaths = [
		{ obj: wave, path: wavePath, radius: 0.1, radiusSegments: 8 },
		{
			obj: yzShadow,
			path: yzShadowPath,
			radius: shadowRadius,
			radiusSegments: shadowRadiusSegments,
		},
		{
			obj: xzShadow,
			path: xzShadowPath,
			radius: shadowRadius,
			radiusSegments: shadowRadiusSegments,
		},
		{
			obj: xyShadow,
			path: xyShadowPath,
			radius: shadowRadius,
			radiusSegments: shadowRadiusSegments,
		},
	];

	for (const { obj, path, radius, radiusSegments } of objPaths) {
		obj.geometry.dispose();
		obj.geometry = new THREE.TubeGeometry(path, 500, radius, radiusSegments);
	}

	renderer.render(scene, camera);
}

const line = d3.line().curve(d3.curveNatural);
function getData2D() {
	const points = [];
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const x = xs[i];

		const re = Psi_t[2 * i];
		const im = Psi_t[2 * i + 1];
		const abs2 = re ** 2 + im ** 2;

		points.push([xScale2D(x), yScale2D(abs2)]);
	}

	const barrierX = xScale2D(+sliders.L.value);

	const data = [
		{
			shape: "path",
			class: "curve curve-background",
			attrs: {
				d: line(points),
			},
		},
		{
			shape: "path",
			class: "curve curve-foreground",
			attrs: {
				d: line(points),
			},
		},
		{
			shape: "line",
			class: "curve barrier",
			attrs: {
				x1: barrierX,
				x2: barrierX,
				y1: yScale2D(0),
				y2: yScale2D(y2dMax),
			},
		},
	];
	return data;
}

function setShadowVisibility(visible: boolean) {
	console.log(objs3d);

	if (objs3d.wave === undefined) {
		return;
	}

	const { yzShadow, xzShadow, xyShadow } = objs3d.wave;
	for (const shadow of [yzShadow, xzShadow, xyShadow]) {
		if (shadow) {
			shadow.visible = visible;
		}
	}

	renderer.render(scene, camera);
}

function initialize() {
	const params = getParams();
	const L = params.get_L();
	eigen_computer = wasm.WavefunctionInitialConditionsComputer.new(params);
	xs = range(N_WAVEFUNCTION_POINTS).map(i => (i * L) / (N_WAVEFUNCTION_POINTS - 1));

	document.getElementById(
		"btn-more-coefs",
	).innerText = `Compute ${nCoefficientsPerStepStr}  more coefficients`;

	katex.render(String.raw`n=0`, document.getElementById("n-max"));
	katex.render(
		String.raw`\sum_{i=1}^n |c_i|^2=0`,
		document.getElementById("cn-sq-sum"),
	);

	buttons.play.disabled = true;

	setShadowVisibility(false);
}

const formatter = d3.format(".2~e");
function getEigenSqSumLatex() {
	const eigenSum = eigen_computer.eigen_coef_sq_sum();

	if (eigenSum >= 1) {
		return String.raw`\sum_{i=1}^n |c_i|^2\approx 1`;
	}

	const oneMinusSqSumCnStrD3 = formatter(1 - eigenSum);
	const [_match, sig, _expUnicode] = oneMinusSqSumCnStrD3.match(/^([\d.]+)e(.*)$/i);
	const exp = _expUnicode.replace("−", "-"); // minus sign to hyphen

	const subtract = `${sig}\\times 10^{${exp}}`;

	return String.raw`\sum_{i=1}^n |c_i|^2= 1-${subtract}`;
}

const nCoefficientsPerStep = 250;
const nCoefficientsPerStepStr = d3.format(",~d")(nCoefficientsPerStep);
// eslint-disable-next-line @typescript-eslint/no-unused-vars
function step_compute() {
	const moreCoefsButton = buttons["more-coefs"];
	moreCoefsButton.disabled = true;
	moreCoefsButton.innerText = `Computing ${nCoefficientsPerStepStr} more coefficients...`;

	setTimeout(() => {
		eigen_computer.step_compute(nCoefficientsPerStep);

		// eslint-disable-next-line no-use-before-define
		update(0, true);

		const n_max = eigen_computer.n_max();
		katex.render(`n=${n_max}`, document.getElementById("n-max"));

		katex.render(getEigenSqSumLatex(), document.getElementById("cn-sq-sum"));

		moreCoefsButton.innerText = `Compute ${nCoefficientsPerStepStr} more coefficients`;
		moreCoefsButton.disabled = false;

		buttons.play.disabled = false;
		setShadowVisibility(true);
	}, 100);
}

function update(dtMS?: number, should_initialize = false) {
	dtMS = dtMS ?? 0;

	if (should_initialize) {
		wf = wasm.Wavefunction.new(eigen_computer.clone_(), xs);
		Psi_t = new Float64Array(memory.buffer, wf.psi_t_ptr(), wf.buffer_len());
	} else {
		wf.tick((20 * dtMS) / 1000);
	}

	utils.applyGraphicalObjs(plot2D, getData2D(), { selector: ".curve" });
	update3D();
}

let animationFrame;
// eslint-disable-next-line no-unused-vars
function play() {
	isAnimating = true;

	d3.selectAll(".slider").property("disabled", true);

	buttons.play.disabled = true;
	buttons.pause.disabled = false;
	buttons.reset.disabled = false;
	buttons["more-coefs"].disabled = true;

	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		update(elapsedMS);

		if (isAnimating) {
			animationFrame = window.requestAnimationFrame(step);
		}
	}

	animationFrame = window.requestAnimationFrame(step);
}

function pause() {
	window.cancelAnimationFrame(animationFrame);
	isAnimating = false;
	buttons.play.disabled = false;
	buttons.pause.disabled = true;
	buttons.reset.disabled = false;
}

// eslint-disable-next-line no-unused-vars
function reset() {
	pause();
	d3.selectAll(".slider").property("disabled", false);
	wf.set_t(0);
	update(0, false);

	buttons.play.disabled = false;
	buttons.pause.disabled = true;
	buttons.reset.disabled = true;
	buttons["more-coefs"].disabled = false;
}

initialize();
update(0, true);

for (const pair of [
	["play", play],
	["pause", pause],
	["reset", reset],
	["more-coefs", step_compute],
]) {
	const [name, func] = pair as [string, () => void];
	d3.select(buttons[name]).on("click", func);
}

renderMathInElement(document.body);

export const EXPORTS = {
	update,
	initialize,
	step_compute,
	play,
	pause,
	reset,
	get_wf() {
		return wf;
	},
	get_Psi_t() {
		return Psi_t;
	},
};

for (const [key, val] of Object.entries(EXPORTS)) {
	window[key] = val;
}
