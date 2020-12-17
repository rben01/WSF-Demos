/* global THREE */

const plotElem = document.getElementById("plot");
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
	75,
	plotElem.clientWidth / plotElem.clientHeight,
	0.1,
	2000,
);
const renderer = new THREE.WebGLRenderer({
	canvas: plotElem,
	antialias: true,
	powerPreference: "high-performance",
});
renderer.localClippingEnabled = true;

plotElem.width = plotElem.clientWidth * window.devicePixelRatio;
plotElem.height = plotElem.clientHeight * window.devicePixelRatio;
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
const MAX_ANGLE_RAD = Math.atan2(DETECTOR_WIDTH * 0.495, DISTANCE);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(60, 40, CAMERA_Z);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, -20, CAMERA_Z);
const DRAG_SPEED = 0.002; // scale factor to convert pixels dragged to radians

// const slitSeparationTextElem = document.getElementById("slit-separation-text");
// const slitSeparationTextPos = new THREE.Vector3(
// 	0,
// 	SOURCE_PANE_HEIGHT / 2 + 4,
// 	SOURCE_Z + 0.01,
// );
// function updateSlitSeparationTextElemPos() {
// 	const textPos = slitSeparationTextPos.clone().project(camera);
// 	console.log(textPos);
// 	const plotElemRect = plotElem.getBoundingClientRect();
// 	const halfWidth = plotElemRect.width / 2;
// 	const halfHeight = plotElemRect.height / 2;
// 	const textPosX = plotElemRect.x + halfWidth + textPos.x * halfWidth;
// 	const textPosY = plotElemRect.y + halfHeight - textPos.y * halfHeight;

// 	slitSeparationTextElem.style.left = `${textPosX}px`;
// 	slitSeparationTextElem.style.top = `${textPosY}px`;
// }
// updateSlitSeparationTextElemPos();

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

		// updateSlitSeparationTextElemPos();
	}),
);

const screenUnitsToMetersScale = d3.scaleLinear([0, 1000], [0, 0.0001]);

const SOURCE_PANE_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0x778899,
	side: THREE.DoubleSide,
	transparent: false,
});

const DETECTOR_MATERIAL_BACK = new THREE.MeshPhongMaterial({
	color: 0x99aabb,
	side: THREE.FrontSide,
	transparent: true,
	opacity: 0.2,
	reflectivity: 0.2,
});

const DETECTOR_MATERIAL_FRONT = new THREE.MeshStandardMaterial({
	color: 0x99aabb,
	side: THREE.BackSide,
	// transparent: true,
	// opacity: 0.5,
	// reflectivity: 0.2,
});

const OUTLINE_MATERIAL = new THREE.LineBasicMaterial({
	color: 0xcccccc,
	linewidth: 1,
});

const DETECTOR_INTENSITY_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	side: THREE.DoubleSide,
	// clippingPlanes: [new THREE.Plane(new THREE.Vector3(0, 0, 1), -DETECTOR_Z - 0.3)],
});

const PHOTON_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	side: THREE.DoubleSide,
});

const DEFAULT_ANGLE = 0;

const MIN_WAVELENGTH = 400e-9;
const MAX_WAVELENGTH = 800e-9;
const DEFAULT_WAVELENGTH = (MIN_WAVELENGTH + MAX_WAVELENGTH) / 2;

const MIN_SLIT_SEPARATION = 2;
const MAX_SLIT_SEPARATION = 30;
const DEFAULT_SLIT_SEPARATION = (MIN_SLIT_SEPARATION + MAX_SLIT_SEPARATION) / 2;

const colorScale = t => d3.interpolateSinebow(t * 0.8);
const wavelengthScale = d3.scaleLinear([MAX_WAVELENGTH, MIN_WAVELENGTH], [0, 1]);

const ARROWHEAD_LENGTH = 1.2;
const ARROWHEAD_WIDTH = 0.8;

let currAngle = DEFAULT_ANGLE;
let currWavelength = DEFAULT_WAVELENGTH;
let currSlitSeparation = DEFAULT_SLIT_SEPARATION;
let currOffset = 0;

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

const DETECTOR_AMPLITUDE = (DETECTOR_HEIGHT * 0.7) / 2;

function getIntensityOnDetector(angle, wavelength, slitSeparation, baseIntensity) {
	// An arbitrary factor to smooth things out; the larger, the less bumpy the wave
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
	// dashLength,
	// gapLength,
}) {
	nPoints = nPoints ?? 1000;

	const angleScale = d3.scaleLinear([0, 1], [-maxAngle, maxAngle]);

	const topHalfPoints = [];
	const bottomHalfPoints = [];
	for (let i = 0; i < nPoints; ++i) {
		const angle = angleScale(i / (nPoints - 1));
		const x = cx + DISTANCE * Math.tan(angle);
		const intensity = getIntensityOnDetector(
			angle,
			wavelength,
			screenUnitsToMetersScale(slitSeparation),
			DETECTOR_AMPLITUDE,
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

function getNPeriodsTotal(originCx, originDisplacement, angle, wavelength) {
	const originX = originCx + originDisplacement;
	const endPointX = originCx + DISTANCE * Math.tan(angle);
	const waveTotalLengthPx = (DISTANCE ** 2 + (originX - endPointX) ** 2) ** 0.5;
	const waveTotalLengthMeters = screenUnitsToMetersScale(waveTotalLengthPx);
	const nPeriodsTotal = waveTotalLengthMeters / wavelength;
	return nPeriodsTotal;
}

function getLocalAmplitude(phase, offset, wavelength) {
	return Math.sin(2 * Math.PI * phase - offset / wavelength);
}

function getPhotonPath({
	originCx,
	originDisplacement,
	originCy,
	angle,
	wavelength,
	amplitude,
	offset,
	nPoints,
}) {
	originCy = originCy ?? 0;
	amplitude = amplitude ?? SOURCE_PANE_HEIGHT * 0.3;
	offset = offset ?? 0;
	nPoints = nPoints ?? 1000;

	const originX = originCx + originDisplacement;
	const endPointX = originCx + DISTANCE * Math.tan(angle);
	const nPeriodsTotal = getNPeriodsTotal(
		originCx,
		originDisplacement,
		angle,
		wavelength,
	);

	const points = [];
	for (let i = 0; i < nPoints; ++i) {
		const t = i / (nPoints - 1);
		const x = (1 - t) * originX + t * endPointX;

		const phase = t * nPeriodsTotal;
		const y = originCy + amplitude * getLocalAmplitude(phase, offset, wavelength);

		const z = (1 - t) * SOURCE_Z + t * DETECTOR_Z;
		points.push(new THREE.Vector3(x, y, z));
	}

	return new THREE.CatmullRomCurve3(points);
}

function updateEnvironment({ angle, wavelength, slitSeparation, offset, objects }) {
	if (angle !== undefined) {
		currAngle = angle;
	} else {
		angle = currAngle;
	}

	if (wavelength !== undefined) {
		currWavelength = wavelength;
	} else {
		wavelength = currWavelength;
	}

	if (slitSeparation !== undefined) {
		currSlitSeparation = slitSeparation;
	} else {
		slitSeparation = currSlitSeparation;
	}

	if (offset !== undefined) {
		currOffset = offset;
	} else {
		offset = currOffset;
	}

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

				const border = new THREE.Line(
					outerPlaneBorderGeometry,
					OUTLINE_MATERIAL,
				);

				scene.add(pane, border);

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

			const border = new THREE.Line(new THREE.BufferGeometry(), OUTLINE_MATERIAL);

			const arrowOrigin = new THREE.Vector3(
				0,
				SOURCE_PANE_HEIGHT / 2 + 1,
				SOURCE_Z,
			);

			const leftArrowDir = new THREE.Vector3(-1, 0, 0);
			leftArrowDir.normalize();
			const rightArrowDir = new THREE.Vector3(1, 0, 0);
			rightArrowDir.normalize();

			function makeArrow(direction) {
				return new THREE.ArrowHelper(
					direction,
					arrowOrigin,
					0,
					0xffffff,
					ARROWHEAD_LENGTH,
					ARROWHEAD_WIDTH,
				);
			}
			const leftArrow = makeArrow(leftArrowDir);
			const rightArrow = makeArrow(rightArrowDir);
			const arrows = [leftArrow, rightArrow];

			scene.add(pane, border, leftArrow, rightArrow);

			objects.middlePaneObjs = { pane, border, arrows };
		})();

		// Detector
		(() => {
			const paneGeometry = new THREE.PlaneBufferGeometry(
				DETECTOR_WIDTH,
				DETECTOR_HEIGHT,
				50,
				20,
			);
			const backPane = new THREE.Mesh(paneGeometry, DETECTOR_MATERIAL_BACK);
			backPane.position.z = DETECTOR_Z;

			const frontPane = new THREE.Mesh(paneGeometry, DETECTOR_MATERIAL_FRONT);
			frontPane.position.z = DETECTOR_Z;

			const borderGeometry = pointsToGeometry(
				get3DVerticesForRectAtOrigin(
					DETECTOR_WIDTH,
					DETECTOR_HEIGHT,
					DETECTOR_Z,
				),
			);
			const border = new THREE.Line(borderGeometry, OUTLINE_MATERIAL);

			scene.add(backPane, frontPane, border);
			objects.detectorObjs = { backPane, frontPane, border };
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

			const verticalLine = new THREE.Mesh(
				new THREE.BufferGeometry(),
				DETECTOR_INTENSITY_MATERIAL,
			);

			const superpositionDot = new THREE.Mesh(
				new THREE.SphereBufferGeometry(0.5, 10, 10),
				DETECTOR_INTENSITY_MATERIAL,
			);

			scene.add(topCurve, bottomCurve, verticalLine, superpositionDot);
			objects.amplitudeObjs = {
				topCurve,
				bottomCurve,
				verticalLine,
				superpositionDot,
			};
		})();

		// Fringe lights shining on front of detector. It's actually more efficient to
		// add every light and keep them all visible at all times than to try to be
		// clever about toggling off lights that don't shine on anything visible
		(() => {
			const fringeObjs = {};
			const fringeLights = [];
			fringeObjs.fringeLights = fringeLights;
			// max number of lights visible == 2 * maxLightIndex + 1
			const maxLightIndex = Math.ceil(
				(screenUnitsToMetersScale(MAX_SLIT_SEPARATION) *
					Math.sin(MAX_ANGLE_RAD)) /
					MIN_WAVELENGTH,
			);
			for (let i = -maxLightIndex; i <= maxLightIndex; ++i) {
				const light = new THREE.SpotLight(0xffffff, 1.5, 500, Math.PI, 1, 100);
				fringeLights.push(light);
			}
			scene.add(...fringeLights);

			objects.fringeObjs = fringeObjs;
		})();

		// The photons traveling from the source to the detector
		(() => {
			const photonObjs = {};
			const photons = [];
			photonObjs.photons = photons;

			const photonGeometry = new THREE.BufferGeometry();

			const leftPhoton = new THREE.Mesh(photonGeometry, PHOTON_MATERIAL);
			const rightPhoton = new THREE.Mesh(photonGeometry, PHOTON_MATERIAL);

			scene.add(leftPhoton, rightPhoton);
			photons.push(leftPhoton, rightPhoton);

			objects.photonObjs = photonObjs;
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
		const { pane, border, arrows } = objects.middlePaneObjs;
		pane.geometry.dispose();
		const paneGeometry = new THREE.PlaneBufferGeometry(
			slitSeparation,
			SOURCE_PANE_HEIGHT,
		);

		pane.geometry = paneGeometry;

		const borderGeometry = pointsToGeometry(
			get3DVerticesForRectAtOrigin(slitSeparation, SOURCE_PANE_HEIGHT, SOURCE_Z),
		);
		border.geometry.dispose();
		border.geometry = borderGeometry;

		for (const arrow of arrows) {
			const arrowLength =
				slitSeparation / 2 + SOURCE_PANE_GAP_WIDTH - ARROWHEAD_LENGTH;
			arrow.setLength(arrowLength, ARROWHEAD_LENGTH, ARROWHEAD_WIDTH);
		}
	})();

	//
	// Detector has nothing to update
	//

	// Ampltitude (intensity) visible on back of detector
	(() => {
		const {
			topCurve,
			bottomCurve,
			verticalLine,
			superpositionDot,
		} = objects.amplitudeObjs;

		const tubeRadius = 0.1;
		const [topPath, bottomPath] = getIntensityPath({
			cx: 0,
			cy: 0,
			z: DETECTOR_Z + tubeRadius + 0.001,
			wavelength,
			slitSeparation,
			maxAngle: MAX_ANGLE_RAD,
		});
		for (const [curve, path] of [
			[topCurve, topPath],
			[bottomCurve, bottomPath],
		]) {
			curve.geometry.dispose();
			curve.geometry = new THREE.TubeBufferGeometry(
				path,
				500,
				tubeRadius,
				8,
				false,
			);
		}

		verticalLine.geometry.dispose();
		const intensity = getIntensityOnDetector(
			angle,
			wavelength,
			screenUnitsToMetersScale(slitSeparation),
			DETECTOR_AMPLITUDE,
		);
		const detectionX = DISTANCE * Math.tan(angle);
		const verticalLineCurve = new THREE.LineCurve3(
			new THREE.Vector3(detectionX, intensity, DETECTOR_Z),
			new THREE.Vector3(detectionX, -intensity, DETECTOR_Z),
		);
		verticalLine.geometry = new THREE.TubeBufferGeometry(
			verticalLineCurve,
			1,
			0.1,
			10,
		);

		superpositionDot.position.set(detectionX, 0, DETECTOR_Z);
	})();

	const color = new THREE.Color(colorScale(wavelengthScale(wavelength)));

	// Lights on front of detector
	(() => {
		const { fringeLights } = objects.fringeObjs;

		const slitSeparationMeters = screenUnitsToMetersScale(slitSeparation);
		const distanceMeters = screenUnitsToMetersScale(DISTANCE);

		const nFringeLights = fringeLights.length;
		const maxIndex = (nFringeLights - 1) / 2;
		for (let i = 0; i < nFringeLights; ++i) {
			const light = fringeLights[i];
			const lightIndex = i - maxIndex;

			const theta = Math.asin((lightIndex * wavelength) / slitSeparationMeters);
			const x = screenUnitsToMetersScale.invert(distanceMeters * Math.tan(theta));

			light.color = color;
			light.position.set(x, 0, DETECTOR_Z - 2);
			light.lookAt(x, 0, 0);
		}
	})();

	// Photons traveling from source to detector
	(() => {
		const { photonObjs } = objects;
		const photons = photonObjs.photons;
		const displacement = slitSeparation / 2 + SOURCE_PANE_GAP_WIDTH / 2;

		for (let i = 0; i < photons.length; ++i) {
			const photon = photons[i];
			photon.geometry.dispose();
			const photonPath = getPhotonPath({
				originCx: 0,
				originDisplacement: (i === 0 ? -1 : 1) * displacement,
				angle,
				wavelength,
			});
			photon.geometry = new THREE.TubeBufferGeometry(photonPath, 1000, 0.15, 10);
			photon.material.color = color;
		}
	})();

	renderer.render(scene, camera);

	return objects;
}

camera.position.x = CAMERA_DEFAULT_POSITION.x;
camera.position.y = CAMERA_DEFAULT_POSITION.y;
camera.position.z = CAMERA_DEFAULT_POSITION.z;
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const objs = updateEnvironment({});

let animationFrame;
let isPlaying = false;
const PHOTON_SPEED = 0.000000005; // arbitrary units; the larger, the faster they travel

// eslint-disable-next-line no-unused-vars
function play() {
	function getPhotonValueOnDetector(displacement) {
		return getLocalAmplitude(
			getNPeriodsTotal(0, displacement, currAngle, currWavelength),
			currOffset,
			currWavelength,
		);
	}

	isPlaying = true;
	let startMS;
	function step(timestampMS) {
		if (!isPlaying) {
			window.cancelAnimationFrame(animationFrame);
			return;
		}

		if (startMS === undefined) {
			startMS = timestampMS;
		}
		const elapsedMS = timestampMS - startMS;
		const photons = objs.photonObjs.photons;

		const displacement = currSlitSeparation / 2 + SOURCE_PANE_GAP_WIDTH / 2;
		const color = new THREE.Color(colorScale(wavelengthScale(currWavelength)));

		const offset = elapsedMS * PHOTON_SPEED;
		currOffset = offset;

		for (let i = 0; i < photons.length; ++i) {
			const photon = photons[i];
			photon.geometry.dispose();
			const photonPath = getPhotonPath({
				originCx: 0,
				originDisplacement: (i === 0 ? -1 : 1) * displacement,
				angle: currAngle,
				wavelength: currWavelength,
				offset,
			});
			photon.geometry = new THREE.TubeBufferGeometry(photonPath, 1000, 0.15, 10);
			photon.material.color = color;
		}

		const superpositionDot = objs.amplitudeObjs.superpositionDot;
		const intensity = getIntensityOnDetector(
			currAngle,
			currWavelength,
			screenUnitsToMetersScale(currSlitSeparation),
			DETECTOR_AMPLITUDE,
		);

		const leftPhotonValueOnDetector = getPhotonValueOnDetector(
			currSlitSeparation / 2,
		);
		const rightPhotonValueOnDetector = getPhotonValueOnDetector(
			-currSlitSeparation / 2,
		);

		superpositionDot.position.y =
			(intensity / 2) * (leftPhotonValueOnDetector + rightPhotonValueOnDetector);

		renderer.render(scene, camera);

		animationFrame = window.requestAnimationFrame(step);
	}
	window.requestAnimationFrame(step);
}

// eslint-disable-next-line no-unused-vars
function pause() {
	isPlaying = false;
}

// Angle slider
(() => {
	const slider = document.getElementById("slider-angle");
	const maxAngle = MAX_ANGLE_RAD * 0.99;
	slider.min = -maxAngle;
	slider.max = maxAngle;
	slider.step = 0.001;
	slider.value = DEFAULT_ANGLE;
})();

// Wavelength slider
(() => {
	const slider = document.getElementById("slider-wavelength");
	slider.min = MIN_WAVELENGTH;
	slider.max = MAX_WAVELENGTH;
	slider.step = 1e-9;
	slider.value = DEFAULT_WAVELENGTH;
})();

// Slit separation slider
(() => {
	const slider = document.getElementById("slider-slit-separation");
	slider.min = MIN_SLIT_SEPARATION;
	slider.max = MAX_SLIT_SEPARATION;
	slider.step = 0.001;
	slider.value = DEFAULT_SLIT_SEPARATION;
})();

d3.selectAll(".param-slider").on("input", function () {
	const attribute = this.getAttribute("parameter");
	updateEnvironment({ [attribute]: +this.value, objects: objs });
});
