const W = 1350,
    H = 750,
    svg = d3.select("#svg"),
    g1 = svg.append("g").attr("transform", `translate(25, 25)`),
    g2 = svg.append("g").attr("transform", `translate(${W / 2 + 25}, 25)`),
    x1 = d3.scaleLinear().domain([-3, 3]).range([0, W / 2 - 100]),
    y1 = d3.scaleLinear().domain([-4, 4]).range([H - 50, 0]),
    x2 = d3.scaleLinear().domain([0, 9]).range([0, W / 2 - 100]),
    y2 = d3.scaleLinear().domain([-2, 2]).range([H - 50, 0]),
    step = g1.append("path").style("stroke", "white").style("stroke-width", 4).attr("d", `M 0,${y1(-1.5)} L ${x1(-1)},${y1(-1.5)} L ${x1(-1)},${y1(1.5)} L ${x1(1)},${y1(1.5)} L ${x1(1)},${y1(-1.5)} L ${x1(3)},${y1(-1.5)}`),
    sumline = g1.append("path").style("stroke", "#5df").style("stroke-width", 4).style("fill", "none"),
    ampline = g2.append("path").style("stroke", "#5df").style("stroke-width", 3).style("fill", "none").style("stroke-dasharray", "15 15"),
    xax1 = g1.append("g").attr("class", "axis").attr("transform", `translate(0, ${H / 2 - 25})`).call(d3.axisBottom(x1).tickValues([-3, -2, -1, 1, 2, 3])),
    yax1 = g1.append("g").attr("class", "axis").attr("transform", `translate(${W / 4 - 50})`).call(d3.axisLeft(y1).tickValues([-4, -2, 2, 4])),
    xax2 = g2.append("g").attr("class", "axis").attr("transform", `translate(0, ${H / 2 - 25})`).call(d3.axisBottom(x2).tickValues([1, 2, 3, 4, 5, 6, 7, 8, 9])),
    yax2 = g2.append("g").attr("class", "axis").call(d3.axisLeft(y2).tickValues([-2, -1, 1, 2])),
    modes = [document.getElementById("mode1"),
    document.getElementById("mode2"),
    document.getElementById("mode3"),
    document.getElementById("mode4"),
    document.getElementById("mode5"),
    document.getElementById("mode6"),
    document.getElementById("mode7"),
    document.getElementById("mode8"),
    document.getElementById("mode9")],
    mlines = [
        g2.append("line").style("stroke", "white").attr("x1", x2(1)).attr("x2", x2(1)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(2)).attr("x2", x2(2)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(3)).attr("x2", x2(3)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(4)).attr("x2", x2(4)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(5)).attr("x2", x2(5)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(6)).attr("x2", x2(6)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(7)).attr("x2", x2(7)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(8)).attr("x2", x2(8)).attr("y1", H / 2 - 25).style("stroke-width", 3),
        g2.append("line").style("stroke", "white").attr("x1", x2(9)).attr("x2", x2(9)).attr("y1", H / 2 - 25).style("stroke-width", 3)
    ];

var mode_vals;
function update() {
    mode_vals = [];
    for (var i = 0; i < 9; i++) {
        mode_vals.push(modes[i].value);
        mlines[i].attr("y2", y2(modes[i].value));
    }

    var d = [];
    var y;
    for (var i = -3; i < 3; i += 0.01) {
        y = 0;
        for (var n = 0; n < 9; n++) {
            y += mode_vals[n] * Math.cos(Math.PI * (n + 1) * i / 2);
        }
        d.push([x1(i), y1(y)]);
    }
    sumline.attr("d", d3.line()(d));

    d = [];
    for (var i = 1; i < 9; i += 0.01) {
        d.push([x2(i), y2(6 / (Math.PI * i) * Math.sin(Math.PI * i / 2))]);
    }
    ampline.attr("d", d3.line()(d));
}

for (var i = 1; i < 10; i++) {
    d3.select(`#mode${i}`).on("input", update);
}
d3.selectAll(".tick text").attr("class", "axis-label");

update();