# %%
from IPython.display import display
from sympy import (
    Abs,
    Eq,
    Q,
    S,
    Symbol,
    arg,
    collect,
    cos,
    cot,
    exp,
    integrate,
    oo,
    refine,
    simplify,
    sin,
    solve,
    solveset,
    sqrt,
    tan,
)
from sympy.simplify.radsimp import collect_sqrt

L = Symbol("L", real=True, positive=True)
x = Symbol("x", real=True)
m = Symbol("m", real=True, positive=True)
E = Symbol("E", real=True, positive=True)
U = Symbol("U", real=True, positive=True)
hbar = Symbol("hbar", real=True, positive=True)
C = Symbol("C", real=True, positive=True)
Y = Symbol("Y", real=True, positive=True)  # proxy for U-E

alpha = Symbol("alpha", real=True, positive=True)  # sqrt(2 * m * Y) / hbar
k = Symbol("k", real=True, positive=True)  # sqrt(2 * m * E) / hbar
K = U - E


# %%
# Even
B = C * exp(-alpha * L / 2) / cos(k * L / 2)
left_of_well_wavefunction = C * exp(alpha * x)
inside_well_wavefunction = B * cos(k * x)
right_of_well_wavefunction = C * exp(-alpha * x)

display(left_of_well_wavefunction, inside_well_wavefunction, right_of_well_wavefunction)

left_norm = simplify(integrate(left_of_well_wavefunction ** 2, (x, -oo, -L / 2)))
middle_norm = simplify(integrate(inside_well_wavefunction ** 2, (x, -L / 2, L / 2)))
right_norm = simplify(integrate(right_of_well_wavefunction ** 2, (x, L / 2, oo)))
# %%
solns = solveset(Eq(left_norm + middle_norm + right_norm, 1), C)

soln = next(iter(list(solns)))
C_soln = collect_sqrt(soln)
display(C_soln)
display(simplify((left_norm + middle_norm + right_norm).subs(C, C_soln)))

# %%
# Odd
B = -C * exp(-alpha * L / 2) / sin(k * L / 2)
left_of_well_wavefunction = C * exp(alpha * x)
inside_well_wavefunction = B * sin(k * x)
right_of_well_wavefunction = -C * exp(-alpha * x)

display(left_of_well_wavefunction, inside_well_wavefunction, right_of_well_wavefunction)

left_norm = simplify(integrate(left_of_well_wavefunction ** 2, (x, -oo, -L / 2)))
middle_norm = simplify(integrate(inside_well_wavefunction ** 2, (x, -L / 2, L / 2)))
right_norm = simplify(integrate(right_of_well_wavefunction ** 2, (x, L / 2, oo)))
# %%
solns = solveset(Eq(left_norm + middle_norm + right_norm, 1), C)

soln = next(iter(list(solns)))
C_soln = collect_sqrt(soln)
display(C_soln)
display(simplify((left_norm + middle_norm + right_norm).subs(C, C_soln)))

# %%
alpha1 = sqrt(2 * m * (U - E)) / hbar
k1 = sqrt(2 * m * E) / hbar
display(solveset(Eq(alpha1, k1 * tan(k1 * L / 2)), E))
display(solveset(Eq(alpha1, -k1 * cot(k1 * L / 2)), E))


# %%
solve(Eq(alpha1, -k1 * cot(k1 * L / 2)), E, numeric=True)
