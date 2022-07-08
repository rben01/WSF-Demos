# %%
using DataFrames
using VegaLite

function make_df(x::AbstractVector, fs::Pair{String,<:Function}...)
    x_len = length(x)
    n_funcs = length(fs)

    xs = repeat(x, n_funcs)

    names = String[]
    ys = empty(xs)

    for (name, f) in fs
        append!(names, fill(name, x_len))
        append!(ys, f.(x))
    end

    return DataFrame(:x => xs, :y => ys, :name => names)
end

function save_spec(filename::AbstractString)
    return function (spec)
        VegaLite.save(joinpath(dirname(@__DIR__), "images", filename), spec)
        return spec
    end
end

function f1(x)
    return if abs(x) <= 1
        abs(x)^(-1 / 2) - 1
    else
        0
    end
end

make_df(
    range(; start=-0.5, stop=0.5, length=1000),
    "𝑓, convergent" => f1,
    "𝑓², divergent" => x -> f1(x)^2,
) |>
@vlplot(
    mark = {:line, clip = true},
    x = :x,
    y = {:y, scale = {domain = [0, 40]}},
    color = {:name, title = nothing}
) |>
save_spec("fig-3.1.1-f1.svg")
#%%
function f2(x)
    return if abs(x) < 1
        1
    else
        1 / abs(x)
    end
end

make_df(
    range(; start=-30, stop=30, length=1000),
    "𝑓, divergent" => f2,
    "𝑓², convergent" => x -> f2(x)^2,
) |>
@vlplot(
    mark = {:line, clip = true},
    x = :x,
    y = {:y, scale = {domain = [0, 1.05]}},
    color = {:name, title = nothing}
) |>
save_spec("fig-3.1.1-f2.svg")
