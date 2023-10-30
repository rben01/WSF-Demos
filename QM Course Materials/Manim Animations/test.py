# %%


import manim as ma
import numpy as np
import numpy.typing as npt
from manim import (
    LEFT,
    UL,
    WHITE,
    Axes,
    Create,
    FadeOut,
    FadeTransform,
    FadeTransformPieces,
    Line,
    MathTex,
    Point,
    ReplacementTransform,
    ScaleInPlace,
    Scene,
    SingleStringMathTex,
    Tex,
    TexTemplate,
    Transform,
    TransformMatchingShapes,
    TransformMatchingTex,
    Union,
    VGroup,
    Write,
    color_to_rgba,
    tempconfig,
)


class Test(Scene):
    def construct(self):
        super().construct()

        # template = ma.TexTemplate()
        # template.add_to_preamble(r"\usepackage{xcolor}")
        # template.add_to_preamble(r"\newcommand{\ub}{92}")

        tex1 = MathTex(r"\sum", "_{k=1}", r"^{2\vphantom{0}}")
        tex2 = MathTex(r"\sum", "^{34}", "_{k=1}")

        # tex1 = MathTex("2")
        # tex2 = MathTex("3", "4")

        # _ = tex1.set_color_by_tex(r"\textcolor{green}{\ub}", ma.GREEN)

        self.play(Write(tex1, run_time=0.75))
        self.play(
            TransformMatchingTex(
                tex1,
                tex2,
                run_time=4,
                key_map={
                    r"\sum": r"\sum",
                    "_{k=1}": "_{k=1}",
                    r"^{2\vphantom{0}}": "^{34}",
                },
            )
        )


if __name__ == "__main__":
    with tempconfig(
        {
            "quality": "medium_quality",
            "input_file": "test",
            "preview": True,
        }
    ):
        _ = Test().render()

# %%
