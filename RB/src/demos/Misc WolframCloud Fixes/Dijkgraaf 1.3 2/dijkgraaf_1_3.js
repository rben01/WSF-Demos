/* global THREE makeRenderer enableDragToRotateCamera */

const WIDTH = 350;
const HEIGHT = 225;

const X_MIN = -16;
const X_MID = 0;
const X_MAX = -X_MIN;

// In units of Math.PI / 2
const THETA_MIN = -1;
const THETA_MID = 0;
const THETA_MAX = 1;

const CONE_RADIUS = (X_MAX - X_MIN) / 2;
const CONE_HEIGHT = 25;
const CONE_SLOPE = CONE_HEIGHT / CONE_RADIUS;

const THETA_PARALLEL = Math.atan(CONE_SLOPE) / (Math.PI / 2);

const posSlider = (() => {
	const slider = document.getElementById("plane-x");
	slider.step = 0.001;
	slider.min = X_MIN;
	slider.max = X_MAX;
	slider.value = X_MID;

	slider.oninput = () => {
		if (Math.abs(slider.value - X_MID) < 0.5) {
			slider.value = X_MID;
		}
		// eslint-disable-next-line no-use-before-define
		update();
	};

	return slider;
})();

const angleSlider = (() => {
	const slider = document.getElementById("plane-angle");
	slider.min = THETA_MIN;
	slider.max = THETA_MAX;
	slider.step = 0.001;
	slider.value = THETA_MID;

	slider.oninput = () => {
		const angleThreshold = 0.03;
		if (Math.abs(slider.value - THETA_MID) < angleThreshold) {
			slider.value = X_MID;
		} else {
			if (Math.abs(slider.value - THETA_PARALLEL) < angleThreshold) {
				slider.value = THETA_PARALLEL;
			} else if (Math.abs(-slider.value - THETA_PARALLEL) < angleThreshold) {
				slider.value = -THETA_PARALLEL;
			}
		}
		// eslint-disable-next-line no-use-before-define
		update();
	};

	return slider;
})();

const conicTextSpan = document.getElementById("conic-description");

const canvas = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT).node();
const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera(
	30,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	500,
);

const ORIGIN = new THREE.Vector3(0, 0, 0);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(63, -110, 60);
const CAMERA_POINT_OF_FOCUS = ORIGIN;

const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const renderer = makeRenderer(canvas);
renderer.setSize(canvas.clientWidth, canvas.clientHeight);
renderer.localClippingEnabled = true;

enableDragToRotateCamera({
	canvas,
	camera,
	scene,
	renderer,
	pointOfFocus: CAMERA_POINT_OF_FOCUS,
	up: CAMERA_UP,
});

const PLANE_RENDER_ORDER = 1;
const CONE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0xffbbbb,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.9,
});
const CONE_BORDER_MATERIAL = new THREE.MeshPhongMaterial({
	color: 0xffdddd,
	side: THREE.DoubleSide,
	transparent: false,
});
const PLANE_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x0088ff,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.3,
});
const PLANE_BORDER_MATERIAL = new THREE.MeshPhongMaterial({
	color: PLANE_MATERIAL.color,
	side: THREE.DoubleSide,
	transparent: false,
});

const CONIC_MATERIAL = new THREE.MeshPhongMaterial({
	color: 0xffffff,
	side: THREE.DoubleSide,
	transparent: false,
	clippingPlanes: [
		// new THREE.Plane(new THREE.Vector3(0, 0, -1), CONE_HEIGHT),
		// new THREE.Plane(new THREE.Vector3(0, 0, 1), CONE_HEIGHT),
	],
	clipIntersection: false,
});

const objs3d = { empty: true };

const CONICS = {
	point: 0,
	oneLine: 1,
	twoLines: 2,
	circle: 3,
	ellipse: 4,
	parabola: 5,
	hyperbola: 6,
};

function isSmall(x) {
	return Math.abs(x) < 1e-2;
}

function makeLineCurve([x1, y1, z1], [x2, y2, z2]) {
	return new THREE.LineCurve3(
		new THREE.Vector3(x1, y1, z1),
		new THREE.Vector3(x2, y2, z2),
	);
}

function update() {
	if (objs3d.empty) {
		objs3d.empty = false;

		{
			const ambientLight = new THREE.AmbientLight(0xffffff, 0.6);
			scene.add(ambientLight);

			const pointLight = new THREE.PointLight(0xffffff, 0.7, 1000);
			pointLight.position.set(50, -30, 30);
			scene.add(pointLight);
		}

		{
			const coneRadialSegments = 128;
			const coneHeightSegments = 2;

			const coneTopGeom = new THREE.ConeGeometry(
				CONE_RADIUS,
				CONE_HEIGHT,
				coneRadialSegments,
				coneHeightSegments,
				true,
			);
			const coneTop = new THREE.Mesh(coneTopGeom, CONE_MATERIAL);
			coneTop.rotateX(-Math.PI / 2);
			coneTop.position.setZ(CONE_HEIGHT / 2);

			const coneTopRingGeom = new THREE.TorusGeometry(CONE_RADIUS, 0.2, 6, 64);
			const coneTopRing = new THREE.Mesh(coneTopRingGeom, CONE_BORDER_MATERIAL);
			coneTopRing.position.setZ(CONE_HEIGHT);

			const coneBotGeom = coneTopGeom.clone();
			const coneBot = new THREE.Mesh(coneBotGeom, CONE_MATERIAL);
			coneBot.rotateX(Math.PI / 2);
			coneBot.position.setZ(-CONE_HEIGHT / 2);

			const coneBotRingGeom = coneTopRingGeom.clone();
			const coneBotRing = new THREE.Mesh(coneBotRingGeom, CONE_BORDER_MATERIAL);
			coneBotRing.position.setZ(-CONE_HEIGHT);

			scene.add(coneTop, coneBot, coneTopRing, coneBotRing);
		}

		{
			const planeSidelength = 75;
			const planeGeom = new THREE.PlaneGeometry(75, 75);
			const plane = new THREE.Mesh(planeGeom, PLANE_MATERIAL);

			const planeBorderCurvePath = new THREE.CurvePath();
			const planeBorderPathPoints = [
				[1, 1],
				[-1, 1],
				[-1, -1],
				[1, -1],
				[1, 1],
			].map(
				([x, y]) =>
					new THREE.Vector3(
						(x * planeSidelength) / 2,
						(y * planeSidelength) / 2,
						0,
					),
			);

			for (let i = 0; i < 4; i++) {
				planeBorderCurvePath.add(
					new THREE.LineCurve3(
						planeBorderPathPoints[i],
						planeBorderPathPoints[i + 1],
					),
				);
			}

			const planeBorderGeometry = new THREE.TubeGeometry(
				planeBorderCurvePath,
				4,
				0.1,
				6,
			);
			const planeBorder = new THREE.Mesh(
				planeBorderGeometry,
				PLANE_BORDER_MATERIAL,
			);

			plane.renderOrder = PLANE_RENDER_ORDER;
			planeBorder.renderOrder = PLANE_RENDER_ORDER;

			const planeGroup = new THREE.Group();
			planeGroup.add(plane, planeBorder);
			scene.add(planeGroup);
			objs3d.plane = planeGroup;
		}

		{
			const upperConic = new THREE.Mesh(
				new THREE.BufferGeometry(),
				CONIC_MATERIAL,
			);
			const lowerConic = new THREE.Mesh(
				new THREE.BufferGeometry(),
				CONIC_MATERIAL,
			);

			scene.add(upperConic, lowerConic);

			objs3d.upperConic = upperConic;
			objs3d.lowerConic = lowerConic;
		}
	}

	const planePos = +posSlider.value;
	const planeAngle = (+angleSlider.value * Math.PI) / 2;

	// First we need the plane's normal vector (nvX, nvY, nvZ)
	const nvX = Math.sin(planeAngle);
	const nvY = 0;
	const nvZ = Math.cos(planeAngle);

	// Then the plane's displacement (x0, y0, z0) from the origin
	const planeX0 = 0.8 * planePos * nvX;
	const planeY0 = 0;
	const planeZ0 = 1.2 * planePos * nvZ;

	{
		const { plane } = objs3d;
		plane.position.setX(planeX0);
		plane.position.setZ(planeZ0);
		plane.setRotationFromAxisAngle(new THREE.Vector3(0, 1, 0), planeAngle);
	}

	// This is the tricky part... finding the intersection of the double-cone and the
	// plane
	{
		// Using the fact that the equation of the plane is:
		// nvX * (x - x0) + nvY * (y - y0) + nvZ * (z - z0) = 0
		// then find the equation of the plane a*x + b*y + c*z + d = 0
		const a = nvX;
		const b = nvY;
		const c = nvZ;
		const d = -(a * planeX0 + b * planeY0 + c * planeZ0);
		// console.log(a, b, c, d);
		// console.log(a ** 2 * r ** 2 - c ** 2);

		// The equation of a (right, circular, non-affine...) cone is (x^2+y^2)/r^2 =
		// z^2. Let x = radius, y = 0, z = height, then r = x/z = radius/height
		const r = 1 / CONE_SLOPE;

		const u = (a * r) ** 2 - c ** 2;
		const v = 2 * a * d * r ** 2;
		const w = (d * r) ** 2;

		const conicKind = (() => {
			const passesThroughOrigin = isSmall(d);
			const isHorizontal = isSmall(a);

			const coneSlope = 1 / r;
			const planeSlope = Math.abs(a / c);
			// console.log(planeSlope, coneSlope);
			const isParallelToConeEdge = isSmall(planeSlope - coneSlope);
			const isFlatterThanConeEdge =
				planeSlope < coneSlope && !isParallelToConeEdge;
			const isSteeperThanConeEdge =
				planeSlope > coneSlope && !isParallelToConeEdge;

			if (passesThroughOrigin) {
				return isFlatterThanConeEdge
					? CONICS.point
					: isParallelToConeEdge
					? CONICS.oneLine
					: isSteeperThanConeEdge
					? CONICS.twoLines
					: new Error("Invalid boolean weirdness (thru O)");
			} else {
				return isHorizontal
					? CONICS.circle
					: isFlatterThanConeEdge
					? CONICS.ellipse
					: isParallelToConeEdge
					? CONICS.parabola
					: isSteeperThanConeEdge
					? CONICS.hyperbola
					: new Error("Invalid boolean weirdness (not thru O)");
			}
		})();

		// The width of the conic section indicator
		const conicSize = 0.4;
		const nRadialSegments = 8;
		const { upperConic, lowerConic } = objs3d;
		upperConic.geometry.dispose();
		upperConic.visible = true; // visible by default

		lowerConic.geometry.dispose();
		lowerConic.visible = false; // if we need it, we'll make it visible again

		switch (conicKind) {
			case CONICS.point: {
				conicTextSpan.innerText = "a point (degenerate)";

				const geometry = new THREE.SphereGeometry(1, 32, 32);
				upperConic.geometry = geometry;
				break;
			}
			case CONICS.oneLine: {
				conicTextSpan.innerText = "a single line (degenerate)";

				const x1 = a < 0 ? X_MIN : X_MAX;
				const x2 = a < 0 ? X_MAX : X_MIN;
				const z1 = -CONE_HEIGHT;
				const z2 = CONE_HEIGHT;
				const geometry = new THREE.TubeGeometry(
					makeLineCurve([x1, 0, z1], [x2, 0, z2]),
					2,
					conicSize,
					nRadialSegments,
				);
				upperConic.geometry = geometry;
				break;
			}
			case CONICS.twoLines: {
				conicTextSpan.innerText = "two lines (degenerate)";

				const z1 = CONE_HEIGHT;
				const z2 = -CONE_HEIGHT;
				const [x1, x2] = [z1, z2].map(z => (-c / a) * z);

				const [upperGeom, lowerGeom] = [-1, 1].map(sgn => {
					const [y1, y2] = [z1, z2].map(
						z => sgn * z * Math.sqrt(r ** 2 - (c / a) ** 2),
					);
					const geom = new THREE.TubeGeometry(
						makeLineCurve([x1, y1, z1], [x2, y2, z2]),
						2,
						conicSize,
						nRadialSegments,
					);

					return geom;
				});

				upperConic.geometry = upperGeom;
				lowerConic.geometry = lowerGeom;
				lowerConic.visible = true;

				break;
			}
			case CONICS.circle:
			case CONICS.ellipse: {
				if (isSmall(a)) {
					conicTextSpan.innerText = "a circle";
				} else {
					conicTextSpan.innerText = "an ellipse";
				}

				// If it's a circle or ellipse, then u < 0
				const k = Math.sqrt(-u);
				const m = Math.sqrt(w + (v / (2 * k)) ** 2);

				// Yikes
				const zAtTheta0 = (planePos > 0 ? 1 : -1) * CONE_HEIGHT;
				const xAtTheta0 = (-zAtTheta0 * c - d) / a;
				const theta0 = Math.acos(((xAtTheta0 + v / (2 * u)) * k) / m);

				const [thetaMin, thetaMax] = (() => {
					if (isNaN(theta0)) {
						// The entire ellipse fits on the cone
						return [0, 2 * Math.PI];
					}

					const theta1 = 2 * Math.PI - theta0;
					const zAtThetaEquals0 = -(a * (m / k - v / (2 * u)) + d) / c;

					if (Math.abs(zAtThetaEquals0) < CONE_HEIGHT) {
						return [theta1, theta0 + 2 * Math.PI];
					} else {
						return [theta0, theta1];
					}
				})();

				const nPoints = 60;
				const dTheta = (thetaMax - thetaMin) / (nPoints - 1);

				const points = [];
				for (let i = 0; i < nPoints; i++) {
					const theta = thetaMin + i * dTheta;

					// If you're wondering where these come from: start with sin^2 +
					// cos^2 = 1, then work backwards and you'll arrive at (one part of
					// the) solution of the intersection of plane and cone, (cy)^2 =
					// ux^2 + vx + w
					const x = (m / k) * Math.cos(theta) - v / (2 * u);
					const y = (m / c) * Math.sin(theta);
					const z = (a * x + d) / -c;

					points.push(new THREE.Vector3(x, y, z));
				}

				const geometry = new THREE.TubeGeometry(
					new THREE.CatmullRomCurve3(points),
					100,
					conicSize,
					nRadialSegments,
				);

				upperConic.geometry = geometry;
				break;
			}
			case CONICS.parabola: {
				conicTextSpan.innerText = "a parabola";

				const nPoints = 50;

				const yMax = Math.abs(
					Math.sqrt(
						w - (v / a) * (c * (planePos > 0 ? 1 : -1) * CONE_HEIGHT + d),
					) / c,
				);
				const yMin = -yMax;
				const dy = (yMax - yMin) / (nPoints - 1);

				const points = [];
				for (let i = 0; i < nPoints; i++) {
					const y = yMin + i * dy;
					const x = ((c * y) ** 2 - w) / v;
					const z = (a * x + d) / -c;

					points.push(new THREE.Vector3(x, y, z));
				}

				const geometry = new THREE.TubeGeometry(
					new THREE.CatmullRomCurve3(points),
					100,
					conicSize,
					nRadialSegments,
				);
				upperConic.geometry = geometry;
				break;
			}
			case CONICS.hyperbola: {
				conicTextSpan.innerText = "a hyperbola";

				const nPoints = 60;
				for (const [sgn, mesh] of [
					[-1, lowerConic],
					[1, upperConic],
				]) {
					const points = [];
					// If the plane is vertical, we base things on x instead of y
					if (isSmall(c)) {
						const x = -d / a;
						const yMax = Math.sqrt((CONE_HEIGHT * r) ** 2 - x ** 2);
						const yMin = -yMax;
						const dy = (yMax - yMin) / (nPoints - 1);

						for (let i = 0; i < nPoints; i++) {
							const y = yMin + i * dy;
							const z = (sgn * Math.sqrt(x ** 2 + y ** 2)) / r;
							points.push(new THREE.Vector3(x, y, z));
						}
					} else {
						const xZ = -(c * (sgn * CONE_HEIGHT) + d) / a;
						const yMax = Math.sqrt(u * xZ ** 2 + v * xZ + w) / c;

						if (isNaN(yMax)) {
							mesh.visible = false;
							continue;
						}

						mesh.visible = true;

						const yMin = -yMax;
						const dy = (yMax - yMin) / (nPoints - 1);

						for (let i = 0; i < nPoints; i++) {
							const y = yMin + i * dy;
							const x =
								(1 / (2 * u)) *
								(-v -
									Math.sign(planeAngle) *
										sgn *
										Math.sqrt(v ** 2 - 4 * u * (w - (y * c) ** 2)));
							const z = (a * x + d) / -c;

							points.push(new THREE.Vector3(x, y, z));
						}
					}

					const geometry = new THREE.TubeGeometry(
						new THREE.CatmullRomCurve3(points),
						100,
						conicSize,
						nRadialSegments,
					);
					mesh.geometry = geometry;
					mesh.visible = true;
				}

				break;
			}
			default:
				console.log(conicKind);
				throw new Error("huh??");
		}
	}

	renderer.render(scene, camera);
}

update();

// eslint-disable-next-line no-unused-vars
function setPoint() {
	posSlider.value = 0;
	const maxAngle = THETA_PARALLEL * 0.95;
	angleSlider.value = d3.interpolate(-maxAngle, maxAngle)(Math.random());
	update();
}

// eslint-disable-next-line no-unused-vars
function setOneLine() {
	posSlider.value = 0;
	angleSlider.value = (Math.random() < 0.5 ? 1 : -1) * THETA_PARALLEL;
	update();
}

// eslint-disable-next-line no-unused-vars
function setTwoLines() {
	posSlider.value = 0;
	const minAngle = THETA_PARALLEL * 1.05;
	const t = Math.random();
	if (t < 0.5) {
		angleSlider.value = d3.interpolate(THETA_MIN, -minAngle)(2 * t);
	} else {
		angleSlider.value = d3.interpolate(minAngle, THETA_MAX)(2 * (t - 0.5));
	}
	update();
}

function setRandomPos() {
	posSlider.value = d3.interpolate(-CONE_HEIGHT, CONE_HEIGHT)(Math.random());
}

// eslint-disable-next-line no-unused-vars
function setCircle() {
	setRandomPos();
	angleSlider.value = 0;
	update();
}

// eslint-disable-next-line no-unused-vars
function setEllipse() {
	setRandomPos();
	const maxAngle = THETA_PARALLEL * 0.95;
	const minAngle = 0.05;
	const t = Math.random();
	if (t < 0.5) {
		angleSlider.value = d3.interpolate(-maxAngle, -minAngle)(2 * t);
	} else {
		angleSlider.value = d3.interpolate(minAngle, maxAngle)(2 * (t - 0.5));
	}
	update();
}

// eslint-disable-next-line no-unused-vars
function setParabola() {
	setRandomPos();
	angleSlider.value = (Math.random() < 0.5 ? 1 : -1) * THETA_PARALLEL;
	update();
}

// eslint-disable-next-line no-unused-vars
function setHyperbola() {
	setRandomPos();
	const minAngle = THETA_PARALLEL * 1.05;
	const t = Math.random();
	if (t < 0.5) {
		angleSlider.value = d3.interpolate(THETA_MIN, -minAngle)(2 * t);
	} else {
		angleSlider.value = d3.interpolate(minAngle, THETA_MAX)(2 * (t - 0.5));
	}
	update();
}
