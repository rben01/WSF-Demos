/* global katex THREE makeRenderer enableDragToRotateCamera */

const WIDTH = 550;
const HEIGHT = 250;

const minDist = 25;
const maxDist = 100;
const initialDist = 50;
const distSlider = (() => {
	const slider = document.getElementById("slider-d");

	slider.min = minDist;
	slider.max = maxDist;
	slider.step = 0.1;
	slider.value = initialDist;

	return slider;
})();

const canvas = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT).node();
const scene = new THREE.Scene();

const camera = new THREE.PerspectiveCamera(
	65,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	2000,
);

const renderer = makeRenderer(canvas);
renderer.setSize(canvas.clientWidth, canvas.clientHeight);

const STAR_POSITION = new THREE.Vector3(0, 0, 0);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(-40, -94, 23);
const CAMERA_POINT_OF_FOCUS = STAR_POSITION;

const CAMERA_UP = new THREE.Vector3(0, 0, 1);

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

enableDragToRotateCamera({
	canvas,
	camera,
	scene,
	renderer,
	pointOfFocus: CAMERA_POINT_OF_FOCUS,
	up: CAMERA_UP,
});

const STAR_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0xffff33,
	side: THREE.FrontSide,
	transparent: false,
});

const surfaceColorAtMaxBrightness = "#44aaff";
const surfaceColorScale = d3
	.scalePow(
		[+distSlider.min, +distSlider.max],
		[
			surfaceColorAtMaxBrightness,
			d3.interpolateRgb(
				"black",
				surfaceColorAtMaxBrightness,
			)((+distSlider.min / +distSlider.max) ** 2),
		],
	)
	.exponent(-2);
const SURFACE_MATERIAL = new THREE.MeshBasicMaterial({
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.9,
});

const bandColorAtMaxBrightness = "#ffffff";
const bandColorScale = d3.scalePow(
	// Intentionally linear
	[+distSlider.min, +distSlider.max],
	[
		bandColorAtMaxBrightness,
		d3.interpolateRgb(
			"black",
			bandColorAtMaxBrightness,
		)(+distSlider.min / +distSlider.max),
	],
);
const BAND_MATERIAL = new THREE.MeshBasicMaterial({
	side: THREE.DoubleSide,
	transparent: false,
});

const RAY_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffff55,
	side: THREE.DoubleSide,
	transparent: true,
	opacity: 0.4,
});

const SCREEN_BORDER_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xffffff,
	side: THREE.DoubleSide,
	transparent: false,
});

const STAR_RADIUS = 15;

const objs3d = { empty: true };

let screenIsVisible = false;

const texts = {
	katex: document.getElementById("katex"),
};

function update3d() {
	// Centered about phi = 0
	const phiMid = 0 * Math.PI;
	const phiLength = 0.4 * Math.PI;
	const phiStart = phiMid - phiLength / 2;

	// Centered about theta = 1.5 * pi
	const thetaMid = 1.5 * Math.PI;
	const thetaLength = phiLength;
	const thetaStart = thetaMid - thetaLength / 2;

	const surfRadius = 100;
	const nBands = 7;
	const nRays = Math.ceil(nBands / 2);
	const dPhi = phiLength / (nBands - 1);
	const dTheta = thetaLength / (nBands - 1);

	if (objs3d.empty) {
		objs3d.empty = false;

		// Fixed objs
		{
			const starGeometry = new THREE.SphereGeometry(STAR_RADIUS);
			const star = new THREE.Mesh(starGeometry, STAR_MATERIAL);
			star.position.copy(STAR_POSITION);
			scene.add(star);

			const light = new THREE.AmbientLight(0xa06040);
			scene.add(light);

			const starLight = new THREE.PointLight(0xffffff, 1, 300, 2);
			starLight.position.copy(STAR_POSITION);

			const dirLightPositions = [
				[20, 20, 20],
				[20, 20, -20],
				[20, -20, 20],
				[20, -20, -20],
			];
			for (const [x, y, z] of dirLightPositions) {
				const directionalLight = new THREE.DirectionalLight(0xffffff, 0.5);
				directionalLight.target.position.copy(STAR_POSITION);
				directionalLight.position.set(x, y, z);
				scene.add(directionalLight);
				scene.add(directionalLight.target);
			}

			const phi = Math.PI / 2; // +x axis; will be rotated later

			for (let i = 0; i < nRays; i++) {
				const phiAngle = phiStart + i * (phiLength / (nRays - 1));
				for (let j = 0; j < nRays; j++) {
					const r = surfRadius * 1.1;
					const theta =
						thetaStart + (j * thetaLength) / (nRays - 1) + Math.PI / 2;
					const x = r * Math.cos(theta) * Math.sin(phi);
					const y = r * Math.sin(theta) * Math.sin(phi);
					const z = r * Math.cos(phi);

					const rayCurve = new THREE.LineCurve3(
						STAR_POSITION,
						new THREE.Vector3(x, y, z),
					);
					const rayGeom = new THREE.TubeGeometry(rayCurve, 3, 0.3);
					const ray = new THREE.Mesh(rayGeom, RAY_MATERIAL);

					ray.rotateY(phiAngle);
					scene.add(ray);
				}
			}
		}

		// The surface being illuminated
		{
			const surfGeom = new THREE.SphereGeometry(
				surfRadius,
				64,
				64,
				phiStart,
				phiLength,
				thetaStart,
				thetaLength,
			);
			const surf = new THREE.Mesh(surfGeom, SURFACE_MATERIAL);
			surf.position.copy(STAR_POSITION);

			scene.add(surf);
			objs3d.surf = surf;

			// The bands that aid visual clarity
			const xBands = [];
			const yBands = [];

			for (let i = 0; i < nBands; i++) {
				// Horizontal bands
				{
					const phiBand = new THREE.Mesh(
						new THREE.BufferGeometry(),
						BAND_MATERIAL,
					);
					phiBand.rotateY(phiStart + i * dPhi);

					scene.add(phiBand);
					xBands.push(phiBand);
				}

				// Vertical bands
				{
					const thetaBand = new THREE.Mesh(
						new THREE.BufferGeometry(),
						BAND_MATERIAL,
					);

					scene.add(thetaBand);
					yBands.push(thetaBand);
				}
			}

			objs3d.xBands = xBands;
			objs3d.yBands = yBands;
		}

		// The screen of fixed size
		{
			const screenObjs = [];

			const screenSideLength = 35;
			const screenProperGeom = new THREE.PlaneBufferGeometry(
				screenSideLength,
				screenSideLength,
				4,
				4,
			);
			const screenProper = new THREE.Mesh(screenProperGeom, SURFACE_MATERIAL);
			screenProper.rotateY(-Math.PI / 2);

			scene.add(screenProper);
			screenObjs.push(screenProper);

			const borderPoints = [
				[1, 1],
				[-1, 1],
				[-1, -1],
				[1, -1],
				[1, 1],
			];
			const screenBorderPath = new THREE.CurvePath();
			for (let i = 0; i < 4; i++) {
				const x = 0;
				const [[y1, z1], [y2, z2]] = [i, i + 1].map(j =>
					borderPoints[j].map(c => (c * screenSideLength) / 2),
				);
				screenBorderPath.curves.push(
					new THREE.LineCurve3(
						new THREE.Vector3(x, y1, z1),
						new THREE.Vector3(x, y2, z2),
					),
				);
			}
			// scr / order.lineTo(-screenHalfSide, -screenHalfSide);

			const screenBorderGeom = new THREE.TubeGeometry(
				screenBorderPath,
				4,
				0.2,
				4,
				true,
			);
			const screenBorder = new THREE.Mesh(
				screenBorderGeom,
				SCREEN_BORDER_MATERIAL,
			);

			scene.add(screenBorder);
			screenObjs.push(screenBorder);

			objs3d.screenObjs = screenObjs;
		}
	}

	const d = +distSlider.value;
	const scale = d / +distSlider.max;
	const rad = scale * surfRadius;

	for (const o of [objs3d.surf]) {
		o.scale.x = scale;
		o.scale.y = scale;
		o.scale.z = scale;

		o.visible = !screenIsVisible;
	}

	{
		const nBandPoints = 20;
		const bandPointIdxs = d3.range(nBandPoints);
		const bandRadius = 0.3;

		for (let i = 0; i < nBands; i++) {
			{
				const band = objs3d.xBands[i];
				const phi = Math.PI / 2; // +x axis; will be rotated later

				const phiCurvePoints = bandPointIdxs.map(i => {
					const theta =
						thetaStart +
						(i * thetaLength) / (nBandPoints - 1) +
						Math.PI / 2;
					const x = rad * Math.cos(theta) * Math.sin(phi);
					const y = rad * Math.sin(theta) * Math.sin(phi);
					const z = rad * Math.cos(phi);

					return new THREE.Vector3(x, y, z);
				});

				const phiCurve = new THREE.CatmullRomCurve3(phiCurvePoints);
				const phiGeom = new THREE.TubeGeometry(phiCurve, 32, bandRadius);
				band.geometry.dispose();
				band.geometry = phiGeom;

				band.visible = !screenIsVisible;
			}

			{
				const band = objs3d.yBands[i];
				const theta = thetaStart + i * dTheta;

				const thetaCurvePoints = bandPointIdxs.map(i => {
					const phi =
						phiStart + (i * phiLength) / (nBandPoints - 1) - Math.PI;
					// Not an error; the meridians go along the y-axis so we have to
					// change up the spherical coordinate formula
					const x = rad * Math.sin(theta) * Math.cos(phi);
					const y = rad * Math.cos(theta);
					const z = rad * Math.sin(theta) * Math.sin(phi);

					return new THREE.Vector3(x, y, z);
				});

				const thetaCurve = new THREE.CatmullRomCurve3(thetaCurvePoints);
				const thetaGeom = new THREE.TubeGeometry(thetaCurve, 32, bandRadius);
				band.geometry.dispose();
				band.geometry = thetaGeom;

				band.visible = !screenIsVisible;
			}
		}
	}

	{
		for (const so of objs3d.screenObjs) {
			so.position.set(rad, 0, 0);
			so.visible = screenIsVisible;
			// console.log(so.geometry.attributes.position);
			// so.geometry.attributes.position.needsUpdate = true;
		}
	}

	SURFACE_MATERIAL.color = new THREE.Color(surfaceColorScale(d));
	BAND_MATERIAL.color = new THREE.Color(bandColorScale(d));

	renderer.render(scene, camera);

	if (typeof katex.render !== "undefined") {
		const labelScale = +distSlider.value / initialDist;
		const rStr = labelScale.toFixed(3);
		const iStr = (1 / labelScale ** 2).toFixed(3);
		katex.render(String.raw`I=${iStr}I_0, r = ${rStr}r_0`, texts.katex);
	}
}

// eslint-disable-next-line no-unused-vars
function toggleScreen() {
	screenIsVisible = !screenIsVisible;
	update3d();
}

update3d();
