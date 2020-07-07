/* global groupBy applyGraphicalObjs defineArrowhead STANDARD_COLORS */

const AXES = {
	x: { min: -0.05, max: 0.6 },
	y: { min: -0.05, max: 1.1 },
	t: { min: 0, max: 1 },
};

const MARGINS = { t: 50, b: 10, l: 10, r: 10 };

const HEIGHT = 500;
const WIDTH =
	MARGINS.l +
	MARGINS.r +
	((HEIGHT - (MARGINS.t + MARGINS.b)) * (AXES.x.max - AXES.x.min)) /
		(AXES.y.max - AXES.y.min);

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);
const ARROWHEAD_ID = "arrowhead_";
const defs = svg.append("defs");
defineArrowhead(defs, { id: ARROWHEAD_ID, length: 14, width: 12, color: "white" });

const axisColor = "#fff";

const xScale = d3.scaleLinear([AXES.x.min, AXES.x.max], [MARGINS.l, WIDTH - MARGINS.r]);
const yScale = d3.scaleLinear(
	[AXES.y.min, AXES.y.max],
	[HEIGHT - MARGINS.b, MARGINS.t],
);
const tToYScale = d3.scaleLinear([AXES.t.min, AXES.t.max], [0, 1]);

function drawGraph() {
	svg.append("line")
		.attr("x1", xScale(AXES.x.min))
		.attr("y1", yScale(0))
		.attr("x2", xScale(AXES.x.max))
		.attr("y2", yScale(0))
		.attr("stroke", axisColor)
		.attr("stroke-width", 2)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);
	svg.append("line")
		.attr("x1", xScale(0))
		.attr("y1", yScale(AXES.y.min))
		.attr("x2", xScale(0))
		.attr("y2", yScale(AXES.y.max))
		.attr("stroke", axisColor)
		.attr("stroke-width", 2)
		.attr("marker-end", `url(#${ARROWHEAD_ID})`);

	svg.append("text")
		.text("𝑡")
		.attr("x", xScale(0) - 12)
		.attr("y", yScale(AXES.y.max) + 5)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom");
	svg.append("text")
		.text("𝑥")
		.attr("x", xScale(AXES.x.max))
		.attr("y", yScale(0) + 20)
		.attr("fill", "white")
		.attr("text-anchor", "middle")
		.attr("dominant-baseline", "bottom");
}

drawGraph();

function fmtFloat(x, precision) {
	if (typeof precision === "undefined") {
		precision = 2;
	}
	return x.toFixed(precision).replace(/^-/, '<span class="minus-sign">−</span>');
}

const dotRadius = 4;
const colors = {
	light: STANDARD_COLORS.secondary,
	lighterLight: d3.interpolateRgb(STANDARD_COLORS.secondary, "white")(0.6),
	earth: STANDARD_COLORS.tertiary,
	ship: STANDARD_COLORS.quaternary,
};
const strokeWidth = 2;

const line = d3
	.line()
	.x(p => p[0])
	.y(p => p[1]);

function getData({ v, t, showEarthSignals, showSpaceshipSignals }) {
	const turnaroundTime = AXES.t.max / 2;
	const hasTurnedAround = t > turnaroundTime;

	const origin = { x: xScale(0), y: yScale(0) };
	const turnaround = {
		x: xScale(turnaroundTime * v),
		y: yScale(tToYScale(turnaroundTime)),
	};

	const data = [];

	const y = tToYScale(t);
	const earthPos = { x: xScale(0), y: yScale(y) };
	const earthPath = {
		shape: "line",
		classes: [],
		attrs: {
			x1: origin.x,
			y1: origin.y,
			x2: earthPos.x,
			y2: earthPos.y,
			stroke: colors.earth,
			"stroke-width": strokeWidth,
		},
	};

	const shipPos = {
		x: !hasTurnedAround ? xScale(v * t) : xScale(v * (AXES.t.max - t)),
		y: yScale(y),
	};

	const shipPathPoints =
		t <= !hasTurnedAround
			? [
					[origin.x, origin.y],
					[shipPos.x, shipPos.y],
			  ]
			: [
					[origin.x, origin.y],
					[turnaround.x, turnaround.y],
					[shipPos.x, shipPos.y],
			  ];

	const shipPath = {
		shape: "path",
		classes: [],
		attrs: {
			d: line(shipPathPoints),
			stroke: colors.ship,
			"stroke-width": strokeWidth,
			"fill-opacity": 0,
		},
	};
	data.push(earthPath, shipPath);

	const photonAttrs = { stroke: colors.light, "stroke-width": 1.5 };

	const signals = {
		earth: { sent: 0, received: 0 },
		ship: { sent: 0, received: 0 },
	};

	if (showEarthSignals) {
		const nPhotonsEmittedTotal = 27;
		for (let i = 1; i / nPhotonsEmittedTotal < t; ++i) {
			const photonYIntercept = (i / nPhotonsEmittedTotal) * tToYScale(AXES.t.max);
			const photonIntersectsOutboundX = photonYIntercept / (1 / v - 1);
			const photonIntersectsInboundX = (1 - photonYIntercept) / (1 / v + 1);

			const naivePhotonX2 = Math.min(
				photonIntersectsOutboundX,
				photonIntersectsInboundX,
			);

			signals.earth.sent += 1;
			const naivePhotonY2 = naivePhotonX2 + photonYIntercept;
			if (naivePhotonY2 < y) {
				signals.ship.received += 1;
			}

			const photonY2 = Math.min(naivePhotonY2, y);
			const photonX2 = photonY2 - photonYIntercept;

			data.push({
				shape: "line",
				classes: [],
				attrs: {
					x1: origin.x,
					y1: yScale(photonYIntercept),
					x2: xScale(photonX2),
					y2: yScale(photonY2),
					...photonAttrs,
				},
			});
		}
	}

	if (showSpaceshipSignals) {
		const spaceshipPhotonAttrs = [];
		const nPhotonsEmittedTotal = 11;
		const xOrigin = xScale.invert(origin.x);

		for (let i = 1; i / nPhotonsEmittedTotal < t; ++i) {
			let x1, y1;
			if (i / nPhotonsEmittedTotal < turnaroundTime) {
				y1 = (i / nPhotonsEmittedTotal) * tToYScale(AXES.t.max);
				x1 = y1 * v;
			} else {
				y1 = (i / nPhotonsEmittedTotal) * tToYScale(AXES.t.max);
				x1 = xOrigin + (y1 - AXES.t.max) * -v;
			}

			signals.ship.sent += 1;
			const naivePhotonY2 = -(xOrigin - x1) + y1;
			if (naivePhotonY2 < y) {
				signals.earth.received += 1;
			}

			const y2 = Math.min(naivePhotonY2, y);
			const x2 = -(y2 - y1) + x1;
			spaceshipPhotonAttrs.push({
				x1: xScale(x1),
				y1: yScale(y1),
				x2: xScale(x2),
				y2: yScale(y2),
			});
		}

		data.push(
			...spaceshipPhotonAttrs.map(attrs => ({
				shape: "line",
				classes: [],
				attrs: {
					...attrs,
					...photonAttrs,
					stroke: colors.lighterLight,
				},
			})),
		);
	}

	data.push(
		{
			shape: "circle",
			classes: [],
			attrs: {
				cx: earthPos.x,
				cy: earthPos.y,
				fill: colors.earth,
				stroke: "#ccc",
				r: dotRadius,
			},
		},
		{
			shape: "circle",
			classes: [],
			attrs: {
				cx: shipPos.x,
				cy: shipPos.y,
				fill: colors.ship,
				stroke: "#ccc",
				r: dotRadius,
			},
		},
	);

	for (const d of data) {
		d.classes.push("c");
	}

	return { data, signals };
}

const sliders = {
	v: document.getElementById("input-v"),
	t: document.getElementById("input-t"),
};

const valueText = {
	v: document.getElementById("text-v"),
	t: document.getElementById("text-t"),
};

const checkboxes = {
	earthSignals: document.getElementById("checkbox-earth-signals"),
	shipSignals: document.getElementById("checkbox-ship-signals"),
};

const divs = {
	earthSignals: document.getElementById("earth-flashes-section"),
	shipSignals: document.getElementById("ship-flashes-section"),
};

const flashCounts = {
	earth: {
		sent: document.getElementById("flashes-sent-from-earth"),
		received: document.getElementById("flashes-received-on-earth"),
	},
	ship: {
		sent: document.getElementById("flashes-sent-from-ship"),
		received: document.getElementById("flashes-received-on-ship"),
	},
};

const FPS = 37;
const ANIMATION_DURATION_SEC = 8;
const ANIMATION_DURATION_MS = ANIMATION_DURATION_SEC * 1000;
const N_FRAMES = ANIMATION_DURATION_SEC * FPS;
const playbackInfo = {
	isPlaying: false,
	animationTimer: null,
	currFrame: 0,
	frameToTimeInterpolator: d3.scaleLinear(
		[0, N_FRAMES],
		[+sliders.t.min, +sliders.t.max],
	),
};

function update({ v, t, showEarthSignals, showSpaceshipSignals, userInput }) {
	if (userInput === undefined) {
		userInput = true;
	}

	if (v === undefined) {
		v = sliders.v.value;
	} else if (!userInput) {
		sliders.v.value = v;
	}
	v = +v;
	valueText.v.innerHTML = fmtFloat(v, 3);
	valueText.t.innerHTML = fmtFloat(v * 10, 2);

	if (t === undefined) {
		t = sliders.t.value;
	} else {
		playbackInfo.currFrame = playbackInfo.frameToTimeInterpolator.invert(t);
		if (!userInput) {
			sliders.t.value = t;
		} else {
			// eslint-disable-next-line no-use-before-define
			stopAnimation();
		}
	}
	t = +t;

	if (showEarthSignals === undefined) {
		showEarthSignals = checkboxes.earthSignals.checked;
	} else if (!userInput) {
		checkboxes.earthSignals.checked = true;
	}

	if (showSpaceshipSignals === undefined) {
		showSpaceshipSignals = checkboxes.shipSignals.checked;
	} else if (!userInput) {
		checkboxes.shipSignals.checked = true;
	}

	const { data: allData, signals } = getData({
		v,
		t,
		showEarthSignals,
		showSpaceshipSignals,
	});

	const shapes = groupBy(allData, d => `${d.shape}.c`, [
		"line.c",
		"circle.c",
		"path.c",
	]);

	for (const [selector, data] of shapes) {
		applyGraphicalObjs(svg, data, { selector });
	}

	svg.selectAll("circle.c").each(function () {
		svg.node().append(this);
	});

	for (const [frame, events] of Object.entries(signals)) {
		for (const [name, count] of Object.entries(events)) {
			const span = flashCounts[frame][name];
			span.innerText = count;

			// if (
			// 	(frame === "ship" && name === "sent") ||
			// 	(frame === "earth" && name === "received")
			// ) {
			// 	span.style.color = colors.lighterLight;
			// }
		}
	}

	divs.earthSignals.style.visibility = showEarthSignals ? "visible" : "hidden";
	divs.shipSignals.style.visibility = showSpaceshipSignals ? "visible" : "hidden";
}

const buttons = {
	playPause: document.getElementById("btn-play-pause"),
	reset: document.getElementById("btn-reset"),
};

function stopAnimation() {
	playbackInfo.isPlaying = false;
	clearInterval(playbackInfo.animationTimer);
	buttons.playPause.innerText = "Start";
}

// eslint-disable-next-line no-unused-vars
function toggleAnimation() {
	if (playbackInfo.isPlaying) {
		stopAnimation();
		return;
	}

	playbackInfo.isPlaying = true;
	buttons.playPause.innerText = "Pause";
	if (playbackInfo.currFrame >= N_FRAMES) {
		playbackInfo.currFrame = 0;
	}

	playbackInfo.animationTimer = setInterval(() => {
		playbackInfo.currFrame += 1;

		if (playbackInfo.currFrame >= N_FRAMES) {
			update({ t: sliders.t.max });
			stopAnimation();
			return;
		}

		const t = playbackInfo.frameToTimeInterpolator(playbackInfo.currFrame);
		update({ t, userInput: false });
	}, ANIMATION_DURATION_MS / N_FRAMES);
}

// eslint-disable-next-line no-unused-vars
function resetAnimation() {
	stopAnimation();
	update({ t: 0, userInput: false });
}

update({
	v: 0.1,
	t: 0,
	showEarthSignals: true,
	showSpaceshipFlashes: true,
	userInput: false,
});
