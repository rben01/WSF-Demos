# %%
using SymPy

T = sympy.symbols("T")
(x, t, τ, p₀, v) = sympy.symbols("x, t, τ, p₀, v"; real=true)
(m, σ, ħ, λ, λ₁, λ₂) = sympy.symbols("m, σ, ħ, λ, λ₁, λ₂"; positive=true)

h = ħ * 2 * PI
T_ = 1 + im * t / τ
τ_ = 2 * m * σ^2 / ħ
λ_ = ħ / (2 * σ)

integrate(expr, interval) = sympy.integrate(expr, interval)
integrate(expr) = integrate(expr, (x, -oo, oo))

inner_product(f, g) = integrate(conj(f) * g)

x_exp(f) = inner_product(f, x * f)
mntm(f) = -im * ħ * sympy.diff(f, x)
p_exp(f) = inner_product(f, mntm(f))

Ψ(x, t) =
    let T = T_
        1 / (σ * T * (2 * PI)^(1//2))^(1//2) *
        exp(1 / T * (-x^2 / (4 * σ^2) + im / ħ * (p₀ * x - p₀^2 * t / (2 * m))))
    end

Ψ(x, t)(τ => τ_) |> simplify

# %%

x_exp(x -> Ψ(x, t))

# %%
a = 1 / (2 * σ^2 * abs2(T))
b = -4 * σ^2 * p₀ * t / (ħ * τ)
c = 4 * σ^2 * p₀^2 * t^2 / (2 * m * ħ * τ)
k = a * (b^2 / 4 - c)
r = -b / 2

(exp(k) * r * sqrt(pi / a) / (σ * abs(T) * sqrt(2 * PI)))(T => T_, τ => τ_) |> simplify

# %%
imag(
    (1 - im * ħ * t / (2 * m * σ^2)) *
    (-x^2 / (4 * σ^2) + im / ħ * (p₀ * x - p₀^2 * t / (2 * m))),
) |> simplify

# %%
f = exp(-im * λ₁ * t) * sin(PI * x) + exp(-im * λ₂ * t) * sin(2 * PI * x)
conj(f) * sympy.diff(f, x) |> simplify
expand(conj(f) * sympy.diff(f, x))
# %%
integrate(-im * ħ * conj(f) * sympy.diff(f, x), (x, 0, 1)) |> simplify
