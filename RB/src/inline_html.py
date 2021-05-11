# %%
from __future__ import annotations
from abc import abstractmethod

import argparse
import base64
import enum
import json
import re
import sys
from pathlib import Path
from typing import (
    Callable,
    ClassVar,
    Iterable,
    Literal,
    Optional,
    Type,
    TypeVar,
    Union,
    cast,
)

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
    KEYWORDS: dict[Optional[Lang], Iterable[str]] = {
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

    def __init__(self, base_symbols: Iterable[str], lang: Optional[Lang] = None):
        self.symbols_used = set(sorted(s.lower() for s in base_symbols))
        self.symbols_used.update(self.KEYWORDS.get(lang, []))
        self.alphabet = self.ALPHABETS[lang]

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


StrLike = TypeVar("StrLike", str, bytes)


class TagContainerABC:
    read_mode: ClassVar[str]

    _content: Optional[str] = None
    _dest: Optional[str]
    _project_root: Path
    _tag: Tag

    tag_name: str
    link_attr: Optional[str]
    attrs: dict[str, str]

    def __init__(self, tag: Tag, *, project_root: Path):
        self._tag = tag
        self._project_root = project_root

        self.attrs = {
            k: v
            for k, v in cast("dict[str, str]", tag.attrs).items()
            if self.link_attr is None or k != self.link_attr
        }

        self._dest = tag.get(self.link_attr)

    def __repr__(self) -> str:
        attrs = ["tag_name", "link_attr", "_dest"]
        attr_comps = ", ".join(f"{attr}={repr(getattr(self, attr))}" for attr in attrs)
        return f"{self.__class__.__name__}({attr_comps})"

    @property
    def content(self) -> str:
        if self._content == None:
            self._content = self._get_content()
        return self._content

    @property
    def dest(self) -> Optional[str]:
        return self._dest

    @abstractmethod
    def _get_content(self) -> str:
        """Gets the content from self's tag

        Self must be fully initialized (except for perhaps ._content) before this is called

        :raises NotImplementedError: [description]
        :return: [description]
        :rtype: str
        """
        raise NotImplementedError

    @classmethod
    def get_selector(cls) -> Union[str, Callable[[Tag], bool]]:
        return cls.tag_name

    def finalize(self):
        return


class TextSrcTagContainer(TagContainerABC):
    read_mode: ClassVar[Literal["r"]] = "r"

    @abstractmethod
    def _get_content(self) -> str:
        src: Optional[str] = (
            None if self.link_attr is None else self._tag.attrs.get(self.link_attr)
        )

        if src is None:
            content = self._tag.string
            return content or ""
        else:
            if src.startswith("/"):
                src = "." + src

            full_path = self._project_root / src
            with full_path.open(self.read_mode) as f:
                return f.read()

    def update(self, tag_container_list: list[TextSrcTagContainer]) -> None:
        self._tag.string = self.content

        _ = self._tag.attrs.clear()

        for k, v in self.attrs.items():
            self._tag[k] = v

        tag_container_list.append(self)

    # def finalize(self):
    #     self._tag.decompose()


class BinarySrcTagContainer(TagContainerABC):
    read_mode: ClassVar[Literal["rb"]] = "rb"

    @abstractmethod
    def _get_content(self) -> str:
        src: str = self._tag.attrs.get(self.link_attr)
        if src.startswith("/"):
            src = "." + src

        full_path = self._project_root / src
        with full_path.open(self.read_mode) as f:
            content = f.read()

        extn = full_path.suffix.lstrip(".")
        data = base64.b64encode(content).decode("utf-8")

        img_type: str
        if extn == "svg":
            img_type = "svg+xml"
        else:
            img_type = extn

        return f"data:image/{img_type};base64,{data}"

    def update(self) -> None:
        self._tag["src"] = self.content


class ScriptTagContainer(TextSrcTagContainer):
    tag_name: Literal["script"] = "script"

    def __init__(self, tag: Tag, *, project_root: Path):
        if tag.name == "script":
            self.link_attr = "src"
        elif tag.name == "link":
            self.link_attr = "href"
        else:
            raise ValueError(f"don't know how to handle {tag.name=}")

        super().__init__(tag, project_root=project_root)
        _ = self.attrs.pop("rel", None)

    def _get_content(self) -> str:
        return super()._get_content()

    @classmethod
    def get_selector(cls) -> Union[str, Callable[[Tag], bool]]:
        def is_script_tag(tag: Tag) -> bool:
            rel: list[Tag]
            return (
                tag.name == "script"
                or tag.name == "link"
                and (rel := tag.get("rel")) is not None
                and "modulepreload" in rel
                # and (href := tag.get("href")) is not None
                # and href.endswidth(".js")
            )

        return is_script_tag

    def update(self, tag_container_list: list[TextSrcTagContainer]) -> None:
        # def rewrite_js_path(match: re.Match[str]) -> str:
        #     before, js_file_str, after = match.groups()
        #     p = Path(js_file_str)
        #     assert self.dest is not None
        #     src_folder = Path(self.dest).parent

        #     rewritten_path_str = str(src_folder / p)

        #     if rewritten_path_str.startswith("/"):
        #         rewritten_path_str = "." + rewritten_path_str

        #     return before + rewritten_path_str + after

        if self._tag.name == "link":
            self._tag.name = "script"
            self.attrs["type"] = "module"

        # if self.dest is not None:
        #     js_import_regex = (
        #         r'(?P<before>import[^;]+from")(?P<import>.*?)(?P<after>";)'
        #     )
        #     self._content = re.sub(js_import_regex, rewrite_js_path, self.content)
        # if (m := re.match(js_import_regex, self._content)) is not None:
        #     print(m.groups(), m.group(0))
        #     print(self.dest)
        #     print(re.sub(m.group(0), rewrite_js_path, self._content))

        return super().update(tag_container_list)


class StyleTagContainer(TextSrcTagContainer):
    tag_name: Literal["style"] = "style"

    def __init__(self, tag: Tag, *, project_root: Path):
        if tag.name == "style":
            self.link_attr = None
        elif tag.name == "link":
            self.link_attr = "href"
        else:
            raise ValueError(f"Invalid tag for {self.__class__}: {tag.name=}")

        super().__init__(tag, project_root=project_root)
        _ = self.attrs.pop("rel", None)

    def _get_content(self) -> str:
        return super()._get_content()

    @classmethod
    def get_selector(cls) -> Callable[[Tag], bool]:
        def is_style_tag(tag: Tag) -> bool:
            rel: list[Tag]
            return (
                tag.name == "link"
                and (rel := tag.get("rel")) is not None
                and "stylesheet" in rel
            )

        return is_style_tag

    def update(self, tag_container_list: list[TextSrcTagContainer]) -> None:
        if self._tag.name == "link":
            self._tag.name = "style"
            self.attrs["type"] = "text/css"

        return super().update(tag_container_list)


class LinkImgTagContainer(BinarySrcTagContainer):
    tag_name: Literal["link"] = "link"
    link_attr: Literal["href"] = "href"

    @classmethod
    def get_selector(cls) -> Callable[[Tag], bool]:
        def is_text_link(tag: Tag) -> bool:
            rel: Iterable[str]
            return (
                tag.name == "link"
                and (rel := tag.get("rel")) is not None
                and any("icon" in item for item in rel)
            )

        return is_text_link


class ImgTagContainer(BinarySrcTagContainer):
    tag_name: Literal["img"] = "img"
    link_attr: Literal["src"] = "src"


def inline(
    infile: Path,
    outfile: Path,
    *,
    ignored_link_dests: Iterable[str],
    ignored_link_dest_regexes: Iterable[re.Pattern[str]],
    minify_js: bool = False,
    minify_css: bool = False,
    minify_globals: bool = False,
    project_root: Optional[Union[Path, str]],
):
    if infile.resolve() == outfile.resolve():
        sys.exit("infile and outfile are the same; they must be different")

    if project_root is None:
        project_root = infile.parent

    project_root = Path(project_root)

    with infile.open() as in_fd:
        soup = BeautifulSoup(in_fd.read(), "lxml")

    js_tags: list[TextSrcTagContainer] = []
    css_tags: list[TextSrcTagContainer] = []

    tag_container_types: Iterable[
        tuple[Type[TagContainerABC], Optional[list[TextSrcTagContainer]]]
    ] = [
        (ScriptTagContainer, js_tags),
        (StyleTagContainer, css_tags),
        (ImgTagContainer, None),
        (LinkImgTagContainer, None),
    ]

    tag_containers: list[TagContainerABC] = []

    for tag_type, tag_list in tag_container_types:
        tags: Iterable[Tag] = soup.find_all(tag_type.get_selector())
        for tag in tags:
            tag_container = tag_type(tag, project_root=project_root)
            if (dest := tag_container.dest) is not None and (
                dest in ignored_link_dests
                or any(regex.search(dest) for regex in ignored_link_dest_regexes)
            ):
                continue

            if isinstance(tag_container, TextSrcTagContainer):
                assert tag_list is not None
                tag_container.update(tag_list)
            else:
                assert isinstance(tag_container, BinarySrcTagContainer)
                tag_container.update()

            tag_containers.append(tag_container)

    # for tag_name, link_attr, source_tags, file_mode in tag_names_and_link_attrs:
    #     tags = soup.find_all(tag_name)
    #     tag: Tag
    #     for tag in tags:
    #         if tag_name == "link" and any("icon" in r for r in tag["rel"]):
    #             print(tag["rel"])
    #             continue

    #         link_dest: str = tag.attrs.get(link_attr)

    #         if link_dest is not None and (
    #             link_dest in ignored_link_dests
    #             or any(regex.search(link_dest) for regex in ignored_link_dest_regexes)
    #         ):
    #             continue

    #         absolute_src: Optional[Path]
    #         contents: Union[str, bytes]
    #         if link_dest is None:
    #             absolute_src = None
    #             contents = str(tag.string)
    #         else:
    #             if link_dest.startswith("/"):
    #                 link_dest = "." + link_dest

    #             absolute_src = project_root / link_dest
    #             assert absolute_src is not None

    #             try:
    #                 with absolute_src.open(file_mode) as f:
    #                     try:
    #                         contents = f.read()
    #                     except Exception:
    #                         print(f"{tag_name=}")
    #                         print(f"{link_attr=}")
    #                         print(f"{file_mode=}")
    #                         print(f"{absolute_src=}")
    #                         print(f"{link_dest=}")

    #                         raise
    #             except Exception:
    #                 print(f"{absolute_src=}")
    #                 raise

    #         tag_container = TagContainer(
    #             contents, {k: v for k, v in tag.attrs.items() if k != link_attr}
    #         )

    #         if tag_name == "img":
    #             assert absolute_src is not None
    #             data = base64.b64encode(cast(bytes, contents)).decode("utf-8")
    #             tag[
    #                 "src"
    #             ] = f"data:image/{absolute_src.suffix.strip('.')};base64,{data}"
    #         else:
    #             assert source_tags is not None
    #             source_tags.append(tag_container)
    #             tag.decompose()

    # body: Tag = soup.find("body")

    # for js_tag in js_tags:
    #     if minify_js:
    #         response = requests.post(
    #             "https://javascript-minifier.com/raw",
    #             data={"input": js_tag.content},
    #         )
    #         js_code = response.text
    #     else:
    #         js_code = js_tag.content

    #     script_tag = soup.new_tag("script")
    #     script_tag["type"] = "text/javascript"

    #     for k, v in js_tag.attrs.items():
    #         script_tag[k] = v

    #     if minify_globals:
    #         symbols = [match[1] for match in SYMBOL_RE.findall(js_code) if match[1]]
    #         replacer = SymbolReplacer(symbols, lang=Lang.js)
    #         replacements_dict = dict(sorted(zip(SYMBOLS_TO_REPLACE, replacer)))

    #         # https://stackoverflow.com/a/6464500
    #         symbol_regex = (r"{even_num_quotes}|(\b{sym_re}\b)").format(
    #             sym_re="|".join(map(re.escape, replacements_dict.keys())),
    #             even_num_quotes=_PRECEDED_BY_EVEN_NUMBER_OF_QUOTES_RE,
    #         )

    #         js_code = re.sub(
    #             symbol_regex,
    #             lambda match: replacements_dict.get(match.group(0), match.group(0)),
    #             js_code,
    #         )

    #         sourcemap_dir = Path(outfile.parent / "source maps")
    #         sourcemap_dir.mkdir(exist_ok=True, parents=False)

    #         with (sourcemap_dir / outfile.name).with_suffix(".sourcemap.json").open(
    #             "w"
    #         ) as f:
    #             json.dump(replacements_dict, f, indent=2)

    #     script_tag.string = js_code
    #     body.append(script_tag)

    head: Tag = soup.find("head")

    for css_tag in css_tags:
        if minify_css:
            response = requests.post(
                "https://cssminifier.com/raw", data={"input": css_tag.content}
            )
            css_source = response.text
        else:
            css_source = css_tag.content

        style_tag = soup.new_tag("style")

        try:
            style_tag.string = css_source
        except:
            print(infile)
            print(css_source, css_tag)
            raise

        for k, v in css_tag.attrs.items():
            style_tag[k] = v

        head.append(style_tag)

    for tc in tag_containers:
        tc.finalize()

    if head.find("title") is None:
        title = soup.new_tag("title")
        title.string = infile.name
        head.insert(0, title)

    with outfile.open("w") as f:
        _ = f.write(
            "\n".join(
                line.strip() for line in re.sub("\n\n+", "\n", str(soup)).splitlines()
            )
        )


def main():
    parser = argparse.ArgumentParser()
    _ = parser.add_argument("infiles", nargs="*", help="The HTML file to inline")
    _ = parser.add_argument(
        "-o",
        required=False,
        dest="outfile",
        help="The filename to save the inlined file to",
    )
    _ = parser.add_argument("--outdir", required=False, help="The directory to save to")
    _ = parser.add_argument(
        "--exclude-html-regex",
        required=False,
        help="A regex describing HTML files to skip; ignored if infile is given",
    )
    _ = parser.add_argument(
        "--ignore",
        action="append",
        default=[],
        help="External resources to skip inlining",
    )
    _ = parser.add_argument(
        "--ignore-regex",
        action="append",
        default=[],
        help="A regex describing external resources to skip inlining",
    )

    _ = parser.add_argument(
        "--minify-js",
        action="store_true",
        help="Minify JavaScript (requires an internet connection)",
    )

    _ = parser.add_argument(
        "--minify-css",
        action="store_true",
        help="Minify CSS (requires an internet connection)",
    )

    _ = parser.add_argument(
        "--minify-globals",
        action="store_true",
        help="Minify global variables and properties in JS",
    )

    _ = parser.add_argument(
        "--project-root",
        help="The root of the project, where relative paths are based. Default: the infile's parent directory.",
    )

    args = parser.parse_args()

    if len(args.infiles) > 0:
        inpaths = [Path(p) for p in args.infiles]
    else:
        if args.outfile is not None:
            sys.exit("Cannot specify outfile without specifying an infile")

        inpaths = [Path(".")]
        # infiles = list(Path().glob("**/*.html"))
        # if args.exclude_html_regex is not None:
        #
        #     infiles = [p for p in infiles if not ehr.search(p.name)]

    if args.exclude_html_regex:
        ehr = re.compile(args.exclude_html_regex)
    else:
        ehr = None

    project_root = Path(pr).resolve() if (pr := args.project_root) is not None else None

    for inpath in inpaths:
        inpath = inpath.resolve()
        if inpath.is_dir():
            infiles = inpath.glob("**/*.html")
        else:
            infiles = [inpath]

        for infile in infiles:
            if ehr and ehr.search(infile.name) is not None:
                continue

            outdir: Path
            if args.outdir is None:
                outdir = Path(".").resolve()
                while outdir.name != "src" and outdir != Path("/"):
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
            ignored_link_dest_regexes = [
                re.compile(regex) for regex in args.ignore_regex
            ]

            # Add a regex for all things that look like URLs (maybe in the future I'll
            # support downloading the contents and including them)
            ignored_link_dest_regexes.append(
                # https://stackoverflow.com/a/7160778
                re.compile(
                    r"^(?:http|ftp)s?://"  # http:// or https://
                    + r"(?:(?:[A-Z0-9](?:[A-Z0-9-]{0,61}[A-Z0-9])?\.)+(?:[A-Z]{2,6}\.?|[A-Z0-9-]{2,}\.?)|"  # noqa:E501 domain...
                    + r"localhost|"  # localhost...
                    + r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})"  # ...or ip
                    + r"(?::\d+)?"  # optional port
                    + r"(?:/?|[/?]\S+)$",
                    re.IGNORECASE,
                )
            )

            inline(
                infile,
                outfile,
                ignored_link_dests=ignored_link_dests,
                ignored_link_dest_regexes=ignored_link_dest_regexes,
                minify_js=args.minify_js,
                minify_css=args.minify_css,
                minify_globals=args.minify_globals,
                project_root=project_root,
            )


# %%
if __name__ == "__main__":
    main()
