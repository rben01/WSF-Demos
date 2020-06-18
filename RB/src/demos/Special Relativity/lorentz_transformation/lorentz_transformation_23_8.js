/* global applyGraphicalObjs Plotly TORUS_POINTS lorentzFactor */

const joystickAttrs = {
	width: 100,
	height: 100,
	cornerRadius: 5,
	bgColor: "#ddd",
	lineColor: "#888",
	knobColor: "#eee",
	knobOutline: "#aaa",
};

const XMIN = -1;
const XMAX = 1;
const XMID = (XMIN + XMAX) / 2;
const YMIN = -1;
const YMAX = 1;
const YMID = (YMIN + YMAX) / 2;

const xScale = d3.scaleLinear().domain([XMIN, XMAX]).range([0, joystickAttrs.width]);
const yScale = d3.scaleLinear().domain([YMIN, YMAX]).range([joystickAttrs.height, 0]);

const knobCoords = { x: XMID, y: YMID };

const joystick = d3
	.select("#velocity-dir-input")
	.attr("width", joystickAttrs.width)
	.attr("height", joystickAttrs.height);

joystick
	.append("rect")
	.attr("x", 0)
	.attr("y", 0)
	.attr("width", joystickAttrs.width)
	.attr("height", joystickAttrs.height)
	.attr("fill", joystickAttrs.bgColor)
	.attr("rx", joystickAttrs.cornerRadius)
	.attr("pointer-events", "all");

const lines = applyGraphicalObjs(
	joystick,
	[
		{ x1: XMIN, y1: YMID, x2: XMAX, y2: YMID },
		{ x1: XMID, y1: YMIN, x2: XMID, y2: YMAX },
	].map(attrs => {
		const x1 = xScale(attrs.x1);
		const y1 = yScale(attrs.y1);
		const x2 = xScale(attrs.x2);
		const y2 = yScale(attrs.y2);

		return {
			shape: "line",
			attrs: {
				x1,
				y1,
				x2,
				y2,
				stroke: joystickAttrs.lineColor,
				"stroke-width": 2,
			},
		};
	}),
);

const knob = applyGraphicalObjs(joystick, [
	{
		shape: "circle",
		attrs: {
			cx: xScale(knobCoords.x),
			cy: yScale(knobCoords.y),
			r: 10,
			fill: joystickAttrs.knobColor,
			stroke: joystickAttrs.knobOutline,
			"stroke-width": 1,
			filter: "url(#knob-shadow)",
		},
	},
]);

function moveJoystick(ex, ey) {
	const x = xScale.invert(ex);
	const y = yScale.invert(ey);

	if (!(XMIN < x && x < XMAX && YMIN < y && y < YMAX)) {
		return;
	}

	knob.attr("cx", ex).attr("cy", ey);

	knobCoords.x = x;
	knobCoords.y = y;

	lines
		.data([
			{ x1: xScale(XMIN), y1: ey, x2: xScale(XMAX), y2: ey },
			{ x1: ex, y1: yScale(YMIN), x2: ex, y2: yScale(YMAX) },
		])
		.attr("x1", d => d.x1)
		.attr("y1", d => d.y1)
		.attr("x2", d => d.x2)
		.attr("y2", d => d.y2);
}

let mouseIsDown = false;
joystick
	.on("mousedown", function () {
		mouseIsDown = true;
		const [ex, ey] = d3.mouse(this);
		moveJoystick(ex, ey);
	})
	.on("mousemove", function () {
		if (mouseIsDown) {
			const [ex, ey] = d3.mouse(this);
			moveJoystick(ex, ey);
		}
	})
	.on("mouseup", function () {
		mouseIsDown = false;
	});

function matMul(matrix, column, point) {
	const newPoint = {};
	const sums = {};
	Object.entries(matrix).forEach(([axis, row]) => {
		let boost = 0;
		for (let j = 0; j < row.length; ++j) {
			boost += row[j] * column[j];
		}

		const oldVal = point[axis];
		const newVal = Math.abs(boost) < 0.001 ? 0 : (oldVal * oldVal) / boost;
		newPoint[axis] = newVal;
		sums[axis] = boost;
	});
	if (Math.abs(newPoint.z) > 20) {
		console.log(matrix);
		console.log(column);
		console.log(newPoint, sums);
	}
	return newPoint;
}

function plotTorus(speed, theta, phi) {
	const cosTheta = Math.cos(theta);
	const sinTheta = Math.sin(theta);
	const cosPhi = Math.cos(phi);
	const sinPhi = Math.sin(phi);

	const v = {
		s: speed,
		x: speed * cosPhi * cosTheta,
		y: speed * cosPhi * sinTheta,
		z: speed * sinPhi,
	};

	// Will have lots of needless keys but idrc
	const vEntries = Object.entries(v);
	vEntries.forEach(([ax1, speed1]) => {
		vEntries.forEach(([ax2, speed2]) => {
			const key = `${ax1}${ax2}`;
			v[key] = speed1 * speed2;
		});
	});

	if (speed === 0) {
		v.ss = 1;
	}

	console.log(v);

	const lf = lorentzFactor({ fracOfC: speed });
	const matrix = {
		t: [lf, -lf * v.x, -lf * v.y, -lf * v.z],
		x: [
			-lf * v.x,
			1 + ((lf - 1) * v.xx) / v.ss,
			((lf - 1) * v.xy) / v.ss,
			((lf - 1) * v.xz) / v.ss,
		],
		y: [
			-lf * v.y,
			((lf - 1) * v.yx) / v.ss,
			1 + ((lf - 1) * v.yy) / v.ss,
			((lf - 1) * v.yz) / v.ss,
		],
		z: [
			-lf * v.z,
			((lf - 1) * v.zx) / v.ss,
			((lf - 1) * v.zy) / v.ss,
			1 + ((lf - 1) * v.zz) / v.ss,
		],
	};
	console.log(matrix);

	const torusPrime = { x: [], y: [], z: [] };
	const axes = Object.keys(torusPrime);
	for (let i = 0; i < TORUS_POINTS.x.length; ++i) {
		const coords = [TORUS_POINTS.x, TORUS_POINTS.y, TORUS_POINTS.z].map(l => l[i]);
		const column = [0, ...coords];
		const point = { x: coords[0], y: coords[1], z: coords[2] };

		const newPoint = matMul(matrix, column, point);

		axes.forEach(axis => {
			torusPrime[axis].push(newPoint[axis]);
		});
	}

	const ringTraces = (() => {
		const majorRadius = 3;
		const minorRadius = 1.001;

		function getPoint(theta, phi) {
			const x = (majorRadius + minorRadius * Math.cos(phi)) * Math.cos(theta);
			const y = (majorRadius + minorRadius * Math.cos(phi)) * Math.sin(theta);
			const z = minorRadius * Math.sin(phi);

			const column = [0, x, y, z];
			const point = { x, y, z };

			const newPoint = matMul(matrix, column, point);
			return newPoint;
		}

		const traces = [];

		const nThetas = 17;
		const nPhis = 7;
		const nPointsPerRing = 79;
		const dTheta = (2 * Math.PI) / nThetas;
		const dPhi = (2 * Math.PI) / nPhis;
		const dRingPoints = (2 * Math.PI) / nPointsPerRing;

		const ringTraceAttrs = {
			type: "scatter3d",
			mode: "lines",
			line: {
				width: 2,
				color: "#bbb",
			},
		};

		for (let i = 0; i <= nThetas; ++i) {
			const primedRing = { x: [], y: [], z: [] };
			const theta = i * dTheta;
			for (let j = 0; j <= nPointsPerRing; ++j) {
				const phi = j * dRingPoints;

				const point = getPoint(theta, phi);
				axes.forEach(axis => {
					const newVal = point[axis];
					primedRing[axis].push(newVal);
				});
			}
			traces.push({
				...primedRing,
				...ringTraceAttrs,
			});
		}
		for (let i = 0; i <= nPhis; ++i) {
			const primedRing = { x: [], y: [], z: [] };
			const phi = i * dPhi;
			for (let j = 0; j <= nPointsPerRing; ++j) {
				const theta = j * dRingPoints;

				const point = getPoint(theta, phi);
				axes.forEach(axis => {
					const newVal = point[axis];
					primedRing[axis].push(newVal);
				});
			}
			traces.push({
				...primedRing,
				...ringTraceAttrs,
			});
		}

		return traces;
	})();

	const data = [
		{
			type: "mesh3d",
			scene: "scene1",
			x: torusPrime.x,
			y: torusPrime.y,
			z: torusPrime.z,
			i: TORUS_POINTS.simplices.map(s => s[0]),
			j: TORUS_POINTS.simplices.map(s => s[1]),
			k: TORUS_POINTS.simplices.map(s => s[2]),
			facecolor: d3
				.range(TORUS_POINTS.simplices.length)
				.map(i => d3.interpolateViridis(i / TORUS_POINTS.simplices.length)),
			// marker: { size: 1, color: "red" },
		},
		// {
		// 	type: "mesh3d",
		// 	scene: "scene1",
		// 	x: TORUS_POINTS.x,
		// 	y: TORUS_POINTS.y,
		// 	z: TORUS_POINTS.z,
		// 	i: TORUS_POINTS.simplices.map(s => s[0]),
		// 	j: TORUS_POINTS.simplices.map(s => s[1]),
		// 	k: TORUS_POINTS.simplices.map(s => s[2]),

		// 	// marker: { size: 1, color: "red" },
		// },
		// ...ringTraces,
	];
	console.log(data);

	const axesAttrs = {
		// showgrid: false,
		// visible: false,
		// showspikes: false,
	};
	const layout = {
		showlegend: false,
		scene1: {
			xaxis: axesAttrs,
			yaxis: axesAttrs,
			zaxis: axesAttrs,
			aspectmode: "data",
			// yaxis: { showgrid: false, visible: false, showspikes: false },
			// zaxis: { showgrid: false, visible: false, showspikes: false },
		},
	};

	Plotly.react("plot", data, layout);
}

plotTorus(0.9, 0, Math.PI / 3);
