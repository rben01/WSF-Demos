/* global applyGraphicalObjs Complex THREE makeTextSprite katex */
const WIDTH = 800;
const HEIGHT = 400;
const HEIGHT_3D = 300;

const X_MIN = -12.2;
const X_0 = 0;
const X_MAX = -X_MIN;

const Y_MIN = -1.1;
const Y_0 = 0;
const Y_MAX = 1.1;

const floatFormatter = d3
	.formatLocale({ minus: "-", decimal: ".", thousands: "," })
	.format(".1f");
const textSpans = {
	kx: document.getElementById("text-kx"),
	omega: document.getElementById("text-omega"),
};

const canvas = document.getElementById("plot-3D");
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
		pointLight.position.set(0, -3, 20);
		return pointLight;
	})(),
);

const CAMERA_DEFAULT_POSITION = new THREE.Vector3(2.7, -5.5, 1.6);
const CAMERA_POINT_OF_FOCUS = new THREE.Vector3(0, 0, 0);
const DRAG_SPEED = 0.002; // scale factor to convert pixels dragged to radians

d3.select(canvas).call(
	d3.drag().on("drag", function (event) {
		const cameraDisplacementFromPointOfFocus = camera.position
			.clone()
			.sub(CAMERA_POINT_OF_FOCUS);

		const { dx, dy } = event;
		// z is up so x-drags rotate around the z-axis
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

camera.up.set(0, 0, 1);
camera.position.x = CAMERA_DEFAULT_POSITION.x;
camera.position.y = CAMERA_DEFAULT_POSITION.y;
camera.position.z = CAMERA_DEFAULT_POSITION.z;
camera.lookAt(CAMERA_POINT_OF_FOCUS);

const plot2D = d3.select("#plot-2D").attr("width", WIDTH).attr("height", HEIGHT);

const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

const curveGenerator = d3
	.line()
	.curve(d3.curveCatmullRom)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

const phaseLineGenerator = d3
	.line()
	.curve(d3.curveLinear)
	.defined(p => p !== null)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

let currentPhase = 0;
let isAnimating = false;

const omegaSlider = (() => {
	const slider = document.getElementById("slider-omega");
	slider.min = 0;
	slider.max = 5;
	slider.step = 0.0001;

	slider.oninput = function () {
		if (typeof katex !== "undefined") {
			katex.render(`\\omega=${floatFormatter(+this.value)}`, textSpans.omega);
		}
	};

	return slider;
})();

const wavenumberSlider = (() => {
	const slider = document.getElementById("slider-wavenumber");
	slider.min = 0.1;
	slider.max = 2.1;
	slider.step = 0.0001;
	slider.value = 1;
	slider.oninput = function () {
		// eslint-disable-next-line no-use-before-define
		updateOmega();
		// eslint-disable-next-line no-use-before-define
		update(0);
	};
	return slider;
})();

const DISPERSION = {
	nonrelativistic: 0,
	relativistic: 1,
	free: 2,
};

let currentDispersion = DISPERSION.nonrelativistic;

const nonRelativisticDispersionScale = d3
	.scalePow(
		[+wavenumberSlider.min, +wavenumberSlider.max],
		[+omegaSlider.min, +omegaSlider.max],
	)
	.exponent(2);

const relativisticDispersionScale = d3.scaleLinear(
	[+wavenumberSlider.min, +wavenumberSlider.max],
	[+omegaSlider.min, +omegaSlider.max],
);

function updateOmega() {
	if (currentDispersion === DISPERSION.free) {
		return;
	}

	const wavenumber = +wavenumberSlider.value;
	let currOmega;

	if (currentDispersion === DISPERSION.nonrelativistic) {
		currOmega = nonRelativisticDispersionScale(wavenumber);
	} else if (currentDispersion === DISPERSION.relativistic) {
		currOmega = relativisticDispersionScale(wavenumber);
	} else {
		throw new Error(`Unexpected dispersion ${currentDispersion}`);
	}

	omegaSlider.value = currOmega;
	if (typeof katex !== "undefined") {
		katex.render(`\\omega=${floatFormatter(currOmega)}`, textSpans.omega);
	}
}

function setDispersion(value) {
	currentDispersion = value;
	omegaSlider.disabled = true;
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
	omegaSlider.disabled = false;
}

setDispersionNonrelativistic();

function getAxisData() {
	const tickLength = 7;

	const xAxisTicks = xScale.ticks(20).filter(x => x !== X_0);
	const nXAxisLabels = 5;
	const xAxisLabelTicks = xScale.ticks(nXAxisLabels).filter(x => x !== X_0);
	const xAxisFormatter = xScale.tickFormat(nXAxisLabels);

	const yAxisTicks = yScale.ticks(5).filter(y => y !== Y_0);
	const nYAxisLabels = 5;
	const yAxisLabelTicks = yScale.ticks(nYAxisLabels).filter(y => y !== Y_0);
	const yAxisFormatter = yScale.tickFormat(nYAxisLabels, "~g");

	const xs0 = xScale(X_0);
	const ys0 = yScale(Y_0);

	const axisData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: ys0,
				y2: ys0,
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: xs0,
				x2: xs0,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		...xAxisTicks.map(x => {
			const xs = xScale(x);
			return {
				shape: "line",
				class: "axis axis-tick x-axis-tick",
				attrs: {
					x1: xs,
					x2: xs,
					y1: ys0,
					y2: ys0 + tickLength,
				},
			};
		}),
		...xAxisLabelTicks.map(x => {
			const xs = xScale(x);
			return {
				shape: "text",
				class: "axis axis-label x-axis-label",
				text: xAxisFormatter(x),
				attrs: {
					x: xs,
					y: ys0 + 12,
				},
			};
		}),
		...yAxisTicks.map(y => {
			const ys = yScale(y);
			return {
				shape: "line",
				class: "axis axis-tick y-axis-tick",
				attrs: {
					x1: xs0,
					x2: xs0 - tickLength,
					y1: ys,
					y2: ys,
				},
			};
		}),
		...yAxisLabelTicks.map(y => {
			const ys = yScale(y);
			return {
				shape: "text",
				class: "axis axis-label y-axis-label",
				text: yAxisFormatter(y),
				attrs: {
					x: xs0 - 10,
					y: ys,
				},
			};
		}),
		{
			shape: "text",
			class: "axis axis-label x-axis-label x-axis-name",
			text: "𝑥",
			attrs: {
				x: xScale(X_MAX) - 40,
				y: ys0 + 10,
			},
		},
	];

	return axisData;
}
applyGraphicalObjs(plot2D, getAxisData(), { selector: ".axis" });

function getWave3DPathAndIntersector(xMin, xMax, amplitude, xScale) {
	amplitude = amplitude ?? 1;

	const wavenumber = +wavenumberSlider.value / xScale;

	const nPoints = 500;
	const dx = (xMax - xMin) / (nPoints - 1);
	const points = [];
	for (let i = 0; i < nPoints; ++i) {
		const x = xMin + i * dx;
		const phase = wavenumber * x - currentPhase;
		const y = amplitude * Math.cos(phase);
		const z = amplitude * Math.sin(phase);
		points.push(new THREE.Vector3(x, y, z));
	}

	const path = new THREE.CatmullRomCurve3(points);

	const yzIntersectionPhase = -currentPhase;
	const re = amplitude * Math.cos(yzIntersectionPhase);
	const im = amplitude * Math.sin(yzIntersectionPhase);
	const intersector = new THREE.LineCurve3(
		new THREE.Vector3(0, 0, 0),
		new THREE.Vector3(0, re, im),
	);

	return { path, intersector, re, im };
}

function rotateThenPositionObject(
	object,
	axisV3,
	radiansNum,
	positionV3,
	absoluteRotation,
) {
	absoluteRotation = absoluteRotation ?? false;
	const rotObjectMatrix = new THREE.Matrix4();
	rotObjectMatrix.makeRotationAxis(axisV3, radiansNum);

	if (absoluteRotation) {
		object.matrix.copy(rotObjectMatrix);
	} else {
		object.matrix.multiply(rotObjectMatrix);
	}
	object.rotation.setFromRotationMatrix(object.matrix);

	const x = positionV3.x ?? 0;
	const y = positionV3.y ?? 0;
	const z = positionV3.z ?? 0;
	object.position.set(x, y, z);
}

function makeAxisLabel(text) {
	return makeTextSprite(text, { fontface: "Times" });
}

const objs3d = { empty: true };
function update3D() {
	const xScale = 1.6;
	const xMin = X_MIN * xScale;
	const xMax = X_MAX * xScale;

	const amplitude = 5;
	const yMin = amplitude * Y_MIN;
	const yMax = amplitude * Y_MAX;

	const arrowheadRadius = 0.25;
	const arrowheadHeight = 0.7;
	const arrowheadGeometry = new THREE.ConeBufferGeometry(
		arrowheadRadius,
		arrowheadHeight,
	);

	if (objs3d.empty) {
		objs3d.empty = false;
		const axisRadius = 0.06;
		const axisExtensionFactor = 1.3;

		// x axis
		(() => {
			const xAxixGeometry = new THREE.TubeBufferGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(xMin, 0, 0),
					new THREE.Vector3(xMax, 0, 0),
				),
				64,
				axisRadius * 1.5,
				8,
			);
			const xAxis = new THREE.Mesh(xAxixGeometry, AXIS_MATERIAL);

			// arrowhead rotation code from https://stackoverflow.com/a/11060965
			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			rotateThenPositionObject(
				arrowhead,
				new THREE.Vector3(0, 0, 1),
				-Math.PI / 2,
				{ x: xMax },
			);

			scene.add(xAxis, arrowhead);
		})();

		// y axis
		(() => {
			const yAxixGeometry = new THREE.TubeBufferGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(0, yMin * axisExtensionFactor, 0),
					new THREE.Vector3(0, yMax * axisExtensionFactor, 0),
				),
				64,
				axisRadius,
				8,
			);
			const yAxis = new THREE.Mesh(yAxixGeometry, AXIS_MATERIAL);

			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			rotateThenPositionObject(
				arrowhead,
				new THREE.Vector3(0, 1, 0),
				-Math.PI / 2,
				{ y: yMax * axisExtensionFactor },
			);

			scene.add(yAxis, arrowhead);
		})();

		// z axis
		(() => {
			const zAxixGeometry = new THREE.TubeBufferGeometry(
				new THREE.LineCurve3(
					new THREE.Vector3(0, 0, yMin * axisExtensionFactor),
					new THREE.Vector3(0, 0, yMax * axisExtensionFactor),
				),
				64,
				axisRadius,
				8,
			);
			const zAxis = new THREE.Mesh(zAxixGeometry, AXIS_MATERIAL);

			const arrowhead = new THREE.Mesh(arrowheadGeometry, AXIS_MATERIAL);
			rotateThenPositionObject(
				arrowhead,
				new THREE.Vector3(1, 0, 0),
				Math.PI / 2,
				{ z: yMax * axisExtensionFactor },
			);

			scene.add(zAxis, arrowhead);
		})();

		// axis labels
		(() => {
			const xAxisLabel = makeAxisLabel("𝑥");
			xAxisLabel.position.x = xMax;
			xAxisLabel.position.y = 0;
			xAxisLabel.position.z = 0;
			scene.add(xAxisLabel);

			const yAxisLabel = makeAxisLabel("Re[𝜓]");
			yAxisLabel.position.x = 0;
			yAxisLabel.position.y = yMax * axisExtensionFactor;
			yAxisLabel.position.z = 0;
			scene.add(yAxisLabel);

			const zAxisLabel = makeAxisLabel("Im[𝜓]");
			zAxisLabel.position.x = 0;
			zAxisLabel.position.y = 0;
			zAxisLabel.position.z = yMax * axisExtensionFactor;
			scene.add(zAxisLabel);
		})();

		// wave template geometry
		(() => {
			const wave = new THREE.Mesh(new THREE.BufferGeometry(), WAVE_MATERIAL);
			scene.add(wave);
			objs3d.wave = wave;
		})();

		// (static) yz plane (C plane)
		(() => {
			const yzPlane = new THREE.Mesh(
				new THREE.RingBufferGeometry(amplitude * 0.98, amplitude * 1.02, 75, 1),
				AXIS_MATERIAL,
			);
			rotateThenPositionObject(
				yzPlane,
				new THREE.Vector3(0, 1, 0),
				Math.PI / 2,
				{},
			);
			scene.add(yzPlane);
		})();

		// intersection with yz plane (C plane)
		(() => {
			const yzPlaneIntersector = new THREE.Mesh(
				new THREE.BufferGeometry(),
				INTERSECTOR_MATERIAL,
			);

			const yzPlaneIntersectorArrowhead = new THREE.Mesh(
				new THREE.ConeBufferGeometry(
					arrowheadRadius * 1.1,
					arrowheadHeight * 1.1,
				),
				INTERSECTOR_MATERIAL,
			);

			const realPartMarker = new THREE.Mesh(
				new THREE.BufferGeometry(),
				REAL_PART_MATERIAL,
			);
			const imagPartMarker = new THREE.Mesh(
				new THREE.BufferGeometry(),
				IMAG_PART_MATERIAL,
			);

			scene.add(
				yzPlaneIntersector,
				yzPlaneIntersectorArrowhead,
				realPartMarker,
				imagPartMarker,
			);
			Object.assign(objs3d, {
				yzPlaneIntersector,
				yzPlaneIntersectorArrowhead,
				realPartMarker,
				imagPartMarker,
			});
		})();
	}

	const {
		wave,
		yzPlaneIntersector,
		yzPlaneIntersectorArrowhead,
		realPartMarker,
		imagPartMarker,
	} = objs3d;

	const { path, intersector, re, im } = getWave3DPathAndIntersector(
		xMin,
		xMax,
		amplitude,
		xScale,
	);

	wave.geometry.dispose();
	wave.geometry = new THREE.TubeBufferGeometry(path, 300, 0.2);

	const markerRadius = 0.15;

	yzPlaneIntersector.geometry.dispose();
	yzPlaneIntersector.geometry = new THREE.TubeBufferGeometry(
		intersector,
		2,
		markerRadius,
	);

	realPartMarker.geometry.dispose();
	realPartMarker.geometry = new THREE.TubeBufferGeometry(
		new THREE.LineCurve3(new THREE.Vector3(0, 0, 0), new THREE.Vector3(0, re, 0)),
		2,
		markerRadius * 1.1,
	);

	imagPartMarker.geometry.dispose();
	imagPartMarker.geometry = new THREE.TubeBufferGeometry(
		new THREE.LineCurve3(new THREE.Vector3(0, re, 0), new THREE.Vector3(0, re, im)),
		2,
		markerRadius * 1.1,
	);

	rotateThenPositionObject(
		yzPlaneIntersectorArrowhead,
		new THREE.Vector3(1, 0, 0),
		Math.atan2(im, re),
		{ y: re, z: im },
		true,
	);

	renderer.render(scene, camera);
}
update3D();

function getData() {
	const wavenumber = +wavenumberSlider.value;

	const nPointsPerPeriod = 35;

	const periodWidth = (2 * Math.PI) / wavenumber;
	const nPeriods = Math.ceil((X_MAX - X_MIN) / periodWidth);
	const dx = periodWidth / (nPointsPerPeriod - 1);

	const curvePoints = []; // list of points [x, real, imag]
	for (let p = 0; p < nPeriods; ++p) {
		const periodX0 = X_MIN + p * periodWidth;
		for (let i = 0; i < nPointsPerPeriod; ++i) {
			const x = periodX0 + i * dx;
			const phase = wavenumber * x - currentPhase;

			const z = Complex.cis(phase);
			const re = z.re;
			const im = z.im;

			curvePoints.push({ x, re, im });
		}
	}

	function nForX(x) {
		return (wavenumber * x - currentPhase) / (2 * Math.PI);
	}
	const nMin = Math.floor(nForX(X_MIN));
	const nMax = Math.ceil(nForX(X_MAX));

	const phaseCurvePoints = d3.range(nMin, nMax + 1).flatMap(n => {
		const xMid = (currentPhase + 2 * Math.PI * n) / wavenumber;
		const xMin = xMid;
		const xMax = xMid + periodWidth;
		return [[xMin, 0], [xMax, 1], null];
	});

	const curveData = [
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} phase`,
			attrs: {
				d: phaseLineGenerator(phaseCurvePoints),
			},
		})),
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} imag-part`,
			attrs: {
				d: curveGenerator(curvePoints.map(({ x, im }) => [x, im])),
			},
		})),
		...["curve-background", "curve-foreground"].map(c => ({
			shape: "path",
			class: `curve ${c} real-part`,
			attrs: {
				d: curveGenerator(curvePoints.map(({ x, re }) => [x, re])),
			},
		})),
	];

	return curveData;
}

function update(dtMS) {
	dtMS = dtMS ?? 0;
	const omega = +omegaSlider.value;
	currentPhase += (omega * dtMS) / 1000;

	const kx = +wavenumberSlider.value;

	applyGraphicalObjs(plot2D, getData(), { selector: ".curve" });
	update3D();

	if (typeof katex !== "undefined") {
		katex.render(`k_x=${floatFormatter(kx)}`, textSpans.kx);
		katex.render(`\\omega=${floatFormatter(omega)}`, textSpans.omega);
	}
}

update(0);

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
	update();
}
