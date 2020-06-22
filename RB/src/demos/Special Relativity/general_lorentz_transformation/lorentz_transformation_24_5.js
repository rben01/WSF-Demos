/* global lorentzFactor matMul */

const STEP = 0.01;

const independentVarNames = ["t", "x", "y", "z", "vx", "vy", "vz"];
const dependentVarNames = ["t", "x", "y", "z"].map(v => `${v}-prime`);

const sliders = {};
const textSpans = {};
const prevVals = {};
independentVarNames.forEach(v => {
	sliders[v] = document.getElementById(`input-${v}`);
	textSpans[v] = document.getElementById(`text-${v}`);
	prevVals[v] = 0;
});

dependentVarNames.forEach(v => {
	textSpans[v] = document.getElementById(`text-${v}`);
});

function fmtFloat(x) {
	return x.toFixed(2).replace(/^-/, '<span class="minus-sign">−</span>');
}

function getDefault(v, name) {
	let x = v[name];
	if (typeof x === "undefined") {
		x = sliders[name].value;
	}
	x = +x;
	return x;
}

function update(values) {
	const givenVal = Object.keys(values)[0];

	independentVarNames.forEach(k => {
		values[k] = getDefault(values, k);
	});

	const { t, x, y, z } = values;
	let { vx, vy, vz } = values;

	let v = Math.sqrt(vx * vx + vy * vy + vz * vz);

	if (v >= 1) {
		const roundToStep = x => Math.floor(x / STEP) * STEP;
		if (givenVal === "vx") {
			vx = roundToStep(Math.sqrt(0.999999999999 - vy * vy - vz * vz));
			sliders[givenVal].value = vx;
		} else if (givenVal === "vy") {
			vy = roundToStep(Math.sqrt(0.999999999999 - vx * vx - vz * vz));
			sliders[givenVal].value = vy;
		} else if (givenVal === "vz") {
			vz = roundToStep(Math.sqrt(0.999999999999 - vx * vx - vy * vy));
			sliders[givenVal].value = vz;
		}

		v = Math.sqrt(vx * vx + vy * vy + vz * vz) * 0.99999999999;
	}

	const v2 = v * v;
	const gamma = lorentzFactor({ fracOfC: v });

	let tp, xp, yp, zp;

	if (v !== 0) {
		const matrix = [
			[gamma, -gamma * vx, -gamma * vy, -gamma * vz],
			[
				-gamma * vx,
				1 + ((gamma - 1) * vx * vx) / v2,
				((gamma - 1) * vx * vy) / v2,
				((gamma - 1) * vx * vz) / v2,
			],
			[
				-gamma * vy,
				((gamma - 1) * vy * vx) / v2,
				1 + ((gamma - 1) * vy * vy) / v2,
				((gamma - 1) * vy * vz) / v2,
			],
			[
				-gamma * vz,
				((gamma - 1) * vz * vx) / v2,
				((gamma - 1) * vz * vy) / v2,
				1 + ((gamma - 1) * vz * vz) / v2,
			],
		];

		const vector = [t, x, y, z];

		[tp, xp, yp, zp] = matMul(matrix, vector);
	} else {
		[tp, xp, yp, zp] = [t, x, y, z];
	}

	const variables = {
		t,
		x,
		y,
		z,
		vx,
		vy,
		vz,
		"t-prime": tp,
		"x-prime": xp,
		"y-prime": yp,
		"z-prime": zp,
	};

	independentVarNames.forEach(k => {
		prevVals[k] = variables[k];
	});

	Object.entries(variables).forEach(([v, value]) => {
		textSpans[v].innerHTML = fmtFloat(value);
	});
}

// eslint-disable-next-line no-unused-vars
function reset() {
	independentVarNames.forEach(iv => {
		sliders[iv].value = 0;
	});
}

update({});
