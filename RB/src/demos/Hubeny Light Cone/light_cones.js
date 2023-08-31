const WIDTH = 900,
    HEIGHT = 500,
    G = 6.674 * 10 ** (-20),
    g = d3.select("#svg").append("g").attr("transform", "translate(25,0)"),
    label = document.getElementById("label"),
    c = 299792, //km/s
    sm = 2 * 10 ** 30, //kg
    x = d3.scaleLinear().domain([0, 6000000]).range([0, WIDTH]),
    y = d3.scaleLinear().domain([0, 10]).range([HEIGHT, 0]),
    x_axis = d3.select("#svg").append("g").attr("class", "axis").attr("transform", "translate(25, " + HEIGHT + ")").call(d3.axisBottom(x).ticks(5)),
    y_axis = d3.select("#svg").append("g").attr("class", "axis").attr("transform", "translate(25, 0)").call(d3.axisLeft(y).tickValues([2, 4, 6, 8])),
    mass = document.getElementById("mass"),
    cone = g.append("path").style("stroke", "#5df").style("fill", "#5df").style("fill-opacity", 0.5).style("stroke-width", 3);

g.append("text")
    .attr("text-anchor", "middle")
    .attr("fill", "white")
    .attr("font-size", 15)
    .attr("x", WIDTH / 2)
    .attr("y", HEIGHT + 30)
    .text("Distance (km) from black hole");

g.append("text")
    .attr("fill", "white")
    .attr("text-anchor", "middle")
    .attr("font-size", 15)
    .attr("x", -HEIGHT / 2)
    .attr("y", -25)
    .attr("dy", ".75em")
    .attr("transform", "rotate(-90)")
    .text("Time (s)");

function update() {
    var m = +mass.value,
        d = 2970339.6653495594,
        s = `M 0 ${y(d / c)} L ${x(d)} ${HEIGHT}`;
    for (var t = 0.1; t < 10; t += 0.01) {
        d += c * 0.01 * Math.sqrt(1 - 2 * G * m * sm / (d * c ** 2));
        s += " L ";
        s += x(d);
        s += " ";
        s += y(t);
    }
    cone.attr("d", s);
    label.innerHTML = m;
}

d3.select("#mass").on("input", update);
update();