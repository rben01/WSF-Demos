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
  source_distance_pixels = source_distance / meters_per_pixel;
(rs_pixels = parseInt(Math.round(rs / meters_per_pixel))),
  (x_range = 1280),
  (mid_x = x_range / 2),
  (y_range = 960),
  (mid_y = y_range / 2),
  (alpha = math.arctan(
    r / (observer_distance_pixels + source_distance_pixels) ** 2
  )),
  (theta = (2 * rs_pixels) / r),
  (offset =
    source_distance_pixels *
    (1 / Math.tan(Math.PI / 2 + alpha - theta) +
      1 / Math.tan(Math.PI / 2 - alpha)));

var r_sq = [],
  m = [],
  dx = [];

for (var i = 0; i < x_range; i++) {
  var col = [];
  var mcol = [];
  for (var j = 0; j < y_range; j++) {
    col.push((i - mid_x) ** 2 + (j - mid_y) ** 2);
    mcol.push((i - mid_x) / (j - mid_y));
  }
  r_sq.push(col);
  m.push(mcol);
  dx.push(i - mid_x);
}

x0 = math.matrix(math.range(0, x_range));
y0 = math.matrix(math.range(0, y_range));

var r = math.matrix(r_sq.map((L) => L.map(Math.sqrt)));
dx = math.matrix(dx);
var delta_x = math.round((-1 * offset * dx) / r);

var video = document.querySelector("#videoElement");

var x_prime = math.flatten(x0 + delta_x);
var y_prime = math.flatten(math.round(y0 + m * delta_x));
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
    this.c1.width = data.x_range;
    this.c1.height = data.y_range;
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
