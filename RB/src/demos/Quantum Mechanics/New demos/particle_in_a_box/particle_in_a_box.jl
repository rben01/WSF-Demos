# %%
module M

using Printf
using Plots
using ColorSchemes
using Colors
using JSON

const fps = 60
const speed = 0.5
const dx = 1e-4
const dpi = 200
const tmax_sec = 40

function inner_product(f::Function, g::Function, xmin::Real, xmax::Real, npoints::Integer)
    dx::Float64 = (xmax - xmin) / npoints
    xs = (xmin+dx/2):dx:(xmax-dx/2)

    return sum(f.(xs) .* conj.(g.(xs))) * dx
end

function psi(n, L)
    coef = sqrt(2 / L)
    return x -> coef * sin(n * pi * x / L)
end

function get_cn(n, L, θ, μ, Σ)
    f = psi(n, L)
    g = x -> exp(im * θ * (x - μ) - 0.5 * ((x - μ) / Σ)^2)
    # gaussian_norm_factor = abs(inner_product(g, g, 0, L, 2000))
    # coef = sqrt(2 / L) / gaussian_norm_factor #/ (pi^0.25 * Σ^0.5)
    return inner_product(f, g, 0, L, 2000)
end

function wavefunction_generator(nmax, L, θ, μ, Σ)
    nrange = reverse(1:nmax) # Large n (small numbers) at the front for slightly more accurate summation

    cns = [get_cn(n, L, θ, μ, Σ) for n in nrange]
    cns ./= sqrt(sum(abs2.(cns))) # force their sq magnitudes to sum to 1

    energies = (pi * nrange) .^ 2 / (2 * L^2)
    psis = [psi(n, L) for n in nrange]

    return t -> begin
        scalars = cns .* exp.(-im * energies * t)
        ψ = x -> sum(scalars .* [psi(x) for psi in psis])
        return ψ
    end
end


const ts = 0:(speed/fps):tmax_sec


const plotdir = joinpath(dirname(@__FILE__), "plots")
mkpath(plotdir)

const L_max = 6
const y_max = 2.5

const fontfamily = "Helvetica"
const dark_theme = [
    :linecolor => colorant"#5df",
    :background => colorant"black",
    :foreground_color => colorant"white",
    :dpi => dpi,
    :tickfontsize => 12,
    :tickfontfamily => fontfamily,
    :guidefontsize => 15,
]


for (L, θ, Σ) in Iterators.product(2:L_max, -3:3, 0.5:0.25:1.5)
    xs = 0:dx:L
    @show size(Iterators.product(xs, ts))
    for μ = 1:0.5:L-1
        wf_generator = wavefunction_generator(700, L, θ, μ, Σ)

        function plot_frame(anim, i)
            wavefunction = wf_generator(ts[i])
            wf_points = wavefunction.(xs)
            plot(
                xs,
                abs2.(wf_points),
                xlim = (0, L_max),
                ylim = (0, y_max),
                lw = 2,
                legend = false,
                xlabel = raw"$x$",
                ylabel = raw"$|\psi(x)|^2$",
                plot_title = "Particle in an infinite well";
                dark_theme...,
            )
            timestamp_str = @sprintf "%.2f" ts[i]
            annotate!(
                0.25,
                y_max - 0.3,
                text("t=$timestamp_str", :left, :white, fontfamily),
            )
            frame(anim)
        end

        anim = Animation()

        for i = 1:length(ts)
            plot_frame(anim, i)
        end

        end_pause_sec = 2
        t_step = step(ts)
        n_ending_frames = round(Int, end_pause_sec * fps)
        for _ = 1:n_ending_frames
            plot_frame(anim, length(ts))
        end

        outfile_basename = @sprintf "anim_L=%.4f_theta=%.4f_mu=%.4f_sigma=%.4f.mp4" L θ μ Σ
        outfile_path = joinpath(plotdir, outfile_basename)
        mp4(anim, outfile_path, fps = fps)
    end
end


end
