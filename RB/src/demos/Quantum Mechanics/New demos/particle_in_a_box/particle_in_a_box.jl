# %%

using Printf
using QuadGK
using Makie
using CairoMakie
using LaTeXStrings
using GLM
using Logging

CairoMakie.activate!(; type="svg", px_per_unit=2)
# Infiltrator.toggle_async_check(false)

Base.@kwdef struct Parameters
    L::Float64
    μ::Float64
    p₀::Float64
    σ::Float64
    m::Float64 = 1
    ħ::Float64 = 1
end

function get_title(params::Parameters)
    (; L, μ, p₀, σ, m) = params
    return L"$L = %$L$; $x_0 = %$μ$; $\sigma_0 = %$σ$; $p_0 = %$p₀$; $m=%$m$"
end

struct EigenPair
    cₙ::ComplexF64
    ψₙ::Function
end

struct EigenfunctionExpansion <: AbstractVector{EigenPair}
    eigens::Vector{EigenPair}
end

Base.size(e::EigenfunctionExpansion) = size(e.eigens)
Base.IndexStyle(::Type{<:EigenfunctionExpansion}) = IndexStyle(Vector{EigenPair})
Base.getindex(e::EigenfunctionExpansion, i) = getindex(e.eigens, i)

# saved_mats = Dict{Parameters,Matrix{ComplexF64}}()

"""
Stores the computation of ψₙ.(xs) in a `length(xs) × n_max` matrix. That is, the i^th row
contains the evaluation at `xs[i]` and the j^th column contains the evaluation of `ψₙ`.
"""
struct ψₙCache <: AbstractMatrix{ComplexF64}
    mat::Matrix{ComplexF64}
end

Base.size(ψₙ_cache::ψₙCache) = size(ψₙ_cache.mat)
Base.IndexStyle(::Type{<:ψₙCache}) = IndexStyle(Matrix{ComplexF64})
Base.getindex(ψₙ_cache::ψₙCache, i) = getindex(ψₙ_cache.mat, i)

function get_ψₙ_cache(
    eigenfunction_expansion::EigenfunctionExpansion, xs::AbstractVector{<:Real}
)
    mat = zeros(ComplexF64, length(xs), length(eigenfunction_expansion))
    for (n, (; ψₙ)) in enumerate(eigenfunction_expansion)
        mat[:, n] .= ψₙ.(xs)
    end

    return ψₙCache(mat)
end

# %%

struct ConvergenceError{T<:Number} <: Exception
    n::Int
    cₙs_sum::T
    reason::String
end
ConvergenceError(n, cₙs_sum::T) where {T<:Number} = ConvergenceError{T}(n, cₙs_sum)

inner_product(f::Function, g::Function, x_min::Real, x_max::Real; atol=1e-7) =
    quadgk(x -> conj(f(x)) * g(x), x_min, x_max; atol)[1]

norm(f::Function, x_min::Real, x_max::Real) = sqrt(inner_product(f, f, x_min, x_max))

function get_eigenfunction_expansion(params::Parameters; tol=5e-6)
    # Throughout this function, we place closures in blocks `let n = n ... (closure) ...
    # end` for eager evaluation of n in function body; otherwise `n` refers to the variable
    # itself, which both hurts performance and refers to the value of `n` at the time the
    # closure is called, not the time it's defined \
    # Roughly the equivalent of the `lambda i=i: f(i)` trick in Python

    (; L, μ, p₀, σ, ħ) = params

    # note: this is `-((x-μ)/σ)^2 / 4`, not `... / 2` because it's the *sqrt* of a gaussian
    ψ_unnormed = let μ = μ, σ = σ, p₀ = p₀, ħ = ħ
        x ->
            1 / sqrt(σ * sqrt(2pi)) * exp(-0.25 * ((x - μ) / σ)^2 + (im * p₀ * (x - μ)) / ħ)
    end

    ψ = let ψ_initial_norm = norm(ψ_unnormed, 0, L)
        x -> ψ_unnormed(x) / ψ_initial_norm
    end

    @assert norm(ψ, 0, L) ≈ 1

    eigens = EigenPair[]

    max_n_allowed = 50000
    prev_cₙ_sq_sums = Tuple{Int,Float64}[]
    cₙ_sq_sum_eq_1_tol = tol
    n_model_datapoints = 6

    n = 0
    while true
        for _ in 1:2000
            n += 1

            ψₙ = let L = L, n = n
                x -> sqrt(2 / L) * sin((n * pi / L) * x)
            end

            cₙ = inner_product(ψₙ, ψ, 0, L)

            push!(eigens, EigenPair(cₙ, ψₙ))
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
        local cₙs_sq_sum = sum(eigen -> abs2(eigen.cₙ), Iterators.reverse(eigens))

        if cₙs_sq_sum > 1 || isapprox(cₙs_sq_sum, 1; atol=cₙ_sq_sum_eq_1_tol)
            @info "" cₙs_sq_sum n
            break
        end

        push!(prev_cₙ_sq_sums, (n, cₙs_sq_sum))

        # Use last several data points to build model of expected n needed to get the sum of
        # the squared cₙ's to get close enough to 1. If it exceeds max_n_allowed, throw a
        # ConvergenceError
        if length(prev_cₙ_sq_sums) >= n_model_datapoints && n > 5000
            data = prev_cₙ_sq_sums[(end - n_model_datapoints + 1):end]

            local X = hcat(ones(length(data)), first.(data))
            local y = last.(data)

            local ols = GLM.fit(LinearModel, X, y)
            local (b, a) = GLM.coef(ols)
            local predicted_n_max = (1 - b) / a

            @info "" cₙs_sq_sum n predicted_n_max
            if predicted_n_max > max_n_allowed
                throw(
                    ConvergenceError(
                        n,
                        cₙs_sq_sum,
                        "predicted n_max ($(predicted_n_max)), to achieve a sum near 1, exceeded maximum allowed ($(max_n_allowed))",
                    ),
                )
            end
        else
            @info "" cₙs_sq_sum n
        end

        if n > max_n_allowed
            throw(
                ConvergenceError(n, cₙs_sq_sum, "exceeded max_n_allowed ($(max_n_allowed))")
            )
        end
    end

    return EigenfunctionExpansion(eigens)
end

function Ψₜ!(
    Ψ::AbstractVector{<:ComplexF64},
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion,
    ψₙ_cache::ψₙCache,
    t::Real,
)
    (; L, m, ħ) = params

    ω_coef = (pi^2 * ħ^2) / (2 * m * L^2)

    fill!(Ψ, 0)

    for (n, (; cₙ, ψₙ)) in Iterators.reverse(enumerate(eigenfunction_expansion))
        ωₙ = n^2 * ω_coef
        Ψ .+= cₙ .* ψₙ_cache[:, n] .* exp(-im * ωₙ * t)
    end

    return nothing
end

function get_plots_dir()
    return mkpath(joinpath(@__DIR__, "plots"))
end

function get_save_path(params::Parameters, extn::AbstractString)
    (; L, μ, p₀, σ, m) = params

    outfile_basename = @sprintf "anim_L=%g_mu=%g_p0=%g_sigma=%g_m=%g.%s" L μ p₀ σ m extn
    dst = joinpath(get_plots_dir(), outfile_basename)

    return dst
end

function get_data_for_plot(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion;
    x_step::Real,
    t_max::Real,
    dt::Real,
)
    xs = range(0, params.L; step=x_step)
    Ψ = similar(xs, ComplexF64)
    ψₙ_cache = get_ψₙ_cache(eigenfunction_expansion, xs)

    ts = range(0, t_max; step=dt)

    return (; xs, Ψ, ψₙ_cache, ts)
end

function plot_particle_static(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion;
    x_step::Real,
    t_max::Real,
    dst=get_save_path(params, "mp4"),
    dt=0.05,
)
    (; xs, Ψ, ψₙ_cache, ts) = get_data_for_plot(
        params, eigenfunction_expansion; x_step, t_max, dt
    )

    fig = Figure(; resolution=(600, 900))
    ax = Axis(
        fig[1, :];
        xlabel=L"x",
        xaxisposition=:top,
        xlabelsize=20,
        ylabel=L"t",
        ylabelsize=20,
        yreversed=true,
        aspect=DataAspect(),
        title=get_title(params),
        titlegap=16,
        titlesize=20,
    )

    Makie.heatmap!(
        ax,
        xs,
        ts,
        abs2.(@view(wf_mat[begin:x_spacing:end, begin:t_spacing:end]));
        colormap=:inferno,
    )

    hidedecorations!(ax; label=false, ticklabels=false)

    Label(
        fig[0, :], "Probability Density Over Space and Time"; textsize=20, tellwidth=false
    )

    return fig
end

function plot_particle_video(params::Parameters; x_step::Real, t_max::Real, kwargs...)
    return plot_particle_video(
        params, get_eigenfunction_expansion(params); x_step, t_max, kwargs...
    )
end

function plot_particle_video(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion;
    x_step::Real,
    t_max::Real,
    dst=get_save_path(params, "mp4"),
    framerate=60,
    speed=1,
)
    framerate = @something framerate 60

    L = params.L
    time = Observable(0.0)

    fig = Figure(; resolution=(900, 600))
    ax = Axis(
        fig[1, :];
        xlabel=L"x",
        xaxisposition=:bottom,
        xlabelsize=20,
        xgridvisible=false,
        ylabel=L"|\Psi|^2",
        ylabelsize=20,
        ygridvisible=false,
        titlegap=16,
        titlesize=24,
        title=get_title(params),
        subtitle=@lift(latexstring(@sprintf "t=%.2f" $time)),
        subtitlesize=18,
    )
    xlims!(ax, (0, params.L))
    ylims!(ax, (0, 0.4))

    hidexdecorations!(ax; label=false)
    hideydecorations!(ax; label=false)

    ts = range(0, t_max; step=speed / framerate)

    zero_vec = zeros(Float64, size(xs))

    band_objs = band!(ax, xs, zero_vec, zero_vec; color="#007AC511")
    line_objs = lines!(ax, xs, zero_vec)

    # band_objs[2] is the band's upper line, line_objs[1] is the (sole) line
    paths = (band_objs[2], line_objs[1])
    on(time) do t
        Ψₜ!(Ψ, params, eigenfunction_expansion, ψₙ_cache, t)
        for path in paths
            path[] .= eltype(path[]).(xs, abs2.(Ψ))
        end
    end

    record(fig, dst, ts; framerate) do t
        time[] = t
    end

    return fig
end

# %%

params = Parameters(; L=40, μ=20, σ=5, p₀=5, m=2)
eigens = get_eigenfunction_expansion(params)

# %%

plot_particle_video(params, eigens; x_step=0.005, t_max=500, speed=3, framerate=60)
