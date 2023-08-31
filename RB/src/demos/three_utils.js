/* global THREE */
// https://stackoverflow.com/a/27348780

function roundRect(ctx, x, y, w, h, r) {
	ctx.beginPath();
	ctx.moveTo(x + r, y);
	ctx.lineTo(x + w - r, y);
	ctx.quadraticCurveTo(x + w, y, x + w, y + r);
	ctx.lineTo(x + w, y + h - r);
	ctx.quadraticCurveTo(x + w, y + h, x + w - r, y + h);
	ctx.lineTo(x + r, y + h);
	ctx.quadraticCurveTo(x, y + h, x, y + h - r);
	ctx.lineTo(x, y + r);
	ctx.quadraticCurveTo(x, y, x + r, y);
	ctx.closePath();
	ctx.fill();
	ctx.stroke();
}

const _three_utils_white = { r: 255, g: 255, b: 255, a: 1.0 };
const _three_utils_clear = { r: 0, g: 0, b: 0, a: 0.0 };
// eslint-disable-next-line no-unused-vars
function makeTextSprite(
	message,
	{
		fontface,
		fontsize,
		fontweight,
		borderThickness,
		borderColor,
		backgroundColor,
		textColor,
		aspectRatio,
		depthWrite,
	} = {},
) {
	// const _black = { r: 0, g: 0, b: 0, a: 1.0 };

	fontface = fontface ?? "sans-serif";
	fontsize = (fontsize ?? 27) / (window.devicePixelRatio / 2) ** 0.5;
	fontweight = fontweight ?? "";
	borderThickness = borderThickness ?? 0;
	borderColor = borderColor ?? _three_utils_clear;
	backgroundColor = backgroundColor ?? _three_utils_clear;
	textColor = textColor ?? _three_utils_white;
	aspectRatio = aspectRatio ?? 1;
	depthWrite = depthWrite ?? false;

	const canvas = document.createElement("canvas");

	// Create the context and set its scale correctly
	const context = canvas.getContext("2d");
	// These three lines have to go right after creating the context, and they have to
	// go in this order
	// https://stackoverflow.com/a/15666143/5496433
	canvas.width *= 2;
	canvas.height *= 2;
	const _pxRat = window.devicePixelRatio;
	context.setTransform(_pxRat, 0, 0, _pxRat, 0, 0);
	// Don't change the above!

	context.font = `${fontweight} ${fontsize}px ${fontface}`;
	const metrics = context.measureText(message);
	const textWidth = metrics.width;

	context.fillStyle = `rgba(${backgroundColor.r},${backgroundColor.g},${backgroundColor.b},${backgroundColor.a})`;
	context.strokeStyle = `rgba(${borderColor.r},${borderColor.g},${borderColor.b},${borderColor.a})`;

	context.lineWidth = borderThickness;
	roundRect(
		context,
		borderThickness / 2,
		borderThickness / 2,
		(textWidth + borderThickness) * 1.1,
		fontsize * 1.4 + borderThickness,
		8,
	);

	context.fillStyle = `rgba(${textColor.r}, ${textColor.g}, ${textColor.b}, 1.0)`;
	context.fillText(`${message}`, borderThickness + 0.5, fontsize + borderThickness);

	const texture = new THREE.CanvasTexture(canvas);

	const spriteMaterial = new THREE.SpriteMaterial({
		map: texture,
		// useScreenCoordinates: false,
	});
	const sprite = new THREE.Sprite(spriteMaterial);
	sprite.scale.set(0.5 * fontsize * aspectRatio, 0.25 * fontsize, 0.75 * fontsize);
	sprite.center.set(0, 1);

	sprite.material.depthWrite = depthWrite;

	return sprite;
}

const _three_utils_upZ = new THREE.Vector3(0, 0, 1);
function getNewPositionForDrag({ dx, dy, up, oldPosition, pointOfFocus, dragSpeed }) {
	const rotAxisHypotenuse = (dx ** 2 + dy ** 2) ** 0.5;
	if (rotAxisHypotenuse < 1e-12) {
		return null;
	}

	const rotAxisXDir = -dy;
	const rotAxisYDir = -dx;
	const rotAxisCosTheta = rotAxisXDir / rotAxisHypotenuse;
	const rotAxisSinTheta = rotAxisYDir / rotAxisHypotenuse;

	const originalDisplacementFromPointOfFocus = oldPosition.clone().sub(pointOfFocus);

	const originalDisplacementComponentParallelToUp = up
		.clone()
		.multiplyScalar(originalDisplacementFromPointOfFocus.dot(up));
	const originalDisplacementComponentPerpendicularToUp =
		originalDisplacementFromPointOfFocus
			.clone()
			.sub(originalDisplacementComponentParallelToUp);
	const right = up
		.clone()
		.cross(originalDisplacementComponentPerpendicularToUp)
		.normalize();

	// Because our vectors are orthonormal, the Ax=b problem has an orthogonal
	// matrix and hence its inverse is its transpose, and so x = A^t b, where b =
	// [0, sin, cos]
	const rotationAxis = new THREE.Vector3(
		up.x * rotAxisSinTheta + right.x * rotAxisCosTheta,
		up.y * rotAxisSinTheta + right.y * rotAxisCosTheta,
		up.z * rotAxisSinTheta + right.z * rotAxisCosTheta,
	);

	const rotationMagnitude = rotAxisHypotenuse * dragSpeed;
	const rotationQuaternion = new THREE.Quaternion().setFromAxisAngle(
		rotationAxis,
		rotationMagnitude,
	);

	const newDisplacementFromPointOfFocus = originalDisplacementFromPointOfFocus
		.clone()
		.applyQuaternion(rotationQuaternion);
	const newPosition = pointOfFocus.clone().add(newDisplacementFromPointOfFocus);

	// To determine whether the rotation is pathological (doing roughly a 180deg turn,
	// which looks really abrupt and jerky), we see if the segment between the old
	// camera relative position and the new one crosses the line that is the rotation
	// axis from "up" to the original position

	const origRotAxisFromUp = originalDisplacementFromPointOfFocus
		.clone()
		.cross(up)
		.normalize();

	// THIS ASSUMES z IS UP
	// We have two lines, a1*x + b1*y + c = 0 and same with 1 -> 2. Line 1 is the
	// rotation axis line, Line 2 is the segment connecting the two displacements
	const a1 = origRotAxisFromUp.y;
	const b1 = -origRotAxisFromUp.x;
	const c1 = 0;

	// The _1's and _2's here refer to points on line 2; they have nothing to do with line
	// 1. The 2_'s refer to the fact that these are on line 2
	const { x2_1, y2_1, x2_2, m } = (() => {
		const { x: x2_1, y: y2_1 } = originalDisplacementFromPointOfFocus;
		const { x: x2_2, y: y2_2 } = newDisplacementFromPointOfFocus;
		const m = (y2_2 - y2_1) / (x2_2 - x2_1);
		return { x2_1, x2_2, y2_1, y2_2, m };
	})();
	const a2 = m;
	const b2 = -1;
	const c2 = y2_1 - m * x2_1;

	const determinant = a1 * b2 - a2 * b1;

	// The lines are (approximately) parallel iff the determinant is small
	if (Math.abs(determinant) > 1e-5) {
		// Lines aren't parallel; get intersection x
		const x = (b1 * c2 - b2 * c1) / determinant;

		// Is x_intersect between the two original points' x's? If yes then that segment
		// crosses the rotation axis, which is pathological
		if (x2_1 < x === x < x2_2) {
			return oldPosition;
		}
	}

	return newPosition;
}

// eslint-disable-next-line no-unused-vars
function makeThreeCameraDrag({
	camera,
	scene,
	renderer,
	pointOfFocus,
	up, // Must be normalized
	dragSpeed,
	callback,
}) {
	dragSpeed = dragSpeed ?? 0.006;
	up = up ?? _three_utils_upZ;

	return d3.drag().on("drag", function (event) {
		const { dx, dy } = event;

		const newCameraPos = getNewPositionForDrag({
			dx,
			dy,
			up,
			oldPosition: camera.position,
			pointOfFocus,
			dragSpeed,
		});

		if (newCameraPos !== null) {
			camera.position.copy(newCameraPos);
			camera.lookAt(pointOfFocus);
			camera.updateProjectionMatrix();
			renderer.render(scene, camera);
		}

		if (callback) {
			callback();
		}
	});
}

// eslint-disable-next-line no-unused-vars
function enableDragToRotateCamera({
	canvas,
	camera,
	scene,
	renderer,
	pointOfFocus,
	up, // Must be normalized
	dragSpeed,
	callback,
}) {
	d3.select(canvas).call(
		makeThreeCameraDrag({
			camera,
			scene,
			renderer,
			pointOfFocus,
			up,
			dragSpeed,
			callback,
		}),
	);
}

// https://stackoverflow.com/a/9039885
function userIsOn_iOS() {
	return (
		[
			"iPad Simulator",
			"iPhone Simulator",
			"iPod Simulator",
			"iPad",
			"iPhone",
			"iPod",
		].includes(navigator.platform) ||
		// iPad on iOS 13 detection
		(navigator.userAgent.includes("Mac") && "ontouchend" in document)
	);
}

// eslint-disable-next-line no-unused-vars
function makeRenderer(canvas) {
	const on_iOS = userIsOn_iOS();
	const renderer = new THREE.WebGLRenderer({
		canvas: canvas,
		antialias: !on_iOS,
		powerPreference: on_iOS ? "low-power" : "high-performance",
	});

	canvas.width = canvas.clientWidth * window.devicePixelRatio;
	canvas.height = canvas.clientHeight * window.devicePixelRatio;
	renderer.setSize(canvas.clientWidth, canvas.clientHeight);

	renderer.localClippingEnabled = false;
	renderer.setPixelRatio(window.devicePixelRatio);

	return renderer;
}
