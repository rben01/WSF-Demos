import argparse
import re
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
        raise ValueError("infile and outfile are the same; they must be different")

    with infile.open() as f:
        soup = BeautifulSoup(f.read(), "lxml")

    ignored_srcs = set(args.ignore)
    ignored_src_regexes = [re.compile(regex) for regex in args.ignore_regex]

    scripts = soup.find_all("script")
    for script in scripts:
        script: Tag
        src = script.get("src")
        if (
            src is None
            or src in ignored_srcs
            or any(regex.search(src) for regex in ignored_src_regexes)
        ):
            continue

        script.attrs.pop("src")
        absolute_src: Path = infile.parent / src
        with absolute_src.open() as f:
            script.string = f.read()

    with outfile.open("w") as f:
        f.write(soup.prettify())


if __name__ == "__main__":
    main()
