const w = 1450,
    h = 750,
    x = d3.scaleLinear().domain([-10, 10]).range([0, w]),
    y = d3.scaleLinear().domain([0, 10]).range([h, 0]),
    graph = d3.select("#svg").append("g").attr("transform", "translate(25, 25)"),
    x_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(0, " + h + ")").call(d3.axisBottom(x).ticks(5)),
    y_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(" + w / 2 + ", 0)").call(d3.axisLeft(y).ticks(6)),
    barrier = graph.append("rect").style("fill", "grey").attr("x", x(0)).attr("width", w / 2),
    wave = graph.append("path").style("fill", "none").style("stroke", "red"),
    dashed = graph.append("line").style("stroke", "white").attr("x1", 0).attr("x2", w).attr("stroke-dasharray", "25 25"),
    height = document.getElementById("height"),
    mass = document.getElementById("mass"),
    energy = document.getElementById("energy");

function k(m, e) { return math.sqrt(2 * m * e) }

function chi(m, e, b) { return math.sqrt(2 * m * (e - b)) }

function a2(chi, k) { return math.sum(-1, math.divide(2 * k, math.sum(k, chi))) }

function a3(chi, k) { return math.divide(2 * k, math.sum(k, chi)) }

function psi(b, m, e, i) {
    if (i <= 0) {
        return math.abs(math.sum(math.exp(math.multiply(math.i, k(m, e) * i)), math.multiply(a2(chi(m, e, b), k(m, e)), math.exp(math.multiply(math.i, -k(m, e) * i)))))
    }
    else {
        return math.abs(math.multiply(a3(chi(m, e, b), k(m, e)), math.exp(math.multiply(math.i, math.multiply(chi(m, e, b), i)))))
    }
}

var b, m, e;

function update() {
    b = +height.value;
    m = +mass.value;
    e = +energy.value;

    barrier.attr("y", y(b)).attr("height", h - y(b));
    dashed.attr("y1", y(e)).attr("y2", y(e));

    var points = []
    for (var i = -10; i < 10; i += 0.01) {
        points.push([x(i), y(psi(b, m, e, i) ** 2 + e)]);
    }
    wave.attr("d", d3.line()(points));
}

d3.select("#height").on("input", update);
d3.select("#mass").on("input", update);
d3.select("#energy").on("input", update);

update();