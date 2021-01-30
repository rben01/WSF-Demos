// eslint-disable-next-line no-unused-vars
class Line2D {
	constructor(a, b, c) {
		this._a = a;
		this._b = b;
		this._c = c;
	}

	static fromStandardForm(a, b, c) {
		return new this(a, b, c);
	}

	static fromPointSlopeForm(x0, y0, m) {
		// y - y0 = m * (x - x0)
		return new this(-m, 1, m * x0 - y0);
	}

	static fromConstantY(y0) {
		// y = y0
		return new this(0, 1, -y0);
	}

	static fromConstantX(x0) {
		// x = x0
		return new this(1, 0, -x0);
	}

	get a() {
		return this._a;
	}

	get b() {
		return this._b;
	}

	get c() {
		return this._c;
	}

	get slope() {
		return -this._a / this._b;
	}

	get yIntercept() {
		return -this._c / this._b;
	}

	get xIntercept() {
		return -this._c / this._a;
	}

	intersectionWith(other) {
		const { a: a1, b: b1, c: c1 } = this;
		const { a: a2, b: b2, c: c2 } = other;

		const x = (b1 * c2 - b2 * c1) / (a1 * b2 - a2 * b1);
		const y = (a2 * c1 - a1 * c2) / (a1 * b2 - a2 * b1);
		return [x, y];
	}
}
