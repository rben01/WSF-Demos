const angleTextContainer = d3.select("#angle-text-container");
const angleTextSpan = d3.select("#angle-text");

const iterTextContainer = d3.select("#iter-text-container");
const iterTextSpan = d3.select("#iter-text");

const MIN_ANGLE = 15;
const MAX_ANGLE = 165;
let currAngle = MIN_ANGLE;

const MIN_ITER = 1;
const MAX_ITER = 6;
let currIter = MIN_ITER;

const WIDTH = 600;
const HEIGHT = 600;
const svg = d3.select("#fractal").attr("width", WIDTH).attr("height", HEIGHT);

const X_MIN = -1;
const X_MAX = 1;
const Y_MIN = -1;
const Y_MAX = 1;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [0, WIDTH]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT, 0]);

function setAngleOnSlider(angle) {
	if (angle === undefined) {
		angle = currAngle;
	} else {
		currAngle = angle;
	}
	const x0 = MIN_ANGLE / 6;
	const width = 220 + MIN_ANGLE / 2;
	const left = x0 + ((angle - MIN_ANGLE) * width) / (MAX_ANGLE - MIN_ANGLE);
	angleTextContainer.style("left", `${left}px`);
	angleTextSpan.text(angle);
}

function setIterOnSlider(t) {
	if (t === undefined) {
		t = currIter;
	} else {
		currIter = t;
	}
	const x0 = 0;
	const width = 235;
	const left = x0 + ((t - MIN_ITER) * width) / (MAX_ITER - MIN_ITER);
	iterTextContainer.style("left", `${left}px`);
	iterTextSpan.text(t.toFixed(1));
}

function update(angleDeg, t) {
	angleDeg = angleDeg ?? currAngle;
	t = t ?? currIter;

	t = Math.min(t, MAX_ITER);

	const nFullIters = Math.floor(t);
	const lastIterFrac = t % 1;

	const angleRad = (angleDeg * Math.PI) / 180;
	const cx = (X_MIN + X_MAX) / 2;
	const cy = (Y_MIN + Y_MAX) / 2;

	const rays = [
		[
			{
				x1: cx,
				x2: cx,
				y1: cy,
				y2: cy,
				direction: Math.PI / 2,
			},
		],
	];

	for (let i = 0; i < MAX_ITER; ++i) {
		const prevRays = rays[rays.length - 1];
		const theseRays = [];
		const lengthScale = i < nFullIters ? 1 : i <= nFullIters ? lastIterFrac : 0;
		const length = lengthScale * 0.5 ** (i + 1);
		for (const prevRay of prevRays) {
			for (let j = -1; j <= 1; ++j) {
				const thisRayDirection = prevRay.direction + j * angleRad;
				const x1 = prevRay.x2;
				const x2 = x1 + length * Math.cos(thisRayDirection);
				const y1 = prevRay.y2;
				const y2 = y1 + length * Math.sin(thisRayDirection);
				theseRays.push({
					x1,
					x2,
					y1,
					y2,
					direction: thisRayDirection,
					iter: i,
					visible: lengthScale > 0,
				});
			}
		}
		rays.push(theseRays);
	}

	svg.selectAll(".ray")
		.data(rays.flat(Infinity))
		.join("line")
		.classed("ray", true)
		.attr("stroke-opacity", d => (d.visible ? 1 : 0))
		.each(function (d) {
			const { x1, x2, y1, y2, iter, visible } = d;
			const strokeWidth = 5 / (iter + 5);
			if (visible) {
				this.setAttribute("x1", xScale(x1));
				this.setAttribute("x2", xScale(x2));
				this.setAttribute("y1", yScale(y1));
				this.setAttribute("y2", yScale(y2));
				this.setAttribute("stroke-width", strokeWidth);
			}
		});

	return rays;
}

d3.select("#angle-slider")
	.attr("min", MIN_ANGLE)
	.attr("max", MAX_ANGLE)
	.attr("value", currAngle)
	.on("input", function () {
		setAngleOnSlider(+this.value);
		update();
	});

d3.select("#iter-slider")
	.attr("min", MIN_ITER)
	.attr("max", MAX_ITER)
	.attr("value", currIter)
	.on("input", function () {
		setIterOnSlider(+this.value);
		update();
	});

setAngleOnSlider(currAngle);
setIterOnSlider(currIter);
update();
