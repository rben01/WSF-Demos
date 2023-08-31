var svg = d3.select("#svg"),
  buttons = d3.selectAll("button"),
  w = 500,
  h = 500,
  n = 1,
  sumpath,
  x = d3
    .scaleLinear()
    .range([-w / 2, w / 2])
    .domain([-3, 3]),
  y = d3
    .scaleLinear()
    .range([h / 2, -h / 2])
    .domain([-3, 3]),
  equation = document.getElementById("eqn-container");
equation.innerHTML = "y = 0";

var g1 = svg
  .append("g")
  .attr("transform", "translate(" + w / 2 + ", " + (50 + h / 2) + ")");
g1.append("g")
  .attr("class", "axis")
  .call(d3.axisBottom(x).tickValues([-3, -2, -1, 1, 2, 3]));
g1.append("g")
  .attr("class", "axis")
  .call(d3.axisLeft(y).tickValues([-3, -2, -1, 1, 2, 3]));
var l1 = g1
  .append("path")
  .attr("fill", "none")
  .style("stroke", "#5df")
  .style("stroke-width", 3);

var g2 = svg
  .append("g")
  .attr(
    "transform",
    "translate(" + (100 + (3 * w) / 2) + ", " + (50 + h / 2) + ")"
  );
g2.append("g")
  .attr("class", "axis")
  .call(d3.axisBottom(x).tickValues([-3, -2, -1, 1, 2, 3]));
g2.append("g")
  .attr("class", "axis")
  .call(d3.axisLeft(y).tickValues([-3, -2, -1, 1, 2, 3]));
var l3 = g2
  .append("path")
  .attr("fill", "none")
  .attr("stroke", "#f3c002")
  .style("stroke-width", 3);
var l2 = g2
  .append("path")
  .attr("fill", "none")
  .style("stroke", "#5df")
  .style("stroke-width", 3);

function fourier(n) {
  var ar = [];
  for (var i = -3; i < 3; i += 6 / 1000) {
    ar.push([x(i), y(((-1) ** ((n - 1) / 2) * Math.cos(n * Math.PI * i)) / n)]);
  }
  return ar;
}

function setn(x) {
  n = x;
  buttons.style("background", "#FCFCFC");
  d3.select("#n" + n).style("background-color", "darkgrey");
  l1.attr("d", d3.line()(fourier(n)));
}

function add() {
  var delta = fourier(n);
  for (var i = 0; i < sumpath.length; i++) {
    sumpath[i][1] += delta[i][1];
  }
  var path = d3.line()(sumpath);
  l3.attr("d", path);
  var length = l3.node().getTotalLength();
  l3.attr("stroke-dasharray", length + " " + length).attr(
    "stroke-dashoffset",
    length
  );
  l3.transition()
    .ease(d3.easeLinear)
    .duration(4000)
    .attr("stroke-dashoffset", 0);
  l2.transition()
    .ease(d3.easeLinear)
    .delay(4000)
    .duration(2000)
    .attr("d", path);

  var sign = (-1) ** ((n - 1) / 2);
  if (equation.innerHTML == "y = 0") {
    equation.innerHTML =
      "y = " + katex.renderToString(`\\frac{\\cos{${n}\\pi x}}{${n}}`);
  } else {
    equation.innerHTML =
      equation.innerHTML +
      katex.renderToString(
        `${sign == 1 ? "+" : "-"}\\frac{\\cos{${n}\\pi x}}{${n}}`
      );
  }
}

function reset() {
  sumpath = [];
  for (var i = -3; i < 3; i += 6 / 1000) {
    sumpath.push([(w * i) / 6, 0]);
  }
  l2.attr("d", d3.line()(sumpath));
  l3.attr("d", "");
  equation.innerHTML = "y = 0";
}

function addRemainder() {
  l3.attr("d", "");
  n = 13;
  var delta = fourier(n);
  for (var i = 0; i < sumpath.length; i++) {
    sumpath[i][1] += delta[i][1];
  }
  var sign = (-1) ** ((n - 1) / 2);
  equation.innerHTML =
    equation.innerHTML +
    katex.renderToString(
      `${sign == 1 ? "+" : "-"}\\frac{\\cos{${n}\\pi x}}{${n}}`
    );
  l2.transition()
    .ease(d3.easeLinear)
    .duration(2000)
    .attr("d", d3.line()(sumpath))
    .on("end", function repeat() {
      n += 2;
      if (n > 21) {
        return;
      }
      delta = fourier(n);
      for (var i = 0; i < sumpath.length; i++) {
        sumpath[i][1] += delta[i][1];
      }
      sign = (-1) ** ((n - 1) / 2);
      equation.innerHTML =
        equation.innerHTML +
        katex.renderToString(
          `${sign == 1 ? "+" : "-"}\\frac{\\cos{${n}\\pi x}}{${n}}`
        );
      l2.transition()
        .ease(d3.easeLinear)
        .duration(2000)
        .attr("d", d3.line()(sumpath))
        .on("end", repeat);
    });
}

d3.selectAll(".tick text").attr("class", "axis-label");
reset();
setn(1);
