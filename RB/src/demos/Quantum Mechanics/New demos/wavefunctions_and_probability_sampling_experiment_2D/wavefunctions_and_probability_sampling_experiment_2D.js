/* global THREE STANDARD_COLORS getGridlines */

const canvas = document.getElementById("experiment-plot");
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
	75,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	2000,
);
const renderer = new THREE.WebGLRenderer({
	canvas: canvas,
	antialias: true,
	powerPreference: "high-performance",
});
renderer.localClippingEnabled = false;

canvas.width = canvas.clientWidth * window.devicePixelRatio;
canvas.height = canvas.clientHeight * window.devicePixelRatio;
renderer.setSize(canvas.clientWidth, canvas.clientHeight);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(0, -4, 4);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const DRAG_SPEED = 0.004; // scale factor to convert pixels dragged to radians

d3.select(canvas).call(
	d3.drag().on("drag", function (event) {
		const cameraDisplacementFromPointOfFocus = camera.position
			.clone()
			.sub(CAMERA_POINT_OF_FOCUS);

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

		const newCameraPos = CAMERA_POINT_OF_FOCUS.clone().add(
			cameraDisplacementFromPointOfFocus,
		);
		camera.position.set(newCameraPos.x, newCameraPos.y, newCameraPos.z);
		camera.lookAt(CAMERA_POINT_OF_FOCUS);
		camera.updateProjectionMatrix();
		renderer.render(scene, camera);

		// updateSlitSeparationTextElemPos();
	}),
);

const SURFACE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x2277ff, // new THREE.Color(STANDARD_COLORS.graphicPrimary),
	transparent: true,
	opacity: 0.5,
	emissive: 0x1111ee,
	emissiveIntensity: 0.5,
	wireframe: true,
	side: THREE.DoubleSide,
});

const X_MIN = -1.5;
const X_MAX = 1.5;
const Y_MIN = -1.5;
const Y_MAX = 1.5;

const N_GRIDLINES = 27;

const WAVEFUNCTION = "wavefunction";
const PROBABILITY = "probability";

function gaussianPdf(x, y) {
	// return x + y;
	const u1 = 0;
	const u2 = 0;
	const s1 = 0.35;
	const s2 = 0.35;
	const r = 0;

	const dx = x - u1;
	const dy = y - u2;
	const p = r / (s1 * s2);
	return (
		(1 / (2 * Math.PI * s1 * s2 * Math.sqrt(1 - p ** 2))) *
		Math.exp(
			(-1 / (2 * (1 - p ** 2))) *
				(dx ** 2 / s1 ** 2 + dy ** 2 / s2 ** 2 - (2 * p * dx * dy) / (s1 * s2)),
		)
	);
}

function trianglePdf(x, y) {
	return Math.max(0, 1 - Math.abs(x) - Math.abs(y)) * 1.5;
}

function square(x, y) {
	return Math.abs(x) < 1 && Math.abs(y) < 1 ? 1 : 0;
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

function updatePdf(objs = {}) {
	// let { surfaceGeometry } = objs;
	// if (surfaceGeometry === undefined) {
	// 	surfaceGeometry = new THREE.BufferGeometry();
	// }
	// const positions = new Float32Array(
	// 	d3
	// 		.zip(triangulationInfo.xs, triangulationInfo.ys)
	// 		.flatMap(([x, y]) => [x, y, gaussianPdf(x, y)]),
	// );
	// console.log(positions);
	// surfaceGeometry.setAttribute("position", new THREE.BufferAttribute(positions, 3));
	// surfaceGeometry.setIndex(triangulationInfo.trianglesBufferAttribute);
	// const surfaceGeometry = new THREE.ParametricBufferGeometry(
	// 	(u, v, vec) => {
	// 		const x = X_MIN + u * (X_MAX - X_MIN);
	// 		const y = Y_MIN + v * (Y_MAX - Y_MIN);
	// 		const z = gaussianPdf(x, y);
	// 		vec.x = x;
	// 		vec.y = y;
	// 		vec.z = z;
	// 	},
	// 	51,
	// 	51,
	// );

	// const surface = new THREE.Mesh(surfaceGeometry, SURFACE_MATERIAL);
	// surface.position.set(0, 0, 0);

	// const surface2 = new THREE.Mesh(
	// 	new THREE.PlaneBufferGeometry(2, 2),
	// 	SURFACE_MATERIAL,
	// );
	// surface2.position.z += 1;

	const f = square;
	const xGridlines = triangulationInfo.gridlines.x.map(gridline =>
		gridline.map(([x, y]) => new THREE.Vector3(x, y, f(x, y))),
	);
	const yGridlines = triangulationInfo.gridlines.y.map(gridline =>
		gridline.map(([x, y]) => new THREE.Vector3(x, y, f(x, y))),
	);

	const paths = [...xGridlines, ...yGridlines].map(
		gridline => new THREE.CatmullRomCurve3(gridline),
	);
	console.log(paths);
	const geometries = paths.map(
		path => new THREE.TubeBufferGeometry(path, 100, 0.01, 10),
	);
	const meshes = geometries.map(
		geometry => new THREE.Mesh(geometry, SURFACE_MATERIAL),
	);

	scene.add(...meshes);
	// scene.add(surface2);

	renderer.render(scene, camera);
	return;
}

camera.position.set(
	CAMERA_DEFAULT_POSITION.x,
	CAMERA_DEFAULT_POSITION.y,
	CAMERA_DEFAULT_POSITION.z,
);
camera.up.set(0, 0, 1);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const light = new THREE.PointLight(0xffffff, 1, 100);
light.position.set(2, -2, 3);
scene.add(light, new THREE.AmbientLight(0x2277ff, 0.5));

const objs = updatePdf();
