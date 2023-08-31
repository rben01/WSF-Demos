/* global applyGraphicalObjs groupBy STANDARD_COLORS */

const AXES = {
	x: { min: -0.2, max: 1.2 },
	y: { min: -0.13, max: 0.13 },
};

const MARGINS = { t: 5, b: 5, l: 5, r: 5 };

const HEIGHT = 150;
const WIDTH =
	((HEIGHT - MARGINS.t - MARGINS.b) * (AXES.x.max - AXES.x.min)) /
	(AXES.y.max - AXES.y.min);

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

const xScale = d3
	.scaleLinear()
	.domain([AXES.x.min, AXES.x.max])
	.range([MARGINS.l, WIDTH - MARGINS.r]);
const yScale = d3
	.scaleLinear()
	.domain([AXES.y.min, AXES.y.max])
	.range([HEIGHT - MARGINS.b, MARGINS.t]);

const sliders = {
	t: document.getElementById("input-t"),
	v: document.getElementById("input-v"),
};

const textSpans = {
	v: document.getElementById("text-v"),
};

function fmtFloat(x, precision) {
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const FLASH_INTERVAL_T = 0.08;

function getFlashesData({ v, t }) {
	const data = [];

	const nFlashes = 1 / FLASH_INTERVAL_T;
	const dist0 = t - 1;

	const sourceOriginX = 0.2 - 0.99 / 10;

	// Magic number chosen so that the source moves at the exact right speed
	for (let i = 0; i < nFlashes; ++i) {
		const dist = dist0 + i * FLASH_INTERVAL_T;
		if (dist <= 0) {
			continue;
		}

		const cx = sourceOriginX + FLASH_INTERVAL_T * v * (nFlashes - i);
		const px = [cx - dist, cx + dist];
		data.push(
			...px.map(x => ({
				shape: "circle",
				class: "flash",
				attrs: {
					cx: xScale(x),
					cy: yScale(0),
					r: 7,
					fill: "white",
					stroke: "black",
				},
			})),
		);
	}

	data.push({
		shape: "circle",
		class: "source",
		attrs: {
			cx: xScale(sourceOriginX + v * t),
			cy: yScale(0),
			r: 15,
			fill: STANDARD_COLORS.secondary,
		},
	});

	return data;
}

const ANIMATION_DURATION_SEC = 7;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const FPS = 29;
const N_FRAMES = ANIMATION_DURATION_SEC * FPS;

const playbackInfo = {
	animationIsPlaying: false,
	animationTimer: null,
	currFrame: 0,
};
const playButton = document.getElementById("play-pause");
const resetButton = document.getElementById("btn-reset");

function update({ v, t, fromUserInput, transition } = {}) {
	if (fromUserInput === undefined) {
		fromUserInput = true;
	}

	if (v === undefined) {
		v = sliders.v.value;
	} else {
		sliders.v.value = v;
	}
	v = +v;

	if (t === undefined) {
		t = sliders.t.value;
	} else {
		sliders.t.value = t;
		if (fromUserInput) {
			// eslint-disable-next-line no-use-before-define
			stopAnimation();
			playbackInfo.currFrame = Math.round(t * N_FRAMES);
		}
	}
	t = +t;

	resetButton.disabled = t <= 0;

	const allData = getFlashesData({ v, t });
	const shapes = groupBy(allData, d => `${d.shape}.${d.class}`, [
		"circle.flash",
		"circle.source",
	]);

	for (const [selector, data] of shapes) {
		applyGraphicalObjs(svg, data, { selector, transition });
	}
	// svg.node().appendChild(svg.selectAll("circle.source").node());

	textSpans.v.innerText = fmtFloat(v, 2);
	// blocks.color.style.backgroundColor = colorScale(lambda);
}

function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	playButton.innerText = "Start";
	resetButton.disabled = true;
}

// eslint-disable-next-line no-unused-vars
function toggleAnimation() {
	if (playbackInfo.animationIsPlaying) {
		stopAnimation();
		return;
	}

	playbackInfo.animationIsPlaying = true;
	playButton.textContent = "Pause";

	if (playbackInfo.currFrame >= N_FRAMES) {
		playbackInfo.currFrame = 0;
	}

	playbackInfo.animationTimer = setInterval(() => {
		if (playbackInfo.currFrame > N_FRAMES) {
			update({ t: sliders.t.max });
			stopAnimation();
			resetButton.disabled = false;
			return;
		}

		const t = playbackInfo.currFrame / N_FRAMES;

		update({ t, fromUserInput: false });
		playbackInfo.currFrame += 1;
	}, ANIMATION_DURATION_MS / N_FRAMES);
}

// eslint-disable-next-line no-unused-vars
function reset() {
	update({ t: 0, fromUserInput: true, transition: d3.transition().duration(150) });
}

update({ v: 0, t: 0 });
