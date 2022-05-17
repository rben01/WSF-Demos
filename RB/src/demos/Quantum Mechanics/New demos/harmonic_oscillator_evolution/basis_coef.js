/* global Complex H_BAR */

function factorial(n) {
	let acc = 1;
	for (let i = 1; i <= n; i++) {
		acc *= i;
	}
	return acc;
}

// eslint-disable-next-line no-unused-vars
function basisCoefficient(n, { mu, sigma, p }) {
	const coef_ = Complex.div(
		Complex.mul(
			Complex.pow(2, Complex.div(3, 4)),
			Complex.pow(sigma, Complex.div(1, 2)),
		),
		Complex.mul(
			Complex.mul(
				Complex.pow(
					Complex.mul(Complex.pow(2, n), factorial(n)),
					Complex.div(1, 2),
				),
				Complex.pow(
					Complex.add(Complex.mul(2, Complex.pow(sigma, 2)), 1),
					Complex.add(n, Complex.div(1, 2)),
				),
				Complex.pow(H_BAR, n),
			),
			Complex.exp(
				Complex.div(
					Complex.add(
						Complex.mul(Complex.pow(mu, 2), Complex.pow(H_BAR, 2)),
						Complex.mul(2, Complex.pow(p, 2), Complex.pow(sigma, 2)),
						Complex.mul(4, Complex.i, mu, p, Complex.pow(sigma, 2), H_BAR),
					),
					Complex.mul(
						2,
						Complex.add(Complex.mul(2, Complex.pow(sigma, 2)), 1),
						Complex.pow(H_BAR, 2),
					),
				),
			),
		),
	);
	const s4_ = -1 + 4 * sigma ** 4;
	switch (n) {
		case 0:
			return Complex.mul(coef_, 1);
		case 1:
			return Complex.mul(
				coef_,
				Complex.add(
					Complex.mul(4, Complex.i, p, Complex.pow(sigma, 2)),
					Complex.mul(2, mu, H_BAR),
				),
			);
		case 2:
			return Complex.mul(
				coef_,
				Complex.mul(
					2,
					Complex.add(
						Complex.mul(-8, Complex.pow(p, 2), Complex.pow(sigma, 4)),
						Complex.mul(8, Complex.i, p, mu, Complex.pow(sigma, 2), H_BAR),
						Complex.mul(
							Complex.add(
								-1,
								Complex.mul(2, Complex.pow(mu, 2)),
								Complex.mul(4, Complex.pow(sigma, 4)),
							),
							Complex.pow(H_BAR, 2),
						),
					),
				),
			);
		case 3:
			return Complex.mul(
				coef_,
				Complex.mul(
					-4,
					Complex.i,
					Complex.sub(
						Complex.mul(2, p, Complex.pow(sigma, 2)),
						Complex.mul(Complex.i, mu, H_BAR),
					),
					Complex.add(
						Complex.sub(
							Complex.mul(8, Complex.pow(p, 2), Complex.pow(sigma, 4)),
							Complex.mul(
								8,
								Complex.i,
								p,
								mu,
								Complex.pow(sigma, 2),
								H_BAR,
							),
						),
						Complex.mul(
							Complex.sub(
								Complex.sub(3, Complex.mul(2, Complex.pow(mu, 2))),
								Complex.mul(12, Complex.pow(sigma, 4)),
							),
							Complex.pow(H_BAR, 2),
						),
					),
				),
			);
		case 4:
			return Complex.mul(
				coef_,
				Complex.mul(
					4,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.mul(
									64,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
								),
								Complex.mul(
									128,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									H_BAR,
								),
							),
							Complex.mul(
								48,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									-1,
									Complex.mul(2, Complex.pow(mu, 2)),
									Complex.mul(4, Complex.pow(sigma, 4)),
								),
								Complex.pow(H_BAR, 2),
							),
						),
						Complex.mul(
							16,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								-3,
								Complex.mul(2, Complex.pow(mu, 2)),
								Complex.mul(12, Complex.pow(sigma, 4)),
							),
							Complex.pow(H_BAR, 3),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(4, Complex.pow(mu, 4)),
								Complex.mul(
									3,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									12,
									Complex.pow(mu, 2),
									Complex.pow(s4_, 4),
								),
							),
							Complex.pow(H_BAR, 4),
						),
					),
				),
			);
		case 5:
			return Complex.mul(
				coef_,
				Complex.mul(
					8,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.mul(
										128,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
									),
									Complex.mul(
										320,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										H_BAR,
									),
								),
								Complex.mul(
									160,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										-1,
										Complex.mul(2, Complex.pow(mu, 2)),
										Complex.mul(4, Complex.pow(sigma, 4)),
									),
									Complex.pow(H_BAR, 2),
								),
							),
							Complex.mul(
								80,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									-3,
									Complex.mul(2, Complex.pow(mu, 2)),
									Complex.mul(12, Complex.pow(sigma, 4)),
								),
								Complex.pow(H_BAR, 3),
							),
						),
						Complex.mul(
							10,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(4, Complex.pow(mu, 4)),
								Complex.mul(
									3,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									12,
									Complex.pow(mu, 2),
									Complex.pow(s4_, 4),
								),
							),
							Complex.pow(H_BAR, 4),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(4, Complex.pow(mu, 4)),
								Complex.mul(
									15,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									20,
									Complex.pow(mu, 2),
									Complex.pow(s4_, 4),
								),
							),
							Complex.pow(H_BAR, 5),
						),
					),
				),
			);
		case 6:
			return Complex.mul(
				coef_,
				Complex.mul(
					8,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.mul(
										-512,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
									),
									Complex.mul(
										1536,
										Complex.i,
										Complex.pow(p, 5),
										mu,
										Complex.pow(sigma, 10),
										H_BAR,
									),
									Complex.mul(
										960,
										Complex.pow(p, 4),
										Complex.pow(sigma, 8),
										Complex.add(
											-1,
											Complex.mul(2, Complex.pow(mu, 2)),
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										Complex.pow(H_BAR, 2),
									),
								),
								Complex.mul(
									640,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									Complex.add(
										-3,
										Complex.mul(2, Complex.pow(mu, 2)),
										Complex.mul(12, Complex.pow(sigma, 4)),
									),
									Complex.pow(H_BAR, 3),
								),
							),
							Complex.mul(
								120,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(4, Complex.pow(mu, 4)),
									Complex.mul(
										3,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										12,
										Complex.pow(mu, 2),
										Complex.pow(s4_, 4),
									),
								),
								Complex.pow(H_BAR, 4),
							),
						),
						Complex.mul(
							24,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(4, Complex.pow(mu, 4)),
								Complex.mul(
									15,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									20,
									Complex.pow(mu, 2),
									Complex.pow(s4_, 4),
								),
							),
							Complex.pow(H_BAR, 5),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(8, Complex.pow(mu, 6)),
								Complex.mul(
									90,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									60,
									Complex.pow(mu, 4),
									Complex.pow(s4_, 4),
								),
								Complex.mul(15, Complex.pow(Complex.pow(s4_, 4), 3)),
							),
							Complex.pow(H_BAR, 6),
						),
					),
				),
			);
		case 7:
			return Complex.mul(
				coef_,
				Complex.mul(
					16,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.mul(
											-1024,
											Complex.i,
											Complex.pow(p, 7),
											Complex.pow(sigma, 14),
										),
										Complex.mul(
											3584,
											Complex.pow(p, 6),
											mu,
											Complex.pow(sigma, 12),
											H_BAR,
										),
									),
									Complex.mul(
										2688,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
										Complex.add(
											-1,
											Complex.mul(2, Complex.pow(mu, 2)),
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										Complex.pow(H_BAR, 2),
									),
									Complex.mul(
										2240,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										Complex.add(
											-3,
											Complex.mul(2, Complex.pow(mu, 2)),
											Complex.mul(12, Complex.pow(sigma, 4)),
										),
										Complex.pow(H_BAR, 3),
									),
								),
								Complex.mul(
									560,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(4, Complex.pow(mu, 4)),
										Complex.mul(
											3,
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											12,
											Complex.pow(mu, 2),
											Complex.pow(s4_, 4),
										),
									),
									Complex.pow(H_BAR, 4),
								),
							),
							Complex.mul(
								168,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(4, Complex.pow(mu, 4)),
									Complex.mul(
										15,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										20,
										Complex.pow(mu, 2),
										Complex.pow(s4_, 4),
									),
								),
								Complex.pow(H_BAR, 5),
							),
						),
						Complex.mul(
							14,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(8, Complex.pow(mu, 6)),
								Complex.mul(
									90,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									60,
									Complex.pow(mu, 4),
									Complex.pow(s4_, 4),
								),
								Complex.mul(15, Complex.pow(Complex.pow(s4_, 4), 3)),
							),
							Complex.pow(H_BAR, 6),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(8, Complex.pow(mu, 6)),
								Complex.mul(
									210,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									84,
									Complex.pow(mu, 4),
									Complex.pow(s4_, 4),
								),
								Complex.mul(105, Complex.pow(Complex.pow(s4_, 4), 3)),
							),
							Complex.pow(H_BAR, 7),
						),
					),
				),
			);
		case 8:
			return Complex.mul(
				coef_,
				Complex.mul(
					16,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.mul(
												4096,
												Complex.pow(p, 8),
												Complex.pow(sigma, 16),
											),
											Complex.mul(
												16384,
												Complex.i,
												Complex.pow(p, 7),
												mu,
												Complex.pow(sigma, 14),
												H_BAR,
											),
										),
										Complex.mul(
											14336,
											Complex.pow(p, 6),
											Complex.pow(sigma, 12),
											Complex.add(
												-1,
												Complex.mul(2, Complex.pow(mu, 2)),
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											Complex.pow(H_BAR, 2),
										),
									),
									Complex.mul(
										14336,
										Complex.i,
										Complex.pow(p, 5),
										mu,
										Complex.pow(sigma, 10),
										Complex.add(
											-3,
											Complex.mul(2, Complex.pow(mu, 2)),
											Complex.mul(12, Complex.pow(sigma, 4)),
										),
										Complex.pow(H_BAR, 3),
									),
									Complex.mul(
										4480,
										Complex.pow(p, 4),
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(4, Complex.pow(mu, 4)),
											Complex.mul(
												3,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												12,
												Complex.pow(mu, 2),
												Complex.pow(s4_, 4),
											),
										),
										Complex.pow(H_BAR, 4),
									),
								),
								Complex.mul(
									1792,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(4, Complex.pow(mu, 4)),
										Complex.mul(
											15,
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											20,
											Complex.pow(mu, 2),
											Complex.pow(s4_, 4),
										),
									),
									Complex.pow(H_BAR, 5),
								),
							),
							Complex.mul(
								224,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(8, Complex.pow(mu, 6)),
									Complex.mul(
										90,
										Complex.pow(mu, 2),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										60,
										Complex.pow(mu, 4),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										15,
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
								),
								Complex.pow(H_BAR, 6),
							),
						),
						Complex.mul(
							32,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(8, Complex.pow(mu, 6)),
								Complex.mul(
									210,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									84,
									Complex.pow(mu, 4),
									Complex.pow(s4_, 4),
								),
								Complex.mul(105, Complex.pow(Complex.pow(s4_, 4), 3)),
							),
							Complex.pow(H_BAR, 7),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(16, Complex.pow(mu, 8)),
								Complex.mul(
									840,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									105,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									224,
									Complex.pow(mu, 6),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									840,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
							),
							Complex.pow(H_BAR, 8),
						),
					),
				),
			);
		case 9:
			return Complex.mul(
				coef_,
				Complex.mul(
					32,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.mul(
													8192,
													Complex.i,
													Complex.pow(p, 9),
													Complex.pow(sigma, 18),
												),
												Complex.mul(
													36864,
													Complex.pow(p, 8),
													mu,
													Complex.pow(sigma, 16),
													H_BAR,
												),
											),
											Complex.mul(
												36864,
												Complex.i,
												Complex.pow(p, 7),
												Complex.pow(sigma, 14),
												Complex.add(
													-1,
													Complex.mul(2, Complex.pow(mu, 2)),
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												Complex.pow(H_BAR, 2),
											),
										),
										Complex.mul(
											43008,
											Complex.pow(p, 6),
											mu,
											Complex.pow(sigma, 12),
											Complex.add(
												-3,
												Complex.mul(2, Complex.pow(mu, 2)),
												Complex.mul(12, Complex.pow(sigma, 4)),
											),
											Complex.pow(H_BAR, 3),
										),
									),
									Complex.mul(
										16128,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(4, Complex.pow(mu, 4)),
											Complex.mul(
												3,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												12,
												Complex.pow(mu, 2),
												Complex.pow(s4_, 4),
											),
										),
										Complex.pow(H_BAR, 4),
									),
									Complex.mul(
										8064,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(4, Complex.pow(mu, 4)),
											Complex.mul(
												15,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												20,
												Complex.pow(mu, 2),
												Complex.pow(s4_, 4),
											),
										),
										Complex.pow(H_BAR, 5),
									),
								),
								Complex.mul(
									1344,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(8, Complex.pow(mu, 6)),
										Complex.mul(
											90,
											Complex.pow(mu, 2),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											60,
											Complex.pow(mu, 4),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											15,
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
									),
									Complex.pow(H_BAR, 6),
								),
							),
							Complex.mul(
								288,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(8, Complex.pow(mu, 6)),
									Complex.mul(
										210,
										Complex.pow(mu, 2),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										84,
										Complex.pow(mu, 4),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										105,
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
								),
								Complex.pow(H_BAR, 7),
							),
						),
						Complex.mul(
							18,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(16, Complex.pow(mu, 8)),
								Complex.mul(
									840,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									105,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									224,
									Complex.pow(mu, 6),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									840,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
							),
							Complex.pow(H_BAR, 8),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(16, Complex.pow(mu, 8)),
								Complex.mul(
									1512,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									945,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									288,
									Complex.pow(mu, 6),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									2520,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
							),
							Complex.pow(H_BAR, 9),
						),
					),
				),
			);
		case 10:
			return Complex.mul(
				coef_,
				Complex.mul(
					32,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.mul(
													-32768,
													Complex.pow(p, 10),
													Complex.pow(sigma, 20),
												),
												Complex.mul(
													163840,
													Complex.i,
													Complex.pow(p, 9),
													mu,
													Complex.pow(sigma, 18),
													H_BAR,
												),
												Complex.mul(
													184320,
													Complex.pow(p, 8),
													Complex.pow(sigma, 16),
													Complex.add(
														-1,
														Complex.mul(
															2,
															Complex.pow(mu, 2),
														),
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													Complex.pow(H_BAR, 2),
												),
											),
											Complex.mul(
												245760,
												Complex.i,
												Complex.pow(p, 7),
												mu,
												Complex.pow(sigma, 14),
												Complex.add(
													-3,
													Complex.mul(2, Complex.pow(mu, 2)),
													Complex.mul(
														12,
														Complex.pow(sigma, 4),
													),
												),
												Complex.pow(H_BAR, 3),
											),
										),
										Complex.mul(
											107520,
											Complex.pow(p, 6),
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(4, Complex.pow(mu, 4)),
												Complex.mul(
													3,
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													12,
													Complex.pow(mu, 2),
													Complex.pow(s4_, 4),
												),
											),
											Complex.pow(H_BAR, 4),
										),
									),
									Complex.mul(
										64512,
										Complex.i,
										Complex.pow(p, 5),
										mu,
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(4, Complex.pow(mu, 4)),
											Complex.mul(
												15,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												20,
												Complex.pow(mu, 2),
												Complex.pow(s4_, 4),
											),
										),
										Complex.pow(H_BAR, 5),
									),
									Complex.mul(
										13440,
										Complex.pow(p, 4),
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(8, Complex.pow(mu, 6)),
											Complex.mul(
												90,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												60,
												Complex.pow(mu, 4),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												15,
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 6),
									),
								),
								Complex.mul(
									3840,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(8, Complex.pow(mu, 6)),
										Complex.mul(
											210,
											Complex.pow(mu, 2),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											84,
											Complex.pow(mu, 4),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											105,
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
									),
									Complex.pow(H_BAR, 7),
								),
							),
							Complex.mul(
								360,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(16, Complex.pow(mu, 8)),
									Complex.mul(
										840,
										Complex.pow(mu, 4),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										105,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										224,
										Complex.pow(mu, 6),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										840,
										Complex.pow(mu, 2),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
								),
								Complex.pow(H_BAR, 8),
							),
						),
						Complex.mul(
							40,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(16, Complex.pow(mu, 8)),
								Complex.mul(
									1512,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									945,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									288,
									Complex.pow(mu, 6),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									2520,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
							),
							Complex.pow(H_BAR, 9),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(32, Complex.pow(mu, 10)),
								Complex.mul(
									5040,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									9450,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									720,
									Complex.pow(mu, 8),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									12600,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(945, Complex.pow(Complex.pow(s4_, 4), 5)),
							),
							Complex.pow(H_BAR, 10),
						),
					),
				),
			);
		case 11:
			return Complex.mul(
				coef_,
				Complex.mul(
					64,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.mul(
														-65536,
														Complex.i,
														Complex.pow(p, 11),
														Complex.pow(sigma, 22),
													),
													Complex.mul(
														360448,
														Complex.pow(p, 10),
														mu,
														Complex.pow(sigma, 20),
														H_BAR,
													),
												),
												Complex.mul(
													450560,
													Complex.i,
													Complex.pow(p, 9),
													Complex.pow(sigma, 18),
													Complex.add(
														-1,
														Complex.mul(
															2,
															Complex.pow(mu, 2),
														),
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													Complex.pow(H_BAR, 2),
												),
												Complex.mul(
													675840,
													Complex.pow(p, 8),
													mu,
													Complex.pow(sigma, 16),
													Complex.add(
														-3,
														Complex.mul(
															2,
															Complex.pow(mu, 2),
														),
														Complex.mul(
															12,
															Complex.pow(sigma, 4),
														),
													),
													Complex.pow(H_BAR, 3),
												),
											),
											Complex.mul(
												337920,
												Complex.i,
												Complex.pow(p, 7),
												Complex.pow(sigma, 14),
												Complex.add(
													Complex.mul(4, Complex.pow(mu, 4)),
													Complex.mul(
														3,
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															2,
														),
													),
													Complex.mul(
														12,
														Complex.pow(mu, 2),
														Complex.pow(s4_, 4),
													),
												),
												Complex.pow(H_BAR, 4),
											),
										),
										Complex.mul(
											236544,
											Complex.pow(p, 6),
											mu,
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(4, Complex.pow(mu, 4)),
												Complex.mul(
													15,
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													20,
													Complex.pow(mu, 2),
													Complex.pow(s4_, 4),
												),
											),
											Complex.pow(H_BAR, 5),
										),
									),
									Complex.mul(
										59136,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(8, Complex.pow(mu, 6)),
											Complex.mul(
												90,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												60,
												Complex.pow(mu, 4),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												15,
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 6),
									),
									Complex.mul(
										21120,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(8, Complex.pow(mu, 6)),
											Complex.mul(
												210,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												84,
												Complex.pow(mu, 4),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												105,
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 7),
									),
								),
								Complex.mul(
									2640,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(16, Complex.pow(mu, 8)),
										Complex.mul(
											840,
											Complex.pow(mu, 4),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											105,
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												4,
											),
										),
										Complex.mul(
											224,
											Complex.pow(mu, 6),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											840,
											Complex.pow(mu, 2),
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
									),
									Complex.pow(H_BAR, 8),
								),
							),
							Complex.mul(
								440,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(16, Complex.pow(mu, 8)),
									Complex.mul(
										1512,
										Complex.pow(mu, 4),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										945,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										288,
										Complex.pow(mu, 6),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										2520,
										Complex.pow(mu, 2),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
								),
								Complex.pow(H_BAR, 9),
							),
						),
						Complex.mul(
							22,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(32, Complex.pow(mu, 10)),
								Complex.mul(
									5040,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									9450,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									720,
									Complex.pow(mu, 8),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									12600,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(945, Complex.pow(Complex.pow(s4_, 4), 5)),
							),
							Complex.pow(H_BAR, 10),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(32, Complex.pow(mu, 10)),
								Complex.mul(
									7920,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									34650,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									880,
									Complex.pow(mu, 8),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									27720,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(10395, Complex.pow(Complex.pow(s4_, 4), 5)),
							),
							Complex.pow(H_BAR, 11),
						),
					),
				),
			);
		case 12:
			return Complex.mul(
				coef_,
				Complex.mul(
					64,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.sub(
														Complex.mul(
															262144,
															Complex.pow(p, 12),
															Complex.pow(sigma, 24),
														),
														Complex.mul(
															1572864,
															Complex.i,
															Complex.pow(p, 11),
															mu,
															Complex.pow(sigma, 22),
															H_BAR,
														),
													),
													Complex.mul(
														2162688,
														Complex.pow(p, 10),
														Complex.pow(sigma, 20),
														Complex.add(
															-1,
															Complex.mul(
																2,
																Complex.pow(mu, 2),
															),
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														Complex.pow(H_BAR, 2),
													),
												),
												Complex.mul(
													3604480,
													Complex.i,
													Complex.pow(p, 9),
													mu,
													Complex.pow(sigma, 18),
													Complex.add(
														-3,
														Complex.mul(
															2,
															Complex.pow(mu, 2),
														),
														Complex.mul(
															12,
															Complex.pow(sigma, 4),
														),
													),
													Complex.pow(H_BAR, 3),
												),
												Complex.mul(
													2027520,
													Complex.pow(p, 8),
													Complex.pow(sigma, 16),
													Complex.add(
														Complex.mul(
															4,
															Complex.pow(mu, 4),
														),
														Complex.mul(
															3,
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															12,
															Complex.pow(mu, 2),
															Complex.pow(s4_, 4),
														),
													),
													Complex.pow(H_BAR, 4),
												),
											),
											Complex.mul(
												1622016,
												Complex.i,
												Complex.pow(p, 7),
												mu,
												Complex.pow(sigma, 14),
												Complex.add(
													Complex.mul(4, Complex.pow(mu, 4)),
													Complex.mul(
														15,
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															2,
														),
													),
													Complex.mul(
														20,
														Complex.pow(mu, 2),
														Complex.pow(s4_, 4),
													),
												),
												Complex.pow(H_BAR, 5),
											),
										),
										Complex.mul(
											473088,
											Complex.pow(p, 6),
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(8, Complex.pow(mu, 6)),
												Complex.mul(
													90,
													Complex.pow(mu, 2),
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													60,
													Complex.pow(mu, 4),
													Complex.pow(s4_, 4),
												),
												Complex.mul(
													15,
													Complex.pow(Complex.pow(s4_, 4), 3),
												),
											),
											Complex.pow(H_BAR, 6),
										),
									),
									Complex.mul(
										202752,
										Complex.i,
										Complex.pow(p, 5),
										mu,
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(8, Complex.pow(mu, 6)),
											Complex.mul(
												210,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												84,
												Complex.pow(mu, 4),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												105,
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 7),
									),
									Complex.mul(
										31680,
										Complex.pow(p, 4),
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(16, Complex.pow(mu, 8)),
											Complex.mul(
												840,
												Complex.pow(mu, 4),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												105,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												224,
												Complex.pow(mu, 6),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												840,
												Complex.pow(mu, 2),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 8),
									),
								),
								Complex.mul(
									7040,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(16, Complex.pow(mu, 8)),
										Complex.mul(
											1512,
											Complex.pow(mu, 4),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											945,
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												4,
											),
										),
										Complex.mul(
											288,
											Complex.pow(mu, 6),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											2520,
											Complex.pow(mu, 2),
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
									),
									Complex.pow(H_BAR, 9),
								),
							),
							Complex.mul(
								528,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(32, Complex.pow(mu, 10)),
									Complex.mul(
										5040,
										Complex.pow(mu, 6),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										9450,
										Complex.pow(mu, 2),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										720,
										Complex.pow(mu, 8),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										12600,
										Complex.pow(mu, 4),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
									Complex.mul(
										945,
										Complex.pow(Complex.pow(s4_, 4), 5),
									),
								),
								Complex.pow(H_BAR, 10),
							),
						),
						Complex.mul(
							48,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(32, Complex.pow(mu, 10)),
								Complex.mul(
									7920,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									34650,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									880,
									Complex.pow(mu, 8),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									27720,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(10395, Complex.pow(Complex.pow(s4_, 4), 5)),
							),
							Complex.pow(H_BAR, 11),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(64, Complex.pow(mu, 12)),
								Complex.mul(
									23760,
									Complex.pow(mu, 8),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									207900,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									10395,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									2112,
									Complex.pow(mu, 10),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									110880,
									Complex.pow(mu, 6),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									124740,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
							),
							Complex.pow(H_BAR, 12),
						),
					),
				),
			);
		case 13:
			return Complex.mul(
				coef_,
				Complex.mul(
					128,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.sub(
														Complex.add(
															Complex.mul(
																524288,
																Complex.i,
																Complex.pow(p, 13),
																Complex.pow(sigma, 26),
															),
															Complex.mul(
																3407872,
																Complex.pow(p, 12),
																mu,
																Complex.pow(sigma, 24),
																H_BAR,
															),
														),
														Complex.mul(
															5111808,
															Complex.i,
															Complex.pow(p, 11),
															Complex.pow(sigma, 22),
															Complex.add(
																-1,
																Complex.mul(
																	2,
																	Complex.pow(mu, 2),
																),
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															Complex.pow(H_BAR, 2),
														),
													),
													Complex.mul(
														9371648,
														Complex.pow(p, 10),
														mu,
														Complex.pow(sigma, 20),
														Complex.add(
															-3,
															Complex.mul(
																2,
																Complex.pow(mu, 2),
															),
															Complex.mul(
																12,
																Complex.pow(sigma, 4),
															),
														),
														Complex.pow(H_BAR, 3),
													),
												),
												Complex.mul(
													5857280,
													Complex.i,
													Complex.pow(p, 9),
													Complex.pow(sigma, 18),
													Complex.add(
														Complex.mul(
															4,
															Complex.pow(mu, 4),
														),
														Complex.mul(
															3,
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															12,
															Complex.pow(mu, 2),
															Complex.pow(s4_, 4),
														),
													),
													Complex.pow(H_BAR, 4),
												),
												Complex.mul(
													5271552,
													Complex.pow(p, 8),
													mu,
													Complex.pow(sigma, 16),
													Complex.add(
														Complex.mul(
															4,
															Complex.pow(mu, 4),
														),
														Complex.mul(
															15,
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															20,
															Complex.pow(mu, 2),
															Complex.pow(s4_, 4),
														),
													),
													Complex.pow(H_BAR, 5),
												),
											),
											Complex.mul(
												1757184,
												Complex.i,
												Complex.pow(p, 7),
												Complex.pow(sigma, 14),
												Complex.add(
													Complex.mul(8, Complex.pow(mu, 6)),
													Complex.mul(
														90,
														Complex.pow(mu, 2),
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															2,
														),
													),
													Complex.mul(
														60,
														Complex.pow(mu, 4),
														Complex.pow(s4_, 4),
													),
													Complex.mul(
														15,
														Complex.pow(
															Complex.pow(s4_, 4),
															3,
														),
													),
												),
												Complex.pow(H_BAR, 6),
											),
										),
										Complex.mul(
											878592,
											Complex.pow(p, 6),
											mu,
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(8, Complex.pow(mu, 6)),
												Complex.mul(
													210,
													Complex.pow(mu, 2),
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													84,
													Complex.pow(mu, 4),
													Complex.pow(s4_, 4),
												),
												Complex.mul(
													105,
													Complex.pow(Complex.pow(s4_, 4), 3),
												),
											),
											Complex.pow(H_BAR, 7),
										),
									),
									Complex.mul(
										164736,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(16, Complex.pow(mu, 8)),
											Complex.mul(
												840,
												Complex.pow(mu, 4),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												105,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												224,
												Complex.pow(mu, 6),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												840,
												Complex.pow(mu, 2),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 8),
									),
									Complex.mul(
										45760,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(16, Complex.pow(mu, 8)),
											Complex.mul(
												1512,
												Complex.pow(mu, 4),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												945,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												288,
												Complex.pow(mu, 6),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												2520,
												Complex.pow(mu, 2),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 9),
									),
								),
								Complex.mul(
									4576,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(32, Complex.pow(mu, 10)),
										Complex.mul(
											5040,
											Complex.pow(mu, 6),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											9450,
											Complex.pow(mu, 2),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												4,
											),
										),
										Complex.mul(
											720,
											Complex.pow(mu, 8),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											12600,
											Complex.pow(mu, 4),
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
										Complex.mul(
											945,
											Complex.pow(Complex.pow(s4_, 4), 5),
										),
									),
									Complex.pow(H_BAR, 10),
								),
							),
							Complex.mul(
								624,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(32, Complex.pow(mu, 10)),
									Complex.mul(
										7920,
										Complex.pow(mu, 6),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										34650,
										Complex.pow(mu, 2),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										880,
										Complex.pow(mu, 8),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										27720,
										Complex.pow(mu, 4),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
									Complex.mul(
										10395,
										Complex.pow(Complex.pow(s4_, 4), 5),
									),
								),
								Complex.pow(H_BAR, 11),
							),
						),
						Complex.mul(
							26,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(64, Complex.pow(mu, 12)),
								Complex.mul(
									23760,
									Complex.pow(mu, 8),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									207900,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									10395,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									2112,
									Complex.pow(mu, 10),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									110880,
									Complex.pow(mu, 6),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									124740,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
							),
							Complex.pow(H_BAR, 12),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(64, Complex.pow(mu, 12)),
								Complex.mul(
									34320,
									Complex.pow(mu, 8),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									540540,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									135135,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									2496,
									Complex.pow(mu, 10),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									205920,
									Complex.pow(mu, 6),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									540540,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
							),
							Complex.pow(H_BAR, 13),
						),
					),
				),
			);
		case 14:
			return Complex.mul(
				coef_,
				Complex.mul(
					128,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.sub(
														Complex.add(
															Complex.mul(
																-2097152,
																Complex.pow(p, 14),
																Complex.pow(sigma, 28),
															),
															Complex.mul(
																14680064,
																Complex.i,
																Complex.pow(p, 13),
																mu,
																Complex.pow(sigma, 26),
																H_BAR,
															),
															Complex.mul(
																23855104,
																Complex.pow(p, 12),
																Complex.pow(sigma, 24),
																Complex.add(
																	-1,
																	Complex.mul(
																		2,
																		Complex.pow(
																			mu,
																			2,
																		),
																	),
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																Complex.pow(H_BAR, 2),
															),
														),
														Complex.mul(
															47710208,
															Complex.i,
															Complex.pow(p, 11),
															mu,
															Complex.pow(sigma, 22),
															Complex.add(
																-3,
																Complex.mul(
																	2,
																	Complex.pow(mu, 2),
																),
																Complex.mul(
																	12,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															Complex.pow(H_BAR, 3),
														),
													),
													Complex.mul(
														32800768,
														Complex.pow(p, 10),
														Complex.pow(sigma, 20),
														Complex.add(
															Complex.mul(
																4,
																Complex.pow(mu, 4),
															),
															Complex.mul(
																3,
																Complex.pow(
																	Complex.sub(
																		1,
																		Complex.mul(
																			4,
																			Complex.pow(
																				sigma,
																				4,
																			),
																		),
																	),
																	2,
																),
															),
															Complex.mul(
																12,
																Complex.pow(mu, 2),
																Complex.pow(s4_, 4),
															),
														),
														Complex.pow(H_BAR, 4),
													),
												),
												Complex.mul(
													32800768,
													Complex.i,
													Complex.pow(p, 9),
													mu,
													Complex.pow(sigma, 18),
													Complex.add(
														Complex.mul(
															4,
															Complex.pow(mu, 4),
														),
														Complex.mul(
															15,
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															20,
															Complex.pow(mu, 2),
															Complex.pow(s4_, 4),
														),
													),
													Complex.pow(H_BAR, 5),
												),
												Complex.mul(
													12300288,
													Complex.pow(p, 8),
													Complex.pow(sigma, 16),
													Complex.add(
														Complex.mul(
															8,
															Complex.pow(mu, 6),
														),
														Complex.mul(
															90,
															Complex.pow(mu, 2),
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															60,
															Complex.pow(mu, 4),
															Complex.pow(s4_, 4),
														),
														Complex.mul(
															15,
															Complex.pow(
																Complex.pow(s4_, 4),
																3,
															),
														),
													),
													Complex.pow(H_BAR, 6),
												),
											),
											Complex.mul(
												7028736,
												Complex.i,
												Complex.pow(p, 7),
												mu,
												Complex.pow(sigma, 14),
												Complex.add(
													Complex.mul(8, Complex.pow(mu, 6)),
													Complex.mul(
														210,
														Complex.pow(mu, 2),
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															2,
														),
													),
													Complex.mul(
														84,
														Complex.pow(mu, 4),
														Complex.pow(s4_, 4),
													),
													Complex.mul(
														105,
														Complex.pow(
															Complex.pow(s4_, 4),
															3,
														),
													),
												),
												Complex.pow(H_BAR, 7),
											),
										),
										Complex.mul(
											1537536,
											Complex.pow(p, 6),
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(16, Complex.pow(mu, 8)),
												Complex.mul(
													840,
													Complex.pow(mu, 4),
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													105,
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														4,
													),
												),
												Complex.mul(
													224,
													Complex.pow(mu, 6),
													Complex.pow(s4_, 4),
												),
												Complex.mul(
													840,
													Complex.pow(mu, 2),
													Complex.pow(Complex.pow(s4_, 4), 3),
												),
											),
											Complex.pow(H_BAR, 8),
										),
									),
									Complex.mul(
										512512,
										Complex.i,
										Complex.pow(p, 5),
										mu,
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(16, Complex.pow(mu, 8)),
											Complex.mul(
												1512,
												Complex.pow(mu, 4),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												945,
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												288,
												Complex.pow(mu, 6),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												2520,
												Complex.pow(mu, 2),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
										),
										Complex.pow(H_BAR, 9),
									),
									Complex.mul(
										64064,
										Complex.pow(p, 4),
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(32, Complex.pow(mu, 10)),
											Complex.mul(
												5040,
												Complex.pow(mu, 6),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												9450,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												720,
												Complex.pow(mu, 8),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												12600,
												Complex.pow(mu, 4),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
											Complex.mul(
												945,
												Complex.pow(Complex.pow(s4_, 4), 5),
											),
										),
										Complex.pow(H_BAR, 10),
									),
								),
								Complex.mul(
									11648,
									Complex.i,
									Complex.pow(p, 3),
									mu,
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(32, Complex.pow(mu, 10)),
										Complex.mul(
											7920,
											Complex.pow(mu, 6),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											34650,
											Complex.pow(mu, 2),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												4,
											),
										),
										Complex.mul(
											880,
											Complex.pow(mu, 8),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											27720,
											Complex.pow(mu, 4),
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
										Complex.mul(
											10395,
											Complex.pow(Complex.pow(s4_, 4), 5),
										),
									),
									Complex.pow(H_BAR, 11),
								),
							),
							Complex.mul(
								728,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(64, Complex.pow(mu, 12)),
									Complex.mul(
										23760,
										Complex.pow(mu, 8),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										207900,
										Complex.pow(mu, 4),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										10395,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											6,
										),
									),
									Complex.mul(
										2112,
										Complex.pow(mu, 10),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										110880,
										Complex.pow(mu, 6),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
									Complex.mul(
										124740,
										Complex.pow(mu, 2),
										Complex.pow(Complex.pow(s4_, 4), 5),
									),
								),
								Complex.pow(H_BAR, 12),
							),
						),
						Complex.mul(
							56,
							Complex.i,
							p,
							mu,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(64, Complex.pow(mu, 12)),
								Complex.mul(
									34320,
									Complex.pow(mu, 8),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									540540,
									Complex.pow(mu, 4),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									135135,
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									2496,
									Complex.pow(mu, 10),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									205920,
									Complex.pow(mu, 6),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									540540,
									Complex.pow(mu, 2),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
							),
							Complex.pow(H_BAR, 13),
						),
						Complex.mul(
							Complex.add(
								Complex.mul(128, Complex.pow(mu, 14)),
								Complex.mul(
									96096,
									Complex.pow(mu, 10),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									2522520,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									1891890,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									5824,
									Complex.pow(mu, 12),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									720720,
									Complex.pow(mu, 8),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									3783780,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
								Complex.mul(
									135135,
									Complex.pow(Complex.pow(s4_, 4), 7),
								),
							),
							Complex.pow(H_BAR, 14),
						),
					),
				),
			);
		case 15:
			return Complex.mul(
				coef_,
				Complex.mul(
					256,
					Complex.add(
						Complex.sub(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.sub(
														Complex.add(
															Complex.sub(
																Complex.mul(
																	-4194304,
																	Complex.i,
																	Complex.pow(p, 15),
																	Complex.pow(
																		sigma,
																		30,
																	),
																),
																Complex.mul(
																	31457280,
																	Complex.pow(p, 14),
																	mu,
																	Complex.pow(
																		sigma,
																		28,
																	),
																	H_BAR,
																),
															),
															Complex.mul(
																55050240,
																Complex.i,
																Complex.pow(p, 13),
																Complex.pow(sigma, 26),
																Complex.add(
																	-1,
																	Complex.mul(
																		2,
																		Complex.pow(
																			mu,
																			2,
																		),
																	),
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																Complex.pow(H_BAR, 2),
															),
															Complex.mul(
																119275520,
																Complex.pow(p, 12),
																mu,
																Complex.pow(sigma, 24),
																Complex.add(
																	-3,
																	Complex.mul(
																		2,
																		Complex.pow(
																			mu,
																			2,
																		),
																	),
																	Complex.mul(
																		12,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																Complex.pow(H_BAR, 3),
															),
														),
														Complex.mul(
															89456640,
															Complex.i,
															Complex.pow(p, 11),
															Complex.pow(sigma, 22),
															Complex.add(
																Complex.mul(
																	4,
																	Complex.pow(mu, 4),
																),
																Complex.mul(
																	3,
																	Complex.pow(
																		Complex.sub(
																			1,
																			Complex.mul(
																				4,
																				Complex.pow(
																					sigma,
																					4,
																				),
																			),
																		),
																		2,
																	),
																),
																Complex.mul(
																	12,
																	Complex.pow(mu, 2),
																	Complex.pow(s4_, 4),
																),
															),
															Complex.pow(H_BAR, 4),
														),
													),
													Complex.mul(
														98402304,
														Complex.pow(p, 10),
														mu,
														Complex.pow(sigma, 20),
														Complex.add(
															Complex.mul(
																4,
																Complex.pow(mu, 4),
															),
															Complex.mul(
																15,
																Complex.pow(
																	Complex.sub(
																		1,
																		Complex.mul(
																			4,
																			Complex.pow(
																				sigma,
																				4,
																			),
																		),
																	),
																	2,
																),
															),
															Complex.mul(
																20,
																Complex.pow(mu, 2),
																Complex.pow(s4_, 4),
															),
														),
														Complex.pow(H_BAR, 5),
													),
												),
												Complex.mul(
													41000960,
													Complex.i,
													Complex.pow(p, 9),
													Complex.pow(sigma, 18),
													Complex.add(
														Complex.mul(
															8,
															Complex.pow(mu, 6),
														),
														Complex.mul(
															90,
															Complex.pow(mu, 2),
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															60,
															Complex.pow(mu, 4),
															Complex.pow(s4_, 4),
														),
														Complex.mul(
															15,
															Complex.pow(
																Complex.pow(s4_, 4),
																3,
															),
														),
													),
													Complex.pow(H_BAR, 6),
												),
												Complex.mul(
													26357760,
													Complex.pow(p, 8),
													mu,
													Complex.pow(sigma, 16),
													Complex.add(
														Complex.mul(
															8,
															Complex.pow(mu, 6),
														),
														Complex.mul(
															210,
															Complex.pow(mu, 2),
															Complex.pow(
																Complex.sub(
																	1,
																	Complex.mul(
																		4,
																		Complex.pow(
																			sigma,
																			4,
																		),
																	),
																),
																2,
															),
														),
														Complex.mul(
															84,
															Complex.pow(mu, 4),
															Complex.pow(s4_, 4),
														),
														Complex.mul(
															105,
															Complex.pow(
																Complex.pow(s4_, 4),
																3,
															),
														),
													),
													Complex.pow(H_BAR, 7),
												),
											),
											Complex.mul(
												6589440,
												Complex.i,
												Complex.pow(p, 7),
												Complex.pow(sigma, 14),
												Complex.add(
													Complex.mul(16, Complex.pow(mu, 8)),
													Complex.mul(
														840,
														Complex.pow(mu, 4),
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															2,
														),
													),
													Complex.mul(
														105,
														Complex.pow(
															Complex.sub(
																1,
																Complex.mul(
																	4,
																	Complex.pow(
																		sigma,
																		4,
																	),
																),
															),
															4,
														),
													),
													Complex.mul(
														224,
														Complex.pow(mu, 6),
														Complex.pow(s4_, 4),
													),
													Complex.mul(
														840,
														Complex.pow(mu, 2),
														Complex.pow(
															Complex.pow(s4_, 4),
															3,
														),
													),
												),
												Complex.pow(H_BAR, 8),
											),
										),
										Complex.mul(
											2562560,
											Complex.pow(p, 6),
											mu,
											Complex.pow(sigma, 12),
											Complex.add(
												Complex.mul(16, Complex.pow(mu, 8)),
												Complex.mul(
													1512,
													Complex.pow(mu, 4),
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														2,
													),
												),
												Complex.mul(
													945,
													Complex.pow(
														Complex.sub(
															1,
															Complex.mul(
																4,
																Complex.pow(sigma, 4),
															),
														),
														4,
													),
												),
												Complex.mul(
													288,
													Complex.pow(mu, 6),
													Complex.pow(s4_, 4),
												),
												Complex.mul(
													2520,
													Complex.pow(mu, 2),
													Complex.pow(Complex.pow(s4_, 4), 3),
												),
											),
											Complex.pow(H_BAR, 9),
										),
									),
									Complex.mul(
										384384,
										Complex.i,
										Complex.pow(p, 5),
										Complex.pow(sigma, 10),
										Complex.add(
											Complex.mul(32, Complex.pow(mu, 10)),
											Complex.mul(
												5040,
												Complex.pow(mu, 6),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												9450,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												720,
												Complex.pow(mu, 8),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												12600,
												Complex.pow(mu, 4),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
											Complex.mul(
												945,
												Complex.pow(Complex.pow(s4_, 4), 5),
											),
										),
										Complex.pow(H_BAR, 10),
									),
									Complex.mul(
										87360,
										Complex.pow(p, 4),
										mu,
										Complex.pow(sigma, 8),
										Complex.add(
											Complex.mul(32, Complex.pow(mu, 10)),
											Complex.mul(
												7920,
												Complex.pow(mu, 6),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													2,
												),
											),
											Complex.mul(
												34650,
												Complex.pow(mu, 2),
												Complex.pow(
													Complex.sub(
														1,
														Complex.mul(
															4,
															Complex.pow(sigma, 4),
														),
													),
													4,
												),
											),
											Complex.mul(
												880,
												Complex.pow(mu, 8),
												Complex.pow(s4_, 4),
											),
											Complex.mul(
												27720,
												Complex.pow(mu, 4),
												Complex.pow(Complex.pow(s4_, 4), 3),
											),
											Complex.mul(
												10395,
												Complex.pow(Complex.pow(s4_, 4), 5),
											),
										),
										Complex.pow(H_BAR, 11),
									),
								),
								Complex.mul(
									7280,
									Complex.i,
									Complex.pow(p, 3),
									Complex.pow(sigma, 6),
									Complex.add(
										Complex.mul(64, Complex.pow(mu, 12)),
										Complex.mul(
											23760,
											Complex.pow(mu, 8),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												2,
											),
										),
										Complex.mul(
											207900,
											Complex.pow(mu, 4),
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												4,
											),
										),
										Complex.mul(
											10395,
											Complex.pow(
												Complex.sub(
													1,
													Complex.mul(
														4,
														Complex.pow(sigma, 4),
													),
												),
												6,
											),
										),
										Complex.mul(
											2112,
											Complex.pow(mu, 10),
											Complex.pow(s4_, 4),
										),
										Complex.mul(
											110880,
											Complex.pow(mu, 6),
											Complex.pow(Complex.pow(s4_, 4), 3),
										),
										Complex.mul(
											124740,
											Complex.pow(mu, 2),
											Complex.pow(Complex.pow(s4_, 4), 5),
										),
									),
									Complex.pow(H_BAR, 12),
								),
							),
							Complex.mul(
								840,
								Complex.pow(p, 2),
								mu,
								Complex.pow(sigma, 4),
								Complex.add(
									Complex.mul(64, Complex.pow(mu, 12)),
									Complex.mul(
										34320,
										Complex.pow(mu, 8),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											2,
										),
									),
									Complex.mul(
										540540,
										Complex.pow(mu, 4),
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											4,
										),
									),
									Complex.mul(
										135135,
										Complex.pow(
											Complex.sub(
												1,
												Complex.mul(4, Complex.pow(sigma, 4)),
											),
											6,
										),
									),
									Complex.mul(
										2496,
										Complex.pow(mu, 10),
										Complex.pow(s4_, 4),
									),
									Complex.mul(
										205920,
										Complex.pow(mu, 6),
										Complex.pow(Complex.pow(s4_, 4), 3),
									),
									Complex.mul(
										540540,
										Complex.pow(mu, 2),
										Complex.pow(Complex.pow(s4_, 4), 5),
									),
								),
								Complex.pow(H_BAR, 13),
							),
						),
						Complex.mul(
							30,
							Complex.i,
							p,
							Complex.pow(sigma, 2),
							Complex.add(
								Complex.mul(128, Complex.pow(mu, 14)),
								Complex.mul(
									96096,
									Complex.pow(mu, 10),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									2522520,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									1891890,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									5824,
									Complex.pow(mu, 12),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									720720,
									Complex.pow(mu, 8),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									3783780,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
								Complex.mul(
									135135,
									Complex.pow(Complex.pow(s4_, 4), 7),
								),
							),
							Complex.pow(H_BAR, 14),
						),
						Complex.mul(
							mu,
							Complex.add(
								Complex.mul(128, Complex.pow(mu, 14)),
								Complex.mul(
									131040,
									Complex.pow(mu, 10),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										2,
									),
								),
								Complex.mul(
									5405400,
									Complex.pow(mu, 6),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										4,
									),
								),
								Complex.mul(
									9459450,
									Complex.pow(mu, 2),
									Complex.pow(
										Complex.sub(
											1,
											Complex.mul(4, Complex.pow(sigma, 4)),
										),
										6,
									),
								),
								Complex.mul(
									6720,
									Complex.pow(mu, 12),
									Complex.pow(s4_, 4),
								),
								Complex.mul(
									1201200,
									Complex.pow(mu, 8),
									Complex.pow(Complex.pow(s4_, 4), 3),
								),
								Complex.mul(
									11351340,
									Complex.pow(mu, 4),
									Complex.pow(Complex.pow(s4_, 4), 5),
								),
								Complex.mul(
									2027025,
									Complex.pow(Complex.pow(s4_, 4), 7),
								),
							),
							Complex.pow(H_BAR, 15),
						),
					),
				),
			);
		default:
			throw new Error("Got n greater than N_MAX");
	}
}
