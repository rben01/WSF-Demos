import argparse
import re
import sys
from pathlib import Path

from bs4 import BeautifulSoup, Tag


def inline(
    infile: Path, outfile: Path, *, ignored_link_dests, ignored_link_dest_regexes
):
    if infile.resolve() == outfile.resolve():
        sys.exit("infile and outfile are the same; they must be different")

    with infile.open() as f:
        soup = BeautifulSoup(f.read(), "lxml")

    tag_names_and_link_attrs = [("script", "src"), ("link", "href")]

    for tag_name, link_attr in tag_names_and_link_attrs:
        tags = soup.find_all(tag_name)
        for tag in tags:
            tag: Tag
            link_dest = tag.attrs.get(link_attr)
            if (
                link_dest is None
                or link_dest in ignored_link_dests
                or any(regex.search(link_dest) for regex in ignored_link_dest_regexes)
            ):
                continue

            tag.attrs.pop(link_attr)
            absolute_src: Path = infile.parent / link_dest

            with absolute_src.open() as f:
                contents = f.read()

            if tag_name == "script":
                tag.string = contents
            elif tag_name == "link":
                tag.decompose()
                style_tag: Tag = soup.new_tag("style")
                style_tag.attrs["type"] = "text/css"
                style_tag.string = contents
                soup.find("body").insert(0, style_tag)

    with outfile.open("w") as f:
        f.write("\n".join(line.strip() for line in soup.prettify().splitlines()))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("infile", nargs="?", help="The HTML file to inline")
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

    infile_was_specified = args.infile is not None
    if infile_was_specified:
        infiles = [Path(args.infile)]
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
