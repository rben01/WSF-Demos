const SVG = d3.select("#svg"),
  PARSER = math.parser(),
  LINE = d3.line(),
  WAVENUMBER = document.getElementById("wavenumber"),
  WIDTH = document.getElementById("width"),
  HEIGHT = document.getElementById("height"),
  W = 650,
  H = 400;

var xscale = d3.scaleLinear().range([0, W]).domain([-3, 3]),
  y = d3.scaleLinear().range([H, 0]).domain([-2, 2]),
  g1 = SVG.append("g").attr("transform", `translate(${W + 50}, 25)`),
  g2 = SVG.append("g").attr("transform", `translate(15, ${H + 50})`),
  g3 = SVG.append("g").attr("transform", `translate(${W + 50}, ${H + 50})`),
  x1 = g1
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(0, ${H / 2})`)
    .call(d3.axisBottom(xscale).tickValues([-3, -2, -1, 1, 2, 3])),
  x2 = g2
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(0, ${H / 2})`)
    .call(d3.axisBottom(xscale).tickValues([-3, -2, -1, 1, 2, 3])),
  x3 = g3
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(0, ${H / 2})`)
    .call(d3.axisBottom(xscale).tickValues([-3, -2, -1, 1, 2, 3])),
  y1 = g1
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(${W / 2}, 0)`)
    .call(d3.axisLeft(y).tickValues([-2, -1, 1, 2])),
  y2 = g2
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(${W / 2}, 0)`)
    .call(d3.axisLeft(y).tickValues([-2, -1, 1, 2])),
  y3 = g3
    .append("g")
    .attr("class", "axis")
    .attr("transform", `translate(${W / 2}, 0)`)
    .call(d3.axisLeft(y).tickValues([-2, -1, 1, 2])),
  l1 = g1
    .append("path")
    .attr("fill", "none")
    .attr("stroke", "#5df")
    .attr("stroke-width", 5),
  l2 = g2
    .append("path")
    .attr("fill", "none")
    .attr("stroke", "#5df")
    .attr("stroke-width", 5),
  l3 = g3
    .append("path")
    .attr("fill", "none")
    .attr("stroke", "#5df")
    .attr("stroke-width", 5);

function psi(x, k, w, h) {
  PARSER.evaluate(`x = ${x}`);
  PARSER.evaluate(`k = ${k}`);
  PARSER.evaluate(`w = ${w}`);
  PARSER.evaluate(`h = ${h}`);
  if (x > w) {
    return PARSER.evaluate(
      `((-4) 
                e^((-i) k * w + 
                  i * (1/1000 + 
                    sqrt(2) 
                     sqrt(-h + k^2/2)) * w + 
                  i k * (x)) k * (1/1000 + 
                 sqrt(2) 
                  sqrt(-h + k^2/
                     2)))/(-k^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-h + k^2/
                      2)) * w) k^2 - 
               2 k * (1/1000 + 
                sqrt(2) sqrt(-h + k^2/2)) - 2 
               e^((2 i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-h + k^2/
                      2)) * w) k * (1/1000 + 
                sqrt(2) sqrt(-h + k^2/2)) - (1/1000 + 
                sqrt(2) sqrt(-h + k^2/2))^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-h + k^2/
                      2)) * w) (1/1000 + 
                  sqrt(2) 
                   sqrt(-h + k^2/
                      2))^2)`
    );
    //((-4)e^((-i) k * w +i * (1/1000 +sqrt(2)sqrt(-h + k^2/2)) * w +i k x) k * (1/1000 +sqrt(2)sqrt(-h + k^2/2)))/(-k^2 +e^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) * w) k^2 -2 k * (1/1000 +sqrt(2) sqrt(-h + k^2/2)) - 2E^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) * w) k * (1/1000 +sqrt(2) sqrt(-h + k^2/2)) - (1/1000 +sqrt(2) sqrt(-h + k^2/2))^2 +e^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) * w) (1/1000 +sqrt(2)sqrt(-h+k^2/  2)^2)
  } else if (x < 0) {
    return PARSER.evaluate(
      `e ^ (i * k * (x)) +
        ((-1 + e ^ (2 * i * (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) * w)) *
            (k ^ 2 - (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) ^ 2)) /
            (e ^ (i * k * (x)) *
                (-(k ^ 2) +
                    e ^ (2 * i * (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) * w) *
                        k ^ 2 -
                    2 * k * (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) -
                    2 *
                        e ^ (2 * i * (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) * w) *
                        k *
                        (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) -
                    (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) ^ 2 +
                    e ^ (2 * i * (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) * w) *
                        (1 / 1000 + sqrt(2) * sqrt(-h + k ^ 2 / 2)) ^ 2))`
    );
  } else {
    return PARSER.evaluate(
      `(2 * e^((2 * i) (1/1000 + 
                    sqrt(2) 
                     sqrt(-h + k^2/
                     2)) * w - 
                  i * (1/1000 + 
                   sqrt(2) 
                    sqrt(-h + k^2/
                     2)) * (x)) * k * ((-1)/
                  1000 + k - sqrt(2) 
                 sqrt(-h + k^2/
                    2)))/(-k^2 + 
               e^((2 * i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-h + k^2/
                     2)) * w) * k^2 - 
               2 * k * (1/1000 + 
                sqrt(2) * sqrt(-h + k^2/2)) - 2 * 
               e^((2 * i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-h + k^2/
                     2)) * w) * k * (1/1000 + 
                sqrt(2) * sqrt(-h + k^2/2)) - (1/1000 + 
                sqrt(2) * sqrt(-h + k^2/2))^2 + 
               e^((2 * i) * (1/1000 + 
                   sqrt(2) *
                    sqrt(-h + k^2/
                     2)) * w) * (1/1000 + 
                  sqrt(2) * sqrt(-h + k^2/2))^2) - (2 *
               e^(i * (1/1000 + 
                  sqrt(2) 
                   sqrt(-h + k^2/
                     2)) * (x)) * k * (
                1/1000 + k + 
                sqrt(2) *
                 sqrt(-h + k^2/
                    2)))/(-k^2 + 
              e^((2 * i) * (1/1000 + 
                  sqrt(2) *
                   sqrt(-h + k^2/
                     2)) * w) * k^2 - 
              2 * k * (1/1000 + 
               sqrt(2) * sqrt(-h + k^2/2)) - 2 *
              e^((2 * i) * (1/1000 + 
                 sqrt(2) *
                  sqrt(-h + k^2/
                     2)) * w) * k * (1/1000 + 
               sqrt(2) * sqrt(-h + k^2/2)) - (1/1000 + 
               sqrt(2) * sqrt(-h + k^2/2))^2 + 
              e^((2 * i) * (1/1000 + 
                  sqrt(2) *
                   sqrt(-h + k^2/
                     2)) * w) * (1/1000 + 
                 sqrt(2) * sqrt(-h + k^2/2))^2)`
    );
  }
}

function update() {
  k = +WAVENUMBER.value;
  w = +WIDTH.value;
  h = +HEIGHT.value;

  var ar1 = [];
  var ar2 = [];
  var ar3 = [];
  for (var i = 0; i < 1000; i += 1) {
    x = -3 + (6 * i) / 1000;
    e = psi(x, k, w, h);
    ar1.push([xscale(x), y(PARSER.evaluate("abs(e)"))]);
    ar2.push([xscale(x), y(PARSER.evaluate("re(e)"))]);
    ar3.push([xscale(x), y(PARSER.evaluate("im(e)"))]);
  }
  l1.attr("d", LINE(ar1));
  l2.attr("d", LINE(ar2));
  l3.attr("d", LINE(ar3));
}

d3.select("#wavenumber").on("input", update);
d3.select("#width").on("input", update);
d3.select("#height").on("input", update);
d3.selectAll(".tick text").attr("class", "axis-label");
$(".controls-container").draggable();

update();
