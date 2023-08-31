/* global lorentzFactor */

const independentVarNames = ["t", "x", "v"];
const dependentVarNames = ["t-prime", "x-prime", "gamma"];

const sliders = {};
independentVarNames.forEach(v => {
	sliders[v] = document.getElementById(`input-${v}`);
});

const textSpans = {};
[...independentVarNames, ...dependentVarNames].forEach(v => {
	textSpans[v] = document.getElementsByClassName(`var-${v}`);
});

const addtlTextVars = ["ct2", "x2", "ctp2", "xp2"];
addtlTextVars.forEach(v => {
	textSpans[v] = document.getElementById(v);
});
textSpans.interval = document.getElementsByClassName("st-interval");

function fmtFloat(x) {
	return x.toFixed(2).replace(/^-/, '<span class="minus-sign">−</span>');
}

function update(indVars) {
	independentVarNames.forEach(iv => {
		if (typeof indVars[iv] === "undefined") {
			indVars[iv] = sliders[iv].value;
		}
		indVars[iv] = +indVars[iv];
	});

	independentVarNames.forEach(iv => {
		for (let i = 0; i < textSpans[iv].length; ++i) {
			textSpans[iv][i].innerHTML = fmtFloat(indVars[iv]);
		}
	});

	const lf = lorentzFactor({ fracOfC: indVars.v });
	const depVars = {};
	depVars["gamma"] = lf;
	depVars["t-prime"] = lf * (indVars.t - indVars.v * indVars.x);
	depVars["x-prime"] = lf * (indVars.x - indVars.v * indVars.t);

	dependentVarNames.forEach(dv => {
		for (let i = 0; i < textSpans[dv].length; ++i) {
			textSpans[dv][i].innerHTML = fmtFloat(depVars[dv]);
		}
	});

	const values = {
		ct2: Math.pow(indVars.t, 2),
		x2: Math.pow(indVars.x, 2),
		ctp2: Math.pow(depVars["t-prime"], 2),
		xp2: Math.pow(depVars["x-prime"], 2),
	};

	const interval = values.ct2 - values.x2;

	addtlTextVars.forEach(v => {
		textSpans[v].innerHTML = fmtFloat(values[v]);
	});

	for (let i = 0; i < textSpans.interval.length; ++i) {
		textSpans.interval[i].innerHTML = fmtFloat(interval);
	}
}

function reset() {
	const values = { t: 0, x: 0, v: 0 };
	update(values);
	independentVarNames.forEach(iv => {
		sliders[iv].value = values[iv];
	});
}

reset();
