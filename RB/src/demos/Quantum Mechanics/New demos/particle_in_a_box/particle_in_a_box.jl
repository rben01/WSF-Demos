# %%

using Printf
using QuadGK
using SpecialFunctions
using Debugger
using Infiltrator
using Plots

gr()

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

fact(n) = gamma(n + 1)
binom(n, k) =
    if -1 <= k <= n + 1
        fact(n) / (fact(k) * fact(n - k))
    else
        0
    end

function middle(v::AbstractVector; k=3)
    i = length(v) ÷ 2
    return v[(i - k):(i + k)]
end

function step_wf!(Ψ, dx, dt; m, xs)
    ħ = 1
    # xdiff1 = diff(xs)
    # ∇Ψ = diff(Ψ) ./ dx

    # if isdefined(Main, :Infiltrator)
    #     Main.infiltrate(@__MODULE__, Base.@locals, @__FILE__, @__LINE__)
    # end

    # xs1 = @view(xs[begin:(end - 1)]) .+ xdiff1 ./ 2
    # xdiff2 = diff(xs1)
    ∇²Ψ = diff(diff(Ψ)) ./ dx^2
    ∇²Ψ = vcat(first(∇²Ψ), ∇²Ψ, last(∇²Ψ))

    # fixes the issue of the first nonzero value being massive compared to subsequent ones
    # (so that the curvature, which should be roughly continuous, is not)
    # for find_fn in [findfirst, findlast]
    #     idx = find_fn(!=(0), ∇²Ψ)
    #     ∇²Ψ[idx] = 0
    # end

    Ψ .+= (im * ħ / (2 * m)) * dt * ∇²Ψ
    Ψ ./= norm(Ψ, dx)
    # lines(xs, real(Ψ), imag(Ψ))
    return nothing
end
# step_wf!(zs, xs, dt; m=1);
# display(zs[begin:(begin + 6)])
# plot(xs, zs)

function get_wf_mat(
    params::Parameters,
    xs::AbstractRange{<:Real},
    ts::AbstractRange{<:Real},
    save_locs::AbstractVector{Bool},
)
    plotlyjs()

    (; L, μ, p₀, σ) = params

    # initial_wavefunction_unnormed(x) =
    #     exp(im * p₀ * (x - μ)) * binom(L, L / 2 + (x - μ) / σ)
    initial_wavefunction_unnormed(x) = exp(im * p₀ * (x - μ) - (x - μ)^2 / (2 * σ))

    Ψ = initial_wavefunction_unnormed.(xs) ./ norm(initial_wavefunction_unnormed, 0, L)

    # first_nonzero_idx = findfirst(!=(0), Ψ)
    # front = @view Ψ[begin:first_nonzero_idx]
    # front .= range(0, Ψ[first_nonzero_idx]; length=length(front))

    # last_nonzero_idx = findfirst(!=(0), Ψ)
    # back = @view Ψ[last_nonzero_idx:end]
    # back .= range(Ψ[last_nonzero_idx], 0; length=length(back))

    # display(zs)
    # display(plot(xs, abs2.(zs)))

    n_save_points = sum(save_locs)
    wf_mat = Array{ComplexF64}(undef, length(xs), n_save_points)

    dx = step(xs)
    dt = step(ts)

    ti = 1
    for should_save in save_locs
        if should_save
            wf_mat[:, ti] .= Ψ
            _z = Ψ[length(Ψ) ÷ 2]
            @info "saved" ti n_save_points (abs(_z), angle(_z))
            ti += 1
        end

        step_wf!(Ψ, dx, dt; m=1, xs)
    end

    gr()

    return wf_mat
end

function get_save_path(params::Parameters, extn::AbstractString)
    (; L, μ, p₀, σ) = params

    plots_dir = mkpath(joinpath(@__DIR__, "plots"))
    outfile_basename = @sprintf "anim_L=%.2f_mu=%.2f_p0=%.2f_sigma=%.2f.%s" L μ p₀ σ extn
    dst = joinpath(plots_dir, outfile_basename)

    return dst
end

function get_t_save_locs(ts::AbstractVector{<:Real}; t_spacing=1e-7)
    chunked = div.(ts, t_spacing)
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

function get_wf_mat_dimensions(params::Parameters; dx, dt, t_max)
    L = params.L

    n_x_points = 1 + round(Int, L / dx)
    xs = range(0, L; length=n_x_points)
    ts = range(0, t_max; step=dt)
    save_locs = get_t_save_locs(ts)

    return (; xs, ts, save_locs)
end

function get_wf_mat(params::Parameters; dx, dt, t_max)
    (; xs, ts, save_locs) = get_wf_mat_dimensions(params; dx, dt, t_max)
    wf_mat = get_wf_mat(params, xs, ts, save_locs)
    return (; wf_mat, xs, ts, save_locs)
end

function plot_particle(
    wf_mat::AbstractMatrix{<:Number},
    xs::AbstractVector{<:Real},
    ts::AbstractVector{<:Real},
    save_locs::AbstractVector{<:Bool};
    params::Parameters,
)
    L = params.L

    p = Plots.heatmap(
        xs,
        ts[save_locs],
        abs2.(wf_mat)';
        title="Probability Density over Space and Time",
        xlabel="𝑥",
        ylabel="𝑡",
        xticks=[0, L / 2, L],
        fontfamily="Computer Modern",
    )

    return p
end

# %%
params = Parameters(; L=10, μ=5, p₀=5, σ=0.5)

(; xs, ts, save_locs) = get_wf_mat_dimensions(params; dx=1e-5, dt=1e-8, t_max=5e-7)
@info "axes" length(xs) length(ts) length(ts[save_locs])

wf_mat = get_wf_mat(params, xs, ts, save_locs)

@info "plotting" params wf_mat size(wf_mat) length(wf_mat)

fig = plot_particle(wf_mat, xs, ts, save_locs; params)
dst = get_save_path(params, "png")
savefig(fig, dst)

fig

# %%

function plot_particle(params::Parameters; dx, dt, t_max, dpi)
    (; xs, ts, save_locs) = get_wf_mat_dimensions(params; dx, dt, t_max)
    @info "axes" length(xs) length(ts) length(ts[save_locs])

    wf_mat = get_wf_mat(params, xs, ts, save_locs)

    @info "plotting" params wf_mat size(wf_mat) length(wf_mat)

    fig = plot_particle(wf_mat, xs, ts, save_locs)
    dst = get_save_path(params, "png")
    save(dst, fig)
    return fig
end

function plot_all()
    params_vec = Parameters[]
    for (L, p₀) in Iterators.product([20], [5])
        μ = L / 2
        σ = 0.5
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
