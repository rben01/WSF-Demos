/* global applyGraphicalObjs defineArrowhead groupBy */

const CONFIG = {
	containerSVGWidth: 250,
	containerSVGHeight: 300,
	graphSVGWidth: 800,
	graphSVGHeight: 300,
	dipeptideRadius: 7,
	fluidColor: "#e6f7ff",
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

const beakerXScale = d3.scaleLinear([0, 1], [0, CONFIG.containerSVGWidth]);
const beakerYScale = d3.scaleLinear([0, 1], [CONFIG.containerSVGHeight, 0]);
const beakerLine = d3
	.line()
	.x(p => p[0])
	.y(p => p[1]);

function getBeakerData() {
	const ellipseWidth = beakerXScale(0.8) - beakerXScale(0);
	const ellipseHeight = beakerYScale(0.15) - beakerYScale(0);
	const leftX = beakerXScale(0.1);
	const rightX = beakerXScale(0.9);
	const topLeftY = beakerYScale(0.9);
	const midLeftY = beakerYScale(0.6);
	const botLeftY = beakerYScale(0.1);
	const beakerColor = "#047";
	const fluidColor = CONFIG.fluidColor;
	const strokeWidth = 2;

	function getEllipsePath(leftY, topHalf) {
		const orientation = topHalf ? 1 : 0;
		return `
				M ${leftX} ${leftY}
				a ${ellipseWidth / 2} ${ellipseHeight / 2} 0 0 ${orientation} ${ellipseWidth} 0
				`;
	}

	const beakerOutline = {
		shape: "path",
		class: "beaker-top",
		attrs: {
			d: `
			M ${leftX} ${botLeftY}
			V ${topLeftY}
			M ${rightX} ${botLeftY}
			V ${topLeftY}
			${getEllipsePath(topLeftY, false)}
			${getEllipsePath(topLeftY, true)}
			${getEllipsePath(midLeftY, false)}
			${getEllipsePath(midLeftY, true)}
			${getEllipsePath(botLeftY, false)}
			`,
			stroke: beakerColor,
			"stoke-width": strokeWidth,
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
			"stoke-width": strokeWidth,
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
			"stoke-width": strokeWidth,
			fill: fluidColor,
		},
	};

	return {
		background: [beakerFluid, beakerBackOutline],
		foreground: [beakerOutline],
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
	{ drawEncirclingLine, ids } = { drawEncirclingLine: false },
) {
	const nCircles = colors.length;

	if (ids === undefined) {
		ids = d3.range(nCircles).map(i => i + baseID);
		baseID += nCircles;
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
				class: "enzyme-exterior",
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
				class: "enzyme-interior",
				attrs: {
					d: beakerLine(centerPoints),
					"stroke-width": r * 2 + 7,
					stroke: CONFIG.fluidColor,
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
function joinBasicDipeptides(
	{ newP0, indices, joinAngles, drawEncirclingLine, dipeptides } = {
		drawEncirclingLine: false,
	},
) {
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

	return makeDipeptideChain(newP0, angles, colors, { drawEncirclingLine, ids });
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

const stage1JoinIndices = [
	[0, 7],
	[1, 8],
	[3, 2],
	[4, 5, 6],
	...d3.range(9, basicDipeptides.length).map(i => [i]),
];

const stage2JoinIndices = [
	[0, 7, 9, 2],
	[4, 5, 1, 10],
	[8, 6, 3, ...d3.range(11, basicDipeptides.length)],
];

function indicesToDipeptideChain(
	{ indices, newP0, drawEncirclingLine, dipeptides } = { drawEncirclingLine: false },
) {
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
		dipeptides,
	});
}

function getDepetideData(stage) {
	if (stage === 0) {
		return basicDipeptides.flat(Infinity);
	} else if (stage === 1) {
		return stage1JoinIndices
			.map(indices =>
				indicesToDipeptideChain({ indices, dipeptides: basicDipeptides }),
			)
			.flat(Infinity);
	} else if (stage === 2) {
		const newP0s = [
			null,
			{ x: beakerXScale(0.4), y: beakerYScale(0.2) },
			{ x: beakerXScale(0.8), y: beakerYScale(0.4) },
		];
		return stage2JoinIndices
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

const graph = d3
	.select("#energy-graph")
	.attr("width", CONFIG.graphSVGWidth)
	.attr("height", CONFIG.graphSVGHeight);
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

const graphStage1LeftPortion = [
	[0.05, 0.7],
	[0.1, 0.7],
	[0.17, 0.6],
	[0.25, 0.8],
	[0.32, 0.5],
];
const graphStage2LeftPortion = [
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
	if (stage === 1) {
		points = [
			...graphStage1LeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];
	} else {
		points = [
			...graphStage2LeftPortion,
			...graphMiddlePortion,
			...graphRightPortion,
		];
	}

	return points;
}

const DASHARRAY_INITIAL_GAP_FROM_2 = 552.0046;
const DASHARRAY_MIDDLE_WIDTH = 233.764;
function getEnergyCurveDasharray(stage) {
	if (stage === 0) {
		return `0 ${DASHARRAY_INITIAL_GAP_FROM_2} ${DASHARRAY_MIDDLE_WIDTH} 100000`;
	}
	return null;
}

// stage corresponds to container; it's 0, 1, or 2
function getGraphData(stage) {
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

function initialize() {
	const { background, foreground } = getBeakerData();

	applyGraphicalObjs(beaker, background);
	applyGraphicalObjs(beaker, getDepetideData(0), { key: d => d.id });
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
	applyGraphicalObjs(graph, getGraphData(0));

	// Initial dipeptides on the graph
	applyGraphicalObjs(graph, graphDipeptides.flat(Infinity));
}

// eslint-disable-next-line no-unused-vars
function update(stage) {
	const allData = getDepetideData(stage);
	const shapes = groupBy(
		allData,
		d => `${d.shape}.chemical-obj`,
		["circle", "path"].map(shape => `${shape}.chemical-obj`),
		false,
	);

	const circleSelector = "circle.chemical-obj";
	const pathSelector = "path.chemical-obj";

	const circleData = shapes[circleSelector];
	const pathData = shapes[pathSelector];

	const enzymeExteriorTransition = d3.transition().duration(700);

	const dipeptideMovementDelay = stage === 0 ? 0 : 500;
	const dipeptideMovementDuration = 1500;
	const dipeptideResetDuration = 700;
	const dipeptideTransition = d3
		.transition()
		.delay(dipeptideMovementDelay)
		.duration(dipeptideMovementDuration);

	// Animate the dipeptides moving around in the beaker
	if (stage === 0) {
		const enzymeFadeDuration = 200;
		beaker
			.selectAll(`${pathSelector}.enzyme-exterior`)
			.transition()
			.duration(enzymeFadeDuration)
			.style("opacity", 0)
			.end()
			.then(() => {
				beaker
					.selectAll(pathSelector)
					.transition()
					.duration(100)
					.attr("stroke-width", 0)
					.remove();
			});
		applyGraphicalObjs(beaker, circleData, {
			selector: circleSelector,
			key: d => d.id,
			transition: d3
				.transition("x")
				.delay(enzymeFadeDuration + dipeptideMovementDelay)
				.duration(dipeptideResetDuration),
		});
	} else if (stage === 1) {
		applyGraphicalObjs(beaker, circleData, {
			selector: circleSelector,
			key: d => d.id,
			transition: d3.transition(dipeptideTransition),
		});
		applyGraphicalObjs(beaker, pathData, {
			selector: pathSelector,
			transition: d3.transition(enzymeExteriorTransition),
		});
	} else if (stage === 2) {
		applyGraphicalObjs(beaker, circleData, {
			selector: circleSelector,
			key: d => d.id,
			transition: d3.transition(dipeptideTransition),
		});

		applyGraphicalObjs(beaker, pathData, {
			selector: pathSelector,
			transition: d3
				.transition(enzymeExteriorTransition)
				.delay(dipeptideMovementDelay + dipeptideMovementDuration / 3),
		});

		beaker.selectAll(`${pathSelector}.enzyme-exterior`).style("opacity", 0);
		beaker.selectAll(`${pathSelector}.enzyme-interior`).style("opacity", 1);
		beaker
			.selectAll(`${pathSelector}.enzyme-exterior`)
			.transition(enzymeExteriorTransition)
			.transition(enzymeExteriorTransition)
			.style("opacity", 1);

		const firstDipeptide = beaker.selectAll(circleSelector).node();
		const fragment = document.createDocumentFragment();
		beaker.selectAll(pathSelector).each(function () {
			fragment.appendChild(this);
		});
		firstDipeptide.parentNode.insertBefore(fragment, firstDipeptide);
	}

	// Animate the energy curve itself
	const energyCurve = graph.selectAll(".energy-curve");
	const initialEnergyCurveNode = energyCurve.node();
	const totalLenth = initialEnergyCurveNode.getTotalLength();
	const initialMiddlePortionLeftLength = getLengthAtX(
		initialEnergyCurveNode,
		graphXScale(graphMiddlePortion[0][0]),
	);
	const initialMiddlePortionRightLength = getLengthAtX(
		initialEnergyCurveNode,
		graphXScale(graphMiddlePortion[graphMiddlePortion.length - 1][0]),
	);
	const middlePortionLength =
		initialMiddlePortionRightLength - initialMiddlePortionLeftLength;

	const graphTransition = d3.transition().duration(1000);
	const finalEnergyCurvePathString = graphLine(getEnergyCurvePoints(stage));
	if (stage === 2) {
		energyCurve
			.attr("stroke-dasharray", null)
			.transition(graphTransition)
			.attr("d", finalEnergyCurvePathString);
	} else {
		const delay = stage === 0 ? 200 : 0;
		if (stage === 1) {
			energyCurve.attr(
				"stroke-dasharray",
				`0 ${initialMiddlePortionLeftLength} ${middlePortionLength} 10000`,
			);
		}

		energyCurve
			.attr("d", finalEnergyCurvePathString)
			.transition(graphTransition)
			.delay(delay)
			.attrTween("stroke-dasharray", () => {
				let leftScale, middleScale;
				if (stage === 0) {
					leftScale = d3.scaleLinear(
						[0, 1],
						[0, initialMiddlePortionLeftLength],
					);
					middleScale = d3.scaleLinear(
						[0, 1],
						[totalLenth, middlePortionLength],
					);
				} else if (stage === 1) {
					leftScale = d3.scaleLinear(
						[0, 1],
						[initialMiddlePortionLeftLength - 159, 0], // 159 = length difference between long curve and short curve
					);
					middleScale = d3.scaleLinear(
						[0, 1],
						[middlePortionLength, totalLenth],
					);
				}
				return t => {
					return `0 ${leftScale(t)} ${middleScale(t)} 100000`;
				};
			});
	}

	// Animate the dipeptides moving along the energy curve
	// To do this we create a hidden final curve and interpolate between the initial one and it to get points along the interpolated path
	if (stage === 0) {
		applyGraphicalObjs(graph, graphDipeptides.flat(Infinity), {
			selector: ".graph-dipeptide",
			key: d => d.id,
			transition: d3.transition().duration(dipeptideResetDuration),
		});
		d3.selectAll(".graph-dipeptide")
			.transition("cy")
			.duration(dipeptideResetDuration)
			.attrTween("cy", function (d) {
				const initialLength = getLengthAtX(
					initialEnergyCurveNode,
					this.getAttribute("cx"),
				);
				const initialPoint = initialEnergyCurveNode.getPointAtLength(
					initialLength,
				);
				const initialDistAboveCurve = this.getAttribute("cy") - initialPoint.y;

				const { cx, cy } = d.attrs;
				const finalLength = getLengthAtX(initialEnergyCurveNode, cx);
				const finalPoint = initialEnergyCurveNode.getPointAtLength(finalLength);
				const finalDistAboveCurve = cy - finalPoint.y;

				const distAboveCurveScale = d3.scaleLinear(
					[0, 1],
					[initialDistAboveCurve, finalDistAboveCurve],
				);

				const lengthScale = d3.scaleLinear(
					[0, 1],
					[initialLength, finalLength],
				);

				// const yScale = d3.scaleLinear([0, 1], [cy, this.getAttribute("cy")]);
				return t => {
					const length = lengthScale(t);
					const point = initialEnergyCurveNode.getPointAtLength(length);
					const curveY = point.y;
					const distAboveCurve = distAboveCurveScale(t);
					return curveY + distAboveCurve;
				};
			});
	} else if (stage === 1 || stage === 2) {
		const xLocs =
			stage === 1 ? [0.15, 0.29, 0.765, 0.45, 0.32, 0.5] : [0.15, 0.47, 0.32];
		const indices = stage === 1 ? stage1JoinIndices : stage2JoinIndices;
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
			}),
		);
		for (const chain of chains) {
			for (const elem of chain) {
				elem.class = "graph-dipeptide";
			}
		}
		console.log(chains);
		applyGraphicalObjs(graph, chains.flat(Infinity), {
			selector: ".graph-dipeptide",
			key: d => d.id,
			transition: d3
				.transition()
				.delay(dipeptideMovementDelay)
				.duration(dipeptideMovementDuration),
		});
		const intermediatePath = graph.append("path").style("opacity", 0);
		graph
			.selectAll(".graph-dipeptide")
			.transition("cy")
			.delay(dipeptideMovementDelay)
			.duration(dipeptideMovementDuration)
			.attrTween("cy", function (d) {
				const initialLength = getLengthAtX(
					initialEnergyCurveNode,
					this.getAttribute("cx"),
				);
				const initialPoint = initialEnergyCurveNode.getPointAtLength(
					initialLength,
				);
				const initialDistAboveCurve = this.getAttribute("cy") - initialPoint.y;

				const { cx, cy } = d.attrs;
				const finalLength = getLengthAtX(tempFinalPathNode, cx);
				const finalPoint = tempFinalPathNode.getPointAtLength(finalLength);
				const finalDistAboveCurve = cy - finalPoint.y;

				const distAboveCurveScale = d3.scaleLinear(
					[0, 1],
					[initialDistAboveCurve, finalDistAboveCurve],
				);

				const lengthScale = d3.scaleLinear(
					[0, 1],
					[initialLength, finalLength],
				);

				const pathInterpolator = d3.interpolate(
					initialEnergyCurveNode.getAttribute("d"),
					finalEnergyCurvePathString,
				);

				const intermediatePathNode = intermediatePath.node();

				// const yScale = d3.scaleLinear([0, 1], [cy, this.getAttribute("cy")]);
				return t => {
					intermediatePathNode.setAttribute("d", pathInterpolator(t));
					const length = lengthScale(t);
					const point = intermediatePathNode.getPointAtLength(length);
					const curveY = point.y;
					const distAboveCurve = distAboveCurveScale(t);
					return curveY + distAboveCurve;
				};
			})
			.end()
			.then(() => {
				intermediatePath.remove();
			})
			.catch(() => {});
	}
}

initialize();
