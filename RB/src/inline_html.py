import argparse
import re
import sys
from pathlib import Path

from bs4 import BeautifulSoup, Tag


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-i", required=True, dest="infile", help="The HTML file to inline"
    )
    parser.add_argument("-o", required=True, dest="outfile", help="Output filename")
    parser.add_argument("--ignore", action="append", default=[])
    parser.add_argument("--ignore-regex", action="append", default=[])

    args = parser.parse_args()

    infile = Path(args.infile)
    outfile = Path(args.outfile)

    if infile.resolve() == outfile.resolve():
        sys.exit("infile and outfile are the same; they must be different")

    with infile.open() as f:
        soup = BeautifulSoup(f.read(), "lxml")

    ignored_link_dests = set(args.ignore)
    ignored_link_dest_regexes = [re.compile(regex) for regex in args.ignore_regex]

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
        f.write(soup.prettify())


if __name__ == "__main__":
    main()
