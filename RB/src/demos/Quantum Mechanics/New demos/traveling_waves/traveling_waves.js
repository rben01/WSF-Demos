/* global applyGraphicalObjs syncButtonState */
const WIDTH = 1350;
const HEIGHT = 750;

const X_MIN = -1.5 * Math.PI;
const X_MAX = 3 * Math.PI;
const X_0 = 0;

const Y_MIN = -1.1;
const Y_MAX = -Y_MIN;
const Y_0 = 0;

const WAVENUMBER = 1;
const PERIOD = 2 * Math.PI * WAVENUMBER;
const ANIMATION_DURATION_MS = 5000;
let netDx = 0;
let isPlaying = false;
let animationFrame;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const _margin = 10;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, WIDTH - _margin]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - _margin, _margin]);

let showVerticalDot = true;

const MIN_TIME = 0;
const MAX_TIME = 2 * Math.PI;
const DEFAULT_TIME = MIN_TIME;
let currTime = DEFAULT_TIME;
const timeSlider = (() => {
	const slider = document.getElementById("slider-time");
	slider.min = MIN_TIME;
	slider.max = MAX_TIME;
	slider.step = 0.000001;
	slider.value = DEFAULT_TIME;
	slider.oninput = function () {
		// eslint-disable-next-line no-use-before-define
		update({ time: +this.value, fromUserInteraction: true });
	};

	return slider;
})();

const MIN_SPEED = 1;
const MAX_SPEED = 8;
const DEFAULT_SPEED = MIN_SPEED;
const speedSlider = (() => {
	const slider = document.getElementById("slider-speed");
	slider.min = MIN_SPEED;
	slider.max = MAX_SPEED;
	slider.step = 0.0001;
	slider.value = DEFAULT_SPEED;
	// eslint-disable-next-line no-use-before-define
	slider.oninput = () => update({ speed: this.value });

	return slider;
})();

const INITIAL_SHAPE = "sine";
let selectedShape = INITIAL_SHAPE;
const shapeButtons = d3
	.select("#shape-button-container")
	.selectAll(".button")
	.each(function () {
		if (this.getAttribute("shape") === INITIAL_SHAPE) {
			this.setAttribute("button-checked", "");
			syncButtonState(this);
		}
	})
	.on("click", function () {
		const shape = this.getAttribute("shape");
		// eslint-disable-next-line no-use-before-define
		update({ shape });
	});

const toggleBlueDotButton = d3.select("#btn-toggle-dot").on("click", function () {
	showVerticalDot = !showVerticalDot;
	if (!isPlaying) {
		// eslint-disable-next-line no-use-before-define
		update({});
	}
});

const playbackButtonElems = {
	play: document.getElementById("btn-play"),
	pause: document.getElementById("btn-pause"),
	reset: document.getElementById("btn-reset"),
};
for (const button of Object.values(playbackButtonElems)) {
	d3.select(button).on("click._default", null);
}

const VERTICAL_MOVING_DOT_X = Math.PI;

function getAxesData() {
	const labelFormatter = d3.format(".2~g");
	const tickLengthPx = 10;

	function nonzero(x) {
		return x !== 0;
	}
	const xTickLocs = xScale.ticks(20).filter(nonzero);
	const xLabelLocs = xScale.ticks(10).filter(x => x > 0);

	const yTickLocs = yScale.ticks(20).filter(nonzero);
	const yLabelLocs = yScale.ticks(5).filter(nonzero);

	const scaledX0 = xScale(X_0);
	const scaledY0 = yScale(Y_0);

	return [
		{
			shape: "line",
			class: "axis axis-axis axis-x-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: scaledY0,
				y2: scaledY0,
			},
		},
		{
			shape: "line",
			class: "axis axis-axis axis-y-axis",
			attrs: {
				x1: scaledX0,
				x2: scaledX0,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		...xTickLocs.map(x => {
			const scaledX = xScale(x);
			return {
				shape: "line",
				class: "axis axis-tick axis-x-tick",
				attrs: {
					x1: scaledX,
					x2: scaledX,
					y1: scaledY0,
					y2: scaledY0 + tickLengthPx,
				},
			};
		}),
		...xLabelLocs.map(x => {
			const scaledX = xScale(x);
			return {
				shape: "text",
				class: "axis axis-label axis-x-label",
				text: labelFormatter(x),
				attrs: {
					x: scaledX,
					y: scaledY0 + tickLengthPx + 10,
				},
			};
		}),
		...yTickLocs.map(y => {
			const scaledY = yScale(y);
			return {
				shape: "line",
				class: "axis axis-tick axis-y-tick",
				attrs: {
					x1: scaledX0 - tickLengthPx,
					x2: scaledX0,
					y1: scaledY,
					y2: scaledY,
				},
			};
		}),
		...yLabelLocs.map(y => {
			const scaledY = yScale(y);
			return {
				shape: "text",
				class: "axis axis-label axis-y-label",
				text: labelFormatter(y),
				attrs: {
					x: scaledX0 - tickLengthPx - 10,
					y: scaledY,
				},
			};
		}),
	];
}

function getSinePoints(dx) {
	const nPoints = 200;
	const points = d3.range(nPoints).map(i => {
		const x = X_MIN + ((X_MAX - X_MIN) * i) / (nPoints - 1);
		const y = Math.sin(WAVENUMBER * (x - dx));
		return [x, y];
	});
	const dotY = Math.sin(WAVENUMBER * (VERTICAL_MOVING_DOT_X - dx));
	return { points, dotY };
}

function _getFunkyWavePoints(func, dx) {
	const nPeriodsOnLeft = Math.ceil(Math.abs(X_MIN - X_0) / PERIOD) + 2;
	const nPeriodsOnRight = Math.ceil(Math.abs(X_MAX - X_0) / PERIOD) + 2;

	const points = d3.range(-(nPeriodsOnLeft + 1), nPeriodsOnRight).flatMap(i => {
		const x0 = X_0 + i * PERIOD;
		return func(x0 + dx);
	});

	return points;
}

function getSquarePoints(dx) {
	function onePeriod(x0) {
		const x1 = x0 + PERIOD / 2;
		const x2 = x0 + PERIOD;
		return [
			[x0, 1],
			[x1, 1],
			[x1, -1],
			[x2, -1],
		];
	}

	const points = _getFunkyWavePoints(onePeriod, dx);

	const x0 = X_0 + dx;
	const dotY =
		x0 - PERIOD / 2 <= VERTICAL_MOVING_DOT_X && VERTICAL_MOVING_DOT_X < x0 ? -1 : 1;

	return { points, dotY };
}

function getTrianglePoints(dx) {
	const period = WAVENUMBER * 2 * Math.PI;

	function onePeriod(x0) {
		const x1 = x0 + period / 4;
		const x2 = x1 + period / 2;
		return [
			[x1, 1],
			[x2, -1],
		];
	}

	const points = _getFunkyWavePoints(onePeriod, dx);
	let rightPointIndex;
	for (let i = 0; i < points.length; ++i) {
		const x = points[i][0];
		if (VERTICAL_MOVING_DOT_X < x) {
			rightPointIndex = i;
			break;
		}
	}
	const [x1, y1] = points[rightPointIndex - 1];
	const [x2, y2] = points[rightPointIndex];

	const t = (VERTICAL_MOVING_DOT_X - x1) / (x2 - x1);
	const dotY = t * y2 + (1 - t) * y1;

	return { points, dotY };
}

const pointFuncs = {
	sine: getSinePoints,
	square: getSquarePoints,
	triangle: getTrianglePoints,
};

function reset() {
	isPlaying = false;
	netDx = 0;
	currTime = 0;
	cancelAnimationFrame(animationFrame);
	playbackButtonElems.play.disabled = false;
	playbackButtonElems.pause.disabled = true;
	playbackButtonElems.reset.disabled = true;

	// eslint-disable-next-line no-use-before-define
	update({ time: MIN_TIME, fromUserInteraction: true });
}

function pause() {
	isPlaying = false;
	cancelAnimationFrame(animationFrame);

	playbackButtonElems.play.disabled = false;
	playbackButtonElems.pause.disabled = true;
	playbackButtonElems.reset.disabled = false;
}

function play() {
	playbackButtonElems.play.disabled = true;
	playbackButtonElems.pause.disabled = false;
	playbackButtonElems.reset.disabled = false;

	if (currTime >= MAX_TIME - +timeSlider.step) {
		timeSlider.value = currTime = MIN_TIME;
	}

	isPlaying = true;
	let prevTimestampMS;
	function step(timestampMS) {
		if (prevTimestampMS === undefined) {
			prevTimestampMS = timestampMS;
		}
		const elapsedSinceLastUpdateMS = timestampMS - prevTimestampMS;
		prevTimestampMS = timestampMS;

		const dt =
			(MAX_TIME - MIN_TIME) * (elapsedSinceLastUpdateMS / ANIMATION_DURATION_MS);

		// eslint-disable-next-line no-use-before-define
		update({ time: currTime + dt, fromUserInteraction: false });

		if (isPlaying && currTime < MAX_TIME - +timeSlider.step) {
			animationFrame = window.requestAnimationFrame(step);
		} else {
			pause();
		}
	}

	animationFrame = window.requestAnimationFrame(step);
}

const line = d3
	.line()
	.curve(d3.curveLinear)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));
function update({ time, shape, fromUserInteraction }) {
	if (shape !== undefined && shape !== null) {
		selectedShape = shape;
	} else {
		shape = selectedShape;
	}

	fromUserInteraction = fromUserInteraction ?? false;
	if (fromUserInteraction) {
		pause();
	}

	if (time !== undefined && time !== null) {
		timeSlider.value = time;
	} else {
		time = +timeSlider.value;
	}

	const speed = +speedSlider.value;

	playbackButtonElems.reset.disabled =
		fromUserInteraction && timeSlider.value === timeSlider.min;

	const dt = time - currTime;
	const dx = speed * dt;
	netDx += dx;

	const { points, dotY } = pointFuncs[shape](netDx % PERIOD);

	const waveData = [
		{
			shape: "path",
			class: "wave curve curve-background",
			attrs: {
				d: line(points),
			},
		},
		{
			shape: "path",
			class: "wave curve curve-foreground",
			attrs: {
				d: line(points),
			},
		},
	];
	applyGraphicalObjs(plot, waveData, { selector: ".wave" });

	const dotData = [];
	if (showVerticalDot) {
		const scaledDotX = xScale(VERTICAL_MOVING_DOT_X);
		dotData.push(
			{
				shape: "line",
				class: "dot dot-guide",
				attrs: {
					x1: scaledDotX,
					x2: scaledDotX,
					y1: yScale(Y_MIN),
					y2: yScale(Y_MAX),
				},
			},
			{
				shape: "circle",
				class: "dot vertical-dot vertical-dot-background",
				attrs: {
					cx: xScale(VERTICAL_MOVING_DOT_X),
					cy: yScale(dotY),
					r: 19,
				},
			},
			{
				shape: "circle",
				class: "dot vertical-dot vertical-dot-foreground",
				attrs: {
					cx: xScale(VERTICAL_MOVING_DOT_X),
					cy: yScale(dotY),
					r: 15,
				},
			},
		);
	}
	applyGraphicalObjs(plot, dotData, { selector: ".dot" });

	currTime = time;
}

applyGraphicalObjs(plot, getAxesData());

update({ fromUserInteraction: true });
