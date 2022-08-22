# %%

using Printf
using QuadGK
using Makie
using CairoMakie
using LaTeXStrings
using GLM
using Logging
using Colors
using HDF5

CairoMakie.activate!(; type="png", px_per_unit=2)
# Infiltrator.toggle_async_check(false)

Base.@kwdef struct Parameters
    L::Float64
    μ::Float64
    p₀::Float64
    σ::Float64
    m::Float64 = 1
    ħ::Float64 = 1
end

function params_title_latex(params::Parameters)
    (; L, μ, p₀, σ, m) = params
    fmt = Printf.Format(
        raw"$L = %.3g$; $x_0 = %.3g$; $\sigma_0 = %.3g$; $p_0 = %.3g$; $m=%.3g$"
    )
    return latexstring(Printf.format(fmt, L, μ, σ, p₀, m))
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

to_coefs_list(e::EigenfunctionExpansion) = [pair.cₙ for pair in e.eigens]
function from_coefs_list(::Type{<:EigenfunctionExpansion}, cₙs, params::Parameters)
    L = params.L
    eigens = EigenPair[]
    for (n, cₙ) in enumerate(cₙs)
        ψₙ = let L = L, n = n
            x -> sqrt(2 / L) * sin((n * pi / L) * x)
        end
        push!(eigens, EigenPair(cₙ, ψₙ))
    end

    return EigenfunctionExpansion(eigens)
end

Base.@kwdef struct EigenfunctionExpansionKwargs
    tol::Float64 = 5e-6
end

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

struct ConvergenceError{T<:Number} <: Exception
    n::Int
    cₙs_sum::T
    reason::String
end
ConvergenceError(n, cₙs_sum::T) where {T<:Number} = ConvergenceError{T}(n, cₙs_sum)

inner_product(f::Function, g::Function, x_min::Real, x_max::Real; atol=1e-7) =
    quadgk(x -> conj(f(x)) * g(x), x_min, x_max; atol)[1]

norm(f::Function, x_min::Real, x_max::Real) = sqrt(inner_product(f, f, x_min, x_max))

dataset_name(
    params::Parameters, eigenfunction_expansion_kwargs::EigenfunctionExpansionKwargs
) = "$(params)$(eigenfunction_expansion_kwargs)"

function save_eigens(
    path::AbstractString,
    eigenfunction_expansion::EigenfunctionExpansion,
    params::Parameters,
    eigenfunction_expansion_kwargs::EigenfunctionExpansionKwargs,
)
    h5open(path, "cw") do h5io
        save_eigens(h5io, eigenfunction_expansion, params, eigenfunction_expansion_kwargs)
    end
end

function save_eigens(
    h5io,
    eigenfunction_expansion::EigenfunctionExpansion,
    params::Parameters,
    eigenfunction_expansion_kwargs::EigenfunctionExpansionKwargs,
)
    group_name = "eigen_coefs"
    if !haskey(h5io, group_name)
        create_group(h5io, group_name)
    end
    g = h5io[group_name]

    ds_name = dataset_name(params, eigenfunction_expansion_kwargs)
    if haskey(g, ds_name)
        delete_object(g, ds_name)
    end
    g[ds_name] = to_coefs_list(eigenfunction_expansion)
    ds = g[ds_name]

    for (; obj, obj_name) in (
        (; obj=params, obj_name="params"),
        (; obj=eigenfunction_expansion_kwargs, obj_name="kwargs"),
    )
        for prop_name in propertynames(obj)
            HDF5.attrs(ds)["$(obj_name).$(prop_name)"] = getproperty(obj, prop_name)
        end
    end

    return nothing
end

function load_eigens(
    path::AbstractString,
    params::Parameters,
    eigenfunction_expansion_kwargs::EigenfunctionExpansionKwargs,
)
    h5open(path, "cw") do h5io
        load_eigens(h5io, params, eigenfunction_expansion_kwargs)
    end
end

function load_eigens(
    h5io, params::Parameters, eigenfunction_expansion_kwargs::EigenfunctionExpansionKwargs
)
    local ds
    try
        ds_name = dataset_name(params, eigenfunction_expansion_kwargs)
        ds = h5io["eigen_coefs/$(ds_name)"]
    catch
        return nothing
    end

    for (; obj, obj_name) in (
        (; obj=params, obj_name="params"),
        (; obj=eigenfunction_expansion_kwargs, obj_name="kwargs"),
    )
        for prop_name in propertynames(obj)
            existing_value = HDF5.attrs(ds)["$(obj_name).$(prop_name)"]
            expected_value = getproperty(obj, prop_name)
            if existing_value != expected_value
                @warn(
                    "The dataset corresponding to the provided parameters exists, but its attributes did not match the provided attributes. The existing dataset will be treated as nonexistent.",
                    attr = "$(obj_name).$(prop_name)",
                    existing_value,
                    expected_value
                )
                return nothing
            end
        end
    end

    return from_coefs_list(EigenfunctionExpansion, read(ds), params)
end

function get_eigenfunction_expansion(
    params::Parameters;
    cache_file=joinpath(@__DIR__, "eigenfunction_coefficients.h5"),
    tol=5e-6,
)
    kwargs = EigenfunctionExpansionKwargs(; tol)
    if cache_file !== nothing
        cached_eigens = load_eigens(cache_file, params, kwargs)
        if cached_eigens !== nothing
            return cached_eigens
        end

        @info(
            "No cached eigenstuff found in the provided cache_file. Computing from scratch...",
            cache_file,
            params,
            kwargs
        )
    end

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

    eigenfunction_expansion = EigenfunctionExpansion(eigens)
    if cache_file !== nothing
        save_eigens(cache_file, eigenfunction_expansion, params, kwargs)
    end

    return eigenfunction_expansion
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

    for (n, (; cₙ)) in Iterators.reverse(enumerate(eigenfunction_expansion))
        ωₙ = n^2 * ω_coef
        Ψ .+= cₙ .* @view(ψₙ_cache[:, n]) .* exp(-im * ωₙ * t)
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
    dx::Real,
    t_max::Real,
    dt::Real,
)
    xs = range(0, params.L; step=dx)
    ψₙ_cache = get_ψₙ_cache(eigenfunction_expansion, xs)

    ts = range(0, t_max; step=dt)

    return (; ψₙ_cache, xs, ts)
end

function get_Ψ_mat(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion,
    ψₙ_cache::ψₙCache,
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real},
)
    Ψ_mat = zeros(ComplexF64, length(xs), length(ts))
    for (ti, t) in enumerate(ts)
        Ψₜ!(@view(Ψ_mat[:, ti]), params, eigenfunction_expansion, ψₙ_cache, t)
    end

    return Ψ_mat
end

function plot_particle_static(
    params::Parameters,
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real},
    Ψ_mat::Matrix{ComplexF64};
    dst=nothing,
)
    dst = @something dst get_save_path(params, "pdf")

    width = 600
    height = round(
        Int, (width - 100) * ((maximum(ts) - minimum(ts)) / (maximum(xs) - minimum(xs)))
    )

    fig = Figure(; resolution=(width, height))

    Label(
        fig[1, :],
        "Probability Density Over Space and Time";
        textsize=20,
        tellwidth=false,
        tellheight=true,
    )

    ax = Axis(
        fig[2, :];
        xlabel=L"x",
        xaxisposition=:top,
        xlabelsize=20,
        ylabel=L"t",
        ylabelsize=20,
        yreversed=true,
        aspect=DataAspect(),
        title=params_title_latex(params),
        titlegap=16,
        titlesize=20,
    )

    Makie.heatmap!(ax, xs, ts, abs2.(Ψ_mat); colormap=:inferno)
    hidedecorations!(ax; label=false, ticklabels=false)

    if dst != false
        Makie.save(dst, fig)
    end

    return fig
end

function plot_particle_static(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion;
    dx::Real,
    t_max::Real,
    dst=nothing,
    dt=0.05,
)
    (; ψₙ_cache, xs, ts) = get_data_for_plot(params, eigenfunction_expansion; dx, t_max, dt)

    Ψ_mat = get_Ψ_mat(params, eigenfunction_expansion, ψₙ_cache, xs, ts)

    return plot_particle_static(params, xs, ts, Ψ_mat; dst)
end

function plot_particle_video(
    params::Parameters,
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real},
    Ψ_mat::Matrix{ComplexF64};
    dst=nothing,
    framerate=60,
    y_lim=0.4,
    format="mp4",
)
    dst = @something dst get_save_path(params, format)

    L = params.L

    zero_vec = zeros(Float64, size(xs))
    one_vec = ones(Float64, size(xs))

    ti = Observable(1)
    time = @lift ts[$ti]
    Ψ = @lift @view(Ψ_mat[:, $ti])
    Ψ² = @lift abs2.($Ψ)
    Ψ_re = @lift real.($Ψ)
    Ψ_im = @lift imag.($Ψ)

    fig = Figure(; resolution=(800, 1400))

    Label(fig[1, :], params_title_latex(params); tellwidth=false, textsize=32)

    Label(
        fig[2, :], @lift(latexstring(@sprintf "t=%.2f" $time)); tellwidth=false, textsize=24
    )

    axis_label_fontsize = 30

    ax2D = Axis(
        fig[4, :];
        xlabel=L"x",
        xaxisposition=:bottom,
        xlabelsize=axis_label_fontsize,
        xgridvisible=true,
        ylabel=L"|\Psi|^2",
        ylabelsize=axis_label_fontsize,
        ygridvisible=false,
        limits=((0, L), (0, y_lim)),
    )

    hidexdecorations!(ax2D; label=false)
    hideydecorations!(ax2D; label=false)

    # filled 2D area under wavefunction
    band!(ax2D, xs, Ψ², zero_vec; color="#007AC511")
    # 1D wavefunction curve itself
    lines!(ax2D, xs, Ψ²)

    Ψ_max_extent_3D = 0.5
    ax3 = Axis3(
        fig[3, :];
        aspect=(2, 1, 1),
        elevation=0.15 * pi,
        azimuth=-0.4 * pi,
        viewmode=:fitzoom,
        perspectiveness=0.2,
        xlabel=L"x",
        xlabelsize=axis_label_fontsize,
        ylabel=L"Re$(\Psi)$",
        ylabelsize=axis_label_fontsize,
        zlabel=L"Im$(\Psi)$",
        zlabelsize=axis_label_fontsize,
        protrusions=(0, 100, 0, 0), # (l,r,b,t) right protrusion for the z-axis label
        backgroundcolor=colorant"black",
        limits=let xlim = (0, L), yzlim = Ψ_max_extent_3D .* (-1, 1)
            (xlim, yzlim, yzlim)
        end,
    )

    hidedecorations!(ax3; grid=false, label=false)

    blue = RGBf(0.0, 0.447059, 0.698039)
    light_blue = Colors.weighted_color_mean(0.3, blue, colorant"white")

    # Draw the three "shadows" on the xy, xz, and yz planes
    # angular shadow (on yz plane)
    lines!(ax3, zero_vec, Ψ_re, Ψ_im; color=light_blue)
    # real part shadow (on xy plane)
    lines!(ax3, xs, Ψ_re, one_vec .* -Ψ_max_extent_3D; color=light_blue)
    # imag part shadow (on xz plane)
    lines!(ax3, xs, one_vec .* Ψ_max_extent_3D, Ψ_im, ; color=light_blue)

    # wf itself goes last so that it has the highest z-index (closest to viewer)
    lines!(ax3, xs, Ψ_re, Ψ_im; color=blue)

    rowsize!(fig.layout, 1, Auto())
    rowsize!(fig.layout, 2, Auto())
    rowsize!(fig.layout, 3, Auto(1.5))
    rowsize!(fig.layout, 4, Auto())

    trim!(fig.layout)

    record(fig, dst, 1:length(ts); framerate) do i
        ti[] = i
    end

    return fig
end

function plot_particle_video(
    params::Parameters,
    eigenfunction_expansion::EigenfunctionExpansion;
    dx::Real,
    t_max::Real,
    framerate=60,
    speed=1,
    kwargs...,
)
    dt = speed / framerate

    (; ψₙ_cache, xs, ts) = get_data_for_plot(params, eigenfunction_expansion; dx, t_max, dt)

    Ψ_mat = get_Ψ_mat(params, eigenfunction_expansion, ψₙ_cache, xs, ts)

    return plot_particle_video(params::Parameters, xs, ts, Ψ_mat; framerate, kwargs...)
end

# %%

params = Parameters(; L=80, μ=40, σ=8, p₀=3, m=5)
eigens = get_eigenfunction_expansion(params; tol=1e-6)

# %%
plot_particle_static(params, eigens; dx=0.1, t_max=1000, dst=false, dt=0.1)

# %%
plot_particle_video(
    params, eigens; dx=0.1, t_max=3000, speed=30, framerate=24, format="mp4"
)

# %%
plot_particle_video(
    params, eigens; dx=0.05, t_max=500, speed=15, framerate=60, format="mp4"
)

# %%

Makie.record

# %%
# L = 40
# xs = range(0, L; step=0.1)
# ts = range(0, 100; step=0.1)
# ψₙ_cache = get_ψₙ_cache(eigens, xs)
# Ψ_mat = get_Ψ_mat(params, eigens, ψₙ_cache, xs, ts)
