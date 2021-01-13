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
