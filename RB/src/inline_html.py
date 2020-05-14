import argparse
import re
import sys
from pathlib import Path

import requests
from bs4 import BeautifulSoup, Tag


def inline(
    infile: Path, outfile: Path, *, ignored_link_dests, ignored_link_dest_regexes
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
        script_tag.string = response.text
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
            outfile = infile.with_name(infile.stem + "_inlined").with_suffix(
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
        )


if __name__ == "__main__":
    main()
