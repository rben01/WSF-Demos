/* global Complex THREE makeTextSprite enableDragToRotateCamera katex matMul Line2D */
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
		const pointLight = new THREE.PointLight(0xffffff, 0.8);
		pointLight.position.set(2, -3, 20);
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
	wireframe: false,
});

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

let currentTime = 0;
let isAnimating = false;

const MIN_SIGMA = 1;
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
		slider.value = DEFAULT_SIGMA;

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
		slider.value = DEFAULT_SIGMA;

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
		slider.min = -0.5;
		slider.max = 0.5;
		slider.step = 0.01;
		slider.value = 0.5;

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
		slider.value = DEFAULT_P;

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
		slider.value = DEFAULT_P;

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
	const a = mat[0][0];
	const b = mat[0][1];
	const c = mat[1][0];
	const d = mat[1][1];
	const det = a * d - b * c;

	return [
		[d / det, -b / det],
		[-c / det, a / det],
	];
}

function dotProd2(v1, v2) {
	return v1[0] * v2[0] + v1[1] * v2[1];
}

function eigenDecompose(symmetric2By2Mat) {
	const a = symmetric2By2Mat[0][0];
	const b = symmetric2By2Mat[0][1];
	const d = symmetric2By2Mat[1][1];

	if (b === 0) {
		const eigenObjs = [
			{ lambda: a, eigenvec: [1, 0] },
			{ lambda: d, eigenvec: [0, 1] },
		];

		if (Math.abs(a) > Math.abs(d)) {
			return eigenObjs;
		} else {
			return [eigenObjs[1], eigenObjs[0]];
		}
	}

	const discriminant = ((a - d) ** 2 + 4 * b ** 2) ** 0.5;

	const lambda1 = (a + d - discriminant) / 2;
	const lambda2 = (a + d + discriminant) / 2;

	function toUnitVector(v) {
		const mag = (v[0] ** 2 + v[1] ** 2) ** 0.5;
		return v.map(x => x / mag);
	}

	const eVec1 = toUnitVector([-(-a + d + discriminant) / (2 * b), 1]);
	const eVec2 = toUnitVector([-(-a + d - discriminant) / (2 * b), 1]);

	// Sort by eigenvalue
	const eigenObjs = [
		{ lambda: lambda1, eigenvec: eVec1 },
		{ lambda: lambda2, eigenvec: eVec2 },
	];
	if (Math.abs(lambda1) > Math.abs(lambda2)) {
		return eigenObjs;
	} else {
		return [eigenObjs[1], eigenObjs[0]];
	}
}

function getWavefunctionFunction(m, covarianceMat, pVec, t) {
	const xMin = X_MIN;
	const x0 = X_0;
	const xMax = X_MAX;
	const yMin = Y_MIN;
	const y0 = Y_0;
	const yMax = Y_MAX;

	const xMinLine = Line2D.fromConstantX(xMin);
	const xMaxLine = Line2D.fromConstantX(xMax);
	const yMinLine = Line2D.fromConstantY(yMin);
	const yMaxLine = Line2D.fromConstantY(yMax);

	// Page 9 of this:
	// https://www.reed.edu/physics/faculty/wheeler/documents/Quantum%20Mechanics/Miscellaneous%20Essays/Gaussian%20Wavepackets.pdf
	// Replacing sigma with sqrt(detCov), x^2/sigma^2 with x^T * sigma * x, and v1 * v2 with <v1, v2>
	// A variable name ends in an underscore <==> it's complex
	const detCov = det2By2Mat(covarianceMat);
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

	const [centerX, centerY] = pVec.map(p => p * t);

	const cu = (centerX - xMin) / (xMax - xMin);
	const cv = (centerY - yMin) / (yMax - yMin);

	const [
		{ lambda: uEigenval, eigenvec: uDirection },
		{ lambda: vEigenval, eigenvec: vDirection },
	] = eigenDecompose(covarianceMat);

	// console.log(uEigenval, uDirection, vEigenval, vDirection, cu, cv);
	const [uCompression, vCompression] = [uEigenval, vEigenval].map(
		eigenval => (10 * Math.abs(eigenval) ** -0.5) / (1 + t) ** 0.5,
	);

	const uLine = Line2D.fromPointAndDxDy(x0, y0, uDirection[0], uDirection[1]);
	const uLineHasPositiveSlope = uDirection[0] * uDirection[1] > 0;

	const [cornerLines1, cornerLines2] = uLineHasPositiveSlope
		? [
				[xMinLine, yMaxLine], // Intersection toward top left
				[xMaxLine, yMinLine], // Intersection toward bottom right
		  ]
		: [
				[xMinLine, yMinLine], // Intersection toward bottom left
				[xMaxLine, yMaxLine], // Intersection toward top right
		  ];
	const boundingVLine1 = Line2D.fromPointAndDxDy(
		xMin,
		uLineHasPositiveSlope ? yMin : yMax,
		vDirection[0],
		vDirection[1],
	);
	const boundingVLine2 = Line2D.fromPointAndDxDy(
		xMax,
		uLineHasPositiveSlope ? yMax : yMin,
		vDirection[0],
		vDirection[1],
	);
	const uLineEndpoint1 = uLine.intersectionWith(boundingVLine1);
	const uLineEndpoint2 = uLine.intersectionWith(boundingVLine2);

	// Densifier: f(x) = a * atan(compression * (x - center)) + d
	// Solve for a and d using: f(0) === 0, f(1) === 1
	// Then invert to find u': f(u') = u
	const [uDensifier, vDensifier] = [
		[cu, cv, uCompression],
		[cv, cu, vCompression],
	].map(([thisC, otherC, compression]) => {
		const p = Math.atan(compression * thisC);
		const q = Math.atan(compression * (1 - thisC));
		const denom = p + q;

		const a = 1 / denom;
		const d = p / denom;

		function densifier(w, z) {
			if (
				Math.abs(w - 1) < 1e-8 ||
				Math.abs(w) < 1e-8 ||
				thisC > 1 ||
				thisC < 0
			) {
				return w;
			}

			const val = thisC + Math.tan((w - d) / a) / compression;
			const additionalCompressionFactor =
				Math.abs(0.5 - Math.abs(z - otherC)) * 0.9;
			const valShiftedTowardsCenter =
				val * (1 - additionalCompressionFactor) +
				thisC * additionalCompressionFactor;

			return Math.max(0, Math.min(valShiftedTowardsCenter, 1));
		}
		return densifier;
	});

	// const [pu, pv] = [
	// 	[cu, uCompression],
	// 	[cv, vCompression],
	// ].map(([c, compression]) => 1 + Math.exp(compression * c));
	// const [qu, qv] = [
	// 	[cu, uCompression],
	// 	[cv, vCompression],
	// ].map(([c, compression]) => 1 + Math.exp(-compression * (1 - c)));
	// // console.log(cu, cv, uCompression, vCompression, { pu, pv, qu, qv });

	// const au = (pu * qu) / (pu - qu);
	// const av = (pv * qv) / (pv - qv);
	// const du = -qu / (pu - qu);
	// const dv = -qv / (pv - qv);

	// (() => {
	// 	const n = 20;
	// 	console.log(d3.range(n + 1).map(i => [i / n, vDensifier(i / n)]));
	// })();

	// console.log(uLineEndpoint1, uLineEndpoint2);

	// console.log(
	// 	uDirection,
	// 	uCompression,
	// 	vDirection,
	// 	vCompression,
	// 	uLine.toPointSlopeForm(),
	// );
	function valueAtPoint(u, v, vec) {
		const densifiedU = uDensifier(u, v);
		// const densifyVAmount = Math.abs(2 * u - 1);
		// const densifiedV = v * (1 - densifyVAmount) + vDensifier(v) * densifyVAmount;
		const densifiedV = vDensifier(v, u);

		const uvIntersectionPointX =
			uLineEndpoint1[0] * (1 - densifiedU) + uLineEndpoint2[0] * densifiedU;
		const uvIntersectionPointY =
			uLineEndpoint1[1] * (1 - densifiedU) + uLineEndpoint2[1] * densifiedU;

		const vLine = Line2D.fromPointAndDxDy(
			uvIntersectionPointX,
			uvIntersectionPointY,
			vDirection[0],
			vDirection[1],
		);
		const [p1, p2] = [cornerLines1, cornerLines2].map(linePair => {
			const [d1, d2] = linePair.map(line => {
				const point = line.intersectionWith(vLine);
				if (!point) {
					return { sqDist: Infinity };
				}
				const sqDist =
					(point[0] - uvIntersectionPointX) ** 2 +
					(point[1] - uvIntersectionPointY) ** 2;
				return { sqDist, point };
			});

			return d1.sqDist < d2.sqDist ? d1.point : d2.point;
		});

		// const x1 = p1[0] * (1 - densifiedV) + p2[0] * densifiedV;
		// const x2 = p1[1] * (1 - densifiedV) + p2[1] * densifiedV;

		const x1 = xMin * (1 - densifiedU) + xMax * densifiedU;
		const x2 = yMin * (1 - densifiedV) + yMax * densifiedV;

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

	const { wave } = objs3d.wave;
	const wavefunctionFunction = getWavefunctionFunction(m, sigma, p, currentTime);
	if (wavefunctionFunction !== null) {
		wave.geometry.dispose();
		wave.geometry = new THREE.ParametricBufferGeometry(
			wavefunctionFunction,
			70,
			70,
		);
	}
	renderer.render(scene, camera);
}

function update(dtMS) {
	dtMS = dtMS ?? 0;
	const speed = 3;
	currentTime += (speed * dtMS) / 1000;

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
