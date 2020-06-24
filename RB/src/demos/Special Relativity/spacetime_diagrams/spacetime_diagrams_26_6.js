/* global applyDatum state ANIM_STATES showSpacialSlices lineGroupsClass _toggleSlices svg AXES xScale yScale lineColor LINE_ARROWHEAD_ID fmtFloat */

const sliders = {
	speed: document.getElementById("input-speed"),
	distance: document.getElementById("input-distance"),
};

const textSpans = {
	speed: document.getElementById("text-speed"),
};

const lineElemsClass = "spatial-elem";

function update({ speed }) {
	if (typeof speed === "undefined") {
		speed = sliders.speed.value;
	}
	speed = +speed;

	const wasAnimating = state === ANIM_STATES.during;

	const nLinesAbove = 2;
	const lineGroups = d3.range(2 * nLinesAbove + 1).map(i => {
		const index = -nLinesAbove + i;
		const opacity = showSpacialSlices || index === 0 ? 1 : 0;
		return { index, opacity };
	});
	const elems = svg
		.selectAll(`.${lineGroupsClass}`)
		.data(lineGroups)
		.join("g")
		.call(g => {
			if (!wasAnimating) {
				g.style("opacity", d => d.opacity);
				console.log("x");
			}
		})
		.classed(lineGroupsClass, true)
		.selectAll(`.${lineElemsClass}`)
		.data(d => {
			const index = d.index;
			const x0 = (index / (AXES.y.max - AXES.y.min)) * 0.8;
			const invSlope = speed;
			const { min: _y1, max: _y2 } = AXES.y;
			const y1 = _y1 * 0.8;
			const y2 = _y2 * 0.8;
			const [x1, x2] = [y1, y2].map(y => invSlope * y + x0);

			const textPos = { x: xScale(x2) - 15, y: yScale(y2) - 14 };
			if (textPos.x > xScale(AXES.x.max) - 20) {
				textPos.x = xScale(x1) - 10;
				textPos.y = yScale(y1) + 16;
			}
			return [
				{
					shape: "line",
					attrs: {
						x1: xScale(x1),
						y1: yScale(y1),
						x2: xScale(x2),
						y2: yScale(y2),
						stroke: lineColor,
						"stroke-width": 2,
						"stroke-dasharray": "3 3",
					},
				},
				{
					shape: "line",
					attrs: {
						x1: xScale(x2),
						y1: yScale(y2),
						x2: xScale(x2 + invSlope * 0.001),
						y2: yScale(y2 + 0.001),
						stroke: lineColor,
						"stroke-width": 2,
						"marker-end": `url(#${LINE_ARROWHEAD_ID})`,
					},
				},
				{
					shape: "text",
					text: `𝑡′ = ${index}`.replace("-", "−"),
					attrs: {
						...textPos,
						fill: "white",
						"font-size": "70%",
						filter: `url(#text-bg)`,
					},
				},
			];
		})
		.join(enter => enter.append(d => d3.create(`svg:${d.shape}`).node()))
		.classed(lineElemsClass, true);

	elems.each(function (d) {
		applyDatum.call(this, d);
	});

	textSpans.speed.innerHTML = fmtFloat(speed, 2);
}

update({});

const buttons = { stop: document.getElementById("button") };
// eslint-disable-next-line no-unused-vars
function toggle() {
	_toggleSlices(svg, {
		beforeBeginCallback: () => (buttons.stop.innerText = "Stop"),
		afterFinishCallback: () => (buttons.stop.innerText = "Show Spatial Slices"),
		beforeCancelCallback: () => (buttons.stop.innerText = "Show Spatial Slices"),
	});
}
