# %%
using SymPy

T = sympy.symbols("T")
(x, t, τ, p₀, v) = sympy.symbols("x, t, τ, p₀, v"; real=true)
(m, σ, ħ, λ) = sympy.symbols("m, σ, ħ, λ"; positive=true)

h = ħ * 2 * PI
T_ = 1 + im * t / τ
τ_ = 2 * m * σ^2 / ħ
λ_ = ħ / (2 * σ)

integrate(expr, interval) = sympy.integrate(expr, interval)
integrate(expr) = integrate(expr, (x, -oo, oo))

inner_product(f, g) = integrate(f * conj(g))
x_exp(f) = inner_product(x * f, f)

Ψ(x, t) =
    let T = T_
        1 / (σ * T * (2 * PI)^(1//2))^(1//2) *
        exp(1 / T * (-x^2 / (4 * σ^2) + im / ħ * (p₀ * x - p₀^2 * t / (2 * m))))
    end

Ψ(x, t)(τ => τ_) |> simplify

# integrate(Ψ(x, t))

# %%

x_exp(x -> Ψ(x, t))

# %%
Ψ(x, t) * conj(Ψ(x, t)) |> simplify

# %%
# x_exp(exp(-(x - v * t)^2 + im * t / τ * (x^2 - v^2 * t^2)))
(1 - im * t / τ) * (-x^2 / (4 * σ^2) + im / ħ * (p₀ * x - p₀^2 * t / (2 * m))) |> expand
