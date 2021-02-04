/* global Complex THREE makeTextSprite enableDragToRotateCamera katex matMul */
const WIDTH = 800;
const HEIGHT_3D = 700;

const X_MAX = 32.2;
const X_0 = 0;
const X_MIN = -X_MAX;

const xScale3D = d3.scaleLinear([0, 4], [0, 1]);

const Y_MAX = X_MAX;
const Y_0 = 0;
const Y_MIN = -Y_MAX;

const yScale3D = xScale3D;

const Z_MAX = 1;
const Z_0 = 0;
const Z_MIN = -Z_MAX;

const zScale3D = d3.scaleLinear([0, 1], [0, 7]);

const H_BAR = 1;

const floatFormatter = d3
	.formatLocale({ minus: "-", decimal: ".", thousands: "," })
	.format(".2f");
const textSpans = {
	m: document.getElementById("text-m"),
	sigmaX: document.getElementById("text-sigma-x"),
	sigmaY: document.getElementById("text-sigma-y"),
	sigmaCorr: document.getElementById("text-sigma-corr"),
	px: document.getElementById("text-p-x"),
	py: document.getElementById("text-p-y"),
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
const CAMERA_EXTENT = 11;
const camera = new THREE.OrthographicCamera(
	-CAMERA_EXTENT,
	CAMERA_EXTENT,
	(CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	(-CAMERA_EXTENT * HEIGHT_3D) / WIDTH,
	-50,
	50,
);
const renderer = new THREE.WebGLRenderer({
	canvas: canvas,
	antialias: true,
	powerPreference: "high-performance",
});
renderer.localClippingEnabled = false;
renderer.setPixelRatio(window.devicePixelRatio);

canvas.width = canvas.clientWidth * window.devicePixelRatio;
canvas.height = canvas.clientHeight * window.devicePixelRatio;
renderer.setSize(WIDTH, HEIGHT_3D);

// z will be up
scene.add(new THREE.AmbientLight(0xffffff, 0.7));
scene.add(
	(() => {
		const pointLight = new THREE.PointLight(0xffffff, 1);
		pointLight.position.set(2, -3, 5);
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

let currentTime = 0;
let isAnimating = false;

const MIN_SIGMA = 0.5;
const MAX_SIGMA = 2;
const DEFAULT_SIGMA = 1;
const MIN_P = -3;
const MAX_P = 3;
const DEFAULT_P = 0;

const sliders = {
	m: (() => {
		const slider = document.getElementById("slider-m");
		slider.min = 1;
		slider.max = 2;
		slider.step = 0.01;
		slider.value = slider.min;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(`m=${floatFormatter(+this.value)}`, textSpans.m);
			}
		};

		return slider;
	})(),
	sigmaX: (() => {
		const slider = document.getElementById("slider-sigma-x");
		slider.min = MIN_SIGMA;
		slider.max = MAX_SIGMA;
		slider.step = 0.01;
		slider.value = 0.7;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(
					`\\sigma_x=${floatFormatter(+this.value)}`,
					textSpans.sigmaX,
				);
			}
		};

		return slider;
	})(),
	sigmaY: (() => {
		const slider = document.getElementById("slider-sigma-y");
		slider.min = MIN_SIGMA;
		slider.max = MAX_SIGMA;
		slider.step = 0.01;
		slider.value = 1.3;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(
					`\\sigma_y=${floatFormatter(this.value)}`,
					textSpans.sigmaY,
				);
			}
		};

		return slider;
	})(),
	sigmaCorr: (() => {
		const slider = document.getElementById("slider-sigma-corr");
		slider.min = -0.75;
		slider.max = 0.75;
		slider.step = 0.01;
		slider.value = 0.3;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(
					`\\rho=${floatFormatter(+this.value)}`,
					textSpans.sigmaCorr,
				);
			}
		};

		return slider;
	})(),
	px: (() => {
		const slider = document.getElementById("slider-p-x");
		slider.min = MIN_P;
		slider.max = MAX_P;
		slider.step = 0.01;
		slider.value = -1;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(`p_x=${floatFormatter(+this.value)}`, textSpans.px);
			}
		};

		return slider;
	})(),
	py: (() => {
		const slider = document.getElementById("slider-p-y");
		slider.min = MIN_P;
		slider.max = MAX_P;
		slider.step = 0.01;
		slider.value = 1;

		slider.oninput = function () {
			if (typeof katex !== "undefined") {
				katex.render(`p_y=${floatFormatter(+this.value)}`, textSpans.py);
			}
		};

		return slider;
	})(),
};

// eslint-disable-next-line no-use-before-define
d3.selectAll(".slider").on("input", () => update());

function det2By2Mat(mat) {
	const a = mat[0][0];
	const b = mat[0][1];
	const c = mat[1][0];
	const d = mat[1][1];
	return a * d - b * c;
}

function inv2By2Mat(mat) {
	const det = det2By2Mat(mat);
	return mat.map(row => row.map(x => x / det));
}

function dotProd2(v1, v2) {
	return v1[0] * v2[0] + v1[1] * v2[1];
}

const X_MIN_LINE = Line2D.fromConstantX(X_MIN);
const X_MAX_LINE = Line2D.fromConstantX(X_MAX);
const Y_MIN_LINE = Line2D.fromConstantY(Y_MIN);
const Y_MAX_LINE = Line2D.fromConstantY(Y_MAX);

function getWavefunctionFunction(kx, ky, mode) {
	const uSlope = ky / kx;
	const uLine = Line2D.fromPointSlopeForm(X_0, Y_0, uSlope);
	const vSlope = -1 / uSlope;

	const [cornerLines1, cornerLines2] =
		uSlope > 0
			? [
					[X_MIN_LINE, Y_MAX_LINE], // Intersection toward top left
					[X_MAX_LINE, Y_MIN_LINE], // Intersection toward bottom right
			  ]
			: [
					[X_MIN_LINE, Y_MIN_LINE], // Intersection toward bottom left
					[X_MAX_LINE, Y_MAX_LINE], // Intersection toward top right
			  ];

	const boundingVLine1 = Line2D.fromPointSlopeForm(
		X_MIN,
		uSlope > 0 ? Y_MIN : Y_MAX,
		vSlope,
	);
	const boundingVLine2 = Line2D.fromPointSlopeForm(
		X_MAX,
		uSlope > 0 ? Y_MAX : Y_MIN,
		vSlope,
	);

	const uLineEndpoint1 = uLine.intersectionWith(boundingVLine1);
	const uLineEndpoint2 = uLine.intersectionWith(boundingVLine2);

	function wavefunctionValue(u, v, vec) {
		// We want to design this so that u moves perpendicular to the waveform (against
		// the grain, so to speak) and v moves parallel (with the grain) while keeping
		// all points within the region [X_MIN, X_MAX] * [Y_MIN, Y_MAX]. The line which
		// u varies along will be y = Y_0 + m * (x - X_0) (i.e., the line of slope m
		// passing through (X_0, Y_0)) where m is the slope of the line that goes
		// against the grain, except if kx === 0 or ky === 0. Note that this u-line must
		// extend beyond the bounds of the box so that the v-line can cover the whole
		// box

		// The components of the vector we'll return
		let x, y;

		// The simple cases, where the line is degenerate (surface is a flat plane),
		// vertical (kx === 0), or horizontal (ky === 0), require some care because the
		// intersections we would otherwise use won't exist. Thankfully these cases are
		// trivial.
		if (kx === 0 || ky === 0) {
			let xVar, yVar;
			if (ky === 0) {
				// Either the degenerate case (if kx === 0) or the horizontal case (if kx
				// !== 0)
				xVar = u;
				yVar = v;
			} else {
				// the vertical case
				xVar = v;
				yVar = u;
			}
			x = X_MIN + xVar * (X_MAX - X_MIN);
			y = Y_MIN + yVar * (Y_MAX - Y_MIN);
		} else {
			// If kx !== 0 and ky !== 0 then we can actually do this the "right" (i.e.,
			// hard) way

			const [uvIntersectionPointX, uvIntersectionPointY] = d3.interpolate(
				uLineEndpoint1,
				uLineEndpoint2,
			)(u);

			const vLine = Line2D.fromPointSlopeForm(
				uvIntersectionPointX,
				uvIntersectionPointY,
				vSlope,
			);

			const [p1, p2] = [cornerLines1, cornerLines2].map(linePair => {
				const [d1, d2] = linePair.map(line => {
					const point = line.intersectionWith(vLine);
					const sqDist =
						(point[0] - uvIntersectionPointX) ** 2 +
						(point[1] - uvIntersectionPointY) ** 2;
					return { sqDist, point };
				});

				return d1.sqDist < d2.sqDist ? d1.point : d2.point;
			});

			[x, y] = d3.interpolateArray(p1, p2)(v);
		}

		const zC = psi(x, y, kx, ky, currentOmega);
		let z;
		if (mode === MODES.real) {
			z = zC.re;
		} else if (mode === MODES.imag) {
			z = zC.im;
		}

		return vec.set(xScale3D(x), yScale3D(y), z * 1.1);
	}

	return wavefunctionValue;
}

function getWavefunctionFunction(m, covarianceMat, pVec, t) {
	const xMin = X_MIN;
	const xMax = X_MAX;
	const yMin = Y_MIN;
	const yMax = Y_MAX;

	// Page 9 of this:
	// https://www.reed.edu/physics/faculty/wheeler/documents/Quantum%20Mechanics/Miscellaneous%20Essays/Gaussian%20Wavepackets.pdf
	// Replacing sigma with sqrt(detCov), x^2/sigma^2 with x^T * sigma * x, and v1 * v2 with <v1, v2>
	// A variable name ends in an underscore <==> it's complex
	const detCov = det2By2Mat(covarianceMat);
	// console.log({ detCov, rootDetCov });
	const covMatInv = inv2By2Mat(covarianceMat);

	const tau = (2 * m * detCov) / H_BAR;
	const timeFactor_ = Complex.i.mul(t / tau).add(1);
	const scalarCoef_ = timeFactor_
		.mul((2 * Math.PI) ** 0.5)
		.pow(-1)
		.mul(detCov ** -0.5);
	const momentumCoef_ = Complex.cis(
		timeFactor_
			.pow(-1)
			.mul((-detCov * matMul(pVec, covMatInv, pVec) * t) / (2 * m * H_BAR)),
	);
	const coef_ = scalarCoef_.mul(momentumCoef_);

	const centralBias = Math.min(1 / detCov, 50);

	const [centerX, centerY] = pVec.map(p => p * t);

	const cu = (centerX - xMin) / (xMax - xMin);
	const cv = (centerY - yMin) / (yMax - yMin);

	// const [uRange, vRange] = [cxu, cyv].map(c => {
	// 	const range = [0, 1].map(bound => 1 / Math.exp(-centralBias * (bound - c)));
	// 	const width = range[1] - range[0];
	// 	return range.map(bound => (bound - range[0]) / width);
	// });
	// console.log(uRange, vRange);

	const [pu, pv] = [cu, cv].map(c => 1 + Math.exp(centralBias * c));
	const [qu, qv] = [cu, cv].map(c => 1 + Math.exp(-centralBias * (1 - c)));

	const [au, av] = [
		[pu, qu],
		[pv, qv],
	].map(([p, q]) => (p * q) / (p - q));
	const [du, dv] = [
		[pu, qu],
		[pv, qv],
	].map(([p, q]) => -q / (p - q));

	// console.log(centralBias, au, av, du, dv);

	function uDensifier(u) {
		return cu + Math.log((-du + u) / (au + du - u)) / centralBias;
	}
	// (() => {
	// 	const n = 99;
	// 	console.log(d3.range(n + 1).map(i => [i / n, uDensifier(i / n)]));
	// })();

	function vDensifier(v) {
		return cv + Math.log((-dv + v) / (av + dv - v)) / centralBias;
	}

	// throw new Error();

	function valueAtPoint(u, v, vec) {
		u = uDensifier(u);
		v = vDensifier(v);

		const x1 = xMin * (1 - u) + xMax * u;
		const x2 = yMin * (1 - v) + yMax * v;

		// if ((u - 1) ** 2 + (v - 1) ** 2 < 1e-6) {
		// 	console.log(u, x1, v, x2);
		// }

		const xVec = [x1, x2];
		const positionComponent_ = Complex.exp(
			timeFactor_
				.pow(-1)
				.mul(
					Complex.sub(
						Complex.i.mul((detCov * matMul(xVec, covMatInv, pVec)) / H_BAR),
						matMul(xVec, covMatInv, xVec) / 4,
					),
				),
		);
		const z = coef_.mul(positionComponent_);
		return vec.set(xScale3D(x1), yScale3D(x2), zScale3D(z.magnitude));
	}

	return valueAtPoint;
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

function update3D(m, sigma, p) {
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
			xAxisLabel.position.y = 0;
			xAxisLabel.position.z = 0;
			scene.add(xAxisLabel);

			const yAxisLabel = makeAxisLabel("Im[𝜓]");
			yAxisLabel.position.x = 0;
			yAxisLabel.position.y = yMin - 0.1;
			yAxisLabel.position.z = -0.2;
			scene.add(yAxisLabel);

			const zAxisLabel = makeAxisLabel("Re[𝜓]");
			zAxisLabel.position.x = 0.1;
			zAxisLabel.position.y = 0.2;
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
	wave.geometry = new THREE.ParametricBufferGeometry(
		getWavefunctionFunction(m, sigma, p, currentTime),
		80,
		80,
	);

	renderer.render(scene, camera);
}

function update(dtMS) {
	dtMS = dtMS ?? 0;
	currentTime += (3 * dtMS) / 1000;

	const [m, sigmaX, sigmaY, sigmaCorr, px, py] = [
		"m",
		"sigmaX",
		"sigmaY",
		"sigmaCorr",
		"px",
		"py",
	].map(k => +sliders[k].value);

	const cov = sigmaX * sigmaY * sigmaCorr;
	update3D(
		m,
		[
			[sigmaX ** 2, cov],
			[cov, sigmaY ** 2],
		],
		[px, py],
	);
}

update(0);

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
	update();
}

// eslint-disable-next-line no-unused-vars
function fillLatex() {
	const [m, sigmaX, sigmaY, sigmaCorr, px, py] = [
		"m",
		"sigmaX",
		"sigmaY",
		"sigmaCorr",
		"px",
		"py",
	].map(k => +sliders[k].value);
	katex.render(`m=${floatFormatter(m)}`, textSpans.m);
	katex.render(`\\sigma_x=${floatFormatter(sigmaX)}`, textSpans.sigmaX);
	katex.render(`\\sigma_y=${floatFormatter(sigmaY)}`, textSpans.sigmaY);
	katex.render(`\\rho=${floatFormatter(sigmaCorr)}`, textSpans.sigmaCorr);
	katex.render(`p_x=${floatFormatter(px)}`, textSpans.px);
	katex.render(`p_y=${floatFormatter(py)}`, textSpans.py);
}
