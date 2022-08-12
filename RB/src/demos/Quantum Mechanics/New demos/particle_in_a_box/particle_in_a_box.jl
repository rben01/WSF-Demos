# %%

using Printf
using QuadGK
using Debugger
using Infiltrator
using Makie
using CairoMakie
using LaTeXStrings
using PDFmerger
using GLM

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
    reason::String
end
ConvergenceError(n, cₙs_sum::T) where {T<:Number} = ConvergenceError{T}(n, cₙs_sum)

Parameters(L, μ, p₀, σ, m, ħ) = Parameters(promote(L, μ, p₀, σ, m, ħ)...)

inner_product(f::Function, g::Function, x_min::Real, x_max::Real; atol=1e-5) =
    quadgk(x -> conj(f(x)) * g(x), x_min, x_max; atol)[1]

norm(f::Function, x_min::Real, x_max::Real) = sqrt(inner_product(f, f, x_min, x_max))

function get_Ψ_mat(params::Parameters, xs::AbstractRange{<:Real}, ts::AbstractRange{<:Real})
    (; L, μ, p₀, σ, m, ħ) = params

    # note: this is `-((x-μ)/σ)^2 / 4`, not `... / 2` because it's the *sqrt* of a gaussian
    ψ_unnormed(x) =
        1 / sqrt(σ * sqrt(2pi)) * exp(-0.25 * ((x - μ) / σ)^2 + (im * p₀ * (x - μ)) / ħ)

    ψ_initial_norm = norm(ψ_unnormed, 0, L)

    ψ(x) = ψ_unnormed(x) / ψ_initial_norm

    @assert norm(ψ, 0, L) ≈ 1

    ψₙs = Function[]
    cₙs = ComplexF64[]

    max_n_allowed = 30000
    prev_cₙ_sq_sums = Tuple{Int,Float64}[]
    cₙ_sq_sum_eq_1_tol = 1e-5

    n = 0
    while true
        for _ in 1:2000
            n += 1

            # Use `let n = n` for eager evaluation of n in function body; otherwise `n`
            # refers to the variable itself, which means all the ψₙ will be the same
            # (whatever the value of n is at the time) \
            # Roughly the equivalent of the `lambda i=i: f(i)` trick in Python
            ψₙ = let L = L, n = n
                x -> sqrt(2 / L) * sin((n * pi / L) * x)
            end

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
        local cₙs_sq_sum = sum(abs2, @view(cₙs[end:-1:begin]))

        if cₙs_sq_sum > 1 || isapprox(cₙs_sq_sum, 1; atol=cₙ_sq_sum_eq_1_tol)
            @info "" cₙs_sq_sum n
            break
        end

        push!(prev_cₙ_sq_sums, (n, cₙs_sq_sum))

        if length(prev_cₙ_sq_sums) >= 5 && n > 5000
            local X = hcat(ones(length(prev_cₙ_sq_sums)), first.(prev_cₙ_sq_sums))
            local y = last.(prev_cₙ_sq_sums)

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

    n_range = 1:n

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
            @info "progress" ni n_max = last(n_range)
        end
    end

    return wf_mat
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
    (; L, μ, p₀, σ, m) = params

    params_title = L"$L = %$L$; $x_0 = %$μ$; $\sigma_0 = %$σ$; $p_0 = %$p₀$; $m=%$m$"

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
        title=params_title,
        titlegap=16,
        titlesize=20,
    )

    Makie.heatmap!(
        ax,
        @view(xs[begin:x_spacing:end]),
        @view(ts[begin:t_spacing:end]),
        abs2.(@view(wf_mat[begin:x_spacing:end, begin:t_spacing:end]));
        colormap=:inferno,
    )

    hidedecorations!(ax; label=false, ticklabels=false)

    Label(
        fig[0, :], "Probability Density Over Space and Time"; textsize=20, tellwidth=false
    )

    return fig
end

# %%

function plot_all()
    for (μ, p₀, σ, m) in
        Iterators.product([10, 20, 30], [0, 2, 5, 10], [1, 2, 5, 10, 15, 20], [0.5, 1, 2])
        L = 40
        params = Parameters(; L, μ, p₀, σ, m)
        dst = get_save_path(params, "pdf")

        # if haskey(saved_mats, params) || ispath(dst)
        #     @info "skipping already-seen params" params
        #     continue
        # end

        (; xs, ts) = get_wf_mat_dimensions(params; dx=0.05, dt=0.05, t_max=60)
        @info "axes" params length(xs) length(ts)

        local Ψ_mat
        try
            Ψ_mat = get_Ψ_mat(params, xs, ts)
        catch e
            if e isa ConvergenceError
                @error(
                    "Convergence of eigenfunction expansion was too slow; skipping",
                    params,
                    err = e
                )
                continue
            end
            rethrow()
        end
        saved_mats[params] = Ψ_mat

        @info "plotting" params size(Ψ_mat) length(Ψ_mat)

        fig = plot_particle(Ψ_mat, xs, ts; params)

        Makie.save(dst, fig)
        display(fig)

        @info "plotted" filename = basename(dst)
    end
end

plot_all()

# %%
function get_pdf_files()
    pdfs = filter(
        path -> endswith(lowercase(path), ".pdf"), readdir(get_plots_dir(); join=true)
    )
    sort!(pdfs; by=function (filepath)
        name = basename(filepath)
        param_values = Dict{Symbol,Float64}()
        param_names = [:L, :sigma, :p0, :m, :mu]

        for pn in param_names
            m = match(Regex("$pn=(-?\\d+\\.?\\d*)"), name)

            if m === nothing
                error("file $name did not match expected format")
            end

            value = parse(Float64, m[1])
            param_values[pn] = value
        end

        sort_tup = Tuple(param_values[pn] for pn in param_names)
        return sort_tup
    end)

    return pdfs
end

merge_pdfs(get_pdf_files(), joinpath(@__DIR__, "particle_in_a_box_runs.pdf"))
