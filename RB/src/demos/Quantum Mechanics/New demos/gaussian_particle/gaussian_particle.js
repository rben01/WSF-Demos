/* global SVDJS */

const GRAPH_WIDTH = 400;
const GRAPH_HEIGHT = GRAPH_WIDTH;

const plot3D = d3
	.select("#plot-3d")
	.attr("width", GRAPH_WIDTH)
	.attr("height", GRAPH_HEIGHT);

const plot2D = d3
	.select("#plot-2d")
	.attr("width", GRAPH_WIDTH)
	.attr("height", GRAPH_HEIGHT);

const margin2D = 15;
const X_MIN = -5;
const X_MAX = 5;
const X_0 = (X_MIN + X_MAX) / 2;
const Y_MIN = -5;
const Y_MAX = 5;
const Y_0 = (Y_MIN + Y_MAX) / 2;
const xScale2D = d3.scaleLinear([X_MIN, X_MAX], [margin2D, GRAPH_WIDTH - margin2D]);
const yScale2D = d3.scaleLinear([Y_MIN, Y_MAX], [GRAPH_HEIGHT - margin2D, margin2D]);

const sliders = {
	correlation: document.getElementById("slider-correlation"),
	particle1Spread: document.getElementById("slider-particle-1-spread"),
	particle2Spread: document.getElementById("slider-particle-2-spread"),
	particle1MeanPos: document.getElementById("slider-particle-1-mean-pos"),
	particle2MeanPos: document.getElementById("slider-particle-2-mean-pos"),
};

// eslint-disable-next-line no-use-before-define
d3.selectAll(".param-slider").property("step", 0.0017).on("input", drawEllipse2D2);

d3.selectAll(".correlation-slider")
	.property("min", -1)
	.property("max", 1)
	.property("value", 0);

d3.selectAll(".spread-slider")
	.property("min", 1.1)
	.property("max", 2)
	.property("value", 1.55);

d3.selectAll(".position-slider")
	.property("min", -1)
	.property("max", 1)
	.property("value", 0);

// Set up 2D plot
(() => {
	const majorTickSpacing = 1;
	const minorTickSpacing = 0.5;
	const majorTickLength = 5;
	const minorTickLength = 3;
	const axisLabelSpacing = 2;

	const nMinorTickGapsBwtnMajorTicks = Math.round(
		majorTickSpacing / minorTickSpacing,
	);

	const axisStrokeWidth = 1;

	const x0 = xScale2D(X_0);
	const y0 = yScale2D(Y_0);
	// x axis ticks

	// axes themselves
	plot2D
		.selectAll(".axis")
		.data([
			{
				x1: xScale2D(X_MIN),
				x2: xScale2D(X_MAX),
				y1: y0,
				y2: y0,
			},
			{
				x1: x0,
				x2: x0,
				y1: yScale2D(Y_MIN),
				y2: yScale2D(Y_MAX),
			},
		])
		.join("line")
		.classed("axis", true)
		.attr("x1", d => d.x1)
		.attr("x2", d => d.x2)
		.attr("y1", d => d.y1)
		.attr("y2", d => d.y2);

	// ticks
	const nXTicks = Math.round((X_MAX - X_MIN) / minorTickSpacing + 1);
	const xTickScale = d3.scaleLinear([0, nXTicks - 1], [X_MIN, X_MAX]);
	const xTicks = d3.range(nXTicks).map(i => {
		const isMajorTick = i % nMinorTickGapsBwtnMajorTicks === 0;
		const x = xScale2D(xTickScale(i));
		return {
			class: "axis-tick x-axis-tick",
			x1: x,
			x2: x,
			y1: y0 + axisStrokeWidth / 2,
			y2: y0 - (isMajorTick ? majorTickLength : minorTickLength),
		};
	});

	const nYTicks = Math.round((Y_MAX - Y_MIN) / minorTickSpacing + 1);
	const yTickScale = d3.scaleLinear([0, nXTicks - 1], [Y_MIN, Y_MAX]);
	const yTicks = d3.range(nYTicks).map(i => {
		const isMajorTick = i % nMinorTickGapsBwtnMajorTicks === 0;
		const y = yScale2D(yTickScale(i));
		return {
			class: "axis-tick y-axis-tick",
			x1: x0 - axisStrokeWidth / 2,
			x2: x0 + (isMajorTick ? majorTickLength : minorTickLength),
			y1: y,
			y2: y,
		};
	});

	plot2D
		.selectAll()
		.data([...xTicks, ...yTicks])
		.join("line")
		.attr("class", d => d.class)
		.attr("x1", d => d.x1)
		.attr("x2", d => d.x2)
		.attr("y1", d => d.y1)
		.attr("y2", d => d.y2);

	// tick labels
	const labelFormatter = d3.format("d");

	const xLabelMin = Math.ceil(X_MIN / axisLabelSpacing) * axisLabelSpacing;
	const xLabelMax = Math.floor(X_MAX / axisLabelSpacing) * axisLabelSpacing;
	const nXLabels = Math.round((xLabelMax - xLabelMin) / axisLabelSpacing + 1);
	const xLabelScale = d3.scaleLinear([0, nXLabels - 1], [xLabelMin, xLabelMax]);
	const xLabels = d3
		.range(nXLabels)
		.map(i => {
			const x = xLabelScale(i);
			if (x === 0) {
				return null;
			}
			return {
				class: "axis-label x-axis-label",
				x: xScale2D(x),
				y: y0 + 5,
				text: labelFormatter(x),
			};
		})
		.filter(d => d !== null);

	const yLabelMin = Math.ceil(Y_MIN / axisLabelSpacing) * axisLabelSpacing;
	const yLabelMax = Math.floor(Y_MAX / axisLabelSpacing) * axisLabelSpacing;
	const nYLabels = Math.round((yLabelMax - yLabelMin) / axisLabelSpacing + 1);
	const yLabelScale = d3.scaleLinear([0, nYLabels - 1], [yLabelMin, yLabelMax]);
	const yLabels = d3
		.range(nYLabels)
		.map(i => {
			const y = yLabelScale(i);
			if (y === 0) {
				return null;
			}
			return {
				class: "axis-label y-axis-label",
				x: x0 - 5,
				y: yScale2D(y),
				text: labelFormatter(y),
			};
		})
		.filter(d => d !== null);

	plot2D
		.selectAll()
		.data([...xLabels, ...yLabels])
		.join("text")
		.attr("class", d => d.class)
		.attr("x", d => d.x)
		.attr("y", d => d.y)
		.text(d => d.text);
})();

function unitVector(vec) {
	let sum = 0;
	for (const v of vec) {
		sum += v ** 2;
	}
	const magnitude = sum ** 0.5;
	console.log(vec, magnitude);
	return vec.map(v => v / magnitude);
}

function drawEllipse2D() {
	const r = +sliders.correlation.value; // correlation
	const s1 = +sliders.particle1Spread.value; // sigma_1
	const s2 = +sliders.particle2Spread.value; // sigma_2
	const u1 = +sliders.particle1MeanPos.value; // mu_1
	const u2 = +sliders.particle2MeanPos.value; // mu_2

	// Determinant of the correlation matrix [[s1, t], [t, s2]]
	const det = s1 * s2 - r ** 2;

	// eigendecomposition of the ICM
	let lambda1, lambda2, eVec1, eVec2;
	if (r === 0) {
		lambda1 = 1 / s2;
		lambda2 = 1 / s1;
		eVec1 = [0, 1];
		eVec2 = [1, 0];
	} else {
		const discriminantICM = Math.sqrt((s1 - s2) ** 2 + 4 * r ** 2);
		lambda1 = (s1 + s2 - discriminantICM) / (2 * det);
		lambda2 = (s1 + s2 + discriminantICM) / (2 * det);
		eVec1 = unitVector([(s1 - s2 + discriminantICM) / (2 * r), 1]);
		eVec2 = unitVector([(s1 - s2 - discriminantICM) / (2 * r), 1]);
	}

	// find equation of resulting ellipse ax^2 + bxy + cy^2 + dx + ey + f = 0
	// https://en.wikipedia.org/wiki/Ellipse#General_ellipse
	const k = 1; // an arbitrary level set
	const a = (1 / k) * (lambda1 * eVec1[0] ** 2 + lambda2 * eVec2[0] ** 2);
	const b =
		(1 / k) * 2 * (lambda1 * eVec1[0] * eVec1[1] + lambda2 * eVec2[0] * eVec2[1]);
	const c = (1 / k) * (lambda1 * eVec1[1] ** 2 + lambda2 * eVec2[1] ** 2);
	const d =
		(1 / k) *
		-2 *
		(u1 * (lambda1 * eVec1[0] ** 2 + lambda2 * eVec2[0] ** 2) +
			u2 * (lambda1 * eVec1[0] * eVec1[1] + lambda2 * eVec2[0] * eVec2[1]));
	const e =
		(1 / k) *
		-2 *
		(u2 * (lambda1 * eVec1[1] ** 2 + lambda2 * eVec2[1] ** 2) +
			u1 * (lambda1 * eVec1[0] * eVec1[1] + lambda2 * eVec2[0] * eVec2[1]));
	const f =
		(1 / k) *
		(lambda1 * (u1 * eVec1[0] + u2 * eVec1[1]) ** 2 +
			lambda2 * (u1 * eVec2[0] + u2 * eVec2[1]) ** 2);

	// Finally, the canonical parameters for (x-x0)^2/m^2 + (y-y0)^2/n^2 = 1
	const discriminantCanonical = b ** 2 - 4 * a * c;
	const x0 = (2 * c * d - b * e) / discriminantCanonical;
	const y0 = (2 * a * e - b * d) / discriminantCanonical;
	function getScaleFactor(sign) {
		return (
			-Math.sqrt(
				Math.abs(
					2 *
						(a * e ** 2 +
							c * d ** 2 -
							b * d * e +
							discriminantCanonical * f) *
						(a + c + sign * Math.sqrt((a - c) ** 2 + b ** 2)),
				),
			) / discriminantCanonical
		);
	}
	const m = getScaleFactor(1);
	const n = getScaleFactor(-1);
	const theta =
		b === 0
			? a < c
				? 0
				: Math.PI / 4
			: Math.atan((1 / b) * (c - a - Math.sqrt((a - c) ** 2 + b ** 2)));

	console.log({
		pp: d * x0 + e * y0 + 2 * f,
		rr: a * e ** 2 + c * d ** 2 - b * d * e + discriminantCanonical * f,
		qq: a + c + 1 * Math.sqrt((a - c) ** 2 + b ** 2),
		r,
		s1,
		s2,
		u1,
		u2,
		det,
		lambda1,
		lambda2,
		eVec1,
		eVec2,
		k,
		a,
		b,
		c,
		d,
		e,
		f,
		discriminantCanonical,
		x0,
		y0,
		m,
		n,
		theta,
	});
	plot2D
		.selectAll(".level-set")
		.data([
			{
				cx: x0,
				cy: y0,
				rx: 1 / m,
				ry: 1 / n,
				transform: `rotate(${theta}rad)`,
			},
		])
		.join("ellipse")
		.classed("level-set", true)
		.attr("cx", d => d.cx)
		.attr("cy", d => d.cy)
		.attr("rx", d => d.rx)
		.attr("ry", d => d.ry)
		.attr("transform", d => d.transform)
		.attr("fill-opacity", 0)
		.attr("stroke", "black");
}

function __matMulHelper(mat1, mat2) {
	if (typeof mat1[0].length === "undefined") {
		mat1 = [mat1];
	}

	const squeezeAns = typeof mat2[0].length === "undefined";
	if (squeezeAns) {
		mat2 = mat2.map(elem => [elem]);
	}

	const m = mat1.length;
	const k = mat2.length;
	const n = mat2[0].length;

	const ans = [];
	for (let r = 0; r < m; ++r) {
		const rowAns = [];
		for (let c = 0; c < n; ++c) {
			let sum = 0;
			for (let i = 0; i < k; ++i) {
				sum += mat1[r][i] * mat2[i][c];
			}
			rowAns.push(sum);
		}
		ans.push(rowAns);
	}

	if (squeezeAns) {
		return ans.map(row => row[0]);
	}

	return ans;
}

function matMul(...mats) {
	let ans = mats[0];
	for (let i = 1; i < mats.length; ++i) {
		ans = __matMulHelper(ans, mats[i]);
	}
	return ans;
}

function transpose(mat) {
	const ans = [];
	for (let c = 0; c < mat[0].length; ++c) {
		const row = [];
		for (let r = 0; r < mat.length; ++r) {
			row.push(mat[r][c]);
		}
		ans.push(row);
	}
	return ans;
}

// Synopsis: we perform an eigendecomposition on the correlation matrix and use this to
// compute its sqrt. Then we use this to generate five points on the ellipse of the
// level set, solve the linear equation giving the coefficients of the ellipse in
// standard form, and then use those coefficients to get cx, cy, rx, ry, and the
// rotation
function drawEllipse2D2() {
	const r = +sliders.correlation.value; // correlation
	const s1 = +sliders.particle1Spread.value; // sigma_1
	const s2 = +sliders.particle2Spread.value; // sigma_2
	const u1 = +sliders.particle1MeanPos.value; // mu_1
	const u2 = +sliders.particle2MeanPos.value; // mu_2

	// eigendecomposition of the correlation matrix
	let lambda1, lambda2, eVec1, eVec2;
	if (r === 0) {
		lambda1 = s1;
		lambda2 = s2;
		eVec1 = [0, 1];
		eVec2 = [1, 0];
	} else {
		const discriminantICM = Math.sqrt((s1 - s2) ** 2 + 4 * r ** 2);
		lambda1 = (s1 + s2 - discriminantICM) / 2;
		lambda2 = (s1 + s2 + discriminantICM) / 2;
		eVec1 = unitVector([(s1 - s2 - discriminantICM) / (2 * r), 1]);
		eVec2 = unitVector([(s1 - s2 + discriminantICM) / (2 * r), 1]);
	}

	const sqrtSigma = matMul(
		[
			[lambda1 ** 0.5, 0],
			[0, lambda2 ** 0.5],
		],
		[
			[eVec1[0], eVec2[0]],
			[eVec1[1], eVec2[1]],
		],
	);

	function getEllipseParams(radius) {
		const nPoints = 5;
		const pointsOnUnitCircle = d3.range(nPoints).map(i => {
			const theta = (i / nPoints) * 2 * Math.PI;
			return [Math.cos(theta), Math.sin(theta)];
		});

		// https://stats.stackexchange.com/a/76428
		const pointsOnEllipse = matMul(
			pointsOnUnitCircle,
			[
				[radius, 0],
				[0, radius],
			],
			sqrtSigma,
		);

		for (let i = 0; i < pointsOnEllipse.length; ++i) {
			pointsOnEllipse[i][0] += u1;
			pointsOnEllipse[i][1] += u2;
		}

		const mat = transpose(
			pointsOnEllipse.map(([x, y]) => [x ** 2, x * y, y ** 2, x, y, 1]),
		);

		// https://math.stackexchange.com/a/2286578
		// https://math.stackexchange.com/a/767126
		const { u } = SVDJS.SVD(mat, "f", true, 1e-10);
		const [a, b, c, d, e, f] = u.map(row => row[row.length - 1]);

		// https://en.wikipedia.org/wiki/Ellipse#General_ellipse
		const discriminantCanonical = b ** 2 - 4 * a * c;
		const x0 = (2 * c * d - b * e) / discriminantCanonical;
		const y0 = (2 * a * e - b * d) / discriminantCanonical;
		function getScaleFactor(sign) {
			return (
				-Math.sqrt(
					Math.abs(
						2 *
							(a * e ** 2 +
								c * d ** 2 -
								b * d * e +
								discriminantCanonical * f) *
							(a + c + sign * Math.sqrt((a - c) ** 2 + b ** 2)),
					),
				) / discriminantCanonical
			);
		}
		const m = getScaleFactor(1);
		const n = getScaleFactor(-1);
		const theta =
			b === 0
				? a < c
					? 0
					: Math.PI / 4
				: Math.atan((1 / b) * (c - a - Math.sqrt((a - c) ** 2 + b ** 2)));

		console.log({ a, b, c, d, e, f, x0, y0, m, n, theta });

		// console.log(u, v, q);
		// const [a, b, c, d, e] = q;

		// let indexClosestToCenter = null;
		// let minDistFromCenterX = Infinity;
		// pointsOnEllipseUnordered.forEach(([x, y], i) => {
		// 	const distFromCenterX = Math.abs(x - u1);
		// 	if (distFromCenterX < minDistFromCenterX && y > u2) {
		// 		indexClosestToCenter = i;
		// 		minDistFromCenterX = distFromCenterX;
		// 	}
		// });

		// const pointsOnEllipse = [
		// 	...pointsOnEllipseUnordered.slice(indexClosestToCenter),
		// 	...pointsOnEllipseUnordered.slice(0, indexClosestToCenter),
		// ];
		const cx = xScale2D(x0);
		const cy = yScale2D(y0);
		const rx = xScale2D(m) - xScale2D(X_0);
		const ry = yScale2D(Y_0) - yScale2D(n);
		const rotate = (-Math.sign(r) * (theta * 180)) / Math.PI;
		const transform = `rotate(${rotate} ${cx} ${cy})`;

		return { cx, cy, rx, ry, transform };
	}

	// const nPoints = 5;
	// const pointsOnUnitCircle = d3.range(nPoints).map(i => {
	// 	const theta = (i / nPoints) * 2 * Math.PI;
	// 	return [Math.cos(theta), Math.sin(theta)];
	// });

	// const pointsOnEllipse = matMul(
	// 	pointsOnUnitCircle,
	// 	[
	// 		[s1, 0],
	// 		[0, s2],
	// 	],
	// 	sqrtSigma,
	// );

	// for (let i = 0; i < pointsOnEllipse.length; ++i) {
	// 	pointsOnEllipse[i][0] += u1;
	// 	pointsOnEllipse[i][1] += u2;
	// }

	// // console.log(pointsOnEllipse);
	// const mat = transpose(
	// 	pointsOnEllipse.map(([x, y]) => [x ** 2, x * y, y ** 2, x, y, 1]),
	// );
	// // console.log(JSON.stringify(mat));
	// const { u } = SVDJS.SVD(mat, "f", true, 1e-10);
	// const [a, b, c, d, e, f] = u.map(row => row[row.length - 1]);

	// const discriminantCanonical = b ** 2 - 4 * a * c;
	// const x0 = (2 * c * d - b * e) / discriminantCanonical;
	// const y0 = (2 * a * e - b * d) / discriminantCanonical;
	// function getScaleFactor(sign) {
	// 	return (
	// 		-Math.sqrt(
	// 			Math.abs(
	// 				2 *
	// 					(a * e ** 2 +
	// 						c * d ** 2 -
	// 						b * d * e +
	// 						discriminantCanonical * f) *
	// 					(a + c + sign * Math.sqrt((a - c) ** 2 + b ** 2)),
	// 			),
	// 		) / discriminantCanonical
	// 	);
	// }
	// const m = getScaleFactor(1);
	// const n = getScaleFactor(-1);
	// const theta =
	// 	b === 0
	// 		? a < c
	// 			? 0
	// 			: Math.PI / 4
	// 		: Math.atan((1 / b) * (c - a - Math.sqrt((a - c) ** 2 + b ** 2)));

	// console.log({ a, b, c, d, e, f, x0, y0, m, n, theta });

	const ellipsesData = [1, 1.6, 2.2].map((radius, index) => {
		const colorDegradationWithRadius = 2;
		return {
			...getEllipseParams(radius),
			stroke: d3.interpolateRgb(
				"black",
				"white",
			)(1 - colorDegradationWithRadius / (index + colorDegradationWithRadius)),
		};
	});

	// console.log(u, v, q);
	// const [a, b, c, d, e] = q;

	// let indexClosestToCenter = null;
	// let minDistFromCenterX = Infinity;
	// pointsOnEllipseUnordered.forEach(([x, y], i) => {
	// 	const distFromCenterX = Math.abs(x - u1);
	// 	if (distFromCenterX < minDistFromCenterX && y > u2) {
	// 		indexClosestToCenter = i;
	// 		minDistFromCenterX = distFromCenterX;
	// 	}
	// });

	// const pointsOnEllipse = [
	// 	...pointsOnEllipseUnordered.slice(indexClosestToCenter),
	// 	...pointsOnEllipseUnordered.slice(0, indexClosestToCenter),
	// ];
	// const cx = xScale2D(x0);
	// const cy = yScale2D(y0);
	// const rx = xScale2D(m) - xScale2D(X_0);
	// const ry = yScale2D(Y_0) - yScale2D(n);
	// const rotate = (-Math.sign(r) * (theta * 180)) / Math.PI;
	plot2D
		.selectAll(".level-set")
		.data(ellipsesData)
		.join("ellipse")
		.classed("level-set", true)
		.attr("cx", d => d.cx)
		.attr("cy", d => d.cy)
		.attr("rx", d => d.rx)
		.attr("ry", d => d.ry)
		.attr("transform", d => d.transform)
		.attr("stroke", d => d.stroke);

	// const line = d3
	// 	.line()
	// 	.curve(d3.curveCardinalClosed)
	// 	.x(d => xScale2D(d[0] + u1))
	// 	.y(d => yScale2D((r < 0 ? -1 : 1) * d[1] + u2));
	// plot2D
	// 	.selectAll(".ellipse")
	// 	.data([pointsOnEllipse])
	// 	.join("path")
	// 	.classed("ellipse", true)
	// 	.attr("d", line);
}

drawEllipse2D2();
