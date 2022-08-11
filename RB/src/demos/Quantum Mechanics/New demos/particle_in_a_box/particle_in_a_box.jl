# %%

using Printf
using QuadGK
using Debugger
using Infiltrator
using Statistics
using Makie
using CairoMakie
using LaTeXStrings

CairoMakie.activate!(; type="svg")

Infiltrator.toggle_async_check(false)

Base.@kwdef struct Parameters{T<:Real}
    L::T
    μ::T
    p₀::T
    σ::T
    m::T = 1
    ħ::T = 1
end

# %%
saved_mats = Dict{Parameters,Matrix{ComplexF64}}()

# %%

struct ConvergenceError{T<:Number} <: Exception
    n::Int
    cₙs_sum::T
end
ConvergenceError(n, cₙs_sum::T) where {T<:Number} = ConvergenceError{T}(n, cₙs_sum)

Parameters(L, μ, p₀, σ, m, ħ) = Parameters(promote(L, μ, p₀, σ, m, ħ)...)

inner_product(f::Function, g::Function, x_min::Real, x_max::Real; atol=1e-5) =
    quadgk(x -> conj(f(x)) * g(x), x_min, x_max; atol)[1]

norm(f::Function, x_min::Real, x_max::Real) = sqrt(inner_product(f, f, x_min, x_max))
function norm(zs::AbstractVector{T}, dx::Real) where {T<:Number}
    acc = zero(T)

    n = length(zs)

    for i in 1:(n - 1)
        z1 = zs[i]
        z2 = zs[i + 1]

        z = (z1 + z2) / 2

        acc += abs2(z)
    end

    return sqrt(acc * dx)
end

function get_Ψ_mat(params::Parameters, xs::AbstractRange{<:Real}, ts::AbstractRange{<:Real})
    (; L, μ, p₀, σ, m, ħ) = params

    # ignore subsequent comment
    # note: this is `-((x-μ)/σ)^2 / 4`, not `... / 2` because it's the *sqrt* of a gaussian
    ψ_unnormed(x) =
        1 / sqrt(σ * sqrt(2pi)) * exp(-0.5 * ((x - μ) / σ)^2 + (2im * p₀ * (x - μ)) / ħ)
    ψ_initial_norm = norm(ψ_unnormed, 0, L)

    ψ(x) = ψ_unnormed(x) / ψ_initial_norm

    @assert norm(ψ, 0, L) ≈ 1

    ψₙs = Function[]
    cₙs = ComplexF64[]

    n = 0
    while true
        for _ in 1:2000
            n += 1

            ψₙ = x -> sqrt(2 / L) * sin((n * pi / L) * x)
            push!(ψₙs, ψₙ)

            cₙ = inner_product(ψₙ, ψ, 0, L)
            push!(cₙs, cₙ)
        end

        # Reverse for slightly better numerical accuracy \
        # Presumably, smaller numbers will be near the back of the array; adding them first
        # keeps their insignificant bits intact for longer. E.g., imagine your list is: \
        # [1e99, 1e-99, 1e-99, ..., 1e-99]  # 1e198 1e-99's \
        # Clearly the sum of the list is 2e99. But if you add front to back, one element at
        # a time, the difference in magnitude  between 1e99 and 1e-99, and the limited
        # number of significant digits in a f64, mean none of the 1e-99's actually ends up
        # contributing. \
        # But if you add right to left, at least some of the 1e-99's will contribute before
        # the front of the list has a chance to swamp them. (Of course, by the time it's
        # time to add the leftmost 1e-99, the running sum will be very close to 1e99, so...
        # ideally you'd actually move around the list, keeping several running sums going at
        # once, and only merge them when they're of similar magnitudes. But that sounds
        # really really really hard and almost certainly not worth it.) \
        #  Again, this depends on cₙs being roughly monotonically decreasing
        cₙs_sum = sum(Iterators.map(abs2, Iterators.reverse(cₙs)))

        @info "" cₙs_sum n
        if cₙs_sum > 1 || isapprox(cₙs_sum, 1; atol=1e-5)
            break
        end

        if n > 30000
            throw(ConvergenceError(n, cₙs_sum))
        end
    end

    n_max = n
    n_range = 1:n_max

    @info "" n_max

    ψₙs = [x -> sqrt(2 / L) * sin((n * pi / L) * x) for n in n_range]
    cₙs = [inner_product(ψₙs[n], ψ, 0, L) for n in n_range]

    ω_coef = (pi^2 * ħ^2) / (2 * m * L^2)
    ω(n) = n^2 * ω_coef

    wf_mat = zeros(ComplexF64, length(xs), length(ts))

    for (ni, n) in enumerate(reverse(n_range))
        cₙ = cₙs[n]
        ψₙ = ψₙs[n].(xs)
        ωₙ = ω(n)

        for (ti, t) in enumerate(ts)
            wf_mat[:, ti] .+= cₙ .* ψₙ .* exp(-im * ωₙ * t)
        end

        if ni % 100 == 0
            @info "progress" ni n_max
        end
    end

    return wf_mat
end

function get_save_path(params::Parameters, extn::AbstractString)
    (; L, μ, p₀, σ) = params

    plots_dir = mkpath(joinpath(@__DIR__, "plots"))
    outfile_basename = @sprintf "anim_L=%.2f_mu=%.2f_p0=%.2f_sigma=%.2f.%s" L μ p₀ σ extn
    dst = joinpath(plots_dir, outfile_basename)

    return dst
end

function get_wf_mat_dimensions(params::Parameters; dx, dt, t_max)
    L = params.L

    n_x_points = 1 + round(Int, L / dx)
    xs = range(0, L; length=n_x_points)
    ts = range(0, t_max; step=dt)

    return (; xs, ts)
end

function get_Ψ_mat(params::Parameters; dx, dt, t_max)
    (; xs, ts) = get_wf_mat_dimensions(params; dx, dt, t_max)
    wf_mat = get_Ψ_mat(params, xs, ts)
    return (; wf_mat, xs, ts)
end

function plot_particle(
    wf_mat::AbstractMatrix{<:Number},
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real};
    params::Parameters,
    x_spacing::Integer=1,
    t_spacing::Integer=1,
)
    (; L, μ, p₀, σ) = params

    fig_width = 800
    fig_height = round(
        Int, 45 + fig_width * (maximum(ts) - minimum(ts)) / (maximum(xs) - minimum(xs))
    )

    plot_title = L"""
        Probability Density over Space and Time
        $L = %$L$; $x_0 = μ$; \$\\sigma_0 = %g\$; \$p_0 = %g\$
        """

    (fig, ax, p) = Makie.heatmap(
        @view(xs[begin:x_spacing:end]),
        @view(ts[begin:t_spacing:end]),
        abs2.(@view(wf_mat[begin:x_spacing:end, begin:t_spacing:end]));
        figure=(; title=plot_title),
        axis=(; xlabel="𝑥", ylabel="𝑡", aspect=DataAspect(), title=plot_title),
        colormap=:inferno,

        # size=(fig_width, fig_height),
        # title=plot_title,
        # aspect_ratio=:equal,
        # legend=false,
        # xaxis=("𝑥", [0, L / 2, L]),
        # yaxis=("𝑡", :flip),
        # xmirror=true,
        # fontfamily="Helvetica",
    )

    return fig
end

(p, m) = collect(saved_mats)[8]
plot_particle(m, xs, ts; params=p)

# %%

for (μ, p₀, σ) in Iterators.product([10, 20, 30], [0, 2, 5, 10], [1, 2, 5, 10])
    L = 40
    params = Parameters(; L, μ, p₀, σ)

    (; xs, ts) = get_wf_mat_dimensions(params; dx=0.05, dt=0.05, t_max=60)
    @info "axes" params length(xs) length(ts)

    local Ψ_mat
    try
        Ψ_mat = get_Ψ_mat(params, xs, ts)
    catch e
        @error "Could not get a suitable cₙs_sum quickly enough; skipping" e
        continue
    end
    saved_mats[params] = Ψ_mat

    @info "plotting" params size(Ψ_mat) length(Ψ_mat)

    fig = plot_particle(Ψ_mat, xs, ts; params)

    dst = get_save_path(params, "svg")
    savefig(fig, dst)

    @info "plotted" params
end

# %%

params = Parameters(; L=40, μ=20, p₀=10, σ=10)

(; xs, ts) = get_wf_mat_dimensions(params; dx=0.01, dt=0.01, t_max=60)
@info "axes" length(xs) length(ts)

Ψ_mat = get_Ψ_mat(params, xs, ts)
saved_mats[params] = Ψ_mat

@info "plotting" params size(Ψ_mat) length(Ψ_mat)

fig = plot_particle(Ψ_mat, xs, ts; params)

dst = get_save_path(params, "png")
savefig(fig, dst)
@info "plotted"

fig

# %%

# function plot_particle(params::Parameters; dx, dt, t_max, dpi)
#     (; xs, ts, save_locs) = get_wf_mat_dimensions(params; dx, dt, t_max)
#     @info "axes" length(xs) length(ts) length(ts[save_locs])

#     wf_mat = get_wf_mat(params, xs, ts, save_locs)

#     @info "plotting" params wf_mat size(wf_mat) length(wf_mat)

#     fig = plot_particle(wf_mat, xs, ts, save_locs)
#     dst = get_save_path(params, "png")
#     save(dst, fig)
#     return fig
# end

# function plot_all()
#     params_vec = Parameters[]
#     for (L, p₀) in Iterators.product([20], [5])
#         μ = L / 2
#         σ = 0.5
#         push!(params_vec, Parameters(; L, μ, p₀, σ))
#     end

#     @info "plotting for parameter combinations" length(params_vec)
#     for params in params_vec
#         plot_particle(params)
#     end
# end

# @info "#== beginning plotting"
# plot_all()
# @info "==# all finished"

# const fontfamily = "Helvetica"
# const dark_theme = [
#     :linecolor => colorant"#5df",
#     :background => colorant"black",
#     :foreground_color => colorant"white",
#     :dpi => dpi,
#     :tickfontsize => 12,
#     :tickfontfamily => fontfamily,
#     :guidefontsize => 15,
# ]
