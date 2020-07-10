/* global applyGraphicalObjs groupBy STANDARD_COLORS */

const AXES = {
	x: { min: -0.1, max: 1.1 },
	y: { min: -0.2, max: 0.2 },
};

const MARGINS = { t: 5, b: 5, l: 5, r: 5 };

const HEIGHT = 200;
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

	const sourceOriginX = 0.5 - v / 2;
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
					r: 3,
					fill: "white",
					stroke: "white",
				},
			})),
		);
	}

	data.push({
		shape: "circle",
		class: "source",
		attrs: {
			cx: xScale(v * t + sourceOriginX),
			cy: yScale(0),
			r: 9,
			fill: STANDARD_COLORS.secondary,
		},
	});

	return data;
}

const ANIMATION_DURATION_SEC = 10;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const FPS = 23;
const N_FRAMES = ANIMATION_DURATION_SEC * FPS;

const playbackInfo = {
	animationIsPlaying: false,
	animationTimer: null,
	currFrame: 0,
};
function update({ v, t, fromUserInput } = {}) {
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

	const allData = getFlashesData({ v, t });
	const shapes = groupBy(allData, d => `${d.shape}.${d.class}`, [
		"circle.flash",
		"circle.source",
	]);

	for (const [selector, data] of shapes) {
		applyGraphicalObjs(svg, data, { selector });
	}
	// svg.node().appendChild(svg.selectAll("circle.source").node());

	textSpans.v.innerText = fmtFloat(v, 2);
	// blocks.color.style.backgroundColor = colorScale(lambda);
}

const playButton = document.getElementById("play-pause");

function stopAnimation() {
	playbackInfo.animationIsPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	playButton.innerText = "Start";
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
			return;
		}

		const t = playbackInfo.currFrame / N_FRAMES;

		update({ t, fromUserInput: false });
		playbackInfo.currFrame += 1;
	}, ANIMATION_DURATION_MS / N_FRAMES);
}

update({ v: 0, t: 0 });
