/* global Complex THREE makeTextSprite makeThreeCameraDrag Line2D katex */
const WIDTH = 900;
const HEIGHT_3D = 700;

const X_MAX = 2 * Math.PI;
const X_MIN = -X_MAX;
const X_0 = 0;

const xScale3D = d3.scaleLinear([-1, 1], [-2, 2]);

const Y_MAX = X_MAX;
const Y_MIN = -Y_MAX;
const Y_0 = X_0;

const yScale3D = d3.scaleLinear([-1, 1], [-2, 2]);

const Z_MIN = -1.2;
const Z_MAX = -Z_MIN;

const zScale3D = d3.scaleLinear([-1, 1], [-4, 4]);

const MIN_ABS_WAVENUMBER = 0;
const MAX_ABS_WAVENUMBER = 2;

const wavenumberToNSlicesForUnselected = (() => {
	const scale = d3
		.scalePow()
		.domain([MIN_ABS_WAVENUMBER, MAX_ABS_WAVENUMBER])
		.rangeRound([13, 80])
		.exponent(0.5);
	return k => scale(Math.abs(k));
})();
const wavenumberToNSlicesForSelected = (() => {
	const scale = d3
		.scalePow()
		.domain([MIN_ABS_WAVENUMBER, MAX_ABS_WAVENUMBER])
		.rangeRound([20, 130])
		.exponent(0.5);
	return k => scale(Math.abs(k));
})();

const canvas = document.getElementById("plot-comp");
d3.select(canvas).attr("width", WIDTH).attr("height", HEIGHT_3D);
const scene = new THREE.Scene();
const camera = new THREE.PerspectiveCamera(
	50,
	canvas.clientWidth / canvas.clientHeight,
	0.1,
	100,
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
		// By default aimed at the origin, which is fine for us
		const dirLight = new THREE.DirectionalLight(0xffffff, 0.6);
		dirLight.position.set(X_MIN - 1, Y_MIN - 1, 20);
		return dirLight;
	})(),
);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(19, 40, 15);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const CAMERA_UP = new THREE.Vector3(0, 0, 1);
CAMERA_UP.normalize();

camera.up.copy(CAMERA_UP);
camera.position.copy(CAMERA_DEFAULT_POSITION);
camera.lookAt(CAMERA_POINT_OF_FOCUS);

d3.select(canvas).call(
	makeThreeCameraDrag({
		camera,
		scene,
		renderer,
		up: CAMERA_UP,
		pointOfFocus: CAMERA_POINT_OF_FOCUS,
	}),
);

const PSI_COMPONENTS = {
	real: "real",
	imag: "imag",
	phase: "phase",
};

const VISIBILITY_STATE = {
	visible: 0,
	dim: 1,
	hidden: 2,
};
const N_VISIBILITY_STATES = Object.keys(VISIBILITY_STATE).length;

const componentVisibilities = {
	[PSI_COMPONENTS.real]: VISIBILITY_STATE.visible,
	[PSI_COMPONENTS.imag]: VISIBILITY_STATE.hidden,
	[PSI_COMPONENTS.phase]: VISIBILITY_STATE.hidden,
};

const AXIS_COLOR = 0xaaaaaa;
const AXIS_MATERIAL = new THREE.MeshBasicMaterial({
	color: AXIS_COLOR,
	side: THREE.DoubleSide,
	transparent: false,
});
const REAL_PART_SELECTED_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0x2277ff,
	side: THREE.DoubleSide,
	transparent: false,
	opacity: 1,
});
const IMAG_PART_SELECTED_MATERIAL = new THREE.MeshLambertMaterial({
	color: 0xf3b822,
	side: THREE.DoubleSide,
	transparent: false,
	opacity: 1,
});
const PHASE_SELECTED_MATERIAL = new THREE.MeshBasicMaterial({
	color: 0xee55dd,
	side: THREE.DoubleSide,
	transparent: false,
	opacity: 1,
});

const sliders = {
	kx: document.getElementById("slider-wavenumber-x"),
	ky: document.getElementById("slider-wavenumber-y"),
	omega: (() => {
		const slider = document.getElementById("slider-omega");
		slider.min = 0;
		slider.max = 5;
		slider.step = 0.01;
		return slider;
	})(),
};

const wavenumberSliders = [sliders.kx, sliders.ky];

d3.selectAll(".wavenumber-slider").each(function () {
	const slider = this;
	slider.min = -MAX_ABS_WAVENUMBER;
	slider.max = MAX_ABS_WAVENUMBER;
	slider.step = 0.01;
	slider.value = 0;

	d3.select(slider).on("input", () => {
		// eslint-disable-next-line no-use-before-define
		updateOmega();
		// eslint-disable-next-line no-use-before-define
		update();
	});
});

const DISPERSION = {
	nonrelativistic: 0,
	relativistic: 1,
	free: 2,
};

let currentDispersion = DISPERSION.nonrelativistic;

const nonRelativisticDispersionScale = d3
	.scalePow(
		[2 * MIN_ABS_WAVENUMBER ** 2, 2 * MAX_ABS_WAVENUMBER ** 2],
		[+sliders.omega.min, +sliders.omega.max],
	)
	.exponent(2);

const relativisticDispersionScale = d3.scaleLinear(
	[2 * MIN_ABS_WAVENUMBER ** 2, 2 * MAX_ABS_WAVENUMBER ** 2],
	[+sliders.omega.min, +sliders.omega.max],
);

function updateOmega() {
	if (currentDispersion === DISPERSION.free) {
		return;
	}

	const wavenumber = wavenumberSliders
		.map(slider => (+slider.value) ** 2)
		.reduce((a, b) => a + b);

	let currOmega;

	if (currentDispersion === DISPERSION.nonrelativistic) {
		currOmega = nonRelativisticDispersionScale(wavenumber);
	} else if (currentDispersion === DISPERSION.relativistic) {
		currOmega = relativisticDispersionScale(wavenumber);
	} else {
		throw new Error(`Unexpected dispersion ${currentDispersion}`);
	}

	sliders.omega.value = currOmega;
}

function setDispersion(value) {
	currentDispersion = value;
	sliders.omega.disabled = true;
	updateOmega();
}

// eslint-disable-next-line no-unused-vars
function setDispersionNonrelativistic() {
	setDispersion(DISPERSION.nonrelativistic);
}

// eslint-disable-next-line no-unused-vars
function setDispersionRelativistic() {
	setDispersion(DISPERSION.relativistic);
}

// eslint-disable-next-line no-unused-vars
function setDispersionFree() {
	currentDispersion = DISPERSION.free;
	sliders.omega.disabled = false;
}

setDispersionNonrelativistic();

function psi(x, y, kx, ky, omega) {
	const phi = kx * x + ky * y - omega;
	return Complex.cis(phi);
}

const MODES = {
	real: 0,
	imag: 1,
};

let currentOmega = 0;

const X_MIN_LINE = Line2D.fromConstantX(X_MIN);
const X_MAX_LINE = Line2D.fromConstantX(X_MAX);
const Y_MIN_LINE = Line2D.fromConstantY(Y_MIN);
const Y_MAX_LINE = Line2D.fromConstantY(Y_MAX);

function getWavefunctionFunction(kx, ky, mode) {
	const uSlope = ky / kx;
	const uLine = Line2D.fromPointSlopeForm(X_0, Y_0, uSlope);
	const vSlope = -1 / uSlope;

	const [cornerLines1, cornerLines2] =
		uSlope > 0
			? [
					[X_MIN_LINE, Y_MAX_LINE], // Intersection toward top left
					[X_MAX_LINE, Y_MIN_LINE], // Intersection toward bottom right
			  ]
			: [
					[X_MIN_LINE, Y_MIN_LINE], // Intersection toward bottom left
					[X_MAX_LINE, Y_MAX_LINE], // Intersection toward top right
			  ];

	const boundingVLine1 = Line2D.fromPointSlopeForm(
		X_MIN,
		uSlope > 0 ? Y_MIN : Y_MAX,
		vSlope,
	);
	const boundingVLine2 = Line2D.fromPointSlopeForm(
		X_MAX,
		uSlope > 0 ? Y_MAX : Y_MIN,
		vSlope,
	);

	const uLineEndpoint1 = uLine.intersectionWith(boundingVLine1);
	const uLineEndpoint2 = uLine.intersectionWith(boundingVLine2);

	function wavefunctionValue(u, v, vec) {
		// We want to design this so that u moves perpendicular to the waveform (against
		// the grain, so to speak) and v moves parallel (with the grain) while keeping
		// all points within the region [X_MIN, X_MAX] * [Y_MIN, Y_MAX]. The line which
		// u varies along will be y = Y_0 + m * (x - X_0) (i.e., the line of slope m
		// passing through (X_0, Y_0)) where m is the slope of the line that goes
		// against the grain, except if kx === 0 or ky === 0. Note that this u-line must
		// extend beyond the bounds of the box so that the v-line can cover the whole
		// box

		// The components of the vector we'll return
		let x, y;

		// The simple cases, where the line is degenerate (surface is a flat plane),
		// vertical (kx === 0), or horizontal (ky === 0), require some care because the
		// intersections we would otherwise use won't exist. Thankfully these cases are
		// trivial.
		if (kx === 0 || ky === 0) {
			let xVar, yVar;
			if (ky === 0) {
				// Either the degenerate case (if kx === 0) or the horizontal case (if kx
				// !== 0)
				xVar = u;
				yVar = v;
			} else {
				// the vertical case
				xVar = v;
				yVar = u;
			}
			x = X_MIN + xVar * (X_MAX - X_MIN);
			y = Y_MIN + yVar * (Y_MAX - Y_MIN);
		} else {
			// If kx !== 0 and ky !== 0 then we can actually do this the "right" (i.e.,
			// hard) way

			const [uvIntersectionPointX, uvIntersectionPointY] = d3.interpolate(
				uLineEndpoint1,
				uLineEndpoint2,
			)(u);

			const vLine = Line2D.fromPointSlopeForm(
				uvIntersectionPointX,
				uvIntersectionPointY,
				vSlope,
			);

			const [p1, p2] = [cornerLines1, cornerLines2].map(linePair => {
				const [d1, d2] = linePair.map(line => {
					const point = line.intersectionWith(vLine);
					const sqDist =
						(point[0] - uvIntersectionPointX) ** 2 +
						(point[1] - uvIntersectionPointY) ** 2;
					return { sqDist, point };
				});

				return d1.sqDist < d2.sqDist ? d1.point : d2.point;
			});

			[x, y] = d3.interpolateArray(p1, p2)(v);
		}

		const zC = psi(x, y, kx, ky, currentOmega);
		let z;
		if (mode === MODES.real) {
			z = zC.re;
		} else if (mode === MODES.imag) {
			z = zC.im;
		}

		return vec.set(xScale3D(x), yScale3D(y), z * 1.1);
	}

	return wavefunctionValue;
}

function setSelectedPsiComponent(comp) {
	// Silly JS, why is (-1) % 3 === -1 and not 2??
	componentVisibilities[comp] =
		(componentVisibilities[comp] + (N_VISIBILITY_STATES - 1)) % N_VISIBILITY_STATES;
	// eslint-disable-next-line no-use-before-define
	update();
}

// eslint-disable-next-line no-unused-vars
function showReal() {
	setSelectedPsiComponent("real");
}

// eslint-disable-next-line no-unused-vars
function showImaginary() {
	setSelectedPsiComponent("imag");
}

// eslint-disable-next-line no-unused-vars
function showPhase() {
	setSelectedPsiComponent("phase");
}

const pointerHeight = yScale3D(0.2) - yScale3D(0);
const pointerZScaled = 1.5;

function setMaterialOpacity(material, visibilityState) {
	const opacity =
		visibilityState === VISIBILITY_STATE.visible
			? 1
			: visibilityState === VISIBILITY_STATE.dim
			? 0.2
			: visibilityState === VISIBILITY_STATE.hidden
			? 0
			: null;

	if (opacity === null) {
		throw new Error(`Invalid visibilityState ${visibilityState}`);
	}

	material.transparent = opacity !== 1;
	material.visible = opacity !== 0;
	material.opacity = opacity;
}

const floatFormatter = d3
	.formatLocale({ minus: "-", decimal: ".", thousands: "," })
	.format(".1f");
const textSpans = {
	kx: document.getElementById("text-kx"),
	ky: document.getElementById("text-ky"),
	omega: document.getElementById("text-omega"),
};

const objs3d = { empty: true };
function update(dtMS) {
	dtMS = dtMS ?? 0;
	const omega = +sliders.omega.value;
	currentOmega += (omega * dtMS) / 500;

	if (objs3d.empty) {
		objs3d.empty = false;

		// Axes and their ticks and labels
		(() => {
			const axisNTubularSegments = 1;
			const axisRadius = 0.1;
			const axisNRadialSegments = 10;
			const nonArrowAxisMeshes = [
				// First create just the pairs of points that will form the axes (exluding arrow axes)
				// Base
				...[
					[
						[X_MAX, Y_MIN],
						[X_MAX, Y_MAX],
					],
					[
						[X_MAX, Y_MAX],
						[X_MIN, Y_MAX],
					],
				].map(([[x1, y1], [x2, y2]]) => [
					[x1, y1, Z_MIN],
					[x2, y2, Z_MIN],
				]),
				// Right back side
				...[
					[
						[Y_MIN, Z_MAX],
						[Y_MAX, Z_MAX],
					],
					[
						[Y_MAX, Z_MAX],
						[Y_MAX, Z_MIN],
					],
				].map(([[y1, z1], [y2, z2]]) => [
					[X_MIN, y1, z1],
					[X_MIN, y2, z2],
				]),
				// Left back side
				...[
					[
						[X_MIN, Z_MAX],
						[X_MAX, Z_MAX],
					],
					[
						[X_MAX, Z_MAX],
						[X_MAX, Z_MIN],
					],
				].map(([[x1, z1], [x2, z2]]) => [
					[x1, Y_MIN, z1],
					[x2, Y_MIN, z2],
				]),
			].map(endpoints => {
				// Now convert these points into a LineCurve3 and then pass to a TubeBufferGeometry
				const [v1, v2] = endpoints.map(
					([x, y, z]) =>
						new THREE.Vector3(xScale3D(x), yScale3D(y), zScale3D(z)),
				);
				const geometry = new THREE.TubeBufferGeometry(
					new THREE.LineCurve3(v1, v2),
					axisNTubularSegments,
					axisRadius,
					axisNRadialSegments,
				);
				return new THREE.Mesh(geometry, AXIS_MATERIAL);
			});

			const arrowLength = 4;
			const arrowheadLength = 1;
			const arrowheadWidth = 0.4;
			const arrowMeshes = [
				{
					points: [
						{ xyz: [X_MIN, Y_MIN, Z_MIN], extend: null },
						{ xyz: [X_MAX, Y_MIN, Z_MIN], extend: "x" },
					],
					rotateZ: -Math.PI / 2,
				},
				{
					points: [
						{ xyz: [X_MIN, Y_MIN, Z_MIN], extend: null },
						{ xyz: [X_MIN, Y_MAX, Z_MIN], extend: "y" },
					],
				},
				{
					points: [
						{ xyz: [X_MIN, Y_MIN, Z_MIN], extend: null },
						{ xyz: [X_MIN, Y_MIN, Z_MAX], extend: "z" },
					],
					rotateX: Math.PI / 2,
				},
			].flatMap(d => {
				const [v1, v2] = d.points.map(({ xyz, extend }) => {
					const [x, y, z] = xyz;
					return new THREE.Vector3(
						xScale3D(x) + (extend === "x" ? arrowLength : 0),
						yScale3D(y) + (extend === "y" ? arrowLength : 0),
						zScale3D(z) + (extend === "z" ? arrowLength : 0),
					);
				});
				const line = new THREE.Mesh(
					new THREE.TubeBufferGeometry(
						new THREE.LineCurve3(v1, v2),
						axisNTubularSegments,
						axisRadius,
						axisNRadialSegments,
					),
					AXIS_MATERIAL,
				);
				const cone = new THREE.Mesh(
					new THREE.ConeBufferGeometry(arrowheadWidth, arrowheadLength, 8),
					AXIS_MATERIAL,
				);
				cone.position.copy(v2);
				if (d.rotateX ?? false) {
					cone.geometry.rotateX(d.rotateX);
				} else if (d.rotateY ?? false) {
					cone.geometry.rotateY(d.rotateY);
				} else if (d.rotateZ ?? false) {
					cone.geometry.rotateZ(d.rotateZ);
				}

				return [line, cone];
			});

			const textColorFloats = new THREE.Color(0xcccccc);
			const textColor = Object.fromEntries(
				["r", "g", "b"].map(c => [c, textColorFloats[c] * 255]),
			);
			const axisLabels = [
				{ xyz: [X_MAX, Y_MIN, Z_MIN], dxyz: [arrowLength, 0, -0.2], text: "𝑥" },
				{ xyz: [X_MIN, Y_MAX, Z_MIN], dxyz: [0, arrowLength, -0.2], text: "𝑦" },
				{
					xyz: [X_MIN, Y_MIN, Z_MAX],
					dxyz: [-0.1, 1.4, arrowLength + 2],
					text: "𝑧",
				},
			].map(({ xyz, dxyz, text }) => {
				const sprite = makeTextSprite(text, {
					fontsize: 40,
					textColor,
				});
				const [x, y, z] = xyz;
				const [dx, dy, dz] = dxyz;
				sprite.position.set(
					xScale3D(x) + dx,
					yScale3D(y) + dy,
					zScale3D(z) + dz,
				);
				sprite.material.depthWrite = false;
				return sprite;
			});

			scene.add(...nonArrowAxisMeshes, ...arrowMeshes, ...axisLabels);
			objs3d.axes = { meshes: nonArrowAxisMeshes };
		})();

		// The real and imaginary parts of the wavefunction
		(() => {
			const wavefunctionRe = new THREE.Mesh(new THREE.BufferGeometry());
			const wavefunctionIm = new THREE.Mesh(new THREE.BufferGeometry());

			scene.add(wavefunctionRe, wavefunctionIm);
			objs3d.wavefunction = { real: wavefunctionRe, imag: wavefunctionIm };
		})();

		// The phase indicators
		(() => {
			const pointerWidth = xScale3D(0.065) - xScale3D(0);

			const gridSpacing = 0.39;

			const nXGridPoints = Math.ceil((X_MAX - X_MIN) / gridSpacing);
			const xGridSpacing = (X_MAX - X_MIN) / (nXGridPoints - 1);

			const nYGridPoints = Math.ceil((Y_MAX - Y_MIN) / gridSpacing);
			const nYGridSpacing = (Y_MAX - Y_MIN) / (nYGridPoints - 1);

			const meshes = [];
			for (let i = 1; i < nXGridPoints - 1; ++i) {
				const x = X_MIN + i * xGridSpacing;
				const xScaled = xScale3D(x);
				for (let j = 1; j < nYGridPoints - 1; ++j) {
					const y = Y_MIN + j * nYGridSpacing;
					const yScaled = yScale3D(y);

					const mesh = new THREE.Mesh(
						new THREE.ConeBufferGeometry(pointerWidth, pointerHeight, 8, 1),
					);
					scene.add(mesh);
					meshes.push({ x, xScaled, yScaled, y, mesh });
				}
			}
			objs3d.pointers = { pointers: meshes };
		})();
	}
	const kx = +sliders.kx.value;
	const ky = +sliders.ky.value;

	const { real: realPartMesh, imag: imagPartMesh } = objs3d.wavefunction;
	realPartMesh.geometry.dispose();
	imagPartMesh.geometry.dispose();

	for (const { mesh, material, mode, thisPsiComponent } of [
		{
			mesh: realPartMesh,
			material: REAL_PART_SELECTED_MATERIAL,
			mode: MODES.real,
			thisPsiComponent: PSI_COMPONENTS.real,
		},
		{
			mesh: imagPartMesh,
			material: IMAG_PART_SELECTED_MATERIAL,
			mode: MODES.imag,
			thisPsiComponent: PSI_COMPONENTS.imag,
		},
	]) {
		const thisComponentVisibility = componentVisibilities[thisPsiComponent];
		let wavenumberSliceScale;
		if (thisComponentVisibility === VISIBILITY_STATE.visible) {
			wavenumberSliceScale = wavenumberToNSlicesForSelected;
		} else {
			wavenumberSliceScale = wavenumberToNSlicesForUnselected;
		}

		setMaterialOpacity(material, thisComponentVisibility);

		mesh.geometry = new THREE.ParametricBufferGeometry(
			getWavefunctionFunction(kx, ky, mode),
			wavenumberSliceScale((kx ** 2 + ky ** 2) ** 0.5), // u components
			1, // v componenets
		);
		mesh.material = material;
	}

	const { pointers } = objs3d.pointers;
	setMaterialOpacity(
		PHASE_SELECTED_MATERIAL,
		componentVisibilities[PSI_COMPONENTS.phase],
	);

	for (const { x, xScaled, y, yScaled, mesh } of pointers) {
		const phase = psi(x, y, kx, ky, currentOmega).phase;
		mesh.position.set(
			xScaled + pointerHeight * Math.sin(-phase) * 0.7,
			yScaled + pointerHeight * Math.cos(-phase) * 0.7,
			pointerZScaled,
		);
		mesh.setRotationFromAxisAngle(new THREE.Vector3(0, 0, 1), phase);
		mesh.material = PHASE_SELECTED_MATERIAL;
	}

	renderer.render(scene, camera);

	if (typeof katex !== "undefined") {
		const omega = +sliders.omega.value;
		katex.render(`k_x=${floatFormatter(kx)}`, textSpans.kx);
		katex.render(`k_y=${floatFormatter(ky)}`, textSpans.ky);
		katex.render(`\\omega=${floatFormatter(omega)}`, textSpans.omega);
	}
}

d3.select(sliders.omega).on("input", () => update());
update();

let isAnimating = false;
let animationFrame;
// eslint-disable-next-line no-unused-vars
function play() {
	isAnimating = true;

	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedMS = timestampMS - prevTimestampMS;
		update(elapsedMS);
		prevTimestampMS = timestampMS;

		if (isAnimating) {
			animationFrame = window.requestAnimationFrame(step);
		}
	}

	animationFrame = window.requestAnimationFrame(step);
}

function stop() {
	window.cancelAnimationFrame(animationFrame);
	isAnimating = false;
}

// eslint-disable-next-line no-unused-vars
function reset() {
	stop();
	currentOmega = 0;
	update();
}
