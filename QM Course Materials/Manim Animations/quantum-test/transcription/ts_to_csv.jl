using CSV
using JSON
using DataFrames

struct Timestamp
    str::String
    ms::Int
end

struct Timespan
    t0::Timestamp
    t1::Timestamp
end

Timespan(segment) = Timespan(segment["timestamps"], segment["offsets"])

Timespan(timestamps, offsets) = Timespan(
    Timestamp(timestamps["from"], offsets["from"]),
    Timestamp(timestamps["to"], offsets["to"]),
)

struct TextSpan
    span::Timespan
    text::String
end

TextSpan(segment) = TextSpan(Timespan(segment), segment["text"])

function get_df(d, words)
    data = nothing

    for item in d["transcription"]
        text_span = TextSpan(item)
        (; text, span) = text_span
        text = replace(strip(text), r"[.,!?]" => "")

        !isempty(text) || continue

        (; t0, t1) = span
        datum = (;
            text,
            t0_str=t0.str,
            t0_ms=t0.ms,
            t1_str=t1.str,
            t1_ms=t1.ms,
            duration_ms=t1.ms - t0.ms,
            keep=length(text) == 1 || !(text in words || '\'' in text),
            id=missing,
        )

        if data === nothing
            data = typeof(datum)[]
        end

        push!(data, datum)
    end
    return DataFrame(data)
end

get_df(d) = get_df(d, Set(eachline("/usr/share/dict/words")))

get_df() = get_df(JSON.parsefile(joinpath(@__DIR__, "ho-ts.json")))

df = get_df()

CSV.write(joinpath(@__DIR__, "ts.csv"), df)
