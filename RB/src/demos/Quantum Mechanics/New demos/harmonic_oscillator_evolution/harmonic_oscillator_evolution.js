/* global applyGraphicalObjs Complex THREE makeTextSprite enableDragToRotateCamera
makeRenderer basisCoefficient defineArrowhead psiFunction */

const WIDTH = 800;
const HEIGHT = 325;
const HEIGHT_3D = 325;

const X_MIN = -5;
const X_0 = 0;
const X_MAX = 5;

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

function populateCaches({ sigma, p, m, omega }) {
	for (let n = 0; n <= N_MAX; n++) {
		COEFFS[n] = basisCoefficient(n, { sigma, p, m, omega });
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

// const PHI_FUNCTIONS = (() => {
// 	function getHermitePolynomial(n) {
// 		switch (n) {
// 			case 0:
// 				return () => 1;
// 			case 1:
// 				return x => 2 * x;
// 			case 2:
// 				return x => -2 + 4 * x ** 2;
// 			case 3:
// 				return x => -12 * x + 8 * x ** 3;
// 			case 4:
// 				return x => 12 - 48 * x ** 2 + 16 * x ** 4;
// 			case 5:
// 				return x => 120 * x - 160 * x ** 3 + 32 * x ** 5;
// 			case 6:
// 				return x => -120 + 720 * x ** 2 - 480 * x ** 4 + 64 * x ** 6;
// 			case 7:
// 				return x => -1680 * x + 3360 * x ** 3 - 1344 * x ** 5 + 128 * x ** 7;
// 			case 8:
// 				return x =>
// 					1680 -
// 					13440 * x ** 2 +
// 					13440 * x ** 4 -
// 					3584 * x ** 6 +
// 					256 * x ** 8;
// 			case 9:
// 				return x =>
// 					30240 * x -
// 					80640 * x ** 3 +
// 					48384 * x ** 5 -
// 					9216 * x ** 7 +
// 					512 * x ** 9;
// 			case 10:
// 				return x =>
// 					-30240 +
// 					302400 * x ** 2 -
// 					403200 * x ** 4 +
// 					161280 * x ** 6 -
// 					23040 * x ** 8 +
// 					1024 * x ** 10;
// 			case 11:
// 				return x =>
// 					-665280 * x +
// 					2217600 * x ** 3 -
// 					1774080 * x ** 5 +
// 					506880 * x ** 7 -
// 					56320 * x ** 9 +
// 					2048 * x ** 11;
// 			case 12:
// 				return x =>
// 					665280 -
// 					7983360 * x ** 2 +
// 					13305600 * x ** 4 -
// 					7096320 * x ** 6 +
// 					1520640 * x ** 8 -
// 					135168 * x ** 10 +
// 					4096 * x ** 12;
// 			case 13:
// 				return x =>
// 					17297280 * x -
// 					69189120 * x ** 3 +
// 					69189120 * x ** 5 -
// 					26357760 * x ** 7 +
// 					4392960 * x ** 9 -
// 					319488 * x ** 11 +
// 					8192 * x ** 13;
// 			case 14:
// 				return x =>
// 					-17297280 +
// 					242161920 * x ** 2 -
// 					484323840 * x ** 4 +
// 					322882560 * x ** 6 -
// 					92252160 * x ** 8 +
// 					12300288 * x ** 10 -
// 					745472 * x ** 12 +
// 					16384 * x ** 14;
// 			case 15:
// 				return x =>
// 					-518918400 * x +
// 					2421619200 * x ** 3 -
// 					2905943040 * x ** 5 +
// 					1383782400 * x ** 7 -
// 					307507200 * x ** 9 +
// 					33546240 * x ** 11 -
// 					1720320 * x ** 13 +
// 					32768 * x ** 15;
// 			case 16:
// 				return x =>
// 					518918400 -
// 					8302694400 * x ** 2 +
// 					19372953600 * x ** 4 -
// 					15498362880 * x ** 6 +
// 					5535129600 * x ** 8 -
// 					984023040 * x ** 10 +
// 					89456640 * x ** 12 -
// 					3932160 * x ** 14 +
// 					65536 * x ** 16;
// 			case 17:
// 				return x =>
// 					17643225600 * x -
// 					94097203200 * x ** 3 +
// 					131736084480 * x ** 5 -
// 					75277762560 * x ** 7 +
// 					20910489600 * x ** 9 -
// 					3041525760 * x ** 11 +
// 					233963520 * x ** 13 -
// 					8912896 * x ** 15 +
// 					131072 * x ** 17;
// 			case 18:
// 				return x =>
// 					-17643225600 +
// 					317578060800 * x ** 2 -
// 					846874828800 * x ** 4 +
// 					790416506880 * x ** 6 -
// 					338749931520 * x ** 8 +
// 					75277762560 * x ** 10 -
// 					9124577280 * x ** 12 +
// 					601620480 * x ** 14 -
// 					20054016 * x ** 16 +
// 					262144 * x ** 18;
// 			case 19:
// 				return x =>
// 					-670442572800 * x +
// 					4022655436800 * x ** 3 -
// 					6436248698880 * x ** 5 +
// 					4290832465920 * x ** 7 -
// 					1430277488640 * x ** 9 +
// 					260050452480 * x ** 11 -
// 					26671841280 * x ** 13 +
// 					1524105216 * x ** 15 -
// 					44826624 * x ** 17 +
// 					524288 * x ** 19;
// 			case 20:
// 				return x =>
// 					670442572800 -
// 					13408851456000 * x ** 2 +
// 					40226554368000 * x ** 4 -
// 					42908324659200 * x ** 6 +
// 					21454162329600 * x ** 8 -
// 					5721109954560 * x ** 10 +
// 					866834841600 * x ** 12 -
// 					76205260800 * x ** 14 +
// 					3810263040 * x ** 16 -
// 					99614720 * x ** 18 +
// 					1048576 * x ** 20;
// 			case 21:
// 				return x =>
// 					28158588057600 * x -
// 					187723920384000 * x ** 3 +
// 					337903056691200 * x ** 5 -
// 					257449947955200 * x ** 7 +
// 					100119424204800 * x ** 9 -
// 					21844238008320 * x ** 11 +
// 					2800543334400 * x ** 13 -
// 					213374730240 * x ** 15 +
// 					9413591040 * x ** 17 -
// 					220200960 * x ** 19 +
// 					2097152 * x ** 21;
// 			case 22:
// 				return x =>
// 					-28158588057600 +
// 					619488937267200 * x ** 2 -
// 					2064963124224000 * x ** 4 +
// 					2477955749068800 * x ** 6 -
// 					1415974713753600 * x ** 8 +
// 					440525466501120 * x ** 10 -
// 					80095539363840 * x ** 12 +
// 					8801707622400 * x ** 14 -
// 					586780508160 * x ** 16 +
// 					23011000320 * x ** 18 -
// 					484442112 * x ** 20 +
// 					4194304 * x ** 22;
// 			case 23:
// 				return x =>
// 					-1295295050649600 * x +
// 					9498830371430400 * x ** 3 -
// 					18997660742860800 * x ** 5 +
// 					16283709208166400 * x ** 7 -
// 					7237204092518400 * x ** 9 +
// 					1842197405368320 * x ** 11 -
// 					283414985441280 * x ** 13 +
// 					26991903375360 * x ** 15 -
// 					1587759022080 * x ** 17 +
// 					55710842880 * x ** 19 -
// 					1061158912 * x ** 21 +
// 					8388608 * x ** 23;
// 			case 24:
// 				return x =>
// 					1295295050649600 -
// 					31087081215590400 * x ** 2 +
// 					113985964457164800 * x ** 4 -
// 					151981285942886400 * x ** 6 +
// 					97702255248998400 * x ** 8 -
// 					34738579644088320 * x ** 10 +
// 					7368789621473280 * x ** 12 -
// 					971708521512960 * x ** 14 +
// 					80975710126080 * x ** 16 -
// 					4234024058880 * x ** 18 +
// 					133706022912 * x ** 20 -
// 					2315255808 * x ** 22 +
// 					16777216 * x ** 24;
// 			case 25:
// 				return x =>
// 					64764752532480000 * x -
// 					518118020259840000 * x ** 3 +
// 					1139859644571648000 * x ** 5 -
// 					1085580613877760000 * x ** 7 +
// 					542790306938880000 * x ** 9 -
// 					157902634745856000 * x ** 11 +
// 					28341498544128000 * x ** 13 -
// 					3239028405043200 * x ** 15 +
// 					238163853312000 * x ** 17 -
// 					11142168576000 * x ** 19 +
// 					318347673600 * x ** 21 -
// 					5033164800 * x ** 23 +
// 					33554432 * x ** 25;
// 		}
// 	}

// 	const AMPLITUDE = 1;

// 	const arr = d3.range(0, N_MAX + 1).map(n => {
// 		const coef =
// 			AMPLITUDE *
// 			Math.pow(Math.PI, -0.25) *
// 			Math.pow(2 ** n * FACTORIAL[n], -0.5);
// 		const hp = getHermitePolynomial(n);
// 		return x => coef * hp(x) * Math.exp(x ** 2 / -2);
// 	});

// 	return arr;
// })();

// arr[2*i] is x_i, arr[2*i+1] is z_i
const wavefunctionPoints = d3.range(2 * N_WAVEFUNCTION_POINTS);
function computeWavefunctionPoints() {
	const { omega, m, mu } = sliderValues();

	const xInterp = d3.interpolate(X_MIN, X_MAX);

	const t = currentTime * 2;

	const xt = mu * Math.cos(t);
	const pt = -mu * Math.sin(t);

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

	const energy = mu ** 2 + p ** 2 / (m ** 2 * omega ** 2);
	const amplitude = energy ** 0.5;

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
					y1: yScale2D(Y_0) + 15,
					y2: yScale2D(y2dMax),
				},
			};
		}),
	];
	return data;
}

let isFirstRun = true;
function update(dtMS, refreshCache = false) {
	dtMS = dtMS ?? 0;

	const { omega, m, mu, sigma, p } = sliderValues();

	currentTime += (omega * (0.5 * dtMS)) / 1000;

	if (refreshCache) {
		populateCaches({
			m,
			mu,
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
