/* global applyGraphicalObjs defineArrowhead */

const ORBITS_WIDTH = 450;
const ORBITS_HEIGHT = ORBITS_WIDTH;
const GRAPH_WIDTH = 450;
const GRAPH_HEIGHT = 350;

const MARGIN = 10;

const orbitsCanvas = d3
	.select("#orbits")
	.attr("width", ORBITS_WIDTH)
	.attr("height", ORBITS_HEIGHT);

const graphCanvas = d3
	.select("#v-graph")
	.attr("width", GRAPH_WIDTH)
	.attr("height", GRAPH_HEIGHT);

const graphDefs = graphCanvas.append("defs");
defineArrowhead(graphDefs, { id: "arrowhead", length: 10, width: 10, color: "white" });

const ORBIT_CX = 0;
const ORBIT_CY = 0;
const ORBIT_R_MAX = 1;

const GRAPH_X_MIN = 0;
const GRAPH_X_MAX = 1;
const GRAPH_Y_MIN = 0;
const GRAPH_Y_MAX = 1;

const orbitXScale = d3.scaleLinear(
	[-ORBIT_R_MAX, ORBIT_R_MAX],
	[MARGIN, ORBITS_WIDTH - MARGIN],
);
const orbitYScale = d3.scaleLinear(
	[-ORBIT_R_MAX, ORBIT_R_MAX],
	[ORBITS_HEIGHT - MARGIN, MARGIN],
);
const orbitDistScale = d3.scaleLinear([0, ORBIT_R_MAX], [0, ORBITS_WIDTH / 2 - MARGIN]);

const graphXScale = d3.scaleLinear([-0.1, 1.1], [MARGIN, GRAPH_WIDTH - MARGIN]);
const graphYScale = d3.scaleLinear([-0.1, 1.1], [GRAPH_HEIGHT - MARGIN, MARGIN]);

const distSlider = (() => {
	const slider = document.getElementById("input-r");
	slider.min = 0.1 * ORBIT_R_MAX;
	slider.max = 1 * ORBIT_R_MAX;
	slider.value = 0.5;
	slider.step = 0.0001;

	return slider;
})();

const playButton = document.getElementById("btn-playpause");

let currentTime = 0;
let variablePlanetAngleRad = 0;

const SCALED_PLANET_RADIUS = 10;

function distToSpeed(dist) {
	const GRAV_TERM = 0.5;
	return Math.sqrt(GRAV_TERM / dist);
}

const MAX_SPEED = distToSpeed(+distSlider.min);

const graphPlotX = x => graphXScale(0.9 * x) + 10;
const graphPlotY = y => graphYScale(y / MAX_SPEED) + 10;

const FIXED_PLANETS = [
	["blue", 0.2, "#37f"],
	["green", 0.4, "#0c6"],
	["white", 0.6, "#ddd"],
	["orange", 0.8, "#fa5"],
].map(([name, dist, color]) => {
	const speed = distToSpeed(dist);
	return { name, dist, color, speed };
});

function _maybeAddVariableClass(name, c) {
	return name === "red" ? `${c} variable` : c;
}

const graphCurveData = (() => {
	const graphLine = d3
		.line()
		.curve(d3.curveNatural)
		.x(p => graphPlotX(p[0]))
		.y(p => graphPlotY(p[1]));
	const nPathPoints = 100;
	const dx = (GRAPH_X_MAX - GRAPH_X_MIN) / (nPathPoints - 1);
	const pathPoints = d3.range(8, nPathPoints + 11).map(i => {
		const x = GRAPH_X_MIN + i * dx;
		const y = distToSpeed(x);
		return [x, y];
	});
	console.log(pathPoints);

	return graphLine(pathPoints);
})();

function getData(t, dt) {
	// Shared stuff
	const planetSpeed = +distSlider.value;
	const variablePlanet = {
		name: "red",
		dist: planetSpeed,
		color: "#f55",
		speed: distToSpeed(planetSpeed),
	};

	const planets = [...FIXED_PLANETS, variablePlanet];

	// Orbital stuff

	const orbitData = planets.map(({ name, dist }) => {
		return {
			shape: "circle",
			class: _maybeAddVariableClass(name, "orbit-circle"),
			attrs: {
				cx: orbitXScale(ORBIT_CX),
				cy: orbitYScale(ORBIT_CY),
				r: orbitDistScale(dist),
			},
		};
	});

	const planetData = planets.map(({ name, dist, color, speed }) => {
		const orbitCircumference = 2 * Math.PI * dist;
		const angleRad = (() => {
			if (name === "red") {
				const dAngle = 2 * Math.PI * ((speed * dt) / orbitCircumference);
				variablePlanetAngleRad += dAngle;
				return variablePlanetAngleRad;
			} else {
				const revolutionFrac = ((speed * t) / orbitCircumference) % 1;
				const angleRad = 2 * Math.PI * revolutionFrac;
				return angleRad;
			}
		})();

		const planetX = ORBIT_CX + dist * Math.cos(angleRad);
		const planetY = ORBIT_CY + dist * Math.sin(angleRad);
		const planet = {
			shape: "circle",
			class: _maybeAddVariableClass(name, "planet"),
			attrs: {
				cx: orbitXScale(planetX),
				cy: orbitYScale(planetY),
				r: SCALED_PLANET_RADIUS,
				fill: color,
			},
		};

		return planet;
	});

	const starDatum = {
		shape: "circle",
		class: "central-star",
		attrs: {
			cx: orbitXScale(ORBIT_CX),
			cy: orbitYScale(ORBIT_CY),
			r: 18,
		},
	};

	const orbitalData = [...orbitData, starDatum, ...planetData].map(datum => {
		const cssClass = `${datum.class} orbital-obj`;
		return { ...datum, class: cssClass };
	});

	// Graph stuff
	const graphXMinScaled = graphXScale(GRAPH_X_MIN);
	const graphXMaxScaled = graphXScale(GRAPH_X_MAX);
	const graphYMinScaled = graphYScale(GRAPH_Y_MIN);
	const graphYMaxScaled = graphYScale(GRAPH_Y_MAX);
	const graphData = [
		{
			shape: "line",
			class: "axis x-axis",
			attrs: {
				x1: graphXMinScaled,
				x2: graphXMaxScaled,
				y1: graphYMinScaled,
				y2: graphYMinScaled,
				"marker-end": "url(#arrowhead)",
			},
		},
		{
			shape: "line",
			class: "axis y-axis",
			attrs: {
				x1: graphXMinScaled,
				x2: graphXMinScaled,
				y1: graphYMinScaled,
				y2: graphYMaxScaled,
				"marker-end": "url(#arrowhead)",
			},
		},
		{
			shape: "text",
			class: "axis-label x-axis-label",
			text: "𝑟",
			attrs: {
				x: graphXMaxScaled,
				y: graphYMinScaled,
				dx: -18,
				dy: 18,
			},
		},
		{
			shape: "text",
			class: "axis-label y-axis-label",
			text: "𝑣",
			attrs: {
				x: graphXMinScaled,
				y: graphYMaxScaled,
				dx: -18,
				dy: 18,
			},
		},
		{
			shape: "path",
			class: "graph-curve",
			attrs: { d: graphCurveData },
		},
		...planets.map(({ dist, speed, color }) => {
			const distScaled = graphPlotX(dist);
			const speedScaled = graphPlotY(speed);

			return {
				shape: "circle",
				class: "planet",
				attrs: {
					cx: distScaled,
					cy: speedScaled,
					r: SCALED_PLANET_RADIUS,
					fill: color,
				},
			};
		}),
	].map(o => {
		const c = o.class;
		return { ...o, class: `${c} graph-obj` };
	});

	return { orbitalData, graphData };
}

// eslint-disable-next-line no-unused-vars
function update(dt) {
	dt = dt ?? 0;
	const { orbitalData, graphData } = getData(currentTime, dt);
	applyGraphicalObjs(orbitsCanvas, orbitalData, { selector: ".orbital-obj" });
	applyGraphicalObjs(graphCanvas, graphData, { selector: ".graph-obj" });
}

update(0);

let isPlaying = false;
let animationFrame;
// eslint-disable-next-line no-unused-vars
function playPause() {
	let prevTimeMS;
	function step(timestampMS) {
		if (prevTimeMS === undefined) {
			prevTimeMS = timestampMS;
		}

		const dtMS = timestampMS - prevTimeMS;
		currentTime += dtMS / 1000;

		update(dtMS / 1000);

		prevTimeMS = timestampMS;
		animationFrame = window.requestAnimationFrame(step);
	}

	if (!isPlaying) {
		playButton.innerText = "Pause";
		animationFrame = window.requestAnimationFrame(step);
	} else {
		playButton.innerText = "Play";
		window.cancelAnimationFrame(animationFrame);
	}

	isPlaying = !isPlaying;
}
