/* globals  lorentzFactor */

const ANIMATION_DURATION_SEC = 5;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const FPS = 37;
const N_DIGITS_DISPLAYED = 4;

const speedInputSlider = document.getElementById("input-taxi-speed");
const speedTextSpan = document.getElementById("taxi-speed-text");
const lfTextSpan = document.getElementById("taxi-lorentz-factor-text");
const playButton = document.getElementById("btn-run-animation");

const taxiImg = document.getElementById("img-taxi");

const playbackInfo = {
	animationIsPlaying: false,
	animationTimer: null,
	N_FRAMES: ANIMATION_DURATION_SEC * FPS,
	currFrame: 0,
	speeds: {
		min: 0,
		max: parseFloat(speedInputSlider.max),
	},
};

function getSpeed(speedStr) {
	speedStr = typeof speedStr !== "undefined" ? speedStr : speedInputSlider.value;
	const floatVal = parseFloat(speedStr);
	if (floatVal < 0 || floatVal > 1) {
		throw new Error(`Got invalid speed (outside [0,1]): ${floatVal}`);
	}

	return floatVal;
}

// eslint-disable-next-line no-unused-vars
function updateTaxiSpeed(speedStr, fromUserInteraction = false) {
	try {
		speedInputSlider.value = speedStr;
		const speed = getSpeed(speedStr);
		if (speedStr) {
			speedTextSpan.textContent = speed.toFixed(N_DIGITS_DISPLAYED);

			const lf = lorentzFactor({ fracOfC: speed });

			lfTextSpan.textContent = lf.toFixed(N_DIGITS_DISPLAYED);
			taxiImg.style.transform = `scaleX(${1 / lf})`;

			if (fromUserInteraction) {
				playbackInfo.currFrame = speed * playbackInfo.N_FRAMES;
			}
		}
	} catch (e) {
		console.log(speedStr);
		throw e;
	}
}

function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	playButton.innerText = "Start";
}

function makeInterpolator(a, b) {
	return t => (1 - t) * a + t * b;
}

// eslint-disable-next-line no-unused-vars
function toggleAnimation() {
	if (playbackInfo.animationIsPlaying) {
		stopAnimation();
		return;
	}

	playbackInfo.animationIsPlaying = true;
	playButton.textContent = "Pause";

	if (playbackInfo.currFrame > playbackInfo.N_FRAMES) {
		playbackInfo.currFrame = 0;
	}

	const interpolator = makeInterpolator(
		playbackInfo.speeds.min,
		playbackInfo.speeds.max,
	);

	playbackInfo.animationTimer = setInterval(() => {
		if (playbackInfo.currFrame > playbackInfo.N_FRAMES) {
			updateTaxiSpeed(speedInputSlider.max);
			stopAnimation();
			return;
		}

		const t = playbackInfo.currFrame / playbackInfo.N_FRAMES;
		const speed = interpolator(t);
		const lf = lorentzFactor({
			fracOfC: speed,
		});

		taxiImg.style.transform = `scaleX(${1 / lf})`;

		updateTaxiSpeed(speed);
		playbackInfo.currFrame += 1;
	}, ANIMATION_DURATION_MS / playbackInfo.N_FRAMES);
}
