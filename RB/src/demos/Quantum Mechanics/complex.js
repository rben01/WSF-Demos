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

	static fromCartesian(re, im) {
		const magnitude = (re ** 2 + im ** 2) ** 0.5;
		const phase = Math.atan2(im, re);
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

	get re() {
		return this._$r * Math.cos(this._$theta);
	}

	get im() {
		return this._$r * Math.sin(this._$theta);
	}

	conj() {
		return this.constructor.fromPolar(this._$r, -this._$theta);
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

	static div(z1, z2) {
		if (typeof z1 === "number") {
			z1 = Complex.fromReal(z1);
		}
		return z1.div(z2);
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
		let re = 0;
		let im = 0;
		for (const arg of args) {
			if (typeof arg === "number") {
				re += arg;
			} else {
				re += arg.re;
				im += arg.im;
			}
		}
		return this.fromCartesian(re, im);
	}

	add(...others) {
		return this.constructor.add(this, ...others);
	}

	static sub(z1, z2) {
		if (typeof z1 === "number") {
			z1 = Complex.fromReal(z1);
		}
		return z1.sub(z2);
	}

	sub(other) {
		if (typeof other === "number") {
			other = Complex.fromReal(other);
		}

		return this.constructor.fromCartesian(this.re - other.re, this.im - other.im);
	}

	static exp(z) {
		if (typeof z === "number") {
			return Complex.fromReal(Math.exp(z));
		}

		return z.exp();
	}

	exp() {
		const magnitude = Math.exp(this.re);
		const phase = this.im;
		return Complex.fromPolar(magnitude, phase);
	}

	static cis(z) {
		if (typeof z === "number") {
			return Complex.fromPolar(1, z);
		}

		return z.cis();
	}

	cis() {
		// exp(i*(x+iy)) = e^(-y)e^(ix)
		return Complex.fromPolar(Math.exp(-this.im), this.re);
	}

	pow(realNumber) {
		const magnitude = Math.pow(this._$r, realNumber);
		const phase = this._$theta * realNumber;
		return this.constructor.fromPolar(magnitude, phase);
	}
}
Complex.i = Complex.fromImag(1);
