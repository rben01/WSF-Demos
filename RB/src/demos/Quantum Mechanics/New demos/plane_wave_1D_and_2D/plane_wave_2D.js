/* global applyGraphicalObjs Complex THREE makeTextSprite makeThreeCameraDrag */
const WIDTH = 800;
const HEIGHT = 400;
const HEIGHT_3D = 300;

const X_MIN = -12.2;
const X_0 = 0;
const X_MAX = -X_MIN;

const Y_MIN = X_MIN;
const Y_0 = X_0;
const Y_MAX = X_MAX;

const canvas = document.getElementById("plot-comp");
d3.select(canvas).attr("width", WIDTH); //.attr("height", HEIGHT_3D);
const scene = new THREE.Scene();
// const camera = new THREE.PerspectiveCamera(
// 	150,
// 	canvas.clientWidth / canvas.clientHeight,
// 	0.1,
// 	2000,
// );
const camera = new THREE.OrthographicCamera(
	X_MIN * 1.7,
	X_MAX * 1.7,
	8.5,
	-8.5,
	-40,
	40,
);
const renderer = new THREE.WebGLRenderer({
	canvas: canvas,
	antialias: true,
	powerPreference: "high-performance",
});
renderer.localClippingEnabled = false;

canvas.width = canvas.clientWidth * window.devicePixelRatio;
canvas.height = canvas.clientHeight * window.devicePixelRatio;
renderer.setSize(WIDTH, HEIGHT_3D);

// z will be up
scene.add(new THREE.AmbientLight(0xffffff, 0.7));
scene.add(
	(() => {
		const pointLight = new THREE.PointLight(0xffffff, 1);
		pointLight.position.set(3, 3, 6);
		return pointLight;
	})(),
);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(5, 5, 5);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const CAMERA_UP = new THREE.Vector3(0, 0, 1);
CAMERA_UP.normalize();

d3.select(canvas).call(
	makeThreeCameraDrag({
		camera,
		scene,
		renderer,
		up: CAMERA_UP,
		pointOfFocus: CAMERA_POINT_OF_FOCUS,
	}),
);

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
const INTERSECTOR_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0xee55dd,
	side: THREE.DoubleSide,
	transparent: false,
});
const REAL_PART_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0x55ddff,
	side: THREE.DoubleSide,
	transparent: false,
});
const IMAG_PART_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xf3c002,
	side: THREE.DoubleSide,
	transparent: false,
});
camera.up.copy(CAMERA_UP);
camera.position.x = CAMERA_DEFAULT_POSITION.x;
camera.position.y = CAMERA_DEFAULT_POSITION.y;
camera.position.z = CAMERA_DEFAULT_POSITION.z;
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const objs3d = { empty: true };
function update() {
	if (objs3d.empty) {
		(() => {
			const temp = new THREE.BoxBufferGeometry(4, 4, 4);
			const mesh = new THREE.Mesh(temp, WAVE_MATERIAL);

			scene.add(mesh);
			objs3d.temp = mesh;
		})();
	}

	renderer.render(scene, camera);
}

update();
