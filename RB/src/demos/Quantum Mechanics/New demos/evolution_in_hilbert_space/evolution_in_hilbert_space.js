/* global THREE makeTextSprite makeThreeCameraDrag katex makeRenderer */

const WIDTH = 900;
const HEIGHT = 700;

const X_MIN = -0.5;
const X_0 = 0;
const X_MAX = 2.5;

const _AMPLITUDE = 3;
const xScale = d3.scaleLinear([0, 1], [-1, 1.8 * _AMPLITUDE]);

const L_MIN = 1;
const L_MAX = 2;

function amplitude(length) {
	return (2 / length) ** 0.5;
}

const Y_MAX = 1.1 * amplitude(L_MIN);
const Y_MIN = -Y_MAX;
const Y_0 = 0;

const yScale = d3.scaleLinear([0, 1], [0, _AMPLITUDE]);

const Z_MAX = Y_MAX;
const Z_MIN = -Z_MAX;
const Z_0 = 0;

const zScale = d3.scaleLinear([0, 1], [0, _AMPLITUDE]);

const canvas = document.getElementById("plot-3D");
d3.select(canvas).attr("width", WIDTH).attr("height", HEIGHT);
const scene = new THREE.Scene();
// const camera = new THREE.PerspectiveCamera(
// 	30,
// 	canvas.clientWidth / canvas.clientHeight,
// 	0.1,
// 	2000,
// );
const CAMERA_EXTENT = 12;
const camera = new THREE.OrthographicCamera(
	-CAMERA_EXTENT,
	CAMERA_EXTENT,
	(CAMERA_EXTENT * HEIGHT) / WIDTH,
	(-CAMERA_EXTENT * HEIGHT) / WIDTH,
	-50,
	50,
);
const renderer = makeRenderer(canvas);
renderer.setSize(WIDTH, HEIGHT);

// z will be up
scene.add(new THREE.AmbientLight(0xffffff, 0.7));
scene.add(
	(() => {
		const pointLight = new THREE.PointLight(0xffffff, 1);
		pointLight.position.set(5, 3, 20);
		return pointLight;
	})(),
);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(6.7, -5.5, 2.6);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(5, 0, 0);
const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

d3.select(canvas).call(
	makeThreeCameraDrag({
		camera,
		scene,
		renderer,
		pointOfFocus: CAMERA_POINT_OF_FOCUS,
		up: CAMERA_UP,
	}),
);

const AXIS_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xaaaaaa,
	side: THREE.DoubleSide,
	transparent: false,
});
const BARRIER_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x555555,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.6,
});
const WAVE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x2277ff,
	side: THREE.DoubleSide,
	transparent: false,
});

const sliders = {
	n: (() => {
		const slider = document.getElementById("slider-n");
		slider.min = 1;
		slider.max = 10;
		slider.step = 1;
		slider.value = 1;

		slider.oninput = function () {
			// eslint-disable-next-line no-use-before-define
			update3D();
		};

		return slider;
	})(),
	l: (() => {
		const slider = document.getElementById("slider-l");
		slider.min = L_MIN;
		slider.max = L_MAX;
		slider.step = 0.01;
		slider.value = L_MIN;

		slider.oninput = function () {
			// eslint-disable-next-line no-use-before-define
			update3D();
		};

		return slider;
	})(),
	m: (() => {
		const slider = document.getElementById("slider-m");
		slider.min = 1;
		slider.max = 2;
		slider.step = 0.01;
		slider.value = slider.min;

		slider.oninput = function () {
			const m = +this.value;
			// eslint-disable-next-line no-use-before-define
			katex.render(`m=${floatFormatter(m)}`, textSpans.m);
		};

		return slider;
	})(),
};
const textSpans = {
	n: document.getElementById("text-n"),
	l: document.getElementById("text-l"),
	m: document.getElementById("text-m"),
};

function makeAxisLabel(text) {
	return makeTextSprite(text, { fontface: "Times", fontsize: 20 });
}

let currentPhase = 0;

function getWavefunctionCurve(n, length) {
	const A = (2 / length) ** 0.5;
	const k = (n * Math.PI) / length;
	function psi(x) {
		return A * Math.sin(k * x);
	}

	const nPoints = 1000;
	const dx = (length - X_0) / (nPoints - 1);
	const points = [];
	for (let i = 0; i < nPoints; ++i) {
		const x = X_0 + i * dx;
		const y = psi(x);
		points.push(new THREE.Vector3(xScale(x), yScale(Y_0), zScale(y)));
	}

	return new THREE.CatmullRomCurve3(points);
}

function omega(n, length, m) {
	return (1e-4 / m) * (n / length) ** 2; // IRL there are other factors here (pi, hbar, ...) but they're all constant
}

const xMin = xScale(X_MIN);
const xMax = xScale(X_MAX);

const yMin = yScale(Y_MIN);
const yMax = yScale(Y_MAX);

const zMin = zScale(Z_MIN);
const zMax = zScale(Z_MAX);

const xs0 = xScale(X_0);
const ys0 = yScale(Y_0);
const zs0 = zScale(Z_0);

const floatFormatter = d3
	.formatLocale({ minus: "-", decimal: ".", thousands: "," })
	.format(",.2f");

let prevN, prevL;

const objs3d = { empty: true };
function update3D(dtMS) {
	dtMS = dtMS ?? 0;

	const arrowheadRadius = 0.25;
	const arrowheadHeight = 0.7;
	const arrowheadGeometry = new THREE.ConeBufferGeometry(
		arrowheadRadius,
		arrowheadHeight,
	);

	if (objs3d.empty) {
		objs3d.empty = false;
		const axisRadius = 0.06;

		// x axis
		(() => {
			const xAxixGeometry = new THREE.TubeBufferGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(xMin, ys0, zs0),
					new THREE.Vector3(xMax, ys0, zs0),
				),
				2,
				axisRadius,
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
			const yAxixGeometry = new THREE.TubeBufferGeometry(
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
			arrowhead.rotateX(-Math.PI);
			arrowhead.position.set(xs0, yMin, zs0);

			scene.add(yAxis, arrowhead);
		})();

		// z axis
		(() => {
			const zAxixGeometry = new THREE.TubeBufferGeometry(
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

			const yAxisLabel = makeAxisLabel("Re[𝜓]");
			yAxisLabel.position.x = xs0 + 0.2;
			yAxisLabel.position.y = ys0 + 0.2;
			yAxisLabel.position.z = zMax;
			scene.add(yAxisLabel);

			const zAxisLabel = makeAxisLabel("Im[𝜓]");
			zAxisLabel.position.x = xs0 + 0.2;
			zAxisLabel.position.y = yMin;
			zAxisLabel.position.z = zs0;
			scene.add(zAxisLabel);
		})();

		// barriers
		(() => {
			const leftBarrier = new THREE.Mesh(
				new THREE.PlaneBufferGeometry(yMax - yMin, zMax - zMin),
				BARRIER_MATERIAL,
			);
			leftBarrier.rotateY(Math.PI / 2);
			leftBarrier.position.x = xs0; // fixed at this position

			const rightBarrier = new THREE.Mesh(
				new THREE.PlaneBufferGeometry(yMax - yMin, zMax - zMin),
				BARRIER_MATERIAL,
			);
			rightBarrier.rotateY(Math.PI / 2);

			scene.add(leftBarrier, rightBarrier);

			objs3d.barriers = { leftBarrier, rightBarrier };
		})();

		// wavefunction itself
		(() => {
			const wavefunction = new THREE.Mesh(
				new THREE.BufferGeometry(),
				WAVE_MATERIAL,
			);

			scene.add(wavefunction);
			objs3d.wavefunction = { wavefunction };
		})();
	}

	const n = +sliders.n.value;
	const length = +sliders.l.value;
	const m = +sliders.m.value;

	const dPhase = omega(n, length, m) * dtMS;
	currentPhase += dPhase;

	const { rightBarrier } = objs3d.barriers;
	rightBarrier.position.x = xScale(length);

	const { wavefunction } = objs3d.wavefunction;
	if (n !== prevN || length !== prevL) {
		wavefunction.geometry.dispose();
		wavefunction.geometry = new THREE.TubeBufferGeometry(
			getWavefunctionCurve(n, length, currentPhase),
			1000,
			0.08,
			20,
		);
	}
	wavefunction.setRotationFromAxisAngle(new THREE.Vector3(1, 0, 0), currentPhase);

	if (typeof katex !== "undefined") {
		katex.render(`n=${n}`, textSpans.n);
		katex.render(`L=${floatFormatter(length)}`, textSpans.l);
		katex.render(`m=${floatFormatter(m)}`, textSpans.m);
	}

	renderer.render(scene, camera);

	prevN = n;
	prevL = length;
}

update3D();

let isPlaying = false;
// eslint-disable-next-line no-unused-vars
function play() {
	isPlaying = true;
	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		update3D(elapsedMS);

		if (isPlaying) {
			window.requestAnimationFrame(step);
		}
	}
	window.requestAnimationFrame(step);
}

function pause() {
	isPlaying = false;
}

// eslint-disable-next-line no-unused-vars
function reset() {
	pause();
	currentPhase = 0;
	update3D();
}
