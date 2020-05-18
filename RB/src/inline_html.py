import argparse
import enum
import re
import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup, Tag

SYMBOLS_TO_REPLACE = [
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


SYMBOL_RE: re.Pattern = re.compile(r"""(?<!")\b[a-zA-Z_]\w*\b(?!")""")


class Lang(enum.Enum):
    js = "javascript"


class SymbolReplacer:
    KEYWORDS = {
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
        ]
    }

    def __init__(self, base_symbols, lang=None):
        self.symbols_used = set(sorted(s.lower() for s in base_symbols))
        if lang is not None:
            self.symbols_used.update(self.KEYWORDS[lang])

        self.symbol_chars = ["a"]

    def _advance(self):
        for i, c in enumerate(self.symbol_chars):
            if c == "z":
                self.symbol_chars[i] = "a"
            else:
                self.symbol_chars[i] = chr(ord(c) + 1)
                break
        else:
            self.symbol_chars.append("a")

    def _current_symbol(self):
        return "".join(reversed(self.symbol_chars)).lower()

    def get_next_symbol(self) -> str:
        symbol = self._current_symbol()
        while symbol in self.symbols_used:
            self._advance()
            symbol = self._current_symbol()

        self.symbols_used.add(symbol)
        return symbol


def inline(
    infile: Path,
    outfile: Path,
    *,
    ignored_link_dests,
    ignored_link_dest_regexes,
    minify_globals=True
):
    if infile.resolve() == outfile.resolve():
        sys.exit("infile and outfile are the same; they must be different")

    with infile.open() as f:
        soup = BeautifulSoup(f.read(), "lxml")

    js_source_strs = []
    css_source_strs = []

    tag_names_and_link_attrs = [
        ("script", "src", js_source_strs),
        ("link", "href", css_source_strs),
    ]

    for tag_name, link_attr, source_strs in tag_names_and_link_attrs:
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

                with absolute_src.open() as f:
                    contents = f.read()

            source_strs.append(contents)
            tag.decompose()

    if js_source_strs:
        js_source_str = "\n".join(js_source_strs)
        response = requests.post(
            "https://javascript-minifier.com/raw", data={"input": js_source_str},
        )
        script_tag = soup.new_tag("script")
        script_tag["type"] = "text/javascript"
        js_code = response.text

        if minify_globals:
            symbols = SYMBOL_RE.findall(js_code)
            replacer = SymbolReplacer(symbols, lang=Lang.js)
            for sym_to_replace in SYMBOLS_TO_REPLACE:
                js_code = re.sub(
                    r"""(?<!")\b{}\b(?!")""".format(sym_to_replace),
                    replacer.get_next_symbol(),
                    js_code,
                )

        script_tag.string = js_code
        soup.find("body").append(script_tag)

    if css_source_strs:
        css_source_str = "\n".join(css_source_strs)
        response = requests.post(
            "https://cssminifier.com/raw", data={"input": css_source_str}
        )
        style_tag = soup.new_tag("style")
        style_tag.string = response.text
        soup.find("body").insert(0, style_tag)

    with outfile.open("w") as f:
        f.write("\n".join(line.strip() for line in soup.prettify().splitlines()))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("infiles", nargs="*", help="The HTML file to inline")
    parser.add_argument("-o", required=False, dest="outfile", help="Output filename")
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

        infiles = Path().glob("**/*.html")
        if args.exclude_html_regex is not None:
            ehr = re.compile(args.exclude_html_regex)
            infiles = [p for p in infiles if not ehr.search(p.name)]

    for infile in infiles:
        if args.outfile is None:
            if args.minify_globals:
                filename_suffix = "_inlined_min"
            else:
                filename_suffix = "_inlined"

            outfile = infile.with_name(infile.stem + filename_suffix).with_suffix(
                infile.suffix
            )

        else:
            outfile = Path(args.outfile)

        ignored_link_dests = set(args.ignore)
        ignored_link_dest_regexes = [re.compile(regex) for regex in args.ignore_regex]

        inline(
            infile,
            outfile,
            ignored_link_dests=ignored_link_dests,
            ignored_link_dest_regexes=ignored_link_dest_regexes,
            minify_globals=args.minify_globals,
        )


if __name__ == "__main__":
    main()
