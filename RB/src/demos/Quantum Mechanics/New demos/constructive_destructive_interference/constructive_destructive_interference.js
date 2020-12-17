/* global THREE */

const plotElem = document.getElementById("plot");
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
	75,
	window.innerWidth / window.innerHeight,
	0.1,
	2000,
);
const renderer = new THREE.WebGLRenderer({
	canvas: plotElem,
	antialias: true,
	powerPreference: "high-performance",
});
renderer.setSize(plotElem.clientWidth, plotElem.clientHeight);

const _PANE_HEIGHT = 10;
const SOURCE_OUTER_PANE_WIDTH = 20;
const SOURCE_PANE_HEIGHT = _PANE_HEIGHT;
const DETECTOR_WIDTH = 90;
const DETECTOR_HEIGHT = _PANE_HEIGHT;
const SOURCE_PANE_GAP_WIDTH = 2;
const SOURCE_Z = -100;
const DETECTOR_Z = -30;
const DISTANCE = Math.abs(SOURCE_Z - DETECTOR_Z);
const CAMERA_Z = (SOURCE_Z + DETECTOR_Z) * 0.45;

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(60, 40, CAMERA_Z);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, -20, CAMERA_Z);
const CAMERA_DIST_FROM_POINT_OF_FOCUS = CAMERA_DEFAULT_POSITION.distanceTo(
	CAMERA_POINT_OF_FOCUS,
);
const DRAG_SPEED = 0.002; // scale factor to convert pixels dragged to radians

d3.select(plotElem).call(
	d3.drag().on("drag", function (event) {
		const cameraDisplacementFromPointOfFocus = camera.position
			.clone()
			.sub(CAMERA_POINT_OF_FOCUS);

		const { dx, dy } = event;
		// y is up so x-drags rotate around the y-axis; y-drags rotate around a
		// combination of x-axis and z-axis depending on the current camera angle -- if
		// on the x-y plane, y-drags rotate entirely around the z-axis; if on the y-z
		// plane, y-drags rotate entirely around the x-axis
		const angleAroundY = -dx * DRAG_SPEED;
		const angleInXZPlane = Math.atan2(
			cameraDisplacementFromPointOfFocus.z,
			cameraDisplacementFromPointOfFocus.x,
		);
		const angleAroundX = -Math.sin(angleInXZPlane) * dy * DRAG_SPEED;
		const angleAroundZ = Math.cos(angleInXZPlane) * dy * DRAG_SPEED;

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
	}),
);

const screenUnitsToMetersScale = d3.scaleLinear([0, 1000], [0, 0.0001]);

const WAVELENGTH = 500e-9; // meters

const SOURCE_PANE_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0x778899,
	side: THREE.DoubleSide,
	transparent: false,
});

const DETECTOR_MATERIAL = new THREE.MeshPhongMaterial({
	color: 0x99aabb,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.2,
});

const OUTLINE_MATERIAL = new THREE.LineBasicMaterial({
	color: 0xcccccc,
	linewidth: 1,
});

const WAVE_MATERIAL = new THREE.LineDashedMaterial({
	color: 0xffffff,
	linewidth: 1,
	dashSize: 10,
	gapSize: 20,
});

const DETECTOR_INTENSITY_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	side: THREE.DoubleSide,
});

const DETECTOR_WAVE_PARAMS = {
	thickness: 3,
	radialSegments: 5,
};

function get3DVerticesForRectAtOrigin(width, height, z) {
	const halfWidth = width / 2;
	const halfHeight = height / 2;
	return [
		[-halfWidth, -halfHeight, z],
		[-halfWidth, halfHeight, z],
		[halfWidth, halfHeight, z],
		[halfWidth, -halfHeight, z],
	];
}

function pointsToGeometry(
	points,
	{ closePath, geometryConstructor } = {
		closePath: true,
		geometryConstructor: THREE.BufferGeometry,
	},
) {
	if (closePath) {
		points = [...points, points[0]];
	}

	const vector3s = points.map(point => new THREE.Vector3(...point));
	return new geometryConstructor().setFromPoints(vector3s);
}

function getIntensityOnDetector(angle, wavelength, slitSeparation, baseIntensity) {
	// An arbitrary factor to smooth things out; the larger, the less bumpy the wave
	const smoothFactor = 1;
	return (
		baseIntensity *
		Math.cos(
			(Math.PI * slitSeparation * Math.sin(angle)) / (wavelength * smoothFactor),
		) **
			2
	);
}

function getIntensityPath({
	cx,
	cy,
	z,
	wavelength,
	slitSeparation,
	maxAngle,
	nPoints,
	dashLength,
	gapLength,
}) {
	nPoints = nPoints ?? 1000;

	const maxAmplitude = (DETECTOR_HEIGHT * 0.7) / 2;

	const angleScale = d3.scaleLinear([0, 1], [-maxAngle, maxAngle]);

	const topHalfPoints = [];
	const bottomHalfPoints = [];
	for (let i = 0; i < nPoints; ++i) {
		const angle = angleScale(i / (nPoints - 1));
		const x = cx + DISTANCE * Math.tan(angle);
		if (i === 0) {
			console.log(
				angle,
				wavelength,
				screenUnitsToMetersScale(slitSeparation),
				maxAmplitude,
			);
		}
		const intensity = getIntensityOnDetector(
			angle,
			wavelength,
			screenUnitsToMetersScale(slitSeparation),
			maxAmplitude,
		);
		const yTop = cy + intensity;
		const yBot = cy - intensity;

		topHalfPoints.push(new THREE.Vector3(x, yTop, z));
		bottomHalfPoints.push(new THREE.Vector3(x, yBot, z));
	}

	function pathFrom(points) {
		return new THREE.CatmullRomCurve3(points);
	}

	return [pathFrom(topHalfPoints), pathFrom(bottomHalfPoints)];
}

function updateEnvironment({ angle, wavelength, slitSeparation, objects }) {
	wavelength = wavelength ?? WAVELENGTH;

	const paneInnerEdgeDistFromCenterX = slitSeparation / 2 + SOURCE_PANE_GAP_WIDTH;
	if (objects === undefined) {
		objects = {};

		// Outer source panes
		(() => {
			const outerPaneGeometry = new THREE.PlaneBufferGeometry(
				SOURCE_OUTER_PANE_WIDTH,
				SOURCE_PANE_HEIGHT,
			);

			const outerPlaneBorderGeometry = pointsToGeometry(
				get3DVerticesForRectAtOrigin(
					SOURCE_OUTER_PANE_WIDTH,
					SOURCE_PANE_HEIGHT,
					SOURCE_Z,
				),
			);
			for (const paneObjsKey of ["leftPaneObjs", "rightPaneObjs"]) {
				const pane = new THREE.Mesh(outerPaneGeometry, SOURCE_PANE_MATERIAL);
				pane.position.z = SOURCE_Z;
				scene.add(pane);

				const border = new THREE.Line(
					outerPlaneBorderGeometry,
					OUTLINE_MATERIAL,
				);
				scene.add(border);

				objects[paneObjsKey] = { pane, border };
			}
		})();

		// Middle source pane
		(() => {
			const pane = new THREE.Mesh(
				new THREE.BufferGeometry(),
				SOURCE_PANE_MATERIAL,
			);
			pane.position.z = SOURCE_Z;
			scene.add(pane);

			const border = new THREE.Line(new THREE.BufferGeometry(), OUTLINE_MATERIAL);

			scene.add(border);
			objects.middlePaneObjs = { pane, border };
		})();

		// Detector
		(() => {
			const paneGeometry = new THREE.PlaneBufferGeometry(
				DETECTOR_WIDTH,
				DETECTOR_HEIGHT,
				20,
				20,
			);
			const pane = new THREE.Mesh(paneGeometry, DETECTOR_MATERIAL);
			pane.position.z = DETECTOR_Z;
			scene.add(pane);

			const borderGeometry = pointsToGeometry(
				get3DVerticesForRectAtOrigin(
					DETECTOR_WIDTH,
					DETECTOR_HEIGHT,
					DETECTOR_Z,
				),
			);
			const border = new THREE.Line(borderGeometry, OUTLINE_MATERIAL);
			scene.add(border);
			objects.detectorObjs = { pane, border };
		})();

		// Amplitude on detector
		(() => {
			function makeCurve() {
				return new THREE.Mesh(
					new THREE.BufferGeometry(),
					DETECTOR_INTENSITY_MATERIAL,
				);
			}
			const topCurve = makeCurve();
			const bottomCurve = makeCurve();
			scene.add(topCurve);
			scene.add(bottomCurve);

			objects.amplitudeObjs = { topCurve, bottomCurve };
		})();
	}

	const outerPaneXPos = paneInnerEdgeDistFromCenterX + SOURCE_OUTER_PANE_WIDTH / 2;
	// Left pane
	(() => {
		const { pane, border } = objects.leftPaneObjs;
		pane.position.x = -outerPaneXPos;
		border.position.x = -outerPaneXPos;
	})();

	// Right pane
	(() => {
		const { pane, border } = objects.rightPaneObjs;
		pane.position.x = outerPaneXPos;
		border.position.x = outerPaneXPos;
	})();

	// Middle pane
	(() => {
		const { pane, border } = objects.middlePaneObjs;
		const paneGeometry = new THREE.PlaneBufferGeometry(
			slitSeparation,
			SOURCE_PANE_HEIGHT,
		);
		pane.geometry.dispose();
		pane.geometry = paneGeometry;

		const borderGeometry = pointsToGeometry(
			get3DVerticesForRectAtOrigin(slitSeparation, SOURCE_PANE_HEIGHT, SOURCE_Z),
		);
		border.geometry.dispose();
		border.geometry = borderGeometry;
	})();

	//
	// Detector has nothing to update
	//

	// Ampltitude (intensity) visible on detector
	(() => {
		const maxAngle = Math.atan2(DETECTOR_WIDTH / 2, DISTANCE);
		const [topPath, bottomPath] = getIntensityPath({
			cx: 0,
			cy: 0,
			z: DETECTOR_Z,
			wavelength,
			slitSeparation,
			maxAngle,
		});
		const { topCurve, bottomCurve } = objects.amplitudeObjs;
		for (const [curve, path] of [
			[topCurve, topPath],
			[bottomCurve, bottomPath],
		]) {
			curve.geometry.dispose();
			curve.geometry = new THREE.TubeBufferGeometry(path, 64, 0.2, 3, false);
		}
	})();

	renderer.render(scene, camera);

	return objects;
}

const light = new THREE.PointLight(0xff0000, 10, 0);
light.position.set(0, 0, DETECTOR_Z - 10);
scene.add(light);

camera.position.x = CAMERA_DEFAULT_POSITION.x;
camera.position.y = CAMERA_DEFAULT_POSITION.y;
camera.position.z = CAMERA_DEFAULT_POSITION.z;
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const objs = updateEnvironment({
	angle: 0,
	slitSeparation: 5,
});
