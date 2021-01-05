/* global THREE getGridlines */

function makeCanvasObjs(canvasId) {
	const canvas = document.getElementById(canvasId);
	const scene = new THREE.Scene();
	const camera = new THREE.PerspectiveCamera(
		75,
		canvas.clientWidth / canvas.clientHeight,
		0.1,
		20,
	);
	const renderer = new THREE.WebGLRenderer({
		canvas,
		antialias: true,
		powerPreference: "high-performance",
	});
	renderer.localClippingEnabled = false;

	canvas.width = canvas.clientWidth * window.devicePixelRatio;
	canvas.height = canvas.clientHeight * window.devicePixelRatio;
	renderer.setSize(canvas.clientWidth, canvas.clientHeight);

	return { canvas, scene, camera, renderer };
}

const {
	canvas: canvasWavef,
	scene: sceneWavef,
	camera: cameraWavef,
	renderer: rendererWavef,
} = makeCanvasObjs("wavefunction-plot");

const {
	canvas: canvasProba,
	scene: sceneProba,
	camera: cameraProba,
	renderer: rendererProba,
} = makeCanvasObjs("experiment-plot");

const shapeButtonContainer = d3.select("#wavefunction-shape-buttons");

const MIN_EXPERIMENT_SPEED = 1;
const MAX_EXPERIMENT_SPEED = 100;
let experimentSpeed = MIN_EXPERIMENT_SPEED;
const experimentSpeedToTimeIntervalScale = d3.scaleLog(
	[MIN_EXPERIMENT_SPEED, MAX_EXPERIMENT_SPEED],
	[0.5, 0.0001],
);
const experimentSpeedTextSpan = document.getElementById("experiment-speed");
function updateExperimentSpeed() {
	const speed = +(this.value ?? MIN_EXPERIMENT_SPEED);
	experimentSpeed = speed;
	experimentSpeedTextSpan.innerText = `${speed}x`;
}
updateExperimentSpeed();

// eslint-disable-next-line no-unused-vars
const experimentSpeedSlider = (() => {
	const slider = document.getElementById("experiment-speed-slider");
	slider.min = MIN_EXPERIMENT_SPEED;
	slider.max = MAX_EXPERIMENT_SPEED;
	slider.step = 1;
	slider.value = MIN_EXPERIMENT_SPEED;
	slider.oninput = updateExperimentSpeed;
})();

const MIN_NUM_MEASUREMENTS = 50;
const MAX_NUM_MEASUREMENTS = 100;
function numMeasurementsSliderScale(value) {
	// eslint-disable-next-line no-use-before-define
	value = value ?? +numMeasurementsSlider.value;

	if (value === MAX_NUM_MEASUREMENTS) {
		return Infinity;
	}
	return (
		MIN_NUM_MEASUREMENTS -
		Math.floor(1.1 ** MIN_NUM_MEASUREMENTS) +
		Math.floor(1.1 ** value)
	);
}

const numMeasurementsTextSpan = document.getElementById("num-measurements-text");
function updateNumMeasurementsText() {
	const value = +(this.value ?? MIN_NUM_MEASUREMENTS);
	const scaledValue = numMeasurementsSliderScale(value);
	const scaledText = isFinite(scaledValue) ? `${scaledValue}` : "Infinite";
	numMeasurementsTextSpan.innerText = scaledText;
}

const numMeasurementsSlider = (() => {
	const slider = document.getElementById("number-of-measurements-slider");
	slider.min = MIN_NUM_MEASUREMENTS;
	slider.max = MAX_NUM_MEASUREMENTS;
	slider.step = 1;
	slider.value = MAX_NUM_MEASUREMENTS; //MIN_NUM_MEASUREMENTS;
	slider.oninput = updateNumMeasurementsText;
	return slider;
})();

updateNumMeasurementsText.call(numMeasurementsSlider);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(2.5, -2.5, 1);
const PROBA_CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0.7);
const WAVEF_CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const DRAG_SPEED = 0.004; // scale factor to convert pixels dragged to radians

for (const canvas of [canvasProba, canvasWavef]) {
	d3.select(canvas).call(
		d3.drag().on("drag", function (event) {
			for (const [camera, scene, renderer, pointOfFocus] of [
				[cameraProba, sceneProba, rendererProba, PROBA_CAMERA_POINT_OF_FOCUS],
				[cameraWavef, sceneWavef, rendererWavef, WAVEF_CAMERA_POINT_OF_FOCUS],
			]) {
				const cameraDisplacementFromPointOfFocus = camera.position
					.clone()
					.sub(pointOfFocus);

				const { dx, dy } = event;
				// z is up so x-drags rotate around the z-axis; y-drags rotate around a
				// combination of x-axis and y-axis depending on the current camera angle -- if
				// on the x-z plane, y-drags rotate entirely around the y-axis; if on the y-z
				// plane, y-drags rotate entirely around the x-axis
				const angleAroundZ = -dx * DRAG_SPEED;
				const angleInXYPlane = Math.atan2(
					cameraDisplacementFromPointOfFocus.y,
					cameraDisplacementFromPointOfFocus.x,
				);
				const angleAroundX = Math.sin(angleInXYPlane) * dy * DRAG_SPEED;
				const angleAroundY = -Math.cos(angleInXYPlane) * dy * DRAG_SPEED;

				cameraDisplacementFromPointOfFocus.applyEuler(
					new THREE.Euler(angleAroundX, angleAroundY, angleAroundZ, "XYZ"),
				);

				const newCameraPos = pointOfFocus
					.clone()
					.add(cameraDisplacementFromPointOfFocus);
				camera.position.set(newCameraPos.x, newCameraPos.y, newCameraPos.z);
				camera.lookAt(pointOfFocus);
				camera.updateProjectionMatrix();
				renderer.render(scene, camera);
			}
		}),
	);
}

const GRIDLINE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x2288ff, // new THREE.Color(STANDARD_COLORS.graphicPrimary),
	// transparent: true,
	// opacity: 0.5,
	// emissive: 0x1111ee,
	// emissiveIntensity: 0.5,
	// wireframe: true,
	side: THREE.DoubleSide,
});

const BUCKET_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0xffbb22,
	side: THREE.DoubleSide,
});

const _SIZE = 1.5;
const X_MIN = -_SIZE;
const X_MAX = _SIZE;
const Y_MIN = -_SIZE;
const Y_MAX = _SIZE;

const N_GRIDLINES = 33;

const WAVEFUNCTION = "wavefunction";
const PROBABILITY = "probability";

const GAUSSIAN_SIGMA = 0.4;
const GAUSSIAN_MU = 0;

function gaussianWavefunction(x, y) {
	// return x + y;
	const u1 = GAUSSIAN_MU;
	const u2 = GAUSSIAN_MU;
	const s1 = GAUSSIAN_SIGMA;
	const s2 = GAUSSIAN_SIGMA;
	const r = 0;

	const dx = x - u1;
	const dy = y - u2;
	const p = r / (s1 * s2);
	return (
		2 *
		(Math.PI * s1 * s2) ** 0.5 *
		((1 / (2 * Math.PI * s1 * s2 * Math.sqrt(1 - p ** 2))) *
			Math.exp(
				(-1 / (2 * (1 - p ** 2))) *
					(dx ** 2 / s1 ** 2 +
						dy ** 2 / s2 ** 2 -
						(2 * p * dx * dy) / (s1 * s2)),
			))
	);
}

const TRIANGLE_PEAK = 1.2;
const TRIANGLE_EXTENT = Math.sqrt(3) / TRIANGLE_PEAK;

function triangleWavefunction(x, y) {
	return (
		(TRIANGLE_PEAK / TRIANGLE_EXTENT) *
		Math.max(0, TRIANGLE_EXTENT - Math.abs(x) - Math.abs(y))
	);
}

const SQUARE_MAGNITUDE = 0.8;
const SMALL_SQUARE_MAGNITUDE = 1.3;

// Magnitude is the magnitude of the wavefunction; we need \int\int magnitude**2 dx dy == 1
function _squareThreshold(magnitude) {
	return 0.5 / magnitude;
}

function _squareFunc(x, y, magnitude) {
	const threshold = _squareThreshold(magnitude);
	return Math.abs(x) < threshold && Math.abs(y) < threshold ? magnitude : 0;
}

function squareWavefunction(x, y) {
	return _squareFunc(x, y, SQUARE_MAGNITUDE);
}

function smallSquareWavefunction(x, y) {
	return _squareFunc(x, y, SMALL_SQUARE_MAGNITUDE);
}

const wavefunctions = {
	gaussian: gaussianWavefunction,
	triangle: triangleWavefunction,
	square: squareWavefunction,
	smallSquare: smallSquareWavefunction,
};

// https://en.wikipedia.org/wiki/Box–Muller_transform
function gaussianSample() {
	const rand = Math.random;
	let u, v;

	do {
		u = rand();
	} while (u === 0);

	do {
		v = rand();
	} while (v === 0);

	const R = Math.sqrt(-2 * Math.log(u));
	const theta = 2 * Math.PI * v;

	const z0 = R * Math.cos(theta);
	const z1 = R * Math.sin(theta);

	// Math tl;dr: Wavefunction is bivariate gaussian N(mu, sigma) normalized so that
	// its squared integral is 1. Its square is then the bivariate gaussian N(mu,
	// sigma/sqrt(2)).
	return [z0, z1].map(z => GAUSSIAN_MU + z * (GAUSSIAN_SIGMA / 2 ** 0.5));
}

function triangleSample() {
	// Let a = TRIANGLE_EXTENT. We'll do the math in quadrant 1, then rotate to a random
	// quadrant. To randomly sample from the 2D CDF in quadrant 1, first compute the
	// integral from 0 to a-x of 4*psi(x,y)^2 dy; that's the PDF along the x direction.
	// Integrate *that* with respect to x to get the CDF along the x direction; use that
	// to sample r_x along the x direction. Then fix x, integrate 4*psi(x,y)^2 dy from 0
	// to a-x, find the scalar factor c that makes that integral 1, then integrate
	// c*4*psi(x,t)^2 dt from 0 to y to get the CDF for y with fixed x; sample r_y from
	// that. Finally choose the signs of x and y randomly.
	const r_x = Math.random();
	const x = TRIANGLE_EXTENT * (1 - (1 - r_x) ** (1 / 4));

	const r_y = Math.random();
	const y = (TRIANGLE_EXTENT - x) * (1 - (1 - r_y) ** (1 / 3));

	// So now we have x and y in the selected quadrant. But we haven't selected a
	// quadrant yet
	const q = Math.random();
	const x_sign = Math.floor(q / 0.5) % 2 === 0 ? 1 : -1;
	const y_sign = Math.floor(q / 0.25) % 2 === 0 ? 1 : -1;

	return [x * x_sign, y * y_sign];
}

function _genericSquareSample(magnitude) {
	const threshold = _squareThreshold(magnitude);
	const r_x = 2 * (Math.random() - 0.5) * threshold;
	const r_y = 2 * (Math.random() - 0.5) * threshold;
	return [r_x, r_y];
}

function squareSample() {
	return _genericSquareSample(SQUARE_MAGNITUDE);
}

function smallSquareSample() {
	return _genericSquareSample(SMALL_SQUARE_MAGNITUDE);
}

const triangulationInfo = (() => {
	const xMin = X_MIN;
	const xMax = X_MAX;
	const nXPoints = 101;
	const dx = (xMax - xMin) / (nXPoints - 1);

	const yMin = Y_MIN;
	const yMax = Y_MAX;
	const nYPoints = 103;
	const dy = (yMax - yMin) / (nYPoints - 1);

	const gridPoints = [];
	for (let i = 0; i < nXPoints; ++i) {
		const x = xMin + i * dx;
		for (let j = 0; j < nYPoints; ++j) {
			const y = yMin + j * dy;
			gridPoints.push([x, y, null]);
		}
	}

	const xs = gridPoints.map(p => p[0]);
	const ys = gridPoints.map(p => p[1]);

	const delaunay = d3.Delaunay.from(gridPoints);
	const { triangles } = delaunay;
	const i = d3.range(triangles.length / 3).map(i => triangles[3 * i]);
	const j = d3.range(triangles.length / 3).map(i => triangles[3 * i + 1]);
	const k = d3.range(triangles.length / 3).map(i => triangles[3 * i + 2]);

	const nPointsPerGridline = 51;
	const xGridlines = getGridlines({
		nGridlines: N_GRIDLINES,
		xMin: X_MIN,
		xMax: X_MAX,
		yMin: Y_MIN,
		yMax: Y_MAX,
		drawEdges: true,
		nPointsPerGridline,
	});
	const yGridlines = getGridlines({
		nGridlines: N_GRIDLINES,
		xMin: X_MIN,
		xMax: X_MAX,
		yMin: Y_MIN,
		yMax: Y_MAX,
		drawEdges: true,
		nPointsPerGridline,
		swapOrientation: true,
	});

	return { gridPoints, xs, ys, i, j, k, gridlines: { x: xGridlines, y: yGridlines } };
})();

const objsWavef = { empty: true };
const objsProba = { empty: true, bucketMeshes: [] };
let selectedProbDist;
function update(probDistName) {
	selectedProbDist = probDistName;

	const gridlines = [
		...triangulationInfo.gridlines.x,
		...triangulationInfo.gridlines.y,
	];

	if (objsProba.empty) {
		objsProba.empty = false;

		// Add the probability distribution meshes (to be filled with tube buffer geometries)
		(() => {
			const probDistGridlineMeshes = gridlines.map(
				() => new THREE.Mesh(new THREE.BufferGeometry(), GRIDLINE_MATERIAL),
			);

			sceneProba.add(...probDistGridlineMeshes);
			objsProba.gridlineMeshes = probDistGridlineMeshes;
		})();
	}

	if (objsWavef.empty) {
		objsWavef.empty = false;
		// Add the wavefunction meshes (to be filled with tube buffer geometries)
		(() => {
			const wavefGridlineMeshes = gridlines.map(
				() => new THREE.Mesh(new THREE.BufferGeometry(), GRIDLINE_MATERIAL),
			);

			sceneWavef.add(...wavefGridlineMeshes);
			objsWavef.gridlineMeshes = wavefGridlineMeshes;
		})();
	}

	const f = wavefunctions[probDistName];
	for (const { func, objs, renderer, scene, camera } of [
		{
			func: f,
			objs: objsWavef,
			renderer: rendererWavef,
			scene: sceneWavef,
			camera: cameraWavef,
		},
		{
			func: (x, y) => f(x, y) ** 2,
			objs: objsProba,
			renderer: rendererProba,
			scene: sceneProba,
			camera: cameraProba,
		},
	]) {
		for (let i = 0; i < gridlines.length; ++i) {
			const gridline = gridlines[i];
			const path = new THREE.CatmullRomCurve3(
				gridline.map(([x, y]) => new THREE.Vector3(x, y, func(x, y))),
			);
			const geometry = new THREE.TubeBufferGeometry(path, 100, 0.007, 7);
			const mesh = objs.gridlineMeshes[i];
			mesh.geometry.dispose();
			mesh.geometry = geometry;
		}
		renderer.render(scene, camera);
	}

	return;
}

const numExperimentObjs = {
	container: document.getElementById("container-num-experiments"),
	textSpan: document.getElementById("text-num-experiments"),
};
function showNumExperiments() {
	numExperimentObjs.container.style.visibility = "visible";
}

function hideNumExperiments() {
	numExperimentObjs.container.style.visibility = "hidden";
}

function enableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = false;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", function () {
		return this.hasAttribute("button-checked");
	});
}

function disableShapeButtons() {
	document.getElementById("number-of-measurements-slider").disabled = true;
	shapeButtonContainer.selectAll(".shape-button").property("disabled", true);
}

let experimentAnimationFrame;

function stopExperiment() {
	enableShapeButtons();
	d3.select("#btn-clear-experiment").property("disabled", false);
	document.getElementById("btn-run").disabled = false;
	document.getElementById("btn-stop").disabled = true;
	// clearInterval(experimentInterval);
	window.cancelAnimationFrame(experimentAnimationFrame);
}

// eslint-disable-next-line no-unused-vars
function clearExperiment() {
	hideNumExperiments();
	for (const mesh of objsProba.bucketMeshes) {
		mesh.geometry.dispose();
		mesh.geometry = new THREE.BufferGeometry();
	}
	rendererProba.render(sceneProba, cameraProba);
	d3.select("#btn-clear-experiment").property("disabled", true);
}

function resetExperiment() {
	stopExperiment();
	clearExperiment();
}

// Will be adjusted to evenly divide the given probability function's support
const APPROX_BUCKET_WIDTH = (X_MAX - X_MIN) / (1 * N_GRIDLINES);

d3.select("#btn-run").on("click._default", null);
d3.select("#btn-clear-experiment").on("click._default", null);

// eslint-disable-next-line no-unused-vars
function runExperiment() {
	resetExperiment();
	disableShapeButtons();
	showNumExperiments();

	d3.select("#btn-run").property("disabled", true);
	d3.select("#btn-stop").property("disabled", false);
	d3.select("#btn-clear-experiment").property("disabled", true);

	const nMeasurements = numMeasurementsSliderScale();

	const samplingFunc =
		selectedProbDist === "gaussian"
			? gaussianSample
			: selectedProbDist === "square"
			? squareSample
			: selectedProbDist === "smallSquare"
			? smallSquareSample
			: selectedProbDist === "triangle"
			? triangleSample
			: null;

	const squareMagnitude =
		selectedProbDist === "square" ? SQUARE_MAGNITUDE : SMALL_SQUARE_MAGNITUDE;
	const supports =
		selectedProbDist === "square" || selectedProbDist === "smallSquare"
			? d3
					.range(2)
					.map(() =>
						[-1, 1].map(sign => sign * _squareThreshold(squareMagnitude)),
					)
			: [
					[X_MIN, X_MAX],
					[Y_MIN, Y_MAX],
			  ];
	const xMin = supports[0][0];
	const yMin = supports[1][0];

	const supportSizes = supports.map(supp => supp[1] - supp[0]);

	// Round bucket width down to next number that divides the width of the support
	const nBuckets = supportSizes.map(s => Math.ceil(s / APPROX_BUCKET_WIDTH));
	const bucketSizes = supportSizes.map((s, i) => s / nBuckets[i]);
	const bucketArea = bucketSizes.reduce((a, b) => a * b);

	// `buckets` contains prod(nBuckets)+1 buckets, the first prod(nBuckets) of which
	// are rendered on screen and the last of which aggregates all buckets that don't
	// fit on screen. Each bucket is labeled {x,y} according to the lower left corner of
	// the bucket (towards (-inf, -inf))
	const buckets = d3.range(nBuckets.reduce((a, b) => a * b) + 1).map(i => {
		const ix = Math.floor(i / nBuckets[0]);
		const iy = i % nBuckets[1];

		const x = xMin + bucketSizes[0] * ix;
		const y = yMin + bucketSizes[1] * iy;

		let mesh = objsProba.bucketMeshes[i];
		if (mesh === undefined) {
			mesh = new THREE.Mesh(new THREE.BufferGeometry(), BUCKET_MATERIAL);
			objsProba.bucketMeshes.push(mesh);
			sceneProba.add(mesh);
		}
		mesh.position.x = x + bucketSizes[0] / 2;
		mesh.position.y = y + bucketSizes[1] / 2;

		return { x, y, n: 0, mesh };
	});
	const catchallBucketIndex = nBuckets;

	let nMeasurementsSoFar = 1;

	function nextUpdateTimeIntervalMS() {
		return 1000 * experimentSpeedToTimeIntervalScale(experimentSpeed);
	}

	let prevTimestampMS;
	let experimentRemainderFrac = 0;

	function updateExperimentUI(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		const timeBtwnSamplesMS = nextUpdateTimeIntervalMS();
		const nExperimentsExact =
			elapsedMS / timeBtwnSamplesMS + experimentRemainderFrac;
		const nExperiments = Math.floor(nExperimentsExact);
		experimentRemainderFrac = nExperimentsExact % 1;

		let bucketIndex;
		for (let i = 0; i < nExperiments; ++i) {
			const sample = samplingFunc();
			const [x, y] = sample;
			const ix = Math.floor((x - xMin) / bucketSizes[0]);
			const iy = Math.floor((y - yMin) / bucketSizes[1]);
			bucketIndex = ix * nBuckets[0] + iy;
			if (ix < 0 || ix > nBuckets[0] || iy < 0 || iy > nBuckets[1]) {
				bucketIndex = catchallBucketIndex;
			}
			buckets[bucketIndex].n += 1;
			nMeasurementsSoFar += 1;
			if (nMeasurementsSoFar >= nMeasurements) {
				break;
			}
		}

		const currentVolumeOfSamples =
			bucketArea * (isFinite(nMeasurements) ? nMeasurements : nMeasurementsSoFar);
		const scale = 1 / currentVolumeOfSamples;
		// Exclude the final, catch-all bucket
		for (let i = 0; i < buckets.length - 1; ++i) {
			const bucket = buckets[i];
			const { n, mesh } = bucket;
			const height = n * scale;

			mesh.geometry.dispose();
			if (height > 0) {
				const geometry = new THREE.BoxBufferGeometry(
					bucketSizes[0],
					bucketSizes[1],
					Math.max(height, 0.0001),
				);
				mesh.position.z = height / 2;
				mesh.geometry = geometry;
			}
		}

		numExperimentObjs.textSpan.innerText = nMeasurementsSoFar;

		rendererProba.render(sceneProba, cameraProba);

		if (nMeasurementsSoFar >= nMeasurements) {
			stopExperiment();
		} else {
			experimentAnimationFrame = window.requestAnimationFrame(updateExperimentUI);
		}
	}
	experimentAnimationFrame = window.requestAnimationFrame(updateExperimentUI);
}

for (const [camera, scene] of [
	[cameraProba, sceneProba],
	[cameraWavef, sceneWavef],
]) {
	camera.up.set(0, 0, 1);

	if (camera === cameraWavef) {
		console.log("wavefc");
		camera.position.set(
			CAMERA_DEFAULT_POSITION.x * 0.8,
			CAMERA_DEFAULT_POSITION.y * 0.8,
			CAMERA_DEFAULT_POSITION.z * 0.5,
		);
		camera.lookAt(WAVEF_CAMERA_POINT_OF_FOCUS);
	} else {
		console.log("probac");
		camera.position.set(
			CAMERA_DEFAULT_POSITION.x,
			CAMERA_DEFAULT_POSITION.y,
			CAMERA_DEFAULT_POSITION.z,
		);
		camera.lookAt(PROBA_CAMERA_POINT_OF_FOCUS);
	}

	const light = new THREE.PointLight(0xffffff, 1, 100);
	light.position.set(1.5, -2.5, 1);
	scene.add(light, new THREE.AmbientLight(0x2277ff, 0.8));
}

shapeButtonContainer.selectAll(".shape-button").on("click.select-shape", function () {
	update(this.getAttribute("shape"));
});

update("gaussian");
