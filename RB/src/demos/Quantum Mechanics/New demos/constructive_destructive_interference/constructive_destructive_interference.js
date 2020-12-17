/* global THREE */

const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
	75,
	window.innerWidth / window.innerHeight,
	0.1,
	2000,
);
const plotElem = document.getElementById("plot");
const renderer = new THREE.WebGLRenderer({
	canvas: plotElem,
	antialias: true,
});
renderer.setSize(plotElem.clientWidth, plotElem.clientHeight);

const screenUnitsToMetersScale = d3.scaleLinear([0, 1000], [0, 0.001]);

const _PANE_HEIGHT = 100;
const SOURCE_OUTER_PANE_WIDTH = 500;
const SOURCE_PANE_HEIGHT = _PANE_HEIGHT;
const DETECTOR_WIDTH = 900;
const DETECTOR_HEIGHT = _PANE_HEIGHT;
const SOURCE_PANE_GAP_WIDTH = 20;
const SOURCE_Z = -800;
const DETECTOR_Z = -300;
const DISTANCE = Math.abs(SOURCE_Z - DETECTOR_Z);

const WAVELENGTH = 500e-9; // meters

const SOURCE_PANE_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0x778899,
	side: THREE.DoubleSide,
	transparent: false,
});

const DETECTOR_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0x99aabb,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.2,
});

const OUTLINE_MATERIAL = new THREE.LineBasicMaterial({
	color: 0xffffff,
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

function pointsToGeometry(points, { closePath } = { closePath: true }) {
	if (closePath) {
		points = [...points, points[0]];
	}

	const vector3s = points.map(point => new THREE.Vector3(...point));
	return new THREE.BufferGeometry().setFromPoints(vector3s);
}

function getIntensityOnDetector(angle, wavelength, slitSeparation, baseIntensity) {
	return (
		baseIntensity *
		Math.cos((Math.PI * slitSeparation * Math.sin(angle)) / wavelength) ** 2
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
	const maxAmplitude = (DETECTOR_HEIGHT * 0.7) / 2;

	const maxDistFromCx = cx - DISTANCE * Math.sin(maxAngle);
	const xMin = cx - maxDistFromCx;
	const xMax = cx + maxDistFromCx;
	const xScale = d3.scaleLinear([0, 1], [xMin, xMax]);

	const topHalfPoints = [];
	const bottomHalfPoints = [];
	for (let i = 0; i < nPoints; ++i) {
		const x = xScale(i / (nPoints - 1));
		const angle = Math.atan2(DISTANCE, cx - x);
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
		const maxAngle = Math.atan2(DISTANCE, DETECTOR_WIDTH / 2);
		const [topPath, bottomPath] = getIntensityPath({
			cx: 0,
			cy: 0,
			z: DETECTOR_Z,
			wavelength,
			slitSeparation,
			maxAngle,
			nPoints: 100,
		});
		const { topCurve, bottomCurve } = objects.amplitudeObjs;
		for (const [curve, path] of [
			[topCurve, topPath],
			[bottomCurve, bottomPath],
		]) {
			curve.geometry.dispose();
			curve.geometry = new THREE.TubeBufferGeometry(path, 64, 3, 3, false);
		}
	})();

	renderer.render(scene, camera);

	return objects;
}

camera.position.x = 600;
camera.position.y = 400;
camera.position.z = -500;
camera.lookAt(new THREE.Vector3(0, -400, -500));

const objs = updateEnvironment({
	angle: 0,
	slitSeparation: 50,
});
