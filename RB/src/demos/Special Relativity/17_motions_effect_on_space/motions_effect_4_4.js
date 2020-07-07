/* globals CONFIG USER_INFO TOTAL_DURATION_MS playbackInfo subcanvases transAxisToCanvas axDistTraveled */

"use strict";

// eslint-disable-next-line no-unused-vars
function beginAnimation() {
	if (playbackInfo.animationIsPlaying) {
		return;
	}

	playbackInfo.isInitialized = false;
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

		if (canvasInfo.observerIsStandingOn === "train") {
			d3.select(this)
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
			d3.select(this)
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

		d3.select(this)
			.selectAll(`.${CONFIG.trainPhoton.class}`)
			.each(function (d) {
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
					.attr("cx", xf);
			});
	});
}
