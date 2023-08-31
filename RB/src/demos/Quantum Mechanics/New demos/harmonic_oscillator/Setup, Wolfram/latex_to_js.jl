# %%
import Lazy.@as
using InteractiveUtils

N_MAX = 20

function split_input(s::AbstractString)
    s = strip(s) * "\n\n"
    strings = String[]
    curr_string_lines = String[]
    for line in eachline(IOBuffer(s))
        line = strip(line)

        if isempty(line)
            push!(strings, join(curr_string_lines, " "))
            empty!(curr_string_lines)
        else
            push!(curr_string_lines, line)
        end
    end

    strings = filter(function (s)
        n_str = match(r"^(\d+):", s).captures[1]
        n = parse(Int, n_str)
        return n <= N_MAX
    end, strings)

    return strings
end

function wolfram_to_jl_str(s::AbstractString)::String
    x = @as s s begin
        strip(s)
        lowercase(s)
        replace(s, r"(\))\s*(\d)" => s"\1*\2")
        replace(s, r"^(?:\d+:\s*)?" => "")
        replace(s, r"\\\[(\w+?)\]" => s"\1")
        replace(s, r"\s+" => "*")
        replace(s, "n!" => "factorial[n]")
        # replace(s, "-1+4*sigma^4" => "(s4_)", "1-4*sigma^4" => "(-s4_)")
        replace(s, "hbar" => "H_BAR")
        replace(s, r"\bI\b"i => "Complex.i")
        replace(s, r"\bpi\b"i => "Math.PI")
    end
    println(x)
    return x
end

function expr_to_js_str(expr::Expr)
    (; head, args) = expr

    if head == :(.)
        return "$(args[1]).$(args[2].value)"
    elseif head == :call
        (op, rest...) = args

        func = if op == :(+)
            "Complex.add"
        elseif op == :(-)
            if length(rest) == 1
                # negation
                insert!(rest, 1, 0)
            end
            "Complex.sub"
        elseif op == :(*)
            "Complex.mul"
        elseif op == :(/)
            "Complex.div"
        elseif op == :(^)
            "Complex.pow"
        else
            string(op)
        end

        if op == :(^) && rest[1] == :(e)
            func = "Complex.exp"
            rest = rest[2:end]
        end

        js_string = join([func, "(", ("($(expr_to_js_str(ex)))," for ex in rest)..., ")"])
        return js_string
    elseif head == :ref
        func = args[1]
        if func == :(sqrt)
            rest = expr_to_js_str(args[2])
            return "Complex.pow($rest, 1/2)"
        elseif func == :(exp)
            rest = expr_to_js_str(args[2])
            return "Complex.exp($rest)"
        elseif func == :(factorial)
            rest = expr_to_js_str(args[2])
            return "FACTORIAL[n]"
        else
            error("unrecognized function in ref: $(func)")
        end
    else
        dump(expr)
        error("unrecognized head $(head)")
    end
end

function expr_to_js_str(x)
    return string(x)
end

#return Complex.mul(coef_, $(expr_to_js_str(ex)))
function exprs_to_switch_case(exprs, expr_to_case_body::Function; n0=0)
    comps = ["switch(n){"]
    for (n, ex) in zip(Iterators.countfrom(n0, 1), exprs)
        case = expr_to_case_body(expr_to_js_str(ex))
        push!(comps, "case $(n): $(case);")
    end
    push!(comps, "default: throw new Error(\"Got n greater than N_MAX\");", "}")
    return join(comps, "\n")
end

function exprs_to_js_source(
    exprs,
    expr_to_case_body::Function;
    const_coef_wolfram::String,
    const_coef_to_js::Function,
    func_sig::String,
    initial_lines::Vector{String},
)
    constCoefJs = const_coef_wolfram |> wolfram_to_jl_str |> Meta.parse |> expr_to_js_str

    comps = [
        initial_lines...,
        "function $(func_sig) {",
        const_coef_to_js(constCoefJs),
        exprs_to_switch_case(exprs, expr_to_case_body),
        "}",
    ]

    return join(comps, "\n")
end

# %%

function make_basis_coefs()
    exprs =
        read(joinpath(@__DIR__, "basis_coeffs.txt"), String) |>
        split_input .|>
        wolfram_to_jl_str .|>
        Meta.parse

    js_src = exprs_to_js_source(
        exprs,
        expr -> "return Complex.mul(coef_, $(expr_to_js_str(expr)))";
        const_coef_wolfram=raw"""((2^(3/4) Sqrt[\[Sigma]]) (m \[Omega] \[HBar]^(2n+1))^(1/4) E^(-((p^2
            \[Sigma]^2)/(2 m \[Sigma]^2 \[Omega] \[HBar]+\[HBar]^2))))/((2 m \[Sigma]^2
            \[Omega]+\[HBar])^(n+1/2) Sqrt[2^n n!] \[HBar]^n)""",
        const_coef_to_js=js -> "const coef_ = $(js);",
        func_sig="basisCoefficient(n,{sigma, p, omega, m})",
        initial_lines=["/* global Complex H_BAR FACTORIAL*/"],
    )

    return write(joinpath(dirname(@__DIR__), "basis_coef.js"), js_src)
end
make_basis_coefs()

function make_psi_functions()
    exprs =
        read(joinpath(@__DIR__, "psi_functions.txt"), String) |>
        split_input .|>
        wolfram_to_jl_str .|>
        Meta.parse

    js_src = exprs_to_js_source(
        exprs,
        expr -> "return x => Complex.mul(coef_(x), $(expr_to_js_str(expr)))";
        const_coef_wolfram=raw"""(Exp[-((m \[Omega] x^2)/(2 \[HBar]))] ((m
            \[Omega])/\[HBar])^(1/4))/(\[Pi]^(1/4) Sqrt[2^n n!])""",
        const_coef_to_js=js -> "const coef_ = x => $(js);",
        func_sig="psiFunction(n,{ omega, m})",
        initial_lines=["/* global Complex H_BAR FACTORIAL */"],
    )

    return write(joinpath(dirname(@__DIR__), "psi_functions.js"), js_src)
end
make_psi_functions()

# %%
function make_diracdelta_functions()
    exprs =
        read(joinpath(@__DIR__, "delta_coeffs.txt"), String) |>
        split_input .|>
        wolfram_to_jl_str .|>
        Meta.parse

    js_src = exprs_to_js_source(
        exprs,
        expr -> "return Complex.mul(coef_, $(expr_to_js_str(expr)))";
        const_coef_wolfram=raw"""((m \[Omega])^(3/4)
            Exp[-m x^2 \[Omega]/(2 \[HBar])]/(\[HBar]^(n/2)
            (\[HBar] \[Pi])^(1/4) Sqrt[2^n Factorial[n]]))""",
        const_coef_to_js=js -> "const coef_ = $(js);",
        func_sig="deltaCoef(n, {omega, m, xMeasured: x})",
        initial_lines=["/* global Complex H_BAR FACTORIAL */"],
    )

    return write(joinpath(dirname(@__DIR__), "delta_coeffs.js"), js_src)
end
make_diracdelta_functions()

# %%

hermitians = """
0: 1

1: 2 x

2: -2+4 x^2

3: -12 x+8 x^3

4: 12-48 x^2+16 x^4

5: 120 x-160 x^3+32 x^5

6: -120+720 x^2-480 x^4+64 x^6

7: -1680 x+3360 x^3-1344 x^5+128 x^7

8: 1680-13440 x^2+13440 x^4-3584 x^6+256 x^8

9: 30240 x-80640 x^3+48384 x^5-9216 x^7+512 x^9

10: -30240+302400 x^2-403200 x^4+161280 x^6-23040 x^8+1024 x^10

11: -665280 x+2217600 x^3-1774080 x^5+506880 x^7-56320 x^9+2048 x^11

12: 665280-7983360 x^2+13305600 x^4-7096320 x^6+1520640 x^8-135168 x^10+4096 x^12

13: 17297280 x-69189120 x^3+69189120 x^5-26357760 x^7+4392960 x^9-319488 x^11+8192 x^13

14: -17297280+242161920 x^2-484323840 x^4+322882560 x^6-92252160 x^8+12300288
x^10-745472 x^12+16384 x^14

15: -518918400 x+2421619200 x^3-2905943040 x^5+1383782400 x^7-307507200 x^9+33546240
x^11-1720320 x^13+32768 x^15

16: 518918400-8302694400 x^2+19372953600 x^4-15498362880 x^6+5535129600 x^8-984023040
x^10+89456640 x^12-3932160 x^14+65536 x^16

17: 17643225600 x-94097203200 x^3+131736084480 x^5-75277762560 x^7+20910489600
x^9-3041525760 x^11+233963520 x^13-8912896 x^15+131072 x^17

18: -17643225600+317578060800 x^2-846874828800 x^4+790416506880 x^6-338749931520
x^8+75277762560 x^10-9124577280 x^12+601620480 x^14-20054016 x^16+262144 x^18

19: -670442572800 x+4022655436800 x^3-6436248698880 x^5+4290832465920 x^7-1430277488640
x^9+260050452480 x^11-26671841280 x^13+1524105216 x^15-44826624 x^17+524288 x^19

20: 670442572800-13408851456000 x^2+40226554368000 x^4-42908324659200 x^6+21454162329600
x^8-5721109954560 x^10+866834841600 x^12-76205260800 x^14+3810263040 x^16-99614720
x^18+1048576 x^20

21: 28158588057600 x-187723920384000 x^3+337903056691200 x^5-257449947955200
x^7+100119424204800 x^9-21844238008320 x^11+2800543334400 x^13-213374730240
x^15+9413591040 x^17-220200960 x^19+2097152 x^21

22: -28158588057600+619488937267200 x^2-2064963124224000 x^4+2477955749068800
x^6-1415974713753600 x^8+440525466501120 x^10-80095539363840 x^12+8801707622400
x^14-586780508160 x^16+23011000320 x^18-484442112 x^20+4194304 x^22

23: -1295295050649600 x+9498830371430400 x^3-18997660742860800 x^5+16283709208166400
x^7-7237204092518400 x^9+1842197405368320 x^11-283414985441280 x^13+26991903375360
x^15-1587759022080 x^17+55710842880 x^19-1061158912 x^21+8388608 x^23

24: 1295295050649600-31087081215590400 x^2+113985964457164800 x^4-151981285942886400
x^6+97702255248998400 x^8-34738579644088320 x^10+7368789621473280 x^12-971708521512960
x^14+80975710126080 x^16-4234024058880 x^18+133706022912 x^20-2315255808 x^22+16777216
x^24

25: 64764752532480000 x-518118020259840000 x^3+1139859644571648000
x^5-1085580613877760000 x^7+542790306938880000 x^9-157902634745856000
x^11+28341498544128000 x^13-3239028405043200 x^15+238163853312000 x^17-11142168576000
x^19+318347673600 x^21-5033164800 x^23+33554432 x^25

"""

function hermite_wolfram_to_js_strs(s::AbstractString)
    @as s s begin
        replace(s, r"^\s*(\d+:)\s*" => s"case-\1")
        replace(s, r"\s+" => "*")
        replace(s, "^" => "**")
        replace(s, "case-" => "case ")
        replace(s, r"(case\s\d+:\s*)(.*)" => s"\1 return x => \2;")
    end
end

function js_cases_to_switch_case(cases)
    return join(["switch(n){", cases..., "}"], "\n")
end

clipboard(
    hermitians |> split_input .|> hermite_wolfram_to_js_strs |> js_cases_to_switch_case
)

# %%

# %%
launched_gaussian = raw"""(E^((2 p^2 t \[Sigma]^2-4 m p x \[Sigma]^2-I m x^2 \[HBar])/(4 I m \[Sigma]^2 \[HBar]-2 t \[HBar]^2)) (2/\[Pi])^(1/4))/Sqrt[2 \[Sigma]+(I t \[HBar])/(m \[Sigma])]"""

clipboard(launched_gaussian |> wolfram_to_jl_str |> Meta.parse |> expr_to_js_str)

# %%
clipboard() |>
split_input .|>
wolfram_to_jl_str .|>
Meta.parse |>
exprs_to_js_source |>
clipboard
