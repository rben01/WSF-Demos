const svg = d3.select("#svg"),
    buttons = d3.selectAll("button"),
    w = 500,
    h = 500,
    x1 = d3.scaleLinear().range([0, w]).domain([0, 1]),
    y1 = d3.scaleLinear().range([h, 0]).domain([0, 7]),
    x2 = d3.scaleLinear().range([0, w]).domain([0, 1]),
    y2 = d3.scaleLinear().range([h / 2, -h / 2]).domain([-0.3, 0.3]);

var g1 = svg.append("g").attr("transform", "translate(50, 50)");
g1.append("g").attr("class", "axis").attr("transform", `translate(0, ${h})`).call(d3.axisBottom(x1).ticks(6));
g1.append("g").attr("class", "axis").call(d3.axisLeft(y1).ticks(8));
var l1 = g1.append("path").attr("fill", "none").style("stroke", "#5df").attr("stroke-width", 3);
var l2 = g1.append("path").attr("fill", "none").style("stroke", "#5df").attr("stroke-width", 3).style("stroke-dasharray", "25 25").style("stroke-opacity", 0.5);

var g2 = svg.append("g").attr("transform", `translate(${150 + w}, ${50 + h / 2})`);
g2.append("g").attr("class", "axis").call(d3.axisBottom(x2).tickValues([0.2, 0.4, 0.6, 0.8, 1.0]));
g2.append("g").attr("class", "axis").call(d3.axisLeft(y2).tickValues([-0.2, -0.1, 0.1, 0.2]));
var bars = []
for (var i = 0; i < 20; i++) {
    bars.push(g2.append("rect").attr("x", x2(i * 0.05)).attr("y", y2(0)).attr("width", w / 20).attr("fill-opacity", 0.5));
}

// |sqrt(2)(exp(2itπ^2)sin(2πx)+exp(9itπ^2/2)sin(3πx)+exp(8itπ^2)sin(4πx))|^2/3
function f1(x, t) {
    return (
        math.divide(
            math.pow(math.abs(math.sum(
                math.multiply(
                    math.sqrt(2),
                    math.multiply(
                        math.exp(
                            math.multiply(
                                math.multiply(2, math.i),
                                math.multiply(math.pi ** 2, t),
                            )
                        ),
                        math.sin(math.multiply(math.multiply(2, math.pi), x))
                    )
                ),
                math.sum(
                    math.multiply(
                        math.sqrt(2),
                        math.multiply(
                            math.exp(
                                math.multiply(
                                    math.divide(math.multiply(9, math.i), 2),
                                    math.pi ** 2 * t
                                )
                            ),
                            math.sin(3 * math.pi * x)
                        )
                    ),
                    math.multiply(
                        math.sqrt(2),
                        math.multiply(
                            math.exp(
                                math.multiply(
                                    math.multiply(8, math.i),
                                    math.pi ** 2 * t
                                )
                            ),
                            math.sin(4 * math.pi * x)
                        )
                    )
                ))),
                2
            ),
            3
        )
    )
}

// |sqrt(2)(exp(2itπ^2)sin(2πx)+exp(9itπ^2/2)sin(3πx)+exp(25itπ^2/2)sin(5πx))|^2/2
function f2(x, t) {
    return (
        math.divide(
            math.pow(
                math.abs(
                    math.sum(
                        math.multiply(
                            math.multiply(
                                math.sqrt(2),
                                math.exp(
                                    math.multiply(
                                        math.multiply(2, math.i),
                                        math.pi ** 2 * t
                                    )
                                )
                            ),
                            math.sin(2 * math.pi * x)
                        ),
                        math.sum(
                            math.multiply(
                                math.multiply(
                                    math.sqrt(2),
                                    math.exp(
                                        math.multiply(
                                            math.divide(math.multiply(9, math.i), 2),
                                            math.pi ** 2 * t
                                        )
                                    )
                                ),
                                math.sin(3 * math.pi * x)
                            ),
                            math.multiply(
                                math.multiply(
                                    math.sqrt(2),
                                    math.exp(
                                        math.multiply(
                                            math.divide(math.multiply(25, math.i), 2),
                                            math.pi ** 2 * t
                                        )
                                    )
                                ),
                                math.sin(5 * math.pi * x)
                            )
                        )
                    )
                ),
                2
            ),
            2
        )
    )
}

// |sqrt(2)(exp(itπ^2/2)sin(2πx)+exp(8itπ^2)sin(4πx)+exp(25itπ^2/2)sin(5πx))|^2/2
function f3(x, t) {
    return (
        math.divide(
            math.pow(
                math.abs(
                    math.sum(
                        math.multiply(
                            math.sqrt(2),
                            math.multiply(
                                math.exp(math.multiply(math.i, t * math.pi ** 2 / 2)),
                                math.sin(2 * math.pi * x)
                            )
                        ),
                        math.sum(
                            math.multiply(
                                math.sqrt(2),
                                math.multiply(
                                    math.exp(math.multiply(math.i, 8 * t * math.pi ** 2)),
                                    math.sin(4 * math.pi * x)
                                )
                            ),
                            math.multiply(
                                math.sqrt(2),
                                math.multiply(
                                    math.exp(math.multiply(math.i, 25 * t * math.pi ** 2 / 2)),
                                    math.sin(5 * math.pi * x)
                                )
                            )
                        )
                    )
                ),
                2
            ),
            2
        )
    )
}

function setf(x) {
    if (x == 1) { f = f1; }
    else if (x == 2) { f = f2; }
    else { f = f3; }
    update();
}

function sett(x) {
    t = x;
    update();
}

function update() {
    var ar = [],
        ar2 = [];
    for (var i = 0; i < 1; i += 0.001) {
        ar.push([i, f(i, t)]);
        ar2.push([i, f(i, +t + 0.02)]);
    }

    var bh;
    for (var i = 0; i < 20; i++) {
        bh = y2(ar2.slice(50 * i, 50 * i + 50).reduce((a, b) => { return a + b[1] * 0.001 }, 0)
            - ar.slice(50 * i, 50 * i + 50).reduce((a, b) => { return a + b[1] * 0.001 }, 0));
        bars[i]
            .attr("y", bh > 0 ? y2(0) : bh)
            .attr(
                "height",
                math.abs(bh)
            )
            .attr("fill", bh > 0 ? "#5df" : "#f3c002");
    }

    ar = ar.map((val) => { return ([x1(val[0]), y1(val[1])]); })
    ar2 = ar2.map((val) => { return ([x1(val[0]), y1(val[1])]); })
    l1.attr("d", d3.line()(ar));
    l2.attr("d", d3.line()(ar2));
}

var f = f1,
    t = 0;

d3.selectAll(".tick text").attr("class", "axis-label");
d3.select("#w1").on("click", () => setf(1)).attr("button-checked", true);
d3.select("#w2").on("click", () => setf(2));
d3.select("#w3").on("click", () => setf(3));
update();
