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

# %%

function f1(x)
    return if abs(x) <= 1
        abs(x)^(-1 / 2) - 1
    else
        0
    end
end

make_df(
    range(; start=0, stop=0.5, length=1000),
    "𝑓, convergent" => f1,
    "𝑓², divergent" => x -> f1(x)^2,
) |>
@vlplot(
    mark = {:line, clip = true},
    x = :x,
    y = {:y, axis = {titleAngle = 0, titlePadding = 8}, scale = {domain = [0, 40]}},
    color = {:name, title = nothing}
) |>
save_spec("fig-3.1.1-f1.svg")
# %%
function f2(x)
    return if abs(x) < 1
        1
    else
        1 / abs(x)
    end
end

make_df(
    range(; start=-30, stop=30, length=250),
    "𝑓, divergent" => f2,
    "𝑓², convergent" => x -> f2(x)^2,
) |>
@vlplot(
    mark = {:line, clip = true},
    x = :x,
    y = {:y, axis = {titleAngle = 0, titlePadding = 8}, scale = {domain = [0, 1.05]}},
    color = {:name, title = nothing}
) |>
save_spec("fig-3.1.1-f2.svg")

# %%
f3(x) = x < 0.5 ? 4x : 4(1 - x);
f4(x) = 2 * sin(2 * pi * x)^2

dash_line_attrs = [
    :(color = {value = "#333"}),
    :(opacity = {value = 0.6}),
    :(strokeDash = {value = [3, 3]}),
    :(size = {value = 2}),
]

make_df(range(; start=0, stop=1, length=250), "𝜌₁" => f3, "𝜌₂" => f4) |>
eval(
    :(@vlplot(
        facet = {column = {field = :name, title = nothing}},
        transform = [
            {
                calculate = """if(datum.name == "𝜌₁", $(sqrt(7/24 - 1/4)), $(sqrt(1/3 - 1/4 -
                1/(8 * pi^2))))""",
                as = "stddev",
            },
            {calculate = "0.5", as = "x_mean"},
            {calculate = "datum.x_mean - datum.stddev", as = "lower"},
            {calculate = "datum.x_mean + datum.stddev", as = "upper"},
        ],
        spec = {
            layer = [
                {
                    mark = :line,
                    encoding = {
                        x = {field = :x, title = "x"},
                        y = {field = :y, axis = {titleAngle = 0, titlePadding = 8}},
                    },
                },
                {
                    mark = :rule,
                    encoding = {x = {field = "x_mean", aggregate = "min"}},
                    color = {value = "#333"},
                    opacity = {value = 0.6},
                    size = {value = 3},
                },
                {
                    mark = :rule,
                    encoding = {x = {field = "lower", aggregate = "min"}},
                    $(dash_line_attrs...),
                },
                {
                    mark = :rule,
                    encoding = {x = {field = "upper", aggregate = "min"}},
                    $(dash_line_attrs...),
                },
            ],
        },
    )),
) |>
save_spec("fig-1.3.1-graphs.svg")
