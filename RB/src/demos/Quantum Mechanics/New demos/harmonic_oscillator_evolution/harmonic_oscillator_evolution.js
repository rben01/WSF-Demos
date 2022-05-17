/* global applyGraphicalObjs Complex THREE makeTextSprite enableDragToRotateCamera katex
makeRenderer innerProduct basisCoefficient */

const WIDTH = 800;
const HEIGHT = 325;
const HEIGHT_3D = 325;

const X_MIN = -10;
const X_0 = 0;
const X_MAX = 10;

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

const H_BAR = 1;

// The time complexity of updating is O(N_MAX * N_WAVEFUNCTION_POINTS)
const N_MAX = 10;
const N_WAVEFUNCTION_POINTS = 125;

// This 1D array simulates a 2D array with N_MAX+1 rows and N_WAVEFUNCTION_POINTS
// columns, where (row,col)=(n,i) contains the initial value for the n^th (0-indexed)
// term at x=x_i. In other words, arr[n*N_WF_PTS+i] is zn(x=x_i,t=0).
const initialStateCache = d3.range((N_MAX + 1) * N_WAVEFUNCTION_POINTS);

const floatFormatter = d3
	.formatLocale({ minus: "-", decimal: ".", thousands: "," })
	.format(".2f");
const textSpans = {
	m: document.getElementById("text-m"),
	sigma: document.getElementById("text-sigma"),
	p: document.getElementById("text-p"),
};

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

const xScale2D = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const y2dMax = 1.6;
const yScale2D = d3.scaleLinear([-0.15, y2dMax], [HEIGHT - 25, 0]);

let currentTime = 0;
let isAnimating = false;

const sliders = {
	m: (() => {
		const slider = document.getElementById("slider-mass");
		const min = 1;
		const max = 2;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	k: (() => {
		const slider = document.getElementById("slider-k");
		const min = 1;
		const max = 2;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	mu: (() => {
		const slider = document.getElementById("slider-mu");
		const min = 0.5 * X_MIN;
		const max = 0.5 * X_MAX;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	sigma: (() => {
		const slider = document.getElementById("slider-sigma");
		const min = 0.1;
		const max = 0.2;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
	p: (() => {
		const slider = document.getElementById("slider-p");
		const min = -5;
		const max = 5;
		slider.min = min;
		slider.max = max;
		slider.step = 0.01;
		slider.value = (min + max) / 2;

		return slider;
	})(),
};

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => update(0, true));

const COEFFS = d3.range(0, N_MAX + 1).map(() => 0);

function populateCaches({ mu, sigma, p }) {
	for (let n = 0; n <= N_MAX; n++) {
		COEFFS[n] = basisCoefficient(n, { mu, sigma, p });
	}
}

function getAxisData() {
	const tickLength = 7;

	const xAxisTicks = xScale2D.ticks(20).filter(x => x !== X_0);
	const nXAxisLabels = 5;
	const xAxisLabelTicks = xScale2D.ticks(nXAxisLabels).filter(x => x !== X_0);
	const xAxisFormatter = xScale2D.tickFormat(nXAxisLabels);

	const yAxisTicks = yScale2D.ticks(5).filter(y => y !== Y_0);
	const nYAxisLabels = 5;
	const yAxisLabelTicks = yScale2D.ticks(nYAxisLabels).filter(y => y !== Y_0);
	const yAxisFormatter = yScale2D.tickFormat(nYAxisLabels, "~g");

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
		...xAxisTicks.map(x => {
			const xs = xScale2D(x);
			return {
				shape: "line",
				class: "axis axis-tick x-axis-tick",
				attrs: {
					x1: xs,
					x2: xs,
					y1: ys0,
					y2: ys0 + tickLength,
				},
			};
		}),
		...xAxisLabelTicks.map(x => {
			const xs = xScale2D(x);
			return {
				shape: "text",
				class: "axis axis-label x-axis-label",
				text: xAxisFormatter(x),
				attrs: {
					x: xs,
					y: ys0 + 12,
				},
			};
		}),
		...yAxisTicks.map(y => {
			const ys = yScale2D(y);
			return {
				shape: "line",
				class: "axis axis-tick y-axis-tick",
				attrs: {
					x1: xs0,
					x2: xs0 - tickLength,
					y1: ys,
					y2: ys,
				},
			};
		}),
		...yAxisLabelTicks.map(y => {
			const ys = yScale2D(y);
			return {
				shape: "text",
				class: "axis axis-label y-axis-label",
				text: yAxisFormatter(y),
				attrs: {
					x: xs0 - 10,
					y: ys,
				},
			};
		}),
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
applyGraphicalObjs(plot2D, getAxisData(), { selector: ".axis" });

const PHI_FUNCTIONS = (() => {
	function getHermitePolynomial(n) {
		switch (n) {
			case 0:
				return () => 1;
			case 1:
				return x => 2 * x;
			case 2:
				return x => -2 + 4 * x ** 2;
			case 3:
				return x => -12 * x + 8 * x ** 3;
			case 4:
				return x => 12 - 48 * x ** 2 + 16 * x ** 4;
			case 5:
				return x => 120 * x - 160 * x ** 3 + 32 * x ** 5;
			case 6:
				return x => -120 + 720 * x ** 2 - 480 * x ** 4 + 64 * x ** 6;
			case 7:
				return x => -1680 * x + 3360 * x ** 3 - 1344 * x ** 5 + 128 * x ** 7;
			case 8:
				return x =>
					1680 -
					13440 * x ** 2 +
					13440 * x ** 4 -
					3584 * x ** 6 +
					256 * x ** 8;
			case 9:
				return x =>
					30240 * x -
					80640 * x ** 3 +
					48384 * x ** 5 -
					9216 * x ** 7 +
					512 * x ** 9;
			case 10:
				return x =>
					-30240 +
					302400 * x ** 2 -
					403200 * x ** 4 +
					161280 * x ** 6 -
					23040 * x ** 8 +
					1024 * x ** 10;
			case 11:
				return x =>
					-665280 * x +
					2217600 * x ** 3 -
					1774080 * x ** 5 +
					506880 * x ** 7 -
					56320 * x ** 9 +
					2048 * x ** 11;
			case 12:
				return x =>
					665280 -
					7983360 * x ** 2 +
					13305600 * x ** 4 -
					7096320 * x ** 6 +
					1520640 * x ** 8 -
					135168 * x ** 10 +
					4096 * x ** 12;
			case 13:
				return x =>
					17297280 * x -
					69189120 * x ** 3 +
					69189120 * x ** 5 -
					26357760 * x ** 7 +
					4392960 * x ** 9 -
					319488 * x ** 11 +
					8192 * x ** 13;
			case 14:
				return x =>
					-17297280 +
					242161920 * x ** 2 -
					484323840 * x ** 4 +
					322882560 * x ** 6 -
					92252160 * x ** 8 +
					12300288 * x ** 10 -
					745472 * x ** 12 +
					16384 * x ** 14;
			case 15:
				return x =>
					-518918400 * x +
					2421619200 * x ** 3 -
					2905943040 * x ** 5 +
					1383782400 * x ** 7 -
					307507200 * x ** 9 +
					33546240 * x ** 11 -
					1720320 * x ** 13 +
					32768 * x ** 15;
		}
	}

	function factorial(n) {
		let acc = 1;
		for (let i = 2; i <= n; i++) {
			acc *= i;
		}
		return acc;
	}

	const AMPLITUDE = 1;

	const arr = d3.range(0, N_MAX + 1).map(n => {
		const coef =
			AMPLITUDE *
			Math.pow(Math.PI, -0.25) *
			Math.pow(2 ** n * factorial(n), -0.5);
		const hp = getHermitePolynomial(n);
		return x => coef * hp(x) * Math.exp(x ** 2 / -2);
	});

	return arr;
})();

// arr[2*i] is x_i, arr[2*i+1] is z_i
const wavefunctionPoints = d3.range(2 * N_WAVEFUNCTION_POINTS);
function computeWavefunctionPoints() {
	const [m, k] = ["m", "k"].map(key => +sliders[key].value);

	const omega = Math.sqrt(k / m);

	const t = currentTime / omega;

	wavefunctionPoints.fill(0);

	const xInterp = d3.interpolate(X_MIN * 2, X_MAX * 2);

	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const x = xInterp(i / N_WAVEFUNCTION_POINTS) / Math.sqrt((m * omega) / H_BAR);
		let z = Complex.fromReal(0);

		for (let n = 0; n <= N_MAX; n++) {
			const energy = n + 1 / 2;
			const rot = Complex.cis(-energy * t);
			z = z.add(rot.mul(COEFFS[n], PHI_FUNCTIONS[n](x)));
		}
		wavefunctionPoints[2 * i] = x;
		wavefunctionPoints[2 * i + 1] = z;
	}
	return wavefunctionPoints;
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
	];
	return data;
}

let isFirstRun = true;
function update(dtMS, refreshCache = false) {
	dtMS = dtMS ?? 0;
	currentTime += (0.5 * dtMS) / 1000;

	const mu = +sliders.mu.value;
	const sigma = +sliders.sigma.value;
	const p = +sliders.p.value;

	if (refreshCache) {
		populateCaches({
			mu,
			sigma,
			p,
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

	d3.selectAll(".slider").property("disabled", true);

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
