# %%
import argparse
import base64
import enum
import json
import re
import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup, Tag

SYMBOLS_TO_REPLACE = [
    "AESTHETIC",
    "AX_HEIGHT",
    "AX_MAX_X",
    "AX_MAX_Y",
    "AX_MID_X",
    "AX_MID_Y",
    "AX_MIN_X",
    "AX_MIN_Y",
    "AX_TRAIN_HEIGHT",
    "AX_TRAIN_WIDTH",
    "AX_WIDTH",
    "CANVAS_HEIGHT",
    "CANVAS_WIDTH",
    "CONFIG",
    "THIS_DEMO_SPEED_MULTIPLIER",
    "TOTAL_DURATION_MS",
    "TOTAL_DURATION_SEC",
    "TRAIN_HEIGHT_PROPTN",
    "TRAIN_WIDTH_PROPTN",
    "USER_INFO",
    "X_MARGIN_PROPTN",
    "Y_MARGIN_PROPTN",
    "addTracks",
    "addTrainAndLightSources",
    "animationEndDate",
    "animationIsPlaying",
    "animationStartDate",
    "animationTimer",
    "axDistBtwnTies",
    "axDistTraveled",
    "axDistTraveledAsFracOfTrainWidth",
    "beginButton",
    "durationMSOfAnimationReset",
    "easingForAnimationReset",
    "fracOfC",
    "getRailroadTieParams",
    "initialTieAxX",
    "maxTrainSpeed",
    "nTiesVisible",
    "photons",
    "playbackInfo",
    "railroadRail",
    "railroadTie",
    "resetButton",
    "trackInteriorAxMaxX",
    "trackInteriorAxMinX",
    "trackLines",
    "trainCar",
    "trainHeightProptn",
    "trainLightSource",
    "trainPhoton",
    "trainSpeed",
    "trainWidthProptn",
    "transAxisToCanvas",
    "xMarginProptn",
    "yMarginProptn",
]

_PRECEDED_BY_EVEN_NUMBER_OF_QUOTES_RE = r'(\\"|"(?:\\"|[^"])*")'
# https://stackoverflow.com/a/23667311
SYMBOL_RE: re.Pattern = re.compile(
    fr"{_PRECEDED_BY_EVEN_NUMBER_OF_QUOTES_RE}|(\b[a-zA-Z_]\w*\b)"
)


class Lang(enum.Enum):
    js = "javascript"


class SymbolReplacer:
    KEYWORDS = {
        None: [],
        Lang.js: [
            "abstract",
            "arguments",
            "boolean",
            "break",
            "byte",
            "case",
            "catch",
            "char",
            "const",
            "continue",
            "debugger",
            "default",
            "delete",
            "do",
            "double",
            "else",
            "eval",
            "false",
            "final",
            "finally",
            "float",
            "for",
            "function",
            "goto",
            "if",
            "implements",
            "in",
            "instanceof",
            "int",
            "interface",
            "let",
            "long",
            "native",
            "new",
            "null",
            "package",
            "private",
            "protected",
            "public",
            "return",
            "short",
            "static",
            "switch",
            "synchronized",
            "this",
            "throw",
            "throws",
            "transient",
            "true",
            "try",
            "typeof",
            "var",
            "void",
            "volatile",
            "while",
            "with",
            "yield",
            "class",
            "enum",
            "export",
            "extends",
            "import",
            "super",
        ],
    }

    ALPHABETS = {
        None: list("abcdefghijklmnopqrstuvwxyz"),
        Lang.js: list("nstcoaeirlpfd"),
    }

    def __init__(self, base_symbols, lang=None):
        self.symbols_used = set(sorted(s.lower() for s in base_symbols))
        self.symbols_used.update(self.KEYWORDS.get(lang, []))
        self.alphabet = self.ALPHABETS.get(lang)

        assert len(self.alphabet) == len(set(self.alphabet))

        self.char_nums_list = [0]

    def __advance(self):
        for i, n in enumerate(self.char_nums_list):
            if n == len(self.alphabet) - 1:
                self.char_nums_list[i] = 0
            else:
                self.char_nums_list[i] += 1
                break
        else:
            self.char_nums_list.append(0)

    def __current_symbol(self):
        return "".join(self.alphabet[n] for n in reversed(self.char_nums_list))

    def _get_next_symbol(self) -> str:
        symbol = self.__current_symbol()
        while symbol in self.symbols_used:
            self.__advance()
            symbol = self.__current_symbol()

        self.symbols_used.add(symbol)
        return symbol

    def __iter__(self):
        while True:
            yield self._get_next_symbol()


def inline(
    infile: Path,
    outfile: Path,
    *,
    ignored_link_dests,
    ignored_link_dest_regexes,
    minify_js=False,
    minify_css=False,
    minify_globals=False,
):
    if infile.resolve() == outfile.resolve():
        sys.exit("infile and outfile are the same; they must be different")

    with infile.open() as f:
        soup = BeautifulSoup(f.read(), "lxml")

    js_source_strs = []
    css_source_strs = []

    tag_names_and_link_attrs = [
        ("script", "src", js_source_strs, "r"),
        ("link", "href", css_source_strs, "r"),
        ("style", None, css_source_strs, "r"),
        ("img", "src", None, "rb"),
    ]

    for tag_name, link_attr, source_strs, file_mode in tag_names_and_link_attrs:
        tags = soup.find_all(tag_name)
        for tag in tags:
            tag: Tag
            link_dest = tag.attrs.get(link_attr)

            if link_dest is not None and (
                link_dest in ignored_link_dests
                or any(regex.search(link_dest) for regex in ignored_link_dest_regexes)
            ):
                continue

            if link_dest is None:
                contents = tag.string
            else:
                absolute_src: Path = infile.parent / link_dest

                with absolute_src.open(file_mode) as f:
                    contents = f.read()

            if tag_name == "img":
                data = base64.b64encode(contents).decode("utf-8")
                tag[
                    "src"
                ] = f"data:image/{absolute_src.suffix.strip('.')};base64,{data}"
            else:
                source_strs.append(contents)
                tag.decompose()

    if js_source_strs:
        js_source_str = "\n".join(js_source_strs)
        if minify_js:
            response = requests.post(
                "https://javascript-minifier.com/raw", data={"input": js_source_str},
            )
            js_code = response.text
        else:
            js_code = js_source_str

        script_tag = soup.new_tag("script")
        script_tag["type"] = "text/javascript"
        if minify_globals:
            symbols = [match[1] for match in SYMBOL_RE.findall(js_code) if match[1]]
            replacer = SymbolReplacer(symbols, lang=Lang.js)
            replacements_dict = dict(sorted(zip(SYMBOLS_TO_REPLACE, replacer)))

            # https://stackoverflow.com/a/6464500
            symbol_regex = (r"{even_num_quotes}|(\b{sym_re}\b)").format(
                sym_re="|".join(map(re.escape, replacements_dict.keys())),
                even_num_quotes=_PRECEDED_BY_EVEN_NUMBER_OF_QUOTES_RE,
            )

            js_code = re.sub(
                symbol_regex,
                lambda match: replacements_dict.get(match.group(0), match.group(0)),
                js_code,
            )

            sourcemap_dir = Path(outfile.parent / "source maps")
            sourcemap_dir.mkdir(exist_ok=True, parents=False)

            with (sourcemap_dir / outfile.name).with_suffix(".sourcemap.json").open(
                "w"
            ) as f:
                json.dump(replacements_dict, f, indent=2)

        script_tag.string = js_code
        soup.find("body").append(script_tag)

    if css_source_strs:
        css_source_str = "\n".join(css_source_strs)
        if minify_css:
            response = requests.post(
                "https://cssminifier.com/raw", data={"input": css_source_str}
            )
            css_source = response.text
        else:
            css_source = css_source_str

        style_tag = soup.new_tag("style")
        style_tag.string = css_source
        soup.find("body").insert(0, style_tag)

    with outfile.open("w") as f:
        f.write(
            "\n".join(
                line.strip() for line in re.sub("\n\n+", "\n", str(soup)).splitlines()
            )
        )


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("infiles", nargs="*", help="The HTML file to inline")
    parser.add_argument(
        "-o",
        required=False,
        dest="outfile",
        help="The filename to save the inlined file to",
    )
    parser.add_argument("--outdir", required=False, help="The directory to save to")
    parser.add_argument(
        "--exclude-html-regex",
        required=False,
        help="A regex describing HTML files to skip; ignored if infile is given",
    )
    parser.add_argument(
        "--ignore",
        action="append",
        default=[],
        help="External resources to skip inlining",
    )
    parser.add_argument(
        "--ignore-regex",
        action="append",
        default=[],
        help="A regex describing external resources to skip inlining",
    )

    parser.add_argument(
        "--minify-js",
        action="store_true",
        help="Minify JavaScript (requires an internet connection)",
    )

    parser.add_argument(
        "--minify-css",
        action="store_true",
        help="Minify CSS (requires an internet connection)",
    )

    parser.add_argument(
        "--minify-globals",
        action="store_true",
        help="Minify global variables and properties in JS",
    )

    args = parser.parse_args()

    if len(args.infiles) > 0:
        infiles = [Path(p) for p in args.infiles]
    else:
        if args.outfile is not None:
            sys.exit("Cannot specify outfile without specifying an infile")

        infiles = list(Path().glob("**/*.html"))
        if args.exclude_html_regex is not None:
            ehr = re.compile(args.exclude_html_regex)
            infiles = [p for p in infiles if not ehr.search(p.name)]

    for infile in infiles:
        infile = infile.resolve()
        outdir: Path
        if args.outdir is None:
            outdir = Path(".").resolve()
            while outdir.name != "src" and outdir.name != "/":
                outdir = outdir.parent

            outdir = outdir / "dist" / infile.relative_to(outdir / "demos").parent
        else:
            outdir = Path(args.outdir)

        outdir.mkdir(exist_ok=True, parents=True)

        if args.outfile is None:
            suffix = infile.suffix
            if args.minify_globals:
                suffix = f".min{suffix}"

            outfile_name = (
                infile.with_name(infile.stem + "_inlined").with_suffix(suffix).name
            )

        else:
            outfile_name = args.outfile

        outfile = outdir / outfile_name

        ignored_link_dests = set(args.ignore)
        ignored_link_dest_regexes = [re.compile(regex) for regex in args.ignore_regex]

        inline(
            infile,
            outfile,
            ignored_link_dests=ignored_link_dests,
            ignored_link_dest_regexes=ignored_link_dest_regexes,
            minify_js=args.minify_js,
            minify_css=args.minify_css,
            minify_globals=args.minify_globals,
        )


# %%
if __name__ == "__main__":
    main()
