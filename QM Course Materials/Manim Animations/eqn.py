# %%
import manim as ma


class Tex1(ma.Scene):
    def construct(self):
        super().construct()

        psi = r"\Psi(x,t)"
        i_hbar = r"i\hbar\frac{\partial}{\partial t}"
        eq_sign = "="
        hamiltonian = r"\hat H"
        energy = r"-\frac{\hbar^2}{2m}\nabla^2+V(x,t)"
        lb = r"\left["
        rb = r"\right]"

        lines = ma.VGroup(
            ma.MathTex(
                i_hbar,
                psi,
                eq_sign,
                hamiltonian,
                psi,
                substrings_to_isolate=[i_hbar, psi, eq_sign, psi],
            ),
            ma.MathTex(
                i_hbar,
                psi,
                eq_sign,
                lb,
                energy,
                rb,
                psi,
                substrings_to_isolate=[i_hbar, psi, eq_sign, psi],
            ),
        )

        _ = lines.arrange(ma.DOWN, buff=ma.LARGE_BUFF)
        for line in lines:
            line.set_color_by_tex_to_color_map(
                {hamiltonian: ma.BLUE, energy: ma.BLUE, r"\Psi(x,t)": ma.GREEN}
            )

        play_kw = {"run_time": 2}
        _ = self.add(lines[0])

        self.play(
            ma.TransformMatchingTex(
                lines[0].copy(),
                lines[1],
                key_map={hamiltonian: lb + energy + rb},
                path_arc=90 * ma.DEGREES,
            ),
            **play_kw
        )
        self.wait()


class Tex2(ma.Scene):
    def construct(self):
        super().construct()

        tex_template = ma.TexTemplate()
        tex_template.add_to_preamble(r"\usepackage{cancel}")

        isolate = ["(", ")", "-", "+"]

        lines = ma.VGroup(
            ma.MathTex(
                "(",
                "x\\vphantom{x1}",
                "-",
                "y\\vphantom{y1}",
                ")",
                "(",
                "x\\vphantom{x2}",
                "+",
                "y\\vphantom{y2}",
                ")",
                # substrings_to_isolate=isolate,
            ),
            ma.MathTex(
                "(",
                "x\\cdot x",
                "+",
                "x\\vphantom{x1}",
                "\\cdot",
                "y\\vphantom{y2}",
                ")",
                "-",
                "(",
                "y\\vphantom{y1}",
                "\\cdot",
                "x\\vphantom{x2}",
                "+",
                "y\\cdot y",
                ")",
                substrings_to_isolate=["x\\cdot", "\\cdot y"],
            ),
            ma.MathTex(
                "x^2",
                "+",
                "x\\vphantom{x1}",
                "y\\vphantom{y2}",
                "-",
                "y\\vphantom{y1}",
                "x\\vphantom{x2}",
                "-",
                "y^2",
                # substrings_to_isolate=[
                #     *isolate,
                #     "x\\vphantom{x1}",
                #     "x\\vphantom{x2}",
                #     "y\\vphantom{y1}",
                #     "y\\vphantom{y2}",
                # ],
                tex_template=tex_template,
            ),
            ma.MathTex(
                "x^2",
                "+",
                "\\cancel{xy}",
                "-",
                "\\cancel{yx}",
                "-",
                "y^2",
                # substrings_to_isolate=isolate,
                tex_template=tex_template,
            ),
            ma.MathTex(
                "x^2",
                "-",
                "y^2",
                # substrings_to_isolate=isolate,
            ),
        )
        # _ = lines.arrange(ma.DOWN, buff=ma.LARGE_BUFF)

        play_kw = {"run_time": 2}

        self.play(
            ma.TransformMatchingTex(
                lines[0],
                lines[1],
                path_arc=-90 * ma.DEGREES,
            ),
            **play_kw
        )
        self.wait()

        self.play(
            ma.TransformMatchingTex(
                lines[1],
                lines[2],
                path_arc=0 * ma.DEGREES,
                key_map={
                    "x\\cdot": "x^2",
                    "\\cdot y": "y^2",
                },
            ),
            **play_kw
        )
        self.wait()

        self.play(
            ma.TransformMatchingTex(
                lines[2],
                lines[3],
                path_arc=0 * ma.DEGREES,
                key_map={
                    "xy": "\\cancel{xy}",
                    "yx": "\\cancel{yx}",
                },
            ),
            **play_kw
        )
        self.wait()

        self.play(
            ma.TransformMatchingTex(
                lines[3],
                lines[4],
                path_arc=0 * ma.DEGREES,
            ),
            **play_kw
        )
        self.wait()


if __name__ == "__main__":
    for class_ in [Tex1, Tex2]:
        with ma.tempconfig(
            {
                "quality": "fourk_quality",
                "input_file": "eqn",
                "preview": True,
            }
        ):
            _ = class_().render()
