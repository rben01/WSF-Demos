/* global applyGraphicalObjs Complex THREE makeTextSprite enableDragToRotateCamera
makeRenderer basisCoefficient defineArrowhead psiFunction sampleFromCdf */

const WIDTH = 800;
const HEIGHT = 325;
const HEIGHT_3D = 325;

const X_MIN = -5;
const X_0 = 0;
const X_MAX = 5;
const xInterp = d3.interpolate(X_MIN, X_MAX);

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

const XP_MAX = 2.5;

const zScale3D = yScale3D;

// The time complexity of updating is O(N_MAX * N_WAVEFUNCTION_POINTS)
const N_MAX = 20;
const N_WAVEFUNCTION_POINTS = 100;

const H_BAR = 1;

const canvas = document.getElementById("plot-3D");
d3.select(canvas).attr("width", WIDTH).attr("height", HEIGHT_3D);
const scene = new THREE.Scene();
// const camera = new THREE.PerspectiveCamera(
// 	150,
// 	canvas.clientWidth / canvas.clientHeight,
// 	0.1,
// 	2000,
// );
const camera = new THREE.OrthographicCamera(
	-CAMERA_EXTENT,
	CAMERA_EXTENT,
	(CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	(-CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	-50,
	50,
);
const renderer = makeRenderer(canvas);
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

enableDragToRotateCamera({
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
	color: 0x2277ff,
	side: THREE.DoubleSide,
	transparent: false,
});

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const plot2D = d3.select("#plot-2D").attr("width", WIDTH).attr("height", HEIGHT);
const defs = plot2D.selectAll("defs").data([0]).join("defs");
defineArrowhead(defs, {
	id: "arrowhead",
	length: 18,
	width: 14,
	color: "#ccc",
});
defineArrowhead(defs, {
	id: "arrowhead-small",
	length: 14,
	width: 10.5,
	color: "#eee",
});

const xScale2D = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH - 10]);
const y2dMax = 1.5;
const yScale2D = d3.scaleLinear([-0.15, y2dMax], [HEIGHT - 25, 0]);

let currentTime = 0;
let isAnimating = false;

const sliders = {
	k: (() => {
		const slider = document.getElementById("slider-k");
		const min = 1;
		const max = 2.25;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	m: (() => {
		const slider = document.getElementById("slider-m");
		const min = 1;
		const max = 2.25;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	mu: (() => {
		const slider = document.getElementById("slider-mu");
		const [min, max] = [-XP_MAX, XP_MAX];
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	sigma: (() => {
		const slider = document.getElementById("slider-sigma");
		const mid = 0.5 ** 0.5;
		const min = mid - 0.25;
		const max = mid + 0.1;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	p: (() => {
		const slider = document.getElementById("slider-p");
		const [min, max] = [-XP_MAX, XP_MAX];
		slider.min = -XP_MAX;
		slider.max = XP_MAX;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
};

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => update(0, true));

function sliderValues() {
	const o = Object.fromEntries(
		Object.entries(sliders).map(([k, slider]) => [k, +slider.value]),
	);
	o.omega = (o.k / o.m) ** 0.5;
	return o;
}

// eslint-disable-next-line no-unused-vars
const FACTORIAL = d3.range(0, N_MAX + 1).map(n => {
	let acc = 1;
	for (let i = 1; i <= n; i++) {
		acc *= i;
	}
	return acc;
});

const COEFFS = d3.range(0, N_MAX + 1).map(() => 0);

function populateCaches({ sigma, p, m, omega, xMeasured }) {
	if (xMeasured !== undefined) {
		sigma = 0.1;
		for (let n = 0; n <= N_MAX; n++) {
			COEFFS[n] = psiFunction(n, { sigma, p, m, omega })(xMeasured);
		}
	} else {
		for (let n = 0; n <= N_MAX; n++) {
			COEFFS[n] = basisCoefficient(n, { sigma, p, m, omega });
		}
	}
}

function getAxisData() {
	const xs0 = xScale2D(X_0);
	const ys0 = yScale2D(Y_0);

	const [xMin, xMax] = xScale2D.range();
	const yMax = yScale2D.range()[1];
	const yMin = yScale2D(Y_0);

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xMin,
				x2: xMax,
				y1: ys0,
				y2: ys0,
				"marker-end": "url(#arrowhead)",
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
				y: ys0 + 10,
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
		{
			shape: "text",
			class: "axis axis-label classically-allowed-region",
			text: "Classically allowed region",
			attrs: {
				x: xScale2D(X_0),
				y: yScale2D(Y_0) + 20,
				"text-anchor": "middle",
				"dominant-baseline": "hanging",
			},
		},
	];

	return axisData;
}
applyGraphicalObjs(plot2D, getAxisData(), { selector: ".axis" });

// arr[2*i] is x_i, arr[2*i+1] is z_i
const wavefunctionPoints = d3.range(2 * N_WAVEFUNCTION_POINTS);
const cdfPoints = new Array(N_WAVEFUNCTION_POINTS);

function computeWavefunctionPoints(xMeasured) {
	const { omega, m, mu } = sliderValues();

	const t = currentTime;

	const xt = xMeasured === undefined ? mu * Math.cos(t) : xMeasured;
	const pt = -mu * Math.sin(t);

	let cummProbability = 0;
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const xNaive = xInterp(i / N_WAVEFUNCTION_POINTS);
		const x = xNaive - xt;

		let z = Complex.fromReal(0);
		for (let n = 0; n <= N_MAX; n++) {
			const energy = n + 1 / 2;
			const thisZContribution = Complex.mul(
				Complex.cis((mu ** 2 / 4) * Math.sin(2 * t) + pt),
				COEFFS[n],
				Complex.cis(-energy * t),
				psiFunction(n, { omega, m })(x),
			);
			z = z.add(thisZContribution);
		}

		wavefunctionPoints[2 * i] = xNaive;
		wavefunctionPoints[2 * i + 1] = z;

		const probability = z.magnitude ** 2;
		cummProbability += probability;
		cdfPoints[i] = [x, cummProbability];
	}

	// Normalize probability so that it sums to 1 over the region of interest
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; i++) {
		cdfPoints[i][1] /= cummProbability;
	}
}

function getWavefunctionPath3D() {
	const pathPoints = [];
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const x = wavefunctionPoints[2 * i];
		const z = wavefunctionPoints[2 * i + 1];
		pathPoints.push(
			new THREE.Vector3(xScale3D(x), yScale3D(-z.im), zScale3D(z.re)),
		);
	}
	const path = new THREE.CatmullRomCurve3(pathPoints);
	return path;
}

function makeAxisLabel(text) {
	return makeTextSprite(text, { fontface: "Times", fontsize: 20 });
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

const objs3d = { empty: true };

function update3D() {
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
			arrowhead.rotateX(Math.PI);
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
			scene.add(wave);
			objs3d.wave = { wave };
		})();
	}

	// console.log(m, sigma, p, currentTime);

	const { wave } = objs3d.wave;
	wave.geometry.dispose();
	wave.geometry = new THREE.TubeBufferGeometry(
		getWavefunctionPath3D(),
		1000,
		0.11,
		8,
	);

	renderer.render(scene, camera);
}

const line = d3.line().curve(d3.curveNatural);
function getData2D() {
	const points = [];
	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const x = wavefunctionPoints[2 * i];
		const z = wavefunctionPoints[2 * i + 1];
		points.push([xScale2D(x), yScale2D(z.magnitude ** 2)]);
	}

	const { mu, p, omega, m } = sliderValues();

	const cosT = Math.cos(currentTime);
	const sinT = Math.sin(currentTime);
	const scaleFactor = (m * omega) / H_BAR;
	const xt = (sinT * p) / scaleFactor + cosT * mu;
	const pt = (cosT * p - sinT * mu * scaleFactor) / scaleFactor;

	const xtS = xScale2D(X_0 + xt);
	const ptS = xScale2D(X_0 + xt + pt);
	const expectYMax = yScale2D(0.75 * y2dMax);

	const energy = mu ** 2 + p ** 2 / (m ** 2 * omega ** 2);
	const amplitude = energy ** 0.5;

	const y0S = yScale2D(Y_0);

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
		...[-1, 1].map(sign => {
			const x = xScale2D(sign * amplitude);
			return {
				shape: "line",
				class: "curve amplitude-line",
				attrs: {
					x1: x,
					x2: x,
					y1: y0S + 15,
					y2: yScale2D(y2dMax),
				},
			};
		}),
		{
			shape: "line",
			class: "curve expect-line",
			attrs: {
				x1: xtS,
				x2: xtS,
				y1: y0S,
				y2: expectYMax,
			},
		},
		{
			shape: "text",
			class: "curve expect-label",
			text: "⟨𝑥⟩",
			attrs: {
				x: xtS,
				y: expectYMax,
				dx: 4,
				dy: 23,
				"text-anchor": "left",
				"dominant-baseline": "top",
			},
			children: [
				{
					shape: "tspan",
					class: "expect-label expect-label-sub",
					text: "𝜓",
					attrs: {
						dx: -2,
						dy: 5,
					},
				},
			],
		},
		{
			shape: "text",
			class: "curve expect-label",
			text: "⟨𝑝⟩",
			attrs: {
				x: ptS,
				y: expectYMax,
				dx: 8,
				dy: -13,
				"text-anchor": "middle",
				"dominant-baseline": "bottom",
			},
			children: [
				{
					shape: "tspan",
					class: "expect-label expect-label-sub",
					text: "𝜓",
					attrs: {
						dx: -2,
						dy: 5,
					},
				},
			],
		},
	];

	if (Math.abs(pt) > 0.05) {
		data.push({
			shape: "line",
			class: "curve p-expect",
			attrs: {
				x1: xtS,
				x2: ptS,
				y1: expectYMax,
				y2: expectYMax,
				"marker-end": "url(#arrowhead-small)",
			},
		});
	}

	return data;
}

// eslint-disable-next-line no-unused-vars
function takeMeasurement() {
	const xMeasured = sampleFromCdf(cdfPoints)[0];

	const { omega, m, sigma, p } = sliderValues();
	populateCaches({ sigma, p, m, omega, xMeasured });
	computeWavefunctionPoints(xMeasured);

	console.log(xMeasured);
}

let isFirstRun = true;
function update(dtMS, refreshCache = false) {
	dtMS = dtMS ?? 0;

	const { omega, m, sigma, p } = sliderValues();

	const timeScale = 1;
	currentTime += (timeScale * (omega * dtMS)) / 1000;

	if (refreshCache) {
		populateCaches({
			m,
			sigma,
			p,
			omega,
		});
	}

	if (dtMS !== 0 || refreshCache || isFirstRun) {
		computeWavefunctionPoints();
		isFirstRun = false;
	}

	// const [m, sigma, p] = ["m", "sigma", "p"].map(k => +sliders[k].value);
	// populateWavefunctionPoints(m, sigma, p, currentTime);

	applyGraphicalObjs(plot2D, getData2D(), { selector: ".curve" });
	update3D();

	// if (typeof katex !== "undefined") {
	// 	katex.render(`m=${floatFormatter(m)}`, textSpans.m);
	// 	katex.render(`\\sigma=${floatFormatter(sigma)}`, textSpans.sigma);
	// 	katex.render(`p=${floatFormatter(p)}`, textSpans.p);
	// }
}

update(0, true);

let animationFrame;
// eslint-disable-next-line no-unused-vars
function play() {
	isAnimating = true;

	d3.selectAll(".slider.ic").property("disabled", true);

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
}

// eslint-disable-next-line no-unused-vars
function reset() {
	pause();
	d3.selectAll(".slider").property("disabled", false);
	currentTime = 0;
	update(0, true);
}
