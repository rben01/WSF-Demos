/* global applyGraphicalObjs */

const CONFIG = {
	containerSVGWidth: 300,
	containerSVGHeight: 400,
	graphSVGWidth: 800,
	graphSVGHeight: 400,
	dipeptideRadius: 7,
	fluidColor: "#e6f7ff",
};

const COLORS = {
	blue: "#23f",
	orange: "#f92",
	green: "#0b3",
	purple: "#c3f",
};

const containers = (() => {
	const containerSelection = d3
		.selectAll(".container")
		.attr("width", CONFIG.containerSVGWidth)
		.attr("height", CONFIG.containerSVGHeight);
	return d3
		.range(containerSelection.size())
		.map(i => containerSelection.filter((_, j) => i === j));
})();

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

// p0 is the center {x,y} of the first dot in the chain
// angles is a list of relative angles for the next dot in the chain to appear relative to the previous one (e.g., four Math.PI/2's would do a full circle)
// colors contains the colors of the dots; a null entry indicates use the default orange color
// precondition: angles.length === colors.length - 1 (the first dot needs a color but not an angle)
function makeDipeptideChain(p0, angles, colors, drawEncirclingLine = false) {
	const nCircles = colors.length;
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
	return data;
}

const basicDipeptides = [
	makeDipeptideChain(
		{ x: beakerXScale(0.2), y: beakerYScale(0.3) },
		[Math.PI / 4],
		[COLORS.blue, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.4), y: beakerYScale(0.6) },
		[Math.PI / 8],
		[COLORS.purple, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.71), y: beakerYScale(0.2) },
		[Math.PI / 2.3],
		[COLORS.green, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.6), y: beakerYScale(0.4) },
		[Math.PI / 0.9],
		[COLORS.blue, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.42), y: beakerYScale(0.2) },
		[Math.PI * (1 + 1 / 1.1)],
		[COLORS.purple, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.8), y: beakerYScale(0.5) },
		[Math.PI / 1.5],
		[COLORS.blue, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.38), y: beakerYScale(0.45) },
		[Math.PI / 1.1],
		[COLORS.green, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.5), y: beakerYScale(0.1) },
		[Math.PI * (1 + 1 / 1.1)],
		[COLORS.green, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.6), y: beakerYScale(0.28) },
		[Math.PI / 1.2],
		[COLORS.purple, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.7), y: beakerYScale(0.6) },
		[Math.PI / 1.4],
		[COLORS.green, null],
	),
	makeDipeptideChain(
		{ x: beakerXScale(0.3), y: beakerYScale(0.1) },
		[0.4],
		[COLORS.blue, null],
	),
];

// precondition: joinAngles.length === 2 * (indices.length - 1) (one index per joined chain, two joinAngles per adjacent pair of joined chains)
function joinBasicDipeptides(newP0, indices, joinAngles, drawEncirclingLine = false) {
	if (newP0 === null) {
		console.log(basicDipeptides[indices[0]][0]);
		const { cx, cy } = basicDipeptides[indices[0]][0].attrs;
		newP0 = { x: cx, y: cy };
	}
	const colors = [];
	const angles = [];
	for (let j = 0; j < indices.length; ++j) {
		const chain = basicDipeptides[indices[j]];
		colors.push(...chain.map(d => d.color));

		const anglesToOmit = j === 0 ? 1 : 2;
		angles.push(...chain.slice(anglesToOmit).map(d => d.angle));
		if (j !== indices.length - 1) {
			angles.push(joinAngles[2 * j], joinAngles[2 * j + 1]);
		}
	}

	return makeDipeptideChain(newP0, angles, colors, drawEncirclingLine);
}

const randomJoinAngles = [
	-0.3626769162876612,
	-0.37786879838531773,
	-0.03411404967316334,
	0.06750564727078368,
	0.21490286059949115,
	0.02809284890795294,
	-0.4449417705708276,
	-0.12330765915073838,
	-0.334978273287302,
	0.031974644919427364,
	-0.058114824287623934,
	0.15546516732918636,
	0.20967142597451105,
	0.39435779249912994,
	-0.0810119829387127,
	-0.16855002719271528,
	0.14616589504372046,
	-0.4635647539182338,
	-0.3896115422424,
	-0.42834621932104666,
	-0.04019801937756873,
	0.48928649383884604,
];

function getDepetideData(containerIndex) {
	if (containerIndex === 0) {
		return basicDipeptides.flat(Infinity);
	} else if (containerIndex === 1) {
		const joinIndicesArray = [
			[0, 7],
			[1, 8],
			[3, 2],
			[4, 5, 6],
			...d3.range(9, basicDipeptides.length).map(i => [i]),
		];

		return joinIndicesArray
			.map(indices => {
				const allButFirstJoinIndex = indices.slice(1);
				const joinAngles = [
					...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j]),
					...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j + 1]),
				];
				return joinBasicDipeptides(null, indices, joinAngles);
			})
			.flat(Infinity);
	} else if (containerIndex === 2) {
		const joinIndicesArray = [
			[0, 1, 2, 3],
			[4, 6, 5, 7],
			d3.range(8, basicDipeptides.length),
		];
		const newP0s = [
			null,
			{ x: beakerXScale(0.4), y: beakerYScale(0.2) },
			{ x: beakerXScale(0.8), y: beakerYScale(0.4) },
		];

		return joinIndicesArray
			.map((indices, j) => {
				const allButFirstJoinIndex = indices.slice(1);
				const joinAngles = [
					...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j]),
					...allButFirstJoinIndex.map(j => randomJoinAngles[2 * j + 1]),
				];
				return joinBasicDipeptides(newP0s[j], indices, joinAngles, true);
			})
			.flat(Infinity);
	} else {
		throw new Error(`Unexpected containerIndex ${containerIndex}`);
	}
}

function getGraphData() {}

function initialize() {
	const { background, foreground } = getBeakerData();
	containers.forEach((container, index) => {
		applyGraphicalObjs(container, background);
		applyGraphicalObjs(container, getDepetideData(index));
		applyGraphicalObjs(container, foreground);
	});
}

initialize();
