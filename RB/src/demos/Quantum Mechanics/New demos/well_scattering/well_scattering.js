const w = 1450,
    h = 750,
    x = d3.scaleLinear().domain([-10, 10]).range([0, w]),
    y = d3.scaleLinear().domain([-10, 20]).range([h, 0]),
    graph = d3.select("#svg").append("g").attr("transform", "translate(25, 25)"),
    x_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(0, " + 2 * h / 3 + ")").call(d3.axisBottom(x).ticks(5)),
    y_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(" + w / 2 + ", 0)").call(d3.axisLeft(y).tickValues([-10, -5, 5, 10, 15, 20])),
    well = graph.append("path").style("fill", "grey"),
    wave = graph.append("path").style("fill", "none").style("stroke", "red"),
    dashed = graph.append("line").style("stroke", "white").attr("x1", 0).attr("x2", w).attr("stroke-dasharray", "25 25"),
    depth = document.getElementById("depth"),
    width = document.getElementById("width"),
    mass = document.getElementById("mass"),
    energy = document.getElementById("energy");

function k(m, e) { return math.sqrt(2 * m * e) }

function chi(m, e, d) { return math.sqrt(2 * m * (e + d)) }

function a2(chi, k, w2) {
    return math.divide(
        math.multiply(
            math.sum(
                -1,
                math.exp(math.multiply(math.i, 4 * w2 * chi))
            ),
            (k - chi) * (k + chi)
        ),
        math.multiply(
            math.multiply(
                math.exp(math.multiply(math.i, 2 * w2 * k)),
                math.exp(math.multiply(math.i, 4 * w2 * chi))
            ),
            (k - chi) ** 2 - (k + chi) ** 2
        )
    )
}

function a3(chi, k, w2) {
    return math.divide(
        -2 * k * (k + chi),
        math.multiply(
            math.multiply(
                math.exp(math.multiply(math.i, w2 * (k - chi))),
                math.exp(math.multiply(math.i, 4 * w2 * chi))
            ),
            (k - chi) ** 2 - (k + chi) ** 2
        )
    )
}

function a4(chi, k, w2) {
    return math.divide(
        2 * k * (k - chi),
        math.multiply(
            math.multiply(
                math.exp(math.multiply(math.i, w2 * (k - 3 * chi))),
                math.exp(math.multiply(math.i, 4 * w2 * chi))
            ),
            (k - chi) ** 2 - (k + chi) ** 2
        )
    )
}

function a5(chi, k, w2) {
    return math.multiply(
        -1,
        math.divide(
            4 * k * chi,
            math.multiply(
                math.multiply(
                    math.exp(math.multiply(math.i, 2 * w2 * (k - chi))),
                    math.exp(math.multiply(math.i, 4 * w2 * chi))
                ),
                (k - chi) ** 2 - (k + chi) ** 2
            )
        )
    )
}

function psi(w2, d, m, e, i) {
    if (i <= -w2) {
        return math.abs(
            math.sum(
                math.exp(math.multiply(math.i, k(m, e) * i)),
                math.multiply(
                    a2(chi(m, e, d), k(m, e), w2),
                    math.exp(math.multiply(math.i, -1 * k(m, e) * i))
                )
            )
        )
    }
    else if (i <= w2) {
        return math.abs(
            math.sum(
                math.multiply(
                    a3(chi(m, e, d), k(m, e), w2),
                    math.exp(math.multiply(math.i, math.multiply(chi(m, e, d), i)))
                ),
                math.multiply(
                    a4(chi(m, e, d), k(m, e), w2),
                    math.exp(math.multiply(math.i, math.multiply(-chi(m, e, d), i)))
                )
            )
        )
    }
    else {
        return math.abs(
            math.multiply(
                a5(chi(m, e, d), k(m, e), w2),
                math.exp(math.multiply(math.i, k(m, e) * i))
            )
        )
    }
}

var d, w2, m, e;

function update() {
    d = +depth.value;
    w2 = +width.value;
    m = +mass.value;
    e = +energy.value;

    well.attr("d",
        d3.line()([
            [x(-10), y(0)],
            [x(-10), y(-10)],
            [x(10), y(-10)],
            [x(10), y(0)],
            [x(w2), y(0)],
            [x(w2), y(-d)],
            [x(-w2), y(-d)],
            [x(-w2), y(0)],
            [x(-10), y(0)]
        ])
    );
    dashed.attr("y1", y(e)).attr("y2", y(e));

    var points = []
    for (var i = -10; i < 10; i += 0.01) {
        points.push([x(i), y(psi(w2, d, m, e, i) ** 2 + e)]);
    }
    wave.attr("d", d3.line()(points));
}

d3.select("#depth").on("input", update);
d3.select("#width").on("input", update);
d3.select("#mass").on("input", update);
d3.select("#energy").on("input", update);

update();