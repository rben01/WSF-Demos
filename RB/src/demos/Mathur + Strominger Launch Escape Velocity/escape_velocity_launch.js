/* global MASS_MIN MASS_MAX R_MIN R_MAX V_MIN V_MAX DEFAULT_MASS_1e24kg DEFAULT_RADIUS_km DEFAULT_VELOCITY_kmps */

const WIDTH = 925;
const HEIGHT = 250;

// masses have units of 1e24 kg
// radii have units of km

const svg = d3.select("#viz").attr("width", WIDTH).attr("height", HEIGHT);

svg.append("rect")
	.attr("x", 0)
	.attr("y", 0)
	.attr("width", WIDTH)
	.attr("height", HEIGHT)
	.attr("fill", "#111");

const xScale_km_to_px = d3.scaleLinear([0, R_MAX], [0, WIDTH / 5]);
const yScale = d3.scaleLinear([-1, 1], [HEIGHT, 0]);
const mScale_1e24kg_to_opacity = d3.scaleLinear([0, MASS_MAX], [0.3, 1]);

const sliders = {
	radius: document.getElementById("slider-radius"),
	mass: document.getElementById("slider-mass"),
	velocity: document.getElementById("slider-velocity"),
};

const textSpans = {
	radius: document.getElementById("text-radius"),
	mass: document.getElementById("text-mass"),
	velocity: document.getElementById("text-velocity"),
	escapeVelocity: document.getElementById("text-escape-velocity"),
	willEscape: document.getElementById("text-will-escape"),
};

const buttons = {
	launch: document.getElementById("btn-launch"),
	reset: document.getElementById("btn-reset"),
};

const G = 6.6743e-11; // Units of m^3 / (kg s^2)
const OBJECT_RADIUS_PX = 7;

function unNullifyRadius(r) {
	const defaultVal =
		sliders.radius !== null ? +sliders.radius.value : DEFAULT_RADIUS_km;
	return r ?? defaultVal;
}

function unNullifyMass(m) {
	const defaultVal =
		sliders.mass !== null ? +sliders.mass.value : DEFAULT_MASS_1e24kg;
	return m ?? defaultVal;
}

function unNullifyVelocity(v) {
	const defaultVal =
		sliders.velocity !== null ? +sliders.velocity.value : DEFAULT_VELOCITY_kmps;
	return v ?? defaultVal;
}

function getEscapeVelocity_kmps({ mPlanet_1e24kg, rPlanet_km }) {
	const m_kg = unNullifyMass(mPlanet_1e24kg) * 1e24;
	const r_m = unNullifyRadius(rPlanet_km) * 1e3;

	return Math.sqrt((2 * G * m_kg) / r_m) * 1e-3;
}

function getPlanetCx_px(rPlanet_km) {
	return xScale_km_to_px(0) + xScale_km_to_px(-rPlanet_km / 3) + 3;
}

// Compute dv and then dx using Runge-Kutta
function getObjectNextX_m_AndV_mps(x_m, v_mps, dt, { v0_mps, mPlanet_kg, rPlanet_km }) {
	const nextX_m = x_m + v_mps * dt;

	const dvDt = (-G * mPlanet_kg) / x_m ** 2;
	const nextVNaive_mps = v_mps + dvDt * dt;

	const rPlanet_m = rPlanet_km * 1e3;
	function dv_dt(v_mps) {
		return (
			-G *
			mPlanet_kg *
			((v_mps ** 2 - v0_mps ** 2) / (2 * G * mPlanet_kg) + 1 / rPlanet_m) ** 2
		);
	}

	const k1 = dv_dt(v_mps);
	const k2 = dv_dt(v_mps + (dt * k1) / 2);
	const k3 = dv_dt(v_mps + (dt * k2) / 2);
	const k4 = dv_dt(v_mps + dt * k3);

	const nextVRungeKutta_mps = v_mps + (dt / 6) * (k1 + 2 * k2 + 2 * k3 + k4);

	// console.log(
	// 	x_m,
	// 	v_mps,
	// 	v0_mps,
	// 	mPlanet_kg,
	// 	rPlanet_km,
	// 	"|",
	// 	nextX_m,
	// 	nextV_mps,
	// 	dt,
	// 	"|",
	// 	k1,
	// 	k2,
	// 	k3,
	// 	k4,
	// );

	const nextV_mps = (nextVNaive_mps + nextVRungeKutta_mps) / 2;

	return { x_m: nextX_m, v_mps: nextV_mps };
}

function fmtFloat(x) {
	if (x >= 100) {
		// A hack to make this the *only* place number_format can be called in this file
		// eslint-disable-next-line no-undef
		return number_format(x);
	}
	return x.toPrecision(3).replace(/\.0+$/, "");
}

function updateText({ mPlanet_1e24kg, rPlanet_km, v0_kmps } = {}) {
	mPlanet_1e24kg = unNullifyMass(mPlanet_1e24kg);
	if (textSpans.mass !== null) {
		textSpans.mass.innerText = fmtFloat(mPlanet_1e24kg);
	}

	rPlanet_km = unNullifyRadius(rPlanet_km);
	if (textSpans.radius !== null) {
		textSpans.radius.innerText = fmtFloat(rPlanet_km);
	}

	v0_kmps = unNullifyVelocity(v0_kmps);
	if (textSpans.velocity !== null) {
		textSpans.velocity.innerHTML = fmtFloat(v0_kmps);
	}

	const escapeVelocity_kmps = getEscapeVelocity_kmps({ mPlanet_1e24kg, rPlanet_km });
	if (textSpans.escapeVelocity !== null) {
		textSpans.escapeVelocity.innerText = fmtFloat(escapeVelocity_kmps);
	}

	if (textSpans.willEscape !== null) {
		if (v0_kmps < escapeVelocity_kmps) {
			const mPlanet_kg = mPlanet_1e24kg * 1e24;
			const rPlanet_m = rPlanet_km * 1e3;
			const v0_mps = v0_kmps * 1e3;
			const rMax_m = 1 / (v0_mps ** 2 / (-2 * G * mPlanet_kg) + 1 / rPlanet_m);
			const distTraveled_km = (rMax_m - rPlanet_m) * 1e-3;
			const distTraveledText = fmtFloat(distTraveled_km);
			textSpans.willEscape.innerHTML = `The projectile will fall back down to the planet after traveling a maximum distance of <span class="sci-num">${distTraveledText}</span>km.`;
		} else {
			textSpans.willEscape.innerText = `The projectile will never return to the planet; it will keep traveling away from the planet forever.`;
		}
	}
}

function drawInitialSetup({ mPlanet_1e24kg, rPlanet_km } = {}) {
	mPlanet_1e24kg = unNullifyMass(mPlanet_1e24kg);
	rPlanet_km = unNullifyRadius(rPlanet_km);

	const planetCx_px = getPlanetCx_px(rPlanet_km);
	svg.selectAll(".planet")
		.data([0])
		.join("circle")
		.classed("planet", true)
		.attr("cx", planetCx_px)
		.attr("cy", yScale(0))
		.attr("r", xScale_km_to_px(rPlanet_km))
		.attr("stroke", "#ddd")
		.attr("fill-opacity", mScale_1e24kg_to_opacity(mPlanet_1e24kg))
		.attr("fill", "#3cf");

	svg.selectAll(".object")
		.data([0])
		.join("circle")
		.classed("object", true)
		.attr("cx", planetCx_px + xScale_km_to_px(rPlanet_km) + OBJECT_RADIUS_PX)
		.attr("cy", yScale(0))
		.attr("r", OBJECT_RADIUS_PX)
		.attr("stroke", "ddd")
		.attr("fill", "#fc3");

	updateText({ mPlanet_1e24kg, rPlanet_km });
}

let isAnimating = false;

function reset() {
	isAnimating = false;
	buttons.reset.disabled = true;
	buttons.launch.disabled = false;

	const mPlanet_1e24kg = unNullifyMass();
	const rPlanet_km = unNullifyRadius();

	// TODO
	const planetCx_px = getPlanetCx_px(rPlanet_km);
	const cx0_px = planetCx_px + xScale_km_to_px(rPlanet_km) + OBJECT_RADIUS_PX;

	svg.selectAll(".object").attr("cx", cx0_px).style("visibility", "visible");
	svg.selectAll(".offscreen-indicator").style("visibility", "hidden");

	drawInitialSetup();

	updateText({ mPlanet_1e24kg, rPlanet_km });
}

// eslint-disable-next-line no-unused-vars
function launch({ v0_kmps, mPlanet_1e24kg, rPlanet_km } = {}) {
	isAnimating = true;
	buttons.reset.disabled = false;
	buttons.launch.disabled = true;

	const mPlanet_kg = unNullifyMass(mPlanet_1e24kg) * 1e24;
	rPlanet_km = unNullifyRadius(rPlanet_km);
	const v0_mps = unNullifyVelocity(v0_kmps) * 1e3;

	const planetCx = getPlanetCx_px(rPlanet_km);
	const cx0_px = planetCx + xScale_km_to_px(rPlanet_km) + OBJECT_RADIUS_PX;
	const cx0_m = xScale_km_to_px.invert(cx0_px) * 1e3;
	const cxMax_m = xScale_km_to_px.invert(WIDTH + OBJECT_RADIUS_PX) * 1e3;

	const tScale = 0.073333; // The larger, the faster

	let x_m = cx0_m;
	let v_mps = v0_mps;
	let prevTimestamp;
	const object = svg.selectAll(".object").node();
	function move(timestamp) {
		// console.log(timestamp);
		if (prevTimestamp === undefined) {
			prevTimestamp = timestamp;
		}
		const dtMS = timestamp - prevTimestamp;
		prevTimestamp = timestamp;

		const { x_m: nextX_m, v_mps: nextV_mps } = getObjectNextX_m_AndV_mps(
			x_m,
			v_mps,
			dtMS * tScale,
			{
				v0_mps,
				mPlanet_kg,
				rPlanet_km,
			},
		);

		if (isNaN(nextX_m) || nextX_m < cx0_m || !isAnimating) {
			reset();
			// console.log(x, nextX, v0, nextV);
			return;
		}

		object.setAttribute("cx", xScale_km_to_px(nextX_m * 1e-3));

		if (nextX_m > cxMax_m) {
			object.style.visibility = "hidden";

			const line = d3.line();
			const rightMargin = 10;
			const pointerWidth = 25;
			const pointerX1 = WIDTH - rightMargin;
			const pointerX0 = pointerX1 - pointerWidth;
			const yMid = yScale(0);
			const pointerHalfHeight = 15;
			const pathPoints = [
				[pointerX0, yMid - pointerHalfHeight],
				[pointerX1, yMid],
				[pointerX0, yMid + pointerHalfHeight],
			];

			svg.selectAll(".offscreen-indicator").style("visibility", "visible");

			svg.selectAll(".pointer")
				.data([pathPoints])
				.join("path")
				.classed("pointer", true)
				.classed("offscreen-indicator", true)
				.attr("d", line)
				.attr("stroke", "white")
				.attr("stroke-width", 2)
				.attr("fill-opacity", 0);

			const textMargin = 10;
			const distFromPlanet_km = (nextX_m - cxMax_m) * 1e-3;
			const distFromPlanetText = `${fmtFloat(distFromPlanet_km)} km`;
			svg.selectAll(".pointer-text")
				.data([0])
				.join("text")
				.classed("pointer-text", true)
				.classed("offscreen-indicator", true)
				.attr("x", pointerX0 - textMargin)
				.attr("y", yMid)
				.attr("text-anchor", "end")
				.attr("dominant-baseline", "middle")
				.attr("fill", "white")
				.text(distFromPlanetText);
		} else {
			object.style.visibility = "visible";
			svg.selectAll(".offscreen-indicator").style("visibility", "hidden");
		}

		x_m = nextX_m;
		v_mps = nextV_mps;

		window.requestAnimationFrame(move);
	}
	window.requestAnimationFrame(move);
}

(() => {
	const slider = sliders.radius;
	if (slider !== null) {
		slider.min = R_MIN;
		slider.max = R_MAX;
		slider.step = 1;
		slider.value = DEFAULT_RADIUS_km;
		d3.select(slider).on("input", function () {
			if (isAnimating) {
				return;
			}

			const rPlanet_km = +this.value;
			drawInitialSetup({ rPlanet_km });
		});
	}
})();

(() => {
	const slider = sliders.mass;
	if (slider !== null) {
		slider.min = MASS_MIN;
		slider.max = MASS_MAX;
		slider.step = 1;
		slider.value = DEFAULT_MASS_1e24kg;
		d3.select(slider).on("input", function () {
			if (isAnimating) {
				return;
			}
			const mPlanet_1e24kg = +this.value;
			drawInitialSetup({ mPlanet_1e24kg });
		});
	}
})();

(() => {
	const slider = sliders.velocity;
	if (slider !== null) {
		slider.min = V_MIN;
		slider.max = V_MAX;
		slider.step = 1;
		slider.value = DEFAULT_VELOCITY_kmps;
		d3.select(slider).on("input", function () {
			if (isAnimating) {
				return;
			}
			const v0_kmps = +this.value;
			updateText({ v0_kmps });
		});
	}
})();

drawInitialSetup();
updateText();
buttons.reset.disabled = true;
