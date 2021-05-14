/* global applyGraphicalObjs Complex THREE makeTextSprite enableDragToRotateCamera katex makeRenderer innerProduct */
const WIDTH = 800;
const HEIGHT = 325;
const HEIGHT_3D = 325;

const X_MIN = -1;
const X_0 = 0;
const X_MAX = 9;

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
const N_MAX = 300;
const N_WAVEFUNCTION_POINTS = 125;

// This 1D array simulates a 2D array with N_MAX rows and N_WAVEFUNCTION_POINTS columns,
// where (row,col)=(n-1,i) contains the initial value for the n^th term at x=x_i. In
// other words, arr[(n-1)*N_WF_PTS+i] is zn(x=x_i,t=0). Note that the n-1 business is because
// n starts at 1 but arrays start at 0
const initialStateCache = d3.range(N_MAX * N_WAVEFUNCTION_POINTS).map(() => null);

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
const y2dMax = 2.25;
const yScale2D = d3.scaleLinear([-0.15, y2dMax], [HEIGHT - 25, 0]);

let currentLength = 6;
let currentMass = 0.75;
let currentTime = 0;
let isAnimating = false;

const sliders = {
	L: (() => {
		const slider = document.getElementById("slider-L");
		slider.min = 4;
		slider.max = X_MAX - 1;
		slider.step = 0.01;
		slider.value = currentLength;

		return slider;
	})(),
	// x0: (() => {
	// 	const slider = document.getElementById("slider-x0");
	// 	slider.min = 0.5;
	// 	slider.max = 1.5;
	// 	slider.step = 0.01;
	// 	slider.value = 1;

	// 	return slider;
	// })(),
	m: (() => {
		const slider = document.getElementById("slider-m");
		slider.min = 0.5;
		slider.max = 1;
		slider.step = 0.01;
		slider.value = currentMass;

		return slider;
	})(),
	sigma: (() => {
		const slider = document.getElementById("slider-sigma");
		slider.min = 0.3;
		slider.max = 0.5;
		slider.step = 0.01;
		slider.value = (slider.min + slider.max) / 2;

		return slider;
	})(),
	p0: (() => {
		const slider = document.getElementById("slider-p0");
		slider.min = -3;
		slider.max = 3;
		slider.step = 0.01;
		slider.value = 0;

		return slider;
	})(),
};

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => update(0, true));

function populateCaches({ L, _m, theta, mu, sigma }) {
	const ns = d3.range(1, N_MAX + 1);

	const normCoeff = Math.sqrt(2 / L);
	const psis = ns.map(n => {
		const k = (n * Math.PI) / L;
		return x => normCoeff * Math.sin(k * x);
	});

	const cns = ns.map(n => {
		const psi = psis[n - 1];
		return innerProduct(
			x => psi(x) * Math.exp(-0.5 * ((x - mu) / sigma) ** 2),
			x => Complex.fromPolar(1, theta * (x - mu)),
			{ fIsComplex: false, xMin: 0, xMax: L, nPoints: 1000 },
		);
	});
	const cnNorm =
		cns
			.map(cn => cn.magnitude ** 2)
			// Place the small numbers at the front for slightly more accurate
			// summation; THIS MUST FOLLOW .MAP OR ELSE IT WILL OPERATE IN PLACE
			.reverse()
			.reduce((a, b) => a + b) ** 0.5;
	for (let i = 0; i < N_MAX; ++i) {
		cns[i] = cns[i].div(cnNorm);
	}

	const dx = L / (N_WAVEFUNCTION_POINTS - 1);
	for (let n = 1; n <= N_MAX; ++n) {
		const psi = psis[n - 1];
		const cn = cns[n - 1];
		for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
			const x = i * dx;
			const z0_nx = cn.mul(psi(x));

			initialStateCache[(n - 1) * N_WAVEFUNCTION_POINTS + i] = z0_nx;
		}
	}
}

function getAxisData({ L } = {}) {
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

// arr[2*i] is x_i, arr[2*i+1] is z_i
const wavefunctionPoints = d3.range(2 * N_WAVEFUNCTION_POINTS).map(() => null);
function computeWavefunctionPoints() {
	const t = currentTime;

	const L = currentLength;
	const m = currentMass;

	const dx = L / (N_WAVEFUNCTION_POINTS - 1);

	const baseEnergyTerm = (t * (Math.PI / L) ** 2) / (2 * H_BAR * m);

	for (let i = 0; i < N_WAVEFUNCTION_POINTS; ++i) {
		const zs = [];

		const x = i * dx;
		wavefunctionPoints[2 * i] = x;

		// Trick to keep the magnitude of angles small: e^{in^2} =
		// e^{i(n-1)^2}*(e^{i*(2n-1)}). So we track e^{i(n-1)^2} (from the previous loop
		// iteration) and then multiply it by smallish numbers. So, since we want
		// e^{-i*n^2*b} where b is baseEnergyTerm, we compute e^{in^2} as just
		// described, and then (e^{in^2})^(-b)
		let energyNSqExpTerm = Complex.fromPolar(1, 0);
		for (let n = 1; n <= N_MAX; ++n) {
			energyNSqExpTerm = Complex.prod([
				energyNSqExpTerm,
				Complex.fromPolar(1, 2 * n - 1),
			]);
			const zn0 = initialStateCache[(n - 1) * N_WAVEFUNCTION_POINTS + i];
			const energyExpTerm = energyNSqExpTerm.pow(-baseEnergyTerm);
			// if (i === 17 && n === 5) {
			// 	console.log(
			// 		energyNSqExpTerm,
			// 		Complex.fromPolar(1, n).pow(2),
			// 		Complex.fromPolar(1, -1),
			// 	);
			// }
			zs.push(Complex.prod([zn0, energyExpTerm]));
		}

		wavefunctionPoints[2 * i + 1] = Complex.sum(zs);
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

	const barrierX = xScale2D(currentLength);

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

let isFirstRun = true;
function update(dtMS, refreshCache = false) {
	dtMS = dtMS ?? 0;
	currentTime += (0.5 * dtMS) / 1000;

	const L = +sliders.L.value;
	const m = +sliders.m.value;
	currentLength = L;
	currentMass = m;

	if (refreshCache) {
		populateCaches({
			L,
			m,
			theta: +sliders.p0.value,
			mu: 2,
			// mu: +sliders.x0.value,
			sigma: +sliders.sigma.value,
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
