/* global applyGraphicalObjs  groupBy */

const AXES = {
	x: { min: -1, max: 1.2 },
	y: { min: -1, max: 1 },
};

const MARGINS = { t: 5, b: 5, l: 5, r: 5 };

const HEIGHT = 400;
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
	lambda: document.getElementById("input-lambda"),
	t: document.getElementById("input-t"),
	v: document.getElementById("input-v"),
};

// Thanks to Mr. Bostock
// https://bl.ocks.org/mbostock/4163057
function quads(points) {
	return d3.range(points.length - 1).map(function (i) {
		const a = [points[i - 1], points[i], points[i + 1], points[i + 2]];
		a.t = (points[i].t + points[i + 1].t) / 2;
		return a;
	});
}

// Compute unit vector perpendicular to p01.
function perp(p0, p1) {
	const u01x = p0[1] - p1[1],
		u01y = p1[0] - p0[0],
		u01d = Math.sqrt(u01x * u01x + u01y * u01y);
	return [u01x / u01d, u01y / u01d];
}

// Compute intersection of two infinite lines ab and cd.
function lineIntersect(a, b, c, d) {
	const x1 = c[0],
		x3 = a[0],
		x21 = d[0] - x1,
		x43 = b[0] - x3,
		y1 = c[1],
		y3 = a[1],
		y21 = d[1] - y1,
		y43 = b[1] - y3,
		ua = (x43 * (y1 - y3) - y43 * (x1 - x3)) / (y43 * x21 - x43 * y21);
	return [x1 + ua * x21, y1 + ua * y21];
}

// Compute stroke outline for segment p12.
function lineJoin(p0, p1, p2, p3, width) {
	const u12 = perp(p1, p2),
		r = width / 2;
	let a = [p1[0] + u12[0] * r, p1[1] + u12[1] * r],
		b = [p2[0] + u12[0] * r, p2[1] + u12[1] * r],
		c = [p2[0] - u12[0] * r, p2[1] - u12[1] * r],
		d = [p1[0] - u12[0] * r, p1[1] - u12[1] * r];

	if (p0) {
		// clip ad and dc using average of u01 and u12
		const u01 = perp(p0, p1),
			e = [p1[0] + u01[0] + u12[0], p1[1] + u01[1] + u12[1]];
		a = lineIntersect(p1, e, a, b);
		d = lineIntersect(p1, e, d, c);
	}

	if (p3) {
		// clip ab and dc using average of u12 and u23
		const u23 = perp(p2, p3),
			e = [p2[0] + u23[0] + u12[0], p2[1] + u23[1] + u12[1]];
		b = lineIntersect(p2, e, a, b);
		c = lineIntersect(p2, e, d, c);
	}

	return `M${a}L${b} ${c} ${d}Z`;
}

const lambdaScale = d3.scaleLinear([0, 1], [740, 380]);

const colorScale = (() => {
	const lowerCutoff = 0.2;
	const upperCutoff = 1;
	const innerScale = d3.interpolateSinebow;
	const outerScale = d3
		.scaleLinear()
		.domain([-10, -3, 0, 0.1, lowerCutoff, upperCutoff, 1.2, 1.6, 1.9])
		.range([
			"#3c0000",
			"#530000",
			"#e00",
			"#f22",
			innerScale(0),
			innerScale(0.7),
			"#409",
			"#308",
			"#206",
		]);
	const innerScaleScale = d3.scaleLinear([lowerCutoff, upperCutoff], [0, 0.7]);
	return t => {
		const x =
			lowerCutoff <= t && t <= upperCutoff
				? innerScale(innerScaleScale(t))
				: outerScale(t);
		return x;
	};
})();

function getThetas(nTotal, sparsityFunc) {
	if (sparsityFunc === undefined) {
		sparsityFunc = t => 1.75 - Math.sin(2 * (t - 1 / 8) * 2 * Math.PI);
	}

	const indices = d3.range(nTotal);

	const unnormalizedSparsities = indices.map(i => sparsityFunc(i / nTotal));
	const sparsitySum = unnormalizedSparsities.reduce((a, b) => a + b);
	const sparsities = unnormalizedSparsities.map(d => d / sparsitySum);

	const dThetas = indices.map(i => sparsities[i] * 2 * Math.PI);

	return [0, ...d3.cumsum(dThetas)];
}

const WAVE_INTERVAL_T = 0.08212873612836; // To avoid FP error, it's crucial that this not even come close to dividing any t that will be passed to this function
function getFlashesData({ lambda, v, t }) {
	const data = [
		{
			shape: "circle",
			class: "source",
			attrs: {
				cx: xScale(v * t),
				cy: yScale(0),
				r: 8,
				fill: colorScale(lambda),
			},
		},
	];
	if (t === 0) {
		return data;
	}

	const nCircles = 1 / WAVE_INTERVAL_T;
	const circleR0 = t - 1;

	lambda = lambdaScale(lambda);

	for (let i = 0; i < nCircles; ++i) {
		const r = circleR0 + i * WAVE_INTERVAL_T;
		const nSegments = Math.floor(Math.pow(r, 0.5) * 200);
		if (r <= 0 || nSegments <= 0) {
			continue;
		}
		const thisCirclePoints = [];

		// Get the center of the circle when it emits its light
		const cx = WAVE_INTERVAL_T * v * (nCircles - i);

		const thetas = getThetas(nSegments);

		for (let j = 0; j < thetas.length; ++j) {
			const thetaMid = thetas[j];
			const point = [
				xScale(cx + r * Math.cos(thetaMid)),
				yScale(r * Math.sin(thetaMid)),
			];

			const vx = v * Math.cos(thetaMid);
			const shiftFactor = Math.sqrt((1 + vx) / (1 - vx));
			const lambdaPrime = lambda / shiftFactor;
			point.t = lambdaPrime;
			thisCirclePoints.push(point);
		}

		const q = quads(thisCirclePoints);

		const paths = q
			.map(p => {
				const d = lineJoin(p[0], p[1], p[2], p[3], 2);
				if (d.includes("NaN")) {
					return null;
				}
				const color = colorScale(lambdaScale.invert(p.t));
				return {
					shape: "path",
					class: "wave-line",
					attrs: {
						d: d,
						fill: color,
						stroke: color,
					},
				};
			})
			.filter(path => path !== null);

		data.push(...paths);
	}
	return data;
}

const textSpans = {
	lambda: document.getElementById("text-lambda"),
	v: document.getElementById("text-v"),
};

function fmtFloat(x, precision) {
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
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
function update({ lambda, v, t, fromUserInput } = {}) {
	if (fromUserInput === undefined) {
		fromUserInput = true;
	}

	if (lambda === undefined) {
		lambda = sliders.lambda.value;
	} else {
		sliders.lambda.value = lambda;
	}
	lambda = +lambda;

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

	const allData = getFlashesData({ lambda, v, t });
	const shapes = groupBy(allData, d => `${d.shape}.${d.class}`, [
		"path.wave-line",
		"circle.source",
	]);

	for (const [selector, data] of shapes) {
		applyGraphicalObjs(svg, data, { selector });
	}
	// svg.node().appendChild(svg.selectAll("circle.source").node());

	textSpans.lambda.innerText = fmtFloat(lambdaScale(lambda), 0);
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

update({ lambda: 0.5, v: 0.0, t: 1 });
