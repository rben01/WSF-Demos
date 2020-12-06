const w = 400,
    h = 350,
    x = d3.scaleLinear().range([-w / 2, w / 2]).domain([-6, 6]),
    y = d3.scaleLinear().range([-h / 2, h / 2]).domain([10, -10]),
    cx = d3.scaleLinear().range([0, w]).domain([0, 10]),
    cy = d3.scaleLinear().range([-h / 2, h / 2]).domain([-3, 3]);

const energy_graph = d3.select("#svg").append("g").attr("transform", "translate(" + 25 + ", " + (h / 2 + 25) + ")");
energy_graph.append("g").attr("class", "axis").call(d3.axisBottom(cx).ticks(0));
energy_graph.append("g").attr("class", "axis").call(d3.axisLeft(cy).ticks(0));
const energy = energy_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const momentum_graph = d3.select("#svg2").append("g").attr("transform", "translate(" + 25 + ", " + (h / 2 + 25) + ")");
momentum_graph.append("g").attr("class", "axis").call(d3.axisBottom(cx).ticks(0));
momentum_graph.append("g").attr("class", "axis").call(d3.axisLeft(cy).ticks(0));
const momentum = momentum_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const psi_graph = d3.select("#svg3").append("g").attr("transform", "translate(" + (25 + w / 2) + ", " + (h / 2 + 25) + ")");
psi_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
psi_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const psi = psi_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const real_graph = d3.select("#svg4").append("g").attr("transform", "translate(" + (25 + w / 2) + ", " + (h / 2 + 25) + ")");
real_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
real_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const real = real_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const imaginary_graph = d3.select("#svg5").append("g").attr("transform", "translate(" + (25 + w / 2) + ", " + (h / 2 + 25) + ")");
imaginary_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
imaginary_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const imaginary = imaginary_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);