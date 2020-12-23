import argparse
import urllib.parse
import re
import time
from pathlib import Path
from typing import Optional, Union

from bs4 import BeautifulSoup


def get_html_listing_soup(
    in_folder: Union[Path, str],
    page_title: Optional[str] = None,
    out_file: Optional[Union[Path, str]] = None,
) -> BeautifulSoup:

    in_folder = Path(in_folder)

    soup = BeautifulSoup("", "html5lib")
    soup.find("html")["lang"] = "en"

    if page_title is None:
        page_title = in_folder.stem

    head = soup.find("head")
    title = soup.new_tag("title")
    title.string = page_title
    head.append(title)

    body = soup.find("body")
    ul = soup.new_tag("ul")
    body.append(ul)

    now_sec = int(time.time())
    inlined_suffix_regex = re.compile(r"_inlined$")

    for demo_full_path in sorted(in_folder.glob("**/*.html")):
        if demo_full_path.is_dir() or demo_full_path.name == "index.html":
            continue

        li = soup.new_tag("li")
        ul.append(li)

        demo_relative_path = urllib.parse.quote(
            str(demo_full_path.relative_to(in_folder)), safe="/"
        )
        a = soup.new_tag("a", href=(f"./{demo_relative_path}?t={now_sec}"),)

        demo_name = inlined_suffix_regex.sub("", demo_full_path.stem)
        a.string = demo_name
        li.append(a)

    if out_file is None:
        out_file = in_folder / "index.html"

    html = "<!DOCTYPE html>" + str(soup)
    html = html.replace("><", "\n><")
    Path(out_file).write_text(html)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("folder")
    parser.add_argument("--title")
    parser.add_argument("--out-file")

    args = parser.parse_args()
    get_html_listing_soup(args.folder, args.title, args.out_file)
