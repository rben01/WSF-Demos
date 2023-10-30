using Javis
using LaTeXStrings


function ground(args...)
    background("white") # canvas background
    sethue("black") # pen color
end

summation(ub) =
    L"""\begin{equation}f(x)=\sum_{k=1}^{%$(ub)} \hat f_k(x)\end{equation}"""

function draw_latex(video, action, frame)
    fontsize(50)
    latex(
        summation("\\infty"),
        O,
        valign=:middle,
        halign=:center
    )
    textoutlines("abc", action=:stroke)
    # println(pathtopoly())
end

myvideo = Video(500, 500)
Background(1:70, ground)



Object(draw_latex)


render(myvideo, ; pathname="abc.mp4")
