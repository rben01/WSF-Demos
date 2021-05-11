# %%
from sympy import I, exp, integrate, pi, sin, sqrt, Pow, symbols

x, mu, theta = symbols("x mu theta", real=True)
n = symbols("n", positive=True, integer=True)
sigma, L = symbols("sigma L", positive=True)

integrate(
    sqrt(2 / L) * sin(x * n * pi / L)
    # * exp(I * theta * (x - mu))
    * exp(-0.5 * Pow((x - mu) / sigma, 2)),
    (x, 0, L),
)
