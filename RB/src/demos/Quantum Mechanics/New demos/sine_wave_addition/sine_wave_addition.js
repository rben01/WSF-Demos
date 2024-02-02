/* global applyGraphicalObjs syncButtonState */
const WIDTH = 1350;
const HEIGHT = 750;

const X_MIN = -0.35;
const X_MAX = 1.15;
const X_0 = 0;

const Y_MIN = -3;
const Y_MAX = -Y_MIN;
const Y_0 = 0;

const WAVENUMBER = 1;
const PERIOD = 2 * Math.PI * WAVENUMBER;
const ANIMATION_TIME_SCALE = Math.PI / 10000; // units of 1/ms
let netDx = 0;
let isPlaying = false;
let animationFrame;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

const _margin = 10;
const xScale = d3.scaleLinear([X_MIN, X_MAX], [_margin, WIDTH - _margin]);
const yScale = d3.scaleLinear([Y_MIN, Y_MAX], [HEIGHT - _margin, _margin]);

const N_LIST = [1, 3, 5, 7, 9, 11];
function nName(n) {
	return `a${n}`;
}
const TEXT_SPANS = Object.fromEntries(
	N_LIST.map(n => {
		const name = nName(n);
		return [name, document.getElementById(`text-${name}`)];
	}),
);
const SLIDERS = Object.fromEntries(
	N_LIST.map(n => {
		const name = nName(n);
		const slider = document.getElementById(`slider-${name}`);
		slider.step = 0.001;
		slider.min = 0;
		slider.max = 1;
		slider.value = 0;
		slider.oninput = update;
		return [name, slider];
	}),
);

(() => {
	const btnSolve = document.getElementById("btn-solve");
	btnSolve.onclick = function () {
		for (let n of N_LIST) {
			const name = nName(n);
			SLIDERS[name].value = 1 / n;
			update();
		}
	};

	const btnZero = document.getElementById("btn-zero");
	btnZero.onclick = function () {
		for (let n of N_LIST) {
			const name = nName(n);
			SLIDERS[name].value = 0;
			update();
		}
	};

	const btnOne = document.getElementById("btn-one");
	btnOne.onclick = function () {
		for (let n of N_LIST) {
			const name = nName(n);
			SLIDERS[name].value = 0.5;
			update();
		}
	};
})();

function getHeaviside() {
	return [
		[0, -1],
		[0, 1],
		[0.5, 1],
		[0.5, -1],
		[1, -1],
		[1, 1],
	];
}

function getSine(n) {
	const nPoints = 300;
	const points = [];

	const L = 1;
	const dx = L / (nPoints - 1);

	for (let i = 0; i < nPoints; i++) {
		const x = 0 + i * dx; // 0 = xmin
		const y =
			(4 / Math.PI) *
			+SLIDERS[nName(n)].value *
			Math.sin((2 * n * Math.PI * x) / L);

		points.push([x, y]);
	}

	return points;
}

function getSumPoints() {
	const nPoints = 500;
	const points = [];

	const L = 1;
	const dx = L / (nPoints - 1);

	for (let i = 0; i < nPoints; i++) {
		const x = 0 + i * dx; // 0 = xmin
		let y = 0;
		for (const n of N_LIST) {
			y +=
				(4 / Math.PI) *
				+SLIDERS[nName(n)].value *
				Math.sin((2 * n * Math.PI * x) / L);
		}

		points.push([x, y]);
	}

	return points;
}

const line = d3
	.line()
	.curve(d3.curveLinear)
	.x(p => xScale(p[0]))
	.y(p => yScale(p[1]));

function getAxesData() {
	const labelFormatter = d3.format(".2~g");
	const tickLengthPx = 10;

	function nonzero(x) {
		return x !== 0;
	}
	const xTickLocs = xScale.ticks(20).filter(nonzero);

	const yTickLocs = yScale.ticks(10).filter(nonzero);
	const yLabelLocs = yScale.ticks(5).filter(nonzero);

	const scaledX0 = xScale(X_0);
	const scaledY0 = yScale(Y_0);

	return [
		{
			shape: "line",
			class: "axis axis-axis axis-x-axis",
			attrs: {
				x1: xScale(X_MIN),
				x2: xScale(X_MAX),
				y1: scaledY0,
				y2: scaledY0,
			},
		},
		{
			shape: "line",
			class: "axis axis-axis axis-y-axis",
			attrs: {
				x1: scaledX0,
				x2: scaledX0,
				y1: yScale(Y_MIN),
				y2: yScale(Y_MAX),
			},
		},
		...xTickLocs.map(x => {
			const scaledX = xScale(x);
			return {
				shape: "line",
				class: "axis axis-tick axis-x-tick",
				attrs: {
					x1: scaledX,
					x2: scaledX,
					y1: scaledY0,
					y2: scaledY0 + tickLengthPx,
				},
			};
		}),
		...[
			[0.5, "𝐿"],
			[1, "𝟤𝐿"],
		].map(([x, text]) => ({
			shape: "text",
			class: "axis axis-label axis-x-label",
			text,
			attrs: {
				x: xScale(x) + 10,
				y: scaledY0 + tickLengthPx + 5,
			},
		})),
		...yTickLocs.map(y => {
			const scaledY = yScale(y);
			return {
				shape: "line",
				class: "axis axis-tick axis-y-tick",
				attrs: {
					x1: scaledX0 - tickLengthPx,
					x2: scaledX0,
					y1: scaledY,
					y2: scaledY,
				},
			};
		}),
		...yLabelLocs.map(y => {
			const scaledY = yScale(y);
			return {
				shape: "text",
				class: "axis axis-label axis-y-label",
				text: labelFormatter(y),
				attrs: {
					x: scaledX0 - tickLengthPx - 10,
					y: scaledY,
				},
			};
		}),
		{
			shape: "path",
			class: "heaviside bg",
			attrs: {
				d: line(getHeaviside()),
			},
		},
		...N_LIST.map(n => {
			return {
				shape: "path",
				class: `sine-basic ${nName(n)}`,
			};
		}),
		{
			shape: "path",
			class: "heaviside fg",
			attrs: {
				d: line(getHeaviside()),
			},
		},
		{
			shape: "path",
			class: "sine-sum bg",
		},
		{
			shape: "path",
			class: "sine-sum fg",
		},
	];
}

let formatter = d3.format(".3f");

function update({ fromUserInteraction } = {}) {
	fromUserInteraction = fromUserInteraction ?? false;

	for (let n of N_LIST) {
		const name = nName(n);
		d3.select(`.sine-basic.${name}`).attr("d", line(getSine(n)));
		document.getElementById(`text-${name}`).innerText = formatter(
			+SLIDERS[name].value,
		);
	}

	d3.selectAll(`.sine-sum`).attr("d", line(getSumPoints()));
}

applyGraphicalObjs(plot, getAxesData());

update({ fromUserInteraction: true });
