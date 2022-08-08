# %%

using Plots
using Printf
using QuadGK
using SymPy
using FunctionWrappers: FunctionWrapper

struct Parameters{T<:Real}
    L::T
    μ::T
    p₀::T
    σ::T
end

Parameters(L::T, μ::T, p₀::T, σ::T) where {T<:Real} = Parameters{T}(L, μ, p₀, σ)
Parameters(L, μ, p₀, σ) = Parameters(promote(L, μ, p₀, σ)...)
Parameters(; L, μ, p₀, σ) = Parameters(L, μ, p₀, σ)

inner_product(f::Function, g::Function, x_min::Real, x_max::Real) =
    quadgk(x -> conj(f(x)) * g(x), x_min, x_max; atol=1e-6)[1]

function psi(n, L, x)
    coef = sqrt(2 / L)
    return coef * sin(n * pi * x / L)
end

function psi(n, L)
    return x -> psi(n, L, x)
end

cn(psi::Function, initial_wf::Function; L::Real) = inner_product(psi, initial_wf, 0, L)

# """
# get `length(xs) × length(ts)` array containing all the points `(x, t, Ψ(x,t))` of the
# wavefunction
# """
# function get_wf_mat(
#     params::Parameters, xs::AbstractVector{<:Real}, ts::AbstractVector{<:Real}; n_max
# )
#     (; L, μ, p₀, σ) = params

#     n_range = reverse(1:n_max) # Large n (small numbers) at the front for slightly more accurate summation

#     initial_wavefunction_unnormed(x) = exp(im * p₀ * (x - μ) - 0.5 * ((x - μ) / σ)^2)
#     sq_norm = abs(
#         inner_product(initial_wavefunction_unnormed, initial_wavefunction_unnormed, 0, L)
#     )
#     initial_wavefunction(x) = initial_wavefunction_unnormed(x) / sqrt(sq_norm)

#     cns = inner_product.(psi.(n_range, L), initial_wavefunction, 0, L)
#     @info "approximation goodness" sum(abs2.(cns))
#     cns ./= sqrt(sum(abs2.(cns))) # force their sq magnitudes to sum to 1

#     @assert sum(abs2.(cns)) ≈ 1

#     wf_mat = zeros(Complex{Float64}, length(xs), length(ts))

#     for (ti, t) in enumerate(ts)
#         for (n, cn) in zip(n_range, cns)
#             energy = (pi * n)^2 / (2 * L^2)
#             wf_mat[:, ti] .+= cn * exp(-im * energy * t) .* psi.(n, L, xs)
#         end
#     end

#     return wf_mat
# end

"""

See further: https://docs.juliahub.com/SymPy/KzewI/1.1.6/Tutorial/basic_operations/#lambdify-1
"""
function sympy_expr_to_fn(ex, syms)
    # return lambdify(ex, syms; invoke_latest=true)
    body = convert(Expr, ex)
    fn = Expr(:function, Expr(:tuple, syms...), body)
    return eval(fn)
end

sympy_expr_to_fn(ex, sym::Symbol) = sympy_expr_to_fn(ex, (sym,))
sympy_expr_to_fn(ex) = sympy_expr_to_fn(ex, Symbol.(free_symbols(ex)))

# macro sympy_expr_to_fn(ex, syms...)
#     return Expr(:function, Expr(:tuple, syms...), convert(Expr, eval(ex)))
# end

function get_wf_mat(
    params::Parameters,
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real},
    save_locs::AbstractVector{Bool},
)
    (; L, μ, p₀, σ) = params
    x = symbols(:x; real=true)
    ħ = 1

    initial_wavefunction_unnormed(x) = sympy.exp(im * p₀ * (x - μ) - 0.5 * ((x - μ) / σ)^2)
    sq_norm = integrate(
        simplify(initial_wavefunction_unnormed(x) * conj(initial_wavefunction_unnormed(x))),
        (x, 0, L),
    )
    initial_wavefunction(x) = initial_wavefunction_unnormed(x) / sqrt(sq_norm)

    local fn, wf_num, wf_sym
    fn = sympy_expr_to_fn(initial_wavefunction(x), :x)
    wf_num = fn |> FunctionWrapper{ComplexF64,Tuple{ComplexF64}}
    wf_sym = fn |> FunctionWrapper{Any,Tuple{Any}}

    # stepped(f_ex, dt) = simplify(f_ex + dt / (im * ħ) * diff(f_ex, (x, 2)))
    stepped(f_ex, dt) = sympy.nsimplify(
        f_ex + dt / (im * ħ) * diff(f_ex, (x, 2)); tolerance=1e-25, rational=false
    )

    wf_mat = zeros(Complex{Float64}, length(xs), sum(save_locs))

    @info "evolving" length(ts) size(wf_mat)

    wf_mat[:, 1] .= wf_num.(xs)
    dts = vcat(diff(ts), 0)

    n = length(ts)
    ti = 1
    for (i, (dt, should_save)) in enumerate(zip(dts, save_locs))
        if should_save
            wf_mat[:, ti] .= wf_num.(xs)
            ti += 1
        end

        fn = sympy_expr_to_fn(stepped(wf_sym(x), dt), :x)
        wf_num = fn |> FunctionWrapper{ComplexF64,Tuple{ComplexF64}}
        wf_sym = fn |> FunctionWrapper{Any,Tuple{Any}}
        @info "progress" "$i/$n" string(stepped(wf_sym(x), dt))
    end

    return wf_mat
end

# function plot_frame(
#     anim::Animation,
#     wf_arr::AbstractMatrix,
#     ti::Integer;
#     L_max::Real,
#     y_max::Real,
#     xs::AbstractVector,
#     ts::AbstractVector,
#     dpi::Real,
# )
#     wf_points = @view wf_arr[:, ti]
#     p = plot(
#         xs,
#         abs2.(wf_points);
#         xlim=(0, L_max),
#         ylim=(0, y_max),
#         lw=2,
#         legend=false,
#         xlabel=raw"$x$",
#         ylabel=raw"$|\psi(x)|^2$",
#         plot_title="Particle in an infinite well",
#         dpi,
#     )
#     timestamp_str = @sprintf "%.2f" ts[ti]
#     annotate!((0.15, 0.75), text("t=$timestamp_str", :left, :black))

#     frame(anim, p)

#     return p
# end

function get_save_path(params::Parameters, extn::AbstractString)
    (; L, μ, p₀, σ) = params

    plots_dir = mkpath(joinpath(@__DIR__, "plots"))
    outfile_basename = @sprintf "anim_L=%.4f_mu=%.4f_p0=%.4f_sigma=%.4f.%s" L μ p₀ σ extn
    dst = joinpath(plots_dir, outfile_basename)

    return dst
end

# function save_anim(anim::Animation, params::Parameters; fps)
#     dst = get_save_path(params, "mp4")

#     @info "saving plot" dst
#     return mp4(anim, dst; fps)
# end

# function plot_particle_old(
#     params::Parameters;
#     L_max::Real,
#     n_max=250,
#     fps=24,
#     speed=1,
#     tmax_sec=60,
#     dx=5e-2,
#     dpi=144,
# )::Animation
#     L = params.L

#     anim = Animation()
#     n_points = round(Int, L / dx)
#     xs = range(0, L; length=n_points)
#     ts = 0:(speed / fps):tmax_sec

#     wf_mat = get_wf_mat(params, xs, ts; n_max)
#     y_max = maximum(abs2, wf_mat) + 0.5

#     plot_kwargs = (; L_max, y_max, xs, ts, dpi)

#     local last_frame
#     for ti in 1:length(ts)
#         last_frame = plot_frame(anim, wf_mat, ti; plot_kwargs...)
#     end

#     end_pause_sec = 2
#     n_ending_frames = round(Int, end_pause_sec * fps)
#     for _ in 1:n_ending_frames
#         frame(anim, last_frame)
#     end

#     save_anim(anim, params; fps)

#     return anim
# end

function default_t_save_locs(ts)
    chunked = div.(ts, 1e-1)
    prev_val = minimum(ts) - 1
    mask = falses(size(ts))

    for (i, val) in pairs(chunked)
        if val != prev_val
            mask[i] = true
            prev_val = val
        end
    end
    return mask
end

function plot_particle(params::Parameters; dx=0.5, dt=1e-2, n_timesteps=100, dpi=288)
    L = params.L

    n_x_points = 1 + round(Int, L / dx)
    xs = range(0, L; length=n_x_points)
    ts = range(0; step=dt, length=n_timesteps)
    save_locs = default_t_save_locs(ts)
    @info "axes" xs

    wf_mat = get_wf_mat(params, xs, ts, save_locs)

    @info "plotting" params size(wf_mat) length(wf_mat)

    p = heatmap(
        xs,
        ts,
        abs2.(wf_mat)';
        dpi,
        xlabel="𝑥",
        ylabel="𝑡",
        xticks=0:2:L,
        title="Probability Density over Space and Time",
        fontfamily="Helvetica",
    )
    dst = get_save_path(params, "png")
    png(p, dst)

    return p
end

# function vlplot_particle(params; n_max=250, dx=1)
#     L = params.L

#     n_points = round(Int, L / dx)
#     xs = range(0, L; length=n_points)
#     ts = 0:1:100

#     wf_mat = get_wf_mat(params, xs, ts; n_max)

#     x_col = vec(xs' .* ones(length(ts)))
#     t_col = vec((ts' .* ones(length(xs)))')
#     p_col = vec(abs2.(wf_mat))

#     df = DataFrame(:x => x_col, :t => t_col, :p => p_col)
#     show(df)
#     p = df |> @vlplot(:rect, x = :t, y = :x, color = {field = :p, aggregate = :mean})
#     VegaLite.savefig(get_save_path(params, "svg"), p)

#     return p
# end

function plot_all()
    params_vec = Parameters[]
    for (L, p₀) in Iterators.product([20], [10])
        μ = L / 2
        σ = L / 2
        push!(params_vec, Parameters(; L, μ, p₀, σ))
    end

    @info "plotting for parameter combinations" length(params_vec)
    for params in params_vec
        plot_particle(params)
    end
end

@info "#== beginning plotting"
plot_all()
@info "==# all finished"

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
