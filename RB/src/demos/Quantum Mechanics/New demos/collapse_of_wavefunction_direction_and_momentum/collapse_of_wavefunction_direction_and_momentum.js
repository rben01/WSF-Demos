const SVG = d3.select("#svg"),
  START = d3.select("#start"),
  RESET = d3.select("#reset"),
  MASS = d3.select("#mass"),
  XPREC = d3.select("xprec"),
  PPREC = d3.select("pprec"),
  W = 600,
  H = 700;

var x1 = d3.scaleLinear().range([0, W]).domain([-10, 10]),
  x2 = d3.scaleLinear().range([0, W]).domain([-10, 10]),
  y = d3.scaleLinear().range([H, 0]).domain([0, 2]),
  a = 0,
  b = 0,
  d = 0.17,
  m = 1,
  xp = 0.2,
  pp = 2.5,
  t = 0.04,
  paused = true,
  gaussian,
  psi,
  phi,
  prevTimestampMS;

g1 = SVG.append("g").attr("transform", `translate(50, 25)`);
var xaxis1 = g1
  .append("g")
  .attr("class", "axis")
  .attr("transform", `translate(0, ${H})`)
  .call(d3.axisBottom(x1).ticks(5));
g1.append("g")
  .attr("class", "axis")
  .attr("transform", `translate(${W / 2}, 0)`)
  .call(d3.axisLeft(y).tickValues([0.4, 0.8, 1.2, 1.6, 2.0]));
var psi_path = g1
  .append("path")
  .attr("fill", "none")
  .attr("stroke", "#5df")
  .attr("stroke-width", 5);

var g2 = SVG.append("g").attr("transform", `translate(${100 + W}, 25)`),
  xaxis2 = g2
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(0, ${H})`)
    .call(d3.axisBottom(x2).ticks(5));
g2.append("g")
  .attr("class", "axis")
  .attr("transform", `translate(${W / 2}, 0)`)
  .call(d3.axisLeft(y).tickValues([0.4, 0.8, 1.2, 1.6, 2.0]));
var phi_path = g2
  .append("path")
  .attr("fill", "none")
  .attr("stroke", "#5df")
  .attr("stroke-width", 5);

function getPsi(d, a, b, m, t) {
  var sigma = (d * Math.sqrt(1 + (t / (m * d ** 2)) ** 2)) / Math.sqrt(2);
  return function (x) {
    return (
      Math.exp(-((x - a + (b * t) / m) ** 2) / (2 * sigma ** 2)) /
      (Math.sqrt(2 * Math.PI) * sigma)
    );
  };
}

function getPhi(d, b) {
  var sigma = 1 / (d * Math.sqrt(2));
  return function (x) {
    return (
      Math.exp(-((x - b) ** 2) / (2 * sigma ** 2)) /
      (Math.sqrt(2 * Math.PI) * sigma)
    );
  };
}

function start() {
  START.text("Pause");
  START.on("click", pause);

  function update(timestampMS) {
    if (prevTimestampMS == undefined) {
      prevTimestampMS = timestampMS;
    }

    const elapsedMS = timestampMS - prevTimestampMS;
    prevTimestampMS = timestampMS;

    t += elapsedMS / 10000;
    updateGraph();

    experimentAnimationFrame = window.requestAnimationFrame(update);
  }
  experimentAnimationFrame = window.requestAnimationFrame(update);
}

function updateGraph() {
  psi = getPsi(d, a, b, m, t);
  phi = getPhi(d, b);
  var ar = [],
    ar2 = [];
  for (
    var i = x1.domain()[0];
    i < x1.domain()[1];
    i += (x1.domain()[1] - x1.domain()[0]) / 1000
  ) {
    ar.push([x1(i), y(psi(i))]);
  }
  for (
    var j = x2.domain()[0];
    j < x2.domain()[1];
    j += (x2.domain()[1] - x2.domain()[0]) / 1000
  ) {
    ar2.push([x2(i), y(phi(i))]);
  }
  psi_path.attr("d", d3.line()(ar));
  phi_path.attr("d", d3.line()(ar2));
}

function measure_x() {
  var sigma = (d * Math.sqrt(1 + (t / (m * d ** 2)) ** 2)) / Math.sqrt(2),
    u1 = Math.random(),
    u2 = Math.random();
  a = sigma * Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2 * Math.PI * u2) + a;
  b = 0;
  d = Math.sqrt(2);
  t = 0.04;
  var xmax = Math.ceil(Math.abs(a) / 10) * 10;
  x1.domain([-xmax, xmax]);
  xaxis1.call(d3.axisBottom(x1).ticks(5));
  d3.selectAll(".tick text").attr("class", "axis-label");
  prevTimestampMS = undefined;
  updateGraph();
}

function measure_p() {
  var sigma = 1 / (0.04 * Math.sqrt(2)),
    u1 = Math.random(),
    u2 = Math.random();
  a = 0;
  b = sigma * Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2 * Math.PI * u2) + b;
  d = 1 / Math.sqrt(2);
  t = 0.04;
  prevTimestampMS = undefined;
  var xmax = Math.ceil(Math.abs(b) / 10) * 10;
  x2.domain([-xmax, xmax]);
  xaxis2.call(d3.axisBottom(x2).ticks(5));
  d3.selectAll(".tick text").attr("class", "axis-label");
  updateGraph();
}

function pause() {
  START.text("Resume");
  START.on("click", start);
  window.cancelAnimationFrame(experimentAnimationFrame);
}

function reset() {
  START.text("Start");
  START.on("click", start);
  a = 0;
  b = 0;
  d = 0.17;
  t = 0.04;
  prevTimestampMS = undefined;
  window.cancelAnimationFrame(experimentAnimationFrame);
  x1.domain([-10, 10]);
  xaxis1.call(d3.axisBottom(x1).ticks(5));
  d3.selectAll(".tick text").attr("class", "axis-label");
  updateGraph();
}

updateGraph();
START.on("click", start);
RESET.on("click", reset);
d3.select("#measure_x").on("click", measure_x);
d3.select("#measure_p").on("click", measure_p);
MASS.on("input", () => {
  m = MASS.node().value;
  updateGraph();
});
XPREC.on("input", () => {
  xp = XPREC.node().value;
  updateGraph();
});
PPREC.on("input", () => {
  pp = PPREC.node().value;
  updateGraph();
});
d3.selectAll(".tick text").attr("class", "axis-label");
