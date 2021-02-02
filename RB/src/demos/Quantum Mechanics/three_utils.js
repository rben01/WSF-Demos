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
		depthWrite,
	} = {},
) {
	// const _black = { r: 0, g: 0, b: 0, a: 1.0 };

	fontface = fontface ?? "sans-serif";
	fontsize = fontsize ?? 27;
	fontweight = fontweight ?? "";
	borderThickness = borderThickness ?? 0;
	borderColor = borderColor ?? _three_utils_clear;
	backgroundColor = backgroundColor ?? _three_utils_clear;
	textColor = textColor ?? _three_utils_white;
	depthWrite = depthWrite ?? false;

	const canvas = document.createElement("canvas");
	const context = canvas.getContext("2d");
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
	context.fillText(message, borderThickness, fontsize + borderThickness);

	const texture = new THREE.CanvasTexture(canvas);

	const spriteMaterial = new THREE.SpriteMaterial({
		map: texture,
		// useScreenCoordinates: false,
	});
	const sprite = new THREE.Sprite(spriteMaterial);
	sprite.scale.set(0.5 * fontsize, 0.25 * fontsize, 0.75 * fontsize);
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
	const originalDisplacementComponentPerpendicularToUp = originalDisplacementFromPointOfFocus
		.clone()
		.sub(originalDisplacementComponentParallelToUp);
	const right = up
		.clone()
		.cross(originalDisplacementComponentPerpendicularToUp)
		.normalize();

	// Because our vectors are orthonormal, the Ax=b problem has an orthogonal
	// matrix and hence its inverse is it's transpose, and so x = A^t b, where b =
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

	originalDisplacementFromPointOfFocus.applyQuaternion(rotationQuaternion);

	const newPosition = pointOfFocus.clone().add(originalDisplacementFromPointOfFocus);

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
