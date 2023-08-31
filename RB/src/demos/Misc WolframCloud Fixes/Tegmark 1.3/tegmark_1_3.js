/* global THREE makeRenderer */

const WIDTH = 300;
const HEIGHT = 200;

const THETA_MIN = -2;
const THETA_MAX = 2;

const posSlider = (() => {
	const slider = document.getElementById("input-angle");

	slider.min = THETA_MIN;
	slider.max = THETA_MAX;
	slider.step = 0.001;
	slider.value = (THETA_MIN + THETA_MAX) / 2;

	// eslint-disable-next-line no-use-before-define
	slider.oninput = update;

	return slider;
})();

const canvas = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT).node();
const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera(
	35,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	500,
);

const ORIGIN = new THREE.Vector3(0, 0, 0);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(0, -5, 1);
const CAMERA_POINT_OF_FOCUS = ORIGIN;

const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const renderer = makeRenderer(canvas);
renderer.setSize(canvas.clientWidth, canvas.clientHeight);
renderer.localClippingEnabled = true;

const SPHERE_MATERIALS = [
	new THREE.MeshLambertMaterial({
		color: 0x66ccff,
		transparent: true,
		opacity: 0.95,
	}),
	new THREE.MeshLambertMaterial({
		color: 0xff88aa,
		transparent: true,
		opacity: 0.95,
	}),
	new THREE.MeshLambertMaterial({
		color: 0xbbff66,
		transparent: true,
		opacity: 0.95,
	}),
];

const TICK_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	transparent: false,
});

const objs3d = { empty: true };

function update() {
	if (objs3d.empty) {
		objs3d.empty = false;

		scene.add(new THREE.AmbientLight(0x888888));

		const directionalLight = new THREE.SpotLight(0xffffff, 0.8);
		directionalLight.position.set(7, -2, 10);
		scene.add(directionalLight);

		const makeSphereMesh = i => {
			const sphere = new THREE.SphereGeometry(0.5);
			const mesh = new THREE.Mesh(sphere, SPHERE_MATERIALS[i]);
			return mesh;
		};

		objs3d.spheres = [];

		const sphereDists = [0, 5, 10];
		for (let i = 0; i < sphereDists.length; i++) {
			const y = sphereDists[i];
			const sphere = makeSphereMesh(i);
			sphere.position.set(0, y, -0.25);
			scene.add(sphere);
			objs3d.spheres.push(sphere);
		}

		// Add the ticks in the background
		{
			const axisY = 10;
			const axisZ = 2;
			const axisXMax = 6.5;
			const axisXMin = -axisXMax;

			{
				const axisGeometry = new THREE.TubeGeometry(
					new THREE.LineCurve3(
						new THREE.Vector3(-100, axisY, axisZ),
						new THREE.Vector3(100, axisY, axisZ),
					),
					2,
					0.05,
				);

				scene.add(new THREE.Mesh(axisGeometry, TICK_MATERIAL));
			}

			{
				const nTicks = 11;
				const majorTickLength = 0.9;
				const minorTickLength = 0.5;

				const dx = (axisXMax - axisXMin) / (nTicks - 1);
				for (let i = 0; i < nTicks; i++) {
					const x = axisXMin + i * dx;
					const tickZStart = axisZ + 0.045;

					const isMajorTick = i % 5 === 0;

					// Account for perspective; needed for straight vertical ticks
					const xBot = x * (isMajorTick ? 1.0115 : 1.006);
					const tickLength = isMajorTick ? majorTickLength : minorTickLength;

					const tickGeometry = new THREE.TubeGeometry(
						new THREE.LineCurve3(
							new THREE.Vector3(x, axisY, tickZStart),
							new THREE.Vector3(xBot, axisY, tickZStart - tickLength),
						),
						2,
						0.05,
					);
					scene.add(new THREE.Mesh(tickGeometry, TICK_MATERIAL));
				}
			}
		}
	}

	for (const sphere of objs3d.spheres) {
		sphere.position.x = -posSlider.value;
	}

	renderer.render(scene, camera);
}

update();
