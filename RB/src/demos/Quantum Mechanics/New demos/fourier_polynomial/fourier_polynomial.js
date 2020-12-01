const svg = d3.select("#svg"),
    w = 500,
    h = 500,
    x = d3.scaleLinear().range([-w / 2, w / 2]).domain([-6, 6]),
    y = d3.scaleLinear().range([-h / 2, h / 2]).domain([-10, 10]);

var c0 = 0,
    c1 = 0,
    c2 = 0,
    c3 = 0;

const sliders = {
    constant: document.getElementById("constant"),
    linear: document.getElementById("linear"),
    quadratic: document.getElementById("quadratic"),
    cubic: document.getElementById("cubic")
}

const poly_graph = svg.append("g").attr("transform", "translate(" + w / 2 + ", " + (h / 2 + 50) + ")");
poly_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
poly_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const poly = poly_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const peri_graph = svg.append("g").attr("transform", "translate(" + (50 + 3 * w / 2) + ", " + (h / 2 + 50) + ")");
peri_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
peri_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const peri = peri_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const cos_graph = svg.append("g").attr("transform", "translate(" + (100 + 5 * w / 2) + ", " + (h / 2 + 50) + ")");
const cos = cos_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const sin_graph = svg.append("g").attr("transform", "translate(" + (150 + 7 * w / 2) + ", " + (h / 2 + 50) + ")");
const sin = sin_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

const fourier_graph = svg.append("g").attr("transform", "translate(" + (200 + 9 * w / 2) + ", " + (h / 2 + 50) + ")");
fourier_graph.append("g").attr("class", "axis").call(d3.axisBottom(x).ticks(7));
fourier_graph.append("g").attr("class", "axis").call(d3.axisLeft(y).ticks(7));
const fourier = fourier_graph.append("path").attr("fill", "none").style("stroke", "lightgrey").style("stroke-width", 3);

function get_poly_path() {
    var points = [];
    c0 = +sliders.constant.value;
    c1 = +sliders.linear.value;
    c2 = +sliders.quadratic.value;
    c3 = +sliders.cubic.value;

    for (var i = -6; i < 6; i += 12 / 1000) {
        points.push([w * i / 12, -h * (c3 * i ** 3 + c2 * i ** 2 + c1 * i + c0) / 20])
    }

    return points;
}

function get_peri_path() {
    var points = [],
        x;

    for (var i = -6; i < 6; i += 12 / 1000) {
        x = ((i + Math.PI) % (2 * Math.PI) + 2 * Math.PI) % (2 * Math.PI) - Math.PI;
        points.push([w * i / 12, -h * (c3 * x ** 3 + c2 * x ** 2 + c1 * x + c0) / 20])
    }

    return points;
}

/* Fourier series:
Even functions - f(x) = a_0/2 + Sigma a_n cos(n pi x / L), a_n = 2/L int [0,L] f(x) cos(n pi x / L) dx
Odd function - f(x) = Sigma b_n sin (n pi x / L), b_n = 2/L int [0,L] f(x) cos(n pi x / L) dx

*/

function get_sin_coefs() {
    var coefs = [];
    for (var n = 1; n < 11; n++) {
        coefs.push(c1 * 2 * (-1) ** (n + 1) / n + c3 * 2 * (-1) ** (n + 1) * (Math.PI ** 2 - 6 / n ** 2) / n);
    }

    return coefs;
}

function get_cos_coefs() {
    var coefs = [c0 + c2 * 4 * Math.PI ** 2 / 3];
    for (var n = 1; n < 10; n++) {
        coefs.push(c2 * 4 * (-1) ** n / n ** 2);
    }

    return coefs;
}

function update() {
    var points = get_poly_path();
    poly.attr("d", d3.line()(points));
    peri.attr("d", d3.line()(get_peri_path()));
}

d3.selectAll("input").on("input", update);
update();