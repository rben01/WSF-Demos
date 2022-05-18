/* global Complex H_BAR */

function factorial(n) {
	let acc = 1;
	for (let i = 1; i <= n; i++) {
		acc *= i;
	}
	return acc;
}

function basisCoefficient(n, { sigma, p }) {
	const coef_ = Complex.div(
		Complex.mul(
			Complex.pow(2, Complex.div(3, 4)),
			Complex.pow(sigma, Complex.div(1, 2)),
			Complex.exp(
				Complex.sub(
					0,
					Complex.div(
						Complex.pow(p, 2),
						Complex.mul(
							Complex.add(2, Complex.div(1, Complex.pow(sigma, 2))),
							Complex.pow(H_BAR, 2),
						),
					),
				),
			),
		),
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
	);
	const s4_ = -1 + 4 * sigma ** 4;
	switch (n) {
		case 0:
			return Complex.mul(coef_, 1);
		case 1:
			return Complex.mul(
				coef_,
				Complex.mul(4, Complex.i, p, Complex.pow(sigma, 2)),
			);
		case 2:
			return Complex.mul(
				coef_,
				Complex.mul(
					-2,
					Complex.add(
						Complex.mul(8, Complex.pow(p, 2), Complex.pow(sigma, 4)),
						Complex.mul(Complex.sub(0, s4_), Complex.pow(H_BAR, 2)),
					),
				),
			);
		case 3:
			return Complex.mul(
				coef_,
				Complex.mul(
					-8,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.add(
						Complex.mul(8, Complex.pow(p, 2), Complex.pow(sigma, 4)),
						Complex.mul(3, Complex.sub(0, s4_), Complex.pow(H_BAR, 2)),
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
							Complex.mul(64, Complex.pow(p, 4), Complex.pow(sigma, 8)),
							Complex.mul(
								48,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								s4_,
								Complex.pow(H_BAR, 2),
							),
						),
						Complex.mul(
							3,
							Complex.pow(Complex.sub(0, s4_), 2),
							Complex.pow(H_BAR, 4),
						),
					),
				),
			);
		case 5:
			return Complex.mul(
				coef_,
				Complex.mul(
					16,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.add(
						Complex.sub(
							Complex.mul(64, Complex.pow(p, 4), Complex.pow(sigma, 8)),
							Complex.mul(
								80,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								s4_,
								Complex.pow(H_BAR, 2),
							),
						),
						Complex.mul(
							15,
							Complex.pow(Complex.sub(0, s4_), 2),
							Complex.pow(H_BAR, 4),
						),
					),
				),
			);
		case 6:
			return Complex.mul(
				coef_,
				Complex.mul(
					-8,
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.mul(
									512,
									Complex.pow(p, 6),
									Complex.pow(sigma, 12),
								),
								Complex.mul(
									960,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									s4_,
									Complex.pow(H_BAR, 2),
								),
							),
							Complex.mul(
								360,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 2),
								Complex.pow(H_BAR, 4),
							),
						),
						Complex.mul(15, Complex.pow(s4_, 3), Complex.pow(H_BAR, 6)),
					),
				),
			);
		case 7:
			return Complex.mul(
				coef_,
				Complex.mul(
					-32,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.mul(
									512,
									Complex.pow(p, 6),
									Complex.pow(sigma, 12),
								),
								Complex.mul(
									1344,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									s4_,
									Complex.pow(H_BAR, 2),
								),
							),
							Complex.mul(
								840,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 2),
								Complex.pow(H_BAR, 4),
							),
						),
						Complex.mul(105, Complex.pow(s4_, 3), Complex.pow(H_BAR, 6)),
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
							Complex.add(
								Complex.sub(
									Complex.mul(
										4096,
										Complex.pow(p, 8),
										Complex.pow(sigma, 16),
									),
									Complex.mul(
										14336,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										s4_,
										Complex.pow(H_BAR, 2),
									),
								),
								Complex.mul(
									13440,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 2),
									Complex.pow(H_BAR, 4),
								),
							),
							Complex.mul(
								3360,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 3),
								Complex.pow(H_BAR, 6),
							),
						),
						Complex.mul(
							105,
							Complex.pow(Complex.sub(0, s4_), 4),
							Complex.pow(H_BAR, 8),
						),
					),
				),
			);
		case 9:
			return Complex.mul(
				coef_,
				Complex.mul(
					64,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.add(
						Complex.sub(
							Complex.add(
								Complex.sub(
									Complex.mul(
										4096,
										Complex.pow(p, 8),
										Complex.pow(sigma, 16),
									),
									Complex.mul(
										18432,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										s4_,
										Complex.pow(H_BAR, 2),
									),
								),
								Complex.mul(
									24192,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 2),
									Complex.pow(H_BAR, 4),
								),
							),
							Complex.mul(
								10080,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 3),
								Complex.pow(H_BAR, 6),
							),
						),
						Complex.mul(
							945,
							Complex.pow(Complex.sub(0, s4_), 4),
							Complex.pow(H_BAR, 8),
						),
					),
				),
			);
		case 10:
			return Complex.mul(
				coef_,
				Complex.mul(
					-32,
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.mul(
											32768,
											Complex.pow(p, 10),
											Complex.pow(sigma, 20),
										),
										Complex.mul(
											184320,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											s4_,
											Complex.pow(H_BAR, 2),
										),
									),
									Complex.mul(
										322560,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 2),
										Complex.pow(H_BAR, 4),
									),
								),
								Complex.mul(
									201600,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 3),
									Complex.pow(H_BAR, 6),
								),
							),
							Complex.mul(
								37800,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 4),
								Complex.pow(H_BAR, 8),
							),
						),
						Complex.mul(945, Complex.pow(s4_, 5), Complex.pow(H_BAR, 10)),
					),
				),
			);
		case 11:
			return Complex.mul(
				coef_,
				Complex.mul(
					-128,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.mul(
											32768,
											Complex.pow(p, 10),
											Complex.pow(sigma, 20),
										),
										Complex.mul(
											225280,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											s4_,
											Complex.pow(H_BAR, 2),
										),
									),
									Complex.mul(
										506880,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 2),
										Complex.pow(H_BAR, 4),
									),
								),
								Complex.mul(
									443520,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 3),
									Complex.pow(H_BAR, 6),
								),
							),
							Complex.mul(
								138600,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 4),
								Complex.pow(H_BAR, 8),
							),
						),
						Complex.mul(10395, Complex.pow(s4_, 5), Complex.pow(H_BAR, 10)),
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
							Complex.add(
								Complex.sub(
									Complex.add(
										Complex.sub(
											Complex.mul(
												262144,
												Complex.pow(p, 12),
												Complex.pow(sigma, 24),
											),
											Complex.mul(
												2162688,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												s4_,
												Complex.pow(H_BAR, 2),
											),
										),
										Complex.mul(
											6082560,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(Complex.sub(0, s4_), 2),
											Complex.pow(H_BAR, 4),
										),
									),
									Complex.mul(
										7096320,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(s4_, 3),
										Complex.pow(H_BAR, 6),
									),
								),
								Complex.mul(
									3326400,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 4),
									Complex.pow(H_BAR, 8),
								),
							),
							Complex.mul(
								498960,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 5),
								Complex.pow(H_BAR, 10),
							),
						),
						Complex.mul(
							10395,
							Complex.pow(Complex.sub(0, s4_), 6),
							Complex.pow(H_BAR, 12),
						),
					),
				),
			);
		case 13:
			return Complex.mul(
				coef_,
				Complex.mul(
					256,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.add(
						Complex.sub(
							Complex.add(
								Complex.sub(
									Complex.add(
										Complex.sub(
											Complex.mul(
												262144,
												Complex.pow(p, 12),
												Complex.pow(sigma, 24),
											),
											Complex.mul(
												2555904,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												s4_,
												Complex.pow(H_BAR, 2),
											),
										),
										Complex.mul(
											8785920,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(Complex.sub(0, s4_), 2),
											Complex.pow(H_BAR, 4),
										),
									),
									Complex.mul(
										13178880,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(s4_, 3),
										Complex.pow(H_BAR, 6),
									),
								),
								Complex.mul(
									8648640,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 4),
									Complex.pow(H_BAR, 8),
								),
							),
							Complex.mul(
								2162160,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 5),
								Complex.pow(H_BAR, 10),
							),
						),
						Complex.mul(
							135135,
							Complex.pow(Complex.sub(0, s4_), 6),
							Complex.pow(H_BAR, 12),
						),
					),
				),
			);
		case 14:
			return Complex.mul(
				coef_,
				Complex.mul(
					-128,
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.add(
											Complex.sub(
												Complex.mul(
													2097152,
													Complex.pow(p, 14),
													Complex.pow(sigma, 28),
												),
												Complex.mul(
													23855104,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													s4_,
													Complex.pow(H_BAR, 2),
												),
											),
											Complex.mul(
												98402304,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(Complex.sub(0, s4_), 2),
												Complex.pow(H_BAR, 4),
											),
										),
										Complex.mul(
											184504320,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(s4_, 3),
											Complex.pow(H_BAR, 6),
										),
									),
									Complex.mul(
										161441280,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 4),
										Complex.pow(H_BAR, 8),
									),
								),
								Complex.mul(
									60540480,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 5),
									Complex.pow(H_BAR, 10),
								),
							),
							Complex.mul(
								7567560,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 6),
								Complex.pow(H_BAR, 12),
							),
						),
						Complex.mul(
							135135,
							Complex.pow(s4_, 7),
							Complex.pow(H_BAR, 14),
						),
					),
				),
			);
		case 15:
			return Complex.mul(
				coef_,
				Complex.mul(
					-512,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.add(
											Complex.sub(
												Complex.mul(
													2097152,
													Complex.pow(p, 14),
													Complex.pow(sigma, 28),
												),
												Complex.mul(
													27525120,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													s4_,
													Complex.pow(H_BAR, 2),
												),
											),
											Complex.mul(
												134184960,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(Complex.sub(0, s4_), 2),
												Complex.pow(H_BAR, 4),
											),
										),
										Complex.mul(
											307507200,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(s4_, 3),
											Complex.pow(H_BAR, 6),
										),
									),
									Complex.mul(
										345945600,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 4),
										Complex.pow(H_BAR, 8),
									),
								),
								Complex.mul(
									181621440,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 5),
									Complex.pow(H_BAR, 10),
								),
							),
							Complex.mul(
								37837800,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 6),
								Complex.pow(H_BAR, 12),
							),
						),
						Complex.mul(
							2027025,
							Complex.pow(s4_, 7),
							Complex.pow(H_BAR, 14),
						),
					),
				),
			);
		case 16:
			return Complex.mul(
				coef_,
				Complex.mul(
					256,
					Complex.add(
						Complex.sub(
							Complex.add(
								Complex.sub(
									Complex.add(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.mul(
														16777216,
														Complex.pow(p, 16),
														Complex.pow(sigma, 32),
													),
													Complex.mul(
														251658240,
														Complex.pow(p, 14),
														Complex.pow(sigma, 28),
														s4_,
														Complex.pow(H_BAR, 2),
													),
												),
												Complex.mul(
													1431306240,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													Complex.pow(Complex.sub(0, s4_), 2),
													Complex.pow(H_BAR, 4),
												),
											),
											Complex.mul(
												3936092160,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(s4_, 3),
												Complex.pow(H_BAR, 6),
											),
										),
										Complex.mul(
											5535129600,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(Complex.sub(0, s4_), 4),
											Complex.pow(H_BAR, 8),
										),
									),
									Complex.mul(
										3874590720,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(s4_, 5),
										Complex.pow(H_BAR, 10),
									),
								),
								Complex.mul(
									1210809600,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 6),
									Complex.pow(H_BAR, 12),
								),
							),
							Complex.mul(
								129729600,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 7),
								Complex.pow(H_BAR, 14),
							),
						),
						Complex.mul(
							2027025,
							Complex.pow(Complex.sub(0, s4_), 8),
							Complex.pow(H_BAR, 16),
						),
					),
				),
			);
		case 17:
			return Complex.mul(
				coef_,
				Complex.mul(
					1024,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.add(
						Complex.sub(
							Complex.add(
								Complex.sub(
									Complex.add(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.mul(
														16777216,
														Complex.pow(p, 16),
														Complex.pow(sigma, 32),
													),
													Complex.mul(
														285212672,
														Complex.pow(p, 14),
														Complex.pow(sigma, 28),
														s4_,
														Complex.pow(H_BAR, 2),
													),
												),
												Complex.mul(
													1871708160,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													Complex.pow(Complex.sub(0, s4_), 2),
													Complex.pow(H_BAR, 4),
												),
											),
											Complex.mul(
												6083051520,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(s4_, 3),
												Complex.pow(H_BAR, 6),
											),
										),
										Complex.mul(
											10455244800,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(Complex.sub(0, s4_), 4),
											Complex.pow(H_BAR, 8),
										),
									),
									Complex.mul(
										9409720320,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(s4_, 5),
										Complex.pow(H_BAR, 10),
									),
								),
								Complex.mul(
									4116752640,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 6),
									Complex.pow(H_BAR, 12),
								),
							),
							Complex.mul(
								735134400,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 7),
								Complex.pow(H_BAR, 14),
							),
						),
						Complex.mul(
							34459425,
							Complex.pow(Complex.sub(0, s4_), 8),
							Complex.pow(H_BAR, 16),
						),
					),
				),
			);
		case 18:
			return Complex.mul(
				coef_,
				Complex.mul(
					-512,
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.add(
											Complex.sub(
												Complex.add(
													Complex.sub(
														Complex.mul(
															134217728,
															Complex.pow(p, 18),
															Complex.pow(sigma, 36),
														),
														Complex.mul(
															2566914048,
															Complex.pow(p, 16),
															Complex.pow(sigma, 32),
															s4_,
															Complex.pow(H_BAR, 2),
														),
													),
													Complex.mul(
														19251855360,
														Complex.pow(p, 14),
														Complex.pow(sigma, 28),
														Complex.pow(
															Complex.sub(0, s4_),
															2,
														),
														Complex.pow(H_BAR, 4),
													),
												),
												Complex.mul(
													72996618240,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													Complex.pow(s4_, 3),
													Complex.pow(H_BAR, 6),
												),
											),
											Complex.mul(
												150555525120,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(Complex.sub(0, s4_), 4),
												Complex.pow(H_BAR, 8),
											),
										),
										Complex.mul(
											169374965760,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(s4_, 5),
											Complex.pow(H_BAR, 10),
										),
									),
									Complex.mul(
										98802063360,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 6),
										Complex.pow(H_BAR, 12),
									),
								),
								Complex.mul(
									26464838400,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 7),
									Complex.pow(H_BAR, 14),
								),
							),
							Complex.mul(
								2481078600,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 8),
								Complex.pow(H_BAR, 16),
							),
						),
						Complex.mul(
							34459425,
							Complex.pow(s4_, 9),
							Complex.pow(H_BAR, 18),
						),
					),
				),
			);
		case 19:
			return Complex.mul(
				coef_,
				Complex.mul(
					-2048,
					Complex.i,
					p,
					Complex.pow(sigma, 2),
					Complex.sub(
						Complex.add(
							Complex.sub(
								Complex.add(
									Complex.sub(
										Complex.add(
											Complex.sub(
												Complex.add(
													Complex.sub(
														Complex.mul(
															134217728,
															Complex.pow(p, 18),
															Complex.pow(sigma, 36),
														),
														Complex.mul(
															2868903936,
															Complex.pow(p, 16),
															Complex.pow(sigma, 32),
															s4_,
															Complex.pow(H_BAR, 2),
														),
													),
													Complex.mul(
														24385683456,
														Complex.pow(p, 14),
														Complex.pow(sigma, 28),
														Complex.pow(
															Complex.sub(0, s4_),
															2,
														),
														Complex.pow(H_BAR, 4),
													),
												),
												Complex.mul(
													106687365120,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													Complex.pow(s4_, 3),
													Complex.pow(H_BAR, 6),
												),
											),
											Complex.mul(
												260050452480,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(Complex.sub(0, s4_), 4),
												Complex.pow(H_BAR, 8),
											),
										),
										Complex.mul(
											357569372160,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(s4_, 5),
											Complex.pow(H_BAR, 10),
										),
									),
									Complex.mul(
										268177029120,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(Complex.sub(0, s4_), 6),
										Complex.pow(H_BAR, 12),
									),
								),
								Complex.mul(
									100566385920,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(s4_, 7),
									Complex.pow(H_BAR, 14),
								),
							),
							Complex.mul(
								15713497800,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(Complex.sub(0, s4_), 8),
								Complex.pow(H_BAR, 16),
							),
						),
						Complex.mul(
							654729075,
							Complex.pow(s4_, 9),
							Complex.pow(H_BAR, 18),
						),
					),
				),
			);
		case 20:
			return Complex.mul(
				coef_,
				Complex.mul(
					1024,
					Complex.add(
						Complex.sub(
							Complex.add(
								Complex.sub(
									Complex.add(
										Complex.sub(
											Complex.add(
												Complex.sub(
													Complex.add(
														Complex.sub(
															Complex.mul(
																1073741824,
																Complex.pow(p, 20),
																Complex.pow(sigma, 40),
															),
															Complex.mul(
																25501368320,
																Complex.pow(p, 18),
																Complex.pow(sigma, 36),
																s4_,
																Complex.pow(H_BAR, 2),
															),
														),
														Complex.mul(
															243856834560,
															Complex.pow(p, 16),
															Complex.pow(sigma, 32),
															Complex.pow(
																Complex.sub(0, s4_),
																2,
															),
															Complex.pow(H_BAR, 4),
														),
													),
													Complex.mul(
														1219284172800,
														Complex.pow(p, 14),
														Complex.pow(sigma, 28),
														Complex.pow(s4_, 3),
														Complex.pow(H_BAR, 6),
													),
												),
												Complex.mul(
													3467339366400,
													Complex.pow(p, 12),
													Complex.pow(sigma, 24),
													Complex.pow(Complex.sub(0, s4_), 4),
													Complex.pow(H_BAR, 8),
												),
											),
											Complex.mul(
												5721109954560,
												Complex.pow(p, 10),
												Complex.pow(sigma, 20),
												Complex.pow(s4_, 5),
												Complex.pow(H_BAR, 10),
											),
										),
										Complex.mul(
											5363540582400,
											Complex.pow(p, 8),
											Complex.pow(sigma, 16),
											Complex.pow(Complex.sub(0, s4_), 6),
											Complex.pow(H_BAR, 12),
										),
									),
									Complex.mul(
										2681770291200,
										Complex.pow(p, 6),
										Complex.pow(sigma, 12),
										Complex.pow(s4_, 7),
										Complex.pow(H_BAR, 14),
									),
								),
								Complex.mul(
									628539912000,
									Complex.pow(p, 4),
									Complex.pow(sigma, 8),
									Complex.pow(Complex.sub(0, s4_), 8),
									Complex.pow(H_BAR, 16),
								),
							),
							Complex.mul(
								52378326000,
								Complex.pow(p, 2),
								Complex.pow(sigma, 4),
								Complex.pow(s4_, 9),
								Complex.pow(H_BAR, 18),
							),
						),
						Complex.mul(
							654729075,
							Complex.pow(Complex.sub(0, s4_), 10),
							Complex.pow(H_BAR, 20),
						),
					),
				),
			);
		default:
			throw new Error("Got n greater than N_MAX");
	}
}
