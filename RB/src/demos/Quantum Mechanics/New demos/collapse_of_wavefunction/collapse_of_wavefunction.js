const SVG = d3.select("#svg"),
  START = d3.select("#start"),
  RESET = d3.select("#reset"),
  W = 1200,
  H = 750;

var x = d3.scaleLinear().range([0, W]).domain([-10, 10]),
  y = d3.scaleLinear().range([H, 0]).domain([0, 2]),
  a = 0,
  m = 1,
  t = 0.02,
  paused = true,
  gaussian;

g = SVG.append("g").attr("transform", `translate(50, 25)`);
g.append("g")
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
  let prevTimestampMS;
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

function pause() {
  START.text("Resume");
  window.cancelAnimationFrame(experimentAnimationFrame);
}

function reset() {
  START.text("Start");
  a = 0;
  t = 0.02;
  window.cancelAnimationFrame(experimentAnimationFrame);
  updateGraph();
}

updateGraph();
START.on("click", start);
d3.select("#reset").on("click", reset);
d3.select("#measure").on("click", () => {
  a = get_gaussian(0.04, t, m, a);
});
d3.select("#mass").on("input", () => {
  m = this.value;
});
d3.selectAll(".tick text").attr("class", "axis-label");
