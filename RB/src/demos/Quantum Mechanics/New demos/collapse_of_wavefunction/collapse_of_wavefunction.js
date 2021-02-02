const SVG = d3.select("#svg"),
  START = d3.select("#start"),
  RESET = d3.select("#reset"),
  MASS = d3.select("#mass"),
  W = 1200,
  H = 750;

var x = d3.scaleLinear().range([0, W]).domain([-10, 10]),
  y = d3.scaleLinear().range([H, 0]).domain([0, 2]),
  a = 0,
  m = 1,
  t = 0.02,
  paused = true,
  gaussian,
  prevTimestampMS;

g = SVG.append("g").attr("transform", `translate(50, 25)`);
var xaxis = g
  .append("g")
  .attr("class", "axis")
  .attr("transform", `translate(0, ${H})`)
  .call(d3.axisBottom(x).ticks(5));
g.append("g")
  .attr("class", "axis")
  .attr("transform", `translate(${W / 2}, 0)`)
  .call(d3.axisLeft(y).tickValues([0.4, 0.8, 1.2, 1.6, 2.0]));
var wave = g
  .append("path")
  .attr("fill", "none")
  .attr("stroke", "#5df")
  .attr("stroke-width", 5);

function getGaussian(d, t, m, a) {
  var sigma = (d * Math.sqrt(1 + (t / (m * d ** 2)) ** 2)) / Math.sqrt(2);
  return function (x) {
    return (
      Math.exp(-((x - a) ** 2) / (2 * sigma ** 2)) /
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
  gaussian = getGaussian(0.04, t, m, a);
  var ar = [];
  for (
    var i = x.domain()[0];
    i < x.domain()[1];
    i += (x.domain()[1] - x.domain()[0]) / 1000
  ) {
    ar.push([x(i), y(gaussian(i))]);
  }
  wave.attr("d", d3.line()(ar));
}

function measure() {
  var sigma = (0.04 * Math.sqrt(1 + (t / (m * 0.04 ** 2)) ** 2)) / Math.sqrt(2),
    u1 = Math.random(),
    u2 = Math.random();
  a = sigma * Math.sqrt(-2.0 * Math.log(u1)) * Math.cos(2 * Math.PI * u2) + a;
  var b = Math.ceil(Math.abs(a) / 10) * 10;
  x.domain([-b, b]);
  xaxis.call(d3.axisBottom(x).ticks(5));
  d3.selectAll(".tick text").attr("class", "axis-label");
  t = 0.02;
  prevTimestampMS = undefined;
  updateGraph();
}

function pause() {
  START.text("Resume");
  START.on("click", start);
  window.cancelAnimationFrame(experimentAnimationFrame);
}

function reset() {
  START.text("Start");
  a = 0;
  t = 0.02;
  prevTimestampMS = undefined;
  window.cancelAnimationFrame(experimentAnimationFrame);
  updateGraph();
}

updateGraph();
START.on("click", start);
RESET.on("click", reset);
d3.select("#measure").on("click", measure);
MASS.on("input", () => {
  m = MASS.node().value;
  updateGraph();
});
d3.selectAll(".tick text").attr("class", "axis-label");
