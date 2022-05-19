# %%
import Lazy.@as
using InteractiveUtils

N_MAX = 20

strings = raw"""
0: 1

1: 4 I p \[Sigma]^2

2: -2 (8 p^2 \[Sigma]^4+(1-4 \[Sigma]^4) \[HBar]^2)

3: -8 I p \[Sigma]^2 (8 p^2 \[Sigma]^4+3 (1-4 \[Sigma]^4) \[HBar]^2)

4: 4 (64 p^4 \[Sigma]^8-48 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4) \[HBar]^2+3 (1-4
\[Sigma]^4)^2 \[HBar]^4)

5: 16 I p \[Sigma]^2 (64 p^4 \[Sigma]^8-80 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4) \[HBar]^2+15
(1-4 \[Sigma]^4)^2 \[HBar]^4)

6: -8 (512 p^6 \[Sigma]^12-960 p^4 \[Sigma]^8 (-1+4 \[Sigma]^4) \[HBar]^2+360 p^2
\[Sigma]^4 (1-4 \[Sigma]^4)^2 \[HBar]^4-15 (-1+4 \[Sigma]^4)^3 \[HBar]^6)

7: -32 I p \[Sigma]^2 (512 p^6 \[Sigma]^12-1344 p^4 \[Sigma]^8 (-1+4 \[Sigma]^4)
\[HBar]^2+840 p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^2 \[HBar]^4-105 (-1+4 \[Sigma]^4)^3
\[HBar]^6)

8: 16 (4096 p^8 \[Sigma]^16-14336 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4) \[HBar]^2+13440 p^4
\[Sigma]^8 (1-4 \[Sigma]^4)^2 \[HBar]^4-3360 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^3
\[HBar]^6+105 (1-4 \[Sigma]^4)^4 \[HBar]^8)

9: 64 I p \[Sigma]^2 (4096 p^8 \[Sigma]^16-18432 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)
\[HBar]^2+24192 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^2 \[HBar]^4-10080 p^2 \[Sigma]^4 (-1+4
\[Sigma]^4)^3 \[HBar]^6+945 (1-4 \[Sigma]^4)^4 \[HBar]^8)

10: -32 (32768 p^10 \[Sigma]^20-184320 p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)
\[HBar]^2+322560 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^2 \[HBar]^4-201600 p^4 \[Sigma]^8
(-1+4 \[Sigma]^4)^3 \[HBar]^6+37800 p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^4 \[HBar]^8-945
(-1+4 \[Sigma]^4)^5 \[HBar]^10)

11: -128 I p \[Sigma]^2 (32768 p^10 \[Sigma]^20-225280 p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)
\[HBar]^2+506880 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^2 \[HBar]^4-443520 p^4 \[Sigma]^8
(-1+4 \[Sigma]^4)^3 \[HBar]^6+138600 p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^4 \[HBar]^8-10395
(-1+4 \[Sigma]^4)^5 \[HBar]^10)

12: 64 (262144 p^12 \[Sigma]^24-2162688 p^10 \[Sigma]^20 (-1+4 \[Sigma]^4)
\[HBar]^2+6082560 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^2 \[HBar]^4-7096320 p^6 \[Sigma]^12
(-1+4 \[Sigma]^4)^3 \[HBar]^6+3326400 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^4 \[HBar]^8-498960
p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^5 \[HBar]^10+10395 (1-4 \[Sigma]^4)^6 \[HBar]^12)

13: 256 I p \[Sigma]^2 (262144 p^12 \[Sigma]^24-2555904 p^10 \[Sigma]^20 (-1+4
\[Sigma]^4) \[HBar]^2+8785920 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^2 \[HBar]^4-13178880 p^6
\[Sigma]^12 (-1+4 \[Sigma]^4)^3 \[HBar]^6+8648640 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^4
\[HBar]^8-2162160 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^5 \[HBar]^10+135135 (1-4
\[Sigma]^4)^6 \[HBar]^12)

14: -128 (2097152 p^14 \[Sigma]^28-23855104 p^12 \[Sigma]^24 (-1+4 \[Sigma]^4)
\[HBar]^2+98402304 p^10 \[Sigma]^20 (1-4 \[Sigma]^4)^2 \[HBar]^4-184504320 p^8
\[Sigma]^16 (-1+4 \[Sigma]^4)^3 \[HBar]^6+161441280 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^4
\[HBar]^8-60540480 p^4 \[Sigma]^8 (-1+4 \[Sigma]^4)^5 \[HBar]^10+7567560 p^2 \[Sigma]^4
(1-4 \[Sigma]^4)^6 \[HBar]^12-135135 (-1+4 \[Sigma]^4)^7 \[HBar]^14)

15: -512 I p \[Sigma]^2 (2097152 p^14 \[Sigma]^28-27525120 p^12 \[Sigma]^24 (-1+4
\[Sigma]^4) \[HBar]^2+134184960 p^10 \[Sigma]^20 (1-4 \[Sigma]^4)^2 \[HBar]^4-307507200
p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)^3 \[HBar]^6+345945600 p^6 \[Sigma]^12 (1-4
\[Sigma]^4)^4 \[HBar]^8-181621440 p^4 \[Sigma]^8 (-1+4 \[Sigma]^4)^5 \[HBar]^10+37837800
p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^6 \[HBar]^12-2027025 (-1+4 \[Sigma]^4)^7 \[HBar]^14)

16: 256 (16777216 p^16 \[Sigma]^32-251658240 p^14 \[Sigma]^28 (-1+4 \[Sigma]^4)
\[HBar]^2+1431306240 p^12 \[Sigma]^24 (1-4 \[Sigma]^4)^2 \[HBar]^4-3936092160 p^10
\[Sigma]^20 (-1+4 \[Sigma]^4)^3 \[HBar]^6+5535129600 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^4
\[HBar]^8-3874590720 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)^5 \[HBar]^10+1210809600 p^4
\[Sigma]^8 (1-4 \[Sigma]^4)^6 \[HBar]^12-129729600 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^7
\[HBar]^14+2027025 (1-4 \[Sigma]^4)^8 \[HBar]^16)

17: 1024 I p \[Sigma]^2 (16777216 p^16 \[Sigma]^32-285212672 p^14 \[Sigma]^28 (-1+4
\[Sigma]^4) \[HBar]^2+1871708160 p^12 \[Sigma]^24 (1-4 \[Sigma]^4)^2
\[HBar]^4-6083051520 p^10 \[Sigma]^20 (-1+4 \[Sigma]^4)^3 \[HBar]^6+10455244800 p^8
\[Sigma]^16 (1-4 \[Sigma]^4)^4 \[HBar]^8-9409720320 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)^5
\[HBar]^10+4116752640 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^6 \[HBar]^12-735134400 p^2
\[Sigma]^4 (-1+4 \[Sigma]^4)^7 \[HBar]^14+34459425 (1-4 \[Sigma]^4)^8 \[HBar]^16)

18: -512 (134217728 p^18 \[Sigma]^36-2566914048 p^16 \[Sigma]^32 (-1+4 \[Sigma]^4)
\[HBar]^2+19251855360 p^14 \[Sigma]^28 (1-4 \[Sigma]^4)^2 \[HBar]^4-72996618240 p^12
\[Sigma]^24 (-1+4 \[Sigma]^4)^3 \[HBar]^6+150555525120 p^10 \[Sigma]^20 (1-4
\[Sigma]^4)^4 \[HBar]^8-169374965760 p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)^5
\[HBar]^10+98802063360 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^6 \[HBar]^12-26464838400 p^4
\[Sigma]^8 (-1+4 \[Sigma]^4)^7 \[HBar]^14+2481078600 p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^8
\[HBar]^16-34459425 (-1+4 \[Sigma]^4)^9 \[HBar]^18)

19: -2048 I p \[Sigma]^2 (134217728 p^18 \[Sigma]^36-2868903936 p^16 \[Sigma]^32 (-1+4
\[Sigma]^4) \[HBar]^2+24385683456 p^14 \[Sigma]^28 (1-4 \[Sigma]^4)^2
\[HBar]^4-106687365120 p^12 \[Sigma]^24 (-1+4 \[Sigma]^4)^3 \[HBar]^6+260050452480 p^10
\[Sigma]^20 (1-4 \[Sigma]^4)^4 \[HBar]^8-357569372160 p^8 \[Sigma]^16 (-1+4
\[Sigma]^4)^5 \[HBar]^10+268177029120 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^6
\[HBar]^12-100566385920 p^4 \[Sigma]^8 (-1+4 \[Sigma]^4)^7 \[HBar]^14+15713497800 p^2
\[Sigma]^4 (1-4 \[Sigma]^4)^8 \[HBar]^16-654729075 (-1+4 \[Sigma]^4)^9 \[HBar]^18)

20: 1024 (1073741824 p^20 \[Sigma]^40-25501368320 p^18 \[Sigma]^36 (-1+4 \[Sigma]^4)
\[HBar]^2+243856834560 p^16 \[Sigma]^32 (1-4 \[Sigma]^4)^2 \[HBar]^4-1219284172800 p^14
\[Sigma]^28 (-1+4 \[Sigma]^4)^3 \[HBar]^6+3467339366400 p^12 \[Sigma]^24 (1-4
\[Sigma]^4)^4 \[HBar]^8-5721109954560 p^10 \[Sigma]^20 (-1+4 \[Sigma]^4)^5
\[HBar]^10+5363540582400 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^6 \[HBar]^12-2681770291200 p^6
\[Sigma]^12 (-1+4 \[Sigma]^4)^7 \[HBar]^14+628539912000 p^4 \[Sigma]^8 (1-4
\[Sigma]^4)^8 \[HBar]^16-52378326000 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^9
\[HBar]^18+654729075 (1-4 \[Sigma]^4)^10 \[HBar]^20)

21: 4096 I p \[Sigma]^2 (1073741824 p^20 \[Sigma]^40-28185722880 p^18 \[Sigma]^36 (-1+4
\[Sigma]^4) \[HBar]^2+301234913280 p^16 \[Sigma]^32 (1-4 \[Sigma]^4)^2
\[HBar]^4-1706997841920 p^14 \[Sigma]^28 (-1+4 \[Sigma]^4)^3 \[HBar]^6+5601086668800
p^12 \[Sigma]^24 (1-4 \[Sigma]^4)^4 \[HBar]^8-10922119004160 p^10 \[Sigma]^20 (-1+4
\[Sigma]^4)^5 \[HBar]^10+12514928025600 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^6
\[HBar]^12-8045310873600 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)^7 \[HBar]^14+2639867630400
p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^8 \[HBar]^16-366648282000 p^2 \[Sigma]^4 (-1+4
\[Sigma]^4)^9 \[HBar]^18+13749310575 (1-4 \[Sigma]^4)^10 \[HBar]^20)

22: -2048 (8589934592 p^22 \[Sigma]^44-248034361344 p^20 \[Sigma]^40 (-1+4 \[Sigma]^4)
\[HBar]^2+2945408040960 p^18 \[Sigma]^36 (1-4 \[Sigma]^4)^2 \[HBar]^4-18776976261120
p^16 \[Sigma]^32 (-1+4 \[Sigma]^4)^3 \[HBar]^6+70413660979200 p^14 \[Sigma]^28 (1-4
\[Sigma]^4)^4 \[HBar]^8-160191078727680 p^12 \[Sigma]^24 (-1+4 \[Sigma]^4)^5
\[HBar]^10+220262733250560 p^10 \[Sigma]^20 (1-4 \[Sigma]^4)^6
\[HBar]^12-176996839219200 p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)^7 \[HBar]^14+77436117158400
p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^8 \[HBar]^16-16132524408000 p^4 \[Sigma]^8 (-1+4
\[Sigma]^4)^9 \[HBar]^18+1209939330600 p^2 \[Sigma]^4 (1-4 \[Sigma]^4)^10
\[HBar]^20-13749310575 (-1+4 \[Sigma]^4)^11 \[HBar]^22)

23: -8192 I p \[Sigma]^2 (8589934592 p^22 \[Sigma]^44-271656681472 p^20 \[Sigma]^40
(-1+4 \[Sigma]^4) \[HBar]^2+3565493944320 p^18 \[Sigma]^36 (1-4 \[Sigma]^4)^2
\[HBar]^4-25404144353280 p^16 \[Sigma]^32 (-1+4 \[Sigma]^4)^3 \[HBar]^6+107967613501440
p^14 \[Sigma]^28 (1-4 \[Sigma]^4)^4 \[HBar]^8-283414985441280 p^12 \[Sigma]^24 (-1+4
\[Sigma]^4)^5 \[HBar]^10+460549351342080 p^10 \[Sigma]^20 (1-4 \[Sigma]^4)^6
\[HBar]^12-452325255782400 p^8 \[Sigma]^16 (-1+4 \[Sigma]^4)^7
\[HBar]^14+254432956377600 p^6 \[Sigma]^12 (1-4 \[Sigma]^4)^8 \[HBar]^16-74209612276800
p^4 \[Sigma]^8 (-1+4 \[Sigma]^4)^9 \[HBar]^18+9276201534600 p^2 \[Sigma]^4 (1-4
\[Sigma]^4)^10 \[HBar]^20-316234143225 (-1+4 \[Sigma]^4)^11 \[HBar]^22)

24: 4096 (68719476736 p^24 \[Sigma]^48-2370821947392 p^22 \[Sigma]^44 (-1+4 \[Sigma]^4)
\[HBar]^2+34228741865472 p^20 \[Sigma]^40 (1-4 \[Sigma]^4)^2 \[HBar]^4-270977539768320
p^18 \[Sigma]^36 (-1+4 \[Sigma]^4)^3 \[HBar]^6+1295611362017280 p^16 \[Sigma]^32 (1-4
\[Sigma]^4)^4 \[HBar]^8-3886834086051840 p^14 \[Sigma]^28 (-1+4 \[Sigma]^4)^5
\[HBar]^10+7368789621473280 p^12 \[Sigma]^24 (1-4 \[Sigma]^4)^6
\[HBar]^12-8684644911022080 p^10 \[Sigma]^20 (-1+4 \[Sigma]^4)^7
\[HBar]^14+6106390953062400 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^8
\[HBar]^16-2374707592857600 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)^9
\[HBar]^18+445257673660800 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^10 \[HBar]^20-30358477749600
p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^11 \[HBar]^22+316234143225 (1-4 \[Sigma]^4)^12
\[HBar]^24)

25: 16384 I p \[Sigma]^2 (68719476736 p^24 \[Sigma]^48-2576980377600 p^22 \[Sigma]^44
(-1+4 \[Sigma]^4) \[HBar]^2+40748502220800 p^20 \[Sigma]^40 (1-4 \[Sigma]^4)^2
\[HBar]^4-356549394432000 p^18 \[Sigma]^36 (-1+4 \[Sigma]^4)^3
\[HBar]^6+1905310826496000 p^16 \[Sigma]^32 (1-4 \[Sigma]^4)^4
\[HBar]^8-6478056810086400 p^14 \[Sigma]^28 (-1+4 \[Sigma]^4)^5
\[HBar]^10+14170749272064000 p^12 \[Sigma]^24 (1-4 \[Sigma]^4)^6
\[HBar]^12-19737829343232000 p^10 \[Sigma]^20 (-1+4 \[Sigma]^4)^7
\[HBar]^14+16962197091840000 p^8 \[Sigma]^16 (1-4 \[Sigma]^4)^8
\[HBar]^16-8481098545920000 p^6 \[Sigma]^12 (-1+4 \[Sigma]^4)^9
\[HBar]^18+2226288368304000 p^4 \[Sigma]^8 (1-4 \[Sigma]^4)^10
\[HBar]^20-252987314580000 p^2 \[Sigma]^4 (-1+4 \[Sigma]^4)^11 \[HBar]^22+7905853580625
(1-4 \[Sigma]^4)^12 \[HBar]^24)

          """

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
        replace(s, r"^(?:\d+:\s*)?" => "")
        replace(s, r"\\\[(\w+?)\]" => s"\1")
        replace(s, r"\s+" => "*")
        replace(s, "n!" => "factorial(n)")
        replace(s, r"Sigma|Mu" => lowercase)
        replace(s, "-1+4*sigma^4" => "(s4_)", "1-4*sigma^4" => "(-s4_)")
        replace(s, "HBar" => "H_BAR")
        replace(s, r"\bI\b" => "Complex.i")
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

        if op == :(^) && rest[1] == :(E)
            func = "Complex.exp"
            rest = rest[2:end]
        end

        js_string = join([func, "(", ("($(expr_to_js_str(ex)))," for ex in rest)..., ")"])
        return js_string
    elseif head == :ref
        func = args[1]
        if func == :(Sqrt)
            rest = expr_to_js_str(args[2])
            return "Complex.pow($rest, 1/2)"
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

function exprs_to_switch_case(exprs, n0)
    comps = ["switch(n){"]
    for (n, ex) in zip(Iterators.countfrom(n0, 1), exprs)
        push!(comps, "case $(n):\n return Complex.mul(coef_, $(expr_to_js_str(ex)));")
    end
    push!(comps, "}")
    return join(comps, "\n")
end

exprs_to_switch_case(exprs) = exprs_to_switch_case(exprs, 0)

function exprs_to_js_source(exprs)
    constCoef = raw"""
    (2^(3/4) \[Sigma]^(1/2) E^(-(p^2/((2+1/\[Sigma]^2) \[HBar]^2))))/((2^n  n!)^(1/2) (2 \[Sigma]^2+1)^(n+1/2) \[HBar]^n)"""
    constCoefJs = constCoef |> wolfram_to_jl_str |> Meta.parse |> expr_to_js_str
    println(constCoefJs)

    comps = [
        "/* global Complex H_BAR */",
        "",
        """function factorial(n) {
            let acc = 1;
            for (let i = 1; i <= n; i++) {
                acc *= i;
            }
            return acc;
        }
        """,
        "",
        "function basisCoefficient(n,{sigma, p}) {",
        "const coef_ = $(constCoefJs);",
        "const s4_ = -1+4*sigma**4;",
        "switch(n){",
    ]
    for (n, ex) in zip(Iterators.countfrom(0, 1), exprs)
        push!(comps, "case $(n):\n return Complex.mul(coef_, $(expr_to_js_str(ex)));")
    end
    push!(comps, "default: throw new Error(\"Got n greater than N_MAX\")", "}", "}")
    return join(comps, "\n")
end

exprs = strings |> split_input .|> wolfram_to_jl_str .|> Meta.parse
dump(exprs[1:2])

write(joinpath(@__DIR__, "basis_coef.js"), exprs_to_js_source(exprs))

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
launched_gaussian = raw"""(E^((2 p^2 t \[Sigma]^2-4 m p x \[Sigma]^2-I m x^2 \[HBar])/(4 I m \[Sigma]^2 \[HBar]-2 t \[HBar]^2)) (2/\[Pi])^(1/4))/Sqrt[2 \[Sigma]+(I t \[HBar])/(m \[Sigma])]"""

clipboard(launched_gaussian |> wolfram_to_jl_str |> Meta.parse |> expr_to_js_str)
