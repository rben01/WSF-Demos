const G = 6.67408 * 10 ** -11, //m^3 kg^-1 s^-2
  solar_mass = 1.989 * 10 ** 30, //kg
  black_hole_size = 100, //solar masses
  c = 299792458, //m/s
  observer_distance = 30000000, //m
  source_distance = 30000000, //m
  meters_per_pixel = 30000, //46845 at pi/4
  M = solar_mass * black_hole_size,
  rs = (2 * G * M) / c ** 2,
  observer_distance_pixels = observer_distance / meters_per_pixel,
  source_distance_pixels = source_distance / meters_per_pixel,
  rs_pixels = parseInt(Math.round(rs / meters_per_pixel)),
  x_range = 1280,
  mid_x = x_range / 2,
  y_range = 960,
  mid_y = y_range / 2;

var r_sq = [],
  m = [];

for (var i = 0; i < y_range; i++) {
  var row = [];
  var mrow = [];
  for (var j = 0; j < x_range; j++) {
    row.push((j - mid_x) ** 2 + (i - mid_y) ** 2);
    mrow.push((j - mid_x) / (i - mid_y));
  }
  r_sq.push(row);
  m.push(mrow);
}

var x0 = math.matrix(math.range(0, x_range)),
  y0 = math.matrix(math.range(0, y_range)),
  dx = math.subtract(x0, mid_x),
  m = math.matrix(m);

var r = r_sq.map((L) => L.map(Math.sqrt));

var alpha = math.atan(
    math.divide(r, (observer_distance_pixels + source_distance_pixels) ** 2)
  ),
  theta = math.map(r, (x) => (2 * rs_pixels) / x),
  offset = math.multiply(
    source_distance_pixels,
    math.add(
      math.map(
        math.tan(math.add(Math.PI / 2, math.subtract(alpha, theta))),
        (x) => 1 / x
      ),
      math.map(math.tan(math.subtract(Math.PI / 2, alpha)), (x) => 1 / x)
    )
  );

const divide = (X, y) => {
  for (let rowIndex = 0; rowIndex < X.length; rowIndex++) {
    const row = X[rowIndex];
    for (let colIndex = 0; colIndex < row.length; colIndex++) {
      const column = row[colIndex];
      // Supports y.length === 1 or y.length === row.length
      if (y.length === 1) {
        const subs = y[0];
        X[rowIndex][colIndex] = column / subs;
      } else if (y.length === row.length) {
        const subs = y[colIndex];
        X[rowIndex][colIndex] = column / subs;
      } else {
        throw Error(
          `Dimension of y ${y.length} and row ${row.length} are not compatible`
        );
      }
    }
  }
  return X;
};

const add = (X, y) => {
  for (let rowIndex = 0; rowIndex < X.length; rowIndex++) {
    const row = X[rowIndex];
    for (let colIndex = 0; colIndex < row.length; colIndex++) {
      const column = row[colIndex];
      // Supports y.length === 1 or y.length === row.length
      if (y.length === 1) {
        const subs = y[0];
        X[rowIndex][colIndex] = column + subs;
      } else if (y.length === row.length) {
        const subs = y[colIndex];
        X[rowIndex][colIndex] = column + subs;
      } else {
        throw Error(
          `Dimension of y ${y.length} and row ${row.length} are not compatible`
        );
      }
    }
  }
  return X;
};

const multiply = (X, y) => {
  for (let rowIndex = 0; rowIndex < X.length; rowIndex++) {
    const row = X[rowIndex];
    for (let colIndex = 0; colIndex < row.length; colIndex++) {
      const column = row[colIndex];
      // Supports y.length === 1 or y.length === row.length
      if (y.length === 1) {
        const subs = y[0];
        X[rowIndex][colIndex] = column * subs;
      } else if (y.length === row.length) {
        const subs = y[colIndex];
        X[rowIndex][colIndex] = column * subs;
      } else {
        throw Error(
          `Dimension of y ${y.length} and row ${row.length} are not compatible`
        );
      }
    }
  }
  return X;
};

const numerator = math.multiply(
  -1,
  math.dotMultiply(
    offset,
    math.transpose(
      dx._data.map((elem) => math.range(0, offset.length).map(() => elem))
    )
  )
);
const delta_x = math.round(math.dotDivide(numerator, r));

var video = document.querySelector("#videoElement");

var x_prime = math.flatten(
  math.add(math.range(0, 960).map(() => x0._data)._data, delta_x)
)._data;
var y_prime = math.flatten(
  math.round(
    math.add(
      math.transpose(math.range(0, 1280).map(() => y0._data)._data),
      math.dotMultiply(m, delta_x)
    )
  )
)._data;
var width = x_range;
var height = y_range;

var processor = {
  timerCallback: function () {
    this.computeFrame();
    var self = this;
    setTimeout(function () {
      self.timerCallback();
    }, 16); // roughly 60 frames per second
  },

  doLoad: function () {
    this.c1 = document.getElementById("canvas");
    this.c1.width = x_range;
    this.c1.height = y_range;
    this.ctx1 = this.c1.getContext("2d");
    this.width = width;
    this.height = height;
    var self = this;

    self.timerCallback();
  },

  computeFrame: function () {
    this.ctx1.drawImage(video, 0, 0, width, height);
    var frame = this.ctx1.getImageData(0, 0, width, height);
    var newframe = this.ctx1.getImageData(0, 0, width, height);
    var l = frame.data.length / 4;

    for (var i = 0; i < l; i++) {
      var j = i * 4;
      var x = x_prime[i];
      var y = y_prime[i];
      var p = width * y * 4 + x * 4;

      newframe.data[j + 0] = frame.data[p + 0];
      newframe.data[j + 1] = frame.data[p + 1];
      newframe.data[j + 2] = frame.data[p + 2];
      newframe.data[j + 3] = frame.data[p + 3];
    }
    this.ctx1.putImageData(newframe, 0, 0);

    return;
  },
};

var constraints = {
  audio: false,
  video: {
    facingMode: true,
  },
};

navigator.mediaDevices
  .getUserMedia(constraints)
  .then(function success(stream) {
    video.srcObject = stream;
  })
  .then(processor.doLoad());
