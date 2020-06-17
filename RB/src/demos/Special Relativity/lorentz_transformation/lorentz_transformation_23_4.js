/* global lorentzFactor */

const independentVarNames = ["t", "x", "v"];
const dependentVarNames = ["t-prime", "x-prime", "gamma"];

const sliders = {};
independentVarNames.forEach(v => {
	sliders[v] = document.getElementById(`input-${v}`);
});

const spans = {};
[...independentVarNames, ...dependentVarNames].forEach(v => {
	spans[v] = document.getElementsByClassName(`var-${v}`);
});

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
		for (let i = 0; i < spans[iv].length; ++i) {
			spans[iv][i].innerHTML = fmtFloat(indVars[iv]);
		}
	});

	const lf = lorentzFactor({ fracOfC: indVars.v });
	const depVars = {};
	depVars["gamma"] = lf;
	depVars["t-prime"] = lf * (indVars.t - indVars.v * indVars.x);
	depVars["x-prime"] = lf * (indVars.x - indVars.v * indVars.t);

	dependentVarNames.forEach(dv => {
		for (let i = 0; i < spans[dv].length; ++i) {
			spans[dv][i].innerHTML = fmtFloat(depVars[dv]);
		}
	});
}

function reset() {
	const values = { t: 0, x: 0, v: 0 };
	update(values);
	independentVarNames.forEach(iv => {
		sliders[iv].value = values[iv];
	});
}

reset();
