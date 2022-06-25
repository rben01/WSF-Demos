import argparse
import re
import time
import urllib.parse
from pathlib import Path
from typing import Optional, Union, cast

from bs4 import BeautifulSoup, Doctype, Tag


def get_html_listing_soup(
    in_folder: Union[Path, str],
    page_title: Optional[str] = None,
    out_file: Optional[Union[Path, str]] = None,
) -> BeautifulSoup:

    in_folder = Path(in_folder)

    soup = BeautifulSoup("", "html5lib")
    cast(Tag, soup.find("html"))["lang"] = "en"

    soup.insert(0, Doctype("html"))

    if page_title is None:
        page_title = in_folder.stem

    head = cast(Tag, soup.find("head"))
    title = soup.new_tag("title")
    title.string = page_title
    head.append(title)

    body = cast(Tag, soup.find("body"))

    link: Tag = soup.new_tag("div")
    body.append(link)
    link_a: Tag = soup.new_tag("a")
    link.append(link_a)
    link_a[
        "href"
    ] = "https://dts333.github.io/WSF-Demos/QM%20Course%20Materials/Problems+exercises/qm_problems.html"
    link_a.string = "Link to Problems and Exercises Page"

    ul: Tag = soup.new_tag("ul")
    body.append(ul)

    now_sec = int(time.time())
    inlined_suffix_regex = re.compile(r"_inlined$")

    li: Tag
    for demo_full_path in sorted(in_folder.glob("**/*.html")):
        if demo_full_path.is_dir() or demo_full_path.name == "index.html":
            continue

        li = soup.new_tag("li")
        ul.append(li)

        demo_relative_path = urllib.parse.quote(
            str(demo_full_path.relative_to(in_folder)), safe="/"
        )
        a = soup.new_tag(
            "a",
            href=(f"./{demo_relative_path}?t={now_sec}"),
        )

        demo_name = inlined_suffix_regex.sub("", demo_full_path.stem)
        a.string = demo_name
        li.append(a)

    if out_file is None:
        out_file = in_folder / "index.html"

    _ = Path(out_file).write_text(str(soup))

    return soup


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("folder")
    parser.add_argument("--title")
    parser.add_argument("--out-file")

    args = parser.parse_args()
    get_html_listing_soup(args.folder, args.title, args.out_file)
