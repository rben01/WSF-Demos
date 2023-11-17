# %%

from dataclasses import dataclass
import subprocess
import sys
from pathlib import Path
from typing import Callable, Self

import manim as ma
import numpy as np
from manim import (
    BLUE,
    DOWN,
    LEFT,
    MED_SMALL_BUFF,
    SMALL_BUFF,
    ORIGIN,
    RIGHT,
    MobjectTable,
    TEAL,
    Table,
    FadeOut,
    Title,
    UP,
    PURPLE_A,
    BLACK,
    YELLOW,
    Animation,
    AnimationGroup,
    Create,
    FadeIn,
    LaggedStart,
    Line,
    MathTex,
    Mobject,
    NumberPlane,
    ParametricFunction,
    Rectangle,
    Tex,
    TexTemplate,
    ValueTracker,
    VGroup,
    rate_functions,
)
from numpy import cos, pi, sin

TITLE_BOTTOM_Y = 2.8

V_PADDING = 0.5
H_PADDING = 1

STRETCH_0 = 0.15
REVS = 8


def make_tex_template() -> TexTemplate:
    template = TexTemplate()
    pkgs: list[str | tuple[str, str]] = [
        "mathtools",
        "xfrac",
        ("shortlabels", "enumitem"),
    ]
    for pkg in pkgs:
        if isinstance(pkg, str):
            line = f"\\usepackage{{{pkg}}}"
        else:
            (options, pkg) = pkg
            line = f"\\usepackage[{options}]{{{pkg}}}"

        template.add_to_preamble(line)

    return template


TEX_TEMPLATE = make_tex_template()

TITLE_FONT_SIZE = 70
INDICATOR_COLOR = "#FF3E96"


def QmTitle(*text_parts: str) -> Title:
    return Title(
        *text_parts,
        include_underline=True,
        match_underline_width_to_text=True,
        underline_buff=SMALL_BUFF,
        font_size=TITLE_FONT_SIZE,
    )


def QmWrite(
    m: Mobject,
    run_time: float | None = None,
    *,
    lag_ratio: float = 0.9,
    rate_func: Callable[[float], float] | None = None,
) -> ma.Write:
    if rate_func is None:
        rate_func = rate_functions.linear

    return ma.Write(m, run_time=run_time, lag_ratio=lag_ratio)


def anim_pause(time: float) -> Animation:
    return Animation(Mobject(), run_time=time)


def delayed_animation(time: float, anim: Animation) -> AnimationGroup:
    return AnimationGroup(anim_pause(time), anim, lag_ratio=1)


# https://mathematica.stackexchange.com/a/37622
def get_spring(t: float, *, stretch: float, revs: float = REVS) -> tuple[float, float]:
    """
    A spring-like spiral centered at `y=0` and with height 1
    """
    angle = 2 * pi * t * (revs - 0.5) + pi / 2
    x = stretch * (1 + revs * t - sin(angle))
    y = -cos(angle)

    return (x, y)


def spring_parametric(
    x0: float, y0: float, *, y_scale: float, stretch: float
) -> ParametricFunction:
    def f(t: float) -> list[float]:
        (x, y) = get_spring(t, stretch=stretch)
        return [x0 + x, y0 + y * y_scale, 0]

    return ParametricFunction(f)


def get_stretch(t: float, *, stretch_0: float = STRETCH_0) -> float:
    return stretch_0 + 0.07 * sin(2 * pi * t)


def spring_x_max(x0: float, t: float, *, stretch_0: float = STRETCH_0) -> float:
    return x0 + get_stretch(t, stretch_0=stretch_0) * (REVS + 2)


def spring_rate_func(t: float) -> float:
    """
    linear for t in [0,0.9], then quadratic ease out for the remainder
    """
    x0 = 0.9
    y0 = 0.95

    if t < x0:
        m = y0 / x0
        y = y0 + m * (t - x0)
    else:
        xp = 1 - (1 - (t - x0) / (1 - x0)) ** 3
        y = y0 + (1 - y0) * xp

    return y


class QmScene(ma.Scene):
    def debug_mode(self) -> bool:
        return getattr(self, "debug", False)


class Qm1(QmScene):
    def construct(self):
        super().construct()

        if self.debug_mode():
            _ = self.add(NumberPlane())

        title = Tex("Harmonic Oscillator", font_size=TITLE_FONT_SIZE).to_edge(UP)
        self.play(QmWrite(title, 6, lag_ratio=0.5))

        underline = Line(*([sign * 3.3, TITLE_BOTTOM_Y, 0] for sign in (-1, 1)))
        self.play(Create(underline, run_time=0.8))

        self.wait()

        self.pause(11)

        self.play(
            QmWrite(
                MathTex("F=-kx").to_edge(LEFT, H_PADDING).set_y(1, DOWN),
                4,
                lag_ratio=1.5,
            )
        )

        self.pause(8)

        spring_border = (
            Rectangle(height=2, width=4)
            .next_to(underline, DOWN, V_PADDING)
            .set_x(-1)
            .flip(DOWN)
        )

        spring = spring_parametric(
            spring_border.get_x(LEFT),
            spring_border.get_y(),
            y_scale=0.25,
            stretch=STRETCH_0,
        )

        mass_box_1 = (
            Rectangle(
                width=0.75,
                height=0.75,
                color=YELLOW,
            )
            .set_x(spring_x_max(spring_border.get_x(LEFT), 0), LEFT)
            .set_y(spring_border.get_y())
        )

        mass_box_2 = mass_box_1.copy().set_fill(YELLOW, opacity=1)

        self.play(Create(spring_border, run_time=2))
        self.wait()
        self.pause(0.5)
        self.play(
            LaggedStart(
                Create(spring, run_time=3),
                LaggedStart(
                    Create(mass_box_1),
                    FadeIn(mass_box_2, rate_fun=rate_functions.ease_in_cubic),
                    run_time=3,
                    lag_ratio=0.5,
                ),
                lag_ratio=0.5,
            )
        )

        _ = mass_box_1.set_fill(YELLOW, opacity=1)
        _ = self.remove(mass_box_2)

        spring_bouncer = ValueTracker(0)

        # :'(
        _ = spring.add_updater(
            lambda m: (
                m.become(
                    spring_parametric(
                        spring_border.get_x(LEFT),
                        spring_border.get_y(),
                        y_scale=0.25,
                        stretch=get_stretch(spring_bouncer.get_value()),
                    )
                ),
            )
        )
        _ = mass_box_1.add_updater(
            lambda m: m.set_x(
                spring_x_max(spring_border.get_x(LEFT), spring_bouncer.get_value()),
                LEFT,
            )
        )

        f_tex = (
            MathTex(
                r"F&=-\tfrac{\partial V}{\partial x}\\\Rightarrow V(x)&=\tfrac{1}{2}kx^2",
                tex_template=TEX_TEMPLATE,
            )
            .next_to(underline, DOWN)
            .to_edge(RIGHT, H_PADDING)
        )

        self.play(
            spring_bouncer.animate(
                run_time=5,
                rate_func=spring_rate_func,
            ).set_value(5)
        )

        self.wait()
        self.pause(3)

        self.play(QmWrite(f_tex, 15, lag_ratio=0.7))

        self.wait()
        self.pause(2)

        self.play(
            QmWrite(MathTex("F=ma").to_edge(LEFT, H_PADDING).set_y(0, DOWN), 3),
        )

        self.wait()

        self.play(
            QmWrite(
                MathTex(r"m\frac{d^2x}{dt^2}=-kx")
                .to_edge(RIGHT, H_PADDING)
                .set_y(0.6, UP),
                10,
                lag_ratio=1.75,
            ),
        )

        self.wait()
        self.pause(2)

        soln_tex = MathTex(
            r"\mathrm{Classical\ Soln's:}",
            r"&\quad x(t)=A\sin\omega t+B\cos\omega t,",
            r"\omega=\sqrt{k/m}",
            r"\\\mathrm{Importance:}",
            r"&\quad V(x)",
            r"=V(x_0)",
            r"+0",
            r"+\tfrac{1}{2}k(x-x_0)^2+\cdots",
            r"\\&k=\left.\tfrac{\partial^2V}{\partial x^2}\right|_{x_0}",
            font_size=40,
        ).to_edge(DOWN)

        # a list of durations t. t > 0 means we will write the ith element of soln_tex
        # over duration t; t < 0 means we will pause for a duration of -t
        durations = [6, 8, -7, 8, -2, 6, -15, 5, -4, 5, 4, -4, 8, 10]
        part_idx = 0
        animations = []
        for d in durations:
            if d > 0:
                anim = QmWrite(soln_tex[part_idx], run_time=d, lag_ratio=0.8)
                part_idx += 1
            elif d < 0:
                anim = anim_pause(-d)
            else:
                raise ValueError("cannot have duration of 0")

            animations.append(anim)

        self.play(LaggedStart(*animations, lag_ratio=1))

        self.wait()

        self.pause(16)
        self.wait()

        # underline the 1/2 k(x-x_0)^2
        self.play(
            LaggedStart(
                *(
                    QmWrite(Line([2, y, 0], [4.1, y, 0], color=INDICATOR_COLOR))
                    for y in (-2.6, -2.7)
                ),
                lag_ratio=0.5,
            ),
            run_time=2,
        )

        self.wait()

        self.play(anim_pause(17))
        self.wait()

        self.play(
            LaggedStart(
                *(
                    QmWrite(Line([5, y, 0], [6.1, y, 0], color=INDICATOR_COLOR))
                    for y in (1.02, 0.92)
                ),
                lag_ratio=0.5,
            ),
            run_time=2,
        )

        self.wait()

        self.pause(15)


class Qm2(QmScene):
    def construct(self):
        super().construct()

        if self.debug_mode():
            _ = self.add(NumberPlane())

        title = QmTitle("Quantum Mechanically")
        self.play(QmWrite(title, 6, lag_ratio=0.5))

        self.wait()
        self.pause(17)

        schrodinger = MathTex(
            r"-\frac{\hbar^2}{2m}\frac{d^2\Psi}{dt^2}+\tfrac{1}{2}m\omega^2x^2\Psi=E\Psi"
        ).next_to(title, DOWN, V_PADDING)
        self.play(QmWrite(schrodinger, 16, lag_ratio=0.8))

        schrodinger_box = Rectangle(width=8, height=1.7, color=INDICATOR_COLOR).next_to(
            title, DOWN, V_PADDING - 0.3
        )
        self.play(Create(schrodinger_box))

        self.wait()

        self.pause(16)

        solve_tex = (
            Tex("Solve:").next_to(schrodinger_box, DOWN, V_PADDING).set_x(-2, RIGHT)
        )
        brute_force = (
            Tex("i", r"i. Brute force Diff.\ Eqn.", tex_template=TEX_TEMPLATE)
            .next_to(schrodinger_box, DOWN, V_PADDING)
            .set_x(-1.5, LEFT)
        )
        _ = brute_force[0].set_opacity(0)
        algebraic = Tex("ii. Algebraic").next_to(brute_force, DOWN).set_x(-1.5, LEFT)

        solve_group = VGroup(solve_tex, brute_force, algebraic)
        _ = solve_group.next_to(schrodinger_box, DOWN, buff=V_PADDING).set_x(0, ORIGIN)

        animations = [
            QmWrite(solve_tex, 2),
            anim_pause(4),
            QmWrite(brute_force, 5),
            anim_pause(6),
            QmWrite(algebraic, 4),
        ]
        for anim in animations:
            self.play(anim)
            self.wait()

        self.pause(3)

        self.play(FadeOut(*self.mobjects), run_time=1)
        self.wait()
        if self.debug_mode():
            _ = self.add(NumberPlane())

        title = QmTitle("Clever Approach (Dirac)")
        self.play(QmWrite(title, 4))
        self.wait()

        self.pause(16)

        with_ = Tex("With:")
        note = Tex("Note:")
        consider = Tex("Consider:")
        then = Tex("Then:")

        with_tex = MathTex(
            r"p=-i\hbar \tfrac{d}{dx},",
            r"SE\to \tfrac{1}{2m}[p^2",
            r"+(m\omega x)^2]\Psi=E\Psi",
        )
        note_tex = MathTex(r"a^2+b^2=", r"(a+ib)(a-ib)")
        consider_tex = MathTex(
            r"a_{\pm}\equiv",
            r"\frac{1}{\sqrt{2\hbar m\omega}}(\mp",
            r" ip+m\omega x)",
        )
        then_tex = MathTex(
            r"a_-a_+",
            r"&=\frac{1}{2\hbar m\omega}(",
            r"ip+m\omega x)(",
            r"-ip+m\omega x)\\",
            r"&=\frac{1}{2\hbar m\omega}\left[",
            r"p^2",
            r"+(m\omega x)^2",
            r"-im\omega",
            r"(",
            r"xp-px)\right]",
        )

        table = MobjectTable(
            [
                [with_, with_tex],
                [note, note_tex],
                [consider, consider_tex],
                [then, then_tex],
            ],
            h_buff=1,
            v_buff=0.3,
            arrange_in_grid_config={"col_alignments": ["l", "l"]},
        )
        _ = table.next_to(title, DOWN, buff=V_PADDING).set_x(0, ORIGIN)

        animations = [
            QmWrite(with_, 4),
            QmWrite(with_tex[0], 6),
            QmWrite(with_tex[1], 7),
            anim_pause(2),
            QmWrite(with_tex[2], 9),
            anim_pause(9),
            QmWrite(note, 2),
            anim_pause(1),
            QmWrite(note_tex[0], 3),
            QmWrite(note_tex[1], 5.5),
            anim_pause(13),
            QmWrite(consider, 3),
            anim_pause(4),
            QmWrite(consider_tex[0], 2),
            QmWrite(consider_tex[1], 8),
            anim_pause(3),
            QmWrite(consider_tex[2], 5),
            anim_pause(6),
            QmWrite(then, 1.5),
            QmWrite(then_tex[0], 2),
            anim_pause(0.5),
            QmWrite(then_tex[1], 4.5),
            anim_pause(8),
            QmWrite(then_tex[2], 4),
            QmWrite(then_tex[3], 4),
            anim_pause(1.5),
            QmWrite(then_tex[4], 4),
            anim_pause(2),
            QmWrite(then_tex[5], 1),
            anim_pause(0.25),
            QmWrite(then_tex[6], 2.75),
            QmWrite(then_tex[7], 2),
            anim_pause(9),
            QmWrite(then_tex[8], 0.25),
            QmWrite(then_tex[9], 3),
            anim_pause(13),
        ]

        for anim in animations:
            self.play(anim)
            self.wait()

        self.pause(30)


@dataclass
class Duration:
    duration: float

    def __str__(self):
        return str(self.duration)


class PadVideoStart(Duration):
    pass


class TrimAudioStart(Duration):
    pass


class DelayAudio(Duration):
    pass


class NoChange:
    pass


if __name__ == "__main__":
    BASE_PATH = Path()
    (QUALITY, DEBUG) = ("k", False)

    qualities: dict[str, tuple[str, str]] = {
        "l": ("low_quality", "480p15"),
        "m": ("medium_quality", "720p30"),
        "h": ("high_quality", "1080p60"),
        "k": ("fourk_quality", "2160p60"),
    }

    scenes: list[tuple[ma.Scene, Duration]] = [
        # (Qm1, PadVideoStart(5)),
        (Qm2, TrimAudioStart(220)),
    ]

    for class_, audio_delay in scenes:
        (manim_quality, resolution) = qualities[QUALITY]
        with ma.tempconfig(
            {
                "quality": manim_quality,
                "input_file": BASE_PATH / "qm",
                "preview": False,
            }
        ):
            scene = class_()
            scene.debug = DEBUG
            _ = scene.render()

        vid_dir = BASE_PATH / f"media/videos/qm/{resolution}"
        vid_file = vid_dir / f"{class_.__name__}.mp4"
        audio_file = BASE_PATH / "Harmonic Oscillator Audio.m4a"

        output_file = vid_dir / f"{class_.__name__}.audio.mp4"

        args = [
            "ffmpeg",
            "-y",
            *("-i", str(vid_file)),
            *("-i", str(audio_file)),
            *("-map", "0:v:0"),
            *("-map", "1:a:0"),
            "-shortest",
            str(output_file),
        ]

        if isinstance(audio_delay, PadVideoStart):
            args[6:6] = (
                "-vf",
                f"tpad=start_duration={audio_delay}:start_mode=add:color=black",
            )
        elif isinstance(audio_delay, DelayAudio):
            args[5:5] = ("-c:v", "copy", "-c:a", "copy")
            args[3:3] = ("-itsoffset", str(audio_delay))
        elif isinstance(audio_delay, TrimAudioStart):
            args[4:4] = ("-ss", str(audio_delay))
        elif isinstance(audio_delay, NoChange):
            pass
        else:
            raise ValueError(f"invalid audio_delay {audio_delay}")

        print(args)

        proc = subprocess.Popen(
            args,
            # encoding='utf-8'
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
        )

        assert proc.stdout is not None
        for line in iter(proc.stdout.readline, b""):
            _ = sys.stdout.write(line)

        _ = subprocess.check_call(["open", str(output_file)])


# %%
