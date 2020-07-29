/* globals CONFIG USER_INFO TOTAL_DURATION_MS playbackInfo subcanvases transAxisToCanvas axDistTraveled */

"use strict";

// eslint-disable-next-line no-unused-vars
function beginAnimation() {
	if (playbackInfo.animationIsPlaying) {
		return;
	}

	playbackInfo.animationIsPlaying = true;
	playbackInfo.animationStartDate = new Date();
	playbackInfo.beginButton.disabled = true;
	playbackInfo.resetButton.disabled = false;

	playbackInfo.animationTimer = setTimeout(() => {
		playbackInfo.animationIsPlaying = false;
		playbackInfo.animationEndDate = new Date();
	}, TOTAL_DURATION_MS);

	subcanvases.each(function (canvasInfo) {
		const distanceTrainTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: USER_INFO.trainSpeed }),
		}).dx;

		const distanceLightTravels = transAxisToCanvas(canvasInfo, {
			dx: axDistTraveled({ fracOfC: 1 }),
		}).dx;
		console.log(axDistTraveled({ fracOfC: 1 }));

		const canvasSel = d3.select(this);

		if (canvasInfo.observerIsStandingOn === "train") {
			canvasSel
				.selectAll(`.${CONFIG.railroadTie.class}`)
				.transition()
				.duration(0)
				.attr("x1", d => d.x0)
				.attr("x2", d => d.x0)
				.transition()
				.duration(TOTAL_DURATION_MS)
				.ease(d3.easeLinear)
				.attr("x1", d => d.x0 - distanceTrainTravels)
				.attr("x2", d => d.x0 - distanceTrainTravels);
		} else if (canvasInfo.observerIsStandingOn === "ground") {
			canvasSel
				.selectAll(
					`.${CONFIG.trainCar.class}, .${CONFIG.trainLightSource.class}`,
				)
				.each(function (d) {
					d3.select(this)
						.transition()
						.duration(0)
						.attr(d.originXAttr, d.x0)
						.transition()
						.duration(TOTAL_DURATION_MS)
						.ease(d3.easeLinear)
						.attr(d.originXAttr, d.x0 + distanceTrainTravels);
				});
		}

		const train = canvasSel.selectAll(`.${CONFIG.trainCar.class}`);
		const trainWidth = +train.attr("width");
		canvasSel.selectAll(`.${CONFIG.trainPhoton.class}`).each(function (d) {
			const xf =
				d.direction === "left"
					? d.x0 - distanceLightTravels
					: d.x0 + distanceLightTravels;
			d3.select(this)
				.transition()
				.duration(0)
				.attr("cx", d.x0)
				.transition()
				.duration(TOTAL_DURATION_MS)
				.ease(d3.easeLinear)
				.attrTween("cx", function () {
					const xInterpolator = d3.interpolateNumber(
						this.getAttribute("cx"),
						xf,
					);
					const leftCollisionXs = [];
					const rightCollisionXs = [];
					let currDirection = d.direction;
					return t => {
						let x = xInterpolator(t);
						const leftWall = +train.attr("x");
						const rightWall = leftWall + trainWidth;
						for (let i = 0; !(leftWall <= x && x <= rightWall); ++i) {
							let collisionX;
							const index = Math.floor(i / 2);
							if (x < leftWall) {
								if (currDirection === "left") {
									leftCollisionXs.push(leftWall);
									currDirection = "right";
								}
								collisionX = leftCollisionXs[index];
							} else {
								if (currDirection === "right") {
									rightCollisionXs.push(rightWall);
									currDirection = "left";
								}
								collisionX = rightCollisionXs[index];
							}
							x += 2 * (collisionX - x);
						}
						return x;
					};
				});
		});
	});
}
