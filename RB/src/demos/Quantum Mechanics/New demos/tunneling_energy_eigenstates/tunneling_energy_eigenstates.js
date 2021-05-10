const SVG = d3.select("#svg"),
  PARSER = math.parser(),
  WAVENUMBER = d3.select("#wavenumber"),
  WIDTH = d3.select("#width"),
  HEIGHT = d3.select("#height"),
  W = 650,
  H = 650;

var x1 = d3.scaleLinear().range([0, W]).domain([-3, 3]),
  x2 = d3.scaleLinear().range([0, W]).domain([-3, 3]),
  y = d3.scaleLinear().range([H, 0]).domain([-2, 2]);

function psi(x, k, w, h) {
  if (x > w) {
    return PARSER.evaluate(
      `((-4) 
                e^((-i) ${k} ${w} + 
                  i (1/1000 + 
                    sqrt(2) 
                     sqrt(-${h} + ${k}^2/2)) ${w} + 
                  i ${k} ${x}) ${k} (1/1000 + 
                 sqrt(2) 
                  sqrt(-${h} + ${k}^2/
                     2)))/(-${k}^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-${h} + ${k}^2/
                      2)) ${w}) ${k}^2 - 
               2 ${k} (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2)) - 2 
               e^((2 i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                      2)) ${w}) ${k} (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2)) - (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2))^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-${h} + ${k}^2/
                      2)) ${w}) (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                      2))^2)`
    );
    //((-4)e^((-i) k w +i (1/1000 +sqrt(2)sqrt(-h + k^2/2)) w +i k x) k (1/1000 +sqrt(2)sqrt(-h + k^2/2)))/(-k^2 +e^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) w) k^2 -2 k (1/1000 +sqrt(2) sqrt(-h + k^2/2)) - 2E^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) w) k (1/1000 +sqrt(2) sqrt(-h + k^2/2)) - (1/1000 +sqrt(2) sqrt(-h + k^2/2))^2 +e^((2 i) (1/1000 +sqrt(2)sqrt(-h + k^2/2)) w) (1/1000 +sqrt(2)sqrt(-h+k^2/  2)^2)
  } else if (x < 0) {
    return PARSER.evaluate(
      `e^(i ${k} ${x}) + ((-1 + 
                    e^((2 i) (1/1000 + 
                       sqrt(2) 
                        sqrt(-${h} + ${k}^2/
                        2)) ${w})) (${k}^2 - (1/1000 + 
                     sqrt(2) sqrt(-${h} + ${k}^2/2))^2))/(
                  e^(i ${k} ${x}) (-${k}^2 + 
                   e^((2 i) (1/1000 + 
                       sqrt(2) 
                        sqrt(-${h} + ${k}^2/
                        2)) ${w}) ${k}^2 - 
                   2 ${k} (1/1000 + 
                    sqrt(2) sqrt(-${h} + ${k}^2/2)) - 2 
                   e^((2 i) (1/1000 + 
                      sqrt(2) 
                       sqrt(-${h} + ${k}^2/
                        2)) ${w}) ${k} (1/1000 + 
                    sqrt(2) sqrt(-${h} + ${k}^2/2)) - (1/1000 + 
                    sqrt(2) sqrt(-${h} + ${k}^2/2))^2 + 
                   e^((2 i) (1/1000 + 
                       sqrt(2) 
                        sqrt(-${h} + ${k}^2/
                        2)) ${w}) (1/1000 + 
                      sqrt(2) 
                       sqrt(-${h} + ${k}^2/
                        2))^2))`
    );
  } else {
    return PARSER.evaluate(
      `(2 e^((2 i) (1/1000 + 
                    sqrt(2) 
                     sqrt(-${h} + ${k}^2/
                     2)) ${w} - 
                  i (1/1000 + 
                   sqrt(2) 
                    sqrt(-${h} + ${k}^2/
                     2)) ${x}) ${k} ((-1)/
                  1000 + ${k} - sqrt(2) 
                 sqrt(-${h} + ${k}^2/
                    2)))/(-${k}^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-${h} + ${k}^2/
                     2)) ${w}) ${k}^2 - 
               2 ${k} (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2)) - 2 
               e^((2 i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                     2)) ${w}) ${k} (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2)) - (1/1000 + 
                sqrt(2) sqrt(-${h} + ${k}^2/2))^2 + 
               e^((2 i) (1/1000 + 
                   sqrt(2) 
                    sqrt(-${h} + ${k}^2/
                     2)) ${w}) (1/1000 + 
                  sqrt(2) sqrt(-${h} + ${k}^2/2))^2) - (2 
               e^(i (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                     2)) ${x}) ${k} (
                1/1000 + ${k} + 
                sqrt(2) 
                 sqrt(-${h} + ${k}^2/
                    2)))/(-${k}^2 + 
              e^((2 i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                     2)) ${w}) ${k}^2 - 
              2 ${k} (1/1000 + 
               sqrt(2) sqrt(-${h} + ${k}^2/2)) - 2 
              e^((2 i) (1/1000 + 
                 sqrt(2) 
                  sqrt(-${h} + ${k}^2/
                     2)) ${w}) ${k} (1/1000 + 
               sqrt(2) sqrt(-${h} + ${k}^2/2)) - (1/1000 + 
               sqrt(2) sqrt(-${h} + ${k}^2/2))^2 + 
              e^((2 i) (1/1000 + 
                  sqrt(2) 
                   sqrt(-${h} + ${k}^2/
                     2)) ${w}) (1/1000 + 
                 sqrt(2) sqrt(-${h} + ${k}^2/2))^2)`
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
    x = -3 + 6 / 1000;
    e = psi(x, k, w, h);
    ar1.push((x, PARSER.evaluate("re(e)")));
    ar2.push((x, PARSER.evaluate("im(e)")));
    ar3.push((x, PARSER.evaluate("abs(e)")));
  }
}

WAVENUMBER.on("input", update);
WIDTH.on("input", update);
HEIGHT.on("input", update);
d3.selectAll(".tick text").attr("class", "axis-label");
$(".controls-container").draggable();

update();
