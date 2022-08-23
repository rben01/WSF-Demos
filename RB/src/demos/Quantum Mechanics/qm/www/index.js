import * as wasm from "qm";
import { memory } from "qm/qm_bg";
import * as d3 from "d3";
import { range } from "d3-array";

const L = 80;
const params = wasm.Parameters.new(80, 40, 8, 3, 5);
const nx = 200;
const xs = range(nx).map(i => (i * L) / (nx - 1));
const wf = wasm.Wavefunction.new(params, xs);

const psi_t = new Float64Array(memory.buffer, wf.psi_t_ptr(), wf.buffer_len());
console.log(psi_t);

const WIDTH = 600;
const HEIGHT = 400;
const MARGIN = 5;
const plot = d3
	.select(document.getElementById("plot"))
	.attr("width", WIDTH)
	.attr("height", HEIGHT);

const xScale = d3.scaleLinear([0, L], [MARGIN, WIDTH - MARGIN]);
const yScale = d3.scaleLinear([0, 0.01], [HEIGHT - MARGIN, MARGIN]);

const line = d3.line();
const points = [];

for (let i = 0; i < nx; i++) {
	const re = psi_t[2 * i];
	const im = psi_t[2 * i + 1];
	const abs2 = re ** 2 + im ** 2;

	const x = xs[i];

	points.push([xScale(x), yScale(abs2)]);
}

plot.selectAll(".curve")
	.data([0])
	.join("path")
	.attr("d", line(points))
	.attr("stroke", "black")
	.attr("fill", "none");
