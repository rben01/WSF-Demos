/* global applyGraphicalObjs */

class Complex {
	constructor(magnitude, phase) {
		this._$r = magnitude;
		this._$theta = phase;
	}

	static from(other) {
		if (other.constructor === this) {
			return other;
		} else if (typeof other === "number") {
			return this.fromReal(other);
		} else {
			throw new Error(`Argument ${other} not understood in Complex.from`);
		}
	}

	static fromPolar(magnitude, phase) {
		return new this(magnitude, phase);
	}

	static fromCartesian(x, y) {
		const magnitude = (x ** 2 + y ** 2) ** 0.5;
		const phase = Math.atan2(y, x);
		return new this(magnitude, phase);
	}

	static fromReal(realNumber) {
		return new this(realNumber, 0);
	}

	static fromImag(realNumber) {
		return new this(realNumber, Math.PI / 2);
	}

	get magnitude() {
		return this._$r;
	}

	get phase() {
		return this._$theta;
	}

	get x() {
		return this._$r * Math.cos(this._$theta);
	}

	get y() {
		return this._$r * Math.sin(this._$theta);
	}

	conj() {
		return Complex.fromPolar(this._$r, this._$theta);
	}

	static mul(...args) {
		let magnitude = 1;
		let phase = 0;

		for (const arg of args) {
			if (typeof arg === "number") {
				magnitude *= arg;
			} else {
				magnitude *= arg.magnitude;
				phase += arg.phase;
			}
		}

		return this.fromPolar(magnitude, phase);
	}

	mul(...others) {
		return this.constructor.mul(this, ...others);
	}

	div(other) {
		if (typeof other === "number") {
			return new this.constructor(this.magnitude * other, this.phase);
		} else {
			return new this.constructor(
				this.magnitude / other.magnitude,
				this.phase - other.phase,
			);
		}
	}

	static add(...args) {
		let x = 0;
		let y = 0;
		for (const arg of args) {
			x += arg.x;
			y += arg.y;
		}
		return this.fromCartesian(x, y);
	}

	add(...others) {
		return this.constructor.add(this, ...others);
	}

	static sub(z1, z2) {
		return this.fromCartesian(z1.x - z2.x, z1.y - z2.y);
	}

	sub(other) {
		return this.constructor.fromCartesian(this.x - other.x, this.y - other.y);
	}

	static exp(z) {
		if (typeof z === "number") {
			return Math.exp(z);
		}

		return z.exp();
	}

	exp() {
		const magnitude = Math.exp(this.x);
		const phase = this.y;
		return Complex.fromPolar(magnitude, phase);
	}

	static cis(z) {
		if (typeof z === "number") {
			return Complex.fromReal(z).cis();
		}

		return z.cis();
	}

	cis() {
		return Complex.fromCartesian(0, 1).mul(this).exp();
	}

	pow(realNumber) {
		const magnitude = Math.pow(this._$r, realNumber);
		const phase = this._$theta * realNumber;
		return this.constructor.fromPolar(magnitude, phase);
	}
}
Complex.i = Complex.fromImag(1);

const z1 = Complex.fromCartesian(3, 4);
const z2 = Complex.fromPolar(2, Math.PI / 6);

const WIDTH = 400;
const HEIGHT = 400;

const plot = d3.select("#plot").attr("width", WIDTH).attr("height", HEIGHT);

function k(m, en) {
	Complex.mul(2, m, en).pow(0.5);
}

function a2(chi, k, a, b) {
	chi = Complex.from(chi);
	k = Complex.from(k);
	a = Complex.from(a);
	b = Complex.from(b);

	const numerator = Complex.mul(
		-1,
		Complex.mul(-2, b, k).cis(),
		Complex.sub(Complex.mul(2, a, chi).exp(), Complex.mul(2, b, chi).exp()),
		Complex.add(k.pow(2), chi.pow(2)),
		Complex.add(
			Complex.mul(
				Complex.add(Complex.i.mul(4, a, k), Complex.mul(2, b, chi)).exp(),
				Complex.sub(k, Complex.i.mul(chi)).pow(2),
			),
			Complex.mul(
				-1,
				Complex.mul(2, a, Complex.i.mul(2, k).add(chi).exp()),
				Complex.sum(k, Complex.i.mul(chi)).pow(2),
			),
		),
	);
}

function a3() {}

function a4() {}

function a5() {}

function a6() {}
function a7() {}
function a8() {}
function a9() {}

function $xi(m, en, a) {
	return Complex.mul(2, m, en, a.pow(2)).pow(0.5);
}

function $chi() {}

function circle(m, en, a, V) {
	return Complex.mul(2, m, V, a.pow(2)).sub($xi(m, en, a).pow(2)).pow(0.5);
}

function $psi(m, en, V, a, b, x) {
	const k_m_en = k(m, en);
	const chi_m_en_V = $chi(m, en, V);
	if (x <= -b) {
		return Complex.add(
			Complex.mul(k_m_en, x).cis(),
			Complex.mul(a2(chi_m_en_V, k_m_en, a, b), Complex.mul(k_m_en, x, -1).cis()),
		);
	} else if (x <= -a) {
		return Complex.add(
			Complex.mul(a3(chi_m_en_V, k_m_en, a, b), Complex.mul(chi_m_en_V, x).exp()),
			Complex.mul(
				a4(chi_m_en_V, k_m_en, a, b),
				Complex.mul(-1, chi_m_en_V, x).exp(),
			),
		);
	} else if (x <= a) {
		return Complex.add(
			Complex.mul(a5(chi_m_en_V, k_m_en, a, b), Complex.mul(k_m_en, x).cis()),
			Complex.mul(a6(chi_m_en_V, k_m_en, a, b), Complex.mul(-1, k_m_en, x).cis()),
		);
	} else if (x <= b) {
		return Complex.add(
			Complex.mul(a7(chi_m_en_V, k_m_en, a, b), Complex.mul(chi_m_en_V, x).exp()),
			Complex.mul(
				a8(chi_m_en_V, k_m_en, a, b),
				Complex.mul(-1, chi_m_en_V, x).exp(),
			),
		);
	} else {
		return Complex.mul(a9(chi_m_en_V, k_m_en, a, b), Complex.mul(k_m_en, x).cis());
	}
}
