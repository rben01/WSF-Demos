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
			return Complex.fromPolar(1, z);
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
