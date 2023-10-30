# pyright: reportUnusedImport=false
# %%

import math
from typing import Any, Callable

import manim as ma
import numpy as np
import numpy.typing as npt
from manim import (
    DL,
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
    rate_functions,
    tempconfig,
)

AMPLITUDE = 1
OFFSET = 0
PERIOD = 2

SUM_IDX = 3


def n_digits_b10(n: int) -> int:
    return math.ceil(math.log10(n + 0.5))


# def identifable_tex(s: str) -> str:
#     return "{ {" + s + "} }"


# def get_upper_bd(
#     ub: str | int, n_phantom_chars: int | None = None
# ) -> tuple[str, str, str]:
#     # a symbol we can insert as many times as needed to get the different TeX
#     # strings to line up index-by-index, e.g. to get a 10 to match an \infty,
#     # instead of the 1 matching the \infty and the 0 matching the subsequent symbol
#     phantom_char = "."
#     spacer = r"\vphantom{1234567890}"

#     if n_phantom_chars is None:
#         n_phantom_chars = 0

#     # Place ub roughly centered between n/2ish chars on left and n/2ish chars on right
#     (a, b) = (round_fn(n_phantom_chars / 2) for round_fn in (math.floor, math.ceil))

#     return (
#         " " + a * (phantom_char + 2 * r"\!") + spacer,
#         identifable_tex(str(ub)),
#         " " + b * (2 * r"\!" + phantom_char) + spacer,
#     )


def fourier_series(eq: str, n: str | int):
    return MathTex(
        r"f(x)",  # 0
        eq,  # 1
        r"\frac{4}{\pi}",
        " ".join((r"\sum^{ ", str(n), r" }")),  # 3 == SUM_IDX
        r"_{k=1}\hat{f}_k(x)",
    )


def fourier_approx_fn(n: int) -> Callable[[float], float]:
    def f(x: npt.NDArray[np.float64]) -> npt.NDArray[np.float64]:
        ans = np.zeros_like(x)
        for i in range(n):
            omega = 2 * i + 1
            ans += (
                4
                / np.pi
                * AMPLITUDE
                * np.sin(2 * np.pi * omega * (x - OFFSET) / PERIOD)
                / omega
            )
        return ans

    return f


class SquareWave(Scene):
    def get_summation_transforms(
        self,
        prev_upper_bd: int | None,
        next_upper_bd: int | None,
        prev_summation: MathTex,
        next_summation: MathTex,
        transform_kwargs: dict[str, Any],
    ) -> list[Transform]:
        (prev_n_digits, next_n_digits) = (
            1 if ub is None else n_digits_b10(ub)
            for ub in (prev_upper_bd, next_upper_bd)
        )

        transform_kwargs = transform_kwargs.copy()
        transform_kwargs.setdefault("rate_func", rate_functions.ease_out_quart)

        return [
            *(
                ReplacementTransform(
                    prev_summation[k], next_summation[k], **transform_kwargs
                )
                for k in range(len(prev_summation))
                if k != SUM_IDX
            ),
            ReplacementTransform(
                prev_summation[SUM_IDX][:prev_n_digits],
                next_summation[SUM_IDX][:next_n_digits],
                **transform_kwargs,
            ),
            ReplacementTransform(
                prev_summation[SUM_IDX][prev_n_digits:],
                next_summation[SUM_IDX][next_n_digits:],
                **transform_kwargs,
            ),
        ]

    def construct(self):
        super().construct()

        title = Tex("Fourier Transform of a Square Wave", font_size=70)
        self.play(Write(title, lag_ratio=0.05, run_time=2))

        self.play(title.animate.set_x(-3).set_y(3).set_font_size(40))

        axis_x_bds = (-2, 6)
        axis_y_bds = (-2, 3)
        axis_y_length = 4
        axis_x_length = (
            axis_y_length
            * (axis_x_bds[1] - axis_x_bds[0])
            / (axis_y_bds[1] - axis_y_bds[0])
        )
        axes = Axes(
            axis_x_bds, axis_y_bds, x_length=axis_x_length, y_length=axis_y_length
        )
        _ = axes.add_coordinates()

        xs = []
        ys = []

        for x in range(*axis_x_bds):
            y = math.copysign(
                AMPLITUDE, math.sin(2 * math.pi * (x + 0.01 - OFFSET) / PERIOD)
            )

            for x_ in (x, x + 1):
                xs.append(x_)
                ys.append(y)

        sw = axes.plot_line_graph(
            xs,
            ys,
            line_color=WHITE,
            stroke_width=7,
            add_vertex_dots=False,
        )
        # self.play(Write(sw))
        # self.wait()

        graph = VGroup(axes, sw)

        self.play(Write(graph, lag_ratio=0.02, run_time=1.5))
        self.play(
            graph.animate.set_x(3).scale(0.8),
        )

        EQN_LEFT = -6.5
        EQN_WRITE_KWARGS = {"lag_ratio": 0.2, "run_time": 1}

        tex_template = TexTemplate()
        tex_template.add_to_preamble(r"\DeclareMathOperator{\sgn}{sgn}")

        eqn = MathTex(
            r"f(x)=\sgn\left(\sin \pi x\right)",
            tex_template=tex_template,
            font_size=70,
        ).move_to((EQN_LEFT, 0, 0), LEFT)
        self.play(Write(eqn, **EQN_WRITE_KWARGS))
        self.play(eqn.animate.set(font_size=50).move_to((EQN_LEFT, 2, 0), LEFT))

        fourier = MathTex(
            r"\hat f_n(x)=\frac{\sin(\pi(2n+1)\,x)}{2n+1}",
            tex_template=tex_template,
            font_size=50,
        ).move_to((EQN_LEFT, 0, 0), LEFT)
        self.play(Write(fourier, **EQN_WRITE_KWARGS))
        self.play(fourier.animate.set(font_size=45).move_to((EQN_LEFT, 0.5, 0), LEFT))

        FOURIER_FONT_SIZE = 50
        SUMMATION_Y = -2.1
        X_RANGE = (*axis_x_bds, 0.0005)  # start, stop, step
        N_MAX = 75

        approx_graph = None

        summation = (
            fourier_series("=", r"\infty")
            .set(font_size=FOURIER_FONT_SIZE)
            .move_to((EQN_LEFT, SUMMATION_Y, 0), DL)
        )
        self.play(Write(summation, **EQN_WRITE_KWARGS))
        self.play(sw.animate.set_stroke(opacity=0.5))

        print(summation.split())

        for i in range(1, N_MAX + 1):
            run_time = {
                "run_time": 0.5 ** (N_MAX * rate_functions.ease_in_quad(i / N_MAX))
            }

            next_summation = (
                fourier_series(r"\approx", i)
                .set(font_size=FOURIER_FONT_SIZE)
                .move_to((EQN_LEFT, SUMMATION_Y, 0), DL)
            )

            next_approx_graph = axes.plot(
                fourier_approx_fn(i), x_range=X_RANGE, use_vectorized=True
            )

            if i == 1:
                self.play(
                    Write(next_approx_graph, **run_time),
                    *self.get_summation_transforms(
                        None, i, summation, next_summation, run_time
                    ),
                )
            else:
                self.play(
                    ReplacementTransform(approx_graph, next_approx_graph, **run_time),
                    *self.get_summation_transforms(
                        i - 1, i, summation, next_summation, run_time
                    ),
                )

            summation = next_summation
            approx_graph = next_approx_graph

            # fade out upper bound as x := i / N_MAX goes from 0 to 1 \
            # we start fading out at x1 in [0, 1], and hit opacity == 0 at x2 in [0, 1]
            # the slope of this line is 1/(x1 - x2), and the equation is thus opacity =
            # 1/(x1 - x2) * (x - x2)
            x1 = 0.4
            x2 = 0.8
            opacity = max(0, min((i / N_MAX - x2) / (x1 - x2), 1))
            next_summation[SUM_IDX][: n_digits_b10(i)].set_opacity(
                rate_functions.ease_out_quart(opacity)
            )

        print(summation.split())

        final_summation = (
            fourier_series("=", r"\infty")
            .set(font_size=FOURIER_FONT_SIZE)
            .move_to((EQN_LEFT, SUMMATION_Y, 0), DL)
        )
        print(final_summation.split())

        FINAL_RUNTIME = {"run_time": 1.5}
        self.play(
            # ReplacementTransform(summation[1], final_summation[1], **FINAL_RUNTIME),
            # ReplacementTransform(summation[3], final_summation[3], **FINAL_RUNTIME),
            *self.get_summation_transforms(
                N_MAX, None, summation, final_summation, FINAL_RUNTIME
            ),
            FadeOut(approx_graph, **FINAL_RUNTIME),
            sw.animate(**FINAL_RUNTIME).set_stroke(opacity=1),
        )

        self.wait()


if __name__ == "__main__":
    with tempconfig(
        {
            "quality": "fourk_quality",
            "input_file": "square_wave",
            "preview": True,
        }
    ):
        _ = SquareWave().render()
