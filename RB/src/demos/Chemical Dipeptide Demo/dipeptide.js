/* global applyGraphicalObjs defineArrowhead groupBy Plotly DIPEPTIDE_WELL */

const CONFIG = {
	containerSVGWidth: 250,
	containerSVGHeight: 300,
	graphSVGWidth: 800,
	graphSVGHeight: 300,
	equationSVGWidth: 800,
	equationSVGHeight: 150,
	dipeptideRadius: 7,
	fluidColor: "#e6f7ff",
	fluidHeight: 0.6,
	symbolSize: 50,
	symbolPad: 4,
	beakerColor: "#047",
};

const COLORS = {
	blue: "#23f",
	orange: "#f92",
	green: "#0b3",
	purple: "#c3f",
};

const beaker = d3
	.selectAll(".container")
	.attr("width", CONFIG.containerSVGWidth)
	.attr("height", CONFIG.containerSVGHeight);
const graph = d3
	.select("#energy-graph")
	.attr("width", CONFIG.graphSVGWidth)
	.attr("height", CONFIG.graphSVGHeight);
const equation = d3
	.select("#dipeptide-equation")
	.attr("width", CONFIG.equationSVGWidth)
	.attr("height", CONFIG.equationSVGHeight);

const STAGES = {
	initial: 0,
	enzyme: 1,
	ligand: 2,
	energyWell: 3,
};
let prevStage = null;
const verticalDistanceBetweenDipeptides = 10;

// Create enzyme and ligand symbols
(() => {
	const { symbolSize: size, symbolPad: pad } = CONFIG;

	const crescentScale = d3.scaleLinear([0, 1], [pad, size - pad]);
	const crescentOuterRadius = (size - 2 * pad) * 0.4;
	const crescentInnerRadius = (size - 2 * pad) * 0.28;
	beaker
		.append("symbol")
		.attr("id", "symbol-enzyme")
		.append("path")
		.attr(
			"d",
			`
			M ${crescentScale(0.75)} ${crescentScale(0.25)}
			A ${crescentOuterRadius} ${crescentOuterRadius} 0 1 0 ${crescentScale(
				0.75,
			)} ${crescentScale(0.75)}
			A ${crescentInnerRadius} ${crescentInnerRadius} 0 1 1 ${crescentScale(
				0.75,
			)} ${crescentScale(0.25)}
			`,
		)
		.attr("fill", "blue")
		.attr("stroke-opacity", 0);

	// Assuming the squiggle lives in a 1*1 box (which we'll rescale later)
	const squiggleScale = 1.15;
	const squiggleXScale = d3.scaleLinear([0, 1], [pad, squiggleScale * size - pad]);
	const squiggleYScale = d3.scaleLinear([0, 1], [squiggleScale * size - pad, pad]);
	const squiggleDistScale = d3.scaleLinear(
		[0, 1],
		[0, squiggleScale * size - 2 * pad],
	);

	const squiggleRadius = 0.15;
	function arcTo(x, y, { r, angle, largeArcFlag, sweepFlag }) {
		if (r === undefined) {
			r = squiggleRadius;
		}
		r = squiggleDistScale(r);

		if (largeArcFlag === undefined) {
			largeArcFlag = 0;
		}

		if (angle === undefined) {
			angle = 0;
		}

		x = squiggleXScale(x);
		y = squiggleYScale(y);

		return `A ${r} ${r} ${angle} ${largeArcFlag} ${sweepFlag} ${x} ${y}`;
	}
	function moveTo(x, y) {
		return `M ${squiggleXScale(x)} ${squiggleYScale(y)}`;
	}
	function lineTo(x, y) {
		return `L ${squiggleXScale(x)} ${squiggleYScale(y)}`;
	}

	const [x0, x1, x2, x3] = [-1.5, -0.5, 0.5, 1.5].map(i => 0.5 + i * squiggleRadius);
	const [y0, y1, y2, yMid, y4, y5, y6] = d3
		.range(-3, 4)
		.map(i => 0.5 + i * squiggleRadius);
	const squiggleArcPoints = [
		moveTo(x2, y6),
		lineTo(x3, y6),
		arcTo(x3, y4, { sweepFlag: 1 }),
		lineTo(x3, yMid),
		arcTo(x2, y2, { sweepFlag: 1 }),
		lineTo(x2, y1),
		arcTo(x1, y0, { sweepFlag: 1 }),
		lineTo(x0, y0),
		arcTo(x0, y2, { sweepFlag: 1 }),
		lineTo(x0, yMid),
		arcTo(x1, y4, { sweepFlag: 1 }),
		lineTo(x1, y5),
		arcTo(x2, y6, { sweepFlag: 1 }),
	];

	beaker
		.append("symbol")
		.attr("id", "symbol-ligand")
		.append("path")
		// .attr("d", squiggleArcPoints.join(" "))
		.attr("d", squiggleArcPoints.join(" "))
		.attr("fill-opacity", 0)
		.attr("stroke", "black")
		.attr("stroke-width", 1)
		.attr("stroke-opacity", 1);
})();

// Create chemical equation "equilibrium" arrows
(() => {
	const { symbolSize: size, symbolPad: pad } = CONFIG;
	const symbolViewbox = `${-size / 2} ${-size / 2} ${size} ${size}`;

	const scale = d3.scaleLinear([0, 1], [pad, size - pad]);
	const symbol = equation
		.append("symbol")
		.attr("viewbox", symbolViewbox)
		.attr("id", "symbol-eqn-arrow");
	const arrowPoints = [
		[0, 0.4],
		[1, 0.4],
		[0.75, 0.25],
		[0.88, 0.38],
		[0.85, 0.4],
	];

	const upsideUpPathString = [
		...arrowPoints.map((point, i) => {
			const [x, y] = point.map(scale);
			if (i === 0) {
				return `M ${x} ${y}`;
			}
			return `L ${x} ${y}`;
		}),
		"Z",
	].join(" ");

	const upsideDownPathString = [
		...arrowPoints.map((point, i) => {
			const [x, y] = point.map(comp => scale(1 - comp));
			if (i === 0) {
				return `M ${x} ${y}`;
			}
			return `L ${x} ${y}`;
		}),
		"Z",
	];
	for (const s of [upsideUpPathString, upsideDownPathString]) {
		symbol
			.append("path")
			.attr("d", s)
			.attr("stroke", "black")
			.attr("fill", "black")
			.attr("stroke-linejoin", "round");
	}
})();

const beakerXScale = d3.scaleLinear([0, 1], [0, CONFIG.containerSVGWidth]);
const beakerYScale = d3.scaleLinear([0, 1], [CONFIG.containerSVGHeight, 0]);
const beakerLine = d3
	.line()
	.x(p => p[0])
	.y(p => p[1]);

function getBeakerOutlineData() {
	const beakerColor = CONFIG.beakerColor;
	const ellipseWidth = beakerXScale(0.8) - beakerXScale(0);
	const ellipseHeight = beakerYScale(0.15) - beakerYScale(0);
	const leftX = beakerXScale(0.1);
	const rightX = beakerXScale(0.9);
	const topLeftY = beakerYScale(0.9);
	const midLeftY = beakerYScale(CONFIG.fluidHeight);
	const botLeftY = beakerYScale(0.1);
	const fluidColor = CONFIG.fluidColor;
	const strokeWidth = 1;

	function getEllipsePath(leftY, topHalf) {
		const orientation = topHalf ? 1 : 0;
		return `
				M ${leftX} ${leftY}
				a ${ellipseWidth / 2} ${ellipseHeight / 2} 0 0 ${orientation} ${ellipseWidth} 0
				`;
	}

	const beakerOutline = {
		shape: "path",
		class: "beaker-top-back",
		attrs: {
			d: `
			M ${leftX} ${botLeftY}
			V ${topLeftY}
			M ${rightX} ${botLeftY}
			V ${topLeftY}
			${getEllipsePath(topLeftY, true)}
			${getEllipsePath(midLeftY, false)}
			${getEllipsePath(midLeftY, true)}
			${getEllipsePath(botLeftY, false)}
			`,
			stroke: beakerColor,
			"stroke-width": strokeWidth,
			"fill-opacity": 0,
		},
	};

	const beakerLidFront = {
		shape: "path",
		class: "beaker-lid-front",
		attrs: {
			d: `
			M ${rightX} ${topLeftY}
			${getEllipsePath(topLeftY, false)}
			`,
			stroke: beakerColor,
			"stroke-width": strokeWidth,
			"fill-opacity": 0,
		},
	};

	const beakerBackOutline = {
		shape: "path",
		class: "beaker-back",
		attrs: {
			d: `
			M ${leftX} ${botLeftY}
			${getEllipsePath(botLeftY, true)}
			`,
			stroke: d3.interpolate(beakerColor, fluidColor)(0.8),
			"stroke-width": strokeWidth,
			"fill-opacity": 0,
		},
	};

	const beakerFluid = {
		shape: "path",
		class: "beaker-bottom",
		attrs: {
			d: `
			M ${leftX} ${botLeftY}
			V ${midLeftY}
			${getEllipsePath(midLeftY, true, false)}
			V ${botLeftY}
			a ${ellipseWidth / 2} ${ellipseHeight / 2} 0 0 1 ${-ellipseWidth} 0
			Z
			`,
			"stroke-opacity": 0,
			"stroke-width": strokeWidth,
			fill: fluidColor,
		},
	};

	return {
		background: [beakerFluid, beakerBackOutline],
		foreground: [beakerOutline, beakerLidFront],
	};
}

let baseID = 0;

function getEncirclingLineData(points, lineFunc, opaqueEncirclingLineBg) {
	const r = CONFIG.dipeptideRadius;
	return [
		{
			shape: "path",
			class: "ligand-exterior",
			attrs: {
				d: lineFunc(points),
				"stroke-width": r * 2 + 9,
				stroke: "black",
				"stroke-linecap": "round",
				"stroke-linejoin": "round",
			},
		},
		{
			shape: "path",
			class: "ligand-interior",
			attrs: {
				d: lineFunc(points),
				"stroke-width": r * 2 + 7,
				stroke: opaqueEncirclingLineBg ? CONFIG.fluidColor : "white",
				"stroke-linecap": "round",
				"stroke-linejoin": "round",
			},
		},
	];
}

// p0 is the center {x,y} of the first dot in the chain
// angles is a list of relative angles for the next dot in the chain to appear relative to the previous one (e.g., four Math.PI/2's would do a full circle)
// colors contains the colors of the dots; a null entry indicates use the default orange color
// precondition: angles.length === colors.length - 1 (the first dot needs a color but not an angle)
function makeDipeptideChain(
	p0,
	angles,
	colors,
	{ drawEncirclingLine, opaqueEncirclingLineBg, ids } = {},
) {
	const nCircles = colors.length;

	if (ids === undefined) {
		ids = d3.range(nCircles).map(i => i + baseID);
		baseID += nCircles;
	}

	if (drawEncirclingLine === undefined) {
		drawEncirclingLine = false;
	}

	if (opaqueEncirclingLineBg === undefined) {
		opaqueEncirclingLineBg = true;
	}

	const r = CONFIG.dipeptideRadius;

	let { x: cx, y: cy } = p0;
	let angle = 0;
	const centerPoints = [];
	const chain = d3.range(nCircles).map(i => {
		const color = colors[i];
		const dot = {
			shape: "circle",
			class: "peptide",
			angle,
			id: `${ids[i]}`,
			color: color,
			attrs: {
				cx,
				cy,
				r,
				fill: color === null ? COLORS.orange : color,
			},
		};

		centerPoints.push([cx, cy]);

		angle += angles[i];
		cx += 2 * r * Math.cos(angle);
		cy -= 2 * r * Math.sin(angle);
		return dot;
	});

	const data = [];

	if (drawEncirclingLine) {
		const encirclingLineData = getEncirclingLineData(
			centerPoints,
			beakerLine,
			opaqueEncirclingLineBg,
		);
		for (const d of encirclingLineData) {
			d.attrs["fill-opacity"] = 0;
		}
		data.push(...encirclingLineData);
	}

	data.push(...chain);

	for (const datum of data) {
		const klass = datum.class;
		delete datum.class;
		if (klass) {
			datum.classes = ["chemical-obj", klass];
		}
	}
	return data;
}

const initialEnergy = 0.6;
const energyCurvePadAbove = 0.035;
const dipeptideCurveInitialY = initialEnergy + energyCurvePadAbove;
const basicDipeptideChainInfo = [
	{
		x: beakerXScale(0.2),
		y: beakerYScale(0.3),
		angles: [0.3],
		colors: [COLORS.blue, null],
		graphX: 0.1,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.4),
		y: beakerYScale(0.58),
		angles: [Math.PI / 8],
		colors: [COLORS.purple, null],
		graphX: 0.17,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.71),
		y: beakerYScale(0.2),
		angles: [Math.PI / 2.3],
		colors: [COLORS.green, null],
		graphX: 0.8,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.6),
		y: beakerYScale(0.4),
		angles: [Math.PI / 0.9],
		colors: [COLORS.blue, null],
		graphX: 0.33,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.42),
		y: beakerYScale(0.2),
		angles: [Math.PI * (1 + 1 / 1.1)],
		colors: [COLORS.purple, null],
		graphX: 0.41,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.8),
		y: beakerYScale(0.4),
		angles: [Math.PI / 1.5],
		colors: [COLORS.blue, null],
		graphX: 0.5,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.38),
		y: beakerYScale(0.43),
		angles: [Math.PI / 1.1],
		colors: [COLORS.green, null],
		graphX: 0.65,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.5),
		y: beakerYScale(0.1),
		angles: [Math.PI * (1 + 1 / 1.1)],
		colors: [COLORS.green, null],
		graphX: 0.25,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.6),
		y: beakerYScale(0.26),
		angles: [1.9],
		colors: [COLORS.purple, null],
		graphX: 0.74,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.7),
		y: beakerYScale(0.52),
		angles: [Math.PI / 1.4],
		colors: [COLORS.green, null],
		graphX: 0.58,
		graphY: dipeptideCurveInitialY,
	},
	{
		x: beakerXScale(0.3),
		y: beakerYScale(0.1),
		angles: [0.4],
		colors: [COLORS.blue, null],
		graphX: 0.9,
		graphY: dipeptideCurveInitialY,
	},
];

const basicDipeptides = basicDipeptideChainInfo.map(d =>
	makeDipeptideChain({ x: d.x, y: d.y }, d.angles, d.colors),
);

// precondition: joinAngles.length === 2 * (indices.length - 1) (one index per joined chain, two joinAngles per adjacent pair of joined chains)
function joinBasicDipeptides({
	newP0,
	indices,
	joinAngles,
	drawEncirclingLine,
	opaqueEncirclingLineBg,
	dipeptides,
}) {
	if (newP0 === undefined || newP0 === null) {
		const { x: cx, y: cy } = basicDipeptideChainInfo[indices[0]];
		newP0 = { x: cx, y: cy };
	}

	const colors = [];
	const angles = [];
	const ids = [];
	for (let j = 0; j < indices.length; ++j) {
		const chain = dipeptides[indices[j]];
		colors.push(...chain.map(d => d.color));
		ids.push(...chain.map(d => d.id));

		const anglesToOmit = j === 0 ? 1 : 2;
		angles.push(...chain.slice(anglesToOmit).map(d => d.angle));
		if (j !== indices.length - 1) {
			angles.push(joinAngles[2 * j], joinAngles[2 * j + 1]);
		}
	}

	return makeDipeptideChain(newP0, angles, colors, {
		drawEncirclingLine,
		opaqueEncirclingLineBg,
		ids,
	});
}

const randomJoinAngles = [
	-0.3626769162876612,
	1, //-0.37786879838531773,
	1, //-0.03411404967316334,
	0.06750564727078368,
	0.21490286059949115,
	1, //0.02809284890795294,
	-0.4449417705708276,
	-0.12330765915073838,
	1, //-0.334978273287302,
	0.031974644919427364,
	-0.058114824287623934,
	1, //0.15546516732918636,
	-0.20967142597451105,
	1, //0.39435779249912994,
	1, //0.3810119829387127,
	1, //-0.16855002719271528,
	0.14616589504372046,
	-0.4635647539182338,
	-0.3896115422424,
	-0.42834621932104666,
	-0.04019801937756873,
	0.48928649383884604,
];

const stageJoinIndices = {
	[STAGES.initial]: d3.range(basicDipeptides.length).map(i => [i]),
	[STAGES.enzyme]: [
		[0, 7],
		[1, 8],
		[3, 2],
		[4, 5, 6],
		...d3.range(9, basicDipeptides.length).map(i => [i]),
	],
	[STAGES.ligand]: [
		[0, 7, 9, 2],
		[4, 5, 1, 10],
		[8, 6, 3, ...d3.range(11, basicDipeptides.length)],
	],
};

function indicesToDipeptideChain({
	indices,
	newP0,
	drawEncirclingLine,
	opaqueEncirclingLineBg,
	dipeptides,
}) {
	const allButFirstJoinIndex = indices.slice(1);
	const joinAngles = [
		...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j]),
		...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j + 1]),
	];
	return joinBasicDipeptides({
		newP0,
		indices,
		joinAngles,
		drawEncirclingLine,
		opaqueEncirclingLineBg,
		dipeptides,
	});
}

function getBeakerData(stage) {
	if (stage === STAGES.initial) {
		return basicDipeptides.flat(Infinity);
	} else if (stage === STAGES.enzyme) {
		return stageJoinIndices[stage]
			.map(indices =>
				indicesToDipeptideChain({ indices, dipeptides: basicDipeptides }),
			)
			.flat(Infinity);
	} else if (stage === STAGES.ligand) {
		const newP0s = [
			{ x: beakerXScale(0.2), y: beakerYScale(0.3) },
			{ x: beakerXScale(0.4), y: beakerYScale(0.2) },
			{ x: beakerXScale(0.75), y: beakerYScale(0.3) },
		];
		return stageJoinIndices[stage]
			.map((indices, j) =>
				indicesToDipeptideChain({
					indices,
					newP0: newP0s[j],
					drawEncirclingLine: true,
					dipeptides: basicDipeptides,
				}),
			)
			.flat(Infinity);
	} else {
		throw new Error(`Unexpected containerIndex ${stage}`);
	}
}

function getLengthAtX(pathNode, x) {
	let leftLength = 0;
	let rightLength = pathNode.getTotalLength();
	while (leftLength < rightLength - 1) {
		const middleLength = (leftLength + rightLength) / 2;
		const middlePointX = pathNode.getPointAtLength(middleLength).x;
		if (x < middlePointX) {
			rightLength = middleLength;
		} else {
			leftLength = middleLength;
		}
	}
	return (leftLength + rightLength) / 2;
}

const graphXScale = d3.scaleLinear([-0.1, 1], [0, CONFIG.graphSVGWidth]);
const graphYScale = d3.scaleLinear([-0.1, 1.1], [CONFIG.graphSVGHeight, 0]);
const graphLine = d3
	.line()
	.x(p => graphXScale(p[0]))
	.y(p => graphYScale(p[1]))
	.curve(d3.curveNatural);
const defs = graph.append("defs");
const arrowheadID = "arrowhead";
defineArrowhead(defs, { id: arrowheadID, length: 18, width: 14, color: "black" });

const graphEnzymeStageLeftPortion = [
	[0.05, 0.7],
	[0.1, 0.7],
	[0.17, 0.6],
	[0.25, 0.8],
	[0.32, 0.5],
];
const graphLigandStageLeftPortion = [
	[0.05, 0.7],
	[0.1, 0.4],
	[0.17, 0],
	[0.25, 0.6],
	[0.32, 0.5],
];
const graphMiddlePortion = [
	[0.4, 0.9],
	[0.5, 0.55],
	[0.6, 0.9],
];
const graphRightPortion = [
	[0.69, 0.7],
	[0.75, 0.65],
	[0.82, 0.8],
	[0.89, 0.7],
	[0.95, 0.7],
	[0.99, 0.8],
];

function getEnergyCurvePoints(stage) {
	if (stage === STAGES.ligand) {
		return [
			...graphLigandStageLeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];
	} else {
		const points = [
			...graphEnzymeStageLeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];

		if (stage === STAGES.initial) {
			return points.map(([x, _]) => [x, initialEnergy]);
		}

		return points;
	}
}

function getEnergyCurveData(stage) {
	return [
		{
			shape: "path",
			class: "energy-curve",
			attrs: {
				d: graphLine(getEnergyCurvePoints(stage)),
				stroke: "black",
				"stroke-width": 2,
				"fill-opacity": 0,
			},
		},
	];
}

function getGraphDipeptides() {
	return basicDipeptideChainInfo.map(bd => {
		const data = makeDipeptideChain(
			{
				x: graphXScale(bd.graphX),
				y: graphYScale(bd.graphY),
			},
			bd.angles,
			bd.colors,
		);
		for (const datum of data) {
			datum.class = "graph-dipeptide";
		}
		return data;
	});
}
const angledGraphDipeptides = getGraphDipeptides();
const horizontalGraphDipeptides = angledGraphDipeptides.map(([dp1, dp2]) => {
	const angle = dp2.angle > Math.PI ? 0 : Math.PI; // All horizontal, oriented one way or the other
	const { cx: cx1, cy: cy1 } = dp1.attrs;
	const dp3 = {
		...dp2,
		angle,
		attrs: {
			...dp2.attrs,
			cx: cx1 + 2 * CONFIG.dipeptideRadius * Math.cos(angle),
			cy: cy1,
		},
	};
	return [dp1, dp3];
});

const graphDataCache = {};
function getGraphData(stage) {
	if (stage in graphDataCache) {
		return graphDataCache[stage];
	}

	let chains;
	if (stage === STAGES.initial) {
		chains = horizontalGraphDipeptides;
	} else if (stage === STAGES.enzyme) {
		const finalEnergyCurvePathString = graphLine(getEnergyCurvePoints(stage));
		const indices = stageJoinIndices[stage];
		const xLocs = [0.15, 0.29, 0.765, 0.45, 0.32, 0.5];
		const tempFinalPath = graph
			.append("path")
			.style("opacity", 0)
			.attr("d", finalEnergyCurvePathString);
		const tempFinalPathNode = tempFinalPath.node();
		const tempFinalPathEndpoints = xLocs.map(xLoc =>
			tempFinalPathNode.getPointAtLength(
				getLengthAtX(tempFinalPathNode, graphXScale(xLoc)),
			),
		);
		chains = indices.map((idxs, j) =>
			indicesToDipeptideChain({
				indices: idxs,
				newP0: {
					x: tempFinalPathEndpoints[j].x,
					y: tempFinalPathEndpoints[j].y - 20,
				},
				dipeptides: angledGraphDipeptides,
				drawEncirclingLine: false,
				opaqueEncirclingLineBg: false,
			}),
		);
		for (const chain of chains) {
			for (const elem of chain) {
				elem.class = "graph-dipeptide";
			}
		}

		tempFinalPath.remove();
	} else {
		const xLocs = [0.15, 0.155, 0.14].map(graphXScale);
		const yLocs = [0.12, 0.52, 0.21].map(graphYScale);
		const indices = stageJoinIndices[stage];
		console.log(indices);
		chains = indices.map((idxs, j) =>
			indicesToDipeptideChain({
				indices: idxs,
				newP0: {
					x: xLocs[j],
					y: yLocs[j],
				},
				dipeptides: angledGraphDipeptides,
				drawEncirclingLine: true,
				opaqueEncirclingLineBg: false,
			}),
		);
		for (const chain of chains) {
			for (const elem of chain) {
				elem.class = "graph-dipeptide";
			}
		}
	}

	chains = chains.flat(Infinity);
	graphDataCache[stage] = chains;
	return chains;
}

const equationDipeptides = [
	[{ color: COLORS.blue }, { color: COLORS.green }, { color: COLORS.purple }],
	[{ color: COLORS.purple }, { color: COLORS.green }],
	[{ color: COLORS.blue }],
	[{ color: COLORS.green }, { color: COLORS.blue }],
	[{ color: COLORS.green }, { color: COLORS.purple }, { color: COLORS.blue }],
];

const indexToCxScale = d3.scaleLinear([-2, 2], [200, 700]);
// -2 <= index <= 2
// We draw the chain from the bottom left corner up to the top right corner
function getEquationDipeptideData(index, drawEncirclingLine = false) {
	const r = CONFIG.dipeptideRadius;

	const sign = index < 0 ? -1 : 1;
	const indexMag = Math.abs(index);
	const chainCx = indexToCxScale(index);
	const chainCy = CONFIG.equationSVGHeight / 2;

	// Compute center x and y of very first circle in the chain (lower left corner)
	const cx0 = chainCx + sign * (indexMag + 1) * r - r;
	const cy0 = chainCy + (verticalDistanceBetweenDipeptides / 2 + r) * indexMag;

	const circles = [];
	const connectingLines = [];

	const preconfiguredDipeptides = equationDipeptides[index + 2];
	// Walk the chain up and to the right
	const dipeptidePoints = [];
	for (let i = 0; i <= indexMag; ++i) {
		const cx1 = cx0 - sign * i * 2 * r;
		const cx2 = cx1 - sign * 2 * r;
		const cy1 = cy0 - i * (2 * r + verticalDistanceBetweenDipeptides);

		const peptideColor = preconfiguredDipeptides[i].color;
		const fill1 = index < 0 ? peptideColor : COLORS.orange;
		const fill2 = index < 0 ? COLORS.orange : peptideColor;
		circles.push(
			{
				shape: "circle",
				classes: ["eqn-chain", "peptide"],
				id: `${sign}_${i}_${index}_a`,
				index,
				attrs: {
					cx: cx1,
					cy: cy1,
					fill: fill1,
					r,
				},
			},
			{
				shape: "circle",
				classes: ["eqn-chain", "peptide"],
				id: `${sign}_${i}_${index}_b`,
				index,
				attrs: {
					cx: cx2,
					cy: cy1,
					fill: fill2,
					r,
				},
			},
		);
		dipeptidePoints.push([cx1, cy1], [cx2, cy1]);

		if (i !== indexMag) {
			const cy2 = cy1 - 2 * r - verticalDistanceBetweenDipeptides;
			connectingLines.push({
				shape: "line",
				classes: ["eqn-chain", "connector"],
				id: `${sign}_${i}_${index}_c`,
				index,
				attrs: {
					x1: cx2,
					x2: cx2,
					y1: cy1 - r,
					y2: cy2 + r,
					stroke: "#469",
					"stroke-width": 2,
				},
			});
		}
	}

	const surroundingLines = [];
	const ligandData = [];
	if (indexMag === 2) {
		const line = d3
			.line()
			.x(p => p[0])
			.y(p => p[1]);

		const elData = getEncirclingLineData(dipeptidePoints, line, false);

		for (let i = 0; i < elData.length; ++i) {
			const d = elData[i];

			d.id = `${sign}_${i}_${index}_d`;

			d.classes = d.classes || [];
			d.classes.push("eqn-chain");

			d.styles = d.styles || {};
			d.styles.opacity =
				d.class === "ligand-interior" || drawEncirclingLine ? 1 : 0;
		}
		surroundingLines.push(...elData);
	}

	return [...surroundingLines, ...ligandData, ...connectingLines, ...circles];
}
function getEquationChainData(stage) {
	const indices = d3.range(-2, 2 + 1);
	const chains = indices
		.map(i => getEquationDipeptideData(i, stage === STAGES.ligand))
		.flat(Infinity)
		.sort((a, b) => {
			const shapeToNum = shape =>
				shape === "path" ? 2 : shape === "line" ? 1 : 0;
			const aVal = shapeToNum(a.shape);
			const bVal = shapeToNum(b.shape);
			return bVal - aVal;
		});

	const maxIndex = stage === STAGES.initial ? 0 : 2;

	for (const chain of chains) {
		chain.styles = chain.styles || {};
		if (chain.styles.opacity === undefined) {
			chain.styles.opacity = Math.abs(chain.index) <= maxIndex ? 1 : 0;
		}
	}

	const arrowCenterIndices = indices.slice(0, -1).map(i => i + 0.5);
	const arrows = arrowCenterIndices.map(i => ({
		shape: "use",
		classes: ["eqn-chain", "eqn-arrow"],
		id: `arrow-${i.toFixed(3)}`,
		attrs: {
			"xlink:href": "#symbol-eqn-arrow",
			transform: `translate(${
				indexToCxScale(i) - CONFIG.symbolSize / 2 - CONFIG.dipeptideRadius
			}, ${CONFIG.equationSVGHeight / 2 - CONFIG.symbolSize / 2})`,
		},
		styles: {
			opacity: Math.abs(i) <= maxIndex ? 1 : 0,
		},
	}));

	return [...chains, ...arrows];
}

const N_PRECOMPUTED_PATH_POINTS = 3000;
// Adapted https://stackoverflow.com/a/52291755
// Compute an array arr of path [x,y] pairs such that arr[i] === pathNode.getPointAtLength(i/(N_PRECOMPUTED_PATH_POINTS-1) * pathNode.getTotalLength())
function precomputeAndCachePathPoints(pathNode, nPoints) {
	const points = {};
	for (const stage of [STAGES.initial, STAGES.enzyme, STAGES.ligand]) {
		pathNode.setAttribute("d", graphLine(getEnergyCurvePoints(stage)));

		const step = pathNode.getTotalLength() / (nPoints - 1);
		points[stage] = [];
		for (let i = 0; i < nPoints; ++i) {
			const length = i * step;
			const { x, y } = pathNode.getPointAtLength(length);
			points[stage].push([x, y]);
		}
	}
	pathNode.__cachedPoints = points;
}

const buttons = {
	addEnzyme: document.getElementById("btn-add-enzyme"),
	addLigand: document.getElementById("btn-add-ligand"),
	energyWell: document.getElementById("btn-energy-well"),
	reset: document.getElementById("btn-reset"),
};
function initialize() {
	// Disable buttons
	buttons.addEnzyme.disabled = false;
	buttons.addLigand.disabled = true;
	buttons.reset.disabled = true;
	buttons.energyWell.disabled = true;

	const { background, foreground } = getBeakerOutlineData();

	applyGraphicalObjs(beaker, background);
	applyGraphicalObjs(beaker, getBeakerData(0), { key: d => d.id });
	applyGraphicalObjs(beaker, foreground);

	// Graph axes
	applyGraphicalObjs(graph, [
		{
			shape: "line",
			class: "y-axis",
			attrs: {
				x1: graphXScale(0),
				x2: graphXScale(0),
				y1: graphYScale(-0.1),
				y2: graphYScale(1.05),
				stroke: "black",
				"stroke-width": 3,
				"marker-end": `url(#${arrowheadID})`,
			},
		},
		{
			shape: "text",
			class: "y-axis-label",
			text: "Energy",
			attrs: {
				fill: "black",
				transform: `
				translate(${graphXScale(0) - 10} ${graphYScale(0.5)})
				rotate(-90)
				`,
				"font-size": 20,
				"text-anchor": "middle",
				"dominant-baseline": "bottom",
			},
		},
	]);
	// Initial energy curve
	const energyCurve = applyGraphicalObjs(graph, getEnergyCurveData(0));
	precomputeAndCachePathPoints(energyCurve.node(), N_PRECOMPUTED_PATH_POINTS);
	energyCurve.attr("d", graphLine(getEnergyCurvePoints(0)));

	// Initial dipeptides on the graph
	applyGraphicalObjs(graph, horizontalGraphDipeptides.flat(Infinity));

	applyGraphicalObjs(equation, getEquationChainData(STAGES.initial));
}

const dipeptideSelector = "circle.chemical-obj";
const ligandSelector = "path.chemical-obj";

function fadeligands(svg, fadeDuration, fadeDelay) {
	if (fadeDelay === undefined) {
		fadeDelay = 0;
	}
	svg.selectAll(`${ligandSelector}.ligand-exterior`)
		.transition()
		.delay(fadeDelay)
		.duration(fadeDuration)
		.style("opacity", 0)
		.end()
		.then(() => {
			svg.selectAll(ligandSelector)
				.transition()
				.duration(100)
				.attr("stroke-width", 0)
				.remove();
		});
}

const substanceDropDuration = 800;
function dropSubstanceIntoBeaker(stage) {
	if (stage === STAGES.initial) {
		return;
	}
	const symbol = stage === STAGES.enzyme ? "#symbol-enzyme" : "#symbol-ligand";
	const ty = stage === STAGES.enzyme ? -50 : -75;
	const symbols = beaker
		.selectAll("use")
		.data([
			{ x: 0.2, delay: stage === STAGES.enzyme ? 200 : 450 },
			{ x: 0.4, delay: 0 },
			{ x: 0.65, delay: stage === STAGES.enzyme ? 400 : 150 },
		])
		.join(enter => enter.insert("use", ".beaker-lid-front"))
		.attr("xlink:href", symbol)
		.attr("transform", d => `translate(${beakerXScale(d.x)} ${ty})`)
		.style("opacity", 1);

	symbols
		.transition()
		.ease(d3.easeCubicIn)
		.duration(substanceDropDuration)
		.delay(d => d.delay)
		.attr(
			"transform",
			d =>
				`translate(${beakerXScale(d.x)} ${beakerYScale(
					CONFIG.fluidHeight + 0.1,
				)})`,
		)
		.transition()
		.ease(d3.easeCubicOut)
		.duration(1200)
		.attr(
			"transform",
			d =>
				`translate(${beakerXScale(d.x)} ${beakerYScale(
					CONFIG.fluidHeight - 0.1,
				)})`,
		)
		.style("opacity", 0)
		.remove();
}

const energyCurveChangeDelay = 200;
const energyCurveChangeDuration = 1000;
const dipeptideResetDuration = 700;
const dipeptideMovementDuration = 1500;
const dipeptideMovementDelayIfNotResetting = 550 + substanceDropDuration;
const ligandAppearDuration = 700;
const ligandExteriorAppearPreappearTime = 300;
const ligandFadeDuration = 200;
const defaultEnergyWellFadeDuration = 700;
const graphRecedeDuration = 500;
function applyDataToSvg(svg, { stage, data, tweens, thens }) {
	const {
		[dipeptideSelector]: dipeptideData,
		[ligandSelector]: ligandData,
	} = groupBy(
		data,
		d => `${d.shape}.chemical-obj`,
		[dipeptideSelector, ligandSelector],
		false,
	);

	const energyWellFadeDuration =
		stage === STAGES.initial && prevStage === STAGES.energyWell
			? defaultEnergyWellFadeDuration
			: 0;
	const dipeptideMovementDelay =
		stage === STAGES.initial && prevStage === STAGES.energyWell
			? energyWellFadeDuration
			: dipeptideMovementDelayIfNotResetting;
	const dipeptideResetDelay = energyWellFadeDuration + ligandFadeDuration;
	const dipeptideMovementTransition = d3
		.transition()
		.delay(dipeptideMovementDelay)
		.duration(dipeptideMovementDuration);

	let totalTransitionDuration;

	// Animate the dipeptides moving
	if (stage === STAGES.initial) {
		fadeligands(svg, ligandFadeDuration, energyWellFadeDuration);
		applyGraphicalObjs(svg, dipeptideData, {
			selector: dipeptideSelector,
			key: d => d.id,
			transition: d3
				.transition("dipeptideReset")
				.delay(dipeptideResetDelay)
				.duration(dipeptideResetDuration),
		});
		totalTransitionDuration =
			(prevStage === STAGES.energyWell ? energyWellFadeDuration : 0) +
			energyCurveChangeDelay +
			energyCurveChangeDuration;
	} else if (stage === STAGES.enzyme) {
		applyGraphicalObjs(svg, dipeptideData, {
			selector: dipeptideSelector,
			key: d => d.id,
			transition: d3.transition(dipeptideMovementTransition),
		});
		// Only for testing; in the actual demo ligands don't appear at this stage
		applyGraphicalObjs(svg, ligandData, {
			selector: ligandSelector,
			transition: d3.transition().duration(ligandAppearDuration),
		});
		totalTransitionDuration = dipeptideMovementDelay + dipeptideMovementDuration;
	} else if (stage === STAGES.ligand) {
		applyGraphicalObjs(svg, dipeptideData, {
			selector: dipeptideSelector,
			key: d => d.id,
			transition: d3.transition(dipeptideMovementTransition),
		});

		applyGraphicalObjs(svg, ligandData, {
			selector: ligandSelector,
			transition: d3
				.transition()
				.delay(dipeptideMovementDelay + dipeptideMovementDuration * 0.6)
				.duration(ligandAppearDuration),
		});

		svg.selectAll(`${ligandSelector}.ligand-exterior`).style("opacity", 0);
		svg.selectAll(`${ligandSelector}.ligand-interior`).style("opacity", 1);
		svg.selectAll(`${ligandSelector}.ligand-exterior`)
			.transition("exterior")
			.delay(
				dipeptideMovementDelay +
					dipeptideMovementDuration -
					ligandExteriorAppearPreappearTime,
			)
			.duration(ligandAppearDuration)
			.style("opacity", 1);

		const firstDipeptide = svg.selectAll(dipeptideSelector).node();
		const fragment = document.createDocumentFragment();
		svg.selectAll(ligandSelector).each(function () {
			fragment.appendChild(this);
		});
		firstDipeptide.parentNode.insertBefore(fragment, firstDipeptide);

		totalTransitionDuration =
			dipeptideMovementDelay +
			dipeptideMovementDuration * 0.6 +
			ligandAppearDuration;
	} else {
		throw new Error(`Invalid stage ${stage}`);
	}

	if (tweens !== undefined) {
		for (const [name, tween] of Object.entries(tweens)) {
			const t = svg
				.selectAll(dipeptideSelector)
				.transition(name)
				.delay(
					stage === STAGES.initial
						? dipeptideResetDelay
						: dipeptideMovementDelay,
				)
				.duration(
					stage === STAGES.initial
						? dipeptideResetDuration
						: dipeptideMovementDuration,
				)
				.tween(name, tween);

			if (thens !== undefined && thens[name] !== undefined) {
				t.end()
					.then(thens[name])
					.catch(() => {});
			}
		}
	}

	return totalTransitionDuration - 100;
}

const energyWellGraph = d3
	.select("#energy-well-plot")
	.style("display", "none")
	.style("opacity", 0);
const bottomGraphContainer = d3
	.select("#bottom-graph-container")
	.style("transform", "translate(0 0)");

// eslint-disable-next-line no-unused-vars
function update(stage) {
	for (const button of Object.values(buttons)) {
		button.disabled = true;
	}

	if (stage === STAGES.energyWell) {
		const wellCenterX = graphXScale(0.16);
		const wellCenterY = graphYScale(0);
		const wellEllipseRx = 60;
		const wellEllipseRy = 10;
		const wellEllipseCy = wellCenterY - 40;
		const arcSweepDuration = 2000;
		const ellipseCircumference = 255; // Trial and error
		const halfCircumference = ellipseCircumference / 2;
		const sweepColor = "#579";
		graph
			.append("path")
			.classed("well-circle", true)
			.attr(
				"d",
				`
				M ${wellCenterX - wellEllipseRx} ${wellEllipseCy}
				a ${wellEllipseRx} ${wellEllipseRy} 0 0 0 ${2 * wellEllipseRx} 0
			`,
			)
			.attr("stroke-dasharray", halfCircumference)
			.attr("stroke-dashoffset", halfCircumference)
			.attr("stroke", sweepColor)
			.attr("stroke-width", 2)
			.attr("fill-opacity", 0)
			.transition()
			.duration(arcSweepDuration / 2)
			.ease(d3.easeCubicIn)
			.attr("stroke-dashoffset", 0);
		graph
			.insert("path", ".energy-curve")
			.classed("well-circle", true)
			.attr(
				"d",
				`
				M ${wellCenterX + wellEllipseRx} ${wellEllipseCy}
				a ${wellEllipseRx} ${wellEllipseRy} 0 1 0 ${-2 * wellEllipseRx} 0
			`,
			)
			.attr("stroke-dasharray", halfCircumference)
			.attr("stroke-dashoffset", halfCircumference)
			.attr("stroke", sweepColor)
			.attr("stroke-width", 2)
			.attr("fill-opacity", 0)
			.transition()
			.delay(arcSweepDuration / 2)
			.duration(arcSweepDuration / 2)
			.ease(d3.easeCubicOut)
			.attr("stroke-dashoffset", 0);
		energyWellGraph
			.style("display", "initial")
			.transition()
			.delay(arcSweepDuration)
			.duration(defaultEnergyWellFadeDuration)
			.style("opacity", 1);
		bottomGraphContainer
			.transition()
			.delay(arcSweepDuration)
			.duration(graphRecedeDuration)
			.style("transform", "translate(-200px,0px)");

		setTimeout(() => {
			buttons.reset.disabled = false;
		}, arcSweepDuration + defaultEnergyWellFadeDuration);

		prevStage = stage;
		return;
	} else if (stage === STAGES.initial) {
		graph
			.selectAll(".well-circle")
			.transition()
			.delay(prevStage === STAGES.energyWell ? defaultEnergyWellFadeDuration : 0)
			.duration(graphRecedeDuration)
			.style("opacity", 0)
			.remove();
		bottomGraphContainer
			.transition()
			.duration(defaultEnergyWellFadeDuration)
			.style("transform", null);
		energyWellGraph
			.transition()
			.duration(300)
			.style("opacity", 0)
			.transition()
			.style("display", "none");
	}

	dropSubstanceIntoBeaker(stage);

	applyDataToSvg(beaker, { stage, data: getBeakerData(stage) });

	// Animate the energy curve itself
	const energyCurve = graph.selectAll(".energy-curve");
	const energyCurveNode = energyCurve.node();

	const finalEnergyCurvePathString = graphLine(getEnergyCurvePoints(stage));

	const energyCurveDelay =
		stage === STAGES.initial
			? prevStage === STAGES.energyWell
				? defaultEnergyWellFadeDuration + energyCurveChangeDelay
				: energyCurveChangeDelay
			: substanceDropDuration;
	const energyCurveDuration =
		stage === STAGES.initial ? dipeptideResetDuration : energyCurveChangeDuration;

	energyCurve
		.transition()
		.delay(energyCurveDelay)
		.duration(energyCurveDuration)
		.attr("d", finalEnergyCurvePathString);

	const tempFinalPath = graph
		.append("path")
		.classed("temp-path", true)
		.attr("opacity", 0)
		.attr("d", finalEnergyCurvePathString);
	const tempFinalPathNode = tempFinalPath.node();
	const indexScale = d3
		.scaleLinear()
		.domain([0, tempFinalPathNode.getTotalLength()])
		.rangeRound([0, N_PRECOMPUTED_PATH_POINTS - 1]);

	const thisPathPoints = energyCurveNode.__cachedPoints[stage];
	// Animate the dipeptides moving along the energy curve

	// Animate them moving vertically as the curve changes shape
	if (stage === STAGES.enzyme) {
		for (const dipeptide of horizontalGraphDipeptides) {
			const cxs = dipeptide.map(dp => dp.attrs.cx);
			const lengths = cxs.map(cx => getLengthAtX(tempFinalPathNode, cx));
			const pointIndices = lengths.map(l => indexScale(l));
			const cys = pointIndices.map(pi => thisPathPoints[pi][1]);
			const cy = Math.min(...cys) - 20;

			const [dp1, dp2] = dipeptide;
			graph
				.selectAll(".graph-dipeptide")
				.filter(d => d.id === dp1.id || d.id === dp2.id)
				.transition()
				.delay(energyCurveDelay)
				.duration(energyCurveChangeDuration * 0.97)
				.attr("cy", cy);
		}
	}

	const graphData = getGraphData(stage);
	function graphDipeptideTween(d) {
		const { cx: finalCx, cy: finalCy } = d.attrs;
		if (stage === STAGES.initial) {
			const initialLength = getLengthAtX(
				energyCurveNode,
				this.getAttribute("cx"),
			);
			const initialPoint = energyCurveNode.getPointAtLength(initialLength);
			const initialDistAboveCurve = this.getAttribute("cy") - initialPoint.y;

			const finalLength = getLengthAtX(energyCurveNode, finalCx);

			const distAboveCurveScale = d3.scaleLinear(
				[0, 1],
				[
					initialDistAboveCurve,
					graphYScale(energyCurvePadAbove) - graphYScale(0),
				],
			);

			const lengthScale = d3.scaleLinear([0, 1], [initialLength, finalLength]);

			const initialEnergyCurveNodeCopy = energyCurveNode.cloneNode();

			// const yScale = d3.scaleLinear([0, 1], [cy, this.getAttribute("cy")]);
			const y0 = graphYScale(initialEnergy);
			return t => {
				const length = lengthScale(t);
				const { x, y } = initialEnergyCurveNodeCopy.getPointAtLength(length);
				const compressedY = y0 + (y - y0) * (1 - t);
				const distAboveCurve = distAboveCurveScale(t);
				this.setAttribute("cx", x);
				this.setAttribute("cy", compressedY + distAboveCurve);
			};
		} else {
			const initialLength = getLengthAtX(
				tempFinalPathNode,
				this.getAttribute("cx"),
			);
			const initialPoint = tempFinalPathNode.getPointAtLength(initialLength);
			const initialDistAboveCurve = this.getAttribute("cy") - initialPoint.y;

			const finalLength = getLengthAtX(tempFinalPathNode, finalCx);
			const finalPoint = tempFinalPathNode.getPointAtLength(finalLength);
			const finalDistAboveCurve = finalCy - finalPoint.y;

			const distAboveCurveScale = d3.scaleLinear(
				[0, 1],
				[initialDistAboveCurve, finalDistAboveCurve],
			);

			const lengthScale = d3.scaleLinear([0, 1], [initialLength, finalLength]);

			// const yScale = d3.scaleLinear([0, 1], [cy, this.getAttribute("cy")]);
			return t => {
				// const length = lengthScale(t);
				// const point = tempFinalPathNode.getPointAtLength(length);
				// const curveY = point.y;
				// const distAboveCurve = distAboveCurveScale(t);
				// return curveY + distAboveCurve;

				const length = lengthScale(t);
				const pointIndex = indexScale(length);
				const [x, y] = thisPathPoints[pointIndex];
				this.setAttribute("cx", x);
				this.setAttribute("cy", y + distAboveCurveScale(t));
			};
		}
	}

	const totalTransitionDuration = applyDataToSvg(graph, {
		stage,
		data: graphData,
		tweens: { "graph-dipeptide-position": graphDipeptideTween },
		thens: {
			"graph-dipeptide-position": () => {
				graph.selectAll(".temp-path").remove();
			},
		},
	});

	setTimeout(() => {
		const nextButton =
			stage === STAGES.initial
				? buttons.addEnzyme
				: stage === STAGES.enzyme
				? buttons.addLigand
				: stage === STAGES.ligand
				? buttons.energyWell
				: stage === STAGES.energyWell
				? buttons.reset
				: null;
		nextButton.disabled = false;
		buttons.reset.disabled = stage === STAGES.initial;
	}, totalTransitionDuration);

	// Do the chemical equation at the bottom
	const eqnData = getEquationChainData(stage);
	equation
		.selectAll(".eqn-chain")
		.data(eqnData)
		.join(
			enter => enter,
			update =>
				update
					.transition()
					.delay(
						stage === STAGES.enzyme || stage === STAGES.ligand
							? dipeptideMovementDelayIfNotResetting +
									dipeptideMovementDuration -
									ligandExteriorAppearPreappearTime
							: prevStage === STAGES.energyWell
							? defaultEnergyWellFadeDuration
							: 0,
					)
					.duration(
						stage === STAGES.initial
							? dipeptideResetDuration
							: ligandAppearDuration,
					)
					.style("opacity", d => d.styles.opacity),
		);

	prevStage = stage;
}

initialize();

function get3DSphereDatum({ cx, cy, cz, color, lighting, peptide }) {
	return {
		type: "mesh3d",
		x: peptide.x.map(x => cx + x),
		y: peptide.y.map(y => cy + y),
		z: peptide.z.map(z => cz + z),
		i: peptide.simplices.map(s => s[0]),
		j: peptide.simplices.map(s => s[1]),
		k: peptide.simplices.map(s => s[2]),
		facecolor: peptide.simplices.map(() => color || COLORS.orange),
		lighting,
	};
}

function plotEnergyWell() {
	const surfaceLighting = {
		ambient: 0.7,
		roughness: 0.8,
		diffuse: 0.8,
		specular: 0.7,
	};
	const sphereLighting = {
		ambient: 0.5,
		roughness: 1,
		diffuse: 0.6,
		specular: 0.5,
	};
	const { well, peptide } = DIPEPTIDE_WELL;
	const data = [
		{
			type: "mesh3d",
			x: well.x,
			y: well.y,
			z: well.z,
			i: well.simplices.map(s => s[0]),
			j: well.simplices.map(s => s[1]),
			k: well.simplices.map(s => s[2]),
			facecolor: well.simplices.map(() => "#234"),
			lighting: surfaceLighting,
		},
		...well.gridlines.map(gridline => ({
			type: "scatter3d",
			mode: "lines",
			x: gridline.map(p => p[0]),
			y: gridline.map(p => p[1]),
			z: gridline.map(p => p[2]),
			line: {
				width: 2,
				color: "#89a",
			},
			lighting: surfaceLighting,
		})),
	];

	const diameter = 1;

	// rest is [dtheta, dphi, color]
	const chainsInfo = [
		{
			initial: { cx: 0, cy: 0, cz: -5.3, color: null },
			rest: [
				[0.2, 0.5, COLORS.blue],
				[0.4, 0.4, null],
				[0.4, 0.1, COLORS.green],
				[0.5, -0.1, null],
				[0.5, -0.3, COLORS.purple],
			],
		},
		{
			initial: { cx: -8, cy: 8, cz: -0.2, color: null },
			rest: [[0.2, 0.3, COLORS.blue]],
		},
		{
			initial: { cx: 0, cy: -8, cz: -2.5, color: null },
			rest: [
				[1.8, 0.1, COLORS.purple],
				[-1, 0.1, null],
				[-0.6, 0.6, COLORS.green],
			],
		},
		{
			initial: { cx: 8, cy: 0, cz: -2.8, color: null },
			rest: [[1.8, 0.5, COLORS.purple]],
		},
	];

	for (const { initial, rest } of chainsInfo) {
		let { cx, cy, cz } = initial;
		data.push(
			get3DSphereDatum({
				cx,
				cy,
				cz,
				color: initial.color,
				lighting: sphereLighting,
				peptide,
			}),
		);

		let theta = 0,
			phi = 0;
		for (const [dTheta, dPhi, color] of rest) {
			theta += dTheta;
			phi += dPhi;
			cx += diameter * Math.cos(theta) * Math.cos(phi);
			cy += diameter * Math.sin(theta) * Math.cos(phi);
			cz += diameter * Math.sin(phi);
			data.push(
				get3DSphereDatum({
					cx,
					cy,
					cz,
					color,
					lighting: sphereLighting,
					peptide,
				}),
			);
		}
	}

	const axesAttrs = {
		showgrid: false,
		visible: false,
		showspikes: false,
	};

	const layout = {
		margin: { t: 0, b: 0, l: 0, r: 0 },
		hovermode: false,
		showlegend: false,
		scene: {
			aspectmode: "data",
			xaxis: axesAttrs,
			yaxis: axesAttrs,
			zaxis: axesAttrs,
			camera: {
				up: { x: 0, y: 0, z: 1 },
				center: { x: 0, y: 0, z: 0 },
				eye: {
					x: -0.48577809539281663,
					y: -1.450278208976746,
					z: 1.631169138564033,
				},
				projection: { type: "perspective" },
			},
		},
	};

	const config = { displayModeBar: false, scrollZoom: false };

	Plotly.react("energy-well-plot", data, layout, config);
}

plotEnergyWell();
