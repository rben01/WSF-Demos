from pathlib import Path
from typing import Optional, Union

from bs4 import BeautifulSoup

BASE_DIR = Path(__file__).parent.resolve()


def get_html_listing_soup(
    in_folder: Union[Path, str], out_file: Optional[Union[Path, str]] = None
) -> BeautifulSoup:
    in_folder = BASE_DIR / in_folder
    soup = BeautifulSoup("", "html5")
    body = soup.find("body")
    ul: BeautifulSoup = soup.new_tag("ul")
    body.append(ul)

    for demo in sorted(in_folder.iterdir()):
        demo_name = demo.name
        if demo_name.startswith(".") or not demo.is_dir():
            continue

        html_full_path = demo / f"{demo_name}.html"
        if not html_full_path.exists():
            html_full_path = next(demo.glob("*.html"))

        html_relative_path = html_full_path.relative_to(BASE_DIR)
        li = soup.new_tag("li")
        ul.append(li)
        a = soup.new_tag("a", href=str(html_relative_path))
        a.string = demo_name
        li.append(a)

    if out_file is None:
        out_file = BASE_DIR / "index.html"

    Path(out_file).write_text(str(soup))


get_html_listing_soup("New Demos")
