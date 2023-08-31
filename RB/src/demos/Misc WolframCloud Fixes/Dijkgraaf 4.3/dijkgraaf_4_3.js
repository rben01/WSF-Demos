/* global THREE makeRenderer enableDragToRotateCamera Complex */

const paramSliders = {
	minExt: (() => {
		const slider = document.getElementById("input-min-extent");
		slider.step = 0.001;
		slider.min = 0;
		slider.max = 5;
		slider.value = 0;

		// eslint-disable-next-line no-use-before-define
		slider.oninput = update;

		return slider;
	})(),
	maxExt: (() => {
		const slider = document.getElementById("input-max-extent");
		slider.step = 0.001;
		slider.min = 0;
		slider.max = 2.5;
		slider.value = 1.5;

		// eslint-disable-next-line no-use-before-define
		slider.oninput = update;

		return slider;
	})(),
	n: (() => {
		const slider = document.getElementById("input-n");
		slider.step = 1;
		slider.min = 2;
		slider.max = 8;
		slider.value = 5;

		// eslint-disable-next-line no-use-before-define
		slider.oninput = update;

		return slider;
	})(),
	a: (() => {
		const slider = document.getElementById("input-a");
		slider.step = 0.001;
		slider.min = 0;
		slider.max = 2 * Math.PI;
		slider.value = 0;

		// eslint-disable-next-line no-use-before-define
		slider.oninput = update;

		return slider;
	})(),
};

const canvas = d3.select("#cym").attr("width", 400).attr("height", 250).node();

const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera(
	90,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	500,
);

const ORIGIN = new THREE.Vector3(0, 0, 0);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(4.8, 1.7, 2.5);
const CAMERA_POINT_OF_FOCUS = ORIGIN;

const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const renderer = makeRenderer(canvas);
renderer.setSize(canvas.clientWidth, canvas.clientHeight);
renderer.localClippingEnabled = true;

// eslint-disable-next-line no-unused-vars
const _zoomSlider = (() => {
	const slider = document.getElementById("input-zoom");

	slider.step = 0.001;
	slider.min = 1;
	slider.max = 12;
	slider.value = 10;

	const scaler = d3.scaleLinear([+slider.min, +slider.max], [13, 2]);

	slider.oninput = function () {
		const newDist = scaler(+this.value);
		camera.position.copy(camera.position.normalize().multiplyScalar(newDist));
		renderer.render(scene, camera);
	};

	slider.oninput();
})();

enableDragToRotateCamera({
	canvas,
	camera,
	scene,
	renderer,
	pointOfFocus: CAMERA_POINT_OF_FOCUS,
	up: CAMERA_UP,
});

const SURF_MATERIAL = new THREE.MeshStandardMaterial({
	color: 0x0088ff,
	transparent: false,
	side: THREE.DoubleSide,
});

const objs3d = { empty: true };

const thetaScale = d3.scaleLinear([0, 1], [-Math.PI / 2, Math.PI / 2]);

function update() {
	if (objs3d.empty) {
		objs3d.empty = false;
		objs3d.patches = {};
		objs3d.patchWireframes = {};

		scene.add(new THREE.AmbientLight(0xffffff, 0.5));

		{
			const light = new THREE.DirectionalLight(0xffffff, 0.7);
			light.position.set(0, 0, 10);
			scene.add(light);
		}

		{
			const light = new THREE.DirectionalLight(0xff8888);
			light.position.set(10, 0, 0);
			scene.add(light);
		}
	}

	const [minExtent, maxExtent, n, a] = ["minExt", "maxExt", "n", "a"].map(
		key => +paramSliders[key].value,
	);

	document.getElementById("text-n").innerText = n;

	const extent = maxExtent - minExtent;

	const xiScale = d3.scalePow([0, 1], [minExtent, maxExtent]).exponent(1.1);
	const cosA = Math.cos(a);
	const sinA = Math.sin(a);

	for (const meshes of [objs3d.patches, objs3d.patchWireframes]) {
		for (const mesh of Object.values(meshes)) {
			mesh.geometry.dispose();
			mesh.visible = false;
		}
	}
	const m = (2 * Math.PI) / n;
	for (let k1 = 0; k1 < n; k1++) {
		const s1 = Complex.fromReal(k1 * m).cis();
		for (let k2 = 0; k2 < n; k2++) {
			const s2 = Complex.fromReal(k2 * m).cis();

			const patchkey = `${k1}_${k2}`;
			let patch = objs3d.patches[patchkey];
			let wireframe = objs3d.patchWireframes[patchkey];
			if (patch === undefined) {
				patch = new THREE.Mesh(new THREE.BufferGeometry(), SURF_MATERIAL);
				objs3d.patches[patchkey] = patch;
				scene.add(patch);
			}
			if (wireframe === undefined) {
				wireframe = new THREE.LineSegments(new THREE.BufferGeometry());
				wireframe.material.color.setHex(0xffffff);

				objs3d.patchWireframes[patchkey] = wireframe;
				scene.add(wireframe);
			}
			patch.visible = true;
			wireframe.visible = true;

			const patchGeom = new THREE.ParametricGeometry(
				(u, v, vec3) => {
					const theta = thetaScale(u);
					const xi = xiScale(v);

					const angle1 = Complex.fromCartesian(xi, theta);
					const angle2 = angle1.mul(-1);
					const e1 = angle1.exp();
					const e2 = angle2.exp();

					const u1 = Complex.add(e1, e2).div(Complex.fromReal(2));
					const u2 = Complex.sub(e1, e2).div(Complex.fromImag(2));

					const z1 = u1.pow(2 / n).mul(s1);
					const z2 = u2.pow(2 / n).mul(s2);

					const x = z1.re;
					const y = z2.re;
					const z = z1.im * cosA + z2.im * sinA;

					vec3.set(x, y, z);
				},
				23, // Angular
				Math.max(2, Math.round(extent * 10)), // Radial
			);

			patch.geometry = patchGeom;
			wireframe.geometry = new THREE.WireframeGeometry(patchGeom);
		}
	}

	renderer.render(scene, camera);
}

update();
