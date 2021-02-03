class Complex {
	constructor(magnitude, phase) {
		this._$r = magnitude;
		this._$theta = phase;
	}

	static from(other) {
		if (other.magnitude !== undefined || other.phase !== undefined) {
			return this.fromPolar(other.magnitude ?? 1, other.phase ?? 0);
		} else if (other.re !== undefined || other.im !== undefined) {
			return this.fromCartesian(other.re ?? 0, other.im ?? 0);
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

	toPolar() {
		return { magnitude: this.magnitude, phase: this.phase };
	}

	toCartesian() {
		return { re: this.re, im: this.im };
	}

	static mul(...args) {
		let magnitude = 1;
		let phase = 0;

		for (const arg of args) {
			magnitude *= arg.magnitude ?? arg;
			phase += arg.phase ?? 0;
		}

		return this.fromPolar(magnitude, phase);
	}

	mul(...others) {
		return this.constructor.mul(this, ...others);
	}

	static div(z1, z2) {
		return this.fromPolar(
			(z1.magnitude ?? z1) / (z2.magnitude ?? z2) ?? 1,
			(z1.phase ?? 0) - (z2.phase ?? 0),
		);
	}

	div(other) {
		return this.constructor.div(this, other);
	}

	static add(...args) {
		let re = 0;
		let im = 0;
		for (const arg of args) {
			re += arg.re ?? arg;
			im += arg.im ?? 0;
		}
		return this.fromCartesian(re, im);
	}

	add(...others) {
		return this.constructor.add(this, ...others);
	}

	static sub(z1, z2) {
		return this.fromCartesian(
			(z1.re ?? z1) - (z2.re ?? z2) ?? 0, // ?? binds looser than -
			(z1.im ?? 0) - (z2.im ?? 0) ?? 0,
		);
	}

	sub(other) {
		return this.constructor.sub(this, other);
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
