
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

function windowed!(
    in_vec::AbstractVector, out_vec::AbstractVector, window::Integer; agg::Function=mean
)
    first_in_index = firstindex(in_vec)
    first_out_index = firstindex(out_vec)

    for i in 0:(length(in_vec) - window)
        start_idx = first_in_index + i
        out_idx = first_out_index + i
        out_vec[out_idx] = agg(@view(in_vec[start_idx:(start_idx + window - 1)]))
    end

    return nothing
end

function windowed(
    v::V, window::Integer; out_type::Type=T, agg::Function=mean
) where {T,V<:AbstractVector{T}}
    out = Vector{out_type}(undef, length(v) - window + 1)
    windowed!(v, out, window; agg)

    return out
end

function windowed!(
    in_arr::AbstractArray,
    out_arr::AbstractArray,
    window::Integer;
    dim=1,
    agg::Function=mean,
)
    sma_axes = [ax for (i, ax) in enumerate(axes(in_arr)) if i != dim]

    for sma_idxs in Iterators.product(sma_axes...)
        idxs = tuple(sma_idxs[begin:(dim - 1)]..., Colon(), sma_idxs[dim:end]...)
        windowed!(view(in_arr, idxs...), view(out_arr, idxs...), window; agg)
    end
end

function windowed(
    a::A, window::Integer; dim=1, out_type::Type{<:Number}=T, agg::Function=mean
) where {T,A<:AbstractArray{T}}
    out_dims = Tuple(if i != dim
        s
    else
        s - window + 1
    end for (i, s) in enumerate(size(a)))

    out = Array{out_type}(undef, out_dims)
    windowed!(a, out, window; dim, agg)

    return out
end

function step_wf!(Ψ, dx, dt; m, xs)
    ħ = 1
    # xdiff1 = diff(xs)
    # ∇Ψ = diff(Ψ) ./ dx

    # xs1 = @view(xs[begin:(end - 1)]) .+ xdiff1 ./ 2
    # xdiff2 = diff(xs1)
    # https://en.wikipedia.org/wiki/Symmetric_derivative#The_second_symmetric_derivative

    ∇²Ψ =
        (
            @view(Ψ[(begin + 2):end]) + @view(Ψ[begin:(end - 2)]) -
            2 * @view(Ψ[(begin + 1):(end - 1)])
        ) ./ (dx^2)

    ∇²Ψ = vcat(∇²Ψ[begin], ∇²Ψ, ∇²Ψ[end])

    # window = 100
    # ∇²Ψ = windowed(∇²Ψ, window)
    # ∇²Ψ = vcat(
    #     fill(∇²Ψ[begin], floor(Int, (window + 1) / 2)),
    #     ∇²Ψ,
    #     fill(∇²Ψ[end], ceil(Int, (window + 1) / 2)),
    # )

    # ∇Ψ = (Ψ[(begin + 2):end] .- Ψ[begin:(end - 2)]) ./ (2 * dx)
    # ∇²Ψ = (∇Ψ[(begin + 2):end] .- ∇Ψ[begin:(end - 2)]) ./ (2 * dx)

    # ∇²Ψ = diff(diff(Ψ)) ./ dx^2

    # f, l = ∇²Ψ[[begin, end]]

    # if isdefined(Main, :Infiltrator)
    #     Main.infiltrate(@__MODULE__, Base.@locals, @__FILE__, @__LINE__)
    # end
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

function __get_wf_mat_old(
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
            _z = middle(Ψ; k=1)
            @info "saved" ti n_save_points (abs.(_z), angle.(_z))
            ti += 1
        end

        step_wf!(Ψ, dx, dt; m=1, xs)
    end

    gr()

    return wf_mat
end

function get_t_save_locs(ts::AbstractVector{<:Real}; t_spacing)
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

function get_Ψ_mat(params::Parameters, xs::AbstractRange{<:Real}, ts::AbstractRange{<:Real})
    # Throughout this function, we place closures in blocks `let n = n ... (closure) ...
    # end` for eager evaluation of n in function body; otherwise `n` refers to the variable
    # itself, which both hurts performance and refers to the value of `n` at the time the
    # closure is called, not the time it's defined \
    # Roughly the equivalent of the `lambda i=i: f(i)` trick in Python

    (; L, μ, p₀, σ, m, ħ) = params

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

    max_n_allowed = 30000
    prev_cₙ_sq_sums = Tuple{Int,Float64}[]
    cₙ_sq_sum_eq_1_tol = 1e-5
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
        local cₙs_sq_sum = sum(abs2, @view(cₙs[end:-1:begin]))

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

function plot_all()
    return plot_all(global_logger())
end

function plot_all(logger::AbstractLogger)
    with_logger(logger) do
        param_combinations = collect(
            Iterators.product(
                [10, 20, 30], [0, 2, 5, 10], [1, 2, 5, 10, 15, 20], [0.5, 1, 2]
            ),
        )

        for (i, (μ, p₀, σ, m)) in enumerate(param_combinations)
            L = 40
            params = Parameters(; L, μ, p₀, σ, m)
            dst = get_save_path(params, "pdf")

            # if haskey(saved_mats, params) || ispath(dst)
            #     @info "skipping already-seen params" params
            #     continue
            # end

            (; xs, ts) = get_wf_mat_dimensions(params; dx=0.05, dt=1 / 60, t_max=60)
            @info "axes" params length(xs) length(ts)

            local Ψ_mat
            try
                Ψ_mat = get_Ψ_mat(params, xs, ts)
            catch e
                if e isa ConvergenceError
                    @error(
                        "Convergence of eigenfunction expansion was too slow; skipping",
                        params,
                        err = e,
                        run = i,
                        out_of = length(param_combinations)
                    )
                    continue
                end
                rethrow()
            end
            saved_mats[params] = Ψ_mat

            @info "plotting" params size(Ψ_mat) length(Ψ_mat)

            fig = plot_particle(Ψ_mat, xs, ts; params)

            Makie.save(dst, fig)

            if !(global_logger() isa SimpleLogger)
                display(fig)
            end

            @info "plotted" filename = basename(dst) run = i out_of = length(
                param_combinations
            )
        end
    end
end

open(joinpath(@__DIR__, "logs.txt"), "w+") do io
    logger = SimpleLogger(io)
    plot_all(logger)
end

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
