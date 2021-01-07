const W = 1450,
    H = 750,
    x = d3.scaleLinear().domain([-10, 10]).range([0, W]),
    y = d3.scaleLinear().domain([0, 80]).range([H, 0]),
    graph = d3.select("#svg").append("g").attr("transform", "translate(25, 25)"),
    barrier = graph.append("rect").style("fill", "grey"),
    x_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(0, " + H + ")").call(d3.axisBottom(x).ticks(5)),
    y_axis = graph.append("g").attr("class", "axis").attr("transform", "translate(" + W / 2 + ", 0)").call(d3.axisLeft(y).tickValues([20, 40, 60, 80])),
    wave = graph.append("path").style("fill", "none").style("stroke", "#5df").style("stroke-width", 5),
    dashed = graph.append("line").style("stroke", "white").attr("x1", 0).attr("x2", W).attr("stroke-dasharray", "25 25"),
    height = document.getElementById("height"),
    width = document.getElementById("width"),
    mass = document.getElementById("mass"),
    energy = document.getElementById("energy");

function k(m, e) { return math.sqrt(2 * m * e) }

function chi(m, e, h) { return math.sqrt(2 * m * (e - h)) }

function a2(chi, k, w) {
    return math.divide(
        math.multiply(
            math.sum(
                -1,
                math.exp(
                    math.multiply(
                        math.i,
                        math.multiply(chi, 4 * w)
                    )
                )
            ),
            math.multiply(
                math.subtract(k, chi),
                math.sum(k, chi)
            )
        ),
        math.multiply(
            math.exp(math.multiply(math.i, 2 * w * k)),
            math.subtract(
                math.multiply(
                    math.exp(
                        math.multiply(
                            math.i,
                            math.multiply(chi, 4 * w)
                        )
                    ),
                    math.square(math.subtract(k, chi))
                ),
                math.square(math.sum(k, chi))
            )
        )
    )
}

function a3(chi, k, w) {
    return math.divide(
        math.multiply(
            -2 * k,
            math.sum(k, chi)
        ),
        math.multiply(
            math.exp(
                math.multiply(
                    math.i,
                    math.multiply(w, math.subtract(k, chi))
                )
            ),
            math.subtract(
                math.multiply(
                    math.exp(
                        math.multiply(
                            math.i,
                            math.multiply(4 * w, chi)
                        )
                    ),
                    math.square(math.subtract(k, chi))
                ),
                math.square(math.sum(k, chi))
            )
        )
    )
}

function a4(chi, k, w) {
    return math.divide(
        math.multiply(2 * k, math.subtract(k, chi)),
        math.multiply(
            math.exp(
                math.multiply(
                    math.i,
                    math.multiply(w, math.subtract(k, math.multiply(3, chi))))
            ),
            math.subtract(
                math.multiply(
                    math.exp(
                        math.multiply(math.i, math.multiply(4 * w, chi))
                    ),
                    math.square(math.subtract(k, chi))
                ),
                math.square(math.sum(k, chi))
            )
        )
    )
}

function a5(chi, k, w) {
    return math.multiply(
        -1,
        math.divide(
            math.multiply(4 * k, chi),
            math.multiply(
                math.exp(
                    math.multiply(math.i, math.multiply(2 * w, math.subtract(k, chi)))
                ),
                math.subtract(
                    math.multiply(
                        math.exp(math.multiply(math.i, math.multiply(4 * w, chi))),
                        math.square(math.subtract(k, chi))
                    ),
                    math.square(math.sum(k, chi))
                )
            )
        )
    )
}

function psi(w, h, m, e, i) {
    if (i <= -w / 2) {
        return math.abs(
            math.sum(
                math.exp(math.multiply(math.i, k(m, e) * i)),
                math.multiply(
                    a2(chi(m, e, h), k(m, e), w / 2),
                    math.exp(math.multiply(math.i, -1 * k(m, e) * i))
                )
            )
        )
    }
    else if (i <= w / 2) {
        return math.abs(
            math.sum(
                math.multiply(
                    a3(chi(m, e, h), k(m, e), w / 2),
                    math.exp(math.multiply(math.i, math.multiply(chi(m, e, h), i)))
                ),
                math.multiply(
                    a4(chi(m, e, h), k(m, e), w / 2),
                    math.exp(math.multiply(math.i, math.multiply(chi(m, e, h), -i)))
                )
            )
        )
    }
    else {
        return math.abs(
            math.multiply(
                a5(chi(m, e, h), k(m, e), w / 2),
                math.exp(math.multiply(math.i, k(m, e) * i))
            )
        )
    }
}

var d, w, m, e;


function update() {
    h = +height.value;
    w = +width.value;
    m = +mass.value;
    e = +energy.value;

    barrier.attr("x", x(-w / 2)).attr("width", w * W / 20).attr("y", y(h)).attr("height", h * H / 80);
    dashed.attr("y1", y(e)).attr("y2", y(e));

    var points = []
    for (var i = -10; i < 10; i += 0.01) {
        points.push([x(i), y(3 * psi(w, h, m, e, i) ** 2 + e)]);
    }
    wave.attr("d", d3.line()(points));
}

d3.select("#height").on("input", update);
d3.select("#width").on("input", update);
d3.select("#mass").on("input", update);
d3.select("#energy").on("input", update);
d3.selectAll(".tick text").attr("class", "axis-label")

update();