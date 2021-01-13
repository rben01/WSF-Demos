const W = 1300,
    H = 750,
    svg = d3.select("#svg"),
    g1 = svg.append("g").attr("transform", `translate(50, 25)`),
    g2 = svg.append("g").attr("transform", `translate(${W / 2 + 50}, 25)`),
    x1 = d3.scaleLinear().domain([0, 10]).range([0, W / 2 - 100]),
    y1 = d3.scaleLinear().domain([0, 2]).range([H - 50, 0]),
    x2 = d3.scaleLinear().domain([-6, 6]).range([0, W / 2 - 100]),
    y2 = d3.scaleLinear().domain([0, 1]).range([H - 50, 0]),
    xax1 = g1.append("g").attr("class", "axis").attr("transform", `translate(0, ${H - 50})`).call(d3.axisBottom(x1).ticks(6)),
    yax1 = g1.append("g").attr("class", "axis").call(d3.axisLeft(y1).tickValues([0.5, 1.0, 1.5, 2.0])),
    xax2 = g2.append("g").attr("class", "axis").attr("transform", `translate(0, ${H - 50})`).call(d3.axisBottom(x2).ticks(5)),
    yax2 = g2.append("g").attr("class", "axis").attr("transform", `translate(${W / 4 - 50}, 0)`).call(d3.axisLeft(y2).tickValues([0.2, 0.4, 0.6, 0.8, 1.0])),
    aline = g1.append("line").style("stroke", "white").style("stroke-width", 3).attr("y1", H - 25).attr("y2", 0).attr("x1", x1(1)).attr("x2", x1(1)),
    dline = g2.append("path").style("stroke", "#5df").style("fill", "#5df").style("fill-opacity", 0.5),
    alpha = document.getElementById("alpha"),
    label = document.getElementById("label");

var a;

function update() {
    a = alpha.value;
    aline.attr("x1", x1(a)).attr("x2", x1(a));
    var points = [];
    for (var i = -6; i < 6; i += 0.01) {
        points.push([x2(i), y2(math.e ** (-a * ((i) ** 2)))]);
    }
    dline.attr("d", d3.line()(points));
    label.innerHTML = a;
}

function grab_data() {
    g1.append("line").style("stroke", "#5df").style("stroke-width", 3).attr("x1", x1(a)).attr("x2", x1(a)).attr("y1", y1(0)).attr("y2", y1(math.sqrt(math.PI / a)));
    g1.append("circle").style("fill", "#5df").attr("cx", x1(a)).attr("cy", y1(math.sqrt(math.PI / a))).attr("r", 7);
}

var fpoints = [];
for (var i = 0.8; i < 10; i += 0.01) {
    fpoints.push([x1(i), y1(math.sqrt(math.PI / i))])
}
g1.append("path").style("fill", "none").style("stroke", "white").style("stroke-width", 3).attr("stroke-dasharray", "25 25").attr("d", d3.line()(fpoints));

d3.select("#alpha").on("input", update);
d3.select("#grab").on("click", grab_data);
d3.selectAll(".tick text").attr("class", "axis-label");
update();