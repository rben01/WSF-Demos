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
	} = {},
) {
	// const _black = { r: 0, g: 0, b: 0, a: 1.0 };
	const _white = { r: 255, g: 255, b: 255, a: 1.0 };
	const _clear = { r: 0, g: 0, b: 0, a: 0.0 };

	fontface = fontface ?? "sans-serif";
	fontsize = fontsize ?? 27;
	fontweight = fontweight ?? "";
	borderThickness = borderThickness ?? 0;
	borderColor = borderColor ?? _clear;
	backgroundColor = backgroundColor ?? _clear;
	textColor = textColor ?? _white;

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

	return sprite;
}

const _three_utils_upZ = new THREE.Vector3(0, 0, 1);
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
	dragSpeed = dragSpeed ?? 0.004;
	up = up ?? _three_utils_upZ;

	return d3.drag().on("drag", function (event) {
		const { dx, dy } = event;

		const rotAxisHypotenuse = (dx ** 2 + dy ** 2) ** 0.5;
		if (rotAxisHypotenuse < 1e-12) {
			return;
		}

		const rotAxisX = -dy;
		const rotAxisY = -dx;
		const rotAxisCosTheta = rotAxisX / rotAxisHypotenuse;
		const rotAxisSinTheta = rotAxisY / rotAxisHypotenuse;

		const cameraDisplacementFromPointOfFocus = camera.position
			.clone()
			.sub(pointOfFocus);

		const cameraDisplacementComponentParallelToUp = up
			.clone()
			.multiplyScalar(cameraDisplacementFromPointOfFocus.dot(up));
		const cameraDisplacementComponentPerpendicularToUp = cameraDisplacementFromPointOfFocus
			.clone()
			.sub(cameraDisplacementComponentParallelToUp)
			.normalize();
		const right = up
			.clone()
			.cross(cameraDisplacementComponentPerpendicularToUp)
			.normalize();

		// console.log(cameraDisplacementComponentPerpendicularToUp, up, right);
		const rotationAxis = new THREE.Vector3(
			up.x * rotAxisSinTheta + right.x * rotAxisCosTheta,
			up.y * rotAxisSinTheta + right.y * rotAxisCosTheta,
			up.z * rotAxisSinTheta + right.z * rotAxisCosTheta,
		);

		const rotationMagnitude = rotAxisHypotenuse * dragSpeed;
		const cameraRotQuaternion = new THREE.Quaternion().setFromAxisAngle(
			rotationAxis,
			rotationMagnitude,
		);

		cameraDisplacementFromPointOfFocus.applyQuaternion(cameraRotQuaternion);
		// console.log(cameraDisplacementFromPointOfFocus);

		// const screenRotationAxis = new THREE.Vector3(dy, 0, -dx);
		// screenRotationAxis.normalize();

		// const angleAroundUp = -dx * dragSpeed;
		// const angleInHorizontalPlane = Math.atan2(
		// 	cameraDisplacementFromPointOfFocus.y,
		// 	cameraDisplacementFromPointOfFocus.x,
		// );

		// const angleAroundHorizontalAxis1 =
		// 	Math.sin(angleInHorizontalPlane) * dy * dragSpeed;
		// const angleAroundHorizontalAxis2 =
		// 	-Math.cos(angleInHorizontalPlane) * dy * dragSpeed;

		// // Euler angle assuming that "up" is (0,0,1)
		// const eulerAngle = new THREE.Euler(
		// 	angleAroundHorizontalAxis1,
		// 	angleAroundHorizontalAxis2,
		// 	angleAroundUp,
		// );

		// const circumAxialQuaternion = new THREE.Quaternion();
		// circumAxialQuaternion.setFromEuler(eulerAngle);

		// // But it's not necessarily up, so we correct by tilting it
		// const rotateUpAxisInPlaceQuaternion = new THREE.Quaternion();
		// rotateUpAxisInPlaceQuaternion.setFromUnitVectors(up, _three_utils_upZ);

		// cameraDisplacementFromPointOfFocus.
		// 	.applyQuaternion(rotateUpAxisInPlaceQuaternion)
		// 	.applyQuaternion(circumAxialQuaternion)
		// 	.applyQuaternion(rotateUpAxisInPlaceQuaternion.invert());

		const newCameraPos = pointOfFocus
			.clone()
			.add(cameraDisplacementFromPointOfFocus);

		camera.position.copy(newCameraPos);
		camera.lookAt(pointOfFocus);
		camera.updateProjectionMatrix();
		renderer.render(scene, camera);

		if (callback) {
			callback();
		}
	});
}
