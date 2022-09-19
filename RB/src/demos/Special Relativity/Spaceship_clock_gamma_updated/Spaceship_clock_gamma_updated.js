var elem = document.getElementById("animate");
var tickstart = [];
var tickend = [];
var numerals = [];
for (i = 0; i < 60; i++) {
    tickstart.push([
        150 + 145 * Math.cos((i * Math.PI) / 30),
        200 + 145 * Math.sin((i * Math.PI) / 30),
    ]);
    if (i % 5 == 0) {
        tickend.push([
            150 + 130 * Math.cos((i * Math.PI) / 30),
            200 + 130 * Math.sin((i * Math.PI) / 30),
        ]);
        numerals.push([
            145 + 115 * Math.cos((i * Math.PI) / 30 - Math.PI / 3),
            205 + 115 * Math.sin((i * Math.PI) / 30 - Math.PI / 3),
        ]);
    } else {
        tickend.push([
            150 + 135 * Math.cos((i * Math.PI) / 30),
            200 + 135 * Math.sin((i * Math.PI) / 30),
        ]);
    }
}
var t = 0;
var etheta = -Math.PI / 2;
var rtheta = -Math.PI / 2;
var alpha = 1;
var interval;
const c = 671000000;
var speed = 1 / c;

//thanks stack overflow
function canvas_arrow(context, fromx, fromy, tox, toy) {
    var headlen = 10; // length of head in pixels
    var dx = tox - fromx;
    var dy = toy - fromy;
    var angle = Math.atan2(dy, dx);
    context.moveTo(fromx, fromy);
    context.lineTo(tox, toy);
    context.lineTo(
        tox - headlen * Math.cos(angle - Math.PI / 6),
        toy - headlen * Math.sin(angle - Math.PI / 6),
    );
    context.moveTo(tox, toy);
    context.lineTo(
        tox - headlen * Math.cos(angle + Math.PI / 6),
        toy - headlen * Math.sin(angle + Math.PI / 6),
    );
}

function render() {
    var ctx = document.getElementById("canvas");
    ctx = ctx.getContext("2d");
    ctx.clearRect(0, 0, 900, 400);
    ctx.strokeStyle = "white";
    ctx.fillStyle = "white";
    ctx.lineWidth = 1;
    ctx.beginPath();
    ctx.arc(150, 200, 150, 0, 2 * Math.PI);
    ctx.moveTo(750, 200);
    ctx.arc(600, 200, 150, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.beginPath();
    ctx.arc(150, 200, 2, 0, 2 * Math.PI);
    ctx.moveTo(600, 200);
    ctx.arc(600, 200, 2, 0, 2 * Math.PI);
    ctx.fill();
    ctx.beginPath();
    for (var i = 0; i < 60; i++) {
        ctx.moveTo(tickstart[i][0], tickstart[i][1]);
        ctx.lineTo(tickend[i][0], tickend[i][1]);
        ctx.moveTo(tickstart[i][0] + 450, tickstart[i][1]);
        ctx.lineTo(tickend[i][0] + 450, tickend[i][1]);
    }
    ctx.stroke();
    ctx.lineWidth = 2;
    ctx.beginPath();
    for (var i = 0; i < 12; i++) {
        ctx.moveTo(tickstart[5 * i][0], tickstart[5 * i][1]);
        ctx.lineTo(tickend[5 * i][0], tickend[5 * i][1]);
        ctx.moveTo(tickstart[5 * i][0] + 450, tickstart[5 * i][1]);
        ctx.lineTo(tickend[5 * i][0] + 450, tickend[5 * i][1]);
    }
    ctx.stroke();
    ctx.font = "15px Helvetica";
    ctx.lineWidth = 2;
    ctx.beginPath();
    for (var i = 0; i < 12; i++) {
        ctx.fillText(i + 1, numerals[i][0], numerals[i][1]);
        ctx.fillText(i + 1, numerals[i][0] + 450, numerals[i][1]);
    }
    ctx.fill();
    ctx.font = "27px Helvetica";
    ctx.beginPath();
    ctx.fillText("Earth", 118, 35);
    ctx.fillText("Rocket", 555, 35);
    ctx.fill();
    ctx.beginPath();
    ctx.moveTo(150, 200);
    etheta = (Math.PI * t) / 111;
    rtheta = alpha * etheta - Math.PI / 2;
    etheta = etheta - Math.PI / 2;
    ecos = Math.cos(etheta);
    esin = Math.sin(etheta);
    rcos = Math.cos(rtheta);
    rsin = Math.sin(rtheta);
    ctx.lineTo(150 + 90 * ecos, 200 + 90 * esin);
    ctx.moveTo(600, 200);
    ctx.lineTo(600 + 90 * rcos, 200 + 90 * rsin);
    canvas_arrow(
        ctx,
        150 + 90 * ecos,
        200 + 90 * esin,
        150 + 100 * ecos,
        200 + 100 * esin,
    );
    canvas_arrow(
        ctx,
        600 + 90 * rcos,
        200 + 90 * rsin,
        600 + 100 * rcos,
        200 + 100 * rsin,
    );
    ctx.stroke();
}

function go() {
    t += 1;
    render();
}

$("#start").click(function () {
    speed = document.getElementById("speed").value / c;
    button = document.getElementById("start");
    alpha = Math.sqrt(1 - speed ** 2);
    if (interval) {
        clearInterval(interval);
        interval = false;
        button.value = "Start";
    } else {
        interval = setInterval(go, 50);
        button.value = "Pause";
    }
});

$("#reset").click(function () {
    button = document.getElementById("start");
    button.value = "Start";
    t = 0;
    clearInterval(interval);
    interval = false;
    render();
});

$(document).ready(function () {
    const label = document.getElementById("speedID");
    const glabel = document.getElementById("gammaID");
    const input = document.getElementById("speed");
    label.innerHTML = input.value;
    glabel.innerHTML = 1 / (1 - Math.sqrt((input.value / c) ** 2));
    render();
});
