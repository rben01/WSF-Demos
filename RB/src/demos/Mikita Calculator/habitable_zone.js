let teff = 5780.0;
let lum = 1.0;
const sRecentV = 1.776;
const caRecentV = 2.136e-4;
const cbRecentV = 2.533e-8;
const ccRecentV = -1.332e-11;
const cdRecentV = -3.097e-15;

const sRunawayG = 1.107;
const caRunawayG = 1.332e-4;
const cbRunawayG = 1.58e-8;
const ccRunawayG = -8.308e-12;
const cdRunawayG = -1.931e-15;

const SEsRunawayG = 1.188;
const SEcaRunawayG = 1.433e-4;
const SEcbRunawayG = 1.707e-8;
const SEccRunawayG = -8.968e-12;
const SEcdRunawayG = -2.084e-15;

const SubsRunawayG = 0.99;
const SubcaRunawayG = 1.209e-4;
const SubcbRunawayG = 1.404e-8;
const SubccRunawayG = -7.418e-12;
const SubcdRunawayG = -1.713e-15;

const sMaximumG = 0.356;
const caMaximumG = 6.171e-5;
const cbMaximumG = 1.698e-9;
const ccMaximumG = -3.198e-12;
const cdMaximumG = -5.575e-16;

const sEarlyMars = 0.3207;
const caEarlyMars = 5.5471e-5;
const cbEarlyMars = 1.5265e-9;
const ccEarlyMars = -2.874e-12;
const cdEarlyMars = -5.011e-16;

let recentV = 0;
let RunawayG = 0;
let MaximumG = 0;
let EarlyMars = 0;

let SERunawayG = 0;
let SubRunawayG = 0;

let recentVdis = 0;
let RunawayGdis = 0;
let MaximumGdis = 0;
let EarlyMarsdis = 0;

let SERunawayGdis = 0;
let SubRunawayGdis = 0;

function calculate() {
	// The Calculation: change operator in this equation to change the calculation
	//answer = teff + v2;
	recentV =
		sRecentV +
		caRecentV * (teff - 5780) +
		cbRecentV * Math.pow(teff - 5780, 2) +
		ccRecentV * Math.pow(teff - 5780, 3) +
		cdRecentV * Math.pow(teff - 5780, 4);
	recentV =
		Math.round((recentV - Math.floor(recentV)) * 1000) / 1000 + Math.floor(recentV);
	RunawayG =
		sRunawayG +
		caRunawayG * (teff - 5780) +
		cbRunawayG * Math.pow(teff - 5780, 2) +
		ccRunawayG * Math.pow(teff - 5780, 3) +
		cdRunawayG * Math.pow(teff - 5780, 4);
	RunawayG =
		Math.round((RunawayG - Math.floor(RunawayG)) * 10000) / 10000 +
		Math.floor(RunawayG);
	MaximumG =
		sMaximumG +
		caMaximumG * (teff - 5780) +
		cbMaximumG * Math.pow(teff - 5780, 2) +
		ccMaximumG * Math.pow(teff - 5780, 3) +
		cdMaximumG * Math.pow(teff - 5780, 4);
	MaximumG =
		Math.round((MaximumG - Math.floor(MaximumG)) * 1000) / 1000 +
		Math.floor(MaximumG);
	EarlyMars =
		sEarlyMars +
		caEarlyMars * (teff - 5780) +
		cbEarlyMars * Math.pow(teff - 5780, 2) +
		ccEarlyMars * Math.pow(teff - 5780, 3) +
		cdEarlyMars * Math.pow(teff - 5780, 4);
	EarlyMars =
		Math.round((EarlyMars - Math.floor(EarlyMars)) * 1000) / 1000 +
		Math.floor(EarlyMars);

	SERunawayG =
		SEsRunawayG +
		SEcaRunawayG * (teff - 5780) +
		SEcbRunawayG * Math.pow(teff - 5780, 2) +
		SEccRunawayG * Math.pow(teff - 5780, 3) +
		SEcdRunawayG * Math.pow(teff - 5780, 4);
	SERunawayG =
		Math.round((SERunawayG - Math.floor(SERunawayG)) * 10000) / 10000 +
		Math.floor(SERunawayG);

	SubRunawayG =
		SubsRunawayG +
		SubcaRunawayG * (teff - 5780) +
		SubcbRunawayG * Math.pow(teff - 5780, 2) +
		SubccRunawayG * Math.pow(teff - 5780, 3) +
		SubcdRunawayG * Math.pow(teff - 5780, 4);
	SubRunawayG =
		Math.round((SubRunawayG - Math.floor(SubRunawayG)) * 10000) / 10000 +
		Math.floor(SubRunawayG);

	recentVdis = Math.sqrt(lum / recentV);
	recentVdis =
		Math.round((recentVdis - Math.floor(recentVdis)) * 1000) / 1000 +
		Math.floor(recentVdis);
	RunawayGdis = Math.sqrt(lum / RunawayG);
	RunawayGdis =
		Math.round((RunawayGdis - Math.floor(RunawayGdis)) * 1000) / 1000 +
		Math.floor(RunawayGdis);
	MaximumGdis = Math.sqrt(lum / MaximumG);
	MaximumGdis =
		Math.round((MaximumGdis - Math.floor(MaximumGdis)) * 1000) / 1000 +
		Math.floor(MaximumGdis);
	EarlyMarsdis = Math.sqrt(lum / EarlyMars);
	EarlyMarsdis =
		Math.round((EarlyMarsdis - Math.floor(EarlyMarsdis)) * 1000) / 1000 +
		Math.floor(EarlyMarsdis);

	SERunawayGdis = Math.sqrt(lum / SERunawayG);
	SERunawayGdis =
		Math.round((SERunawayGdis - Math.floor(SERunawayGdis)) * 1000) / 1000 +
		Math.floor(SERunawayGdis);

	SubRunawayGdis = Math.sqrt(lum / SubRunawayG);
	SubRunawayGdis =
		Math.round((SubRunawayGdis - Math.floor(SubRunawayGdis)) * 1000) / 1000 +
		Math.floor(SubRunawayGdis);

	let elem;
	elem = document.getElementById("teff");
	elem.value = teff;
	elem = document.getElementById("lum");
	elem.value = lum;

	elem = document.getElementById("recentV");
	elem.value = recentV;

	elem = document.getElementById("RunawayG");
	elem.value = RunawayG;

	elem = document.getElementById("SERunawayG");
	elem.value = SERunawayG;

	elem = document.getElementById("SubRunawayG");
	elem.value = SubRunawayG;

	elem = document.getElementById("MaximumG");
	elem.value = MaximumG;

	elem = document.getElementById("recentVdis");
	elem.value = recentVdis;

	elem = document.getElementById("RunawayGdis");
	elem.value = RunawayGdis;

	elem = document.getElementById("SERunawayGdis");
	elem.value = SERunawayGdis;

	elem = document.getElementById("SubRunawayGdis");
	elem.value = SubRunawayGdis;

	elem = document.getElementById("MaximumGdis");
	elem.value = MaximumGdis;

	elem = document.getElementById("EarlyMars");
	elem.value = EarlyMars;

	elem = document.getElementById("EarlyMarsdis");
	elem.value = EarlyMarsdis;
}

function setValue(elem) {
	let val = 0.0;
	if (elem.value !== "") {
		val = parseFloat(elem.value);
	} else {
		val = 0.0;
	}
	switch (elem.id) {
		case "teff":
			teff = val;
			break;
		case "lum":
			lum = val;
			break;
	}
	calculate();
}
