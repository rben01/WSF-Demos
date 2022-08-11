
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
