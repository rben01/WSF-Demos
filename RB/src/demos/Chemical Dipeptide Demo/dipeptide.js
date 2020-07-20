/* global applyGraphicalObjs applyDatum defineArrowhead groupBy */

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

	const starXScale = d3.scaleLinear([-1, 1], [pad, size - pad]);
	const starYScale = d3.scaleLinear([-1, 1], [size - pad, pad]);
	const starOuterRadius = 0.9;
	const starInnerRadius = 0.5;
	const starPoints = d3.range(10).map(i => {
		const r = i % 2 === 0 ? starOuterRadius : starInnerRadius;
		const angle = (2 * Math.PI * i) / 10;
		// Looks backwards, but it's correct; we want the star to start at (0,1) and be traced out clockwise
		return [starXScale(r * Math.sin(angle)), starYScale(r * Math.cos(angle))];
	});
	beaker
		.append("symbol")
		.attr("id", "symbol-ligand")
		.append("path")
		.attr(
			"d",
			`M ${starXScale(0)} ${starYScale(starOuterRadius)}
			${starPoints.map(([x, y]) => `L ${x} ${y}`).join(" ")}
				Z`,
		)
		.attr("fill", "#fc3")
		.attr("stroke-opacity", 0);
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
	const ellipseWidth = beakerXScale(0.8) - beakerXScale(0);
	const ellipseHeight = beakerYScale(0.15) - beakerYScale(0);
	const leftX = beakerXScale(0.1);
	const rightX = beakerXScale(0.9);
	const topLeftY = beakerYScale(0.9);
	const midLeftY = beakerYScale(CONFIG.fluidHeight);
	const botLeftY = beakerYScale(0.1);
	const beakerColor = "#047";
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
		data.push(
			{
				shape: "path",
				class: "ligand-exterior",
				attrs: {
					d: beakerLine(centerPoints),
					"stroke-width": r * 2 + 9,
					stroke: "black",
					"fill-opacity": 0,
					"stroke-linecap": "round",
					"stroke-linejoin": "round",
				},
			},
			{
				shape: "path",
				class: "ligand-interior",
				attrs: {
					d: beakerLine(centerPoints),
					"stroke-width": r * 2 + 7,
					stroke: opaqueEncirclingLineBg ? CONFIG.fluidColor : "white",
					"fill-opacity": 0,
					"stroke-linecap": "round",
					"stroke-linejoin": "round",
				},
			},
		);
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

const basicDipeptideChainInfo = [
	{
		x: beakerXScale(0.2),
		y: beakerYScale(0.3),
		angles: [0.3],
		colors: [COLORS.blue, null],
		graphX: 0.515,
		graphY: 0.655,
	},
	{
		x: beakerXScale(0.4),
		y: beakerYScale(0.58),
		angles: [Math.PI / 8],
		colors: [COLORS.purple, null],
		graphX: 0.52,
		graphY: 0.73,
	},
	{
		x: beakerXScale(0.71),
		y: beakerYScale(0.2),
		angles: [Math.PI / 2.3],
		colors: [COLORS.green, null],
		graphX: 0.493,
		graphY: 0.63,
	},
	{
		x: beakerXScale(0.6),
		y: beakerYScale(0.4),
		angles: [Math.PI / 0.9],
		colors: [COLORS.blue, null],
		graphX: 0.52,
		graphY: 0.87,
	},
	{
		x: beakerXScale(0.42),
		y: beakerYScale(0.2),
		angles: [Math.PI * (1 + 1 / 1.1)],
		colors: [COLORS.purple, null],
		graphX: 0.48,
		graphY: 0.8,
	},
	{
		x: beakerXScale(0.8),
		y: beakerYScale(0.4),
		angles: [Math.PI / 1.5],
		colors: [COLORS.blue, null],
		graphX: 0.475,
		graphY: 0.68,
	},
	{
		x: beakerXScale(0.38),
		y: beakerYScale(0.43),
		angles: [Math.PI / 1.1],
		colors: [COLORS.green, null],
		graphX: 0.48,
		graphY: 0.9,
	},
	{
		x: beakerXScale(0.5),
		y: beakerYScale(0.1),
		angles: [Math.PI * (1 + 1 / 1.1)],
		colors: [COLORS.green, null],
		graphX: 0.54,
		graphY: 0.83,
	},
	{
		x: beakerXScale(0.6),
		y: beakerYScale(0.28),
		angles: [Math.PI / 1.2],
		colors: [COLORS.purple, null],
		graphX: 0.53,
		graphY: 0.93,
	},
	{
		x: beakerXScale(0.7),
		y: beakerYScale(0.52),
		angles: [Math.PI / 1.4],
		colors: [COLORS.green, null],
		graphX: 0.45,
		graphY: 0.85,
	},
	{
		x: beakerXScale(0.3),
		y: beakerYScale(0.1),
		angles: [0.4],
		colors: [COLORS.blue, null],
		graphX: 0.56,
		graphY: 0.9,
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

const enzymeStageJoinIndices = [
	[0, 7],
	[1, 8],
	[3, 2],
	[4, 5, 6],
	...d3.range(9, basicDipeptides.length).map(i => [i]),
];

const ligandStageJoinIndices = [
	[0, 7, 9, 2],
	[4, 5, 1, 10],
	[8, 6, 3, ...d3.range(11, basicDipeptides.length)],
];

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
		return enzymeStageJoinIndices
			.map(indices =>
				indicesToDipeptideChain({ indices, dipeptides: basicDipeptides }),
			)
			.flat(Infinity);
	} else if (stage === STAGES.ligand) {
		const newP0s = [
			null,
			{ x: beakerXScale(0.4), y: beakerYScale(0.2) },
			{ x: beakerXScale(0.8), y: beakerYScale(0.4) },
		];
		return ligandStageJoinIndices
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
	let points;
	if (stage === STAGES.enzyme) {
		points = [
			...graphEnzymeStageLeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];
	} else {
		points = [
			...graphLigandStageLeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];
	}

	return points;
}

const DASHARRAY_INITIAL_GAP_FROM_2 = 551;
const DASHARRAY_MIDDLE_WIDTH = 233.764;
const DASHARRAY_LENGTH_DIFF = 159.5;
function getEnergyCurveDasharray(stage) {
	if (stage === STAGES.initial) {
		return `0 ${DASHARRAY_INITIAL_GAP_FROM_2} ${DASHARRAY_MIDDLE_WIDTH} 100000`;
	}
	return null;
}

// stage corresponds to container; it's 0, 1, or 2
function getEnergyCurveData(stage) {
	return [
		{
			shape: "path",
			class: "energy-curve",
			attrs: {
				d: graphLine(getEnergyCurvePoints(stage)),
				"stroke-dasharray": getEnergyCurveDasharray(stage),
				stroke: "black",
				"stroke-width": 2,
				"fill-opacity": 0,
			},
		},
	];
}

const graphDipeptides = basicDipeptideChainInfo.map(bd => {
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

function getGraphData(stage) {
	if (stage === STAGES.initial) {
		return graphDipeptides.flat(Infinity);
	} else {
		const finalEnergyCurvePathString = graphLine(getEnergyCurvePoints(stage));
		const indices =
			stage === STAGES.enzyme ? enzymeStageJoinIndices : ligandStageJoinIndices;
		const xLocs =
			stage === STAGES.enzyme
				? [0.15, 0.29, 0.765, 0.45, 0.32, 0.5]
				: [0.15, 0.47, 0.32];
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
		const chains = indices.map((idxs, j) =>
			indicesToDipeptideChain({
				indices: idxs,
				newP0: {
					x: tempFinalPathEndpoints[j].x,
					y: tempFinalPathEndpoints[j].y - 20,
				},
				dipeptides: graphDipeptides,
				drawEncirclingLine: stage === 2,
				opaqueEncirclingLineBg: false,
			}),
		);
		for (const chain of chains) {
			for (const elem of chain) {
				elem.class = "graph-dipeptide";
			}
		}

		tempFinalPath.remove();

		return chains.flat(Infinity);
	}
}

const equationXScale = d3.scaleLinear([0, 1], [0, CONFIG.equationSVGWidth]);
const equationYScale = d3.scaleLinear([0, 1], [CONFIG.equationSVGHeight, 0]);
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
function getEquationDipeptideData(index) {
	const verticalDistanceBetweenDipeptides = 10;
	const r = CONFIG.dipeptideRadius;

	const sign = index < 0 ? -1 : 1;
	const indexMag = Math.abs(index);
	const chainCx = indexToCxScale(index);
	const chainCy = CONFIG.equationSVGHeight / 2;

	// Compute center x and y of very first circle in the chain (lower left corner)
	const cx0 = chainCx + sign * (indexMag + 1) * r - r;
	const cy0 = chainCy + ((verticalDistanceBetweenDipeptides + r) * indexMag) / 2;

	const circles = [];
	const connectingLines = [];

	const preconfiguredDipeptides = equationDipeptides[index + 2];
	// Walk the chain up and to the right
	for (let i = 0; i <= indexMag; ++i) {
		const cx1 = cx0 - sign * i * 2 * r;
		const cx2 = cx1 - sign * 2 * r;
		const cy1 = cy0 - i * (2 * r + verticalDistanceBetweenDipeptides);
		circles.push(
			{
				shape: "circle",
				classes: ["eqn-chain", "peptide"],
				id: `${sign}_${i}_${index}_a`,
				index,
				attrs: {
					cx: cx1,
					cy: cy1,
					fill: preconfiguredDipeptides[i].color,
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
					fill: COLORS.orange,
					r,
				},
			},
		);
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

	return [...connectingLines, ...circles];
}
function getEquationChainData(stage) {
	const indices = d3.range(-2, 2 + 1); // [-k, -k+1, ..., 0, ..., k-1, k]
	const chains = indices
		.map(getEquationDipeptideData)
		.flat(Infinity)
		.sort((a, b) => {
			const aVal = a.shape === "line" ? 1 : 0;
			const bVal = b.shape === "line" ? 1 : 0;
			return bVal - aVal;
		});

	const maxIndex = stage === STAGES.initial ? 0 : 2;

	for (const chain of chains) {
		chain.styles = chain.styles || {};
		chain.styles.opacity = Math.abs(chain.index) <= maxIndex ? 1 : 0;
	}

	const arrowCenterIndices = indices.slice(0, -1).map(i => i + 0.5);
	const arrows = arrowCenterIndices.map(i => ({
		shape: "use",
		classes: ["eqn-chain", "eqn-arrow"],
		id: `arrow-${i.toFixed(3)}`,
		attrs: {
			"xlink:href": "#symbol-eqn-arrow",
			transform: `translate(${indexToCxScale(i) - CONFIG.symbolSize / 2}, ${
				CONFIG.equationSVGHeight / 2 - CONFIG.symbolSize / 2
			})`,
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
	for (const stage of [STAGES.enzyme, STAGES.ligand]) {
		pathNode.setAttribute("d", graphLine(getEnergyCurvePoints(stage)));

		const step = pathNode.getTotalLength() / (nPoints - 1);
		points[stage] = [];
		for (let i = 0; i < nPoints; ++i) {
			const length = i * step;
			const { x, y } = pathNode.getPointAtLength(length);
			points[stage].push([x, y]);
		}
	}
	points[STAGES.initial] = points[STAGES.ligand];
	pathNode.__cachedPoints = points;
}

const buttons = {
	addEnzyme: document.getElementById("btn-add-enzyme"),
	addLigand: document.getElementById("btn-add-ligand"),
	reset: document.getElementById("btn-reset"),
};
function initialize() {
	// Disable buttons
	buttons.addEnzyme.disabled = false;
	buttons.addLigand.disabled = true;
	buttons.reset.disabled = true;

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
	applyGraphicalObjs(graph, graphDipeptides.flat(Infinity));

	applyGraphicalObjs(equation, getEquationChainData(STAGES.initial));
}

const dipeptideSelector = "circle.chemical-obj";
const ligandSelector = "path.chemical-obj";

function fadeligands(svg, fadeDuration) {
	svg.selectAll(`${ligandSelector}.ligand-exterior`)
		.transition()
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
	const symbols = beaker
		.selectAll("use")
		.data([
			{ x: 0.2, delay: stage === STAGES.enzyme ? 200 : 450 },
			{ x: 0.4, delay: 0 },
			{ x: 0.65, delay: stage === STAGES.enzyme ? 400 : 150 },
		])
		.join(enter => enter.insert("use", ".beaker-lid-front"))
		.attr("xlink:href", symbol)
		.attr("transform", d => `translate(${beakerXScale(d.x)} -50)`)
		.attr("fill-opacity", 1);

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
		.attr("fill-opacity", 0)
		.remove();
}

const energyCurveChangeDelay = 200;
const energyCurveChangeDuration = 1000;
const dipeptideMovementDuration = 1500;
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

	const ligandAppearDuration = 700;
	const ligandFadeDuration = 200;

	const dipeptideMovementDelay =
		stage === STAGES.initial ? 0 : 500 + substanceDropDuration;
	const dipeptideResetDuration = 700;
	const dipeptideResetDelay = ligandFadeDuration;
	const dipeptideMovementTransition = d3
		.transition()
		.delay(dipeptideMovementDelay)
		.duration(dipeptideMovementDuration);

	let totalTransitionDuration;

	// Animate the dipeptides moving
	if (stage === STAGES.initial) {
		fadeligands(svg, ligandFadeDuration);
		applyGraphicalObjs(svg, dipeptideData, {
			selector: dipeptideSelector,
			key: d => d.id,
			transition: d3
				.transition("dipeptideReset")
				.delay(dipeptideResetDelay)
				.duration(dipeptideResetDuration),
		});
		totalTransitionDuration =
			dipeptideResetDelay +
			dipeptideResetDuration +
			energyCurveChangeDuration -
			ligandFadeDuration -
			energyCurveChangeDelay;
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
			.delay(dipeptideMovementDelay + dipeptideMovementDuration - 300)
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
				console.log(thens[name]);
				t.end()
					.then(thens[name])
					.catch(() => {});
			}
		}
	}

	return totalTransitionDuration - 100;
}

// eslint-disable-next-line no-unused-vars
function update(stage) {
	for (const button of Object.values(buttons)) {
		button.disabled = true;
	}

	dropSubstanceIntoBeaker(stage);

	applyDataToSvg(beaker, { stage, data: getBeakerData(stage) });

	// Animate the energy curve itself
	const energyCurve = graph.selectAll(".energy-curve");
	const energyCurveNode = energyCurve.node();
	const totalLength = energyCurveNode.getTotalLength();
	const initialMiddlePortionLeftLength = getLengthAtX(
		energyCurveNode,
		graphXScale(graphMiddlePortion[0][0]),
	);
	const initialMiddlePortionRightLength = getLengthAtX(
		energyCurveNode,
		graphXScale(graphMiddlePortion[graphMiddlePortion.length - 1][0]),
	);
	const middlePortionLength =
		initialMiddlePortionRightLength - initialMiddlePortionLeftLength;

	const finalEnergyCurvePathString = graphLine(getEnergyCurvePoints(stage));

	const graphTransition = d3.transition().duration(energyCurveChangeDuration);
	if (stage === STAGES.ligand) {
		energyCurve
			.attr("stroke-dasharray", null)
			.transition(graphTransition)
			.delay(substanceDropDuration)
			.attr("d", finalEnergyCurvePathString);
	} else {
		energyCurveNode.setAttribute("d", finalEnergyCurvePathString);

		const delay =
			stage === STAGES.initial ? energyCurveChangeDelay : substanceDropDuration;

		if (stage === STAGES.enzyme) {
			energyCurveNode.setAttribute(
				"stroke-dasharray",
				`0 ${
					initialMiddlePortionLeftLength - DASHARRAY_LENGTH_DIFF
				} ${middlePortionLength} 10000`,
			);
		}

		energyCurve
			.transition(graphTransition)
			.delay(delay)
			.attrTween("stroke-dasharray", () => {
				const leftScaleRange =
					stage === STAGES.initial
						? [0, initialMiddlePortionLeftLength]
						: [initialMiddlePortionLeftLength - DASHARRAY_LENGTH_DIFF, 0];
				const middleScaleRange =
					stage === STAGES.initial
						? [totalLength, middlePortionLength]
						: [middlePortionLength, totalLength];

				const leftScale = d3.scaleLinear([0, 1], leftScaleRange);
				const middleScale = d3.scaleLinear([0, 1], middleScaleRange);

				return t => `0 ${leftScale(t)} ${middleScale(t)} 10000`;
			});
	}

	// Animate the dipeptides moving along the energy curve
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
			const finalPoint = energyCurveNode.getPointAtLength(finalLength);
			const finalDistAboveCurve = finalCy - finalPoint.y;

			const distAboveCurveScale = d3.scaleLinear(
				[0, 1],
				[initialDistAboveCurve, finalDistAboveCurve],
			);

			const lengthScale = d3.scaleLinear([0, 1], [initialLength, finalLength]);

			const initialEnergyCurveNodeCopy = energyCurveNode.cloneNode();

			// const yScale = d3.scaleLinear([0, 1], [cy, this.getAttribute("cy")]);
			return t => {
				const length = lengthScale(t);
				const { x, y } = initialEnergyCurveNodeCopy.getPointAtLength(length);
				const distAboveCurve = distAboveCurveScale(t);
				this.setAttribute("cx", x);
				this.setAttribute("cy", y + distAboveCurve);
			};
		} else {
			const tempFinalPath = graph
				.append("path")
				.classed("temp-path", true)
				.style("opacity", 0)
				.attr("d", finalEnergyCurvePathString);
			const tempFinalPathNode = tempFinalPath.node();

			const indexScale = d3
				.scaleLinear()
				.domain([0, tempFinalPathNode.getTotalLength()])
				.rangeRound([0, N_PRECOMPUTED_PATH_POINTS - 1]);
			const thisPathPoints = energyCurveNode.__cachedPoints[stage];

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
			cy: () => {
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
				? buttons.reset
				: null;
		nextButton.disabled = false;
	}, totalTransitionDuration);

	// Do the chemical equation at the bottom
	const eqnData = getEquationChainData(stage);
	equation
		.selectAll(".eqn-chain")
		.data(eqnData, d => `${d.shape}.${d.id}`)
		.join(undefined, update =>
			update
				.transition()
				.delay(
					stage === STAGES.enzyme || stage === STAGES.ligand
						? substanceDropDuration + dipeptideMovementDuration
						: 0,
				)
				.duration(500)
				.style("opacity", d => d.styles.opacity),
		);
}

initialize();
