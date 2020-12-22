import argparse
import re
import time
from pathlib import Path
from typing import Optional, Union

from bs4 import BeautifulSoup


def get_html_listing_soup(
    in_folder: Union[Path, str], out_file: Optional[Union[Path, str]] = None
) -> BeautifulSoup:
    in_folder = Path(in_folder)

    soup = BeautifulSoup("", "html5lib")
    body = soup.find("body")
    ul = soup.new_tag("ul")
    body.append(ul)

    now_sec = int(time.time())

    for demo_full_path in sorted(in_folder.glob("**/*.html")):
        if demo_full_path.is_dir() or demo_full_path.name == "index.html":
            continue

        li = soup.new_tag("li")
        ul.append(li)

        demo_relative_path = demo_full_path.relative_to(in_folder)
        a = soup.new_tag("a", href=f"./{demo_relative_path}?t={now_sec}")

        demo_name = re.sub(r"_inlined$", "", demo_full_path.stem)
        a.string = demo_name
        li.append(a)

    if out_file is None:
        out_file = in_folder / "index.html"

    Path(out_file).write_text(soup.prettify())


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("folder")
    parser.add_argument("--out-file")

    args = parser.parse_args()
    get_html_listing_soup(args.folder, args.out_file)
