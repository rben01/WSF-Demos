(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 8.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc.                                               *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[       835,         17]
NotebookDataLength[    996552,      16504]
NotebookOptionsPosition[    996842,      16495]
NotebookOutlinePosition[    997315,      16516]
CellTagsIndexPosition[    997272,      16513]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`dist$$ = 
      1, $CellContext`NumMeasurements$$ = 100, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`dist$$], 1, "Wavefunction"}, {
        1 -> Style["Gaussian", FontSize -> 15], 2 -> 
         Style["Triangle", FontSize -> 15], 3 -> 
         Style["Uniform", FontSize -> 15], 4 -> 
         Style["Square", FontSize -> 15], 5 -> 
         Style["Smaller Square", FontSize -> 15]}}, {{
         Hold[$CellContext`NumMeasurements$$], 100, "Number of Measurements"},
         100, 400, 60}, {
        Hold[
         Button[
         "Run Experiment", $CellContext`t = 0; $CellContext`expRunning = 1, 
          ImageSize -> 130, Enabled -> Dynamic[
            If[$CellContext`expRunning == 0, True, False]]]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      1292., {319., 323.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`dist$440936$$ = 
      False, $CellContext`NumMeasurements$440937$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`dist$$ = 
          1, $CellContext`NumMeasurements$$ = 100}, 
        "ControllerVariables" :> {
          Hold[$CellContext`dist$$, $CellContext`dist$440936$$, False], 
          
          Hold[$CellContext`NumMeasurements$$, \
$CellContext`NumMeasurements$440937$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> (If[
           
           And[$CellContext`expRunning == 
            1, $CellContext`t < $CellContext`NumMeasurements$$], \
$CellContext`t = $CellContext`t + 2, 
           If[$CellContext`expRunning == 1, $CellContext`expRunning = 0]]; 
         If[
           
           Or[$CellContext`lastDist != $CellContext`dist$$, \
$CellContext`lastNum != $CellContext`NumMeasurements$$], $CellContext`t = 
            0; $CellContext`lastDist = $CellContext`dist$$; \
$CellContext`lastNum = $CellContext`NumMeasurements$$]; If[
           
           And[$CellContext`t != $CellContext`NumMeasurements$$, \
$CellContext`t != 0], 
           (GraphicsGrid[{{
              GraphicsColumn[{
                Part[$CellContext`\[Psi]Plots, $CellContext`dist$$], 
                Part[$CellContext`ProbPlots, $CellContext`dist$$]}], 
              Show[{
                Part[$CellContext`ProbPlots, $CellContext`dist$$], 
                Histogram3D[
                 Sort[
                  Take[
                   
                   Part[$CellContext`Measurements, $CellContext`dist$$], \
$CellContext`t]], {$CellContext`width}, 
                 
                 Function[{$CellContext`bin1$, $CellContext`bin2$, \
$CellContext`counts$}, $CellContext`counts$/($CellContext`NumMeasurements$$ \
$CellContext`width^2)]], 
                Graphics3D[
                 Text[
                  Style[
                   StringJoin["Measurement ", 
                    ToString[$CellContext`t]], FontSize -> 
                   15], {-$CellContext`xmax, (-$CellContext`ymax)/2, (-5) 
                   Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}]]}, 
               PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, \
{$CellContext`ymin, $CellContext`ymax}, {(-0.5) 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2, 1.3 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}}, 
               ImageSize -> {600, 600}]}}, #]& )[
            Apply[Sequence, $CellContext`$GridOptions]], 
           (GraphicsGrid[{{
              GraphicsColumn[{
                Part[$CellContext`\[Psi]Plots, $CellContext`dist$$], 
                Part[$CellContext`ProbPlots, $CellContext`dist$$]}], 
              Show[{
                Part[$CellContext`ProbPlots, $CellContext`dist$$], 
                Histogram3D[
                 Sort[
                  Take[
                   
                   Part[$CellContext`Measurements, $CellContext`dist$$], \
$CellContext`t]], {$CellContext`width}, 
                 
                 Function[{$CellContext`bin1$, $CellContext`bin2$, \
$CellContext`counts$}, $CellContext`counts$/($CellContext`NumMeasurements$$ \
$CellContext`width^2)]], 
                Graphics3D[
                 Text[
                  Style[
                   StringJoin["Measurement ", 
                    ToString[$CellContext`t]], FontSize -> 
                   15], {-$CellContext`xmax, (-$CellContext`ymax)/2, (-5) 
                   Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}]]}, 
               PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, \
{$CellContext`ymin, $CellContext`ymax}, {(-0.5) 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2, 1.3 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}}, 
               ImageSize -> {600, 600}]}}, #]& )[
            Apply[Sequence, $CellContext`$GridOptions]]]), 
        "Specifications" :> {{{$CellContext`dist$$, 1, "Wavefunction"}, {
           1 -> Style["Gaussian", FontSize -> 15], 2 -> 
            Style["Triangle", FontSize -> 15], 3 -> 
            Style["Uniform", FontSize -> 15], 4 -> 
            Style["Square", FontSize -> 15], 5 -> 
            Style["Smaller Square", FontSize -> 
              15]}}, {{$CellContext`NumMeasurements$$, 100, 
            "Number of Measurements"}, 100, 400, 60}, Delimiter, 
          Button[
          "Run Experiment", $CellContext`t = 0; $CellContext`expRunning = 1, 
           ImageSize -> 130, Enabled -> Dynamic[
             If[$CellContext`expRunning == 0, True, False]]]}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1312., {391., 397.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`expRunning = 0, $CellContext`t = 
         100, $CellContext`lastDist = 5, $CellContext`lastNum = 
         100, $CellContext`\[Psi]Plots = {
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJx0fXdcz937fykkSWWEEpHttnfqHGWFzOy9Ve8kSkZm9ghZkZmZkIyE8nrL
3jujJGTd9o7E76yn+3u/Pr/7/uf16LqP0znX6zrXeV7X9bxeOQ8J7Do8n4mJ
SXBhExMz9ry6y+ba79/FjHh6rWlWz2K3gfzuYV0+0sXWeOuolPecf6sjlxt6
ls5qG2llrJtiK+StetdztGTyiW7lpgekFzCe7+4g5E9Tv7k7MHndWy3ZPKbG
xx06C3mo19abE5k8Osh+RkD6V21E+GchdzjtZ7Nxj4FsvuoxMyD9mbYr5Md1
Lm/n5n1zbLyBeP16E0Ya3kj2vTDvBpfn6/n855h9BhIhxxP9+GVyfqKfv6Zc
D9WvJ0Sun+rXP0rul+r3myf1Q/X6UXqken1iHPSK8T2vF5U/q+eUUkWGFmby
Q6U8hJ4NO6sIeVftchE3Ji9TdugMrudb3S2dubzTX8M6lNhrINsnvqnE9bxX
PG2N/Tq9TPNMMhDL7g7ruJ7fTSvekMuLzixY4fYdA3Fa2j2Z6zm0JvXm8uk+
n+zrWAaQdru3tLTpdaJ5kY5D+nD57GI24YsqBZBScjzB+KlqfI6PmJ/o54+W
66H69RST66f69e+T+6X6/XaXeqF6/Sh9Ur0+8Z5gp3hfmBd6xfwzw28+5j/j
CfsJmn5xJddz1CD3XC53KjFxRM5lAzkb3nAG13PTDLOZXkw+OK1y2cDxAWR4
8SedApme22WkV2zP5GErPp0+Nj2QfAh1GB7E9Bzef8hxbyY/E9n197tBQaRz
Hd+/8vwd3I4PWVi1E5P/HNCgd1vPsSR1ghhPMD5JjT9WTMxPPNT8CWr+YXI9
tIFaT6haj4dcP12t1u+s1j9e7pPq9+sn9UP1+lH6pHp94pzg3OO84L3CTvF+
oUfoFfoMtk/rOZr9jOfToFUrquYFkFd+5Z+uZHoOfXZ7zlgm3ztc6qd4K4dp
05ienXz4s4DxRWJaRIvhYaTNlbt/rWB6bv2VPwsYZ61t3GtAmzmkeOFx3zuv
7OdWz26O70Ym7/1iXv0BcQtIfTmeYPxCNf60u5ifBKr5aYqc32KkWA8dqtbz
yFeu51oJsW46Va1/x1i5fk+5XzpG7bei2u9lqR+q1885qU+q1yf8FPwo/BXO
Fc49zhfsEnYK+4QeoVfoc/NFbe1O9jOe2U3PePhnzSRJ9vXi7zI9m8UPD3/M
5CPCa1o9WhBFTNwfleqW8UyrNzm2q3slU2NexVL3EjvvJAWJVfOWQWFua7sP
uBHI5M12eK+5kr6X5H8pxpMJwXJ8xFd7MX7D07p8fmKl5v+VJedPTBTroBMu
yfVkTZDrmZoh1k+x/rhxcv0974v9UuzX8o7c73KpH6rXT5bUJ9XrE/cE7iXc
F/Br8KPwbzjnOPc477BL2CnsE3qEXqHP+3u2x77M+KrhuafRuKcnth8gU5vt
3xaR+Ux7G3CAPb9q60be7D937SnSLa1NRN+50W4HWy/vH/DwqzY8M3r/g5AL
xE+OJxi/TY2PtxHzkoh4Ob+La7CY/8cAsR76Rq1nTMtaYj0d6or10x6t5fpr
Dbsj1h91W+yXuqn95q6T+10u9UOhn/JKP4OlPqlen7incc/D/+Bewb2E+wh+
EH4U/hPnFuce5x12CTuFfUIv0Cv0WXZ5oRN5j55peHYsYVv47ye3ychddaPP
9o9zC3aLa/39CVtPl4JnStbNIKvtC/NxJE4+Ne/1RcX4mrkJfH5i6S3nf/Pj
tpi/YdpOvh76mcj1nCzgKNZjFSfWTyudlev/Wq+pWH+FTmK/FPvttF3u91AN
oR8K/VxS+tko9Un1+gROAm4CXsK9jnse9zvuIdxLuI/gN+FH4T9xznHucd5h
l7BT2Cf0CL1CnxNfVq6bFJfshmeP1HG9wqs/JgMv7ebjycVih9by8YN6FRDj
21WP5POTCbZvxPy+4zaI+TdO6c/XQwcPDhHrmdvUR6xn7L7ZfP20xd4pYv0t
li0U6y/dWeyXbgyS+42bJvdbzFvoh25N61LBYvfj5vmLS/30kfqken3CnoFD
9fYM3DRVZ8+455N09ox7CfcR/Cb8KPwn7BnnHucddgk7hX1Cj9Ar9Fl5nZUY
h6d3JWsxfnaOtGdj1QNi/vPrpD2XV/b8JEGu59tlB7Eewy5pz65q/Z/rS3u2
U/aM/fbQ2TP0c1lnz3p9wj8D1+v9M3Ao/DNwEnAT8BLuddzzuN9xD+Fewn0E
vwk/Cv+Jc45zj/MOu4Sdwj6hR+gV+hxqJ+fFM5qEiPnj+kr/fPedXI9FjPTP
P+tI/zzLTa7/5hjpn5cq/4z9Vl7/b//8VelH75/1+gTeQJykxxvA9bhPgTuB
Q4E/gZOAm4CXcK/jnsf9jnsI9xLuI/hN+FH4T5xznHucd9gl7BT2CT1Cr9Dn
o0NyHXj2SpXriVR4o6Ja/7zQf+ONwWq/5XR4Q68f4A29PoGfEXfq8TPiJOBD
4HjgeuB54E7gUOBP4CTgJuAl3Ou453G/4x7CvYT7CH7zjx9V/hPnHOce5x12
CTuFfUKP0Cv0eVGtG8/Qcf/Gz9hvZR1+Lq7TD/CzXp+IBxHH6+NBxJ36eBBx
EvwPcDzWVVEXD8IugD+Bk4CbgJdwr+Oex/2Oewj3Eu4j+E34UfhPnHOce5x3
2CXWA/uEHrH+yrp4UL9fxIN6/SAe1OsT+Q3kRfT5DcTx+vwGfo8+v4H3rM9v
4Jzp8xvwc+V1+Q3cM8BLuNdxz+N+xz2E8biP4Df18+Oc69cDu9SvH3rU7xd6
0esH+Q29PnX5Ovof+Tr6H/k6qs/X4dzo83XwW/p8He4Nfb4O97Y+XwfcpM/X
6cfjHtLPD7+pXw/OuX79unwd/Y98nV6fVK/PfAuL5rSNtDPiGVwxsyuXr9wj
9b8uTMovTPqr8f8ZT/9jPNWPb3tsunn7p2kanr3uFnz2l0kWOVJmFv+ZfNgk
5Q4RUo6f8f8hH2Iif8Yz01PKx127cimnRrJb0fdJ/sWfpZFTY03uBVs90u+L
/se+6H/s6894jMP+MB77xHw6OdXLTcR/t5L7VdzP16l1tDcV68TP+P+QYz/Y
H/al+71/1qPT/x/57xI2w1y8ihnxLD1+oJA3kD/TBv9/uRH//z/G/5GH7Zb7
HF5M/rvms1Lqc7m7/JnujJP/Xyc3KjmFXM1D1Tz0P8b/mQf/3l33ezHO/f8/
D9X/3jlvi6b9nmZrtIqR/juqwBwT7peK/lUm6ffvIsa1YfJebff0/s5CTF5v
clMh37HfWYwftqrsljpMXr9g2VO/f1sYlybbi/G+x95cL87kY499FfLLPofE
+PXWrxsMY+f9pkU9Ns6M3RcNxfgjhTrOb8fGD2i/8yaXn3g+uaJYT/reZTUP
sPE3j7Pfm6d1e7RYjL93a/SF52z8O/tP57m8gOO6Gnx8ZMHu3cqcMpBK70oz
v/NJ+/a7oYjbPKIrmhbn+KHuxtdcbutfzpWPv3jm50P/bHbvCD/1RPOgViKe
nrZoelQk81d2mRfMTUyytV1jsjvy8Suej90WXSSARHnUTc+N3fw/dYotch6i
nydgxPQOFrvv/k++3UnOT/TzV5TrJ/r1p8r1E/36r0v9EL1+nkj9EL1+bkj9
U73+e0v9U73+68r3S/Xvd4x8v1T/fq2l/VC9/dSV9kP19jNikzW3QzrrsLTf
A6f/bvt/7JPq7dP8lYuw20UmbuLeK9xtbXwjJk8bX+8ot8+rVWsLfFfb6u3g
bUxvq2bsvcHtcJ93yY9cfq/B3E5zUg2k6szphU1MzI1TnTa78/gm/U6nc/Ur
BJAe1hMempj80oZkHnRqx+RXV+0r0qHZaFLu1OKdpiaftduzp1zgcefsQ2Gr
Z1YdQxYXntDEjNlJk5k7XvG4f3yN4iVdpwSRkC8Fe+f5O/5P/n+hlRhPMH6k
Gp96UsxPrqr5V6n5txQR6yH91Xreq/U8niHWTyer9Wer9YfK/dJ4td/7ar9X
pX6oXj9Kn1Svzxshr4WeK29uJvBa+3OJlmns/fb59OkS13P0yISlXB5+vfqm
36cNhNQv293EpJCxTjm7ojxeKVzEZNX4hQFk04jJTvmYnqNr9Qgcw+SbboY3
e7dpDKmfYV+rMNNzdq/PQ0OZ/HG6Wz0rm/FkyKOyleyYni/fydg1i8k7/lp/
+nbj6cR5faWdzkzPF773XLmS1wUOHjbJujmHvG47p3iXbf/k/3uq/NX+TWI8
wfgHB+T43RliflLorpw/wmSDmD/fbbEe8lWtJ+iRXE/WULF+ukqt3/e2XL9D
PbFf2ljtd6Tar4PUD4V+5ij9XJH6pHp9Fr/VNJ3rOWdYE4F/P82avepCooE4
xExsYGJibew0Y6gfl/dv/bxLdusAMnhgwUpmTM81Z+zcuILJL7UpVNTz/RhS
8UTW0iJMz9XN8tONTG79+FrLyvnCyMQ1p/K3ZHru3WR/t+NMvtX/+Nz9DSJI
eerwxsD0nFwpdMp3Jne6Ebn62NINxCN95dFzTM9+Kc/mtKxkagwqsPyES4VY
MqhOs2EtQ/7J/zdR+cCG01bx8WT+YTne8kmkGP+ptpifFHOR87/9KeePMIj1
kMdqPQNvyvUcTBDrpyvV+lMdrov1B/cS+6XYr09Hud8dm4R+KPSTqvTz66bQ
J/2m9PlZ6bP/9KUvuJ7X3T0axXGue47loIgbzJ6rBYaYMj0/rvLh8WgmT3uZ
Onhm2mhyvdrrjMJMz4bE0QETmbxjjqPf+B2h5EtHU/O6TM/xQTvK7GbyEBcz
m6itS8juwWYFPzE9W67N14aIfNKwzC+jtpPfr7csm2H6WZvQvsDcbg++av2O
NTu1wfIISXzu5J+SL1trt+xrvbjMr9rtxm1XWvY4TWrF+yT0nfdP/n+oyq92
dCrHx5OEpXK8f0U53ixUzE/OdJDzZ85wFfNHpObj6yFX1XrKDxku1jO7hFg/
HTlWrn/QHnOx/ghbsV9a+bDc7zqvsmK/1V2EfugppZ/nb6V+rKU+KfTZXulz
Q8idPK5nmybFDvG44eVurzF3fxlIoKlfiBnT81yHvyeNYfLrd9Yt/RE7hmSf
8TlVmun5dbF7FeYy+dSchtnptWaQwHrTfHyZnp9MK5vyicnjZ90p5/5kPbmb
Xu24eb5f2sbNhlXVHzzTXgzdfPZQkcOkm0fzezXMPmuHezV84P/wmeZSmYTm
G3GBxF97vzM1f7Y2fZXZXo/Hz7RJa+IGHduTRhaU/KS1GfBP/n+qylfPXvqR
jyc5z83F+Cv1donxmf1d+fxk/Xk5/9u5VMw/a0ZVvh6yM1au50PIVrGeqken
8vXTv6bI9dfLuy/WPyVS7JeOLyr3u+FwI7Hftl99uX4o9DP+idTP52ChTwp9
Vtoj9RlddmQhk+m2RosxL46HkUPNP2WeLfayZADZnLdmoTnT84hiFwfEHyju
1n7u3sSqPYPIpdNHujgzPSemXm5RY2ZXtw2POy29Yz+L9LfqeGou03P4L8tu
PteC3HI821W5dTKGjAnpc30V0/PB0218y21a7PZ6S3D42SkppN7u901szT9r
B51znAZU3+zWu9bWPhNzrpGPzd6bGAtmk86DW0xI7pbgZnsovWXZuAekcyEx
njg2LF2Oj6/6To7f+rMXn59sePtOzO/3bYKYv0KgN18PffmxqVjPytreYj2J
M8T66aRWN8X6Rzp3Eeuv8U7slx6ID5wzsHIJtzNr5X6NjkI/dO8v604jRmQ2
7/FQ6gf2aSH1SfT2WcFR6J+c19ln7eLifZExyj6L15b2GXhbvF/S2l/aJ70p
7XO9VQC3B/LTQ9qnY7C0z77HhP2QF8vchf0kVxH2pj0ql5/bG7HzlPb2Zdp4
YZ/I5w9Q+fzI55+EffYKKiDGj8jYKcY7LJb2uflaIzH/lDXS/hdNl/Z5xlOu
J6ymtM+rR6R9akfk+l0zpH3aKfusr/ZrkyTts7myT+hnks4+oU/YJ/ztQukf
CPytj/K3/aU/IV+VvzWpLv1ts/3C/5CaudLflu8k/W1od+GvyLtB0t82GyL9
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
oM/dlWSHZVMfX7b+awft5gYy+aik8s415mwkdbxaTva59Q8P7aviofnr8m+l
Vf7tupfYD73QWOzP2Mde7ivyiXh/NFq+T+NU9R4dpH3TeGnvf+x8dfEfVe+w
dQ6dHFGnP8PnlyxexKyL2kcOniu3s5dptubnNsXEmeH5231Ktzw6K4msmxcV
Xy7mHx7XC8XjuqjLyyWq+87ZRdgZXVhW2J22uqy0t47yHNIZ8lxq9dV5PH5g
5qKaZtmaV/sqLh0Y3r40e+KPAd8vkjnPj3hm/h9eU0/Fa9Ln67JVvu7+AXH+
qVH6Ay1X+QF9vg59hXT+/gn8/HTxHXiSnScyJWmDz764McQ2O+oD51lmv6r3
tRTnRcwzmpq6zSBlVp055sf0vuXx74Yz+Hc3B8X5Taq2gdx7dLKmLdPLtgoj
K20yzSamzS7k+Y4/TPZX6fCgLdtPlv2LI2vNsslp14Jjljpf/BO3ww/nKT+c
9ii9Ats/aXjucSemD7I97WCpgUwP4ZnLy7P3Qf6+2SyWvR+ya1vQ1yPsvdQr
lW8hsydav3zDHsy+SNXhYabcrhrkPeDnhDo8KMbPDWke/GIyPy/Lywl/Qe/F
Cv9B1qyRfqO89LPURvpd0ln5W7v/yNcVObUonMe9k/KXOlOYf4dmx4BOa4pO
ICGLRtVuxPQzeEABozuTLw+smi/91lJSZWnkp/I8DpzQf/JNJre82t3F6B9L
JpfPW/2KxUsdF46dy57kx4qjliGjj5N5O78Mjmb2YHWrzQWmPzJ606LmXG+d
L22sk/l/+BWVFb9i0JG2/Zgdk/ipzq7MrskM34SO3J4/jD1hxs4hDSx8sTc7
l+Tj5fDy/Dz+Sj3O/QvtlRjM/Q2563KnCPczg28KP0tP3BV+l9gfk/7WXt5P
1EfeVyRa3VM1Jn0KsGP7LXv6wpOyzL/6Vcqqcu/KNNKu0aSQQGb3yVl7+ZOk
Xekzo/epFSSxUt5Utn9tddTi70wfJGd5iDXXw/kWTm2Z3WghM4xtmR2RBfuD
dnP76RJfcio/d3qew5e617nfoVYHWnepy/N4S2uX4P6n9oqq3J/SI42qc/9K
LE8tFH61SYy4V+g2ec8Qg7+8X9zlfUznyPuZOKp7+anJJb4fjRz/zPdHm31P
E/tyGjGQv1ft9oUD/D3TfmVjTfj7PfvSrOkM/l2jZR9T/Pj4ecm9+Lm4FmfS
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
9vXm75Gu3Rz0jb/3J7Xa3jjHxneU74vq39cq+d6p/r3f7p3H7ZAuXPV7D3/v
IZdPh7xg8nRpP1RvP8oOqd4OhxQXdk6DH1mL+sa988M+8/OSLO2Z6u05Qp4L
qj8XYdby7xapp/Fev7fV+Tm6vV3yMXqNl38Pqmqv8jW4/ONI+fef1NM4NT6w
KJfjfOK84pzifOK84pzCL8BPwD8U6JN7m8vzPc4R87xqe9iZz9N1XOFE/jOe
A10K+4ey92sIl+PuZf4oJ/5+aaM62kM2Pjc+KJGf313B1sV4va5Y0xTX46sM
WuisNw/5eS/+8rMY72Q53ecmG2/3tp7wDweajxTy84MH/bWbvd9XZrc38PNb
yLGqO6/LrbCuaHOllUFz/5E6lZ/33a52Ynz47Gclctl6rApNvCTy/LGbHLnc
Zt6Ua0+2GrTlP2/m4+d3lfOexbyeZljouX/DCn8t0752GX7eb4inrbFkZ/OF
lzYatIRn7tv5+Ekh04tz+c4+MUW+snO9dKCvu/je7J5pFrx+9YK28krM76/5
pFoO4+d9ma1FYT7ettAvV9fpBm1rhZkH+PjAynnmXN4lZ/LkreMM2tTgHtH8
/F4tmfug4nkbY6PRdyZ0HeCvtZt7zZOf90LDMz4u438vabZVkyxvg9ZvvByf
Vr7JBy6vNbR3bHA7gzareLnR+XtkJY/1PPqUy09GLT8RXo/p81VVW/MeL5LH
KflpJW9Un1Y2Z+P18pTOuw2/2Pld9Hv32zyOs/oPol+C/bSqcj0E64lU69ku
90X0+9L+Y57h910a8HO9b7hz/H1mD0tyItPKlGV2JfVG9Ho7IvVP9PqfcKdl
Kj/Xjok7wrg9dG7n5vFxBfP/8j1S/XssKu2B6u3BYkTzVH6uHXa9/snt4WAP
b7MJzH7cpF1RvV0p+6R6+3y0+jW3f9p/4JcD3B4qKXsOlnZO9XbuL88L1Z8X
S4ciMp+/yErUD33sHKvy81hF3tNUf1+r80v15xf3K+5b3LPwR7hv4ZfuuueI
875p3UdxLudPOLD/HltPaKSfkLsWaCLmMU1bvnA/mwfnGecb5xr7xPnGfs/N
/X2I+4f+wSaZXN49q4+JP9Pn2pTk7Vy+eWY5MU+pFgXDe7J5nOY3aM5/xvN7
1TkRhe/6a7tK93vA/z2euHfeVpl8iI8L61T6Cpe/+77WdsFK5p/rxj3OY36g
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
fZGoC3JfvRaWEvt68djFojiTdyiztxR7aiaL5rYx351Mmpzee27koe+kWMOL
6aeZPGOo66GlJvtIdIHpXF/k2kipN+vjH4TerJvX5u+FLAmT7+Xjjg7ivdRu
uCmM+UFSNOakC/OLWscCfbK4P9zfd7yJWWQ+Ond6lZW7mDwiu+7dvKKLyPR6
h/l7p0Hqvfd77SXe+xN3YVf021ZpV5OuPRd2tbzwEY7z6Mv0MlkM92nhn8bu
5nivaHLDzSW8LGiFci63PjD5wQmvm/Vo3lYzfybsllpcl3ab9WqhsNvPq8W5
oE3UubBL8hTn4vZvEZdSr3aFeJyqXfD+KOLTF+Z7eJ6L+sm8l/ZxiMx3LTor
zh11lnGqVtBanrux98W5pmvVuQ6qJM/1nFf+3J/QmRtGLuH87lOjl8xpw/zJ
S+kfKPxDeeUfrkj/Q+F/Oin/g/oB6gmoIyBfj3oC4kr3g632in7+h3btubx0
qdtPGvdmceuYzbsFf+ZKVAyf50xW/e6XujM/ZivzlU9V/tJ8lMxbIj+I/CXy
lrXzzv7I5fnoXNfZfkw+xKWESzHzUVrXmzMvc3n/uPtd8tg8WVd8G4RdHKnV
K9xc5DWiUraIvEXm0/bXeH4DeQTkOZDf2PT41smnPP9j5v2gG5Nbd/t5KvN8
D3IiuH2/bJ6PmFzE7BWbZ1+XSctIrb5kfcqSUB7nDLQ2fOZxzM2hz07xeAdx
BeIexDu5zjHtVzF/NXu1hedzhkc2Ng6xXnFsFama4lRiKZO/DHjttYrN06yO
Vb0TA6JIzdcLwziOuTe0cxTHKcUvb4jawvAMcAxwDfDMuQoW+3/k5WnnQ474
7rv3TJv1xuHSkLaHyJGr6zplMnmL5s+/bv/1RBvn0vzACi2RJJ6zKMT9jpfZ
qNrcrySdMk7m/gfnHH4I/qe03dMzN39+0hKOv68QeOeZVrVAraR1886Ta1tb
TjnA5PuL0s43fz7Rdh69dinK4SJptPhcydnXE7W6p37f65rzROvvbrrdmJhB
Ru6qG11wYFzK53uTjjy68UxLW7C2yvqT6eK7c5YRW1OaOdbfSNj4MvWXuu1v
/oAM/Fa+a9StZ2R/zdrfmv94ot2ttK1oKk0jj9pN5P+eXCx2aC2fz2ZWtJhn
Zo1f/PeR+Tvk7/d1zid+7+B3/bPTvj8hiQMG8Kemzdsz+2LeHeLWNmux/b6X
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
404tWFDwW3BbcFzw23Yep/r4S8FDzPjGilMNSn9su8NT5m7ZttbhK8Na9ogc
rgKeAr4CrvJAW8Wj6qUWd7iNmTIqv+A2S8p1PnlHRn3y2kVpWVy9sm79/u2u
TqE+oV6hTmnaXPGoYkfLOzzKrC26RPAody6bywPIC8gHyAPIC8gHnB+0+z7j
u/34rFqtD7r1vLDnOzXc+h7W+Np+XTLWNeuZ9c26Xrdc8ajJE/V3LTiZT37X
B/XL9L7G8YtaTDHvZlxncPslhR2O12KJ9C0Snys+qiv9iwPZ9HnxuXDxL/Lc
5hvFo2an6fNfnV3xqEazP8i/3eUVu7L0vzxjPuS+5JIDLUb2M1/cpLhTtzL6
Hg+OUNzpQ6u4U7NlOh+iEYo7pbc+UvtERhyoUX59/8EZ8+FoufK57JsPRI09
vrRmp86r8y4fKfPq2jcUX/rKz883Niq+lL9Fk6wZ89+eXF93884Fp83nR35t
99SQjtFYjyMxz8t5HOkZjyOxjl72ONLE8pMEF2rTrL9x+v6vT7wybVpmHMmE
ONIKv97BkeBZwruEb0mfDt5l2KfzuLqlT/fxgcZb3fiyIuUcr8D2ufO3XC2m
ZeQtnr8FnwseF306+Fzg9oN9n6634v+2rMf/Wxcs1N+Nn9nWbZa7zvGf32nT
/rFOUR3P83jf8z7ge8DzgPcB36OC79PtvUL6FLZ3a+1THGv+bp+zjudUtOja
s06PPrLCb9WWdoyK+f4u/V76vPR36ffS590/Rvt0i96SPov95YdJ0me58/SF
0qcZPUz7NhWbNJd+DX0a+jb0ay5uq/24qgOlH2T7zOgh/aC7W68e6/DTpWtq
C566LluR3Q5HBT8FTwVHPZ5H+3H5Nkvfys6stFf6VjdNuXS3wyOaz5ryusMn
7r0n7UeHS4BHgE+AS/Ttrf24Hv2ruH6cbXdvdenHyfmDGXk/dQD5P3k/dQD5
v/jF9/5nvJkf3zFrw2y3r2956cEpbp8fUPO+uW5/Z19nn2d/X1xK+3Gvb9Xf
Neh8/V1tr2hfJ8oYL1PpUOrCjOuMqzn2eIGWr5geY5fI+l9UyhRw8WDeM29+
4+IA6594QByoNVL7cX8P0uc/fXV3ef7z0noV25Qx/uGyla7vahs3/eNL1289
8I3wRSyfjXetFd7Im7v1vfJ52ZdXyvu9crL2464cr/NkwJYZMk8efmD2a66P
1qlldF7JjHly4NYH+s9Z0D5a7vtuD/r5Nmmrzresvu+22c/nW57U+bzt2LXV
XR8td85v59bJmCeN6149eGGef/puKX5dDAv6bn38uhvp192KE4ekj1Yi1+HB
zi+k9MI8Exv8q+8Wrt+g72bpu8HDhpcNHxveEbzskHdUXnkFFl5B7o8HyfgF
HR+W65R6+LIuP2WMw++E7wnPE94RfM+Qd7RL+Q92g+c/XF+03Ww3/qV97RN3
nSpvrf/qhQmdInhg8MLgg8EDgxcGH8x43tEtp4WnYT/2PI2Lu6T1deOT9dPu
6Tlyfb3qnaLfPf8DPshCzwOB/wEfBB7Ias87evGo8EnsTXcon2RpYYlf8Uut
JZ7ZS0ZrHEv0cX1fl34ufVz6uvRzT5RQPtKCzcKHsYdHR8KHeTW4zkf+OjXb
lZK+y47S2oc51Xmr9F/ou9CHof+S3k15Sl06CZ/H/tCrovB5sj29S3DMJ6/a
JLjm0rWbBc8ExwTXBM8ctkx5SmOeEJ6Sja6YKTwlOa9zTvNl4AfgBuAF4Afg
BnIuxZx/xqv78e5zH5E6ofdNm6VuKJnS7kNXL1AnUDdQL8x+WnlK2/zv6nGN
/q7zBn7g+qymyte9Xd/VxnOfr+n6rW+03yD5RN+3j0l+UfRoI8kryCfIL8gr
fvU8pXX+vdw+W9/L3s45Hb/EvLYvq+Ob2Nx7qgvPZGQ7jSNVWmtcydZU4wlx
hLhCPOnneUrP+nk1/U6dVy33CU/OfvmQ8OZs2QXKl7tmqPB3LZ+vXas83kF+
vvL5+Tydtx09f+l2vy7y5NN1UanNPOEjdWgY1XZ+S48dqJk2eMw//CXWV9GA
v7TTr98v/PotcaCC8JHmPnrksPMx6nDfkb5V/8VfqhrEAfhLYZxB74H+A90H
/Gr0HyG/eoLyLS18ywmVz8r4a+PThQ9eYuqjRfZnjMMjh1cOnxx+NbzykF/d
SnmhFl5o332TRafxnH7aCpcu63pLxv3DN4V/Cu8Uvin8U3ChY55fPUf5q/ZX
z1/9VONgXF/jor3Zx0N4ZvDO4JvBM+O9wTer6XnXK/oLz9bW9TzbLzSfiy8u
JPmdzX5E87oUzxc56/kj8Ebgi7CPwRtp5vnY3VYKH9geKq584CJaZ0Zv7pK6
087oqPXm476PS1+Xfi59XPq69HOf8Dztn4sJn9lmXaN85pG3aF+kWRHtkwzc
pv0R+iL0SeiPwNPefq3wtO3JScrTHu/xR/BIcEjwR/BIcEg5Fyfj++H4B9UV
j7jvB8UnKtRUXCKBr/n7AZeAp/2H/10l/e860094J+a5CsJDsQ13KP9k5+da
t1RqqXXMBce0fqFuoY6hfjnredo9/XvJXkLfS+rvwrczdVoI/87+VFl5d/l8
vrLb5y9NfN5CvsJ7J295yfO3mVcN/LxqoLxh26q+8IjtNYOVP0x8Id4QZ4gv
zNuiAa87XBdLVc9gN6q+wRbyuoYHVTdl+UQ/xXoL1x1873Bdl26l/O2X2hyv
53zXRlds9fPOf/G9w/gA3zuMP4E+1KIfCXSdFr3YN4PUF7jcveqbm/f7Xlfk
yKwbtehG0bGga0HPgo4FXQt6FnRkX6ouxqKL8fEx9vEyESdLeL47/Hd47/Dd
eR6hvuwj1e9Y9Ds+X4zzaP6YyBsnep4rvFf4rvBc2TdC3dkG1RnZy73OaInW
vfEKrYMT9W81z1eDvwZvDb4aeXSoR5uheig72+uhiikeF41QfM7W87jci55H
Aq8EPgk8EvCA4oFObY/quWwnr+earbh/lLWX9AHsBI//00+lv0pflb4sOCX9
2Zb+++NLiH7N9vf6Nfof9EPog9D/oB9CH0TP8TqaGOf7n3ictLzHTcFLwUm5
H/DS6V6/Fv7eK5W3Z1Yrj89e5fl74CngK+Aq4Cnh8/zE69fC95VP+cpmovKX
7R7PW6aOoq6inqKOCucDurZwvp2vugtbVnUYFv3FPJ/3kAeR/5D3hPMZvVu4
XrwezPZRfZhFF/ayj0fEJ+IS8Shcj+jgwvXudafW61Dtz15/er2POz4OJeIP
caq/xq1EvNr/to73GqLfN5c+muLGffyKiWdcx38/9t+P+b6Ps3Ep/V0xvwt9
LHpZdLJz9DnHRfQ5xzxndHTo6nhuRfS9x7P0vce8d/Qz6Gl4j811Hkb36TyM
0/w8hAcPLx4+/Oe6LqKXusm6iLP7dQE/Fb4qPNX76ri+4IJo5461wmt48/1P
z9S6o1MEDwxeGHww+BDwIOBFwIcIxwdqXDI3a1yKF/i4RH+RfiN9Rqtx0p7a
JHEyPuDjJH2IDr4vQT/iHY3btozG7YROAfwRPJI47HVT1u8jCf0UOAK4AvuC
39es39cSOk3yePJ69qkCfl8MfRW66f5rQ38G5hnzjvlWV/OT+OQjkp/Ej/j8
BP0kekp0lJtySL4U9zgq+VL8cx3Nl/J73dTDXkeFfqqN5m9RsWaSv8UphzV/
S9F8LMr+kOohdnodxCNG8smowU7JJ+N3r9d8cp3mh1Hz65SnvGaD5odDB7o4
vCZ6J+Xan4TP8tX9pYbMbxf1nKv8v4d3Kx9w4R7lAcKDgf8C70V8RCvlyzSO
7nhYoDueovWC6bJT6oX4mz5aL0zyfaanfN9pp+833an1i31Q65e4pq9fwJcf
8XjzCY8zb9V6yubVeiqh4wMnAjcCL/L1nd2n9V1CL0ydRt1GvdZT6037qNab
cVBv2lDPS55E3sQ8JB4Rn4hLzCfmF/Pq6raCD8RHmgk+EM+sq/jALXtUFzf2
AdXJ/TFL6/3UNoJXRDsGCV4Rn1rSUPCK/Y8L/hCZLYI/xN2qKf5woeIn0fDz
BT+JTw17QvCT3wcIHhKNXix4SGyf6yR4yO79VSqPLL05ynf4nuWOr/T6q4WH
nGjVzlwyP6/wO0f1f1j4nlVLDhrpeJ7wnOA3wXcSX9a3/hmH77T+CcGpzMEL
BKeKC6z6QnCqktMEf7NXdxD8LX7C4283+n7A6hbaHzjo+wIfKh5oL1Q8MG7t
8cB3Pa4Hzge+V0zxSZtd8cmEDp26mjqb+nq44qV2h+KlCf+KdxUvtaFOk7yW
PJc4xn7D/sO+86SPF+t9/Djs40bu+3QeZGuu82JEWZ0PK58V/DzK/3t1h5/H
HbO9Lfj5y4sED4/WvC54eFzzhlOCh2dfLXh+NKKU4PnxnriB4PnF8wg+H7X9
/qDD5+PfHhsn+Hzx24auqrV7R/RUnvf79ssYn9nnr/yd60wwa+serOd4t2+l
XpbieLiN87e9wvFv4Z/BO4OHJn62O/4Zh4eWMkj6JuaH3tI3ice9WUz6JjXy
53B9GZP2lPRl4pmpLaQvc9b3e4oF+r70YHy9H8+5T/pQdu5g6UPF1WtoH+r9
VorDvuNx2TajdP48rH0x+4j2xeKGvi92kcdBwEWyeTxkovbp7Brt0yV8UYZq
n86GejrqEOoS9kHyCfIL8orzm+p+8Lz2JaNvD+q+0PRu6XvGdctK3zNac6ac
rPcP+klfNX5npfRVo6OvXyZ91XIPSV84+qt/qusLRx1PXCd94e1G+rxRtRcn
uz5vtLj4cunzLt6R0vea0V9Hp594vfy09PTo6V2nV5acu9h8MizLKceHrrLi
oy6OH/3X8NGPOV40vED4gPADxR948j/j8AN3tWrn+u9mwSXSf4+uK9hT+u8D
Vkl/3xRcPsD196ONK1Kkv//3MeEP2IsWCX8giqtWEP7AIo93g38v8rj3wmAc
PDylvfAl7M+yH6VH+zxfoq/Hoa70uNQEj0c1Uf6G/Uv5GxH8jZzK37ChLok6
kLqQenCwz//IB8kDD6Tp/p2mfJVoYkHdx398WfgwcQvlw0RVoq7Ch2nwhvBt
4ty1hW8TvfL6OuHbXP35YsfnidJOCZ8navznFOHz1BtYWHhKfF4zvKLwguZk
v7jkLSX3RqlDDqW/euZ49GGt1xvNnbvBRC+WF/7SwQElHX8pav7FZOEvzX9n
Yh7HUy+V88++jrde46aLf3J8dfia8DThbTp/5qL/Goe3OenYL46XZQp+1dfx
sqJNOXMLLyt17zzH+zLD6wvvK6qVflx4X+Nv6Ox4Zfazb4VXFj398TThlX23
THhrdlMd4a1Fje/6Rnhr4IbgiMc9fhiOgyuWWi08PfuR8vSiLp6n97ny9Gyo
16AOpy6nHidfr+3z9zd83t7ncs23rhqs+deZpZp35bjsFtlHH33hNtlXN//6
9lC3n3brckMvF2d7/fjtahd3j5S56m4Xb78Zd8FvUzPWz8Sl+aa6ddl21vnt
SmWsx1MV3/vdvb87G9S4xb3P6fuaNXfvEZ0AugH0ArxX3jPv9/f+rYTfz+d7
DWYLz//LlgW6pxaav7T4ie5j16TtiEaXb1e78LY9pvuZSX+N3LzDDOs11X1m
5BfLvy8y+jsDHxd+LrzchrbW+mvOHDdV+z7Wf9u2NdFlJU/tbXR0o1nU55k5
S9PTzdPmiwU3l9wc3Xh7+tevNF5olp2YN3eU4yvMqhG9tGtHFA254+NV28aZ
YltzVHW8r9RX2wwuMObr6J7WGx7vXqSp2XSqygnH41qxu3bG89wb2Qfm/XV7
evsEPtI04J/nUp65DXnm0w7J9+M6+n1TwX8/HK/ox6/PI/hynEt5+Kb8UsWZ
W/YUXn18pfLqTdXyyqsv9NM21z+Lv/lKdAHmurN3Sh+t+2rh+ccvdBCev5nY
MEV4/jVvFZ1CXG/m506nYE7a20SncP/yh5zuIF7VVXQHJl+uGqI7mLvlEqeb
iNZPF92Eubz2btFNrC3c2ekgohUVRAdhGhW+Q3QQM7OKjiNaslx0HOb0hTeI
juOT67c7XUY0uKroMszqJc1Fl8G8GprvuPATt/l59bMfd+dKuPGdfjzvrPlO
T2KmV1R9SaM2qis5dPr4Zvme5zfCu3b+e4Ubv7+sR0oFp2cxNzQeLXqWln/k
dLobM/HTdk53Y+rkjER3M6bbXU5HYyoMr+50NKbzD1+IjmbmiOFOB2R3r7nP
6YDMorveEh1QSvGJTtdjnh2w3+l6zHU1bhVdT7FCo5wuyaacJ7oks7Tm96JL
qlK1mNMZ2UqVRWdkPuiYQ3RGF5UWnZStslh0UqZ0jntFJ1V/tuiebL3eonsy
9T/qLrqnkXlEt2XHq27LmI5et/Wd1F32lZlSh5l2B7X+6q86Mqt84e9Nd68j
Iy6F/OGligvYJooTmGx7FR+gzh/k637qfeq0KOAPD08yXmKi5uUzSouOz2zb
cFDy894/ql/M0fqiyzMl9/8iurxdl4iuMG4yVXSFpsUzlUVX+PvaReIHceEf
ohM0Dy/pITrB2/6e43SOUZNxonM0qcWqis7xmc6pTrcYDdwtukVT/9WHRbe4
+/Ebne4ymvb3fqe7NN37rBLd5a+VREcZFfxMdJSmnddRzkz7aXtaRtxZNfDn
vS4O9WvX8UcXf/bPKlvd6Y6aD9i53emQ8j34Zbqb5/D44e/D53c+80X/NV7D
j8/sd4HTz5ri34h+1uRf1FT0s1XvOuT0sGbxdtHDmvqtyooetl5L0fPaIdlF
z2s6f7la9Ly994o+156uI/pc83WNfaLP7T1e9MU2VfXF5pctt4u+eOB+0Qvb
XBNFL2zuP5v7dlevbZwlemd7o+qdTZdqqne+vaz2jd5T/bJ5fqPiA7eo/tpW
Uv21Wev11+Q5IU8VfDavx2vBacGJwI3Ai5709f8kjwd87XGA96Zqfn/ZA6KX
NzNX3iN5vtkl+ve4/62ifzcfRVtF/35jB9HvR6n5R0ieuPdt1e83WbdQdPh7
irwouvweXo+/sKD4CUTnt93s/ARMrZ+Wi5/AgnLiDxBlbzfF+QOY5ptuF3+A
/vW33uP2obyHPnnN7UurfmtTdkTGfjT1ivObOv1YmX5dyzg92crJb3Zw8RM9
BjoMdBnizz858/iH6ttgKsy6zPk2mEZZxolvw+pT4jth8+Yu4HwnzNjVO8V3
onvJ+4XPNKqe+EiYH9Jri49EypXig2Hz9RUfDPP7zf3EB6PRleJrYb9fK74W
plb566Tef6ik+HLY4+rLYQoNV1+Ots21z3fyhO/7+X5fZ/UJsYPUJ8S87X1C
qGtC/iF4Ovg6uDo4ILggeCD4DngPOM9Vvs4v7uv+x329X62P+MZEZZZoHbBp
o5X8f0n6Y+KPcO3r4gNjS5coIj4wjRaJj03U9lXxsbHb0rKKj039oyucL030
6hDxpbGbWnUXX5qTrVYudHlGtTHzZ7t437X3e2tcvvFexyLtna4vZVW5fU7n
l+9g+blun0Ungz4GXYyca7Aj8/jjNcUvyKz5RfyC7Asf3C9+QWW2iB+RadhT
/IjsFVf0ET+iUT3ET8lWKSt+SnZ+SfVTat1AeR5jdyvv45l3FP/5Xf2dbIFs
4u9kV3p/p2a+z1rf913L+H5rLfWbst+q35TFbwocI+R90c+gvwEeDm4Ljgt+
Cx4HPgcuBy4DTgM+M9/X5xf5ep06PVHX+XqO+u7oSPE9i6ZerXXA4apbJP9/
f6z4mEVlaqlefN+EH2U/mvxpA8kXS32WRfLHJllmdXR54/Ff94uussmkIaKz
LJ3npORd6JTQJ6FLknMi3so8nqr+cqZrvo8lThcoe434yz35gfjXmbfuF/86
e/FD6l/XtJK+1yf663v+8zZ9v7vV389eOV/8/Ww+7+9HP5v+Nn3t89Vv0I5Q
v0Eb+A3akA9D34g+En0Q8HTwdXB18HHwcnBy8FPwVHBUcDRwNfA08BTwFXCV
Y74OL+Tr8u99Pd55p+bxN/yhef1z92k+n3pIdarf9VPd6g93aF6N7gu9Fzov
dF/h+NPqI2qyzNd9Mr2m7o/b1afUHPTxcpmPk4X9uvrLr7NP/friPfHeeF/0
18M+e2X1ibXeJ9biEwsPIHzO9OHoy9Hnwq8W/9rAtzb2vrU28K2N8a/FtxZc
G5wbfDvwhU7Mn8Bf2uKjCx4KPgouCh5KXAl8ffGXtvj6gqNN8LgaeBo4GvsP
+w7+0vnUZ9jiMwxeA34DbgNeQ15DPoO/dIr6Hlt8j8EFwAnAB8AFyMfJw/GX
7qM+zBYfZupM6k7qTXykK6uPtMVHGp0h+kJ0hQ29zjAcr+zztlt9Hkf+Rt4W
/l78osP7ZL9n/2ffZ78Pnz9+0eFzY19hn2F/YV8J5wN+0eF7JK4R54hvgc+z
DXzLbTivWG/epzmx7uhbh3ybwC86Mc+DvmFinRb8v33GBA/n/Ut1nfLJOsVX
mvWaZJ0m/KWPvqffq5dLr7Og/qhy/5/1nrgOfXrft0/02YPfm/Cjpk9PHz7o
19uwX8/zCn2tCybptwZ8gMT1wZXOk/9tWzrG40uVmyuuxOeiaoovDR71lOAL
4A3gDOAR4BPgEuAI7jzz5o3fX3ajxxPwy8A/A98Mxp2f/9BXpixL8eP4YuCT
gT8Gvhj4ZOCPAQ4W6tPRn6NHR4declNz+fd8fhfNlets63SDw+nMwanFRE86
fPg0wev4Pfw+flfhJHyw6/8v7yLB3+B98H54LwEfIzHOvAn5HoGPug3mucVP
PYmPemI/CuZh4u8G8znZ/cfB9+HLJeZtN10/duV0/T7rKLjPxDpiXjJPmZ/u
/Ag3P5gvzBN8W/Bxwb+Ffw+eCo4KLgZOBj7Ge3Xn6Tg8rJx/v/7+Y3//Nrj/
OHzOPm5YHzdsEDdsmCcE1088n/EzfLzwnzNuzVPejXMf3YK45L9nk3w/7hbc
T3B9y/eD9xV+34bfx1cX3jd8S3ww0a/AJ8fXEv0cujl8ndDjosPF3wS9Pjp9
cGFwYnBjxkPfeHTC4XXQ/YZ/F91OeJ/w48PfBd80fA7EhcJBfOZcBPI79jt8
0uGHwhPDBxn+O/xYfEvR8eAbjG8gfp/4fOKvh98ePnv41OBbgG/VspsVZx+a
S3H3sR8r3r67to7js/1bb+Vvz/tK6gjz82GpI+K1N2sdgd6b6+OHgJ4TnTT6
aHSP6CDRP6JT4veiV4I3HD4f+Hbh8+R8C/Ji8hb87uHPwgPEbx3/dXzX8VPG
XxlfZfwf8UPFBxX/QfwI8SHEzwu/B3y9hnQVHZCpu3ej9DFan9gh/YuPPhS9
j8GXuMbz6ktc/xOpu03pV6Xujs/UeV/qbvwjuD4+EujG0ZGjH0cXik4UfSg6
LnRd6LnghaOfgB8OnzJ8npxTQj1B/sm5BfCLOb8An3p86/Grx28a/2l8p/GH
xS8Wn1j8GfFrxKcRvzP8z/A9G3CJ6EPNuLyiD40Xfb5V9KEVtg91OlDz1071
ZY1T1Zd19ZsrHK5l8lwhuFY8f/gswbXw3cCHA/8N9Pbo79Hdo5tFR4t+Fp0b
ujf0bvD+0ZegK4Evy/OEN8t5M9Rh1BGcPwH/mnMo8PfH7x+ff3y68e3Grxv/
XPx08dHFvxI/S3ws8YPDHw5fuL/Ki97fXDZqk9P7R5PqHRK9f4Eqous3c7zP
ZL8N6jP55KYtDk82Y+5b7PDkKFfx9oIn41eCfwm+JfgU4FuAXwF6Y/TH6I7R
AaILRA+I3gb9Dbob+NA8T3jRnBtE/Uo9yPki8NM5Z4RzETgngfMR8DfH7xyf
c3yH8SHGfxh/T/w+8fnELw//PHzzWj4rfiym5NXixxK92Fn9WPauKid58lM3
lpD+dq4q6rsye+p+1/cxbef/5Po+0aERnaTvg88Lvi/4veDvgN8DPg/otNFt
o9dGJ4luEr0keiT0SeiS4LvzPOG9c44UeAA4AHkD58+QP7DPoVviXAniLz7x
+MPj14x/M77N+KLik4o/apEyT7p81XRP27ThjeuXLiu9XfNVfCvwscC/Av05
enR06Og/0YOiA0Vnxf0n9FZen4BeAZ0CvnCclwV+gp8b5+rg54YPG+dm4MOG
fxr+9/je43uGLzV+1PiV4f+K7+uaoO5b4us+6sEGfvwzP74+37vCl+BzTbtI
6ln8O/DzwMcDHT66fPT46GDRxaKHRW+G/gzdGToNdBvoNVjv4EDheud8IdY7
54WgS+PcEHz/OQcA/3/8uPHnxpcb31t8cPG/xRcSn0j8IY/VqOr8fs26Kc2c
369ZWSRN/H7PtM0i8XbZLzofe/fVeXioV07HazIzuhx2vCaTNcdrwmvC/wg/
JHyQ8D3BBwX/E/wL8DPAxwD9MHpidMTo9Hg+JYP1jt6F9c5+B34W7necv8R+
x3kqnK/CuSqci8A5CZyPgF85/uX4luMLjE8w/sD4ZuKjiX9msc7POn94M/+Z
rM4f3n4y4uyHzh++V3ZZ5+Ylv+5L99f13u90fscbNLdNG+d4g2b/0j+EN4hv
FD5S+EfhC4NPDP4w+Dvg94DPA/pq9NborNExomtEz8h+hx6I/Y58D9wxzPfQ
95DvcQ4N59JwHg3nRnCOBOdH4OeOvzu+7vgm46OMfzK+oviM4i96wTA5H8Tk
zpHPnQ9isxVdJueDzPb5dtFOGl+7+bhadt0Qx9c1i6YKX9fWuvsP4evit4X/
Fr5b+Ongr4OvDv4X+GHgg4H+HD06OnTyPXSfDYJ8j+dJvhfUOzZJvZPQPXF+
D7pPzvHhvA3O31gS1Dv43+N7j680PtP4S+O7ig8r/qvDf5Lznszq8xoI3+fT
3HfIeU/Um9/7fexvv3/ds1J48ub16+91/D57dH1+4cnjU4ZvGX5l+BDhS4Qf
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
OEmyPgXfC/fZZP2L/wffSXhR
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.7], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
BWuwVK+/MO+1RBqGi/JeS6QxGJf3OJYW5eq855u0K5fkvdZKl3Jj3nNJGrab
8p4n0qpNyHv9lv7tmrzHq/Qq1+Y9T6R1GZ33+ioNzPi8x7F0LDfkPfekq7k+
7/mmGrTiXGmBzg2OfaQROi845pXG6cLguEz16JnBsY/q1C8F52YWwN8NjstU
p345OJcjLcr84BhN/uqVbM5q7jwfnJuR1uWd4LhMdfN5wXGW9g7aQygOUv36
xWC/Jz/2XubTtJdZFpyXWg7/PDi/JR3IouAcmLQuHwbnuqQb+SA4T/Y5/NPg
XNoX8KXBObZV8K+Cc29fw1cG57q+gq/I5r7WjreCc2Yr4V8G58lWw1cF5+SW
wT8LjmGlPXg9OIaVVuGN4JhuDvzN4DhRmrozgmNhaedODc79KNd6ZHC8LJ3b
KcFx/XD48OD4fQR8RHDsKZ3emcExrzRdFwTHePK9NYNjXum7zg/ev0r7NzJ4
XytN4FnB+byl8E+CY/ya8BrBWketC9LLaL8izWqT4P3xJfCLgmNb6SuezXy+
1oWmwXsa6VoPDN6jqJ7SMjg30B7eLnhvofpL2+B9j9aXA4JzBqqnHB681nSA
tw9egxSrtIIfje/9Cr+7InV+/xuwGjTn81Ul1506lV3Hf1e13pJrTr1A57Jr
9AuyGu0M7EtZTfdZ7PSshvcwdmpW952m2nFWZ52perDqFmCkcvUl16VV116U
1SYvxF4C2pddQ38d3qFsPcBbWS1zNHZMVnc8F3tBVm9+TLlz1TzL1k7MzeqL
96rGXXLN8izdL9jKMzfEHlh0XXZ/bAMwI3WtbKRqEEU/u2ptXcqu139GW9ey
6/7L4Kv47mPVHxLX2g4v+7m+Tp3Pz9O+OnWeP0lc3x3P8ddnNeN+eo6sZnyi
6r9FaztqYGsXrQWpg61XtP5jb2z1rBbbSt9n9do22Hagseq6RfeXaq4D4YOz
+m57/Q58k7puUk5cr72Ttnuyuuwk7B2q2XJMPVA7g2qbdVLn+U7Ocn2qMdcA
1UHN1HVP1WFVt95HtUywR9l6mKvAYXxuAT7i/JOLrlM+UHQttS3Ynr1rtXXH
HguOA3/T3hXbLXVe+UG9u6wm2ir1WNJvVAOtDw4AB6euk6rf65StM3km8TVb
ZddQXbV1VsevltWUx4MaZWtp7gLVy9bS3Ja4zjMiq/Wodn4Dv5sArkutUVEt
VbX8PUG11PXvm/n+VvV3ao3KWuVAy9aEDAE1y9YC3SddTHZfegenY5uppott
ij0IjID/zm/2kR5B+gDs3mCu6v1la40mqv6c1cRVw9L47ZPN38acowFoCB7K
am1/cc6eZdfUngLfpq49VdbGAjTN6lnqgwFZn6jefK6Oy/L8/VP3jzQN7Tm2
U+J25f770d5B9WjQK6upTwIFjdWS6+yqpdyeuta5FNyfWgf1m+oLqWujy5Xb
SF0bnQ1uSl0/nat9f+q66psFj1WN0z6ptSyNuJcmYELq+sT87Ji+qce47q9/
Nq6kTxqsOlj2vP/IZ/Dd73xulNXXT09dlxxWsPZlDc+xDpyRus6heSHdTFV+
U03aqcRzpm72Hjqqpq9+Tq0J2VzwGNfY1zV7p9YO6FhppE7i98MTj/2h2fvW
PQ3I5sXA7N3qeGlNOnNsl8SahT0T6xakKeiR6QqkFeuKPQpMTu0Ht4H7UuvK
1oN7U+vNfgT3pK7/7sH57k5dF95Nc7fsWnBL8GB2HvnSu1LXgneBz0qtiRoL
n5haj/QPx92c9YWu26jkOnLkmBZl67JqqSaaWge1gfblqevIf8K7la2/WgE/
qmx91Gr5i7I1USvhPcrWQd0KlqbWVv1M+7LUWqnf4F+krlP/AX+Md3E4n6di
b0mtP/lPdYiSNSfNOeaa1DV0jflxqeudqnVelroGpvrXpalr9JPA+alr65eC
aiVrS1TDHJ26/n6zkjEl6zdU93sotdbloKI1KFelngvSJPWirS/oV7J+TH7g
+dS+XvP6ydSat+7yaWVr1Y7SM6T2WZq/0vH01DoDtqfW4zUE/6bW42mOjC05
BpDPlC/fVrI/75CNSY3dIWB14lrkifBViWtzQ+HfJq5XDoZ/lbg2p3tskq2z
0r01K/oZpdurUvQ4GcTxKxLX9TSO/srGRuC7XNFjQ7q6rqALOFlzMPW71Rp9
StHvZC3nWJO4fnqwxlPRfXcWx/6ZuNYs/ZASZOpf6Yq2FzwmR2k+Ja5NSztY
tehxLs1ftaLHv/QKm4seM6rf75jYT16RWiuoGu7lqfWEql3uUbL+UDVi6TN+
L3rs7c9v6ifWhKh/mmd9JI3gUUX34zbwd9H++crU2kXVi7Umy5fIh/3Hb7Yn
ronfn62pWj/kt2PimES6gULiOET6ia1FzyPpAyoljgGkJygljk+kA6iXWMdy
ZubTNLY3SfeQuBYsHUP/xLom6VR+yvzG8XwemFjjJM1KUdcpWhO1LLHmStqX
DZlvlw/YkvW15tC8zD9Ls9InsSZK82xFwTocaUdGJdZ1aP2bkFjLIc3KDYm1
GVrDr83WceljRibWhEhn83vmb6WD+TxbU6T1OD1b06WteStbU6SPeS1bU+TD
lyf2+SN4Jz8lro8Pl59MXH+XlqJtYm2VdBitE+tGpM9omVgrcrbmVGI9w6nw
DYnr6afI9yaufY+Eb06sf5Au58nMz2jt7J35+Tf5fk5ibZvWpk1Zv0grMzHz
P9LTPJJY06JY4KHE8UCfbO3T+JH27Y3EOjr1821ZX1+bWmerfcH4zNfp/Us7
Uiexrkna4vewCxPrm+dh5yfWJu4AKml9LVuj+FJiPfEtieOo/cu+tq5bt2w9
6nSwe9la6MtB1bL10qPBbmXrqy9MrHHcFVQBubI1ye00dsvWNmuN07l3TK3r
K5atc9Z6J93z1dnYyJetYVasUihb56x1U1rnS7N7kDb6isSxa72ytZezEmu4
n83uWZrvaYljywM4pgGoX7beWnpBaQWl3dwdVE2t856RvZMjU+sGVRPvnFqj
qFi6zO8rlR3L7cznhmX3uTTlM7N7eDSxZlvnb1S2/lNxoPTZ52XvSvrsi7J3
KB327YljWs2RV7P3r/F/fzY2pOG+O3EsKl1pCkqptcJFxWyp9eWL+P6jxLqr
L4tei6VVWlX0+itt1jdFr8vSNn1R9F5J2qalRe+hpA+bX/QeU/qw94veV2ov
9UnRMbl0YB8UvTeUvnle0Xs6xf8PFR0bK7bZN3GcI51TTVAjsQZuY9Hxg3R1
ZWzlouOiX4qOB6SxnlP0vnJMto7L/0iH/UbRe892qfcm7cGHfF5c9P7lotQ6
ZOmgKpetmR8EVtO2Q9m+cKeytfGK33bOdGXyM7uWrck/V+O0bJ380Gyefpp4
zdX/BiyGf6K+5FqxZJ1V47L1wJprTcrWCasvpN1X0eU/7MFl69grlaytz+n3
4JLUGmnprBQ7bs9i3APL1iFrLjctWz+s616cWnctHde6xGuutBhPpNbeay2e
mlozLD+fK/k+pUtan9inSeOzJLXeW/mBvxL7QOl6tiT2ddL1bE28RkvXsya1
/lxx9Xep9effafyk1pzP0nhJrfHWXvX71P2qPv0n8TouzdTPiX21NGjPZfGS
4pCPU+vYlZf4OnEMI+3J4tR6eOUQXkqtbdb++svE8Yk0LC+m1j+31DhNrXtX
DqQ/z/1C6rhjY2LfLq3TutSaTI3Jo1LnB7Sf+yO1Pny3xPr8Q1Lrfa/m2HHg
GvBmao20cgKvpdZUKw5cmFrTrj1767KvOx3MTa2xV/5kdmqNt+K911PrrpVn
+EtxTuqxOi+13l65lOPL9jPyYW+k1nIrbyCt57qC961bUs83zbVNqXXsOyf+
34BdsmdZmTj2kzbnt8Qxg/RiraS/5zdTwJzU/yNwTjbf/y06Vjm1aB24ci+b
U/9vi/ZQL6fWsSt38W/imEf6uJmpNe3Ke+j5lbvRb79JHKNK/6XrPZy6vz7Q
eE8df71Scg1iW+ZLpmT+RHmxL8F2tZWcK9O8X5n6XpdkPkD9Iz/waGptvPaz
HUt+RsWt6kflF6TBXp/6fyt0zg2p47OQzadhWRw7LbXefi/5utT/N6G81qup
/y/gaPmd1P8rodzau6n/P2IceCr1/y8oL/RYaj3//30d/OfUcf5xZT+7+v+d
1P/7oH3Zj4ljGGkqe5ftu7T+PJ36/xqUg3ov9f9EKNfxXeI4X/qs7xPH29Jk
9S07L6GcxILU/zehvMf81P83oXzXs6n/P0J5tmdS/1+A8lr/AzN/K1E=
                   
                   "]], 
                  Polygon[CompressedData["
1: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
PUfT7hj/G7mHfITv0fHbiX9iP7AvmJljZgGzgtnAS+3wSXImb3CtTcoK0AJt
8AHnu1zdjnt9uwz/NAag+D8+azhj8nhwAjgRvE/FpbR/nbZvgPeQL0Z+hf1X
wd+0+Qf821dhop9Sfw3171P3gc+Tst+p+wtU7L9F/fnUP03dM+APyr8AX4M/
wYfUX0n9/6h7t4yt/hJ4tbbZ9bE8VfdHfS+e+4/6WP9DzvBN6t+u++tJlJ0M
TgGngt6AXLPX2gfb8H8/aFfxLDcCWyF/g7w2++tojyN/oe2k7Qk2Rf4YeRnX
ejBvJ/zSAmwXBJtR/6k2urZ1J5zb3c1wdHJxG1H/LvULU7cI2Bj5feTF2F+8
k7W+Wb8r1/zzqV+E5/EndX+BHZB/of02NZ/1ofZGMzZHW32E+u+oX4+69Tvh
3kblPKMNCAenj+yaZjhBfWdvqy81ozONdJ5Vf2tGhxub+h0532+cb3v/GwxG
/kreg/01wZvI53J9T/CunrSPIJ+N/Cj7j4HT+M/TwRngzH58IPL68vtTtuI/
uEbesRF+9HT9S/Yf2n0AjuaYY8Cx4DgwFWX3cMx9tD+mFR35piI6tbrzqxx/
Ksffw3/fC4YjT4/8pO9C3aUT++bKTvyN2hs3yIM2Yn/pc3ua8z/biC/uSI6f
nONvcd0GRyFPhXy78xIYm+c6DhgXjAfOpH4+6j+lboRzO/LcyB+x/7Fzu3yd
/Zv9d8GE4NpmOI791Kc4xwRgQjAReI32p+vL414eAMcjz4j8jPMmeB35TOSH
qHu4zFj8Bnxfj8kTO/H/ndyJvn5cJ/7B48HwTuaGH2j3cz9zxOad6Pdbgi3A
Q87XzuGd+A/Pot3Z4Bxwbq1bj6y5NHVsfSbncT8XNOJL2Ynr+4P+shPlO4ML
kBfjev9h/1+vBXlm5Oddx8AoXlsz/OzGrh+ccwYwI5gJnED/XIr6paj/mfd2
H+0fdI7txN/5KnjD59KJfbcz5/+L/9/FdRnc5fxsHwJ3238dv+DtTuzdL2h/
G9fzC8/yV7Ay/7kKWBWsBr6n/l7qS87ZBWdxPRtwPetzPb1WfKb6TvU5z96K
T1DfoD7VOZEf4fh9Oe8u6rBsL6X+gGZ8sNuxfyZYv7ZPqlZ8svpm9TEOUh/g
+D05bgjHX1vGp61vWx/EbNSfUds32i/yG+fWfMo2tb2zJ/Ikzej0z/H81uae
1gHrgvXAo5z/QM67K+e/le1e2mC0n1T9hP3TwBq1vVq0Yr9qe25W2zPntcP3
yN9MgHx2O/b85o3Yt9oQ2hL60J7l2If4v934n535vyvZ3oO8JtstkI9je2o7
9rH2UrO251er7R/tW32M+hr1Mf6Pum05bkuO25rtNuBBzrcz8k7sX+ocxTEb
NPLOfHf6MPVl6t+Wz5DfkMuT05MfuZfj1+W4LTn+ROc0jl+zkWfgs7iP+g0p
H0z9qWV8QHvX+sJMvm+wIvsrUnYKdQ8hL4+8vDpXOz4i9Yt9KJvF9wtWYH8F
dVTqHm3lWfsMfBYPtsJdyVeciHw//78p/7sV/38m20W1B9juhjy0ig2lLnJU
EdtKG0pd5egitpU6oLbLrkV0w+vUaZCn9h7a0UG1ZXYpopteq47jXOs1U385
/78s/zMG/zkmuF4dh/pp7JPUvyYH0gyHPoJzTOjcRPsjGTtHgWta4ZLklPam
7RWcb3nqx+Zc44DXi/hzf3YMUX8n9ZtRvzx1K4ArkVdCHo/98cFVrfRV+7h9
fWL69CRgUjDZgOjY2q67FdG9p1J/UN/nWi7Sf9CKf3Zax3A7OrG26fZFdOX7
kZdU16V+OPUPtDIXLYl8fDtzkv7YsYrMVdrI2pKHFDU/3ooue1gRW1mbWVv0
0CK29B3cz8ZczzLcy7Jl1gTXuiOLrBVj1f1vduRz2rGh1SWPKWJbL809LgOW
BcuBp1rh0hyDjkXXTNe204usperU2qYnF9G1tUnV1U8oYqtq02qrHlzE1tWm
1RY+qIitq09Z37IxAR8VsZEfU9ctYjs/3cpc4BzkXKTNrW12UhFbXBtbW+DE
Irb3M61wxc4hziUXteJb1qepb1Mft75ufdyfFIkpMLZAn/s7ruU8v7V5frPz
7OYos946vw+kbFTnk17Wh9m0+cvErAxvhpM2luXYXtaTaaj/ge25yD+p2yFP
R/vjelkPp0UeyfaYXtaTqbUxO7GPjMmQw9uec59H/a+ULUT9TBx/jvoZ8gLI
UyGvzjtaA6wJ1gL/cszOHD+E4+dqaWSx34x+MrdzB21WACuClQbEZ6zv2DFi
bMDVrcSKfAp+d/5VX+Mc82sj839TIk8BJuuFezqfNiNp+00j9uQplM2j3iBv
QPtL1Gf0hbKdF3ntdvqzHIrvz/E/OuVLc/4ly/TJLZrpc/bV76i/m7oWY6vt
ePf/abeKMQiuf/IPbJfU58z2ajkw113k1ev18dYiMSwvt+IzOLcZn4O+hMto
P4B2S9F+Uecf5Fl8rsibs70FeQGu/0a2OyLfynZ+tutRvwvb65BnYLsa8sZl
xt/SbDd07mR7Ov+3ZjNjrsX/XSuvR/mq1K/P9jbkhdmuj7w729uRF2e7AfLe
ZfiLB4vE6Ggv3039qpRvTv1RZfRXud7PqP+rlTnTudM5+NUiMSHGhhivpf/d
Ocm5yTn2tSJz4nTNzFnOlcZXyYXKiRrfpQ6lLrZdEd3KNce1xzXktyIxPcb2
GK9mPNbGcoBgU7DZgMzxzvXO0S9TvwzPclXuYc6aY3yiFd1HnUXdxZgXY1+M
eXmb9o+3osuok6ibGANjLMyMlL1V5Jk6f05Z5Fm75rj2uMa8UiReT3/FFI3E
/7lGuFZM2Uj8nmuga6Ec/n/xdlzTylzj22z/LrPmuva6pv5RhG8y7sj4o2a7
8V8Qovtfq8+0Y5Nom4xoxP9gzNQDtP+xkVgq+a87isS8GStlPJdc9GKNxMfJ
UclV2V//bqXPuv9l3d6YK/0RizcS/6V+dV2RMevYdU1xbdFf8WORGC5juYx5
+qpIjJaxWsZkfVFER1BXUKf4vUjMj7E/xvx8XCRGylgpY7y+LBJzNHcza5Sx
SOvzjjcAG4KNBmQNcy1zjfupiD11N8/xZPrrZ2zXaWe9kpNxvVirnfVBztT5
e9N25nc5T7nPJ6rwm2t1E2/0VBU+cF321wd/c/7VXYN78Wc+Q92zYHr2ZwA/
y9+wfbiK/3NzrnELsCUYDH6hfiLKH63i7xwpf8f2kSr+8ceq8IP6P41v+sbx
x/99qd2BPGcVe3OsWt8YrR//6odV/MHHqoeCd2o+Yox+/PMfV4k/GVculu1X
VeITRu/Hv/tRFX/xv9p7xgpU8edfVYUfGY39q9l+S/2/nPdO9gdS9g/yrGyf
q+IfHs72ePBezaeM149//esq8Q0T9ONP/7ZK/MMivcSG/O386VynjdONLadN
57jdroxvwPG7MhgE1uc8G/hcwGvgTfCV/hLwLvgAfNePf2F7sIJ2P+eZUfu6
l3je5dneVWW+H9RNvNg9VeylebuJJ1uQNsOQN+RcG4H7qvDvC3QTb/RAFb55
YfYfZLsIbVbs5T+95vH7iRf4pko8x41V+L4pav781ir223R1/7m+Cv87ac0P
387+HeB3uSdwcxX+b+qanx6V868J+v3EE4wjV832iyrxNyewPQl8yLEnVrFd
tWG1ZRtldDfXENeOA8roIuokazgGwKz1GuXatEUZXVad9mD2Dynje9EHo608
pBMuYOJad52w9tVMXcd+6rORC5ATkBv6u1Pb2r1wned2wt3I4cjNnwW26sSH
d1LNCcgNjV5zj3JEcldyWHLZe3TCZchpqFtPUMYXoU/C2OhrO+G+5cDlyi/u
xNegz0HfwQ2dcFVyVqexf3ontrg2udz3BZ2MPTkfbQfHoFyJnIljcdwyXIk6
nLrbaOBI103wWs1HdvqJj3ijSryJ8YzGO7yNfLg2ej/xEG9ViTdpIy/O9nWv
k+1W3PPW2gVgW32ZlB8BXq75ze0o2x7sAHYER1N3DHizDH+qLmX816S1TlX2
E5/zZpV4Frk+OT+5uu06sW20cdTtlyvD7cnxzcb+QPBbJzqjuuLMZbhFOcb5
Oolh09bR5tH2WbGM7aUOpu61VBlbZ/Lal6fNI7coxyh3t2Mn3IscjLrxnGW4
TDlNuZHdwOz9xDdNRNnEYPJ+4mN+rhL/Jvfs+9cXtV/dn3ao78/rO7UTn9CZ
9fuWe9qvfv/2N2P33+Kc/+snhl8ubljdn+Tk5LLktPTVfFeGq9q37q9yVld3
4qO6vu5/6vb2j3drDkfdXh3/rZoDeqwTDlDu74lOdHd1+Mc74bTU9dX55bbk
kOQu5TD1HfxYRrdXx5dbkjNapsozX6q2z7S1zElYqra51LXVubUFvuxEV1+6
tsXU2QfX42++ej6WO5VD1fcwsgzXJ+f3Fftfg32QF++H+3tQexB5iX64vkfA
XsiL9cN13gf2UI9FvpP9u8rEig8BuwxIzLhryQr9rGWuKQd5L/1wt085Z7nO
9sPdPl7GV6DPQK6r6sYXoE9AXb7TzVom569v0DXNuXHFftYq50i5u5lr34Qc
ntysOoW6xOdlfAH6BOTafivjW9DH0ORcBXixjE6nLvcP+BJ8ijwBdRN24yvQ
Z6DvdkA3vpCBtS9Yn8jr/XCWcpVvgF0HJObcWPPdwD0cMz3lAzjHaL3sG0/Y
76Vsun7iB7vsV2DqfuIx/+F//wXT9BOf2KSuANP2E3/Y1n5ynFYZs47VFV3T
27G39Unrmx7YT3zp+N6Ta38/8aFjqvdoyyCvB2YAM4K9q/QJ+4J9YLJ+4t9+
qhJPO2U/8bG/VIlHnaKf+LWRVeIV7QvT11yqfWJS6tcGE/UTj7p/lT7gu7dP
HFilj9g39NfsW6UP2vfsI8bK7sR5dh6QmFl9y/qo9U3rY9YXrc9ZX7M+aX3X
+oD1/e5Vcy9yML+6JoPz6nvw2o2pfY/9y8CV4H1wObgKXAuu8FmD2+zv4Bbv
wb5rfwaPgPvBQz5Tx5DvEtzleAF39JN7cB/bB/vJQZitn/jkcXj24zrPIN8E
bgU3gMfBU74z8EQ/vnd97vra9cE/DZ5zDgXP9OPr1ieuL1yf99XgOnAjuKYf
X78+fH33+vzl1vWZ6CuRY9d3og9L35U+FH1z+kT0heij07elz05fnT4ufVX6
rPat52fjgz+jbG/2t+jFdzO4nr8Pci7iHS7cj26lXqi+6HqjL8tYlpnsk2DT
TnQ8++IsdV+ZmO3cveh06nIb1H3fMaBuZgyuup71z3Puw3y/cgRl2nqMuv/f
tS7+VS+6/ca17amOL5crp6v+pL6k7awNLTewShmuWM5YLmGNMlyynLK2+K7e
G/uLqh9V0YnlauVstfU3KMOd3l/rY5uU4XrlfLXt13H9V29nu1UZ/U0uWU5Z
7mCnMtyCHIPcyEW9PM9tynANC/Vz/4eC53rRee1b9jHXUmPg5WNeUx/ppv+r
S6hTOB7s/67Fs9fjwZhj5wrnDMeyMenOFc4Zjn1jygfVOr35WeZpbV3m+s3V
Ume/u57v7u0mZlpdV51X2+vPXubD0dk+wPY+7Zh+fKb6Sj/u53n4PuTWzQUz
Ft2YdHXjdamft5d37Lv1flesr2GFWod/ux+fsL7gd/o5fqFe3o12y8v95AyY
K/AKeKsb+8VYqul68Z08UuvX+5ThpuSo5KpOYnsM2yd68R0cXYbbua7Wp6YH
Z4OD6+s/i/2rwYu9+FKuUjcHL/Xim7mujO3renVvvZ7KfciB+D5XAbf7rvvh
2m8rY0sPBbvXNvXllL3Qi2/jMtc38HwvvoiLynBV19f6n/qe653rn7qnOqhc
zPq1bS4nczplT/fC9Z9W5r/Wrn03/uenlH1Sr6+flLEtv63X0/9fP0fU+pX6
xRf1evpVvR43uuHs2vX6e7PX0Ysv6KYy3JccmFzo1GXsmRtqfVL9VV/S6jWX
uW7Nba5c+87kOOXW7qj1X3UouRrX95ccS734nvRBaQ9pP+nL0KexaRX76Aj1
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
ynD2cvX6ADYr4zPQVyCnv1EZjl9uX85/vTI+ALl/OX5zCY19/BbcW6S/G7u9
ZpFvsehL0uejr0efklycHIzcy8xs52xn/jbH31x/jZdva/vZNcpYmO9qfkG+
YZIqnIdchxzQRFU4FbkUOZCJa3tc/kG+wtgZcw7kK4yhea7WOdU19TGZ++o3
jPx2kTmwy7YT72dOrbm173UTA6Dv35iSDduJFzYnzdy0j7qJAdD3b8yHsTfm
fBqLYwyOfIn8iPa2fIvfgmrU/Iv2uLFd5rDKtxjjZayVfIV8i/yLsV7mgBr7
ZczXgu2sX+YMmjvot5f8JpTfgvIbTAu3EwtvTLzzzULt6Afm5JmbN3oVzkmu
SY5K7kcO6JK6/4xZhcOSu5Kj81tWzZo/2FE9oAqnJZclZzR2FU5PLk+OyxzU
VxuJETRW0Ngkc4SNXTJGaYN24ufN4TOXT12uV/Md6nTGHplDYiyRMUjqflXN
b6gDymeMUfMH8iFbtBOPbU6juY3qbmPWfIk6nLFJ5iga22SM0i7dcJpymbt2
EwuzbD/+AmNijIX6rOaLjImSD3qmF9/ts2VioUbUfI98krEug/vh3/U3qGuP
VfMz6tzyORPU/JL+InVv+R39R+rgi3TDecl1Ler9dhPzYqyLMSfrt5N/YI6k
uZLrtRPPbo6kuZLaQn5zym+DaRPt3g2nK5crZ7tRO/Hk5pCaS7pJO/Hi5via
6+u3xD6sbSO/KbZxO/Hr5piaa7pVO7mk5oiaKzq4nVxTc0zNNd2ynVxSc1DN
RR2zzrcYWCRefoF29Ctzfs399Zsvl2ifFfkWzAtVxoRjwT42bzux3+YAmwvc
rfM1pisS/2rOsbnHOxb5FsI87azfxnhLhOxeJYbD+VGfk99Y8ttQWxX5HsjC
VWKG9LXocxm/jq+dp0h8vVydnF2zDIe1aJWYH2N95PD8xoPf2tqpyLcf/N7e
Z43o5MYpmws3ohEbTpu1qvNVpi8S37tmlZi2tWoO86UqY8yx5Ts0ptjY1PGL
xBr36nyWGYrk2xiDayzrhEVic+drZ30xR9pcaWNYjVWdoEhsqznZhyJvVOTb
XuozxiqPVyT2d88qMTDGvhgjM3c7+q8x9MbSz9/OemYOt7ncflPsMOSNi3xr
TC5WTnau+vlMVoWjl5uXszfnaAnaT14k/2audvQrvzHjt2Y2qhLzp36uPu83
cfzW1zZFvofjN7/M7VqvyLfA/CaYuVzrFvlW2AR1/PS8RfId5G4ds45V/Sd+
Q+1w6jct8m01vxFmLtk6Rb4ddkgVn6++Xn2afhPrCOo3K/I9FL/h4bfIti7y
bY+ZqsQsNur+YSyWPll9scZkyX3Kgb5Uz4/mkB9L88FFvtdS1PkvUxTJfxrU
jv3jN3/89s88VWIGjRWcl+0mVWIctXf04fmNt2G036TI94X+D5PGIAw=
                   
                   "]], 
                  Polygon[CompressedData["
1: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
HuO7aCedFD9CvseiXpNvQKxzNDx+I/G7wm6LdyPqbc88lB1G+2N/z0j2++ys
ZA2IteBQ1J7YPWLvE9tM/yz/f2gUvxF0Z/jrZ8o3gh1Jn8R7n5G8e1lZST0R
dcVF+OQ4E2Ev0gv0Od6R373mGGuO5lHHRq0d6yo2BrtR/9OMZE3KLaZh7Dl0
mDphY/iN49dCf2z8/mMOdgMNM+dBvB2/0fzu5ddU/0Ds6dhd2D1Yk6gh+Fb3
OfLGe2yejVROe6Z872u/R9vp+/g74pf5rN9pn6DT4ifGminfs/Ldrf9XxPHr
wu+M9p90Cn8g9iB+a/iNjj3T+Flj3djutEvMOrasZ8nC88Q5KebEymEp7Xzx
btOHUevIFwe16vF7pOf5leGXbjybMmkXVhkrqn0RXUirokalFVE46v9t3h3a
V/ArrF8s9r48SS3/SHqyDsd6vEv/GX6l+f0jJoNPLkrXHsHe71nG0hj61fPM
EPuiuPWmuT/qC7F/8+vF3ky7xS1g/xN7ALuHfovzId8xYpeJXSF2aNRHxn4V
25htQlv4/RW1P1ZBvyK9jBVif8EasA3pHewX8dPjXCjfOvnGRX0Zeyu2HFuJ
DYs6KvZMbCm2HLtDf6sclTxfQTmLRC1HP2C3xN/N5+xCneiteAZ+l1EhYwXo
ELXISc4JcV7YRRX0z9O/nb2cLqWPM5L1Nj0rWWtjzT0j3xB+w7FhdEesL9gg
bLD2QBpAN8Q5Wo7R7N30aSqZdwl7Js50cQ6J/ZWu4fcwm4Hnoq/peHwmcYXp
2TjPYV9i5+kXoDVxpmVzi72fHU8HYw+MvQUbw95HB7CX4rwR62nkpdnYDGMl
+L0df4tYz/6tjx5OJfvGuuykVhpn7AL99ewG+iH8fCdjYw2Ks3PU27GW8Dll
7E0+xbUvjFzaF8c9A7st/v7G+7DnYo+w8+lLrCubH5vJzqKj2Gxz14jPxn7s
+/yQusealkruKyZ4vq15kjpqbCqpv+ZnJzVV1D2TUkndsiQ7qYGiHhyTSmqt
OdlJbdjTXOfoz469mI79ey8yKpXULZOzkzuSqGdGp5K7nWnZSW2TT/sINj3O
8do5Ock90D2ppN6clZ3cCb1ItfSXstWxqtlJPTM9ldQoz2QntU3ULjNTSV36
fHZSx8T3vJEGZCb7f9QB88xXMmpHdme8e2LuZYtgL7Br6SSWTaPkmOx7m0gT
6BvxA+V72N9tjveoV5x5KC7S5mDzsN5Rn9MQbC72CNYn6mQahM3G5mI3R21g
jruizpP7QZoUezXejd/9/Cbwa63/q2caGO+W8dvoFvoDG4wN1R5CgyhTvpHY
A9rjaRzty0jq0syspIaMWnJvRlLzZGQltWvUsMPlO993sJp9KvaBWK9yJzV5
1OHd+XalAvh9+ou0H6fHqDB2Aa3QXkZLom6Qs585pvocM3yOLvpfU/+oNaOm
wbrqH6e+2BRsOtY56i25qnqWCuaZJtcUuiveZWxNvM/0fayJNJbPUuOL6Qn6
Unwv+SbKN1m+dvpHqQc2AZuItY0aTOwYsQvFLKD5sRbJWygnueeM+85vowbi
e4vY6WJnie2mf4x6Yg9gk7Cb9I9Qd2w89gDWJj6bfF/HfYjczahp/Ib0+8p/
k3YbakUnsH5YB+12cSdFlf1mG8g3Qr6R8pWLvQK7BGsX5/j4beln00ntkiF+
HxivgjVkR2KjsPJiK1IFujIzOd8uYq+g+trD+Y3gVzb8sOuwYdidWGnsMqwO
NhgbjF0cfyPsrH7lEHY46lysHjsUG4Zdwq8Sdj12JzYcKxP1QZzDsCHYEKxk
1M7YX/pXhLAv0pM76c7pyToZ62WerOQeOBOrEWeX+Bvrn0cF05N+8INxH8j3
bt/pZvYNOsff8i12WtyvsaeoLFaA7/lxpyGukXl/1S6EXcg2x5pjZ9OTs1Sc
qWpkJvXJ8szkjPdgKjkvLs9Ozntx1/drruSOOu6qx8S5FL+KT2/2LvOOpOk0
Wv8V9lXKL894/aKpZL2OdXscpcT/Js+lkdOzfBJnlViPjO1j91OxVHJPEfcV
V2Umdx+LM5P7m7jHqZ6ZnAuXZSb3LXHvUi0zuetZyh4XX9DzDY51hgbkTp6l
WtTU7EpzLKdSkVNMX8/Sx7MUindabDt+e9khsY9H3RP3R/z68OtNC+N3G2dS
rJ9+X7HnZyR3pZPSk/NrnGOLmeP3uJeS77/sMrmW0Fbt3z3HJZE79kT6Mc6D
NE17Ck2mHfo74ywRdWXUjPR53DtSZ+2O1D72Uv0/5CsbNR+VivXfs5TwLK08
RyvP90/cM2HV2P5YP6ywZy4be0nsKdgArDhWDquJ3Y7djl2IFY/7I6wr1hXL
h5XHamEDsYHYRRnJ3VTcUVXNTO7FlrCXxvlUexC/QfxKGC+DVcduwfpjRaJm
wC7HumHdsLxx3sLKYh2xDnFtiZWMezCsJ9YTOxcrgVXAumPdsfxxpsMqYj2w
Htg5WFGsNNYea4dlYsWwMlgHrH2U6tge32muuDfxXV5N1WO95ncRv5b8WvL7
W7sgVphtjN2A/Zae1HD1U8n+Hvv8kqjxtZezV7PXRP3xb01TKZXUeVHvPRTv
h/YKtjZbhxoaz8eujPMlex01ilo59iusnH758I07BmxunEf0c6gyVox9Kurb
uPOhFqmkVrkpJznzxNmnE30T+0acO/gUp5qxX2IL43eqX5pqY9/HHoldrF8y
7tZTyXmrVU5Sw0Yt+0d2crZqk5Ocv+IcVj7OpPjb+mvYZ+mOOPvh3bBrY++O
ujrO/HHOijpLux7VjXoPqyJfcbwklaBjWK+olYw3iRo7zn5Yf6yzdkdqTyXM
9XQ8D9s2vgfzHuHXM84pxhtRAzqM9YgaMs7McS7OSurY9jlJTRe13dQ4i2Um
/1uJ/7Fs8vfOlZmcFzrlJLVu1Lyb6Z64j5fvBXYtDU0ld5lxp7km7sni9x/r
NRXXbiFfC2N/aZfi/4zY9mwHaiW2NfsK9iA7Je4JsdFxxo+zIruackW9GXUV
NoOdSb/kTtbsuMyKtS/WwDtor/YcNkuubLoilezJpczfMPYPOhrvuLH1EROf
gTqnkjWxSnqyb8f+fUL/XMqP1dOvZ7of05O9rFB6kityztLfFDWQfN9GrUCl
5XudnYqdZH+gMlh+vnnF1hVXV74f4rvD8sVeil2LnYz6Ie7KxE5nZ8Td67/3
n1NTyf3gquzkLvT2uC+Mu8B4L2mQ8WvjHiLOb+wI6hLrftyHYivivaPB2J3s
W9jqeJ9oSNytsZuiPmUnxr1ynAniHhV7lF0Qd69Yt7jPw+ay8+L+NO4m4h2I
OpTtQW2w+uzG2FPZ0dQVq8GuwwbG81KnVHKG6Mheya6N31es/cbWxO8+PgO1
Nt6JfS3WlVhfqC/2f87rzto=
                   "]], 
                  
                  Polygon[{{1019, 688, 354, 355, 689, 1020}, {2629, 2507, 
                   2508, 2649, 2177, 2176}, {822, 821, 1128, 691, 692, 
                   1129}, {2622, 2621, 2620, 2481, 2353, 
                   2352}}]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0jsvQ2EYwPGXutWtEhERQWwSl0/ARgxMIgY2YmAgEQOjiDCa2Gx8AjYW
fAB31VZLxCYYGNz9Thj+/T1v2pzznJM2j04PTOWFEJb0rWh+153280Oo4hGb
mGMHH9nFL/azPBbCCOs5yVa2ad7cyxUOcZ3j3OIsd7jIQ+YXhPAQ/hY4xade
dOx8xhOe85QXPOMlz5nkBa94yRST0Vlpc4oZpnnNDLO8Zo5Z3nDX8zxGKzjf
Rs+nV23Y8YSrPOACtznDTY5xjYNcZg+7NWdu4QTrOMxS9vHDvTr5wPZoFzby
zff3/FEi+p2e1WCnyugdsyK6HstZyzLWsJTVjLOKCZWYK1jMMhYxzkIW02sP
hXTbEKM1wp6Pp///wy8tckYZ
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3WEUB+D/jUklRbForBRF0VgUi2ksisUuRVF0KRr3Xm2KRlEUGxuL
RbGxKBZFURQbRVEURVEURVIUjaLR7KEPj9857/s658ubG4mHY6EgCAaIJQdB
lLd00EUn7+mmlx766WOQAZ6nBMFH+YHPfGKILwzzlVFG2GWHc874yy2JZuzL
PV6oK6niJTVUU8srwrymnjre0UgDzTQRoYU2WnlDO1G+2/GNP1yR4CxECif6
TTZYZ41VVlhmid/8osL7Z3SwqF9gnjlmmWGaKSb5yQTjHHLAJRf8444ks47l
EeXqMkp5yhNKKKaIQgqIk08eOTzmEdlk8ZBMMkgnjVTG7PjBNlvccM0Dd6fJ
9//hPyRLSZc=
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3WEUB+B/luQuY1EUxY1i0SiKosSiaCwVRVG2KJZ706IoNrYURVEs
NjaKxqIoiqIoikZRFI2iZCyKYmNRD/vwOL/zvq9zvrzhl9HqSEwQBP10hIIg
yi/iHgbBX/UP++wxxSSP3CXymGSSSCWFdNLIIEwWmXSQzROekkMeuRSQTxGF
nNlxSkgOuJOvuOSEY74xzQzfmWOWBeZZYpEVluk0p4Ri1vSrbLDOFpv8YJtd
djgnwftYHnCjv+YrX4g4a+c1bbTSwiuaaaKRBrqop45aaqjiBc+ppIJyynjG
TzuOiJdv1X9c8JtDDvjMJyb4yDhjjDLCMEOUmjGoDvCB97zjLX300kM3XbwJ
/f8P9xBYSZY=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPGDMGOQiLwiiTyykCSRQeP9aIwxGKTsRCQrexYWytbehk+A
lY1PQGRtIWtbxW+y+PU/957bOffcbsvOYeogL4RwxlBhCMOMEGeMcRJMMMU0
s8yxwCK9JSEkdYll0mRYZZ0sm2zREQ2hkxmmWSXDtrke7abPerFICP3aogM6
oIM6p0O6rXE91n2d59J4UW81qY+a0hdN66dm9LU4hDeW7ZVigyzjJGiimQYa
qaWOamqopCp3Dmt1sUeZ63JilBIhSiFF5FPAr3cIem3/EV0iyTpr/OTOpaO5
Pax75LkCjeu3exX6oR9FITzrnW6ZfzI+Nb7XBb3Rer3SL9/2XB/0RC90V3f0
3Xrtxm2skKaVyej///AHD4cymQ==
                 "]]}, {
                
                Line[{706, 1016, 479, 705, 1131, 927, 707, 1132, 928, 708, 
                 1133, 929, 709, 1134, 930, 710, 1135, 931, 711, 1136, 932, 
                 712, 1137, 487, 713, 1138, 933, 714, 1139, 934, 715, 1140, 
                 935, 716, 1141, 936, 717, 1142, 937, 718, 1127, 1143, 938, 
                 1017}], 
                
                Line[{720, 1030, 1232, 719, 494, 721, 1144, 939, 722, 1145, 
                 940, 723, 1146, 941, 724, 1147, 942, 725, 1148, 943, 726, 
                 1149, 1031, 1233, 727, 1032, 1234, 728, 1150, 944, 729, 1151,
                  945, 730, 1152, 946, 731, 1153, 947, 732, 1154, 948, 733}], 
                
                
                Line[{735, 1033, 1235, 734, 1034, 1236, 736, 510, 737, 1155, 
                 949, 738, 1156, 950, 739, 1157, 951, 740, 1158, 952, 741, 
                 1159, 1035, 1237, 742, 1036, 1238, 743, 518, 744, 1160, 953, 
                 745, 1161, 954, 746, 1162, 955, 747, 1163, 956, 748}], 
                
                Line[{750, 1037, 1239, 749, 1038, 1240, 751, 1039, 1241, 752, 
                 526, 753, 1164, 957, 754, 1165, 958, 755, 1166, 959, 756, 
                 1167, 1040, 1242, 757, 1041, 1243, 758, 1042, 1244, 759, 
                 1168, 960, 760, 1169, 961, 761, 1170, 962, 762, 1171, 963, 
                 763}], 
                
                Line[{765, 1043, 1245, 764, 1044, 1246, 766, 1045, 1247, 767, 
                 1046, 1248, 768, 542, 769, 1172, 964, 770, 1173, 965, 771, 
                 1174, 1047, 1249, 772, 1048, 1250, 773, 1049, 1251, 774, 
                 1050, 1252, 775, 1175, 966, 776, 1176, 967, 777, 1177, 968, 
                 778}], 
                
                Line[{780, 1051, 1253, 779, 1052, 1254, 781, 1053, 1255, 782, 
                 1054, 1256, 783, 1055, 1257, 784, 558, 785, 1178, 969, 786, 
                 1179, 1056, 1258, 787, 1057, 1259, 788, 1058, 1260, 789, 
                 1059, 1261, 790, 1060, 1262, 791, 1180, 970, 792, 1181, 971, 
                 793}], 
                
                Line[{795, 1061, 1263, 794, 1062, 1264, 796, 1063, 1265, 797, 
                 1064, 1266, 798, 1065, 1267, 799, 1066, 1268, 800, 686, 1018,
                  801, 1331, 1019, 1020, 1330, 802, 1067, 1269, 803, 1068, 
                 1270, 804, 1069, 1271, 805, 1070, 1272, 806, 1071, 1273, 807,
                  1072, 1274, 808}], 
                
                Line[{812, 1182, 972, 810, 1183, 973, 814, 1184, 974, 816, 
                 1185, 975, 818, 1186, 976, 820, 1187, 977, 822, 1129, 1188, 
                 978, 1023, 1332, 1022, 587, 825, 1189, 979, 827, 1190, 980, 
                 829, 1191, 981, 831, 1192, 982, 833, 1193, 983, 835, 1194, 
                 984, 837}], 
                
                Line[{836, 1287, 1084, 834, 1286, 1083, 832, 1285, 1082, 830, 
                 1284, 1081, 828, 1283, 1080, 826, 1282, 1079, 824, 1130, 
                 1281, 1029, 693, 823, 1021, 1028, 1334, 1128, 821, 1280, 
                 1078, 819, 1279, 1077, 817, 1278, 1076, 815, 1277, 1075, 813,
                  1276, 1074, 809, 1275, 1073, 811}], 
                
                Line[{839, 1085, 1288, 838, 1195, 985, 840, 1196, 986, 841, 
                 1197, 987, 842, 1198, 988, 843, 1199, 989, 844, 1200, 990, 
                 845, 1201, 1086, 1289, 846, 603, 847, 1202, 991, 848, 1203, 
                 992, 849, 1204, 993, 850, 1205, 994, 851, 1206, 995, 852}], 
                
                Line[{854, 1087, 1290, 853, 1088, 1291, 855, 611, 856, 1207, 
                 996, 857, 1208, 997, 858, 1209, 998, 859, 1210, 999, 860, 
                 1211, 1089, 1292, 861, 1090, 1293, 862, 619, 863, 1212, 1000,
                  864, 1213, 1001, 865, 1214, 1002, 866, 1215, 1003, 867}], 
                
                Line[{869, 1091, 1294, 868, 1092, 1295, 870, 1093, 1296, 871, 
                 627, 872, 1216, 1004, 873, 1217, 1005, 874, 1218, 1006, 875, 
                 1219, 1094, 1297, 876, 1095, 1298, 877, 1096, 1299, 878, 635,
                  879, 1220, 1007, 880, 1221, 1008, 881, 1222, 1009, 882}], 
                
                Line[{884, 1097, 1300, 883, 1098, 1301, 885, 1099, 1302, 886, 
                 1100, 1303, 887, 1101, 1304, 888, 1223, 1010, 889, 1224, 
                 1011, 890, 1225, 1102, 1305, 891, 1103, 1306, 892, 1104, 
                 1307, 893, 1105, 1308, 894, 651, 895, 1226, 1012, 896, 1227, 
                 1013, 897}], 
                
                Line[{899, 1106, 1309, 898, 1107, 1310, 900, 1108, 1311, 901, 
                 1109, 1312, 902, 1110, 1313, 903, 659, 904, 1228, 1014, 905, 
                 1229, 1111, 1314, 906, 1112, 1315, 907, 1113, 1316, 908, 
                 1114, 1317, 909, 1115, 1318, 910, 667, 911, 1230, 1015, 
                 912}], 
                
                Line[{926, 1027, 698, 925, 1329, 1126, 924, 1328, 1125, 923, 
                 1327, 1124, 922, 1326, 1123, 921, 1325, 1122, 920, 1324, 
                 1121, 1231, 919, 675, 918, 1323, 1120, 917, 1322, 1119, 916, 
                 1321, 1118, 915, 1320, 1117, 914, 1319, 1116, 913, 1333, 
                 1025, 1024, 1026}], 
                
                Line[{2007, 2005, 2337, 2336, 2004, 2001, 2608, 2000, 1997, 
                 2607, 1996, 1993, 2606, 1992, 1989, 2605, 1988, 1985, 2604, 
                 2648, 2603, 2320, 2319, 1979, 2599, 1978, 1975, 2598, 1974, 
                 1971, 2597, 1970, 1967, 2596, 1966, 1963, 2595, 1962, 1959, 
                 1955, 1958, 2364, 2365, 2367}], 
                
                Line[{2009, 2008, 1337, 1335, 2011, 2010, 2396, 2013, 2012, 
                 2397, 2015, 2014, 2398, 2017, 2016, 2399, 2019, 2018, 2400, 
                 2021, 2020, 2022, 2023, 2401, 2403, 2025, 2024, 2404, 2027, 
                 2026, 2405, 2029, 2028, 2406, 2031, 2030, 2407, 2033, 2032, 
                 2035, 2034, 2348, 2346, 2349}], 
                
                Line[{2409, 1377, 1380, 2410, 1381, 2411, 2038, 2037, 2412, 
                 2040, 2039, 2413, 2042, 2041, 2414, 2044, 2043, 2415, 2046, 
                 2045, 2047, 2048, 2418, 2610, 2419, 1401, 1404, 2420, 2051, 
                 2050, 2421, 2053, 2052, 2422, 2055, 2054, 2423, 2057, 2056, 
                 2424, 2060, 2058, 2611}], 
                
                Line[{2425, 1420, 1423, 2426, 1424, 1427, 2427, 1428, 2428, 
                 2064, 2063, 2429, 2066, 2065, 2430, 2068, 2067, 2431, 2070, 
                 2069, 2071, 2072, 2434, 2612, 2435, 1446, 1449, 2436, 1450, 
                 2437, 2075, 2074, 2438, 2077, 2076, 2439, 2079, 2078, 2440, 
                 2082, 2080, 2613}], 
                
                Line[{2441, 1465, 1468, 2442, 1469, 1472, 2443, 1473, 1476, 
                 2444, 1477, 2445, 2087, 2086, 2446, 2089, 2088, 2447, 2091, 
                 2090, 2092, 2093, 2450, 2614, 2451, 1492, 1495, 2452, 1496, 
                 1499, 2453, 2097, 2096, 2454, 2099, 2098, 2455, 2101, 2100, 
                 2456, 2104, 2102, 2615}], 
                
                Line[{2457, 1512, 1515, 2458, 1516, 1519, 2459, 1520, 1523, 
                 2460, 1524, 1527, 2461, 1528, 2462, 2110, 2109, 2463, 2112, 
                 2111, 2113, 2114, 2466, 2616, 2467, 1540, 1543, 2468, 1544, 
                 1547, 2469, 1548, 1551, 2470, 2119, 2118, 2471, 2121, 2120, 
                 2472, 2124, 2122, 2617}], 
                
                Line[{2473, 1561, 1564, 2474, 1565, 1568, 2475, 1569, 1572, 
                 2476, 1573, 1576, 2477, 1577, 1580, 2478, 1581, 2479, 2133, 
                 2131, 2134, 2135, 2482, 2618, 2483, 1590, 1593, 2484, 1594, 
                 1597, 2485, 1598, 1601, 2486, 1602, 1605, 2487, 2141, 2140, 
                 2488, 2144, 2142, 2619}], 
                
                Line[{2489, 1612, 1615, 2490, 1616, 1619, 2491, 1620, 1623, 
                 2492, 1624, 1627, 2493, 1628, 1631, 2494, 1632, 1635, 2152, 
                 2153, 1636, 1638, 2379, 2622, 2621, 1642, 1639, 1643, 1646, 
                 2496, 1647, 1650, 2497, 1651, 1654, 2498, 1655, 1658, 2499, 
                 1659, 1662, 2500, 1663, 1666, 2623}], 
                
                Line[{2501, 1667, 1670, 2502, 1671, 1674, 2503, 1675, 1678, 
                 2504, 1679, 1682, 2505, 1683, 1686, 2506, 1687, 1690, 2176, 
                 2177, 2356, 2381, 1691, 1693, 2359, 2630, 2383, 1694, 1695, 
                 1696, 1698, 2510, 1699, 1702, 2511, 1703, 1706, 2512, 1707, 
                 1710, 2513, 1711, 1714, 2514, 1715, 1718, 2668}], 
                
                Line[{2515, 1719, 1722, 2516, 2196, 2195, 2517, 2198, 2197, 
                 2518, 2200, 2199, 2519, 2202, 2201, 2520, 2204, 2203, 2521, 
                 2206, 2205, 2207, 2208, 2524, 2637, 2525, 1744, 2526, 2210, 
                 2209, 2527, 2212, 2211, 2528, 2214, 2213, 2529, 2216, 2215, 
                 2530, 2219, 2217, 2638}], 
                
                Line[{2531, 1762, 1765, 2532, 1766, 1769, 2533, 1770, 2534, 
                 2223, 2222, 2535, 2225, 2224, 2536, 2227, 2226, 2537, 2229, 
                 2228, 2230, 2231, 2540, 2639, 2541, 1788, 1791, 2542, 1792, 
                 2543, 2234, 2233, 2544, 2236, 2235, 2545, 2238, 2237, 2546, 
                 2241, 2239, 2640}], 
                
                Line[{2547, 1807, 1810, 2548, 1811, 1814, 2549, 1815, 1818, 
                 2550, 1819, 2551, 2246, 2245, 2552, 2248, 2247, 2553, 2250, 
                 2249, 2251, 2252, 2556, 2641, 2557, 1834, 1837, 2558, 1838, 
                 1841, 2559, 1842, 2560, 2256, 2255, 2561, 2258, 2257, 2562, 
                 2261, 2259, 2642}], 
                
                Line[{2563, 1854, 1857, 2564, 1858, 1861, 2565, 1862, 1865, 
                 2566, 1866, 1869, 2567, 1870, 1873, 2568, 2268, 2267, 2569, 
                 2270, 2269, 2271, 2272, 2572, 2643, 2573, 1883, 1886, 2574, 
                 1887, 1890, 2575, 1891, 1894, 2576, 1895, 2577, 2277, 2276, 
                 2578, 2280, 2278, 2644}], 
                
                Line[{2579, 1904, 1907, 2580, 1908, 1911, 2581, 1912, 1915, 
                 2582, 1916, 1919, 2583, 1920, 1923, 2584, 1924, 2585, 2288, 
                 2287, 2289, 2290, 2588, 2645, 2589, 1933, 1936, 2590, 1937, 
                 1940, 2591, 1941, 1944, 2592, 1945, 1948, 2593, 1949, 2594, 
                 2298, 2296, 2646}], 
                
                Line[{2636, 2191, 2193, 2635, 2189, 2190, 2634, 2187, 2188, 
                 2633, 2185, 2186, 2632, 2183, 2184, 2631, 2181, 2182, 2660, 
                 2361, 2178, 2180, 2363, 2357, 2358, 2507, 2629, 2174, 2175, 
                 2628, 2172, 2173, 2627, 2170, 2171, 2626, 2168, 2169, 2625, 
                 2166, 2167, 2624, 2164, 2165, 2653}]}, {
                
                Line[{259, 480, 1131, 260, 494, 288, 1236, 509, 303, 1240, 
                 524, 318, 1246, 539, 333, 1254, 554, 348, 1264, 569, 363, 
                 1276, 582, 1183, 376, 595, 1195, 391, 1291, 610, 406, 1295, 
                 625, 421, 1301, 640, 436, 1310, 655, 451, 1319, 670, 466}], 
                
                Line[{261, 481, 1132, 262, 495, 1144, 289, 510, 304, 1241, 
                 525, 319, 1247, 540, 334, 1255, 555, 349, 1265, 570, 364, 
                 1277, 583, 1184, 377, 596, 1196, 392, 611, 407, 1296, 626, 
                 422, 1302, 641, 437, 1311, 656, 452, 1320, 671, 467}], 
                
                Line[{263, 482, 1133, 264, 496, 1145, 290, 511, 1155, 305, 
                 526, 320, 1248, 541, 335, 1256, 556, 350, 1266, 571, 365, 
                 1278, 584, 1185, 378, 597, 1197, 393, 612, 1207, 408, 627, 
                 423, 1303, 642, 438, 1312, 657, 453, 1321, 672, 468}], 
                
                Line[{265, 483, 1134, 266, 497, 1146, 291, 512, 1156, 306, 
                 527, 1164, 321, 542, 336, 1257, 557, 351, 1267, 572, 366, 
                 1279, 585, 1186, 379, 598, 1198, 394, 613, 1208, 409, 628, 
                 1216, 424, 1304, 643, 439, 1313, 658, 454, 1322, 673, 469}], 
                
                
                Line[{267, 484, 1135, 268, 498, 1147, 292, 513, 1157, 307, 
                 528, 1165, 322, 543, 1172, 337, 558, 352, 1268, 573, 367, 
                 1280, 586, 1187, 380, 599, 1199, 395, 614, 1209, 410, 629, 
                 1217, 425, 644, 1223, 440, 659, 455, 1323, 674, 470}], 
                
                Line[{269, 485, 1136, 270, 499, 1148, 293, 514, 1158, 308, 
                 529, 1166, 323, 544, 1173, 338, 559, 1178, 353, 686, 687, 
                 703, 1334, 691, 692, 1188, 381, 600, 1200, 396, 615, 1210, 
                 411, 630, 1218, 426, 645, 1224, 441, 660, 1228, 456, 675, 
                 471}], 
                
                Line[{271, 486, 1137, 273, 500, 1149, 294, 515, 1159, 309, 
                 530, 1167, 324, 545, 1174, 339, 560, 1179, 354, 688, 1331, 
                 702, 690, 704, 693, 696, 1332, 695, 382, 601, 1201, 397, 616,
                  1211, 412, 631, 1219, 427, 646, 1225, 442, 661, 1229, 457, 
                 676, 1231, 472}], 
                
                Line[{275, 488, 1138, 276, 1234, 502, 296, 1238, 517, 311, 
                 1243, 532, 326, 1250, 547, 341, 1259, 562, 356, 1269, 575, 
                 369, 1282, 588, 1189, 384, 603, 399, 1293, 618, 414, 1298, 
                 633, 429, 1306, 648, 444, 1315, 663, 459, 1325, 678, 474}], 
                Line[{277, 489, 1139, 278, 503, 1150, 297, 518, 312, 1244, 
                 533, 327, 1251, 548, 342, 1260, 563, 357, 1270, 576, 370, 
                 1283, 589, 1190, 385, 604, 1202, 400, 619, 415, 1299, 634, 
                 430, 1307, 649, 445, 1316, 664, 460, 1326, 679, 475}], 
                
                Line[{279, 490, 1140, 280, 504, 1151, 298, 519, 1160, 313, 
                 534, 1168, 328, 1252, 549, 343, 1261, 564, 358, 1271, 577, 
                 371, 1284, 590, 1191, 386, 605, 1203, 401, 620, 1212, 416, 
                 635, 431, 1308, 650, 446, 1317, 665, 461, 1327, 680, 476}], 
                
                Line[{281, 491, 1141, 282, 505, 1152, 299, 520, 1161, 314, 
                 535, 1169, 329, 550, 1175, 344, 1262, 565, 359, 1272, 578, 
                 372, 1285, 591, 1192, 387, 606, 1204, 402, 621, 1213, 417, 
                 636, 1220, 432, 651, 447, 1318, 666, 462, 1328, 681, 477}], 
                
                Line[{283, 492, 1142, 284, 506, 1153, 300, 521, 1162, 315, 
                 536, 1170, 330, 551, 1176, 345, 566, 1180, 360, 1273, 579, 
                 373, 1286, 592, 1193, 388, 607, 1205, 403, 622, 1214, 418, 
                 637, 1221, 433, 652, 1226, 448, 667, 463, 1329, 682, 478}], 
                
                Line[{285, 684, 685, 1143, 286, 507, 1154, 301, 522, 1163, 
                 316, 537, 1171, 331, 552, 1177, 346, 567, 1181, 361, 1274, 
                 580, 374, 1287, 593, 1194, 389, 608, 1206, 404, 623, 1215, 
                 419, 638, 1222, 434, 653, 1227, 449, 668, 1230, 464, 698, 
                 699, 700}], 
                
                Line[{465, 669, 1333, 697, 450, 654, 1309, 435, 639, 1300, 
                 420, 624, 1294, 405, 609, 1290, 390, 594, 1288, 375, 1182, 
                 581, 1275, 362, 568, 1263, 347, 553, 1253, 332, 538, 1245, 
                 317, 523, 1239, 302, 508, 1235, 287, 493, 1232, 258, 479, 
                 683, 701}], 
                
                Line[{473, 677, 1324, 458, 662, 1314, 443, 647, 1305, 428, 
                 632, 1297, 413, 617, 1292, 398, 602, 1289, 383, 587, 694, 
                 1281, 368, 574, 1330, 689, 355, 561, 1258, 340, 546, 1249, 
                 325, 531, 1242, 310, 516, 1237, 295, 501, 1233, 274, 487, 
                 272}], 
                
                Line[{1340, 1338, 2011, 1382, 1381, 1426, 1427, 2062, 1471, 
                 1472, 2084, 1518, 1519, 2106, 1567, 1568, 2126, 1618, 1619, 
                 2146, 1673, 1674, 2655, 2167, 1725, 1723, 2196, 1768, 1769, 
                 2221, 1813, 1814, 2243, 1860, 1861, 2263, 1910, 1911, 2283, 
                 1961, 1962, 2302, 2304}], 
                
                Line[{1343, 1341, 2013, 1385, 1383, 2038, 1430, 1428, 1475, 
                 1476, 2085, 1522, 1523, 2107, 1571, 1572, 2127, 1622, 1623, 
                 2147, 1677, 1678, 2656, 2169, 1728, 1726, 2198, 1772, 1770, 
                 1817, 1818, 2244, 1864, 1865, 2264, 1914, 1915, 2284, 1965, 
                 1966, 2305, 2307}], 
                
                Line[{1346, 1344, 2015, 1388, 1386, 2040, 1433, 1431, 2064, 
                 1479, 1477, 1526, 1527, 2108, 1575, 1576, 2128, 1626, 1627, 
                 2148, 1681, 1682, 2657, 2171, 1731, 1729, 2200, 1775, 1773, 
                 2223, 1821, 1819, 1868, 1869, 2265, 1918, 1919, 2285, 1969, 
                 1970, 2308, 2310}], 
                
                Line[{1349, 1347, 2017, 1391, 1389, 2042, 1436, 1434, 2066, 
                 1482, 1480, 2087, 1530, 1528, 1579, 1580, 2129, 1630, 1631, 
                 2149, 1685, 1686, 2658, 2173, 1734, 1732, 2202, 1778, 1776, 
                 2225, 1824, 1822, 2246, 1872, 1873, 2266, 1922, 1923, 2286, 
                 1973, 1974, 2311, 2313}], 
                
                Line[{1352, 1350, 2019, 1394, 1392, 2044, 1439, 1437, 2068, 
                 1485, 1483, 2089, 1533, 1531, 2110, 1583, 1581, 1634, 1635, 
                 2150, 1689, 1690, 2659, 2175, 1737, 1735, 2204, 1781, 1779, 
                 2227, 1827, 1825, 2248, 1876, 1874, 2268, 1926, 1924, 1977, 
                 1978, 2314, 2316}], 
                
                Line[{1355, 1353, 2021, 1397, 1395, 2046, 1442, 1440, 2070, 
                 1488, 1486, 2091, 1536, 1534, 2112, 1586, 1584, 2133, 2132, 
                 2153, 2380, 2355, 2356, 2649, 2508, 2358, 1740, 1738, 2206, 
                 1784, 1782, 2229, 1830, 1828, 2250, 1879, 1877, 2270, 1929, 
                 1927, 2288, 1981, 1979, 2318}], 
                
                Line[{1358, 1356, 2023, 1400, 1398, 2048, 1445, 1443, 2072, 
                 1491, 1489, 2093, 1539, 1537, 2114, 1589, 1587, 2135, 2353, 
                 2352, 2379, 2154, 2156, 2360, 2359, 2651, 2180, 2179, 1743, 
                 1741, 2208, 1787, 1785, 2231, 1833, 1831, 2252, 1882, 1880, 
                 2272, 1932, 1930, 2290, 1984, 1982, 2320, 2667}], 
                
                Line[{1361, 1359, 2025, 1403, 1404, 2049, 1448, 1449, 2073, 
                 1494, 1495, 2094, 1542, 1543, 2115, 1592, 1593, 2136, 1645, 
                 1646, 2157, 1697, 1698, 2661, 2182, 1746, 1744, 1790, 1791, 
                 2232, 1836, 1837, 2253, 1885, 1886, 2273, 1935, 1936, 2291, 
                 1987, 1988, 2321, 2323}], 
                
                Line[{1364, 1362, 2027, 1407, 1405, 2051, 1452, 1450, 1498, 
                 1499, 2095, 1546, 1547, 2116, 1596, 1597, 2137, 1649, 1650, 
                 2158, 1701, 1702, 2662, 2184, 1749, 1747, 2210, 1794, 1792, 
                 1840, 1841, 2254, 1889, 1890, 2274, 1939, 1940, 2292, 1991, 
                 1992, 2324, 2326}], 
                
                Line[{1367, 1365, 2029, 1410, 1408, 2053, 1455, 1453, 2075, 
                 1502, 1500, 2097, 1550, 1551, 2117, 1600, 1601, 2138, 1653, 
                 1654, 2159, 1705, 1706, 2663, 2186, 1752, 1750, 2212, 1797, 
                 1795, 2234, 1844, 1842, 1893, 1894, 2275, 1943, 1944, 2293, 
                 1995, 1996, 2327, 2329}], 
                
                Line[{1370, 1368, 2031, 1413, 1411, 2055, 1458, 1456, 2077, 
                 1505, 1503, 2099, 1554, 1552, 2119, 1604, 1605, 2139, 1657, 
                 1658, 2160, 1709, 1710, 2664, 2188, 1755, 1753, 2214, 1800, 
                 1798, 2236, 1847, 1845, 2256, 1897, 1895, 1947, 1948, 2294, 
                 1999, 2000, 2330, 2332}], 
                
                Line[{1373, 1371, 2033, 1416, 1414, 2057, 1461, 1459, 2079, 
                 1508, 1506, 2101, 1557, 1555, 2121, 1608, 1606, 2141, 1661, 
                 1662, 2161, 1713, 1714, 2665, 2190, 1758, 1756, 2216, 1803, 
                 1801, 2238, 1850, 1848, 2258, 1900, 1898, 2277, 1951, 1949, 
                 2003, 2004, 2333, 2335}], 
                
                Line[{2345, 2343, 2408, 2348, 1419, 1417, 2060, 1464, 1462, 
                 2082, 1511, 1509, 2104, 1560, 1558, 2124, 1611, 1609, 2144, 
                 1665, 1666, 2162, 1717, 1718, 2666, 2193, 1761, 1759, 2219, 
                 1806, 1804, 2241, 1853, 1851, 2261, 1903, 1901, 2280, 1954, 
                 1952, 2298, 2297, 2337, 2373, 2372}], 
                
                Line[{2366, 1957, 1958, 2647, 2282, 2281, 1907, 1906, 2262, 
                 1857, 1856, 2242, 1810, 1809, 2220, 1765, 1764, 2194, 1722, 
                 1721, 2165, 2654, 1670, 1669, 2145, 1615, 1614, 2125, 1564, 
                 1563, 2105, 1515, 1514, 2083, 1468, 1467, 2061, 1423, 1422, 
                 2036, 1380, 1379, 1337, 2375, 2374}], 
                
                Line[{2602, 2600, 2648, 2587, 2586, 2645, 2571, 2570, 2643, 
                 2555, 2554, 2641, 2539, 2538, 2639, 2523, 2522, 2637, 2362, 
                 2361, 2382, 2383, 2354, 1641, 1642, 2620, 2481, 2480, 2618, 
                 2465, 2464, 2616, 2449, 2448, 2614, 2433, 2432, 2612, 2417, 
                 2416, 2610, 2402, 2401, 2609}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJx0vXlcT133Pl6ZCimRuULklnlKpLNNpQyJDJkTZUopbgklmkxRUUIyJWOG
hERnyxQJaTAkmVKZigZpoN8++6zV9+79ez7PP+fVuc9z7LPee699rbWua+0u
9i5THVSUlJTWNFNSasCuUc9WTLq57V4iXpX4/34Q+692GZNTNcTh1WVlPju1
RLz/cJKD0zfHCaK959ulbn1txL+10v+KSVn28wdWxhtEJ8cPOmbPAsSxcP+7
67MR7VZFiosu9ohalHRJPF8o3/dO7rKhomesqKRb7er68Kn4oOgvvz+155/D
BX6XRT/trrmG2u/FQttqfv/2kt/sqmd6Y+eKH1XN8kX5b/78cfa88G2Dar3n
3/fZ+i97v7DEd6Hbf9//NqqhLhuPoDielmt+hLDxC0f2a+v+d/zKa5M6su8V
Hny8V+979y20ncDsIyjap/nyRk9ubLtnqmhPfA7tivfJzawlQfZzRLxWwfuH
pNy+MHf/PnHMnlXex6ZEiLFV8v2szXtHDnVNFntWq/p+3vtM9B4lf9cw96mB
54y+iB2KH147Z1QlVlmnyO9Z1jyUWNaKl6Ii3xavbUu9RkT8ke4bNz/WxjxN
iQ5/+WjOMuOedJnGw3LpvuUAt+La2gWmtz66FE4070/lv9l7mh/rwJ4nxvD8
Enj+oUr0TvZ+oazQvt77303rv5qNR1Acj0rH8y3Z+IWV5LHPf8cf7d50Ofte
QfF7vTV7le62nyNsUTpQzz777V77M3sKivbEeYnzFH8vfC/aFd+fts/lzMIl
L0W84vxxvLDx1htTVTpyhrXp9EktqOrWgL/S/TDfS+6+HXvRQ00Ej6IwI3qt
05FM6X7jIUN69uszkiY9ON58g/E0uj0lrvtfdl/ngm3vpotG0UNRG16l3nCg
Zj0a2/xm9zUvVMSV1h42DRitNyasuROV/y4m2udt+7PniT88rw/PZx08qM/e
TzI6zOXvvw3v/9d+9zw2HuJ39vw6aTxPYTz9PvQLYuMnHapujZDG3xzGH57p
Yc++U/hkdq3e9+74PaMJs4/QudOGevbxvaBV4drXRlC0J65zXPe4XnBe4jzF
3xftiHZFexaUdRz6oL1A8epjJe6S7tuoebebnWlHf23v03vdKkeqKsr22fLg
SN597TV0gs3K8vvavvR61Iiizex+1JH479tD/6V7p2o03BEaSnMDcks0/xaT
4pFL2vyueWua7NOywCz7IJX/rnueKD7/7tuRN+z9ZEbZff7+5Fj5/WvSTJqw
8RC13xm9pPHMTZbHs2Cuyp/k9gJpM3eLsTT+WZPl8efeuPpx2qQWxGjjQyp9
bwv43ukv842ZfYQjVu/Jf+3TweFD0NhnAYKiPdFPoR9Ff4XrCtc9ri+clzhP
cX6iHdGuaM85Tzx1ottso3jNe5Iw+h6zg335dxPlwkPUdUSHciXnaHrcytrk
eBn7LrNHT382OEIjXaY++tIoniq1qmiW8aKY3Ft4Y9XfO7WmubOME298F6n8
dzE5FpHwmj1P2ljYp0jPqxaU8ucXV5f3Ye8nIf6d+PsvBdvw94cPN2zMxkEW
Bq3UlcaTUnCDj2eSV0Kt+ypHcq29PP7Bb+TxZ/U/YMS+lwzxk793tY78vdsd
Rlkw+wgz96/Z8V/7DNpYNpzZU1C0J+5DuC/hfoF+E/0o+jdc57jucb3jvMR5
ivMT7Yh2RXvezJw88ZBvAsXr9Ixyu8Mni0mTKebq7X/eoL89atu2//mIbtn8
NtJMtZjYqp78RBN0hexD1pczsp9R+e8ifJ4oPt+4dtYo9l5ydowzf79zjw4L
pfcvTb6fy8ZDwiNq+HgKfi3g49E0C33Cxk+0OqnmS+Of0kPg4w+vqk1bbzyN
eGQ86SF9r1Km/L1CU78NzD7EHOwTBPZR+5x8ZdXDp4KiPXFfx30e/Q/uQ7gv
4X6EfhP9KPpPXLe47nH94rzEeYrzE+2CdkX7JKc4N+g66THFq1BtEvDcvIi4
K337cmJHX6HRgPg9K1tlUPnvIjJhxZCm7Dm8Unf95f7S89/Wt2zG3k/8fnzl
7z/qtu+w9H7HRKs4Nh7SsVcRH0/SmhHNpfG8Od0me3toKHE5l/iZjz/6Ex//
2Xbz9rPvJcn35e/NmCp/74Qta38sNe5JFoN9EsE+vc/fWMfsKSjasz5O0jNF
vFR/X19givt7/X3osCnuR/X95ltT9J/113mtKa73+vNSV8D5Wd+OfQW0p7xv
jxTqX9k+/nTgPvY8eVJqx5+Xr0XEXHvOefZ+YuS6IF96v3wtIkaBbQ+z8ZBO
8f1dpfHI12LybUXARTZ+MqDzaj5++VpMXpz9VRza3ImUVcjfK1+Z3droH2f2
IS+4XVxMX4B9vvx8tpLZU1C0J+JOxKFof8RJiJsQL+G+jvu8/v+ezwTnM/pN
9KPoPxXmM8H5jPMS5ynOT7RjfbsWkdRmNZrSc3g9NyHcT3o++1llU2k+Z9uG
aUvvj+jlyedzLJ3A57Njlw8vpPGkehrz+byvXeIraT67uyby8fc7K8/ni8u1
+Xx+dU/+3vcK83kR2Afn8/1xWTif69kTcTzievQniDsRh6J/RpyEuAnxEu7r
uM/j/o77EO5LuB+h30Q/iv4T1zmue1zvOC/rz9OiOjuiXdGev1au4+/F67YN
An+/s3v2G8k/f16V1l8aT9mwRXw8G0QT7p/XBZjkSON3HiP75xMT47l/Dj8i
f29f8M8+VpbcPzcxerVNso+if1a0J+INjJMU8QbietxPEXciDkX8iTgJcRPi
JdzXcZ/H/R33IdyXcD9Cv4l+FP0nrvP66764bl7iPMX5iXZEu6I9n04f0Uga
B159+iXy8TzUaa3Exk9uzbzMx5/ySR7/J8AbXdccmSt97zbAGy2LHo6T8Mbf
tVNd/2ufx9otTCS8oWhPjDMx7kS8h3ERxkl1+BBwPOJ6xPOIOxGHIv5EnIS4
CfES7uu4z+P+jvsQ7ku4H6HfrO9Hi+vWOa57XO84L3Ge4vxEO6Jd0Z6NDCfX
SOPGK7GWx/8O8PMS7Y/8ezUV8PNQq4Va/7VP/oALHD8r2hPjdozjFeNBjDsx
3sG4COMk9D+I4xHXI55H3Ik4FPEn4iTETYiXcF/HfR73d9yH6u9LxXV+E/0o
+k9c57jucb3jvMR5ivMT7Yh2RXvGbEni34lXxXhQ0T66lr15PKhoT8xvYF4E
93GM2zGOx/gd40z8d/D9GBfh74y/L+J4xPW4vhB3Ig5F/4Y4CfcZ3F9wX6+/
zxfX7UOKz6PfRD+K78d1jusex4PzUnH8aEfF70W7KNoH8xuK9sS8EuaZFPN1
+P9TzNdhHK+Yr8O4UzFfh3GSYr4O9w3FfB3iUMV8XX3c9P/ydbjPK+brFN+P
fhP9qGK+Dte9Yr4O56livk7RPmhHRXuuOP79zIDgViJe8X6e1dPo552LEhP2
bHj9tfJrXX7vleq0Mew5QfH5Fd4qZVmdi0wVn1+pU5Vo3eg+xWvJ3FzyUq2Y
bH6w+R77m7hOpfz+Gq8d/D7+jf8d7/v/Med/47XisDG/X9TheoyTKxEmdO5h
+e5+MvxdXPddOF7F7/JUzTVn4zRV/C7F5/E5/D68j9+J71N8XvG+Evzvh2Xl
MDZOejFp1XlpnPg3/ne8X/97iIDfhf+u4njwb8Xvuqbe0vpdQEliAlzx/qGU
5qPn/v1uemed91d2rbuPf+N/V3xe8f7IqE+NLs3MSwzq8u781quv697znUTp
OZa/NLX+qRrT7MOruvvZx9edY/cT12871ordV3yPKbzHVPF5xffg/x//O97H
5/DfVxyP4r8bV3TXfmZHW/G0w/kzTdvYijWwjpp77Q+yb24m/vr466bG7Eli
Ldzv5OJ6b3fnEFHpfmmXu2dCxQ818v0DqgenNpzoJlaW9tP7GbxJjIHnTYYO
TvrkQ8UNiZo+FZOSRYPh8v0zYT4V2odDxJTaj+N23ogSiyrk+4nTb/X1VHsn
7nyR2a7gYJEYMfM7v3/23ex+m7ueFFtHNT1f6Z4kzj4rPz+st8ndwG+lYpCK
3XvLFDVaXjCS3+9119a31DtWbDX/aaXe2kyxeJzsZ/QmHLuh9bZWLLynE7Z0
iC5NKe1Xw/eXHX/OGGpfErMmrHjXMO69aKAq+6vZE+Oj1zv9ET++CFhe3NWQ
jnfW4fvFtpvR6kpKnU2vK9Qppu3wvMjeIzh9mlbvPWGtx2goKdmZUoV8+8qJ
8RfY+4VchfeXBnXfzMYvHK0orDf+CV7Tr7HxC6qVP0L/O/4pMQFdmH2EFU0H
1LOPascv8cw+wtkhg+rZZ9giu/fM/kJnxy/17H/GPb0js7+wpfBePft3na3f
h/2+wsbAlfV+3w9FTb3Z7ytQrftb/vv7Kq3/O4XNH2GjZ1q9+ePuP203mz9C
gxcl9ebPqZ4/emeHqwkXV+bMyohTr/Or/zhkVM/oaCtM67K+3vw0HzlY+9H3
cPHAc6PG4Ul7xbxq+f6g/CwWPaaLB/vuiS06my7WjPnD7y+/5tzbZ4ISjRiz
IbuPdkPaMcVWxieJZyo8QzvT9JQPBvvtDGloVuYP6f4Po0sFGw8Mps0eby33
H2ZO075UL5Pulw8aohu9fiTVKYxTHaM6my7v4NzmD7vfU1Xj05SVAq149rBd
vp8j3XKn+mUFu/8kPPqThPf8FPL/FxtpFLHnyWt4fgE8f19JpSN7P9nTfRN/
fxC8n8yyec3GQ26YGvDxlMF4ZmgF5bHxkw4+o/j4D8P4ywe8bcq+l+g27s6/
txN875Q+lcHMPoJjenI9+xiT2WdSvocLw3R/N/qvPXNOThhgUvZEXP1p/EmL
yLtiv2jA4QaWw0+aN6G+i3z69NqpQj8HduX3D2/07ZtoMpiFxhv2NigdRGcP
3v5Yup+38sbKvfum0fmrvXJiB82m+/+sOF3N7o/o+/lju9BltMuN6EjfVmvp
j8zx1i+kuHKvc17yv2togcnI4r6vt9G0Ob0vCez+739eVL754EZj1W4e7DE/
jBpbvJ1a/qeYnGtweLAUv9xTyP8b/XpezZ4n9o3l573HyM+/O9P3LXs/Wb7G
h7//pYP8/geHczPYeMj7X4/5eGa+l8dztHbQdDZ+MuPcFD7+vcpOfPxPLJUb
s+8lMfFTQ6XvpfC9v97fLIs2b0LG9a/qLdnnG9gn7cuVc8PLnghh7c5H/9ee
Iz51KpzVqkIMfFPYalyLAlFp+XN+P2H74WD12QPoUrJD0yuxG3VRXZsv3b9i
0emSaDifTmy43OGm1Qwa1d7Gu4rdX+93sEV5rBe9pJc66esETzpxYtzq3VI8
dTR0dVqLPXSD2WX1rWfC6aIxbj0GM/tcvz7K9JlrJA1q/fPC4BfnqNH0rLPz
iovJzojOPfY0iaBmU8yPeH6Mp523nknr+LyY7B6+59B/8//JkA909lMS2PPk
uOOaw9LzRzVO8ed31ojG7P1EZed6/n73jOf8/XZV6kvYeEjCy1o+npVaa/h4
lr0x/FYW60WGPrlhJY1f7bE8fpdWk1az7yXdtOXvNfpH/l7bgPx5zD7E4oEP
t887sI9j48t+zJ6C7Q1zLcmeymDPg2vGTn99sjXNKg8NXuFbLa5raMDjo2kT
1s9dpTmZ7j4fUPH1ljGt1fi3UIqz9jR12bJPaQPdW5rRdOvh5dR00rHZyey+
dsVmpZo1B2lZA9VLl92DabSz5o2c6mJy/qrzrJTfF+nPNjl/1MbG0Nn2Lb4E
vismBm4LLnsXJtBo/+sDA0pv0dCi/Isa25ndZl/Tn7Eunlbl/zOv8Y9Uuvr3
2iCHRsXk5/x7zW8l6AqvFPL/+0sju7PnSVqoPn9+kpkrf35QYrez7P1kZ+97
/P0fDqtckt7/0WW6FRsP6RtZwcfT4Ft3Pp5BRv++q15zkMydasLH72PRlo+/
aKTlRPa95LvV6ubS955SOc6/N+/+x1oXzcmkQUfncsk+x7Vl+wzI/lmTfbI1
eQr29Ad77o656+8/yICO1n7i7r/nj/gjUfu3dD/4tnrRjUt29Hbn2vVaB4dT
a/Nf66R1NGPJwpOvGgbSi3d79/SPcKKbjhuc68zuD+6+alnpqhjmrzU/Dk8I
of90UTut9bOYDOxV5WqhepvmL2ySXtPsAn13wbBS63Ax8Qs7/W7K1FTaOfXF
fb3MJLpybYfh6h+LyPFeAYf14x/SId/+DH/u/YQ6VVi7v1pSRHLDfraK3tFX
aAh563WQrzb1nnGSPU88Pd6NlJ5f8GTrWul5mzeXXrL3E830pw+k96/r7cnf
f61hvgMbD3nxJoyPp79tOB+Pepf349j4yezfFz5I43+h8w8fv6FKvhP7XtK2
ckA36XvDfvfk35vkZXmT2YcECrJ9xtnJ9lk/ROMfZk+yFuw5UJTt6TSuyy7d
k71ppn51SS2Za/pGs3epdL/p1jkuUTsc6KOi1hN/bwo3Dd5rSKV8Qsmx1s2m
XQ+ha7RcX60RM03/beljf/Qvizu+jQnyroilLWq2ZZgUlJpejd0sbPxcTNrG
Rrb075xMm97tIxzcpin07aP/tbcHm/8qU9cb9EynBUPH9e/cU19wT2k7duyF
ItLOX7SrnfiMRHTS8iyZMUg4eMB9rfLTIjL/3Xp39jzp0tWJP6+z0Ic/b7Rx
fUP2fvL2wA7+frPzifz9e45NW8/GQ2IWiXw8y19e4eOpOdLmk831EPLb2J2P
f8WRrXz8X6PS+7LvJWeMk2x+14abNrolf69lTFYrZh9yaUtlSa2ek+mElrJ9
5q6X5yfRfu7F7Cng/NwC83Odnt5mZn8yAuZnK5ifdvd2SvOT9IT5uX2N91Jp
ftplqhSz35dkm6ry3zfQJYbPzwWLN71i84EktDHg82FsW8cP0vzssyVImj/k
bZufw6T5Myp6ywlpfj5alj2KzTfikBvM55vpdkc+P+0U8vk5VVNipPnZquLm
OOn5mVce/is9v/7QzGxpfurNcHwsvf/I0eF8fp5f9IbPzxaLbN9I43Fuu4uP
J2TjAz4/F6gYfJXGr1lhwMc/cqoLn5++icH8e7dUyfNz9M1WfH4uMpXtMxnm
Z8xSeX6uAXvi/LwZpsn9bYOeA7Yz/yCgv91W2Jz7W80LtUXMn5DOmrI/uT7r
Jfe3Py8FKjP/Q4JsZH97p/sB7m9NzHudZv6KjN3YkvurmiPruL99USD8ZP6N
vH/fnvu3pHNh3N+GxM/qxfwh6RvRnfvD1sGW3SR/+yVvvzXzn2RGRP9gyX9m
J3uqS/7WTCGfH1/7ubfkb3v4beHPV91qw5+fbz8uRvK3D4IW8PfPLhnO3/8k
ojX3tx8GDi+RxmNhOoCP50at61vJ32r8WX5GGr+Vczs+/oUH0ydI/vZ2wpPa
APa9iS1kf6u1eC33t083l3H7iOBvi0ITub+9V54YINkT/S3ih9iB32rMWxQI
iB+iGw3m+IHobKvxTOzG4nN5f7yaG3lRwg/3Ox+0Yvspuakj76cFV9doSPjB
36DHQLb/Eovz8v7r9jGP44cDOqfKA86Ek1HZa/l+3frWbI4fsi+e3cP2dzL3
RRHf3xe2ncfxg/mHeVsZHiAvTcs5HngVpBop4YfBCvn8zqfGDpXww8yxc/jz
r+795M+/3VnK8cMb3coQ6f3j/H7w9yuvyeT4obHHuTJpPM+er+PjGfyPzVcJ
P+TVzhggjf+ryRU+/ontEzl+6G/TfbL0vX96yd/rdzqP44cvbk+qJft8B/to
XhrP8YOn5vhqyZ6IH+L9PvaX8HBrh2ZeDL8JiN++3nk9TMLDtf12qTK8R74A
3rt0d14/CQ/v9StYyfAhuQ748MK4Qo6H83s9OMXwJOmhKuPJRSG/8iQ83Gfb
kdUMf5KM8RM4/uze1pPj4WjHLokMr5KLH/tyvBoeMOeXhIebdBqwiuFb8vxb
Pse3RR/OcDz8RSGf31T/NcfDFxI+uEjPB36Xn0/bo58r4eE16y7dlN4fWim/
/0pnHY6H2zl48PH4zpLHY6kTyvHwhMXNTkvjb9BcHv/w8cGNJDw859sm/r36
Q+TvrQA8bLiorZpkn+9gn2W+Mh7OGHCqnj1bqcvxnd+XvAf7kvYKGI/cPtUs
RYrvCqp8NrD4RcD4ZW8rFR7fVSR2PMziHaID8c7vGXt5fBd8q9mrcDtDkgXx
kfHKqHwpvtMUqy6zeIqc/S7HU5tc/tGR4ruYu19ujFadTVoayvFXnwFyfNen
4fjnn/wciXWJHK/FvpfjuyyFfP6nvnJ8921CM/78bHheS02O7wx6BfP3D4H3
77+kyuO7HdV3+XgewXh8lPvx+G4rjP8tjL/LrqnNpPiuVQc9/r268L3vi/uG
SPHd8sTr9eyzwk2O79Yq2NPlTBDP/7xs3HIsi68FjK8PJQ7neZ5xBZPu3TkT
KmCcXug16ZaUz4nNXafH4n0B430HpRt9pLyN+T2fsPyDRQLmDQqfn7gj5Wdu
6ruttkxRI1WQfzCFPIx2wQLtpUN0SSHkMU5NjD8h5VtcKy2ri7oakhOQD3nf
xquBktIq0+uQz8+C/EnCxPiLUv7ESeH51DyTK1KexKjDoHrvL/w97pqUD9mi
3LneeDoXV3aQ8h6XJzWvN/68oi88v3FU4XsxjzFMwT6Yr3igYM8ny0ZGZIer
ib+Mt51Oj1P/f3lpyLNN+5DeQmP2JAHzJJhPa0zHLv4RvEnAfAvmzVY90ny8
40aUgHkbzI99dtlnXumeJGD+B/NgO35t9dZbmylgHgnzXepe890bxr0XME+F
ea1ChXw+5rVc89bUex7zVOPvhNZ7P+ajXrkcrjcezDuF/NWvN37ML03r3qTe
92Ie6ZRFZT37JDfY2XrAy2kiXv/AfVvfVPXaq8HiwnNTlN+MChUb/JHvh05q
NlrLPlFs1jM7wV/1vhhjLd9v2rLYUGdltjjwkOboyY5fxLyFJfy+EG7fs7NG
oXjCeHh21U9leswtWl5fJ0wnDPH9IC46eO589pWmtJeFBb+v8zcvQrJn9y1t
xhepNKRuaQf5fevSg+uUmT1HBdbPE36bv4/n/Z46fTJYY2pAmyzT4Hgp/pKN
RZN7FcLLBxeFN120qEfhHr6/Xz7st1B/xHvhQy0Ze+jtT9FtcYFs/0Jn7eHk
hvBq1gun0Y3ui3a28net+ev25tDg7cLWiqBtKpohYou/8v3F1oMCRuhNESq/
rC/0MJleZ7cSvfe36MNwceHJ5Nw+p/aKxeAf9AyKPi6cli7iVd1O9icNBvwy
YZG/+NXI0TukUQPa/+gKfj/lTfI8S4+OdMi4HIPRbwxodJsPZdyv3tn29LNl
T2o3dkfC69mEjsncHc/nQ5P5NYVTutEvrcxmlhWNo/+etF0u3T+ntvvSBuYH
kvd9Kjy2fQw9ozX1CM87Ofb3VFayM61QyKM+yiz3nMr87fKHBm+czBbR7Qcj
f1dKfkk/t51lijHZ0tNlGSmcTO0itV5LOOrc913xR5d2JVc3r92xYUp/mvdR
4wvHS8GdY7Y++iv8veuUOj2uEZ1bbsW/a/CANQnd16cJazo7hDzXzxQ/zpbt
kL9v3rOVyeGC95BBzYP1D4oJUO+b1/DUoOZzZwuW2iu7xJybJVaDnRvonhmz
+OETccYhDSNP/7vi9dPyekmpXkn/edCYZii/+TtwuApt3L+XvI4Gmo2NLxtI
8Rrnq50h3fd329LNZsgUesXUIeLC5xl0df93KTXs/tF1z3qu1bOjz4dtWRKU
50KDNfc0+ybtO4eCHe9Ez6F9isqbL7LzoHeSntzJZPcN1plt2sP2tXGeeUM3
ubhTjeR1bm/Y/Z2vV4eXs30tQSFvaRvTfMcPhh8mtungrW+zh962qzZew+Kv
FvusVxQauRCHM1U67Z286Y27KrNj2PMDAvoKX1rakjiNBekf0hbSjYm196W4
zLV2Wft7GUOIbeWLuXNsh1PfNi+vcjs09J98xqcpafyjYOXWJs1pYdYOPv87
DNC2vRP7XGga3+ifiyZZ4s9hNdw+v8h6jS1jDwihLum7SzeFit4wb09Zd3J7
VP5LbOI3X+PEr3xRLU3GbwuSTz9IVhlA3edph7V26kYDMxwKpPvz/U6f9l4y
l6aPs27Re+p0at84QkvCM73Sx5y90GQ9xWtlTMiks+y+V2Gv5iott9GG28Zb
Re0Nobe7TopUY3YYPTnByicogHapTtxevecwNb/jErub4fw47fdx3p/cqHWy
0yKzfkdp3jrfNhPZ/X5R9x9KOO2tQt7Sef/rIjW1CNJI7HDozKcrdMIb0+6f
couJZ4ZXxe/kfeT30oSSOL/jNGbwkuLMCua3T3kqm7v5kGeOBnrzjAJo5pwF
Ygc2zkE72xsuO7aIfFv5wIJd6aaNhaXS77hB78aMqxYmpM/aBX/MPg2l3SY/
jOF5xSWFg7KUmpK4lkfaPXvWgH67Vcbtf3TBmJnn3z0VXnu+jE+ruSs+3yPP
29Ts6NCSoNbUgySdn+xSLU7705M/7/PwpqnBNis6wKi97eB1xtTGZN1Pad0l
nIsZ/fKYB10S8e5BaeIyOtb4bXAqu987eezYD8/30aCQQhdflSDa5lPu4GRm
hxZeazxUX5+keD3qmThtYFExWVrpquxqfpoGzH2zp9vaq/RO/NyJC1m8MGbR
JsNR2hFUY9Pb1t+VReqndu20012GV28OVq9lcUch5C3vQ95yVXhq6Yb18UR7
6HylH8tSaGFkeqh1z2Iya+khq3v5V4hdlkqcWeF16mrU8cStawx/Th6kvvnI
cbKwPKqwKukonbYvtqBZeTE5fqnjllFh/iQ4vMeyx0GbqUukxeRB7LvMcmLO
snlPdLwCp7F1QNOfyPN/0YO1x48uHUhGlJya9d2qO/2RcP2jZLe/21ptqXGu
EOZfK3/hZVwgdhyVxe3sZPnw88guBlRz/+59T4L+iM1XdeX7xSfjxEEPNtjR
pPll864ED6fXVquHSvN2bs2Iz9++76AdvTea+21yorNv+lr2Z/fbfPuzeNTu
M7T0pg2x3BFCj2za1+pIaTGx++a1qUHbmzQ00q/mkct5uqrD2rPllOHSlNt9
cqcmUbx++7Vm+Y6lDG9oD25t5RFPDW7HTnUkj6nn5jGdbigVk75DYof+r7xl
ypT1N+dee0h2p16eGDDgCXWMrun03KmIWD9XVvvj/YA8Tl2SFOedRNV0ii63
6sDsf8Yo0rUynuxsO8n75pcYunPm4DE5KcyvGs84XBFxhDhPrr01+WQwXRGR
+8G9qphEbX90xKuvJ+kd4d8g6OZymuM98SBl35tx9IIa8/ukvLypHtsH6Ngo
2f+3vNzRyDG1NTErz3bVD6gWLTQ783l7/nGDov6HetP+Vxt1yfPzEa+XDOb5
IvV96ddsnB3orauZy83T3okLorPSpd/xcHbfo7tWhtC3lhYrmmgb0jsZ9jPP
MT+wf8zMyw79YumMXUlp6yMc6B3rxFTzr8Vk+qO8B1U1d6mXc6dWlR320iC7
zk/8djP/vG1BR92dT+ib6eb5Pf7G0ZGFb06+/1VEEqODq7W6PiOb1De8P6oT
TYN+3/bSfFxEEnQHO3l1e0ZGhscm9l8TQ637xTcJvV9EytvHrmgw8C4xbpgR
e1blBM1y9FVaGlJMIrp6LvugfIF8yc4mNxsH0afCzsnlLI7OMuqYuTQikPgr
bfozqHo5Nfv9e2l79l1qW13XNX9qR/q4NDYJaj2c/j1ru0KaV1a7ypNXmxqQ
TgvcT0k43RJwSyrgmALANYhnDufEnmHvoTGTHUex9xCfYPk9Ps4LNJdFBNJn
x4c1GFy9nLR0L+f/7vdmJJCNk+5ecW4SGyc5+WgJH+fDt1Ue7LtogObEa+y7
iJFJce0S9l0f7xS6MDtQ8fmTTGYH8vWXDrdD8ITH7TM2Paq75mhf2564sYiU
DJnditmZ+Kv0K2N2Jp9SjE5Jdh7QsjiR/S7klPbywex3IeTibv67bCj9Fsl+
R9K4eqbmhggHUnv2K/8dP71suZH97uTC6L6XVLUNSYrhUv67h929787mCRls
lFk0Lu2dMOaZPE+6Pi5ZzeYVOXGp0YkiPx/BoFSeV0PUWu1m85CenbNtOZuH
wjCYh16AVxYCfkHcUn3k6Rs2z2nqVYfK3TeXE3pmAp/n5+Nq49i6oN2erk9g
64KIozL5uljr3v0iW0d0n/q0TWwdkbuFNaOldZRw4okWW3c0e+C3RLbuyJXi
YL7uHnbacYOtU3qxk9cEtk7JYa9OOtI67aj348+J/5GHXPbGWo/5AbLpcG8L
5geI51jK/UD/pkaSv6i7Djjrxf2GzvWZzszPkNVFQi3zM6R2wEXuZ5bGKFky
v0S6dJ1lzvwS+SjGcL80fKjfJebHyPbnVWbMj5Ff9wO4H3uac1KF+T3yNyZ5
EfN75NtO2e9t9fXewfwkUXf0jWR+UpgEfvL50kP5zK+KOqHHbzO/KnQAv7pc
Zexr5oepavdUM+aHyUbww5cBr/QH/IK4ZWvX50eZn6fayt9mMz9P2l4Zx/38
wzkpOmxfoDuDP7xm+wL543mB7wuuHh7T2T5Cs/0GRbN9hDywH8L3kedp76R9
h060NywtXpZC7q70C5P2nflLQn9KvOIxkIccCnnIJ2ELR7J9jTyLGvT3m7JI
HuY0OSPta622OUr7IPk1PdCX7YNk5O8Avg823bl+Jdsv666Z9k/5vmngJxiy
fZY8Chm/jO2zZHZIHt9npy/T02T7MnlvQxPZvkxMPsr78vmd1R+6b7Mi2s/X
T2b7OHkxUt7H/Y+dNGX7PjFq/imK7fuCPez785I/v2M4Qdzm+WM3wwkC4oTI
Hkd9Ga6gP/YvLU171oB8AVxh8Th2L8Mh9L6GZQbDIeSJlYxDvgJeQfyCuGXj
MBMthnPo9SRLZYZzyOlWdhznPLl6V7kyeR+9cjUhh+EiQhPcOC6arBb7iuEo
uupPy60MR5FpNhs5jrpzSlwn5SH7KOQhgywzbjKcRqr6z7JkOI20WxbCcVp6
7gkbhutItln5YobrSE7OOo7r7A0GKjMcSLLbOQxjOJC0vGLNceAhy17BDC/W
XR/P3MNxo+3Hja4MZ5IxoUm/e02dTlzbyDiz0d1FYQyXktvzDmxmuJQ0ypRx
aZ5KpQbDsUKvZs9+Rf3KF5oCjj2dPWYLw72i1zm7KQz3Coh7c9/WHGE4WYwa
0fLbBZMsAXGyfc7pXQxXU/viJd0YriafAVc32xprynA47X1TXZfhcPIDcHh7
wCtjAL8gbhlhedad4Xw6ZeGemnZO3qQypQHH+Q0frgpgcQFVc2w1m8UFZGQP
5WFSXHC7hVd7Cd9+VMhD3vg9KprFHWSsr6sSizvI16UePO54l75hMYtTyMkO
ji/s7TyIntNTHqcMOLO2K4tryDavLT1YXEM0pslxzVObCi0WB7H96JMzi4NI
2XA5DqqKaa/H4qW662I/OW7SN/m7gcVZpGNJ49csziLNIM7qXdby1qKHT4Tj
N8LVWVwmYFz2fSM9yeI4MfPe5qvnzs0SMI4r8ojXd04OF2e/bHAkSP+ggHFf
qkn1RxYnir7aXhYsThQwTrw24tEHFleKbj6NfFlcSeZDXNlJ0/Ihi0Np08JU
WxaHktF5chxaCnjlGeAXxC0Dau6tZXEutXz56ziLc0kbUY5zlw79fE3KQz5R
yEPm/t71ksXRQuyB5ydZHE26a8tx9LSJU2pZ3E0q0taqs7ib5J+R4+5X9s3u
szidHGo8fi6L08mNLDlOH6T0dxSL68mhgmYfR70xIDkQ1385qK7EkLTQc1Ez
i5BGDcggyAPsWtHi/MJp6QJeMW8wqTxnBn0YLgTmJh7tc2qvgHkG3aTaWV/S
NMXT2yvLzz/+f7xNC8+dt0foTRGTktut9TCZLmC+Is9jQdfIwdtFzXlN+qto
hgiY3+h4dcO44eSGGN09qsnoRvcFzIcc8SxdpT/ivbh77eXyiLc/BcyfeHkF
WTW5VyFaVx/+kdNFi/hCvkUX8I014B3EOdOzJ/6QeMVxCnnI5n8Xp0n5sfiC
I0XfVRqStZD/WUWuWQ3x/SBE5voOz77SlAyAfNHZAfadO2sUCq+ufdtZ9VOZ
REF+6cMYnxY6K7OFo0N+pVk5fhEwH6Wd3kJVyz5RUB16YK6/6n0B81dWZq6v
/l4NFt7/tI/OGRUqYL4L7WnefbX9hcf/T7f+zKCNOrsvjFO47xax8kb/l9OE
XKMF9fJpE1LuqTP8RPHabKLWTglHBbgq/2a4lH79epXjUpNTozZxXLpx7z9S
vVIJ6ukeUE+/2OB2awmHDdV6piW9p+zi4h3Se5rpLdeQ9GApSb3e19aSut+9
nefPCun9qoWk7TGdaHLfRYe/vw/8/6PhfeUK78ErvscqdjPHz0fVGvL3dLwV
yfGzxio1Ps55gGeeAp5pMCswVeKbjlfg01aCXQLBTmgftJubwn208xmF+Yw8
t5cKeWDMDz9V4L8l/RnYS8gURxQr8GYPbxk1t3biMzpmq0mpzg8DIfZzO3ep
zm6dFqX5v3R2yO9EvifmpfHfw38fn0deHfLssF6APDDkhWG9BnlLWIfE+iPy
bJB3g/Vf5IUgTwTr78hjQF4D8hmwTo91e3we68pYZ8b3Yx1UcTxYt8M6Ho4f
60xYd8LvxboI1knQbsh/RT4s5v+RL4t5fcxXIx8R+YlYl0H+HPLpkEeHfC/k
fyHvC/lJyFdCnhLyaZBfg7wa5H8gHwR5IMhvQL4D8hywHo/1eazLY/0Y68lY
R8Z6J9Y/se6J9Tms1+H3Yj0J60toN6x/KNoNecPII8b6C/KMsU6C9QLkdyLf
E3meyEdEfiLyEpE/h3w65NEh3wv5X8j7Qn4S8pWQp4R8GuTXIK8G+SLIH0He
CPIbkO+APAesx2N9HuvyWD/GejLWkbHeifVPrHtifQ7rdWg3rCcp2g351si/
xvoX8rOx7oT1GuTLIn8WebPI70S+J/I8kY+I/ETkJSJ/Dvl0yKNDvhfyv5D3
hfwk5CshTwn5N8jHQR4O8kWQP4K8EeQ3IN8BeQ5Yj8f6PNblsX6M9WSsI2O9
E+ufaDeszynaDXnqyFtHPjby2rGOh/Uy5B8jHxl5yMiXRf4s8maR34l8T+R5
Ih8R+YnIS0T+HPLpkEeHfC/kfyHvC/lMyG9CXhPyb5CPgzwc5IsgfwR5I8hv
QL4D8hywHo/1eazLY/0Y68lYt8V6p6LdkN+PfH/kyaMeAOuiWK9EPjfyu5HX
jfxj5CMjDxn5ssifRd4s8juR74k8T+QjIj8ReYnIn0M+HfLokB+GfDHkiSGf
CflNyGtC/g3ycZCHg3wR5I8gbwT5Dch3QJ4D1uOxPo91c6wfK9oNdRGok0D9
AuoosM6M9WLkxyNfHnnyyOdGfjfyupF/jHxk5CEjXxb5s8ibRX4n8j2R54k4
CXET4iXk2yH/Dnl3yA9DvhjyxJDPhPwm5DUh/wb5OMjDQb4I8keQN4L8BuQ7
IG8B6/GKdkPdCOpIsO6JuhHUkaD9UZeC9XysO6MuBev5+H7UJ6BeAet9qE9A
vQLqFJBnj7x7rFshzx5598i3R7448seRN458ceSPI28c6wfIg8Y6AvKekQeN
/Gfk7yKfF3m8yN9FPi/yeBEf18fLPwjmN5F3iXlO5Fki7xL5lsgXRP4g8gaR
L4j8QeQNIu8NeXCYd0LeG/LgkP+G/C3kc2H+BPlbyOdCHhfykJCXhHkA5CEh
Lwn5SMinQX4NxrPIp0F+Dc5P5IUozivkhSjOK9QpoW4J/TDqmpA/gv4EdS+o
g0H9C+o0ULeBeg3UFaDOAPUFyINHXjzy4ZG3jTxu5G8jLxl5yshPRh4t8mqR
T4u8T+SBIv8TeYrIW0S+IvLqkGeH/DrkgSEvDPlgyFtCHhP6YeTZKNoN9V2o
90JcgXow5OPg/og6ItQVoZ4IdS+og0H9C+o0ULeBeg3UFaDOAPUFyINHXjzy
4ZHnjbxv5HsjLxl5yshPRh4t8mqRT4u8T+SBIv8TeYrIW0S+IvLqkGeH/Drk
gSEvDHEF8pYU7Ya6ONTJId5DHR3ymxDvoS4LdVqoz0IdEeqKUE+EuhfUwaD+
BXUaqNtAvQbqClBngPoC5M0jjx7588jzRt438r2Rl4w8ZeQnI48WebXIp0Xe
J/JAkf+JPEXkLSJfEXl1yLNDuyEPTNFuqCdEfSHGL6g/RL4Yxi+oc0PdG+rd
UJeFOi3UZ6GOCHVFqCdC3QvqYFD/gjoN1G2gXgN1CKhLQD0C8uaRR4/8eeR5
I+8b+d7IS0aeMvKTkUeLvFrk0yLvE3mgyP9EniLyFtFuyKtTtBvqMJHPiPE4
6jaRf4fxOOoGUUdYF9eDzg11b6h3Q10W6rRQn4U6ItQVoZ4IdS+og0H9C+o6
UOeB+g7UIaAuAfUIyJtHHj3y55Hnjbxv5HsjLxl5yshPRh4t8mrxe5H3qWg3
5Ckq2g31q8gPxTwS6i1Rf4l5J9QHol4Q81SoZ0N9G/LSUX+FeizUBaBeCPVD
qMtAPQzqY1AXg/oN1HPg86g3QP0Bvh/58ciXx/Egnxv53Th+5B8jHxm/F/my
ivbBPCnmTRGnTQOe4gfgLWIdQW2fzKsLbC3z7LCOo+czj/PAPK06cl4Y8sHu
3L/MeUsO1yI4jwn5SyWp8zjPppvDcc67Qb5NxtpCzgtRbf/8u8QTSQB+SNsE
H16/D2iqwev5WMcvrT3G682WuRG8/ox159Mecn20/225Xop1Uneo5x2D+h7W
9bD+hPUorENhvQTz/Wifw7tfcB6hd+8lnFeIfMLQg1V7Jd5b74zEZIkHFwT8
N92+sywknlbq7pKeEm8rdoRc5z0dO1pf4hWtmNu3hcQzSg+Q6+yJSZ/fSDyY
+er+2yVezJW7Ms9Bd4ozr6P7zlPidXVPqKf3qXTgdd8D+yN5HRjrv7eGyXVK
61y5bon1yllQV8M6G9bXsA5kCXUhzLerqMTf6zV1Os3JTLCQeHx/esh11fUr
fZ4XJS6jRqMbjcs45kHLDUt5XbuRXoaX2yYnWu03ZMmr7ztoSeGJ8RKvwCKw
6dEe2oY0JNf0z5aVIdTkqcYsidexpIkar09PvRnK69VpUKfWTpPrqReq5foq
1lVbtpXrfxcEuR6IdcA2UK8qhvoV1q2mOFw8ZK0SRJv8Pf5+z/N9dJFXuaVU
l3fwt7niuj2ELr9a2/xL4Bn60G+E9dFStn4NhiUnH3KgY78euHOkbyx93+3w
TouvLL6AevlXBb5f98eGvL7rElTC671Y5/23pSqvR470SuP1SaxLZhjK9bOX
iXI9DetokyujlQpWnKe7nr1vdlfrJs38PtBZ9VYxyXlx7XW+zl6qfcFpYGrV
XZp25tvOiN3FBOvH7RX4b8U7NWdJ9c7GedG8/jkK6p66ynG8PpeiVcbrdVin
e2QTO6robxzVyJg1L3PHE3rhytv2eb+KCNZHsV5qBnXSP5XHeT1Ps3MYr+9h
XQ/51l8VeErpPkufSbzh4S1Nlkk84q/H5LrqgYLIED2bPTT+TkD2VxZndbGI
5HXteTmXXRd9ukJ75+4a6KsaQXpnjmicn8vwz5xmHp2XpVC/NWPsoyWd7i23
mQt7MpwW0idn88AndP7MqC9zLj8kbcJsLtU4FdXxupDnhfyuoN7TPC+Sx0Sj
a2ujrew9/cf69LmuVEwqy7qEWTcWyam23TfM0oogvv6J1+beLSaLh6mmPu1/
lPSf9E3MznMjP9O1x05g+E1nxbXgGBd3sm7CiJ0+7LsWDf/pKtXZ7d+qzju+
fQz54dvwsFQfNmkh14XHJswsluqXNScseD0T65i+wEdyVOAjvbEZ/G87J2+6
xv7Uk3wjF9IzSY3zAdaGrC496Xecxhl5h71J3kfSw5xrJD5G6j/tvI0Kr9Ne
rQ90sMm/QiJvDtS6fa2YCJ0OPVffkkQd5u1rd2bTA/Lv9pUj23Vg/nDu30/b
fGOoheuwl627PSMD2wa23Hu/iNyZl7DAcf1Vkj86IsF2/GkSbvyuz1QWL1sc
fHHyTNhhMiaQpg8MCSDip+9lu5gdTOb2y9lm50Eetg4pK4yeQ45tncB5BW8m
xx6X6t/3L8at+TylGwk9LtfBE1w6mUj12rMvOkyW6rdYt6VBffLmGgXQkGEG
1mZuPiTn7lLOPxlwZ1Do36SjNOpqnp3nkeNk/OrPnP8T8WjQwqNfY6jxs9H6
myvjSW14c5PXKQxXpE6smdf4BF308ajTi4F3ycyUCM15ISxubZofWbI3hFw5
sOX0spbbyIk2rwMlPsnT/BzdA3kupDz2ZesNenbknwJ/zn945pHrI9Xpu63e
8Umq2zeBev2pv0qBUl25jb4nrzNjfdlu3aYOT4I20x0ttBMlvurhIsL5S34L
E/RXnAymBs6tjzQ8dISExE1/KfHHND9kDRzdJIhmqVe2c1W5wPbpIXFlLJ7t
3irzqcS3CIzYPUfiX7zQk3kXZU8/5kn8gK8+g8ZKfIFs4AlUD/vN69lXxvnx
+jbWtdOi+h0JvrmcftOaVbKprye5YWvO+Wzec67ON61eTk/rj7ywKiKQ6N7c
yPmBqwdqcZ7BVO92nHeAfIMNI6EunivXybE+bjEoabLEX3z3uJ+vxGcMOiHz
D79DvdwW6udYN8d6ueJ+irodxTop1r+xHo518KZQt24PdWysX2PdGuvYWL/G
+rdi/foQ1K2xjo31a9RXo94addZY18f6M74nE+rXSxXq1NhvRRFfYd1a8T1Y
h8a6NNajsV6O9XOsmzuDDmcR6HLQzqatu8yQ+KDPu7pelfih2jvk38UO/MtG
Bb2G90BZt9Nvtqzjwd93cOOVXH/ipK08QtKjoA7FQdd1MZs/ZNUW369s/tCC
4R58/nxNahHG5htp0ndeP+++nvTwFjM+33Ye1eL6n5zWP7keCOfnoX5x/0g6
luCFfxZIupYomM+XS23+SLqLf292WCnpMGZoy/Pf0PrUSLZeyPT0GyPYeqEq
IZp8vbxKGqLD1hdp+inxCltfNH/WBL6+Pr0Z05ytR6Ll9TRH4hVaNpLX47+b
rLju6Mw2T65DQv1RRrzeB0k/szZTrVjS0+zKkNe7XVbOfOYf6OQ9gzox/0DP
HJf9Q8dRqZeZP6E39DzjmD+hnX1fcH8yWfuu0vzGJ8j8MV/WM/9DyaEm3P90
7WNsx/wVuWIyYAjzV/RGn6zhkr/KnOm6lfk3on9jgyvzb7R2Vj73b+ZfrO8z
f0j8kj/aMX9IL21cxv2hb++xFyR9lK5wlOulUCeVts/7u6Tz0XVOcmX+lnY7
IvvbG41utdxu50EnLj71i/lnOiZ3PPfPrxZHP2b+nC4gWY+ZP6fpD/O4P58+
U92F+X/aVu2k5P9p489x3P/fGqP5h+0XpNHO76/ZfkHfl5RoSvtF/MTOGWx/
Ib0r7buy/YVO9m7J95er7hZubD8if16v6cL2I6pWNJHvR8nZq9+w/Yucqrp3
hO1ftLDTer5/Gao/tpF4bx3bNnjN9jvqmNyU73eJ0x5z3Zdq9AOuA0P9V9iH
tpFsn6WpIQ3XSXqmW83kfTbdsddDti/T5Z2IA9uXqU/4D74v+zvo5bN9nE7s
U3GV7eN0z9smfB9f6Pr4HNv3adY9wYHt+3TuKSe+76+PehXAcAJ1alxhyHAC
Dd3WhOMElfxf2QxvkAvhsZ8Z3qD3IldzvGHY5cUKhk+I5eMZEj6hJcHdbSV8
8mLr2bkMz5A8Q0cdhmdoI4sNHM98GB/uxPAP6V/89TnDP/RgiyiOf1ruMQ6X
+GethzWzl/ho7vdkvDQZ+FK6Cvxw1L/NBT0c5o1Rx7X0X1nXhXUN1B0Nf7CO
65CwHoE6me+fPj38b90BdR0qXSK4zgP1HVhHiAnWM/5vHQHz/OWZv//8t+80
8m7n06Och4v8W+SJzm+TtO6/eXvkNWZ3knmOmJ9HHl448PIwD4+8MeSRYb7d
LzmO6/3G28zi+j/U/anHHJjMcC+ZkWUzneFeonPUuIOEe523j+Q6wJzB/lwX
iDg5wiCB69nCkr5xfRvq2mIdlP8wfE7onbU9GD4n1cVzAiV8XhaxoAHD8+RF
YGLVHa2b5EyJE8fzqgtkPWHsD1lfiPhf2caF6+L6ZHTnOjnUx1k3Lec6rvQm
Z7iuC/Vcra4/bPzgkAM5vHjgBRankJbrH/M45d2OWTdZXEMSvRv9/Bx4hlgl
TeVxTdV9rX3WEi95S2Qyi4PIol7VPA7aBTpGb9A1Ytyk0lXW47UfLOvzMM66
nibrx9p2k/VkqCNLWanH9U4+LSK5/qk76J50IT4xU+C7dulZnP+PtiHx1uny
ksWDxMhAm8eDHeKnSPEjyezl1Y/Fj8S/9BSPH3OM7B+xeJOsbufemsWb5GuW
HG9GWve8KPF97w7epSnxf5sby/Ep6jBRl4n78ibQExaAvhDjX4Mrsv5tZz9Z
D4fx8o9Vh7he69KrT1y/hbqtKboTuL7IS38Q1xuhzsjS5PNCi7R3wqoR68dL
eoX9xXL8rtOgTU+JT79Huf2b5A12pMlROd6f+SSBSPzvUJsBTyU+uNFoOT+Q
d3CTt8RXfvXUPVTiL6sCb7lwkzLn175aUcH5tsizRT0k6iMxj7EL9HvFoOfD
vEeVh6w3c5st688wTzKkq6yPcq3V4nop1Eldscnieh6HuLZc34O6ngFuhVx3
sandPa7D6AH6i+L9U7lOYPSR2Vw3gHoB7z0vOK9db9MhznNHfvsotTTOw76m
9JvzspGPPe2KzBu+9kXmEWPeaRPwXE2A94p5qn2AwxoMrc+3VIY65vw9Lzk/
EfmTyJtEHiXyJ5G/GOc/iT+PPMaEyshlyV+Dxf7XjwVbrw0VSyA/+Vx4Flb2
WBQfGJ0O3fj+vpg2Sr4/c2aOps/pXPFOtr7+5l3fxdUxRfy+4d2AJnNsS8Tb
NYEeR4xVadREOc+8aZ9OvNChRuxzP7XZNMeO1PbTW16fOqmh9HPNgkpxoMHq
0Oa6PeiUTl4V3J931OiqNHKu6QoFXl923/La5unVwsABK78c69WO2iwP4H13
hww2uXq9xw8h4O3Q1M69G9Lqsm38333n1XpCv9uvBOfoRR6jpheKOv+UyXmz
SfdsVXOvCzN+tji3oN0dsfEG+bv6lczLCQ3eJWy1vnr1m3mI+BDwpy/Y/4cC
3/WtRtGBnv/Uio+sVkZ2tGtAiz0c+P3sZseiu07VpW5ji6O/R/5DIwuLSziO
vbHqqseKAXTkwrCANgfHUJ+K4p08f7jNJO3VnGF0QCNPIyXb6fTX7pGa0nop
vLvtyuTRRvRLT+/OWRsW0tT5kztI6yvw9Z2NEk9PVYGn19H4j1NrFUNy1GfW
FeXYYdRlkmGq9P5BNZeri5xbk5tdYw+ef6xHmzdaUcXzM/d7NT46qFx4ML/T
+dpOVeICy+t8/NHvG8243jhFmBo1NIpdxSkx8vw83WfKUmYXodjLZWhY8K46
+3RL6uXxUX0q3TbX16X/zZk0tPFFfwnfNh12yki3cBFd+27txioHN/qnJDs6
T4qnjvm4+y5YQVt00NwYb+ZD1WrauOxj913Vv7bWHLqEpm/U3t08bBfV2lN0
QZ3dd7I9XSHVTX4q8OXuFh6YMXjDaOJ/+WiDmipz+rAq1IDPn4cDHv7o2Y2U
Gh8sZVf6Y84EPn/8498vYN8pbDzdZiD7btEOvnfWT7vZbB4IH9/kB7J5UTcf
um/e9KJ3zA4aFl2jPzJ1D92rG+oe/6eYeFzK/ThOOYRmtenffkK3KBp8LcVg
8e9ikmU84/nbVYF046ZzFsd6XaB2C+fmS3jecZOz0oiCUlMXBR7aaMi/VSnk
39waTXhfXWVOls/a6sa+j06plr/LZPL9Eez3I2F3t2oXO7emuvA7Pmi3oCWb
38LgEVrL2Hyvm+dsp46rbHqedok8eXiHXTxdf6jaOzyVzYfqsUe+q5+iM/qG
Hw9veIcOKeq38PtBKS5Y7iDVW7UVeFyTYZ/rrpCXU48d5sTmGfniSr3ZvKPj
reT5ds3/979sHZI2xr8oW5diLaxH+2iPnSG2N+mgAx4nTrg9puoLt6p4/igi
DgMnzZLq6a2B17QOeE0vIV/3SyFfZ6zVy4etf5LVZFgj9fRq0RH8wP+lK3Q+
YT9x8S07eneR+cJnM4eTX+97uUnryKR7m2fzhwbS478+PF7e0on8Wnp3nC67
f/tGh/4Ds2Lo2c+ubeaphxCXPQMCnvxgeGBQs60W7rfp+coLvf2bxpDzm4Ie
VUYUk1w9q5xF0x/TwJn7jA3a3SKtLR869PlYRPTBD19T4J/nX13V5oDbYzL2
/u1R/864SWpO/HD1Y3Y4e39Tt2uN7hD/lMPzlVucIiHzU3Z8YL/L6GuVc2/0
vkCGdW15YKVrIMlo9vJRKZtXfvdCjHXDdpHq5kK3dkOXkPFh2eel9fK7t6Ym
8xekgcH4l8x/EMclst8IalM1kPlZourWuYr5XSEc/K3n/6EffOP2Sj9gzUa6
Jut93IfY5eRksNWo21JcltvpkOfMSHqxYxcz/93BZOpZnaiBLO6o7r61MKd3
HJ33UvdaREAMma39c/6Ll8Vkw46xNN8gie529GphY5BEuu/v4rF3RTFZPNjg
39Ydb9GQvh1aJkx7TFaZxKvqMbv19qweI82HuQr8iiMdn68LXxRPZqR+19ii
fp4Ypc9N2snm88JneyPGdY8iTTN3Ob9WDiEqw764LWLr0dO7T+p9Mx9ScqHd
weAFK8ixtM3Okp9JWxPTl/lZcmtrl1/M75LUINnfztH9HGbj2JGo/Blyme1X
givsU42/P73SMtmXtvIv+9LuuTe5vl5n0CR2/8AJ9WXL+hymVsr5Hdb1OUyW
6sxtvIT9u/ZmC7rqbo2hezWXxo3rE0cu/Zr4MovZId3Vsm1J8xh6zvPTstHr
bpP2U+a4FbH5s3NBiuX/4jmcLolQ8U7dQ+aNdzuxPmYH+bPIa5nkfy7e2zvv
r4MbyR8b97pL4SISePsp96tWGwznsX2FDPx1PJ7tM0S3Ut5fRuiWt2T7MTnR
bXLNbNsS4TTsy+4FhgfbP/emizx89Fol+xJBWY1/l275yk6HdwfTpJlDDpyc
GUmO/0PDpN+3vFFuygP1EHrrsfqUx1kxZEZ+q4LHbF0cWmv1+n/xB1oZNghl
+wGZvi7oGNsfyKPKC3xfuLkxbgHbF0nf520C2D5J3sD+uHnfgyjvXd+FsjXt
v205nSsgrgj6e3BaXuxyGjR0dcDWNRvJZzMLPg/Lbw/rurqlE72QZP/QcWgg
6XXGgq/flMFbcv5Xnd1pTDsHtk+TP1Flc9m+LZTAfv3P7FeDGL4RbA8etWV4
R0CcY75hlTPzF1Tj3GID5j/IhXLZb9iui50h1Ze/KdSXw51eDmH4Sfj6yX4w
w1MC4iiTXpmlUv3UXKF+agp46y7gL3x++dyLayQ/dWjdElvJbzm9lv/d/yvf
tYzI+KzNeBmv4fg7blvNcUnYkwqOUxCfqETG9WB2I9PC1jZcwvzfSHMzbreZ
24aNZ3Ym26db32Z2pgM9x3E7p4R35zivj0oux334u4gDtp6S8E2Ut/spCe8c
gt8x+HntHQkH+C2+fUXCBQuK5N+9yZzgF2z+kC9Za93Y/KHnPpXkS/NnxgF9
bTbfyK1tPymbb3TXkGt8vnU8/HUnm5/k36B4EzY/qd40VT4/3xpHcnxpLwZz
vIk482a6xz4JV6XP6npbwlmPf8nzf/AU9S1svdDuqs/z2Xqht5bI68V774x2
bH1R34VFsWx90fSJ6/n66h11WYetU7LApc9atk5pVOQHV2mdzgu07cDWNVnS
Yexttq6pt8UAvq6fTVa2Zn6A/G1UMoj5AboO/MDqzAP7md8geQ8GVTK/QV/2
0OXj3z21UXMJBxv1H8VxMeLh4LNLnCX8l/yhoFLCg3r+sl8Kt35VwvwYvfTv
56PMj1H9Gd7cj0WGvYxlfo9eN5sj+T16zDiH+72MxZpbmZ+kRqNrWzI/SS0M
enM/OfLlR8nfEvNdSzswf0uzTnbj/rbHeMPrzD+TF8b7WjP/TN1Pyv55XsTZ
bObPyb7u+pT5c7rqfvMFkj/Xv23nzvw/+TtlxUTm/+m8yO7c/4+YU1Poz9Zn
i0ljKdsv6LzZk/n8+ftxH8f3D13bcbyPON/M236shGt/tjB8JuHcvPHyPrVt
yp61bF+jw52z9di+Rnt8es73tfAxK73ZPkgLlH5vY/sgdZl/le+D6/uZ9Gf7
Jl34x38K2zcpnb+I75uO3w/psH2WBrYgg9k+S3XexvF9dlzX2nS2X5N8g5dD
2X5NH5TNdZT26/yGdzaw/Z047BhjwPZ3eqmfWqq0v1dfj23B8AD5MIeqMTxA
54RM5Xig0EMljOEHUjB06QOGH+ib1GS+jsa+WtBB8hcaPo3nSP5jWI28fv+v
fgjLIc7BuCcX4h3E97OyZbyPOP8H4OAafRkXIx5eBfjS/MQyjjevAc5EPJde
6sDxXT/AdYi3dm70mfXfvqztoU7Q0FE1QqobREC9YB7sx5MaNBz7v/qyanx+
zPcxc9i/QmA/qEiS9wfcF/6AXz43RPbTTgp9WdG/KvZlHQF+FP1nQ5WNPA5U
MSnjcSHGg3bF1fsZziQf+1lFMpxJZra4y3Gm1TQTHh/ma4/g8SLGiU2d3a5L
8VLmJHVnKX5aCHFT2tm5MQwnk407c/YxnEzMvoRxnJzb424sw9XEqJNLEMPV
xIn03izh6l35cpw575gcdyIOt/6gHSHFXccMn/I4rBng9tRDB7WkuKWdyh5b
KY5pCvHLo4Yu+SyOIL5XTLqzOILkNfXicUR3P608FneQ1/5FKizuIOlXXvK4
Y3RxgxQWp5CMk2NasDiFhAzZz+MUnRI5vtWykuNdjGvMgnR4vHejfW8e/2Hc
V9U9icdLsTnNePyEcVMZCVolxSH6HaekS3GJRo08TgOIByYr5MGCblu1Z3Ec
2TtDewqL40jvsSU8jjumdnkVi/tIxv7F01ncR3zXtuNx364t/r1YnEjOLPs7
k8WJ5NGk19w/F2RVOki4QbwUMFLCEcpacly5DeLzvhCvYxxaDPGqBsSvGLc2
nyHHe40D3vH4D+O+7mEreRx1Zrc9j6v04HcZOPfCJimeuZnceakU39hCXLM1
5/RNCU/nvOjzLZPh68kbZH+V1P/fVAlHTkq7/at25nRy7IDst1/PLDkn4TCb
puMmSbgsE/DYyoWj/CTc47W743wJB+XCvjku/wvHJZ3UtDhOQXzyA+JtjL/x
ey0gXg35Icev+PteaifHgcdfzudxIc7DpTPKeTxW3rKcx2cYl12oluOoFaM6
8bgK46mPGqo8Trhvm8XjBowXxi/W4vi4Ovgix8uIk50NzTi+7PIhj+NNxJkd
U9pyPLfu1X2O7xA/tA+S8db2KTL+QtzyAfDTTsBTpYCLMI7SV6iHtvpQ0V/3
f+g1nC1/HPxv3RP9WAHkcTYo1DePwP9/ZMd/BkjvuwzvAT2sAHpY5JtROJ9b
wCuc00Shz6CAV3g/hX6DAvQbxDoyhXOa8NxwrJ9S0DcKoBNFfiCF/oQC9CfE
+jWFc50EOO8azzmioN8TQAeJfE4K/QwF6GeIdXYK50AJcJ4znqNEQZ8mgM4P
+bcU+h8K0P+QQP2RwrlReK46ntNEQX8lgI4N+dIU+iUK0C+RQB2QwjlTApzH
i+dAUdAXCaDTQn47hf6KAvRXJFBfo3AulQDnzeI5UxT0MwLokFCPQKEfYyLU
o7C/JYVzrBLhPNW6+6BzSLyucB/6NIrQp5FAvYbCuVcinBdaNx7g64uge6j7
LujrKEJfR6zjUDgnS4TzMOvsA3x0EXj9dXaGPpAi9IHEeg2Fc7VExd8L+NYi
8NbrfnfoGylC30iss1A4h0uE8wzr5g/wiUXgZdfNQ6hniFDfqFsvcG6XCOf1
1c1n4MuKwDuuWxdw3lIinMuE5xZROO8Jz+equw/nV+F5XnXrDngIAvAQ6tYp
rk9cr/g8+gX0E+gfIL4TIL7DeJBCf0wBr9DvgoI+XAC9OPKEKfTPFKB/JgHe
AoVz6wU4txDPj6OgfxZAD428bgr9Ngn02yTQb5PCuewCnNOO59NR0PcKoPdF
Hj6F/pwE+nMS6M9J4dxxAc4FxfPvUL8qgJ6VgN6EQj9PAv08CfTzxHO1BThn
m8D5rajPFECvSUAfRKH/pwD9Pwn0/8Rzo/EcaQLnR6P+UAA9IgEdHIV+oYlQ
ZyZQX8ZzkRNvKdwHfV0iVbgPcTqFOB3zaXjuL4VzgPH8X9Q7iaB/qvuu/+s9
0I+UQj9SrNviebcinH9bZzfQ+Yig+6mzP/QvFaF/KYH6LIXzXEXF3xF0LCLo
WurmA/Q7FaHfKdZVKZxXKsL5pXXzCnQaIug26uYn9EcVoT8q1jEpnJMoKs5z
4NOLoEuoWy9QLxShfoh1QwrnKYpw/mTdfg08chF493XrF3hEAvCI6vZZ3F9x
v0W/BP0vBOiHgXx1CvkZAfIziHMo8JEI8JEEXNf4nbi+8XuhH4QA/SFQX0Ah
z0MgzyNAngf7wGJfWAL9YGnaPhfpPFMBr7jvQB8E7ItAoB8Chf6xBPrHEugf
Sx0vbLwlnR86coa16fRJLVi8ys8PRZ0/6v4J6P0p9Jsl0G+WQL9ZGubLz0sl
h5oIHtL5pNfk84JRx466dgJ6dgr9aQn0pyXQn5Y2HjKkp3T+adKD49I5z2S7
fL4z6rRRt01Ar02hny2BfrYE+tniufJ4zjyB8+VRh4y6ZAJ6ZAr9bxOBh0KA
f4LnpicGKNwH3Wyin8J94JtR4JsR4JvhueAUzgnH88FR90hBB4n6Rwp5PAp5
PAJ5PAr9dSn018U+dXgeNoXzsfFcbNT7UdD/oe6PQj9eCv14kb+B5z1TOP8Z
z31GPRsFfRvq2ij076XQvxd5F3ieMYXzjfFcY9RrUdBvoW6LQr9fEfr9Is+B
wnm9IpzfWzfPQY8kgj6pbh1Bf2AR+gMjr4DC+awinE9btx5BhyOCLqduvQM/
UAB+YB2uRjyN+BpxEfTHEaBfDupfKORdBci7YtxEgWdIgGdIgGdIcf/G/Rz9
LfSLwf4xBPrGUMjfEsjfEsjfUuArEuArEuArUlznuO5xvUOfFOybQqBfCoU8
MIE8MIE8MPZHxn7JBPok04KyjkMftBcIXn2s+LnP2B8E+4UQ6BNCoa8ygb7K
BPoqUxs1fs41+bW9T2/pXGlVUV5f0P8C+2EQ6INBoQ8zgT7MBPow0y0PjuRJ
51ZPsFkpnQ9Prkfxc+GxvwP2eyDQ54FC32YCfZsJ9G2mUUfi+bnYe6dqNNwh
naMdkCudi439C7CfAYE+BhT6PCcCf40Abw36Pb9NTFa4D7r6xHsK94FHSoFH
SoBHiuOhiuMBvTQF/TTqpink5ynk5wnk5ynwUSnwUQnwUem7b0feSOeJzyi7
z+2WHCvbDXTCFHTDqBemkOenkOcnkOfHfo4U+lFjX0c8P57CefJ4jjzqYyno
ZVEnS6F/NYX+1QT6V+P56BTOS8dz0lH/SUEPijpQCv2uKfS7Rt4Unv9N4Txw
PAcc9Y0U9I6oc6TQH1uE/tjIU6JwPrQI513XrV/Q9Ymg86vzD8D7JcD7FTDu
xvgN42+M46C/lQD9t/DcHwr1FAL1FAHqKRT4wwT4wwT4wxRxIeJ9xIfQfwr7
URHoQ0WhLkOgLkOgLkOBh0yAh0yAh0wRByAuQDwAfZewDxOB/ksU6jsE6jsE
6jsU+MwE+MwE+MwU/QL6CfQP0G8I+w8R6DtEoU5EoE5EoE6Efcax7ziBfuN0
zhNPneg22whe854kjL7H/l3os4N9dwj026HQn5xAf3IC/cmpffl3E+XCQ8R1
RIdyJedoctzK2uR4WTH2kcG+MgT6yVDoZ06gnzmBfuY01+zR058NjpBIl6mP
vjSKJ0qtKpplvCjGPinYN4VAvxQK/c8TgSdLgB9L7/FrbSL05yD34D706ai7
D/06KPDDKfDDCfDD6bGIhNdsPLSNhX2KNB7VglJ5PHJfBgp9GrA/A4W6G4W6
G4G6GwWeOQWeOQGeOV1cXd6H2Y2G+HfidrsUbMPtBv0IKPQnwL4EFOp3FOp3
BOp3FPjqFPjqBPjqNHy4YWP2u9KFQSt1pd83peAG/31Bh09Bl496fAp1QAp1
QAJ1QOSPUuj3jvlzOskrodZ9lSO91l6en4PfyPMT9OcU9OioQ6fQH55Cf3jk
bdKs/geM2DqiQ/zkdbRaR15HoK+moLdGnTWFfvIi9JNHniTd7jDKgq13ceb+
NTv+u95BVyyCzhj1vBT4/AT4/ALm8TB/h/k8zFNBvz/s/4fnvlGokxKokwpQ
J6WgCyCgCyCgC6CYL8D8Aca/0P8O++ER6INHod5KoN5KoN5KQV9AQF9AQF9A
Ma7AOAPjC+j7hn3gCPR/o1C3JVC3JVC3paBTIKBTIKBToIgzEHcg3oB+Z9j/
jEDfMwr1XwL1XwL1Xwp6BwJ6BwJ6B4p+BP0K+hPo84V9vwj0+6JQRyZQRyZQ
R8b+/tjvn0Cff3ozc/LEQ74JBK/TM8rtDp8sxv5W2O+KQJ8rCucCEDgXgMC5
ALTJFHP19j9vkN8etW3b/3xEtmx+G2mmWoz9m7CfE4E+ThTOERCBv0+Atw/n
CeiK2Qr3oU/Q/+950H1Q0H0Q0H3geKjieKBfDIX+Mdg3hkI9nUI9nUA9nYJ+
hIJ+hIB+hDaunTWK2YueHePM7ebco8NCyW7QJ4VC3xTsl0KhLk+hLk+gLk9B
h0JBh0JAh0KXJt/PZb87DY+o4b97wa8F/HeH/iAU+oVgnxAK9X0K9X0C9X0K
ehYKehYCehaqaRb6hM1bqtVJNV+at1N6CHzeQl8MCn0ysD8GBZ4ABZ4AAZ4A
hfMXKJy/gH2MaXhVbdp642nUI+NJD2ndKWXK6w76QVDoD4F9ISic10DhvAYB
eN1UaOq3gfkHag7+IQj8A/RBoNAXAc9JpKDTIaDTEbCOgPUDrCdgXAn9SbFf
KZ4TSoH/QID/IAD/gYLeh4DeRwC9D8V8JeYvMW8J/TqxfyeBvp0UeBQEeBQE
eBQUdEMEdEMEdEMU8xqY58D8BvSpxL6VBPpVUuBjEOBjEOBjUNAfEdAfEdAf
1cUVGPdgfAH9GbFfI4E+jRR4HQR4HQR4HRR0TAR0TAR0TBRxDOIaxDPQlxD7
FBLoT0iBH0KAH0KAH0JBD0VAD0VAD1W3ztEP4XqHfnzYn49AXz4KPBMCPBMC
PBPsd4z9jwnoPak75+n3FRvJ/H0i/12E/XlFqGMSqGPiOa8U+s7hea/UXubz
U1mP1FcEXRLqwynoxVEnjjxUCvVT5KNS0H9R0H8R0H/RCSuGNO066TFeibv+
cv/n5kXYD4tCfyzsi0WBV0OBV0OAV/P/VXbm8TpV+x8/CEmKukdFaDDc+hkj
Kec8SxkyFYU0mJIp00FC6iBDMh+nhK4xQ4ZEhxDn2Z+UeYxkJhEhIZK5fs/e
+/PZx1l++977u/88L+ue1nnO3muvvdZ3fb/vN1hHBtaRGdaR4WTvfLlj1xmD
zvzqXeep3cZOdq8zOVAgF0o8KDA/B8zPMczPAevRwHo0w3o0tIk+uyg2TlDw
f05542RF94Rb3XFC/hHIQxIHCczzAfN8DPN8wLo2sK7NsK4N+2fn3zN0zBgk
fRY97o3zmUe8cU7uD8gBEv8HzBcC84UM84XA+jiwPs6wPg5z7246PvacYs1q
/zn9/nn/OSXvBuTfiHsD5h2BeUeGeUdgnR1YZxdh3hHq9O9xpl2lh9CK80yU
8wz5LyAPRn5eMH8J91r96HyU9XpRnXtmPh8tErST1yx+c5T1HWAelOo/osyD
gs5jWPcX1TlL5vOY5kE7+cXiGUeZNwXmUxnmUwXtituyfjCqeGzmuG1GO7m9
4vhGmX8F5mUZ5mUF7YrjsA4xqvhM5jhORjt5teLXRlkvAOZ3GeZ3RZnfBe3T
WM8Y1X4t8z7t76j2a+S0itvqMM8fzBMzzBNzmCcGrZNYF+lovZR5XZXRTj6p
eKUO88rAfDPDfLOgnfXsDuvZVS8PchedzJ8Z7eQxBu2sbwLrmxzWN4H1myCn
MZgn1c66zqCdXD+Q8+cwzw3MfwPz34J21oGCdaAO60BRg+0+57GwQ94jmC8H
8u0c5nsH7cyjc5hHB9aTgvWkUdaToiLb/X9ntDMPG+S6RZl3B+bjgfl4QTvr
UsG61CjrUnGS7f6/M9qZVw3yzKLMrwbz+sC8vijz+sD6VrC+Ncr6Vuxku//v
jHbmAYIcryjzAIN25gcG7ayTBetko6yTxXK27/T+nRTdqfNcP58Q5FpFmU8Y
tDPPMGhnva1hva2j/A3lbSiPQ+tAcufFoXe0DmS+omG+osN8RdDfZFh/obzu
4JxY58Y6LyaHXVx28dhB35Oh7wn0PQXnRjpH0vkROePijos3DvqhDP1QoB/K
XtdB6zpytMXVFk8b9EkZ+qRAn1QQ91EcSPEfcqLFjRYvGvRPGfqnQP+UvU6D
1mnkIIuLLB4y6Ksy9FWBvqpgfaP1jtY5Wm9p/aV1F/1WTotM669TwTqspdWu
ecf+efqugk96r7Ax99W87vfQ52d1xg1yvw+5oiBnFOSLgp4s0JMFerKwZ+ul
W9z11Z4XP4p3r8+E/0n21lfkZoIcTZCfCXq1QK8W6NVCGup466g29x/a6d6v
jcmVvHUUuZAgJxLkQ4IeLtDDBXq4MPbu6G53vdSza9QbP2Xm+uslcg9BDiLI
PwS9XaC3C/R2YUH7eG9dtHuVP55/4rqIXD+Q8wfy/UDPF+j5cli3G6x/XuPz
pfUPeXYg387R+od19BHW0Ys3BeVdKQ9LcS16JuSdcBTXYh6yYR6ywzxksB7f
sB5fnlkon0P5HYpr0bsgD4P8C2A+s2E+M5jPDHrKDD1l8qsG5746B9b5L30D
8g/IOwB6zQy9ZqDXLDjv0fmPzn3I0xdfX1x90INm6EEDPWhB3FZxXMVvyYsX
P17ceNCbZuhNA71pQTxF8RXFVchDFx9dXHTQs2boWQM9a8H+RPsV7VPI+xb/
W9xv0MvmaF2g9YDWAZnXBbF1lM+Ddqpb7eQtgLwFkLcQPM96vvVcky8M8oZB
zjCYrw7mq4P56qDvLfik9w1/durlXS99Dnk74l03cnVBzi7I1wU9caAnDvTE
oXPPPfvduNPxLt+Vde/jH4+/5t1HcmNBjizIjwW9cqBXDvTK4W2nshdf6jW4
8j53XHWu6seXyEUFOakgHxX00IEeOtBDhxl1l3pxpHFT/HFemnEkcj9BDijI
/wS9daC3zmFdPwY8W8uLI+WsuHuI+zwqjkTeJci/dBRHIh8jQj6G+HjBOZ3y
Lu1zOnpp5KMB6wsirC9QnS/I2TDkbDjK49I5nfK5FLenl0WeFvlZwDoFwzoF
sE4B5HUY8jrkXw7yPJT3oXwP+kjkJ5GXBKx3MKx3AOsdQP6g/MOqgw7Od3Xe
q3Neejjk5ZCPA/T9Gfr+QN9fcE6jcxud19AzIe+EfBOgH9DQDwj6AYP4qeKp
iqPSoyCvgnwKoE/Q0CcI+gSDeITiE4pL0BMgb4B8AaB/MFoq03r/dLDur2i1
kxcfrWC1k6MCclRAjkrwXtd7Xu93cslBTjnIJwfrUMA6FLAOBeSxgDwWkMcS
PP+aDzQPkMcN8rlBLjdYzwLWs4D1LKAfMfikJxFbGiVkd++rPgeUiXr3lxxq
kEsN8qhBryLoVQS9ilhX6B9xsfGGrxsv9Mbb+iP+eCNnGeQug7xl0MMIehhB
DyOO8Nztge5TmrjPxRCeu5EjDHKFQZ4w6G106G10yAlBvlPrnnbP3f7q8XzX
659f8nMd8nQdnbuRexMh90a8UCgPW3nZyjui1ypCz5X8VmDdUIR1Q+IhgPyc
CPk54pRC+Z3K91TeAj1P8j7J9wTWH0VYfyTuBMjhMeTwyOce5IEpL0z5YPQb
yXckzxFYx2RYxyT+A8jzMeT5gDyfIP9D+SDKA6HXR54f+X3AeijDeiiwHgrk
AsnjLU5CcI6rc12d59JnI7+NvDZgXZW4C0E/9Gka+jRBn2Zw7qJzGJ2/0OMi
r4t8LqB/09C/Cfo3gzim4pqKZ9JTIm+JfCWgrzN6OFOc4HQQLzhptdNLET1h
tZOPBPKRQD5SsE/QvkH7BXoRQE8C6EcA68vA+jKwvgzkLIGcJZCzFKwntL7Q
uoI+ANAPAHoBwDo1sE4NrFMDeU0grwnkNQXziOYVzSfk4INcfJCHD9a7gfVu
YL0b6CUNPuknRfaH6111x6s+TX1/3JL/DvLgQQ486DMFfaYgZwkHmb/UNv6w
93zl5fNFvjnIOwc556D/1KH/VNzsIH/psWdfveP6eYBcb4ec72CeUb2H6j9U
96F6D9V/KL+avr0I/Xvy7oH1gBHWA4pLA3KxIuRiiQsd5Fcrr1z5nPTPReij
k4cOrCuMsK5QPByQrxUhX0s8aijfVPmnigvRuyYPm/xrYH1ihPWJ4tKAnC5D
TheUb6Y8M+WdKd+MvjH5x+QdA+scDescwTpHkPdlyPuC8kaUL6L8EeWN0LMl
75Z8W2C9pGG9JFgvCXKWxV2GznN1jqtzXZ3n0i8l35Q8U6DH1tBjC3psg3MR
nZPofIT+JPmU5FECvbfRzZnijqeD+ONOq51enOgPVju5ZyD3DOSeBfEIxScU
l6CvBfS3gN4WsG4UrBsF60ZBfhrITwP5acG+RfsY7V/oKQG9JaCvBKw/BetP
wfpTkMMGcthADluwXtH6ResW+jlAXwfo6QDrWME6VrCOFeS5gTy3YJ7R/KL5
RvMMvRSgpwL0U4D1sA7rYcF6WNAT7OhT9VPz+q/wnjd96rmjj8GhnyF4rukX
dugXlhcgyPe25wd6CJwe1vyjuhHVkah+RHVi41vsfW/A8MCfC/KCI+TxB+2s
S42wLjWYD1XHoroW1bOojkV1LapnoS8zQn+mvJlgHXGEdcTBPEmeXoQ8PXkE
oHx3XQ9dB3oiI/RGyhcJ1iNHWI8crBvJ5YuQyyd/AZTnqveG3hf0I0boS5Qn
EaxrjrCuOdj/ku8XId/PUd6a8tWUv6b1M72AEXoCQY8PWB8dYX00WB8NcgIj
5ARC+STKI1FeieIA9OFF6McDfUxgnXWEddZgnXVwLkt/NHSuqnNZxSkVn6QH
LkIvHOjbCs4/dB6icxCdf2Q+D4k9F77HK/qV9fPkHDrkHELxUsVJ7e9D75RD
D1Xw97JO3GGdOFgnDvISHfISobiK4imKr+h60rfk0L8U3C/WmzusNwfrzUHu
okPuYrCf0j5K+yqNB3qGHHqHgvHGunWHdevi3oD8Rof8xmD9o3WPPZ7p13Gm
Ws8L698d1r+L2wNyIB1yIIN5SfOR/TyqDu5x63lnHb3DOnqHdfQgr1vc72D+
0Tw19tUX68TmraCdXhVxv4N28s/lEwnqYemJFv88aKeHJUIPi/iWIH8yQv5k
UCdLP0uEfhZxMkEuZYRcyqCejt6WCL0tEXpbQF5lhLzKoI6GPpcIfS6GPheQ
Yxkhx9IoH56elwg9L4aeF5BvGSHf0ihPlf6XCP0vhv4XkHsZIffSKB9M+RDK
j1BehPIhOljt9Mg49MgYemRATqZDTqbROSP9Mg79MhH6ZUB+pkN+ptF5BL0z
Dr0zQZ0CuZoOuZriS4A+Goc+mqB+irxNh7xNcSpAT41DT01Qp0kOp0MOp3gX
IAfVIQc1qBOnd9uhdzuo3zzLcfYqx53GG303hr4bQ98NyPOMkOdpVEdJD46h
B8fQgwNyPg05n4acT9CPY+jHMfTjgPxPQ/6nIf8T9OYYenMMvTkgF9SQC2rI
BQV9OhH6dAx9OiAv1JAXasgLhfJglBejvBdyRKM3W+2teQ7d36o7pq8H9PUY
+npA7ijIHTXkjoIeH9DjY+jxAXmkII/UkEcK+n0c+n2COj5ySh1ySsWrAb0/
Dr0/GfXC3KeRXyoODOgDcugDCsbPwPl3XOhauoFj1/NqnUTeaTAOsxX256MX
Jvrzk+al9Vc6eePp+yz7vfGlcUXfkKFvyNA3BHJTDbmphtxU0ENk6CEy9BCB
PFVDnqohTxX0Exn6iQz9RCBn1ZCzashZBb1Fht4iQ28RyF815K8a8lehPCfl
PSmviVzW6O9W+21j63c4VjEJredcLnRPx35m+cqsXpyKXiTQi2ToRQI5riDH
1ZDjCvqSQF+SoS8J5LuCfFdxikCPkkOPUlCHTu6rQ+6r+D+gX8mhXyngVxRo
fSil2tbBjl2nSU6sQ05sMI/Nqn+v977JOaiZ9/7Re6f5mtlr3fmiZ9P4j9z5
YwTnjWaDZs92x8G2p+vfVjI2Llrm8McDvU6GXidDrxPIoTXk0BpyaEHfk6Hv
ydD3BPJpDfm0hnxa0ANl6IEy9ECB3FpDbq0htxbKP1M+mvLQyLONJlntyd/3
uXBxzVhcbLfs7KJB08y8Cm29c5Mhs5Kz1Og2AFvbFC/StOJgs/2V5t65DP1T
wfmPzn3IxcVlq51eKtBLZeilAnm5IC/XkJcL+qpAX1WEviqQowtydA05uqDH
yqHHKuCilH/njydeW/GFY9fTkbvrkLsbvAc37pnprSfeMiu89YXWFQPWpSe6
74NyFe950X0/NKjsvxeWfTbvqV2x57zthINrz8We+2qV/HPPkmuqVTsUGwcp
qceSBsbGRf4jB7xzVXq1DL1ahl4tkPdryPs15P2Cvi1D35ahbwvkABtygA05
wFBeoPIElR9IPrATb7W/1G7is6uOfhn7/7Muqn7sK9O1YkHv/P2beuXzvDtl
Gl49P/3Y5RVTTcOxad75/rQvCvZ3/SWjx5V4fVPKuyZpUk0vf4D+L9xj1UMp
Dl7MaqcXDPSCGXrBQC4xyCU25BKDvjCHvrCAn5Pr+Jovu6zb4th1SeQYgxzj
iPaDHWut89Z/eceP8taDWgceqRQt776/VzT7o6n7Pl/yhv8eb3I14fjJ2Lxc
sN87NQbF5umX0wd6+TD5T15r9eSoOeZcegNTa1iqmdJ3rJdv0+Jkn77Z7ko3
YyYNuroh6XPTpUAPL59nzfrO2dw8JX1GrlQe7OYF0Xdm6Dsz9J3Jay7PuaHf
HOQwG3KYDTnMUL6m8jeVn0k+s6P8TfKZUX9HllzX+q3Fpo1tVyzqt8LkKnTK
y8t6aU7FSV0vLcXwu57pl35inhneuEJVN++raaUXJl+YMAWd6/39db1PR5sO
Ew54eWXTh26Y0qd0MkpOeC9bSnp7s69fXS9vTXFDxRHJfwa50PjTaqfHDfS4
RehxQ8nPl/d6OP4nx67XIEca5EhHtB//fFO2U+56vezi7N76/Suu2/OM3bbE
XW99vXh7e3f91Xymv+6avKf01JGx9+iPtWp2yBl7r377fcvG7vt0fNXGC1uX
STMvjFzxXe8Jrc239aMba8Tm20Ybfl57+epK06fzvXdeKvChSWlx3+ZBsefx
jiHNCxYevtnsb1TjaInY/axybP+nP8XuY+Y6gdKO6gV0X3WfdX/rrF+Vx83v
12fuuncMd/P86WFKp5fJ0MeEd9e+u6p+9tXo+jyisU/Tvc8wsyvXaSgfV/m5
2sctK1yhY5+iW1FlXFq0bPd5pn6ZpTnHrD6F8/ekdcj2yEpUuun7tLlZZ5gf
2gyMa5d6GhMeSH79UJb5OLFnj0nPkWK2RIbXOx97v/xQseD2dhNG4L24vtfK
X2lvql+86HqXkOv9rr1cz1OppByVXe/TX3M931No/vkJ3zPu2Hnm9PcZ+vsc
8sBBTrj5xWqn18/Q6wd6/UB+uCE/HOSHg74/Q98f6PsDueKGXHGQKw56AA09
gKAHEOSNG/LGQd446Ac09AOCfkCQQ27IIQc55KA30NAbCHoDQT65IZ8c5JPj
Jo6rAx/97uUn9uK4olfC0Cvh0CsB+sVAvxjoF8PtXXJ5P6f8a+Vdk7/nkL8H
8vdAXyHoKwR9hSAXHeSig1x00GMIegxBjyHISwd56SAvHfQbgn5D0G8IctRB
jjrIUQe9h6D3EPQegnx1kK8O8tVBHyLoQ3ToQwS56yB3HeSug55E0JPo0JOI
1U//oHkpU/4wOe0gp90hdxGP5rrT2+fPfWWIt+/Xfp++RdPGyh9ODskrpofR
0MMIehhB3rsh7x3kvYN+RkM/I+hnBDnwhhx4kAMPehsNvY2gtxHkwxvy4UE+
POhzNPQ5gj5HkBtvyI0HufGg59HQ8wh6HkGevCFPHuTJB3n8yutX3j45804T
q52+SNAXCfoiQf48yJ8H+fOgRxL0SIIeSZBLD3LpQS496JcE/ZKgXxLk1YO8
epBXD3onQe8k6J0EOfYgxx7k2IM+StBH6dBHGaxz7DxVcu9B7r2jOO2OdhO9
OFGhMdO8uJHiRe2zVvP2/zcX2+jFA95hHIC+S0PfJei7BPn5hvx8kJ8PejAN
PZigBxPk6hty9UGuPujHNPRjgn5MkLdvyNsHefugN9PQmwl6M0EOvyGHH+Tw
B/UYqsNQXQb5/De03zmkjcttwJ+NRgws2mMxqlwc7HEb6OUEvZyglxPk+YM8
f5DnD/o6QV8n6OsEOf8g5x/k/IMeT9DjCXo8Qf4/yP8H+f+g3xP0ezr0e2JT
/G2V3X3NDfmHvi8A9AU4iqs3XePHAYck+3FBxQMnlZjqxXfOjG/nxXsU56m5
Kc3b56++vZa379/M/T69ooZeUdArCvoIDH0EoI8A9I0a+kZB3yjoKTD0FICe
AtBDaughBT2koL/A0F8A+guCOhnVzaguhl6DG9q3HZjRYEDKYOypfr7VlQ8m
Y9++Xh4vqGXxR7Jkjd3vPXe3fnx67P7n+7K+xyOi/xT0n4L+U9CPAPoRQD8C
6EUFvaigFxX0JoDeBNCbAPpSHfpS5aPE0XLzvTiGnfdFz4JDz0JwrjGbcds+
jOMqfnvgRz8eNz3Bj88pLtdynx+XaXnaj9MoPpP7/TRvf14yPY+3X9c+Xfu6
qlZeE72uhl5X0OsKeh8MvQ+g9wH0vRr6XkHfK+iDMPRBgD6IoE5JdUuqV6In
4ob2g9vebvVtbF7+tECbnS1j83SRjlu8+bncnB4P9Ig9n0P69C+REnteb2/o
8+u2NLhwh3tf721+pLN7n/94wr+/9M+C/lmH/lnQQwF6KByda9NL69BLK28p
Ctcq6cUn7XwYeisceiuC8yPF0xVfV1xd8XHFyxUnV/z0ZcZTFUfdWNmPow2M
9+NqiqctSdjgxVO6DcjuxVcUV7k3by1vH37LsY0vuvvyp7gfp1fX0KsLenVB
v4ahXwP0awR1X6r3Up2X6r5OWu0N6z7397HYe/HCdz3yuO/Jo3P89+PulrlX
u/PjxBy1m7jz5XLOk+Xj/nrSfa4m/pL7sPuc7ePzdeJfebz79NBrub37pvul
83X7nJ1eYIdeYPlqA57kWus60w/i0A8i3wfEqxW/Vvusn5/dMnPHfacSk28+
UOPXS78G7eLVil+r9pqMayvOrfi24tqKc2v8iC/d8NC2225/+Rnnb7b/zHho
XsZHFRdVPFTxUc0n4kvnQLVWZ0b3dcT1LbjYj6PNLObH1RRPUxxNcTW9d8SX
7rIh76Zhy6c74gxPST7nxWtG9VjoxW8Ut1G8RusarWfElz6eNLbGpZ4rHHGP
+/RJ8eIC9a9M9uIEAzM4zF5cQHECrcPFlx725/v9ivTY7ojDrH1m5n1nBkc6
T59mPW9a9JMjjrTqDFVfqLpCemGiNaz2LmbJs+66bdKBgU+46zit37Rus/9e
8aJrfzsm0/ecW66l977fveTkcPf9r/e+3vd6/+v6ixe9O2lyput2qOoA770y
9dE/vfeM3i96r+g9o/EgXnTqXw9muo/x2/x57ebHOM9xftO8pnlO41O86IbF
cmYaV8/yefuJz5+eO51b2/k24kXPqnkp0zjX82nn7XTjOWM3Kw9nSZ589Q8O
Ppu4jJ9BPIRcaT2v9nNq86WrTD+S/YvGPyem3H/w8/cX7020n3ebU61zevq6
g37099rceJ3T09cdtCvfyD6v1/Wyudb0Hjr0HgbnZfSbO/b5/hnGleL4P8WX
OhW67MWV9Hm2yQEvvrTsnQ+9uEEc4w2KMygeofiE4hJBHMH3mTv0mEO8DPEz
xM0gz9+Q5++Q5x9wMcTJEB9DXAxxMsTHUBzMrk/PXH+e0T66zqZ73P9en/vi
lwx1+9l3+bl5Dy5dhzsvpD/t1pM2/nLdm268Tn+P/j79XfSwR9pZ41DjwM7f
0P3Q/VG7xoGdv6FxY+d76D1kv4/0HhJPXe16D9nvI/2+Xdb30feeY+W/6ftv
scatxmsNa/z/ZqYXaXN+V7T+7zfPy31od6L9Pe3nUePyjBX/pD/iBu6KuC3i
uIjfovip4qnqR3GxqYyTKT5Gnw7o03EUB9szrddnse+f2HvIJ3fGvn9wPfX8
29eZ80aU80bGeoA/Z68T1L99faZv7fBM+pBVifpUu76H/ju139o+++blQ1ZF
7Z9Xv7oPdv/67+z7Zf+9+jn758XRFldb+Zbi5Iqbq3xycS1VP6e6OXHlxJlT
Ha44TeI2qU7/JOPCih8rPtyp7lKv/YDFjVedv+r+1Y/qflUHrN+ruj77e6oO
R3U5+ruU7678d10HvZ8O2PMzfSFa3+l9J6+APAPKExNPXHxx5ceKFyx+sLjB
4nuK9ynOp/h64u2JsydelfhV4lZt2H4+2Y2zt19XfL8bdx/6Lz/eviD77aee
i7XvJWe7OTnbif+4/4XYPgI7Hui6OLaPMPHD/H2EOAjiIoiHoLpo1UmrPlp1
j6qDVP2j6pRUt6R6JdUDqD5A10f5tcq31fWUZ0XrYq1b5GOQn0F5gOKti78u
7rp4yuIri6ss/ql4qOKgij8oHqE4hOJ5ie8lrteL824dduZQN9TNX6Dfgw0+
MN+0uFLJPb+o+OeOK/tj7S1z+FziflV9LnHrwl1bxfbd6NJ/4K+xfbf55Ym3
vH23+BHiSYgjobpx1ZGrflx1oaoTVX2o6rhU16V6LtVLqH5CdRPKP1Y+cuC5
oJ9G+wmtP+WxkNdCeZ7i1ItbL169eNPiT4s7LT6seLHixIrPKF6jOI3inYl/
Ju5Z5/F7T+XKNQHZnQIT5xz50tTZn+jVh3YeFBf5IOcETGvTfbLLZZ16+yyv
DvTh+rOqPJUzBY22LU/omnW+yZqa14tribshDof4G6q3V/296u5VN6s6WtXP
qs5NdW+qd1M9iepLVFei/Gzla+t6yuujfZj2EfJ/yAciD4X4/uL9i/MvTre4
3eJ1i58rnq44uuJXimcpjqV4cOLDiQvXZdxGt94f8Y81izvz+npzbNK2MW69
//hzk4q94J63jXnQ40w+U72rx5msF78yrlmOGWhW9UTvnY+sNGZiTi+eLF6J
+CXilohTIG6BeAWqN1b9seqOVQeoukDVA6reRvU3qrtR/rry2ZUXLR+S9q/a
D8qbIo+KPCPyIsiTID+C+ObinYtzLu6wOMTiD4vvKd6nOJ/i5YmfJ27e+ud6
pzdZsg6jNi6sO7jcZtNm5tV7XR5LYr8XPnXXyclvHazinm833/y+x135umre
a0MGzkP24b/t/UfRreans2fzuuc+4ryI+yLei/gO4j2I86A6bdVtq15bdZKq
m1S9pOqRVJ+kuiTl9yvfX3nv8kgpHqA4gHwz8s9o/SCfhPwS8kqICy9OvPjw
4jWL3yxus7io4qSKj1rnvhK1YutVnCrw1byOXY3jf56GuBXiWIhfofpz1aOr
Dl31n6oHVR2o6qxUd6V6K9UnqF5BdQryY8mXpfiJPDry6ojnJk+GvBnisIl3
L/69+GninolLLR61OGbiv4pX9hj3fQu47/uD+75SbJ9p7Qffu1bDy5fQ54XJ
lbz9rPgd4nmI46E6fNXlqx5fdbCqi1U9rOrNVH+mujPVaahuQ/Ua8oQpDqTn
XT4h+YX0vMsXIn+IvCHi/ssDIP6/eNzic4vLLe6tOLji34oLKU6k+JCv769f
5Nm3lqLv5JI125hNSK4Gj/e79O/jJd35tsSg/t54vPx1fm8c5pn3cb1Tfy3C
Cz80aLR92GYUmlqpgJvXJP6ReEjiIIl7Ig6K+CfiF4hnII6B6odVT6w6YtXp
qW5P9Xqqb1G9i553+dUUP9P7Tr4l+Zf0vpNPRX4VeVXkRZAnQX4E8crFLxe3
XFxgcYLFBxY3UxxN8TM3f/RqlSfjJ2Dr9PJ/ncziYN2+nHNcPvx9s6o95q43
Gld7xXvud6/63Xve01pnuXa00IfAtz1KbLy8EldOvzLCzRsUN0ocKfGjxIUR
J0Z8GPEdxHsQ50H11aq3Vp216hhV16h6RtX/qB5I7zt56RR31HpPnip5q7Q+
kYdGXhr5aOSNkEdC/gjx3MV3F9dd3GRxlMVPFldUnFHxRVNqfZ/e70g3XC77
Uq3qZabi7tdTPT/ILQ/u9dbb85cdSnLn1xG/+fPqnV+ty7F2YmtMbvXI/Cml
05Cv9yYvX1e8LfG3xN0ST0d8HXF1xL8QD0McDNWfqx5ddeiq81Tdp+o9VR+l
eildT/n8FK/Vfkd+L/m+tD6Xv0c+H3l85NuQf0PeDfHuxb8X915caXGmxZcW
d1UcVvFXl198cuYHsX1ltYFd4/om9cSv7d7yfE9HSvv7zZN1cnvvsZf5/rr/
odNH/xn/MPoVun9X/06pqFg83suTF6dM3DLxysQhEpdIPCJxQ8QRET9E9fmq
11edvupgVRereljVj6meTNdTHkTFubXflxdN9WHan8p7JA9SsJ+lp0TeEvlK
5AmQN0C+AHG3xeEWf1tcWnFqxac9cHHkLjdfKu3jHZ9+MrQqisX7eVPL6i5d
4MZVOlr1jLUqH3+15ncHnS4JvWs36Nwa40/7+Zbiu4n3Js6b+E3iOYnjJN6K
+CvirohrIM6B+AaqE1bdsK6P6uvs6yn/k3xQis/I1yJ/i+I58iXInyB+i/jj
4pGLHyUOr7i84tHd+lcrL59s6S9TTrn5ZT0yPKdePpnyy3Se1XBY8gL357v+
3D3T+VS5bsdmnBo0wOl796o3yk4siRLn/HxX8e/Ew9PvFd9KvCt9T/FoxKfR
3yXugzgQug6qo1ZddVBPze/Z8UjDTD7W9k0WdHfzLyf2avuim4/Zca9/Xqzz
SzvelXXSohJv5OuIhh/1uKntYyNMlRrVvXwAnVPa8Zmcr4zeuTZPKk780KPb
ph/mmc+OnD3q5ofoPNKOJ5ScvrDQ2VvnoXlSqR5P9frGTJ90qKubR6RzR3v/
W2XXYTc/DTVGtiuwrOEm88OnRb38NJ0v2vs1rUe1PtW6VOvRUhbH+5Zjxos7
35P8+wU3br06qZAXr9Z5pL0fURxTcU3tRxR3UxxO8TfFgxQfUlxIcQrFLRSv
0P5Z+2nto7Wv0z5P+7va3Kdke2nExuv3KVoXap2o9aHWK1q/aN2i96jeq3qf
an7XfK95XvOO5iHNP3pONB513eiXB/3yoF8eOn+11+H0yIMeedAjD52z2utG
+t9B/zvof4fOU+11Dn3roG8d9K1D56b2e5kec9BjDnrMofNR+z1yifHlEdY5
FP3gDv3gUJ7q3Rx/N3M8ahwqv1z55soz1/2unWmfejrYr9ax2jUv2PclLK97
8r60OW68eF69Nk+68eMBo/248YDOzfO+PmGE2Trt8WwVrrRHvp7nvXjmb7nN
iENZ5ptRHT57Jj1HCj7d0NbLV1/34+W3sj2y0gzOW3fJ3KwzULHy6b/bpsau
w7fHkvoU3WqcHZu3l+0+D7/+WcjLh9c5n879dN539tGX7yw8fDPey1rmjxKx
/c2R9RVnuXn+5fKdjl6+uhKz4ttXuFTgQ5gFo7y6gLfPnZzUukwaclxpnPft
Ca3x99xfvTqCI7vyvTMyti6Z/1TpL26OrVPWP9zOqzv4aOXqnu77skLF7aee
jr0/q27135sPbDrrze8zvsjuzffFOc9rH37MymfQv+19+qTvzOzaL45K0DnN
nf0bPTh3V03njYEP9ahqugftu177ovCTJ8uFtof1M/+7B2YXnH0+YSPH2aTn
Vt327s/vOLO/X3Kp+Km9CRfZ3nPLwu0V2rcJbQ/r564mp0cN6VY9sdYlv/34
puItYvsHZ1a18uu79iiVmMZ8l7xvVnizYp3U0Pawfp7cMS7hqXp9EtNm+u2b
ns4xatDRb5yJb19deuabdonJR7k+/qbvP++rsCi0PayfUjXPNh9/18TEmZf9
dcnemeuGfu/scDZML3jzN6NSElPv8n9+2CNOjjXJm0Pbw/ppPGL7E28fHZ9Y
4IPLXvvifSV+qfPJIWfwluaF7xk5MfFkZT//r+ZXZap9eeuPoe1h/WxrNnvz
HVOGRVMeuOS1735uYJdr53927mrhtSeqPde03F3/XXtYPwVqeX9XVH8XilQZ
4f5da7Z63zOq75k84FwN93uGtYf1M22Pd1+iui8rzjcb7t6X9v51juo6f5ya
ltW9zmHtYf3ka+GNq6jG1biZV3q54+psL2+cRDVODuc/8ZA7TsLaw/p5Z4/3
XKTrudgydPeKfrHnYnVlb5xHNc7rH547wB3nYe1h/XzQ6nH3uU7Xc70eiyOf
xZ7r10ovdZ/TdD2nKc8nfOI+p2HtYf3w30GeSbXUorVuyXbLDe331UotWi82
z/y37VY/Qb5AJKS9SOZ+/mO7+on6f5fmPXOSf1cd/zpoHjNDeB3C2sP6Gdjr
zLYCGfOeWZ/u35e4PvsGd8mYx0zzU3N/ezR2H8Paw/r55WqFne9nzHtm6PQr
Y911yeKyyx++bh4zN3394bAisXEY1h7WT/xXd09+MmPeMwm1F5V1n4tbc74/
Z0XGPGb+TunWZnXsOQprD+tnwOwZi8ZlzHumb+H78rjP9fBnErrcnTGPmUP9
Fo5eFJsHwtrD+nl6xsLJvTPmPfNL3zPd3XmvZLciJdx5bLQ/X5krTttzV2Pz
VVh7WD+1Z3q/V/OSmT3jeF5v/s/hXQfNM6ZSuT7t3esQ1h7WT2t4103zkqk2
4ZXy7nU7VdK7j5pnzLUODw9172NYe1g/8ce9+655yazYULyve99HN/PGoeYZ
M++NCj+64zCsPayfssu9cat5yQxO8t/7K/x1guYZ0yH3Im+dENYe1k93f92i
ecmce9dft/T31zlBu9Y5Ye1h/djzhhdmuOVw1G6vGZtP0n67+F+3q59WJ5eV
Xn2iQDCvLk5yUipnvcVZk1Tk+u+JeVn6Zqse+55h7WH96O/R7y0WMt9WDJm3
w9rVz3f+7w3mvcJd/N+71P+eQfvn/J5h7WH92NetQMh8nivkvRDWrn6WPXrh
+utm2hyfNfeh2O8Nay9e8cL13xOb/0N71jsWjt759eblan9zz8kL1RYciE7d
0PFEmcM3BfdrzcjdVS//dSG0PawftlfW97T6D66n1f8N7WH92PfdGv9BuzXO
/2O7+rnp+Xqp1/1eTEpM/vzR2O/dWLlvm0lTjkKfV2Z8/NPlB38MbQ/rx/69
E4vGbvwXQf9G/ZRvWOSbEcd3h7aH9WOPK6t/fU9j9X9De1g//Lt03411ffQ9
jXV9bmgP66fuwTHXjwdMaHPsxO+x8RDWbl+HbYs77c2f5cb7a7Xjv23n7w2e
O+v73NBu97N3cadX5vwf87bata5NeOF0mbi47QllY5e5Yuz9onXzgInjDsyZ
cz4hdv3T+sfeL2HtYf1oXZ7W89r4RjNKJmZb0mmyuz7Xuv9i1Rzl42pXTyxd
rFZNd/0f1h7Wj/YV/Zo1qtxvRbvEeTVTS7r7C+1bmm4ZWTOuRp/EMtnjJrvv
97D2sH60L3p+wcISU1JSEqcs6pTf3R9p37VjJ6rHFZiYGF3720fu+iSsPawf
7euGX11Vo8XgiYnFNpSq6+3vuC996pHlcwseHJ/4ijPiiLu+CmsP60f7z5m9
ZxZ6bOqwxEGH83v7ULX/y2+P/rftdj/6vV/7vzf6MH+vrsMv/nWIrrCuj90e
1o+uW0f/ukVn8LrpPjbx72O0rHV/7fawfnTfP/Hve3QB77vG4Ql/HEZLWePT
bg/rR+N2oz9uo9k5bvUcJfnPUfpH1vNlt4f1o+eurv/cpd/L585+3veHzAP7
rXnA7meQv86Pap3/YdGPu7njbUJdb9+huISpuaTMGHffEdYe1k+u4V4cRu34
1/pDR/5du9bBmmceyfz3BvPt1sx/7w3tYf1oHb+Q88wbqUXXPZpxv4zmvcq1
Uj98N+N+3dAe1o/2IZpnvqqZOr9Ixngzmvfy7ls8ZljGeLuhPawf7aOe4zzT
+IF1HVdnPC9G896qh9YlXPe83NAe1o/u60jOM6kzi3r3V/u0XZz3fsoXl++6
5/2G9rB+tM/8lPPMljf3nnH3mxo3mvem1z/75nXz4Q3tYf3o92qeSeHvVT/9
/H6in1j92+1h/ei6deY88xKvm67DMc57h63rY7eH9aP7rnlmEe+77qPmvZXW
/bXbQ/vhuN3AeSaJ41bj8FfOe3ms8Wm3h/Wj5+4ZzjOFM683TBfOe6Wt58tu
D+vn/zsPaH7R/W1qvWft9mJ+PCSq8dX0kwbeuApr17/1Pt3McRjW/r9K1IWe

              "]], {
            Axes -> True, AxesLabel -> {"x", "y", "\[Psi](x,y)"}, Background -> 
             GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {-0.7334464586120832, 
               0.7334464586120832}}, PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyVvXd8FcUXNp5Ch1ClCNKkCUhXusyldxFQFJCmIL1I8StN6VKUFqR3UKoY
WpC6NwGC9AChhSAtBpAOARFIeHdm95m898w9b34//7kfn89wMvvs7NmzZ55z
pugXA9v0CAoICGiQOSAg2P59f3326Nevc3nxO/x2yUoZNvYT3iZZi8wunsPA
557Ie7XJ7CwGvjFzrjH9L6Uz8EhlJ9DAf1fjn1kU36bwBAMPUP/F7KH4cme8
oPgvjn0D3+vMx0Pxtc78DXy2c70Gvs/hx8Dd/+dwL3ilPFMcPFMcPFMcPFMc
PFMcPFMcPFMcPFMcPFMcPFMcPFMcPFMcPFMcPDO4F/xRnimO/6c4eKY4eKY4
eKY4eKY4eKY4eKY4eKY4eKY4eKY4eKY4eKY4eGZwL3iiPFMc/57i+H+Kg2eK
g2eKg2eKg2eKg2eKg2eKg2eKg2eKg2eKg2eKg2cG94IPyjPFwTPFYZfiK17/
mVysRKAXv3djah75LePvom91USt33DNrcPuDf/xk4198kadzhxq7xNAxo84P
jEuw8uSqG3LWxoMy7Ht04KhXRI4skFS6aAFxPKjJw5CSgd5XyYk5qh7ZL7o6
4wXGp3HHp+mq7Is2rv2NDR37twYelvPw/JPszGfHgupqPuCZzh88Uxw8Uxw8
M7gX64vyTHHwTHHwTHHwCF7B57ZXkz+YZf8/fj/7vHDnT76MEie+f/BGpcsJ
VrY9g0/9beMvz9f8Lu7gMdHh8qQ1L6JLidlNP8tZ5vIzKza2yc7yL6PFnjFq
vKjU3xl/O18tNT7hN2VXPHR+rYoRjv1y2aLkfDy7OznzCS6aS80HPNP5g2eK
g2eKg2cG9+J5pTxTHDxTHDxTHOsM6xTrEzyCV/C5MU3yi232/+P3k+UXVhce
d1o8uHq+e52T5cWR+HYrC/+VYM3KVPTj/ZfOivnOOP3vPnXHp3Xs6/sWfMGx
v/65mo/n5xHOfCL/t1vNBzzT+YNnioNnioNnBvfC/1GeKQ6eKQ6eKY7nHM89
nnesS6xTrE/wCF7BZ9Kbv9Y6X6uy/k3suXLhnNMXRbgzXt+HOe74/E2UfZGl
/pX90n6OjY7957mbyvl4Ysd8kK+MPZ+/PI/UfMAznT94pjh4pjh4ZnAv3ieU
Z4qDZ4qDZ4pjPcOPwn/iOcdzj+cd6xLr9FOynsHrHLKe8dveHV/Ksa/9ykPX
PtbzWGc9iwNkPdP5g2eKg2eKg2cG9+L9THmmOHimOHimON5DeC/hfQS/CT8K
/4nnHM89nnesS6xTrE/wCF41n47f17/dXf/f0vXPWas68zn0ga9/pvMHzxQH
zxQHzwzuRbxDeaY4eKY4eKY43ut4z+P9jvcQ3kt4H8FvYt3Bf+I5x3OP5x3r
EuOxPsEjeAWfldx54Hdc56o+8QadP3imOHimOHhmcC/+DuWZ4uCZ4uCZ4ohv
KI73McXx/qA4/B3F8XxSHOuJ4rh+iuP/KQ6eKQ6eKQ6eGdwLe5RnioNnioNn
ioNnioNnioNnioNnioNnioNnioNnioMXiuP/KQ6eKQ6eGdyLf0d5pjh4pjh4
pjh4pjh4pjh4pjh4pjh4pjh4pjh4pjh4pjj4ojj+n+LgmcGRTzN4pjjJ1xk8
U5zk6wyeKU7ydQbPFCf5OoNnipN8ncEzxUm+zuCZ4iRfp/ERw7M9bzI7pxe/
lH+Ku//vYcYbOLFv3F+KE/sGzs2f5iHJeGM+HD/0717Ikb178aa5vPgluIfB
MZ7a8VAc8+Ps0/ljHDd/5u8a/JDxxn3n5k//7v05Wc+9/t7M67Z6ne+P169D
jL8L3Mjrxrxx4PXrDGZe3cX95z+DmesKNsZ/pP5ukpFvB07HV1XjnhjjgdPx
1RR+wxgP3H/+OczI81dxxhv5fIyndjCe4u858zTsAKfjP3R4MMYD928/2Fif
wOn4COc+GuOB+59PiDEeOB3vrkNjPHBmvJHfxvo08uHuOvSfHw42cKwrimP9
UBzrxH/+PMzIn+O+Uxz3l+K4j/7HBxt5b9wX/3ZCDBw8M7iR3wbPRj7c5dl/
fjjYwMEzxcEzxcGz//x5mJE/B88UB88UB8/+xwcbeW/w7N9OiIGDZwY38t7g
meLgmeL1auS93CQgjffk+TfKXbLx9W9OK/yoz3KxNW5j7qcBydbII8P3Nre/
a7+ameHYr5O3il5Vf723JCDREgPnzV9m4zNKzxQPsu8RvRZeOBwVEG9F/Lis
bpyNXyq1v/GishFi/8i3fPLnL918mpWmY2BSQLzol9y1vBy/YM/ZbXPs8cU+
VvbFO6792rkd+wW+/U3OR2R359P8n/RqPnO+VvP3THXnP3/qVDV/8EyvFzxT
HDwzuJH3Bs8UB88UH/miyaPRNs+TPq49N8LG7zzM8+39whtEdMFM59cEJlvf
/Hz7Qv24Z1a2OZ2n1JrnFf+06JMnV2CiVSHsfq9fbfyv7tNG/ffykPhh2a6Z
HQPjrdEXLiy/b+OPh7+zNbDfcfF5px988ucX3fzkw/RB83YFxouf4+53lONv
XJzy0b2+x8WDHMq+6NzNsb9wn2O/VLyaj5g6w5nP/cud1HwytWsq5+/5oacz
/2ytcqv5g2d6veCZ4uCZwY28N3imOHimeOPr/3uwwua5bdzpyg9s/MM5We5/
ITaLBdGZ4osEJVvZZp2a9kdcgvV6YlnvyqYHRVBZK/hLm+cxQd3ztbmcYFUq
8cEP/zt7Qixte6VhhM3ziF+3pN1v46LtjmE97p0Wj7te8Mmfz3TzjdVrpEmq
FRQv4no8bhNpj5889ln3j+3xAY59AfuVXfuvH2aW8xGFpzvzWVi2jJrP0Hbf
yvl73op15n+0WWY1f/BMrxc8Uxw8M7iR9wbPFAfPFJ9QKuuhfTbPK2ondY5r
nFl02hUYWbrONnHqUNsTY22eWzVdtvZhv6JijWd63qv5D4sMEeemrbJ5rte1
WbXis0qLqKJTq3xS5bTwvFN2ea6geGvW5Bn/bZpVQTyvlm7T9g7nRHJ7J2/+
ys2fP3Hz557esctX2zy3jco+ZNiECqJaQpFDS+zx1yxlX7wb9GMLaT/vqynK
/uain8j5iLVdTuyW86la4kc1nyFb1fw9FUK/HyHn//OF1xFy/uCZXi94pjh4
ZnAj7w2eKQ6eKY71LJz1LD5y1/P7W531PMpZz6LROmc9n3qwT63nosFqvYky
bX3X81fOehZ1yXpG/jyUrOc/nfUsprrr+aRjX1D7i84463mas57F1Q9913MG
Zz2L42Q90+sFzxQHzwxu5L3BM8XBM8UHuv65Uy/l38TU645/Lhzg+Of1M5U/
FAFbHP98wfGfVq5hyn+KIpsd/5m9p+OfZzn+WayZ4PjnrPt98+fZ3fz5Qo/j
n9s5/lm0Pub456CWjn/+arFjv8dgx/6FwMzKP9eb48wnrdfxz3lc/7y4rTP/
7zr5+md6veCZ4uCZwY28N3imOHimeFJ1J94omD23fF971rnv639uO/HG049H
yPe7Z/6+dOr9vrW1E2+krzRfxgOekNE/qnig4ggn3qj07XIZb3gqjvCqeOPS
mDo++fPLbv58f34n3thzu5uMNzzrMpxR8UZiFSfeKOja7zbLsb+spxNvrHfn
k6+6M5+P3HjjYjZn/nNfTvGJN+j1gmeKg2cGN/Lb4NnIh7s8+88PBxs44meK
I36mOOJn//nzMCN/jviZ4oifKY742f/4YCPvDZ792wkxcPDM4EZ+Gzwb+XCX
Z//54WADB88UB88UB8/+8+dhRv4cPFMcPFMcPPsfH2zkvcGzfzshBg6eGdzI
b4NnIx/u8uw/Pxxs4OCZ4uCZ4uDZf/48zMifg2eKg2eKg2f/44ONvDd49m8n
xMDBM4MbeUKSlzN49p9XDDZwkk8zeKY4yY8ZPFOc5MEMnilO8lcGzxQn+SiD
Zy7PiV/K51vXsv7Y/5KZz2xeLlu9S1VpnjzYyKtrP3ww26bweyk4+DxP8rTg
M23n7PlnrzbzhO8xeUU6f/BJ5w8+6fzBJ52/9sNk/uCTzh/zePxVvhbFm4YY
fOKX8rlx3pvFL4VnNfjMWDH/zPD+2Qw+q3QPSW6SM7vB5xdhIdvC+2c3+Jz5
KqRP8cPZDT4tJu/6iMwffH5I5q/zQmT+4DMTmT/4fI/MH3zS+cMP0PmD5wyr
c91tMju9wXOP2m98VrxpBjMv5P5Sngv3z13xUnhGg+dRafMsDu+fyeA5dkme
DLOLZzZ4rlY179D+lzIbPM9h8pzpyfzBc3cyf/BM5w+ei5D5g+fRZP7gmc4f
PNP5g+dC6jky828j1fMSZPDs7KsEG/k3/CL/Vmpa1qg6djx8sHNSdI0dabw/
XVoUdPnIajE9oNF7Rex4eOa92SvTD0jrnfHbH+lqlVgpDj3MsjTe5vmPLXM3
RBRP540tlbOBeDBXnEhY1bT9i9/3rHfzhzf/cf7ukcFz61+34+Ge5XsunhwX
6D3bKNK7Yexe0a93+rjRdjw8IvC/jOlCg7xthqS7fCJ+q/g7Ns3H4XY8fPOP
tFu+t+dfqlxEcmTO1Zrnqu56oTyH1stR+1J4GoPnh7E51ob3T2vw3HJIzjdm
FzfznD3VfX9u5IXeVvf3PyMvdEndx5dG/q1/3rrPFs9+pfNvTZdOH1bM/r7D
7/mbhz+ZNHqXKD+uX+5wm+cNUwPyTx/42rrVptfLV+kixILRNT7ZYn93iBM5
at0bEODN9HWvy+88ihRH3TznUTfP+drNc17I36Pjr/b33ecjf750rNlzK2ub
OZlH/npUPG+zo9xLm+d07cLjPv3jPyuo3euPZyYdEPM33o8dbn/fNRtYsdgf
JV5a908vGnmsxi6d5yx1t/iLWHv+NM/Zxn0uKc9ZlJ95beSFHH8SYPBcXPF5
2+B5gXpO7xo8O/YfGPm37JUG/He6+COdf6v8Sd/eh2x+/1lfe2y60MdWxz8y
xxd7FSnyfTfpp2L2dzR+B58Nvjgj8xExvev8FS3t7+iuFUWvsgOfWlnenfLR
u6tPiC5unnO6m+e85OY5F4cWylE+KF4Mm/v8aZOdt626lZ9PrN/6tOj6ffZF
bezv6EV7X13/dM5dq3uOwpv/PnhMTH478H+BQcmi+v5j7aoMfGDd6fTzyYj4
SJ3nXLi6WtUEe/40zzlaPdePDZ6ruf6P8uys86dG/i1aPY/hBs97FB5l8HxQ
vY9OaRz5t7BcFeuGxp6zkH87NDTniZpBydbklt+HDJgdZy3vtODz67UOiaYT
T8UPsvn9L/Terd4lrlkXcg5rUbNutOgRWm9VuM0zfn++3yOyXb8zItHNC0US
nfCC0NiGC22eF+aJubs8Otz6tXqODRdsPHOPoJtzbZ77pH96tPbFKGv+gJHP
03Q6JZqFvhXc2+Y5Z/S3G87a80+f8e7gc+8c0nmhcWtn/z0o7pyR51ym1luc
wfMBxcM1g+eq7nuG8lzRfZ9Qnnc7doy80Azn7xr5t/iNap46/5Z18K2RvWye
B52o/CKx5ClxPqB22F77uh78OamhzYMVk2n1rHevR4lqNTyd739+Sqzrsz22
UFC89Szz08+X3wkXq1zektw8J34fuXnOXyq/bNbY5hm/TS/Oql/evi+/N2/Z
xr6PIvnY2ZCuJa+JwXH31haz7+Oeats+su+7+DKh6rl1c+LEoebzRx+27zvy
nFuuPNvX2J4/zXNud9aVkRda6KxDIy+0wlm3Rl7onrPODZ4ru+9tyvNw5zky
8m/f/KKeO51/2xgYIJ9TK+qgek7FpNVz1XOap4F6rq0jf6vnWsRWcp7r4nsy
vn/SXsfrvAkTm+68LbKvyxn+ke0HHrjreZ+b58R6Ljtg+Kw/bf88NdPTHLaf
EafmvX0/h+1n8jj+SP/CL31doJ/0YyJmnfJjItfjTMqPYT0/qqD8npHnTOP4
SYPnmY5fNXgu5Phhg+dujt82vu8yOH7e4BnxEXDk3z7pVEK+RwTyb48O3ZPv
Hav3f+q9I0YvXqzeO2ec95R1+rB6TwnxNFm9p+Ye7v3+IJvnopP/SXe82XPx
4i2xZpL9Xsvo5jkLuXnOrG6es8enbaflsHmO29i4gP3e9OT58vfmBe335tYx
6j0rSk8OlO9ZMaBFT/WejSg9Q76P9e+RcX+q9zLynFPyqPe4kec877z3DZ4L
OnGCwbMTTz43eG7hxCEGzw+cuMXMCzlxjvEdjfgI+ICWKo6yVr1WcZQnlxtH
BfVScZe1aqqKuzwlf0uj4q5qA1ScZrV/ruI0z5R2+1ScFu3mOV+4ec7zbp7z
wXdvBBWw47ouZ1Uc6KmyOYeKAx+/bijjRjGiVKiMGz1XMzpx44ipKs4Ug1ep
ONPz6vlCFWciz4lfmuc858Sxxne081wHGfmKgk6cbHxfV3XiaoPni04cbvDs
fncYPLvfKUa+wv13Rr7C/Y4w8hXud4eRr1jP5DmrkfnjOyWWzB/PIZ0/1kch
Mn/wHEHmD57p/MEznT94dr8TDZ7d70qDZ/c72uDZ/e42eHa/cw2e9bogPLvf
0QbPc5g8J50/eKbzB890/uA5A5k/+N1A5o950/mDZzp/8Jzeyc8YPFN9HXhe
5+RPDJ6pLhE8t3DyMwbPzvNl5jkxXya/YfBM5w+e6fzBM50/yRcZPDcn8we/
b5H5Ez6N70SaB9PxNsl3wc5dwgPGU36IfQPn8oRcnwGaf8M4ikNHRXHofigO
nQrFoaugOHQAFMe+NcWxz0px7AtSHPtYFMe+C8WxT0Bx5LUpDj5pnhB8Uhx8
Uhx8GvlGl0+Kg0+Kg0+Kg0+Kg0+Kg0+Kg0+Kg0+Kg0+Kg0+GNwPX9dd+84G5
DFzXZRNc12UTHDxTHDxTHDxTHDxTHDxTHDxTHDxTXNdlE1zXZRNc12X7583A
fesagg2eKe5b7xBs8Exx6PloXhH6M+TDkAeDXgrfu8jbQN+DfAPyDNCjYDy+
i6GfwPccvuOw34/vD3x3+NY7BBs8U9y33sHgzcDBM96flGeKg2eKg2eKQx8J
vSR0ktDzQd8HXR/0Z9CjQYcGvRT0U9BNQd8DvQ90PtCjQJ8CXQr0E9BTQEcB
nun8wTPFwTPDm4GDZ8QjlGeKg2eKg2eKQ28K/Sl0p9BHQi8JnST0dtD3QdcH
/Rn0aNChQc8E/RR0TdD3QO8DnQ/0KNCnQJcCnun8wTPFwTPDm4GDZ8R3lGeK
g2eKg2eKQ78LPS90vNCbQn8K3Sn0kdCXQScJPR/0fdD1QX+G8dChQS8F/RR0
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
aZeKxzCevjfBP8VDm4W+rmvbuXIjsJuM4yJ29YyV8VuuASpuF4cHHpRxu3iU
2FI9j77zSXnf+cZjKbhvPPZ/7TeFT6kj48I51eu/WGvz1+RIYKiMD591U981
ovcG9V3jWdK7jvquSX9GfQeJTg0+l99Bnpify6rvIMyHvgcxH0Nv5s7Hvy4r
2MDhfymO95GRl3Pvk//3eBIz3syP+d7HEOO6DH2XT70/1UEFGziui+K4LoqT
PlfGdfkfH2zEFb5xoHldhs7KN/9jXBfFSf7HiMcoTvqkGddLcZLnMa6X4iTP
Y8R1XHxFcaaeVJ8zQc47sIgdjTP96yzferRcxniKM/3uLHIujzGe4kx/PIuc
42OMpzjTT89izunW4ynO9N+zmHO99XiKM/36LOYccD2e4ngfvOcXN84N1+Mp
zvT9s5hzxvV4ijN9Ai3mXHI93r99o6+gxZxjbvnmqVJwpg+hRc5RMsb7n6fR
t9Ai5y4Z4ynOnBOk+2DS62XOV7IYvYFeH9zzzuHUDtN3UePUDtOPUT/v3HiK
M/0b9fPOjac40+/RYs6L1+MpzvSHtJjz5fV4ijP9JC3mPHo9nuJ4fi2/uHF+
vR5PcUZ/YjHn3evnncOpHaa/pfYD1A7G+7dv9MPUfoAbT3Gmf6b2A9x4//M0
+m1qP8CNZ5472p9T9x3mxlOc0QtpP0DO39HPO4dTO4zuSK9Laoc5L8li8jba
D1Ac/57aYc5d0n6A9CPVfoMbT3Gmf6n2G9x4ijP9TrXf4MZTnOmPqv0GN57i
8ANz/OIx9DwpPZ7ijK5M+w06njl/ymLyctoPUBx+g9rBeP/2jf6u2m9w4ynO
9IPVfoMb73+eRv9Y7Te48cxzSvvNar/Bjac4owPUfoOcJ6X9A4dTO4yeUPsN
aoc5/8ti8rEWo0vU657aYc4Rs5i8rvVOgUz7w+3/x2/kixsNDv+2QNf7UDvM
eWTW8CHF1ntt/9ClZIk1o8LTeLuUL3w7vOoKXR9ExzPnl1l/tb3U94rtHz76
c+ZvPfqn9W4aOORpq6JLdD0RHc+cd2at+VL1f7OuV5k+6ovi6bxrrty/u2fK
DF1/RMcz56NZC7KU73gmSPc982a+5etP6Hj4E4rnfrTv5QfFH4kpXyxbMNbm
b1GeemXO/7hG1zfR8cw5a9a0NhEbNtg4tfNWvn92hc96JeamH7FX3sfTQ34f
Le8j/Am1o+MWgp9rcmd2f+lniB2mv7H2M/7nb5z7pv0G6Yes/Qw33v/8jf7J
2s9w45nnmvZb1n6GG09xRt+r/Qw5Ty0lDmFwaofRCWs/Q+0w599ZzD6LxeiN
tZ+hdphz9Cxmv8basOP9edIvXD4zfpn0EytGryy2w/YPuj8SsQN/tH1n+lxN
ZZ8k1y9t2Xfx4XQb/+HDxoUW23bCogrdaHlltfi066oXl5KTLPzeK/FTy03b
/xA3ZrWtG2D/e/wGtbd2Jg3fIO4Vndghk/3vMx5aOe5CsUDv1bdz7W8SsVnU
Ob1talPbn/Q9WyXdlb6vrT07r353rJhXPPkr4cDB2GdWzuqf/jDXHt/mk+px
fYb8IdIUGrmlmz2+4dsT10yw8Us549+d23yXOHvuZrOWtj/5YXbGcmP6BXhj
vVMLlc4WKRLnrnunb2yCNeC7S5Vb2eOH7upVuHaMJdLtanKuuj1+f5rRyY1t
/Jdip7Nna+YVR18qnau1fXpMqzw23nL+nLU3b0eKyJcFFb7DxZu5+H53PPCm
Ll5i+NY/avR7ICpfaJ05OSnJCi792cQngZHiqjMfgfl8686nYYC6LvG5e10V
SznXVa3tncAqNv70ZZEDVWyeF1d+mv/CMq84+fPSM32LvRTp9kzaNNHGr60c
t/354D9Eox2KN1HZ5S3PYIe3sZMmSP7FUJf/wMMO/6+i/7dsV3KSqFUwaIv9
a415u/vNwQe3i2pX1xY43CTYM6Z081JN7ft2/HtP9snfLxezi6r76lk427m/
vedEqPsbcz2jXD+eF+76OZPvb7V+gHuvZV5q+zkLONM/XPsluj6ZcxW1nyH9
xrVf4sYzfoD2J9d+iRtPcUa3r/0SOX9Q+x8Op3YY/b/2S9QOc16kxeyfWkwd
gfZL1A5z7qTF7MNaMfVrj5dxxs877naQcceIxOX3P7LjDfglaudB+wub5Hv3
QuTt3m/K8yujqkWes9+/a3ed/22gjU9t0+rT7badnn9t6f537Q1ixvN1yo+k
W/6d8is5/hqp/An8CPwK/En01VILPrXX/a2xtUvNs/Hc/xyrFdrTEjNnd5tW
z8ZnJyYF1LTt1PgvvPR3LSLEx+cW5oxLfmLh9/HLv2NWlTos1udfEtnU/vf4
HXA8sEPv7w+Kcel3TLlrj6vQs9q892y8ctB/OXLnOySuPpmcvDn5hjVuYvzN
uv2eWrMXtz1S3XtcLJxX9c66iwlWq45byz+9+My61mhIaNHrR8XNbV9lW22P
v1anZZe7Nt7uRfKzUpOPiS5LlP7e+vP48XthNl5r6pDN302JFh0KTlb4MRev
6eKfu+OB13DxrfWLXawx8664nylv+t/s+Z5oX7NrPvvvTpir5iPKrXfm8zKt
M5/h9dR1iYBw57q+XftcXdew0K/bn7fxNAcSO9i/VnKemMZW2J/is6haX3fe
/p/4pfeOEWlsPh/+W3DMv28eEN17K77EAOfXWtnL4W1YfnVfRMwPzn3p2u6E
ui+zp/UPt/2g+Cr6pwy2X7TuFD1XQvrDctubvZw2K8hz50jl02NtfHOb494D
b20RLce1k/fds2qnc98vza2l7nvn5PNyXXnO/+6sq+29aqh1Bbzzhzd32nGf
xpm6Fe2v6Lplzie1mH1/7ZdIP3/tx6gdjGf8Bu3/r/0YN57iTD2O9mPkfE/t
rzic2mHqerQfo3aY81gtRhdhMfVB2o9RO8y5rhajr7AGDF/UVH7nXOmm6m2t
euMfN9pnf+/Aj1E7xQavC+tk+6vctdoev2PHIxlWHi0ZcG+TmP1k8LB28rti
9fqTO237LXp1vvZJ1TDx4pewCjKOaVj1SUcZ17RNmJVbxjOIGxDXIJ5JX77U
j3/ZcUb7SR8PfdvGrzXo1DNTzwMirMS3R8/a+ObBH115y7aT1LzA0fwhB0W3
7UtuSb/z+7/582yx/UrdE30PSv8DvwM/BP/Tp/QXixfbz/OtNyJvTrbx11+e
W7fh0XGR9slbi3+28UUD685cYdsZP273r68OnRAZI/561cT+f/x2KbwpMtuL
02JPznfSlrT/PX631z+8snT20yI6oF6HOva4+4OGvMhr47mnrc364cjTInG5
qhey5lY+2Wn3hQRr74ZBF8/3PiseFLmo8KUEf+yOB77HxWvvG3G037bbYnPV
e/Mr2n/nwIhfcza8ckqsdeah57XDnU8v53oFrjegu3O9I2u1igq18U03Pyg5
3rZTuuCvB36fd0JsvbN89sjGz8XJz8JmzbDxfAsj+72MPCIaOnxqv37b5XNJ
SEl5v0TTKc79+nBZZ3W/3r3pyRBt48lb+5d7aNtpfeXH+KdRB8QbtzIvahMb
6Km1YPGwgvZ9jIm6+9fyPbtF9PxYuR48ZxY766Hspf5qPSQmrZXrzdPiA2e9
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
dpi+XtpfUTvwSxxO7TDnlmp/Re1gPMWZc061v+LGUxz+Z45fPGYPN57iTH8z
7a/oePglDqd2mD5p2l9RO/BLHE7tMP3WtL/yP89gFqd2mL5t2l9RO/BXHE7t
+PY5ScHx7/3zEGLg8Et0XcGPceMpzpyDQOtADX9FzoeldaYp681/vzttH/Ol
/orDqR2mb572Y9QO/BWHUztM/z3tx6gd+CsOp3aYPn7aj1E78FccTu0w/QC1
H6N24Mc4nNphzhfW/o3awXiKw19ZfvGYPdx4ijP9DLV/o+Phxzic2mH6Imr/
Ru3Aj3E4tcP0V9T+zf88g1mc2mH6NGr/Ru3Aj3E4tcP0e9T+zT8PISxO7TB9
uXVdrf/nzhzP9BXX8RvFmfNNqF/yEp4NnOljaTHnoVC/oXHmnBTqBzTOnJ9C
n2uNM+eq0Odd43hO/eNG/0yLOZ+FPncaZ85toc+RxpnzXOhzkcKD/3Ne6DrX
OHP+C123Kdfrrj+KM+dca36x7oAz58jodUVx5nwZva4ozpw7YzH9Qi3mPBq9
rijOnFOj1xXFsa7840bfURqXpjyP/s/B0euH4sz5OHr9UJw5N0evH4oz5+no
9UNx5pwd7d+4ekA6HusK/on6Mawv379r9FPV64fizPk+FtN/1WLO/dHrh+LM
eUB6/VAc68c/bvRx1eunO+GBOW9IrweKM+cQpdRNEJw5nyilPoLgzLlFej1w
dVt0PNYD3j90PcB/UD+DdaH5+UDlz61n/VT+3Nv1Tg2VP7/dSOXDrV1fqHy4
927HEJUPn/Jc5fOtEv2uy3y+99q1JSqf3/mRys9by7N3kPl5b8UP26v8/OjS
j2UfdeuLKecy15X13A1LN5f6n44HS1yWOt0yoTOWSN1u1jl9eku9LnRs0K9B
z7ba1bEBh57t1T9q30SMeKT2Tbyz525T+yY7iql9GXG4j9qX8Ua4+zLMuU6k
P0mwt5RPXGqc90T6kBh1tQbO9N21mPOh9Hrg6mXoeKwHxBd0Pbztvh/oerjk
Pvfaf7r75tZEta+q60T6DVb7wtbyrz+S+8LWyXzOvnD1v9U+r5WhS3+5z2vl
m9Re7fPOzxE6s9jsOCtn3qjFB5KSrPFFGy1q2T5KTPs5PEbqpw9/9OK41FOP
qNf5sNRRQ18IXSF0htAXAofOcJCz/y5qTlD771bY287+e5o29eX+vuh3TO3v
Wwnxzv4+6qfSb1b6AV0/xZyrpe8vxZnztvT9pThzDpe+v1wdAR2P+4t4kN7f
Be77nN5f+Gng0E0N6qr0Nlo/P2BdlLqvWZooPY+14V1Hz9Oz4zyxq9g1q+eK
WbumJz+x1g2dOP3TpSfF16O9w6ROfcz7uZZK3XrCL/XXS706dJzQb0LP2bCI
Lw49Z4az2aXOSsy6onRW1qSQGUpn9UZcRanjElcXKx2XlXdWZ6XjQl3JP45O
TNeV6D4A7jlI9L5wdSIUZ8470/eL0znT8bhf0W48Tu/XHjeeovfroPueBA5/
tzH42T7pR+EPL04pvFI+V2tbhW2Rz9mY/h3nyOer2MlWu+V9mpZU/lN531a1
KDpN3i/oX6F7hQ4W+lfg0MF2elBoZy/7vjzLVum9pZejLE+7Eb2z3YkWbfrm
7j/Xvi/fRKya86E9z3J1m/fa3ShK67LiB4Tm7xN7TuvhcV+WuedQUf6duOAa
w6dRL8PpJ2mfbRZnzqfT94XizLl1+n5R/NDmLLK+wPvdHFVfIJpfuKXqC/Dc
zbmo6gW0XrHX4O+iRjZ+blXYWbtl++Qb4mhUl3Tp9x8RBUe8eD/avr/p73e5
ttPG/86Tc3ly1AEx62XjXv233bae/9dw5qmkG2JBkQqN2lw5JcJ6nMo2x77v
b+xaFVzcHn8k+4obB+edECu9meZXTwi3Evff79bDHr+61NJRkb3PiindYv6T
usTHJdPN227jG5o8Dh6fcFpAxwxdM/TMNe9WqFOv31OR7oNfs1az7af9eee7
bb3HRYuE84n28y9++GLjjyVtPF/rM+/k+/OEKNt9fcsx/QI8TwdH5bpv4wUi
Cm56L1ukaJB3WY5z9voZf+2XpXttvPXlf6+/Y/v/du1UHZDn33PqvCFRbsgT
VQeU7cGO4e2k357fpe54G3974atVHe04gTmPT/ttijPn9Ol1aNx3/+f36XXI
6fe4dXjP/W4mf5fV5VKcOR+Q6FtS8LJ1mss6Pm+/w6qOT3T96aiq44MublRL
VZendXE9a9aWdYVWb6euUCTPdeoKgycPkHWCVpWTqk5Q3Hr7rKoTvNdX1Tla
K0/mkXWOotEIp86x9RpVt2i9E6bqFgXqFq/X6ztqie1Half4yCv9yrluY7pL
f7L98tjkcfY6nFFszxFZDyQ+731Y1gFBBw/9O/Tw5V0dPHDo4XO8XCvrVcWo
FapeVfwYP0rVq3aL7CrrT8XGp6r+VMw8sEPVn87KqOpnPbn/UPWzInedlap+
dl8bVQ/rmdBW1cOKk7e3qXpY5tzDlL5VBGfOQ9TrjeLMOYl6vXG6Lzoe6w15
F7qu8D0N/GHJdbI+3RuyuJmsTxfX3fp06J1+GqTqzbXeMqTIMlkvb31zfqKs
lxfJfcerevmCod/K+nerfMdAWf8uPnbr3+eNVPX71qwdH8n6fdFxYHtVv9/h
Y1WPb21/XVjW44v+lZ6pevzzPfo2ku+Vf3L2GS/fM4krpjWT75esecvllHVc
kSW655N1XYNXbo2R9VyoZ0AdA+oa1hb2xVHXsP2M6pMgbp+vrNZLTe81tU4u
D1Z9HjzDY1SfB7Gx6yrV5+FhX9W3wVOkiurbINKWKKL6NjDnSJL9oxScOV+S
7Cul4My5k3o9cPocOh7rAXk1uh6QL6H+BN/NwD+bovq0WM9PDJf9VTwb3f4q
OXepvisGftPpG2N506l+L56MG+qrfi8d26o+MAa+t0Xizd523FBpatpZMo74
fVjYNfl+3NssMI2sr6M46kxQX4K6knJunQnwfS7+zceqP4/4arrqz+OZHz5U
9ed5e6jq/yO2XCsu+/94Tmcvovr/MOdykuc9BWfO6yTPewrOnOOp7y+nZ6Dj
dX8D931I7y/yW/T+Yv3SvBCum8n/aJw5b1TnfyjOnEOq8z8UR5znHzfOWdD5
n1hyvXge6PWCx0LkeplzUfV9pDhzXqq+j9x+Lh2P+4g4heLcvireM0Zc6vob
en+xTun9xXctcOa8V32/KI775R83zq3Q94vOH/eLzh/3KwOZP3jcQOYPvihv
zHm1+r7Q8b5+NWU8+sPivU3uO/oh0+fdwHEfqR3Sh9kYT3Hcd7w3dL7CzSdy
4ylO+jmnjHfzUNx4imNdIf8BnPRhNsZTHP4E9w046cNsjKc41ifFSd9mYzzd
fyT7YsZ6pveR9FU2xlMc65/eR9JX2Rjv377uz6xx0lfZGE9xPF/NyX0kfZWN
8f7nGeJ5i9xHPG/ceIqTfTfjOaU4eU51vnSET39FE6f9nDGO6QttjMc8aP9w
cr1MXjcFT++7b27kh7k+tNx4ijPna1vMedykn6Tp95j9feP9RfpsG3ERtU/6
bBv3ndE7gX9u/kb+PD25X5gfs064/uEGP2S9GXEC8x4xrpfYN9Yhg7P9zDk7
3HuNzp/wY8yf4niv0XWI95Shu3DfOxTHe4TieC9QnJwTYeD0OUJ+h46HP6c4
/DPF4W8pDv/J6Ac8D/0/v8a+P+ZNcfBMcfBs6BBcnikOnikOnikOPh8R/QNw
ut+924kz2T7nFAf/FAf/FAf/FAf/hs7B9VNc336uzzbXH9vo1+3yb/TZdvmn
OPinOPg39qNdntMTnQBwur/8k/NdxvaL5vo8Uxz8U1z3ISS47itIcN0n0P/+
ONuvmOszTHHfeDgFR79O2k8Y/fKwL4r9UPSfQl4f+2iLr6n6O3EmNFzW33m/
/uegqr9b0ypqaZCN5wvdnaNJsUDv39OtVbmbecXkJirvIVYlq/yG17r6m8pv
oK8B7GO/APXMyOMif4u6ROTtkK/zjfeCDf4p7hufmH2nuT6uXP9VY//U5Z/i
6GeK/qboa4p+gugviL6C6M+Ffl3o0zW9xp4Gch9lUNLsGLmvcqvW+y/T7T8i
vmlROGNDGz9cs9pq2fevx8Il7WtPPibmb9n7XoW3T4n3L9YNmmfb2Va805sx
jaIE+kGgPwT6QqAOHHXhqAdHPSfqO1HXCf7p9YJ/ioN/rh8v16+S6zNJcfBP
cfSBRV9Y9INFv0X0X0TfRfTzQj8z9DE74g2aIfeljtev3EfuUz0IDFH7U+UL
FFy138Z/3Fzlt3z2vzv2ee/CXUaeFu8VG9R7U0yUuHdsesfetp2TiQOCS96J
1v0m0FcDfSdQP496etTRow4WdbGohwX/9HrBP8XBP9d3lOuzx/XHozj4pzj6
56KfLvrook8l+laiXyX6u6FfCPq8Hfc26iD3+c4FtMlVMyHc2jR6zDi531fy
TqPXHWy8bbqc8rw8a/vr4j3Dbp0VmaoV/qLm0XBRe4g38WrSDWuFuz+I/iOw
jz4k6DuAPgToP4D6YdQTo44Y/HP9yrg+Y1y/RNonx7evF9ePKwX37aOVgqP/
FfoQo/8w+lah3yf6fKLfFPqsoD9eRNGSn/xh84zfNe+Nq1v9xWm9/r911r84
4a7/Tyap8wst3J9t7n1B3xbYR/8W9GtA/wb0bUDdNeqwUX/t20+J64PE9S8y
+7PR/SbwT3HwT3HwT3H0a0b/ZvRtRl9U9ElFf1T4H/QXRF/BWglr1P50mw3l
1X718Yq71D71sVyO/090/L9Iv9bx/7/0b1L5wNvXxIFDp1vOsO20bF3x9ISl
J7X/Qf8b+B/0uUDfC/S7QL066tdRtw7+6fWCf4qDf67vE9enheuvYvR7cfmn
OPpZo781+lqjbyz6yKJ/LPotov8i+i4GJh1/Q+7339p6poXc/z93on6Y3Pdf
VcOJf/at2SXjH8+TepEq/kk8me7uzRlxIq7pyYIHbTv3Dn847Kv2UbpPEPoG
oV8Q+oCgLwj6gaCeH/X9qOsH//R6wT/FwT/Xb4frd8H1qeD6S1Ac/b6hU4M+
DX11oXuC3gn9KKG7gd7mf2ezLJX6iVo51PkRnoVHH6jzIxD/G/W2OauMDLXj
z+tJZ6U+09O6RFmlz0R/JdhHnyX0T0E/FfRRQb8D2ifBd/2nXK/v+k/Bfde/
2beE6wPA1e9zdfdcvTzF8f1FcXx/URw8VyP7ccDpftB2R+/F1qFz9eNc3TdX
r01xzIPi4J/r58DVNXP1yFwdMVf/y9XtUhz8Uxw803004DQPudTR4bF1tVw9
LFfHytWfcnWjFPf1PyafXD0jV4fI1Q9ydX8U1/kEkkcl504a4ym+2tFBsvV9
XF0eV0/H1cFx9WvcddH8J3CuXoPLd3F6foqvbqL0DPp7P8L93vfNl6Z8d09a
UyZW6v92v0hfV+oBI26Hh0odIMbT78SX32wIkvq/QTGTs0s94Ok+rZQOEOPp
d825lndnSf3foibFS1Sy4/n28xu9HpdwWo/nvneozg3rk+JYnxRHHgR5EeRD
8H2O73V8p+O7EXE0vh/xPYP4Gd81iLMxHvE2xrVz427E24gLESciPkS8gvgF
cQvWG70urDeK47nm9ISGHrXbTqWn7PYsWukrdww5q3SVGE/jwzMZpy+Xesq9
+Stmk/rKWT0W/i11lRhP45l/lszrJvWUMQX++kXqKyf1DH9L6ip97Qcbzwun
c+Deg0yfDW7/3XuXeU65fSVOb1mR8uk+t8g3az/pPp8z3DwocOTdevVRemat
1539Y9PEufZzmGH/7YYyb9S66csyMl80etrCDjJ/0S/LuAEyn7Fk2naVxzh4
u+9B+V1dPXOlVfI7e4P7Pb4zQ4z63vjuQCP1/TFwZwX13XE1anRhGQfvDX9+
W8bFnb7/fIiMh6FnmlmtQl0Zr0HvBN4RR+i4zuV3oft+I/x4Vrj+GDi+97h9
HPo9yJwrLUj/gdTwVM+npnaY86k5PNVzq6kd5txqDk/1PGtqhznPmsNTPeea
2mHOuebwVM+/pnaY8685PNVzsakdotNIDU/1vGxqhzkvm8NTPUeb2mHO0ebw
VM/XpnaY87U5PNVzt6kd5txtDk/1PG5qhzmPm8PZc7qJngH+Sr+/SJzP4Wyf
AaJn8BI79HxqDmf7EjA6LurHUsNT1YNRO4wejMNT1YlRO4xOjMNT1Y9RO4x+
jMNT1ZVRO4yujMNZvRmjK6N+LDWc1acx+jHqZ1LDU9WhUTuMDo3DU9WnUTuM
Po3DU9WtUTuMbo3DU9WzUTuMno3DWZ0b/AbR7Wg/Q/RmHM7q1hi9GZ1najir
W8P1MH6S6l44PDWdm+FnmP5XHJ6qno15j9C8Coez+jdGtyYYnNOtCQbndGuC
0a1xOKt/Y3RugtG5cTirl8P/Ex2aXidEF8fhrL6O0dHp+/j/EU9Nj0d1dyTP
kyqemn6P6vToPFPDWb0fo+uj80wNZ/WBjP6WrhODB8bvUZzqcg0eGH2+cV2c
HhV2SD5QMLgeT/RvejzJE3I4Z0fjRN9F7ntwajhnJ0X/5tuPQtsheUgO5+xo
nPRD0HZI3pLDOTsaJ/X72g7Jc3I4Z4foE3R9uvDFw1LDOTsaJ3XH2g7JB3I4
Z0fjpM5U2yH5Qw7n7Gic1C2SeQanhnN2NE72N7Udkp/kcM6Oxsn+HeEhJDWc
s8Ptm9C8RGo4u//C7HcIbh8E/57xV3QfhMM5Oxpn/BXdN+Fwzo7GGX9F91k4
nLOjccZf0X0ZDufsaJzxV3Qfh8M5Oxpn/BXd9+Fwzo7GGX9F9zs4nLOjccZf
0f0RDufsaJzxV3Q/hcM5Oxpn/BXdf+Fwzo7GGX9F92s4nLNj+V6v4feM/R34
F+a+G/s4zH6E+P+5TyEY3Po/q0KHDQ==
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.7], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJztXXlcT+n3T1kGJWuyL2ObBiPZyRlrBtMwjCWTtexLIlHWKJE1oSnVoFC0
7ykHCRGyR5jIlmWuJYz9d+91zuf3+97f9/OdX/PK+JjfnX/ua95z5+n5PPd5
znOe87zP+zQYO+NHe309Pb2e5fX0DPS0/fMIVFzFVVzFVfyfjX9plXUneHgc
8rPut6mJlbIE8DvjkWc/fic2ajzr1+OrDqCfq7Hxu1ABrEwSF1mW2oZDk1ZG
enkcxtFnFzx/5yJAtM22Df2tAqGtSXTamIXHMHCQ9eRHfTXvg/L9oIkVbovt
Q9cHDnL7LeeVl9vveHPOC7EfIGTEyP2xHO8j90fXxq2ouGYcaVx5PIOdCh9J
v5OfBbar5d/b6ryle+GiSDw4oSQ8hxR0y45p2SFDgDsjor4I8wmDbI/m3Q/r
I0Kl6oO9kgSYcOwH6X1YUGFZR+n99g8Pye+Peup0XxrPIR+e2HlRqNy+d0j9
cLE/4Ddz7y2pPyPa+leQ+qNr41ZUnOcZz1OebzyOPK48nr4Lz96VxoWfjm8S
5PFx37O2pq15NLx7t+j43UpJWD2/bWiDTM37oHz/+If2oSW1v5jaPxG6BsX+
gGUPa7k/S+MOP5P6o2vjVlSc1zmve17vPC95nvL85HHkceXxbPL99ExpPPmZ
lzI0SRpPeh+U7xu/qyy1D91LDmomtX/4yZtBUvvDq+dni/2Bk/73oqX+VHvV
fZLUH10bt6LiivkMPJ95nfO65/WumM+gZT6Dlvmsed/zQ/ugbF8xn+GfMp95
H+J9ifcjtptsR9l+8jrndc/rneclz1OenzyOPK48nuEf7L7myfZ/3rWGsn0O
y7WQ9gs42j7oH2GfeV/nfZ73d96HeF/i/YjtJs87nm+8znnd83rneal8n8eR
x5XHs/Q4W7kf/LRdNfUf4W+ouIqruIqruIqruIqruIqruIqr+F/Dh60c6nV/
TDDy8/XQ0GMlngrQOLN/meV1orG82diEmreS0bRdj9Zr0wXYX3ptiTcVdqBT
n8j4V8cP4oiNjfcuChIg6aUwp/dBfzQ/cCOndZkjWHZvkHtvZwFiKY7WRhE/
N3JzCugXuhXuvd7dOrfUEXx+wr3QwUmAZnrxpcT24XpiuNz+HGwotz/bsFFl
sT8wqvUguT+DyjaX+2N0s4K/2G8Y9XNPuf/OtkFy/3VtnOeYzJ+2zTcac+77
P2k5ZzPmha/vNfeeAIWnJ8GmjWn4cmOH9t/eCceQcgcblt0rQEyvirWDLGLx
gfu8m7vPxmO1Q5f66R8XYNjm2o2udduFQW65Hb+7moIho34+syxTgAKKS55U
xM9LuUS82nsjAjqlTgt0yUnB7bnZe8+J47bW/Gl1sX14+8Wra1L7vU88kdu/
Gg7fi/2B+c3s20n9OdBhrdyfjLbdXcT+g6tLwQup/3Ges+X+69o4lzllN940
MAGn3R43r6qpN/YPMraPuCbA6paPQ/wM0nHZ6O83eFbfidU6Hd4TsUWAGRZr
ytw8nISZY3+MSLsdhYvGuDhtPCLA9rSuDarYRGL44AMLS16Mw71vJ5Ybd16A
5Yr4uSnFG78cM+xBfGEsPN9decnR7Dj0sDtV96o4ni4f2ofDivb7dNOLEvsD
t34zlfsT5m0v96dEXb85Yv8hbV9Vuf9JO6/bSf3XtXE2GOEqfB2cgmMu+Z6c
77gGyhi0L/A/I86f4EuG9+0Oo2eAq3WK43ZoNtp1YIirAE9MUvdYWqXh9EtT
p+R47oE2dbePm54mQGLytzaDV8Xg9k3R7a4FRMODDrW3vr8gQFOKmzdWxM+T
R1mXfe+XCM+s2v0xf1M0HBrQqFKoOP5e/jul9mF9jSZLpfavVFsjtz/2eoGp
2B8YnHZznNSfmrk3B0j9WVSihEHz4BR4/Uv/h1L/B5x4elfqv66Ns2I+A8/n
iQfuBUvzOXnIEGn+gGGlbHn+RHefZiDN5zqJw6T5BhZtlv+7+Qxa5jNomc/A
8zntQ/tQg9pvTe03OvcyQprPtS40kPuzbdKMfzefQVfn891JLrJ9Fl42/UO0
b7B5zzrZvj30G2op2Wfz4DWSPYQ2dsdke5g48bFkP3HTHps80X5C67KCbD9z
+zavL9nnb3yvSvYZytuMku1zT4qfGyni57YDt72T7LOz6WTJPkPtiidk+7yy
QmXJ/sP4G6b5UvtfeV6V2791c+APkn0eWdNY2i/A/DcPuT+DbvSQ7fO8qbbS
/gJvVjjppH12pn26Ce3bvF/nYYcvJH/Dd3Jcpri/Q9MO+vL+vjPCVvIHsPE7
i3TRH4CdP29LkfyB0z1nOkr+xouxPxSI/gYkjc9bJvkb2RQ/H6aInwfueBco
+RuBw0x6iP4GJCcfeir5G4Pj20v+DESvaSu3v6p1iNz+1uC3FSV/48yDULk/
d2YJ5lJ/WiS89pP6zc8nYzfqpL+h4iqu4iqu4iqu4iqu4rqJa4u/uad9X+3W
5vWYVar/rAvjwvBSy0tOt0W81rBB5sOruOGzZ0H9W/ruQONcaBP7QgD/qZ4G
tWymQ9C80yMvrPHDl+u+atbqrXiOaHXNc0WnFV1eewztZrYiMpX/7tzwSe5e
m4PAI/90s4R96Xh9pl8tPT8BHI6fttq9cSscrPcyadHoFHxqf9lz5SkBJkwa
Hrh/Xij8uH/LSvGJrkOmukXf/3z8Xm3xtw3DOss8KH723R0m82Tm7OtVI3xa
KFZO+j7czHE/fpV1r9PdaAEu/DasZ9IdX9xROiu3QWgG9usX/KvdcgFSKc7Z
ShHnHDw/N3/6vHA4vPq5gd+WNPRbNjHhJ/G8tsHGomCPZzSYVfJ0O7A6Bas6
vh80d78Axww7G04fnQLGd/0f5y+Nw9T8mv4FyZ9PnFNb/O1Ih4ZOIzMRbRKc
v/pyZhiWNN7kvSlegOvtH/wujTs/vTI2y+N/PvjKj+W/24m9ri3/qodeCjYo
efBqnRMCPKA4Z5Yiztm96cNJk+bGQpMGnaZ6RcajV+ug82nHBHC+6ZDz29ZE
0Ftu3stpTAzef9HZMvOIAJWeVCs0uH8AHBfVK7NhbRieSsy80Dr484lzaou/
ZY1Mq/D6XjpWbnqhpRHa4ZQR7Wy/2SJA0/x3qXv3JaNv+PB+vjUD8cW6vIoF
4vsF5VcbfbUlAvnZp+t3R8JuCOBJcaHHijhnlfbtxq/omgjTL2d3fVhzF+SZ
FTYvd16Aaf2wsZN9KpzN29Cqz5oNcOaYY8Dj4+J6aTja1Wt5BthWvtUkIMcR
C1K9XS28Pp84p7b4m77rYutzbhlonRE6uax1CPya/3Ve32UCtEyZ5mFuk4qw
qVR8/boR4JL8KmowCpATuT5/46MYLNmr+lPzqjGacdPGE56cc/um9O/8/Lbq
cXld2Hn3GLU0Lhnuh50dYFs7CoIeWBX2PiyAY4Nysf6300G/97ysppYhkGRi
kdt14+cT59QWfys8pH9PXKc4Yvz30jqFMpcbXZTWaV8j63PiukbrOb69xXUN
+mV6yevaokL97rO+isIhoReXrouLh0HBNc/UOPPfPGG99/8a5/wm1tJs+JVI
eN/bv3fXV8kwYde6ngcyBLj7wR5pnmyX5kx77ibaMRhhPVCyY5Cwd6Rsxz6X
OKe2+Nup81Zvpon7fZk5XV+L+w6c0G8v7zs7t7WS9ik899J/pbhPgZ/jTXmf
qnw9YPGimFC01Gt0MigoDWp+OfyK9z4BgOKcVRVxzoahxwVj0+1g2KZcq3s7
MmB2bf1uZuJ6efV1JWmfhRt1GyeI+yz0X7tV3mdLlXteKI07Px9fniuP/+cS
59SGtyP/qR/5U/PJj/I2DpL8LhyCtbJEvwtWlvOX/S6X/RnLRD8N39W/2070
02DqESPZT0unOOcARZzzis37BpIf2DOzqaPoB4KfQ2PZD+yc8LaV6DfCd+eP
/iz6jdDcsY3sNy65XUfyM6GHo5OH6GeCwdhM2c9U45wqruIqruIqruIqruKf
F64trsjxL46HcRyM4zV83uVzLscXON7AcQY+Dyvf5/Mbn+f4HKc5b+h4/Kqo
OPMjmS/JPEnm8zG/j3l9zD9jPhrz0Jgvxfwp5k0xv4f5PszzYT4K81OYl8L8
CeZTMI9C18atqDjzTZl/yrxT5kcyX5J5ksznY34f8+6Yf8Z8NOahMV+K+VPM
m2J+D/N9mOej4aMQP4V5Kbo2bkXFmb/LfF7m8TLflPmnzDtlfiTzy5hXxnw+
5vcxr4/5Z8r3mS/F/CnmTTG/h/k+zPPRtXHTNZz51rEKHQPmWzP/mnnXzBsu
UOgbMG+YecTMH2b+K/MHOZ7G/FfmDzJvkHmcTRVxTuZxMq+T+ZzMR9TSPijb
Z15dT4V+AvPqmGfH/Drmh2UrdBWYH8Z8MeaJ6dr31TWc+frM32fePvPLmW/O
PHPmQzM/mu0z83eZz8s8XuabMv+UeafMj2S+JPMkmc/H/D7m9enauBUV5/wH
zofgPAjm6zN/n3n7zC9nvjnzzJkPzfxo5kUzf5f5vMzjZb4p80+Zd8r8SOZL
Mk9S18atqDjfsxop4uR8L8j3hHw/yPdYfA/A8X++d+F7GL5/4XsC5fsc1+Y4
N8e31Xisiqu4iqu4iqv4x8OHBA4UOszajP1D69yftCka4y71Tlgg7b9fWdYZ
WcUbu95dOquNbwLe/iHiMIr7td2I7y/aTV4DjTNmvDAJSMEr616bxv0N/Iq1
pd/41ZoZhuW7fh03PhOxldMZZ4mH0G7fzWCTM3Z4Su/ZabP76fh2TdMZLbYU
X39erl2Zd6NOINYqU75E5r5kjB8fUvfuJ+STdH+T4uORmo55ATfMDX2C4EFU
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
9+e/AJjTbz4=
              "]], {
            Axes -> True, AxesLabel -> {"x", "y", "\[Psi](x,y)"}, Background -> 
             GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {-0.7334464586120832, 
               0.7334464586120832}}, PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyVnd/LZtd136WcqJIjPbbscZM0WI5t5jZgalemEMhD6IWMf7TkKleFKooL
BdGL9iJ24jZ/QEOEKiIntHYFbrBl130g9mCaafW6kQ25KTYMiuvxRU3BUBg7
GouWmEqZlvc5n3OyP9/97Uzn5uX9sGa9+/mefdY5z9prr/3uJ//xr/z6T9x3
331/5+H77lv+78+/9eKj37xz58oFP7//zffc/PE/+w+/dPHEm9/17NW3Bv+9
//Iz/+2JZx8J/sWHr/z20zf/WvD/fOnn/uD//tL+f71k/uVL/v3g913+u3Hd
/N+c7X/J/N+e/Qf/j+fxHM0/dx5/8GfPnzf4fzrrE3z9vfELdLXO5uhsjs7m
6GyOzubobI7O5uhsjs7m6GyOzubobI7O5uhc+AX6WWdzfjdHZ3N0Nkdnc3Q2
R2dzdDZHZ3N0Nkdnc3Q2R2dzdC78Ap2sszn/35zfzdHZHJ3N0dkcnc3R2Ryd
zdHZHJ3N0dkcnc3RufAL9LDO5uhsjl9zfjdHZ3N0Nkdnc3Q2R2dzdDZHZ3N0
Nkdnc3Qu/ILPbZ3N0dkcnc35e+b8bo7O5uhsjs7m6GyOzubobI7O5uhsjs6F
X/D5rLM5Opujszk6mzMOc343R2dzdDZHZ3N0Nkdnc3Q2R2dzdC78gs9hnc3R
2RydzdHZHJ3NGZ85v5ujszk6m6OzOTqbo7M5Opujc+EXjNc6m6OzOTqbo7M5
OpujsznjNud3c3Q2R2dzdDZHZ3N0Nkfnwi8Yl3U2R2dzdDZHZ3N0Nkdnc3Q2
5/OY87s5Opujszk6m6OzOToXfsHft87m6GyOzubobI7O5uhsjs7m6GzO5zTn
d3N0Nkdnc3Q2R+fCL/g71tkcnc3R2RydzdHZHJ3N0dkcnc3R2ZzPb87v5uhs
js7m6Fz4Bf6sszk6m6OzOTqbo7M5Opujszk6m6OzOTqbo4s5v5ujszk6F37B
/7PO5uhsjs7m6GyOzubobI7O5uhsjs7m6GyOzuboZc7v5uhcOPm00Nlc+brQ
2Vz5utDZXPm60Nlc+brQ2Vz5utDZXPm60Nlc+bqNf+Ljb/mLJ5592wU/rb/5
+vux2AeX/7i+5vIfvI3feUjZx3iaPv67337ro09d/eCVC36KHwvH3n6O5oyv
+ff4sWvjL3839JF9XPc2fv/dHz735lfu/PPM6/7dOz/71Tt3DvF34ZHXvfH2
l+/ceSjz6iuf5z+X8rmWsP97l3/3jci3w23/+KXda2EPt/0HLvl/D3v4PP98
ijz/+872kc/H3n6wN3//eZzhB277j551CHv43P8S8xNu+6+dr2PYw+fjOYQ9
3PbrPAx7eLGP/DbzM/Lh6zyc54eX4Mwrc+aPOfNknj8/Rf6c627O9TXnOs7t
l8h7c13mfg7B0bnwyG+jc+TDV53n+eElODqbo7M5Os/z56fIn6OzOTqbo/Pc
fom8NzrP/RyCo3Phkd9G58iHrzrP88NLcHQ2R2dzdJ7nz0+RP0dnc3Q2R+e5
/RJ5b3Se+zkER+fCI7+NzpEPX3We54eX4Ohsjs7m6DzPn58if47O5uhsjs5z
+yXy3ug893MIjs6FR34bnSMfvuo8zw8vwdHZHJ3N0XmePz9F/hydzdHZHJ3n
9kvkvdF57ucQHJ0Lj/w2Okc+fNV5nh9egqOzOTqbo7M5Opujszk6m6Pz3H6J
vDc6z/0cgqNz4ZHfRufIh686z/PDS3B0Nkdnc3Se589PkT9HZ3N0Nkfnuf0S
eW90nvs5BEfnwiO/jc6RD191nueHl+DobI7O5ug8z5+fIn+OzubobI7Oc/sl
8t7oPPdzCI7OhUd+G50jH77qPM8PL8HR2RydzdF5nj8/Rf4cnc3R2Ryd5/ZL
5L3Ree7nEBydC4/8NjpHPnzVeZ4fXoKjszk6m6PzPH9+ivw5Opujszk6z+2X
yHuj89zPITg6Fx75bXSOfPiq8zw/vARHZ3N0Nkfnef78FPlzdDZHZ3N0ntsv
kfdG57mfQ3B0Ljzy2+gc+fBV53l+eAmOzubobI7O8/z5KfLn6GyOzuboPLdf
Iu+NznM/h+DoXHjkCZWXC53necUluPJpobO58mOhs7nyYKGzufJXobO58lGh
c8tz8tN6vuN7b/4XT9/MfOaHfuEtv3zzcefJl8irb3H462/50rUf7Bw9/0x5
WvR84O8/+nPPfjbzhO8veUWPHz09fvT0+NHT49/isMaPnh4/4/jRx372w1c/
eAg9+Wk9v/j837h689qbQ883vffnnrn29FtCz/c9dfjLJ972aOj55Onw5WtP
Pxp6PvP64R9d/dNHQ8+XSt71tsaPnh/V+Le8kMaPnj+l8aPn+zV+9PT4iQMe
Pzo/9Nkrt5549sHQ+dd/8e2/evWDD2VeaP1pnX/+6b/+3pvX3hQ6/9YDP/2v
rj39U6Hzd/71Tz/07NWHQ+cPPP4z//Tpmw+Hzs+VPOeDGj86P6Xxb3khjR+d
36Xxo/MnNX509vjR2eNH53de3keZf/vNy/vlJ0Ln87rKEjrzM94ffvmtv3jz
2k+Gzq9+562fu/b0A6HzR/7J297+7NXMc75Y8pyPafzo/AmNH509fnR+XONH
53+p8aOzx4/OHj86/8PL6/4XkRd6z+X1/XHkhW5eXsf/HXmhc7769cgL8dM6
P3x5n96JvNCvXd6P94XOFyXP+TGNH53fpfGjs8ePzs9r/Oj8Kxo/Oj+i8aPz
kxo/Ol+9HM//CJ1///Lv3gqdz/7/PHQ+63A7dD7fFz8KnflpnW9fzpP/Gfm3
L5Q857s1/nF95Fbo7PGP+eTbofMnNX50/oDGj86vavzo/M3L8V8Lna9f8m+E
zl+/HM+3QucvXdq/Ejp/6vLzfjd0Pn+u74XO/LTOXyx5zq9q/Oh80vjR+WWN
H53/SONH589o/Oj8ssaPzo9r/Oj83nW81vmPz34iL/S7578beaE/PI8z8kLX
z5+r5N++EXmh58+6RV6In9b5fRr/+L1jHz86P6Pxo/MLGj86f0XjR+c/0PjR
+QWNH51/cJ7nofPfXMdrnT9+vo9C5/Pnuh06P3S+T0Pn8/fNW6HzY+c4EDp/
ruQ5f6jxo/P7NX509vjHvNDt0PknNX50fkbjR+d3avzo/A/OcTu+3531uRM6
M17rfH7vej10/q/n507ofB7Pj0PnXzs/10Lnz5c855MaP/q+SeNn3B7/mK94
PXT+M40fnR/T+NH5KY0fnT98fg8Jnf/8/N6SeaHze058j2a81vn8/Wjn6Ly+
d8X36PP3tcxzvlTynB/R+NH5VY1/ywtp/Izb40fnVzR+dP64xo/Oj2n86Pz4
+b06dD7Pw4dD5/V7R+i8fk8Jndf/Fzqv3yNC5/V7R+j8YslzfkDjR+fvaPzo
7PGj7zs1fnT+msaPzh4/Onv86Lx+Twyd1++VofP6PTp0Xr93h87r99zQmfHG
e935e3To/FzJc3r86Ozxo7PHj84Pafzo+wWNn3F7/Ojs8aPzg+f8TOjs+jp0
/vw5fxI6uy4RnT98zs+Ezuf7K/OcjHceNzLP6fGjs8ePzh6/8kWh84c0fvR9
h8YvPeN7ovNg2/u28l34uSUdsLc+8h+85Qldh0b9mfNv2JlTR2VO3Y85dSrm
1FWYUwdgzrq1Oeus5qwLmrOOZc66iznrBObktc3R03lC9DRHT3P0jHzjqqc5
epqjpzl6mqOnOXqao6c5epqjpzl6Ft2Cb/uvp/nAK8G3fdni275s8W1ftvi2
L1t825ctjs7m275s8W1ftvi2L1t825ctvu3LFt/2Zc91Cz7ua3A+8Erwcb/D
Ejqbj/sdltDZfNzvsITO5uN+hyV0Nh/3Oyyhs/m432EJnYtuwdHZ+T10Nkdn
c3Q2R2dzdDZHZ3N0Nkdnc3Q2R2dzdDZHZ3N0LroFR2fn8dDZHJ3N0dkcnc3R
2RydzdHZHJ3N0dkcnc3R2RydzdG56BYcnZ2vQ2dzdDZHZ3N0Nkdnc3Se5w9v
XDdHZ3N0Nkdnc3Q2R2dzdC66BR/7CZyiz4Dzcuhve7jtx74Ep+hXYPuxX8Ep
+hjYfuxjcIr+BrYf+xucou+B7ce+B6foh2B75oPt4bYf+yScon+C7cf+Cafo
q2D7sa/CKfot2H7st3CKPgy2H/swnKI/g+3H/gyn6NtQ5lvYw23PvHU+k/lp
zjw0Z76ZM6/MmT/mzBNz5oM5192c62vOdTTneplzXczRv+gWHJ3nedcrwdHZ
HJ3N0dkcnc3R2RydzdHZHJ3N0dkcnc3R2Rydi27Bx/m85yHH+bzzcT7vfJzP
Ox/n887H+bzzcT7vfJzPOx/n887H+bzzcT7vfJzPOx/n887H+Ry6BUdn5yHR
2RydzdHZHJ3N0dkcnc3R2RydzdHZHJ3N0dkcnc3RuegWfIwbh9DZfIwbh9DZ
fIwbh9DZfIwbztMSNw6hs/kYNw6hs/kYNw6hs/kYN0K34MrLhZ7myr+FnubK
v4We83zsln8LPc2Vfws9zZV/Cz3NlX8LPc2p53O+jvozc+qlzKnvMacexfzb
a/2B+a11HdecdVNz1vnMWZcyZx3CnLy5OfV2zrNRH2b+7rUeyPxTa/1K5PfW
egtz1oPNWb80Z73NnPUVc9YD5nyJ/N5313omc+pvzKkXifzbuk5pzrqaOetA
5qxbzPOZr0cejHom83+31q/M81FL5KNYpzRnXc38N4e+FuY/ijzS7611M5Gn
Wp83kdda173MWWcy/9paf+O8BHHWnHUpc+4Tf0+hvtacelBz6hfNqbczpz7M
nHomc+pCzKljMGfd3Zx1YnPiSXzeNZ6YU2fs7x3UxZpTx2lO3eH8e9+t4NR1
mVO3YU6dgTnr4ubEGXPizJwv8T2Iuklz4oz5n6xxJr6nrHHGnDhjTpwxJ87M
v/e9Ht8XqDs0P61xxpx4Yk48MWdd1vy31nji99JPr/HEnPVyc9Z3zf9kjRt+
HyM+mLPuW9ZP4zn7wGi/+WE9uLzPBH9gfI5vnP0Sft5RR2hO3Zs5+ytivWzd
J2D+O2s9n/lvrPVn5h8f+h3F8yU49f3zdZxXYh2H+jxz6slifWfdH+LnCPs0
zNlXEOsUax35fL3jW7EOQr2gOfVt5tRjzXmuX7Afw5z9A+bUu5tTX27+mbX+
cr6OcCs49Xnm1JOZUz9kzn3kfDj7TMzZF2FOHb85dfPm1HmbUy9rTn2nOfV8
5tTPmVMvFeNZ63vMt/0g4uy/cj6WfUTmz5X8P/s05usOmc+nDn6+LpD5eepf
zanXnI8/8+TUw5XPFZx6I3Piqp/vL61x1Zz4GfnSNX6aU89tTv2uOfvc/Hxk
v5Y5+4vMqbee5/FuB6eeNfJ7a/z085R9YubsazJnH445+0bMqQs3p47Z/Ntr
XDUnrs555rWIq+bEVXPiqjn7Xsw/vcZVc+qw4/1kjavmxFVz4mr4X+On3yvW
PEPwNS8RnPhpTvw0/+waP81/fo2f5sRPc+p3zdc8T8sLBacOr+2rjTq39f1m
/h64BOf5Hfmc9TlnrjrJjROn2v5Zc+LI3H6Jz8v9MPdzCP7Dohv6zOu7luDo
Y44+5ugzr3M7RZ0bOpijgzk6zP0cgqND+7x+H1YdeHxe862P2bTe7BT1Ztt+
MfGt/5j41n9MnM/Vxu/36nHf/RLjn9dxnaKOa9wvn/s3zcf98kuMv43T79WM
c14HdYo6KMZjznjMGU/7u/O6oFPUBbW81rjvLP2U98bIUzGPo36DOnxx9DXf
9r+LM77IR63jm9dpnKIeg7g3z0e9UfapLZG/4jqWvFZwdG66RR3Cqtt8vX4J
jm7m6GaObvO6hVPULaCP+bi/5rXQZ+7nEBx92uf1+y2f13zcr/FGfN55/cAp
6gf4XOZ8LvNxn8Ub8bna+P2ePF6vnY/Xy+vyp1iXH/XP/U3mo/45Hr/3Mp75
+vUp1q/5u+b83eZ/vm57inXbUee0L/sj4r2C+3P+3M88GH78vNv6l3odZ/U/
f/6+Fnzcl7GE/6iXHvrhLPF358/N14KPfWni+Rj5K8ZT1mtK3fKS+bR1nOaM
c/7cfKPYZx5s26+n5x3jj3rddfzzutYlOH/PnM9lzueaP6/fKPZLPK+5f9r6
lJ/jfN6om10/77y+dAnO5zVnHObbfkNxdDBHh7n9EvkrdJj7ufc8GLo5zzP2
F/0r9airbuZjf9Gdj/1Fdz72F9352F8099ebo6c5es7t6SO687GPqP0cgqNn
4fHewvjL+0A899E/1q1WP/Pn+GvBx/Hsz7vxfeyvrGcN72M7H8e/83HfvZ+/
bwRnPH4OMp6oN1vHM6/LWoIz38wZf+Tl1vHPn+NvFPvMj43X8RCfK+q7hv3+
roNago/vgYf4XObjfDjE55rbL/FeMb4H5ueKOqsx/xOfy1z5n3gfM1eftPi8
5srzxOc1V54n3uva+5W595N+9MlHf/Vvf/mrcc4yXH427v519rPVG8re3P3u
4D5H2/bm7o8H97nbtjd3P73t7w774NLe3P334D7X2/bm7tcH9zngtjcfv6eY
7+eG296c+ezr7nPGbW/O/Pd197nktp/73/sKwn2Oue3N3YcQ7nPPbT8f5963
EO5z0m1v7nOCxnl7JT6vz1eCu95Afur93rj9uO+iuf24H6Pv92Zvrj4Scb83
e3P3e/T93uzN3R/S93uzN3c/Sd/vzd6c+/elKd/Pr7e9uetPfL/bnvu9cfvh
vvZ8IA7YD/Zz/3s/TMeBZm/u/pmOA81+Ps6936bjQLMv993R84H66mZv7noh
x4FtH4Du98btx3VHfh+wH5+XZG4/7i/quGE/PnfJcYB6JceNZm/u/qWOG83e
3P1OHTeavbn7ozpuNHtz4sBzU37jerM3d12Z44btiQ+N2w9xwJy4YT/Yz/3v
/V0dN5q9ufvBOm40+/k49/6xjhvNvtynR88H4kazN3cdoOPGtk9I8aFx+3E9
oeOG/fj8L3P7cV2i44b9+Bwx87kOS3D+v/1gZ+4+vY4nzd7cfX0dT5q9ufsA
O540e3Piw4tTfuN6szd3vajjie2JG43bj+tOHU/sZ3tvKdx+xrzxzokz83Eu
wd0P2XGm2c/HufdPdpxp9uW+PnqeEGeavbnrex1ntn2Hfg8p3H5cJ+w4Yz8+
/87cflxv7DhjPz5Hz9x+XLfsOGM/Wx1L4fbj/tWOP/bjc/0cT6hHdvxp9ubu
j+340+zNx+815jeuN3tz14E7/th+e28p3H5cT+74Yz/b+0/h9uO6dMef+TiX
yu3H/cMdl+zH5yo6zjyi+bP1yyr2JQ5s/ckdl5q9uev2HZe2fc+KP43bj+v/
HZfsx+dFmtuP9xE4LtmPz500tx/vR3Bcsh/iT+P2430Njkv243Mwze3HfeMd
r+zH52k6/lA/63jV7M2JP1+Y8hvXm72593c4XtmeuNS4/XifiOOV/RCXGrcf
7zdxvJqPc6ncfrxvxfHKfnw+qbn9jOvdr+m6PBJ+sC9xY+v/7zjW7M29H8dx
bOvToHjVuP14X4/jmP34PFZz+/H+IMcx+/G5rub2431GjmP2Q7xq3H68X8lx
zH58zqy5/Xjfk+OY/fi8WvPQn/ySOP/ffnzurePVF6f8xvVmb+59W45vtieO
NW4/3v/l+GY/xLHG7cf7yBzf5uNcKrcf70dzfLMfnwtsHvNN+9oc3+Y6HCq3
H9cFOe6VuFS5/XifneMh89Fx7//Ndz/er+d4aD8+N3nOdz/e9+d4aD8+f3nO
dz/eP+h4aD9jnVXj1uH+4GO/wd2Pz4Oe892P9zM6HtqPz5Wec+vw/eBjP8Pd
j8+nnvPdD7/P+Y3r9jPa79z7NB0nbT/WrTW++/F+T8dJ+xnr3xr3fbTvG3Wc
nI9zuQuPeR587NO4+/G53nMe92nwsa+jdTjchUecCT72gYx4dRe++/G+WsfJ
rV+X4mHj9uPzfRwn7cfnnjuObftxFQ+bvTnxinyz416zN/d5Q45vzd7c5xM5
jjV7c59n5HjV7M2ZH5+b8hvXm735WJ+5X3fsmr05ccPXnfjT7Of+93OXHGea
vbnPaXI8afbzce7nOjluNPty323nQDk+NHtz75d3HNj68+l+b9x+vO/eccB+
iAON24/PsXJ8sB/szbnfWS9yfGj25j4ny/Gh2Zv7XC3Hh2Zv7nO4HB+avTn3
++en/Mb1Zm/uvgqOD7YnPjRuP2O98c75//aD3dz/fo6Y40azN/e5Y44bzX4+
zv2cMseNZl/u0+1cM8eNZm/uPhiOG1v/TsWHxu3H/TQcN+yH+NC4/bgvh+OG
/RA3Gp/rsAQnntgP9uY+D87xpNmb+/w4x5Nmb+7z5hxPmr058eGlKb9xvdmb
u1+K44ntiRuN24/7rjie2A/xpHH7Gff5Lvpc9x/n41yC+9w9x5lmPx/nfk6f
40yzL/f1dq6f40yzN3d/G8eZrR+w4knj9uM+OY4z9kM8adx+3G/HccZ+iCeN
24/79jjO2A9xpnH7cf8fxx/72fZZFG4/Pm/Rccl+sDf3+YyOS83enDjz4pTf
uN7szd0HyXHJ9sSfxu3H/ZQcl+yH+NO4/bgvk+PSfJxL5fbj8ysdr+xn28cx
Hf9+3qXjVbMv8eHo+UO8avbm7lvleLX1KVdcatx+3P/K8cp+iEuN24/7aDle
2c92vm3h9uN+XI5X9kNcatx+3NfL8cp+tvrMwu3H55Y6XtnPmOfZuc85dbxq
9ubEn+em/Mb1Zm/u/maOV7YnLjVuP+6T5nhlP8Slxu3H/dYcr+bjXCq3H/dt
c7yyH+JV4/Yz9jnZOf9/rsMhOHHJ84o41uzNfQ6C+XZ+guIVfanN7cf97ux/
O7dB8apx+3HfPMcx+yFeNW4/7r/nOGY/Y/45uf24j5/jmP0Qrxq3H/cDdByz
H+JY4/bj84Ud3+wHe/Pxe6L5jevN3tz9DB3fbE8ca9x+3BfR8c1+iGON24/7
Kzq+zce5VG4/7tPo+GY/xLHG7cf9Hh3f5jocKrcf9+XWe1f48XklcPcV9/ub
uc83KXHpQjoHdx9LuM9DKXFj4z4npcSBjfv8lHJfb9znqpT7fePcp3N+Cu7z
Wcp9t3Gf21Luo437PJdyX+w66JyXMs837vNfyrzdP+86/8x9zrWfp8w7uM+R
8bwy9/kynlfmPnfG88rc59F4Xpn7nBrPK3Pm1Zyfguu9dL8fdQ6O54+5z8fx
/DH3uTmeP+Y+T8fzx9zn7Di+tf2AtmdeEZ8cx5hf499dyr7j5D7fx/PH3Of+
eP6Y+zwgzx9z5s+cn4Izf56SDj5vyPPB3OcQeT6Y+3wizwdzn1vk+dD2bdme
+cDzx/OB+OE4s527Mrxv7+cl+brP94feDu5+tnCfr+Trbs51n/NTcK77J/R5
iQ/+vOv/P879JPd5T54PZV9t8LHfyM59PpTnQ9svY3vmA+8Xng/vWZ8Png/b
eTuKD8yLcZw/in1q7g88zqvvBnffYF/3OT8F57q/S5+L6+7PxfV9Xp/L52r5
+sa+P5235etr7nO4fH3bPgLbc315H/T1/f31ee7ru52bpOvLfez7neu86XBp
973Yp+M+zL6Oc34KPvYfuBXX0eMf98fdjuv1SY2f69L2iZj7vDNfr1bnbHuu
1zfX93Ffr+vr+5Sv19fX56Sv15fWOOrr9an1Povn73rdfF1cj811mddpv7ad
G+br8rLGyXX5I42T6/IZjRP9X9Y4Rz1jv8yRz2Gdt753d+E+n87Xxdzn1vl6
mfs8O19Hc59z5+tr7vPvfN3NfS6e719z9GVebHrqHD3PE3Ofr+f5Y+5z9zyv
Yvw6j8/zzdzn9HkexnXX+X2eh61+r83DH6z66e/Wulxznw/oeWjucwM9D819
nqDnobnPGfQ8NPf5g56H5szDOT8F9zmGnm/mPt/Q883c5x56vpn7PETPN3Of
k+j51uq+bM98I+/iecX36fHvLqW+NLnPZ/Q8Mfe5jZ4n5j7P0fPEfHseTPkp
OHq9STr4vEjPB3OfI+n5YO7zJT0fzH3upOdDq8+xPfOBvJrnA/kSx5NNj+F+
38+7nMcH17/dDu4+/2N8eCW4+//P44P5KTjX/VV93m0dU5/X53LO7/ed+7zO
+f2+c5/j6evb6hlsv/U3WJ+Hvr7kt3x9t/mr+53P7evL96Rt/uu8UV9fc59D
6utrzvWd81Nwru939Hm5vv686PhOfV6fi+rraO7zUn0d23qu7bmOvKeYt3VV
njPxXkq80fVlnvr68r12jMP7ea/zOHyI6zXnp+BcL49/ez/U+LleD2n86PgF
jR+9rJvPq/V1sf0YV3d7+sPy3NZ1px+y7/fgXEf7UR/msDfnum/PjZWrD3PY
m6ufs+L5/dXenHlF/gOuPsxhb0482a7bytWHOezNx7zilZjPzd7rj1oXi/ns
66i+ymFvzvz3dVRf5bCf+9/6M29cfZXD3pz760O6juqrHPbzcR6O79B15H5r
9uZad4v71Fz36ZYv/cTQXzG5+zljV/pChz3jcP9wfd6S1935g+O6eeSHWx/a
Zm/u87XhPo/bz6N5HEh7uOOq+mzHe5H9q892XPdS74T+bfyRP39Q14vxlXnS
+oeHPppv8Z5QniPxeeU/5mHhtZ9589Oeax6/9Inxm/Nc8zzkORV1F+tzx5zn
iDnPBXOdExHc9xH5HdsTz82Jz+bEW3PiZ6kfOL46v39j3Z9xm6OzOTpHHcKq
szk6m6OzOXreVv0D3Ovdf3x+z6x9zs3R3xz9zdHfHP2jzmGNU61vf+uz3fpj
R7/uVf/os73qb771bxTf+jF6PXrV+UHVCcC9vvw76/narV906/NsvvUzFN/6
EIpvfQXFtz6B8/Xx2q/YfHx/zv7A5uP77RL6m4/vn0vo/JjW5bfz77See9bz
ldpf13x8n8x+tubj+94S+puP7yfZd7r1cW39V1vf1Nbv1Bz9zdE/+s2uOn9M
6+Bwr7eedftW7S/a+oK2fp7m6B99ZVf9zdG/9eNt/Spbn8nWH7L1dWz9GM3R
3xyd3611arjXTz9zXheo/RJbn8PWn7D1FTRHf3P0b31HW5+91h+v9bVr/eha
H7nW/80cnVn3M/f66fNnu9rPrfVha/3TWt+z1q+s9Rlr/RK9Ljn29Wr9uFof
rdb/qvWtav2mdo7OXgfk99anxfZjn6jW36n1ZWr9lFofpNa/KPuzeb0J/efr
g48ER/9Yx1z1N0d/c/Q3397ztd4K9zraS+v7Z+uHY87/N0d/c/Q3R39z9G99
n1qfltZfJfq98P4nvr2XiG/PS/Etjnuda9X5Sa0/wr1u9bvr+2frN9L6hJhv
fsW3dRTxLS8vvuUp5ututd9F61PR+kvM18vuDz7O/52P838JnT+i9T6415Ve
WN8/W3+G1leh9UMwH+e/+zY8Enyc/9m3pPUBaPv32777tl/eHP3N0d98O+dX
63Fwrwd9ZX3/bPvQ2/7xtu+77dc2Zxzm6N/6ObR9zW0/cttH3Pb/tn275mP8
OYTOXkeDOw/56fX9s+2rbfth2z7Wtv+07Rs1H+NP6tn2M7Z9iG3/YNv3Z77l
E5RH1bmTYW/+2fU9s+3va/vy2n66tg+u7V9rn8v5T3jbr9HyXa2ev+VnWr13
yye0+uH2/bfVr7bva+V9O97Dud/9vsr8NGd+Rv3kOj/NmZ/mzM9Wr9jen9t7
eHuvtj3zzZz5Zs58M+e+bvWEbZytHqy997Z6ofae1upP2ntFq3Noz8HSZ6Ot
v1/cKvdpW1dq9ZbvFee+Jd+8zcP1/tzeQwf/y8Ufru9HcO636+tzGz72//xG
1K3xPRs+7l/ex8N1ekbj4Xq8oPGg+1c0HvT9A40HHV/QeLgf2jqO7xefK+1z
ru/Gmx9fF/vx+dSNNz++vvbjc6sbb348T+zH51k33vx4vtmPz7luvPnxvLUf
n3/dePNT5tvmR3UalTc/vr/sx+dlN978+D61H5+j3Xjz4/vdfny+duPNj+OG
/fjc7cabH8cf+/F53I03P45LxDP8wHneNt78+PnC80R+tvOpG29+Stw7ljhW
efNT4t6xxLHKm58S944ljlXe/JS4dyxxrPLmp8S9Y4ljlTc/Je4dSxyrvPkp
celY4kzlzU+JS8cSZypvfkpcOpY4U3nzU+LSscSZypufEpc2P65na7z5cdyg
bsdxhnqixpsfvwc6Drs+rfHmx3G1xMljiav/v3VuEWfc/6rx5se6lefIRXnu
3HP9m+vW8HOXerZ4b2z1bK5bw951a403P+Khs+vcGm9+fN35+54njLfx5qf8
3biP7sabn/J3Y54X//U+anWnRZ/Q37z5Kdc9dL4bb37grr8t8yR0KHHv2OJe
mSetPj8+V6tHxQ/vX/bf6sd4j7M971mNNz/mvMfNr/tSefNjznuc/fCe1Xjz
Y857nP3wntV482POe5z98J7VePNjznuc/fA9tfHmx5zvqfbDe1zjzY8574n2
w3tc482POe+J83EulTc/5rwn2g/vcY03P+a8J851OFTe/DjP6fjjdZbGm5/C
t/u3rYPw/0u8Opa4d899ruAlXh1LPLznvkmb/TxebessjTc/5iVeHUs8vOc+
MPASr44lHt5z3xJ4iVfHEg9bXdaxxKtjiVfbekfjzY95iVfHEg/veX89vMSr
Y4mH97xfG17i1bHEw3veLwwv8epY4uE972MdP2/EvVjfIb6U6x7rOF6PGPMk
d1+n8Hj8nP0/zBvL2w==
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.7], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1:eJxFm3f8z9X7xj/n9Xmv85YGmRnZoqJEkxIhQhklSaVSIUQ7LU00adLQNNpa
2qWhvb7ZoyjatAfF73l1ncfj98flvt7n9fq81jnnPve570ujYWP6jc4qKio6
5CsqKrFP8GMH7LJQUTED/hn8PfjP2G/BN+AR2j/Bvkv7j/zRG/DvsY/R/gX8
UezROTjH14DF/G5B+++cswreBv4nfAzn/Mvx3+BbsB1o3x27hHNawiuwVcEh
0I60f8d5DeAzsL9iN+q+4LpKP4+eay7YFl6D83/BbgBfglm0f45dovthfwI/
gNnpmZfS/iB8NXwx/PHsv9tXzOGfH7j++vSOf6RrckrFAxxbhV0U/L303TaB
c3ivbTj2N+evxu5O2x/wAE6At6TtLzAI/ixtm+CD4c/BMzAM/jz2b31H+Hx4
CZwKfwH7M+1HwGtjvwJd4Y/T/iW8C/wx+Fr4weoLfSt4f/gz8HWZv/Mm+CAw
HX4GbQtBbfjPtH0I3xn+K/wL+B7wkr4faAv/i/ZX0jj5hvc+it+3w9vy3q/S
vr36hraP4Y10PueczLEN2J9o/4j2hrT/At8YPDYaYvtxzkMcOy7nb/wdWKtx
U+Hx92Pqyw2pvQ9/fwN2N85/AAznb3fF9qX9RtpP4/dO8BHwnWg/En6rxhj8
QPil8KM559DM/DyeoTXt4+FNOGcX+Dh4Y/h1oEc6d1Dm+17N+c04Zyy8EcdP
of1u+K2096B9MvwE2v4FfeAFztkM7w3Pw3+Hd9Mwh2+B94UX4d3526vhreC/
pfEf4H/Au8Mr4d04ZxK8NbwOfCS8HrxWGid14f9w/mHwHLwR7aP1neFNNPfg
O8Prw0fB68P/SvPif2leaX59lb77z2nu/5nat0vzR+evT33yR+qzjem8dRWe
/xpXZey3le63Zcmf/J18iq6he3+d2nRsTbK/J65zfkvPthvXORPblGeeAY7i
PXfBNqT9dNobwPeAnw1vDm8DPwveDN4Ofg68BXwf+Hmajzk/86/pvdZwvc5p
zOu9fknzfSDn34Ztw/nrObY3fDNtK+EHwB+B/wLvB38a/h28J/xJ+LvwVvB7
4e/oeeH3wJ/jWveqn7DvYVvTfh/t98FX6H258fsa1/D7aX8L3hw+E74I3h4+
B/4BfDf5JPljeFP4XfA34c3gd8P/B28HnwW/Ss+kZ6BtOHw2vAPP8Ag4S3Me
ezb2Udof5BmOrfTY3pP20fDH4QdozMPnwPeGnwSfBW8PfxJczt/viz2V9rm0
7wM/Gf4gfC/4qEpffz/4FZz7kr4b9/oMvhd8tvx68j/yIZ/C99Tz0P48vA78
FvgL8Lqad/AXNefht8Hnw2vBb4a/DK8Pn65vnnydxqbefzn8E/gw+BT4ZcHz
VvN3InwmfBn8Y/j98JXwz+AvwevBb+eaz8Jrwm+CPwOvAZ8Gfy35QPnJBfDG
8Dtofx3eBH4n/El4NfgN8Kfg1eE3wq+VD4UfwfeZIr8M7wt/mnN2hE+l7Thw
j3yXnlfjAN6Hc66Rn4UfDp8Efx/eG34R2EkLG3Yo7TOh7eBj4E/AJ8nfwG/R
O2K7gps1DrEdwXXwD7GdwPXwj7C7g8vgb2K7gJvgn2IPBtP0bbGtkr+V/9wV
PhH+Bvag5KvlhzvDp+o7Y3cAZ2jMqM/hV8AXYjto7MLfwX4rfwyfB/8G3gP+
BPx7eC/4U/AV8P3hD8Pbgsvhb2EjOA3+Ina/Svf7e9i9wJXwt7EHqA/gH2D3
B9fA38fum3z7u9im4CL4a9jm4GL4AmxLcAn8dd0TLNS7850v0xyG94BP0LiE
d9X4h78N7wl/FkzT+o29oNLzogv8Yo0njTeOXSk/Au+lPoW/Cu8GvxD+CvwQ
+ETNf3h3+Jnwp+EdNb81XuEHwsdrvMI7wXeGT4C/gm0ALoC/jG0MLoS/iq0L
zoe/hF3Oc+wHfwi+THMdPhe+FL4PXAHU2ZqH0IO4/unwx+D7w2/KPCbfYF6c
ozkJ70z7uZrbGv8ao5WOcxQv/Qg6wv+hbQP8QPgWeOsix8H8EnMduyN4DH4C
dij4AN4Dewh4Hf5RgfuC6+CH0XYoeAO+E7Y2eBzeBrsreA6+P3Yf8CJ8b+xe
4AX44dje4E14O2xb8Dz8f1z7Y3A9PEdbAA/C5+m5wB/w57HPgn/gM7F3gm/h
z2CfBH/Dv+Ua68F0+KO0PQR+hZ+MHQY+hFdg/+WcB+D/YP8G98OPpX0weE/X
p+1OsF+ZOUCMPwdsR/ts7ANgW/jRYBDYnXP2wLYFf3FsPPaMkv/2ZOxJYC94
K+wuYD3nnIo9BbQva8GsqNjKfa+mvQgvgNvg/9C2GUyEb9L7gYvhW/T84Ap4
Xt8L3AwfgT0NdOCaJ2CPB3vCx2LHgH3hPbDdwB6827HYIXpu2o/BDlYfwg/B
dtV7cU4HPTvYwvU7Yg8AtWlvp2uDzbSPxp4O9uFvX1Y/g638HgVGqv9pPw47
VPeFn4gdpv6H/8q5v4DRXOd+7D3gB70Hdjj4CH4T97ux4OvcgL224He8Bjup
4G94FnZcwe9yHvbsgu91BXZiwd//UuxFBd93f+w+oCfX74I9CBym7469ueB3
uRB7fsHfcCPP9wPYTX1L2+iCv1UvbA/Qh/afed6fwEjO24jdAE6F/6h3AifD
T+DcoWAA53fHdgW9NT6xw8BAfUvsiILH1dHYI0E/2gfKgiM0VrGDQX99K+xw
nQf/lXv8BHaH/4n9DbSBf45dCZrD7+fce8CZ8Duwtxc8Nl7h+IugNu1X8ryX
gaXwHTm+A9hffUHbjeAL+ESNR7BEz4wdAT6GX4S9ACyGn489ByzSt8XeDL6E
b8/1qmp+wRthG6gP4M2wjUFn+Os8y6ugDnwFdiloBl+C/Qw0ld/AfgyawA/k
7w4AvTQnsEFjBr4NNuod4SVsXv2rd+dZbgfrNUY1RsChmqPY5uBg+G7YVqAL
/MTMa9nl+N4/+LvfwBncewe9D3gc/jP2Ado3Yl/BVkb8a7Stk/j/OPYJmMPx
7fl9A7Y13/9H+Gj5Pfk7+FXYZXpmjh3O7z6gMXwKbdeAVvDl2Fc57/2SrzEV
XsYez7lDQQQdQA+erSXtb3PeO+AR8JDGvvwvxz/jHQvy1/Cp+mby+/DvaK8P
b8Tf78TvAngT3Mk5TXRf+Cx4R/hb8LvhzeFNudc98HvBG7TPwO4s3wrPY/cF
Bc45iN+dwLtc/33wHngDvAXelM9lrTqeb16dNe5KsK9iOOx+mfeYI+iL7Sud
H1DMUw1+IrwG59SEnwKvA/8p7U209/8BdIL/y/GN8IPgW+H14APgh3HNrfDD
5Zr526ocGwrfAV4DPlzXge8IPxleC16AHwWvCi/Dh8C3g1eBHwPfFp6DD4RX
gefhR8K3UWwDWnG/iK2s9DOU4dXhJ8Frwl/QOOEbRr7btopfaa9Ge+vM73sM
z7wN7cfCt6c9atyAGXzDl/jbm+DbaV2Hz4EfBH9VY1TzBv4y9iX5d/hC7Ftg
gNZb7NOal/B3Sx4/R8kHcN3rlPvi9wXYc8FftB+GPRSs1rzHngn+hJ8k3we+
h9+PvQdU5W+fAk+CxrSvLHk8T4afjz1PY5Tx1xLbAnzJ3zTWOAIfwBtiG5Q8
drbBlsFd8E/T/DqD69TH1gMLaa+Orab76Xmx54DZWiuwZ2newmvI34FnNN6x
dUsej/OwT4CGXPNK7BWad5x/NfYq+Sr5jLK/1TPyLSWP+R9pvxV7C/gCvjj6
fQdxnbtKnkc/0f4Z7fVo6wfWwY9QPCDfFN0XU+Cvpf46C74qur/GybdGP9tA
+MyS5+CvXPO+kufgH/CH03zflnMux16m/tZaWrI/eQc+GTtJfQ+/BHux+gc+
QX0MHtX6ib1Q30Jrcsljcgl8bsnjqgrXvy29bzX47JL9Qwk+rWTfslxrbMlj
cpXikMz7lIsYw0Mz7yMuhh+TeX80AV6gD67MvOetDr8jc3xeA35X5j3CVPhN
YBrYEdyZeb+g2OhWcEve8+FO/X3ecdXl4DIwBVwLrsk7DpsMJuUdh00Ht+cd
b12l5wA1wd2Z9x118t7fap8YdY3M+4UqmiOZ9wvbwW/OvB8p616Z9w476Nky
7zuKun7mOH+nvPOq2rfWynsvrT1LNT1T5j3L9nqnzPugkp47c25BMeKl4JK8
58NMPSt4DrwAngcDwVHgyLzXsPFgXN5x2FgwJu/YZQQ4Le+Y5nQwKu845hQw
HAwFx4Pj5K+597aZc6SVun/m/EZOz5M5j3EM/FgwBAwCg8HRoB8YAPqDjuBA
0Cnvufo0eCrv9XUeeCLv+TkfPAseAY+BR8F+4ACwP5gALgIXgm55r4HdwUHg
YNBZPgjckHkP1QV+COgKeoM+YGfQFxwBDgdvqS8z56+24ff1mfdo9fLOlStv
cK1ykZn3sHfmPI61l78DPjjzPv1i7Rsz57HvznkOKFdwiXKOmXPXF8LrZs4/
n6exknnPPkFjLnOu7ALNh8x79kvhjTPnw8/XWMmcQ7sLPiRzbmE6/MjM+Ydp
8D6Z9+xT4b0z5wpugvfNnCu4Ad4rc45iZs7zU/mNG+GHZc4J3A4fmDm/cZ/y
WfAl8HtzjpkWw+/JOU+0SPkPeM/MeYyJ8F0y5+0vh7fNnKufDO+aee/cMO/4
Q33RDLQAzUFj0BQ0AfXzrkko5zMLjFR+SnmJvGs07cEeoB3YE+wN9gX7gNZg
N7Ar2B20BW1AS9AK7KL5rRwc11zKNfN5592Uo/s35fuU95ukMZQ5D3ANvFvm
nMYU+CGZcx1XwTtnzgNcDT84c67gCvgemfMqtfPOYyq3uW3ee37lNOrmXTtR
nurHnHNCyq3/nnNuXbncv3LOpyuffxsYkDkPs1DxSuY8wGuKPzLXVkaAF/Cx
X2IfpH2EcnbwdfCDMufDR/L7Rc75CvsVvw/MHFOdyO+naF+rnBNYAF+nWAzM
g3+BHZtyL8qPjYO/Dl+PHQaeVC4Re3ilc3GqO3zJdTtljq++Tt9H+fmloE3m
+GoJ2D1z7LQctMsca30B9s8c+61P31n1izXggMxx1LdpXCnX/U3qL+Xwv0/9
pdz+d6m/lPNfCzpmjvGO0Jiu8Pfpp7Fe4THWH9wPX6HvFJw7epi/uZTfnyqH
qXld6VqbclBXVzp3qhzqhsr/rw2+knM9T3W9F3Ku8aju81mK8xQfvpdznKo8
5Oc5x8GKh9/Iuean2pnqBGsrXINTXe+rCteHVI/TczWQz6503lL5z97yERUe
24fJZ1V4/g4AD8BXKp4Fj8A/xw4GD8FXKbbVNeGrK/0OehfVMZfxPHtmjnvP
59h7tH+NPbrSOW3Vzs6rdC5dOavXtf5lrpGtgO+VOY5dBTpkjnUfAxdkHjOP
6rqZx9hL8D+C62KPwydkHpP/g7fIHMM/DM7M/PwPwcdnfuYX4T8F1+/mwE/P
/L6z4aMy9+lc+LjM7/sEfGLm+fI+vH7mGtMHoEHmmtTL4M/gOuCr8K3BNdwF
8ELmGu7b8BqZ9yAfwhtmrk+9C2pl3o98Am+Wuf71EWiSuSb1DqiZOY/3Kbx5
5vrXx6Bp5hrZ85o/wfXEefDLMs/f+fDpmcdkxji4OHP9ImitzFyDqNCambnW
8Dc4NXOtcBNQ0Vt1wK3g3Mw58M1gTOb6zkrQPvNe6Yec10HV+P4BYzPXOreA
czLXRDbkvBaoVvhTzmuK6lMbc153VE98GkzJ7Deegk/O7GeegU/NPK4WwXfN
vG9aDHbLvM/6DRyeuVb1Bzguc33wl5zXPtW5VoO9M+8xf855HVTN609wfOZa
4a85r4mqf9Ulzr+SuPUu4u5b+d0/c377ZvmIzPntddqPac+oWn9wjaOA/SG4
xpFTXT64ZqEi2ffBtYksuOahGvE/Fa6vravwHK6Sub6zK8fLmWtSreExc32n
lWqFwTWRLRVeS1UrP4K29aCq9tHYFcGahX81n8N/6dCKfHCdWXWfqPkQXCfa
NliPUFLaFPsVqKK9rXyM7q3nwq5WjK7UM3Z5sAZgs3xE+G84VQTsyvCf26rY
qvVG76D9cvD6r9pfz+B9sGruvYLz18pjHxpc51C9Y1Jwn6hufkNwf6q2eH2q
Pakuf2NwraYr/IDgdUXry+3Ba9q58LHB40K14EuC1zTVN8cErz+qgY4OHvsz
4bcFx2JdlIcPjr8Ohu8XHHOpXtklOAehXMTRwbmKYfDBwWu7NAn9guMy5f/b
BcduqrPsFRzfqRawp3IamWsBewTHg6rXHBxcW1Vdb5fg+LEHvHOwbkI1zd2C
cxzKdewrjUCl60GKE0Lm+mlj9X/mmmnT4NhNtZizg+MF1SzOCh7XqmucKY1B
5rrG+OC68SXwc4PHu+oa44J96h3wm4J9uuoR84LnqGKMJ4PrM4olngpeA9Rf
U4N90gL4C8HPqmc+LfW76l/nB8eVqitdERxHT4RfEBzbXg6/MFjLoPraVcFx
rupK5wT7ddXjrgv266q1XZvGhsbV5OCYUXW3a4LjINXUpgTHfarfXRm8ZmvN
WhBcf9a69nrwuq4453n5+uCaaU3s5uCacj3spuDa5U5aG4LrrdWwfwfXN+tq
7Q+uje6I/Se4Bl1f8ylzHbyJ5lDmunazYB2Q6toNtP4F13O3D677NoLXCV6v
tF7fF1xb1jr+QPD6eS98RrBPVcz2UPBaNwM+LXi9VZxzR/C6qjjnzuC4QXNq
evC6qpjh5uB1RvHA/aHiPyfQEtMoOP5TvDE3uE6ueOOWYL+uOPBh+C05jzPV
ExVzSXtwevC6oVr5zDS25RN6BK+TytF1D14PpQPpBj+00uNK/kDrqvJyfWnv
Wen30h5keM4+TlqC03L+7tIJnJpz30hLcErO31Tag16VHtvay5yYsx+XNkBr
vvJ4fYLXc+lVDgmOVZV7PC75BI3nU4PXGeleTgleJ6UtOTk4jlBusHdwPCtt
yYnBMZQ0KsOC43dpYLoG77OlgekUvB/tDj8wOG6SluMkzZec1x5pHk7Ieb1R
3XxYzuuNdA5Dcvbpqvsfk7Nflh5gcM7+XTqB/jn7dNXZB+S8fqjOflTOfl+1
+4E5+3fV1s/N2X+ppnx2zuuWdFZH5rweqL4/KOe1RxqDoTmvT9IYHJvz2ilt
wFk5r3PSZY3Kef5IgzEi5zkmzcbxOa950gaMy9mvqWY9Pud5Im3JmTmvkdJ0
jcx5vkkLMTrnOSYdiGJMaXuGy1fkPG+lozgj57mnWu3YnH2oarWKg2Zx/l3B
exHlhIcGx2vKFQ8Mjolmw+9O/kHx/zvB+RvpE95O80J+47lgrc7XFdYFKQ+k
evSzwXGWdCOzg3M8r8LnJ/+pWPqeNB81v+YEx1aqF88KjuNUp34kOGe2CP5+
cO5qKfyj4BzG2/BXkt+Wf3stOC+iWvmrwfkq1d9fCs45SVPxVnB+ayH85eD8
lnQUbwbn5JbAPwzOwy2GfxCc65K+YmFwnkx7Je2ZlNtTTf+Z4LyR6tqPB+eN
tI48Ebw/OAi+d3AcrVp2h2D9m/yttCqltPbtExz/7gyvFRwbngQfEhxXnAAf
FBwvK2c+IHivcDz8qOCYWjn2I4NjyZPhxwbHZvKrtYP3btrfXV9pjZb0e/My
7zWlsxoVHF+rjv9YcHwt/cCjwftU6eVGBu9dpO1sHrxvkFawRfLhWutbBu/X
VbNoH7wPUH2hf/KxihPaBu9j5G93Dt5zSGfVRs9LoPU4gdqj0Xnwd8Dbyp1F
1/Q/KPjYY+DrgvPCr4CXC84Fvw0WqlYZXdNULvR5fr8IXgDPgufA/ILzwk+C
eWBWdJ3x3oJzx4+Dx8Ah0XVS5WAfiK4/Ti+4bvZTybWz6+HVOHYd9pNofUIN
8CjHPub3DvB3onUCGegSXWNVjlc562fA0+DTaH1CHdX+4R+BbqplpDpUIdXg
dgCfl6wh2Aw2qdYRrRPYohpyyd9Q7/pndB3zFtVBuV912mqCr1LeXjn8+qnm
przjStVsUh2uKWgW3Z4ru1b+YqqVPoF9Su8L2kTnrvaOrqf0BF9Gayf6qDZe
8h7kqoLPbQuG5V2HeBO8oZoqbQ3BKtVXsE1ADsyP1lp8UnCtdwN/97NyqtH5
/z/Vn6kmuAiMj64j/67ca3Tfq993hjcCNVTTTPUL1QqLZddGfwelVDPUfbtF
1/qVi1ZdtoNqsgXXURaA1wqu9zyieoXqMtEagz0LrltsX3QNK0v1VNVGB0Tr
HzSe+0fXAFQ31PioXnQNomrZGob2qRbyV8HvuB3nbwOqgrOi9RttCta1XMjf
XQIGRusxVJfsFa3BUP5ZNY9lYGnBdZ21YE2qqX+Yvq3qHCvBioLrIlWLrqte
m2roqtWqTvM7+A38Gl1P131Vt60CytH1tqOLrhmpTxanftH4LaYxrPpKuej6
4C/R9fcJRWtltoB/wYPRmpa7wP3ROodbCh5HV6ex9JnqURw7s+h62CzwoPon
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJzt1rENgkAUANCLlk7hHBY0TuAIJto6gpsYN2EB57BmBBulAC+nxCMHPhqS
B9z/n3Cfv96fdodFCGG7CmEZYkdTcc4555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeec81l7zTnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzufopeTB
Of8fb6rIfb/yzPUMzotzPnsfrf9MtD/njlNs/y/k/9t6rvc/1vfT1nXbnI+X
671+nVMeWycW9/l8FVm/54m6enl08qxSHlsnFr+TZ9KH1vHec++Tb+MUtw85
55P19nruObOQ+Y1z/keeex77OJ8Hu5dm4g==
              "]], {
            Axes -> True, AxesLabel -> {"x", "y", "\[Psi](x,y)"}, Background -> 
             GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {-0.7334464586120832, 
               0.7334464586120832}}, PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyNnXuwXlWV4CEf4ZlLwCCiQTAm4ItoRAFF5N7CbgXFVulxCh9EWxEtNGA5
agPSGXz3+ESIgFYT1EIMj4m3lM7QEPJdELBjTxmQjB0BHTG2j5KXBBVnjJnL
/fZvH/ZvnTVX/kl9P9ZdZ5119l77tfbei9525knvmLPTTjt9cMFOOw2m/z3i
qn1u37FjwRT/nv3rQ5+/+zXvGZ86fu+nXbBk38Av+v6Tfnr8BfMCv2avBeet
uHvXwG+e0bNz4N+ckf/90PzaGf6LwHea+W/zevOvjOTHzb8+0h/4jSN7JszX
jOwP/ILR+wa+YeSfwMvvjE/hV/vZHD+b42dz/GyOn83xszl+NsfP5vjZHD+b
42dz/GyOn83xc8Kn8J/9bM5vc/xsjp/N8bM5fjbHz+b42Rw/m+Nnc/xsjp/N
8bM5fk74FH6yn835e3N+m+Nnc/xsjp/N8bM5fjbHz+b42Rw/m+Nnc/xsjp8T
PoU/7Gdz/GyOXnN+8+/4EcuvP2He96qfzfGzOX42x8/m+NkcP5vjZ9uPn83x
szl+TvgU720/m+Nnc/xszvPg9rM5fjbHz+b42Rw/m+Nnc/xs+/GzOX42x88J
n+L97Gdz/GyOn83xM9x+Nue3OX42x8/m+NkcP5vjZ9uPn83xszl+TvgU72E/
m+Nnc/xsjp/h9rM59pnz2xw/m+Nnc/xsjp9tP342x8/m+DnhU9hrP5vjZ3P8
bI6f4fazOX42x25zfpvjZ3P8bI6fbT9+NsfP5vg54VPYZT+b42dz/GyOn+H2
szl+NsfP5ryPOb/N8bM5frb9+NkcP5vj54RP8Xz72Rw/m+Nnc/wMt5/N8bM5
fjbHz+a8pzm/zfGz7cfP5vjZHD8nfIrn2M/m+NkcP5vjZ3P8bI6fzfGzOX42
x8/mvL85v83xszl+NsfPCZ9Cn/1sjp/N8bM5fjbHz+b42Rw/m+Nnc/xsjp/N
8Ys5v83xszl+TvgUf2c/m+Nnc/xsjp/N8bM5fjbHz+b42Rw/m+Nnc/xsjr/M
+W2OnxPOfFrws7nm64KfzTVfF/xsrvm64GdzzdcFP5trvi742VzzdcHP5pqv
q/yomd+DKf6lXTh89HvCnN/8f8ubn3P2/EePv+AJU/zr72tefk8k8oFjz6IV
T1x297o9Avc8w5dn/PanoeXhft9bZvz52yAPt/yGmef9MMjDLX/RiI9bHm75
60fPDfJwy58/eq8gD7c8cnDXI3P8xr/2mzl+MOd9zXkvc+pL9r6Wp1ya875w
lx/LEzcye8yfOtI/Yf08Fz/5uXD08PfmvK8572uOPX4u9vB9bA/c9phjjzn2
mGOPn4s9lAvbA7c95thjjj3m2OPnYg/l0fbAbY859phjjzn2+LnYgz7bA7c9
5sh7XIC84znlxnrglue7Wh5uefxuebjl8Yvl4ZZHzvLImfPbevgu9j/xwfL4
k79zO2KOf8zxgznva4595vzGTji/La92PPTTzNWOB+5+CPq9nij50O64fcef
YT2i+DOs1xR/muNPc/yZ9Ss8n4895thjjj3m2GOOPeZ8R3PsdntEP9McebcX
6HX7QhwxR7/11HGQ4n8dB6m9qOMR8ToekZ66vql4Xtc3Ff/rOqN4XWeUHvQ7
PqPf8Rz95ui3HvRncSaL847n+N0cf5nznubYl80vZfEzm3fye2G/5zewP8yT
FPvDPFKx3xz7zbEjm7fJ4qTlFcfC+MvxkO948DNP+4+/nbPL1DmHfvq8fXf9
3viy+75z9hunf/P/Nz/jzwfdP7ebP7Q841P3h8857a6Vf7jj9g3r3vulT/yn
afnn/OmBXfbetZs/tB7Gp+b85vnw1+z24VNfP2eXuv51w0sn/mqPaX7q/zxq
r8eeh10//5e1k/vs2sUlrxO9ae8T9z15Wv6U5c989oUbdxm/52P/tPLR6ff9
6aYPP/K6af2Msz/5xhcfeuC0ngeOXXXbKdPyvMffrvzYtXfN7eyBYw/2837Y
/9on/vI9b5iWh39j+0m/e3haz5P+x4dvOGmaU25f8n82bX3Srp3/73jL5Rcf
Of3/P3nftxavneZfPOPDH3/j9Ps84Vm/v/+V03z+yZcdd9w0X/jN/Z+7/yt/
v+GwX/y3U/5+mk8u/fbZr5jb+d96Djnz/MUfnrbjT6e+Z/Epjz3/2pfd+eO5
Xf165Euv/9Jx03z5r94598xp+XNnytOcKf7Fn0tm2u8/Ds1Xz5Tz+wL/wYw9
twW+bua5946bL5v5jtsC5zfPh7/qsidtesV7507AX3rnpq8dcevpVR67LA8/
VvLYa3m45XkPy8NtD++H/K5Pe/N3jp+WX/GHwfKDd3pkfPUXJp/x/u+cXvXM
XfaU89et2DHOc3lP/v9LCud94McUjt1w7ME++NGFY9/9d+27Zt2KuTWeYIf1
fOORCxf/3ZlzJ/j3ti1zl79ov3ePXzP6PcW/txaOH1470jOFnfzm/6P/rNHv
Cf61n+GWt53zR/YPeY79aXuQdzlc/M0D/rDrTo8M37Li8z88alr+yDkXnvWm
H3f+t56jR/4Mer438n+wh+9lPchbz0dG8uOW5/vC8QPy1vOpkf3jD4++e+1/
Uh7Mkbeep4z8GeThlud7uV7z93wH9PD3cMujB3k438F64NbD90QeOy1PPbF+
5B1/0M/3tD1wy1MurN/y2GP9yDu+oZ9yYXvglqd8Wb/lscf6kXf8RD/ly/bA
LU85tX7LY4/1I+/4TP2h/Dr+w90+Ol5RPswpH+bEmTeO4swEcYbvanm+qzny
bhf4Hpbne5gjjx78gB8tjx/Nkbc9yNmfyNn/yNMuOf74uciZI+/2bsu++5y6
5IQFU/wrPmGOfsc9+qWeJ4d7vM/8iOfDsc/xEL0eR6DXHL2eh9H7mk+YMz7J
7LQfkMvWlzN/Zu1Fxv1c5FxOkIO7vUCf9bj8wF1++E4Ztx786/ko/p7nuPxk
fnD7iLw5fs/GlUl5CPNpkq+ccabLP3afdsx+Jy85YffAs7xl6yHeWg88y3O2
HuKw9cCzvGjrIQ5bDzzLo7Ye4rD1wLO8a+shDlsPPMvTth7qifXArYe/d54w
f+84xt+bE6es520jPSEeEl+yOOl8Wuxx/w17zLHHerDH8thjjj3OO8Ue99+w
xxx7rAd7LI895tjj/Ezscf8Ne8yxx3qwx/LYY449zmPEHvffsMcce6wHeyyP
PebY43w/7KEfYXvMscd6sMfy2GNO+XM7TtxDn3mWt2Y9xD3rgWd5btZD3LMe
eJYXZz3EPeuBZ3l01kPcsx54lndnPcQ964FbD3/vPEb+3v0N/t5c/aXQTwt5
SmX+xfMzlFv3Kyi35rzXy3bZuPb+ObtM7fn9M97y8jldf8P866/fvNtOg11q
/+rpbzjwz1M7f6/+PX+HfB1vfm77oXfP2WXiAyeueNbGaU4cz7jbI7jbI+Kv
5eGWJz5aHm554pfl4ZYnvlgebnnqv+XhlkfO8yHImVMOzSmH5uj3PAn6zdFv
jn5z9HveA/3m6DdHvzn6PY+BfnP0m6PfHP2el0C/OfrN0W9Oe+R4wnM9ruG5
5jzXnOea0w9zPKTeOR5SvzLuOEn9sjzc8tQvy8MtT/2yPNzy1C/Lwy1PXLM8
3PJ8R/e3+Z3Va49z4V5nh3t9HO51bbjXo+FeR4Z7vZV4bj9Qblx+8Is541/r
wS/2G35xnMQvmT3+Lsh5/I68nwv390KPvxfc9mC323246/teM/Vufvju5C2b
33Pp/rtfsGSvMM5Cj8sJeszR43ENelyuar66OHo8HkGPy2Hdby6OHo8j0ONy
ix5z9Lj/jx6Xc/SYo8f9dr7HbiN9E+beF0C7u2Wkr3K+h/UwLjBHz4k7Drhu
x46xoMfP5bta/oFVe/9wx3+N5y28ZiQX5oXg4byFzfvdsmPH7vG8i8L7zyUY
JPNOgyD/2pnnbg/nYMAtf2R5X8vDLT+az9wa5OH950JMhvM3XjCSD+dsIG89
yJu/sPQPrAdu+b8Z+SHIw/v1D8L8JNzyN42+Y5CH99szFuThli/lMMjDE/lw
7gTlM5xTUcph/7kNg8ApV+aUH3PKSf+5FpPhXAu+uznf15zv2C8/COdR8F36
9YwFjp8THvot+DmcU1H8bM77mvO+/Tyup2C/OfYnPMxbYn84/6HY338ewiCc
C8F7mfNe5nzHfvkuD3NpIz8W5kt534SHeVHeN5zDUN63/1yCQTifgXphTr0w
p170n9swGc5twJ/m+NMcf/bLD+q8rv3p98WfCQ/zuvgznLdQ/Nl//sAgnMOA
P83xpzn+7D+fYTKcz4A/zfGnOf7sl+/y8exPvy/+THiYl8af5viz/5yBQeX2
pzn+NMef5vjTHH+a409z/NkvP6jz6van3xd/JjzMq+PPcH5C8Wf/eQKDcK4C
/jTHn+b4s/+8hclw3gL+NMef5vizX35Q1wXsT78v/kx4WBfAn+GchOLP/nMD
BuH8BPxpjj/N8Wf/uQqT4VwF/GmOP83xZ7/8oK5r2J9+X/yZ8DDOxZ/95wDE
fUa8lznvZc579csP6ry938v28F4JD/kPvFc4f6CUk/58iZhHwfua8779POaZ
817mvFfCw/593ivs9y/v1b//fRA45bl/v/9k2O+PH8zxgznfvV9+EPbp00/u
1zMWOH5LeNiPj9/C/v3it/797IPAiRvmxA1z/Ny/338y7PfHz+b42Rw/98sP
wj59/NyvZyxw/JzwkN+i+Yrg5/58mEHgmmcIfu7fF781cM0PBD+ba7wf/Nwv
PwjrgxqnBz+b40/+tT8PvHfvz6y4O87zvGrp/OPuPtL77gdhnz7+XHPr/LXr
7u84/vx35Rfhz7nL93nKBZfH+ZMXJvMtth9/2n78afvxp+3Hn7Yff9p+7Hj4
tANOXHLCWPAn/4bx8sVPXnL3ur2DP/co85T25wtOHfvz8U/YJ/jzbZNj165b
sU/w5/l/Gjt9ycZ9gj+HyXzUb2U//vwb2Y8/bT/+3FP2488Xyn78afuJA7Yf
P+9++YL7jr9gt+Dnd2i9oI7ry79+392kh/c9VXp4r4O1XoD9d5V5Ytt/1JFP
ev+KuwOfOmimfMZ5iQ9pvR47n1rk3f85R3mD2POQ1imw59X/5Qn7XbAkzpO8
c+Z9Hw3j3KdrvRh7Tivytudpyv+nnIzm0f/v0HbO0/oFdo7Kw07BztH896+D
nZdo3Zl6wb/uV/92xj+/C+Poq5N5iUXluX7fi7QvgPcdvdeD4X2PKvb4fR8q
9vh9b5+xZ1143+u1Ds573qx9BLwv//p9r0nmDa4rz/X7Tpbn+n1vm3nuHeF9
b9F6EO97ZLHH77usPN/vu17r8u049LYwbrp4ZH8YN/Gv35d//b4btK+B9/3c
zHe/Z9zv+2WtW/G+Xy32+H1H65K/C+97eHm+3/cC7YPgfUfrlr8O77smGXc/
UJ7r9+Vfv+9oHfPh8L7na32N9z2o2OP3/btRvQ79t92Vn4CdJQ6Ecd+eygPH
Tv61nU/V+h12juL8o8HOE0dxMtj5oNaRaVe+cNy+x9y9bpfQ37Me7Lce7Dxb
68XYWeJ/6L8dOWpfgp0/0jojdp47d/9/Wrdiz9AfPljr9dh/lPRj/13Sj9+t
X+1meN9TtW7O+5Z2Obxv6Q+E9y39h/C+pb8U3ncPravWdmHU/wn9+VXJ+NT2
4B/bg39sD/7ZXfbQX7p61L8KfqvlRX6z/fhtt1G/OvjN+Yf47cpRvzf4zfvT
6ZeeOOpXh3HTqNzG8Sn2Jv3S4Gfbj59tP362/ernBz+/Svbj3wNlP354cfl3
oeaXzJFfVv6/56PgyOt7hf6bx0e1/6BxEM9drP4q36vU08BvUz8ZfsEovk0d
ccfT7/7jyusrv2fG/915Anx394fh71K/Gk5/9cyHW75S/dvan1G/WvU09J9f
InnKz09kJ+XnPPmnrsMWP3zj9pEf6vpy4a5H3leF3/jX88M/Vz8ZP+yl/T7w
Z6q/jX/eXvrP5meo347fppL1zXdKD/LfTtbp9pOd+O1kvS/lf3XJl6H84zfk
XZ6RH1f98rlq+NMce8yJA6/Tc+E/K9/F3/cjo35RsPNfSz6O7TmnyJsf2Dte
2D7+EcnjN/QvlP3nyh74k4t+2//Po35ssP/7Jb/Ldl5c5M3/o7f/v318neSx
H/22/1LZA/9p0W/7LxvxsP7yiZJXZjtvLPLmZ/b257ePr5Y89qPf9l8ne+Af
KPpt/x+fN/Ndgv3rSj6b7Rz1Ex4M/L29/fPt448+r5XHfvTb/rnLWnvg7yv6
bf8PRvUi2P8ZnfODnXcVefOXq98OH82zde0m/LOlv017RDw8SPuO4TtrvAA/
R/s34b8p/XPaI+In4wXH1eUapxAnr0zW6d4sPcjfkKxz7a/34vv+QP7k++L/
hZK/U/7k+27Rd4S/ovyd26/y/UM/8Cz1//Gn+/nwH2ocgT9foHEH/jk/WffZ
IHuwn/Jj/jmN1/DbQo1T6I/dp/4q/S73Y9VPCzybh8/yG53XhN/M63dRO97O
C+0c+gP999dMhvtr8A/t5lKVH+cnEwd8zht2mvMdzXku3M91PnNdR0vaL/Na
fsTrelbhfq7zn2s+YdLumNf+pHjN6yvcz3W+NM/1eXE815znmvNcuJ/r/Gqe
6/PceG7GvS5P+TSnfPbfdzAZ7jvgvfxc3gvu93K+d1230vo4dmbr7+zLt36f
24DffA4bzzXnuf3nbG8NHP+Y1/kccdqX7Lk+p5TnmvNcc55rznPN+Y7m7bpt
Z2cbZ+L4xeNTnutxZZsPHMcX/eMd8m+78Qscec8DTCm+wdcneXdT6ufDkbf+
tYpj8D/veOy/e0Me2lr1w+HIW/8VilfwS5K8rCvUT4Yjb/0bFJfgX03ylDao
HwtH3nyV+kVw+l0LVX7oJywt/UzKj/uHlFvmgZkfgJ/QOw88mKj9jl6/xXyh
q5J86aHsJ568Tut9cK8nUt8f0bqh+skh/ng9sebDl/mQS4sf4Iv0XPgW1VPi
id8X7nk2vpfft+YRFXv4juhx3GjzN2LcsH/gnr9q6/vOIc54nZHveHUSN7xO
1+bJxziwj9a5kIdb3utEbV5ZrKce11BOPpiMp7zewXc/sKxruDx4nAI/XvWo
5pWVekd5a+eTY//B87GUkwNkD9zjUPS4nrb5Kq7X28btH63jh/nhKxXHiCf2
G9z1ET2eB6Z/cqHmLeF3l/poPZRnz9fdqXEWPOv/eJyFfvoh7kd5HhV5xwf8
4HgCd/zBnlXqN8I9Hoe7XMH93dt2sysnxOFXqzzDXQ7bvK+47nCLvguc/bvm
7Bu1nd4Piz3mWjcMfK2+SxvH4ni2/36WrYFTv8zbPI3Iva5BvbM83OsUtfz0
5v9sH3d+EXwv5RfVvCn5gb9/u/JeKP/e7wM/TfLo+a3ySZD3Phf4o5JHz4vL
d7C893fA/1ry6Pm08h+QH33Pbl8D/FmSR89C5RUg73x++HzJVz9r3R9557HD
3yz5ur6pONbmY+wR2gXzmt+V8IHWweu+M813UW6tB/5Wzb8pzy3Mp1kP3Ovy
cI+L8Zvz5+t6hPIZ+C5b1O7AFylfjud63Eqc8TmBcJ/XB/d4k7iXcecNap4z
xDHHgTr/prgB7z+nbnK94yrccbjN74px5p5kPWuF8gBrnBFHfixZV3qe8vTQ
s1gc+e8m6zvPmdfmv6Fno/LikP9sss5ySKk31vN8ceTPStY7fql8LfQ8II48
5dR8ufKg0OP8KMqn62MdxyXccYPy6ThAeXO9rvsIFGfg/eeG1fFa4O7vtflp
cb+M19/h7t/CPf8MD/eSsP9C87d1HV/zq/Bwf0fhnj/UOD1835vkz/o7yZvy
90W+P87X/nDwZ9av87klNe89sd/5bPB/0PeC36r4Bndcquvv+r5wl2fe68Ck
Hcn2nT1B+cZwlx/4MaXemLtcwW9XvmvdB6TyBj9d+aL1HAOVQ/jHlG9Z84FV
PuEHKO8Rns17X6N8M/jzlbdW84K0HkeccX5ajT/Ki4P7nJM23zXqf6X0c06E
94OwrmbOeQfmlEtz+t/m9KfN6R+b0981p/9qTn/UnPJtTr01x4/m7LMyx5/e
t4I/zfGnOf4M+1+KP83xpzn+NMef5vjTHH+a409z/GmOP83xZ+K3wPGz+4H4
2Rw/m2OnOXaaY2fy3MDbe3UHwU7z9r7dQbDHvL2XNugPHHuIQ7bHHHvMKYfO
x6McmlMOzSmH5pRDc8qhOeXQHL/ZfvyW+CFw/Hak2jX8Zo7fzPGb99fgN3P8
Zo7fzPGbOX4zx2/m+M3247fED4HjN/q/9ps5fjNv78ndGvzpfTr407y9z8v7
ejavN8ef5vjTvL0/t+PtfQGd/fjZHD8nfgscPzM+MGf+w/63PNzyfBfL813M
+S5wf5eMez8R38vycMvzHS0Ptzzf1/Jwy/PdLQ+3POXB8pQH+43ykHF/F8qJ
5eHJdw/ycMtTfpj3cjkx5zt6PxTfy5zvYo7/zfGzOf6xPfghsT9w3tfzD7yv
Oe/r/VO8rznva877mvO+5ryv7eF9E/sDb7+v15sWBE4cMG/93/HW/0F/4Njj
8T72mGOPOXHJnLhkznc05zua8x3N+Y7mfEdz4oM58cEcP5vj58RvgbflfCz4
2Rw/m+Nnc/xs3taXseBn87a+jAU/m7f1ZSz42Rw/m7f1ayz4OfFb4BpfB3+a
axwd/GmucXTwZ/9+sTqODv401zg6+NNc4+jgT3ONo4M/zTknwuNuzjUw57wA
c/btm7NP3nxLmTc3v6/MX5szH23OPKA5+1HN2Sdpzr4+c85x8HiZ8xHMF5V9
UOacCxDG6aN5t8DZh2xO/oo5+2zN2f9pzn5Fc/LGPO5mP204v6LMx5mz79Gc
/bceR7MP1vxDzb3qHWd+0ONK9n+a31TmQz0uI754nMV+UXPKh/t1nFdizvqc
OXlv7t+yvmXOuQ/mnI9gzjqQOfvYzalHtpN91+bUo/C+pR6Zc26L+4esU5qT
5+d+Ked6mHP+hTnnRJizb9+c+mV72GduTv0yp36Zs97p/ifndJhznoU59dH9
T+qjOfXRnProfiP10Zx9y+bsD3e/iP3M5t8p9dHtO/XOnDxL5x2RP+c8SeSd
B4W8Ofuck3n70C6QV9q/bj4InP2itpN9lZZnX6Xl2SdpefYxWp59iZZn36Dl
2QdoefbpWZ59X5Zn35flyf8L8bz008zZh+x5SPavmrN/1fyi4jdz9ouabyh+
Mz+jrOubsx/SnP2Q2fyq/cO+RMuzL9GcfFBz9tW7HST/zJy85Hr+3B3NvvLQ
nrK/zpz99m43yUuGk5/MvnG3y+yfNCc/1Zz9e34u+8w9f8j+SXP2+3k+kH37
btfYX+H5KPJlzcnfcvt7fjJPxbkAbkfYh+n2i3wFx3niFZx9AcQlx8OPlvrl
doe4ZHn2V1ueuGR59jNbnrhkefYPW564ZHnikuXJDzYnXlkP40Q4+cDsw3e7
xr53c/a9m7PP3Jx95ubs6zZnX7c5+6jN2Udtzv5b8+OLv8wXJv0H4lKwp21n
K+fckGTcGvjcdrxWOfkTbo/Ikwjrj6V8hvXNUg7NyW8wJ4/B/MtJuw933L4l
affhoZ1K2n14aAeTdh9u+euTdh9u+fOTdh9ueepXNs9v3tbHbUHevJ1Pe1z+
WzOf1sUBvos5/jfHz+b40xy/mbfzadvH7Tfzdp6te68vK54vlf0ZD/OfittL
9b5h3lhxe6n8YPnrFbeXyj+WP1/xean8k833Oi6RR2s98Gx+2+WZfn7Gs3V8
yzOvaM68ojnziubMK2b2uL/E+/afSzkI67/ImyPvfg7y5si7XiNvjrzrdfsd
I3d9adfRuu/erqN1vF1H63i7jtbxdh2t421ccr2L5eqipL34dlJ+ppL2Yn1S
rtYm7QX7bM2vSNqLDUm7wD5nf0f2r8IPK+OLlck8z280D8N4gflJvu8VpR/L
vtbQ7036t99WeVgof5qvVzlZKH+a40/zK5L+7YakH3uDyk+rJ8Y39qF5HD1M
9Ewl5fDqpLytSeLPlUn8IY/W40TmPx0nH9E40fOBjlcfTMaDzONZD3nbIU+m
jI/g7N9kv4fjHvtDzMkDNmfcYc4+UttDOYevLvbwfT1OZL4LzvclzjgOHyF5
fy+Pc5kfgLN/mXJlPcyzmVNubf8LJY/97D90PGF8YU758Xj5IXHiCeXH8eec
hF+dxI01ahcWqjy4PbpS7cVClROPI2jXzBcm6yns53S9Y/7NcYN+sjn7crP+
lZ/bttddewe3HuKb48Yw4dQ7+5N6ak59d7twSzOOiPEwi7d+X76L7aTcOr4h
n42D/H15X3Pe15x+jjnrDubsszKnX2TOPitz9lmZ048yZ5+VOfuszOl3mbPP
ynxxiQvm9NPM2WdlTv/NnH1T4bsk89tw10fWB82pj6HdTOo73PLsVzGn/ppj
p9tN1unMsTOsnxZ7zNn3ZY495tjj9pF9jOYlvgSOPebsNzO/scQpc+xx+7U2
aZd5rvlVSTuI/rBeXPSYL2ri+bYgb876suMw+yHN2d9o/rxihzl5GubY4zh8
VdLurE36seyndbxlP202/g3rp824o4vznEdgzn5413f2t5t/auS3EE/YN27O
PnBz6pe/O/XanHpk/q5knb1t9ztOPU3W6wNv51u2hfLp7079Nac+mnO+gMsV
5wWYP7v435x9+Oasy4R5+9KOm7POksV/c+5bd7w9LYmrcPuBcZPtYd+mOXkd
WT6n7aS/lM1jZ/Xa9Rdu+auachLl/VzKufVw/5D9OVnuATJn/c6c+37s/5NK
vor5T5L1Te4HcnvB+eDmlB9z7kNyu3BB0Z/tIzDn/HHrWZy0X6cWP7j+tvnJ
j8v3Lv7vn2+ZFzjrvM7raOfbO355yecxf1qip52f7/ix5TuZcy+X899G45F7
Q94d96CYc49XiNulHJqfXe73SvLfAufeL5db7v1yObxslO8U1s25r8Wc9TiX
Q9o1z1dwn405976Ycw+E9dd7qcRH5Szuo2Hc7fkEzh0zZzxuvipZZ+e+B3PK
icv/sJQTzw9QHlz+KQ/m3N/j/gnjEXPuh3P85J4z84OT8T7lynGVe9HM2Vdv
Tjl0/SKumpMfYs78jPnqUp7Nue8n5I+VvAhz5nPM6c8E/SXeen255BUHXtrZ
wOk3mlO/zC8v9cv84FK/zMljMeeeHvOS153lgQfOedPOf+NehDAeL/OWxKsj
yzwh6wKe93hX0v9Zmcz3ck+b+ZwyLjD/jeaBmfc7NRmH8r0cxxjvm08l86vc
V+H5yRuS+dL9mnFHF0/wc1h3LvXQ8eSkIu96yvqLOeefetzEuaXmyHt8hLz5
qiSvhrht/XDLcw6g7V+V5Bv8quQ/J/nnoX1ZmIzTyaP2cw9O5nnIr3N/jDw6
85eV8hTW38tv2/+7kmfudvOSpL9HfXF8ox8Tzpcoz+vPgx0ETn0O+y9KvTLX
vUuaJ5wM51FQH8wp9/3ygxCv6vlIvXrGAn8giXv4p/9chUHg+Mcc/5jjn/7z
JSbD+RL4wRw/mOOHfj1jgeOH7L1cPm9Kyi36zdGfybt+tfcXDIK8+8nIm+Pn
/nMAJsM5ANk+kfYeyY6jx+1Ftn8E/5rX+3bVjvC8/nyJrck+7smwX5v6ZU65
6udjIY7hh+y93H/mvdze8V7mvFf/fufJsN8Z+83r/b+yh/cy570y+90u35S0
y+g3R38m7357a0/HkXc7grw5/uzfHzoZ9oe2dkb55P6REA8pH/3xKo6v0eP4
gFwST0K73N7PHuJJcn5L7K/W+y5V37Gj/xyPmH9V+8fi+Mcc//THpe2JfJff
5Xv93H/AP+E8kGQ9hfdyfGvvj+h4e3/E1vC+5ryveXvepuW7/IqFild/6fwD
/nE/Cv+YZ3kU+MEcP5hjhzn+Mcc/5vinXz7mV+Cf0O8t/kl4iOfY6XiLfBL3
wrxE216EuBf6/8iHvM1Sbvv378dxBM9L4meYl+C5YZ9+eW7/fvZB4PjNHD+a
48d++UGIz217lPb/g/39efiDwNX/7+ZJ2v5/eF9z9fPD+/bLD8J8hfr5oX3M
7PH4EXvcvsAtj5zbF/zgdoT6bo49/ed6TYZzvbDHHL+Z4x+3d+15idtDv8u8
Lbc+j2UynMfSxod4H4Hl4ZZv+3Udx/6sn5PV66yc9/eTu3wzn1fvuIc83Ofe
8x6+J8XlivfqX9femsrbP23/Od7z4nLOb8dh/Nh/Pl5cZ2/7+fG5/H/7sz+P
aDLkEekc8mB/OAeg2O9+Wnu/Q+z/uB1sz41/3DldyfwPv/vbnW2B48eMZ989
G48n81HpuKz/fJ7JcD5PO56K7bj9D7f/2/Y03vM4yzkwvO8Qzr9w1ffKeS7r
PNbD/jPLm+NP1n/g7fmTUd6c78o6D7zdHx3lzev9cWWdpz63yfeO8uZ8J9Z5
4O1+lihvTr3SveHDdv9LlDdvx/vm7JeJ8uaUe3/3dn9NlDenvPq7t/txony/
/novfOXtPvEob17PzdZ3b/N1o3y/nWMT/u7tualR3pxzMLZID+cq+H05X8I8
Wa+v5SOr7xm3Hn5n3Hqov6zrur5n8ubUX9b/Xd8zefM6T1jWb13fM3lz6i/r
t67vmbw59Zd1VNf3TN6c+jvs5ZvXZ/LmSf5Gre+Wp75n3Hqo1y4PxAHrQb5f
/2BiT5UH4kAmb17bZZUH4kAm32/n2ITLA3Egk0/q3YTLA+eVZfLmSb5NjQPU
P9f3jFtPkrdTy6X11HPyE249yT0I9X4p8+QeihoHLH9UwpHX/Wu1XluevCxz
5P2+1GvLk5dljrz1UK8tz75jc+StJ7mHq95/bI48eYKu75Znn7I58uQJur5b
nv3L5sj7uyfnq1eu+yyGyXluw+Q89sqtJzn/rdb3u/S+6PF3QT6pjxNHyf/E
h0zePMmvq/HB70UcyLj1JHl6NT5YD3Eg49bTzrd3vN0HEeUvau9PrPUd+W3b
N5/160M3an93x5FnH+GmwpeUfMtV+8/78CHvnjt1zJ2bvnbErafXOPCaw264
/urtg6nr5q351qKlG2s+p/WvLvmc1tOeH97JEzfMf1DOc7Oec0771so/3HH7
sddt/eSTH7Nnt6P+6rmHTNtD3LAe38f6xbftc/KLr72uu69B7+V7q9FDfSd/
7aM/bdt962nXNTo97Gt4zmtP/u2+0/LPfMctd963rOMPt/e9Dttz0W1Pd3/l
vYUfLm55f/fkfoQubpR+JTw517HW94dkPzypdxO6X6nGgUzePMmbrXHA9tf+
QMKtJ8kzr/Va9/sMk/mQYbIvoPL50pPsF6v1nfrn+m6O/Gpxn7cGr/sKi3/M
Le9z2OB1X6H0+D4LuM9ng9PuWw/c8r7/wpz3cHxgv5S59fgeDXPrJw6Qz25u
PT7/DU4/4eSEW576TnlwfHA5QZ5yQnxIzn8bJveD1Po+T+W55gX117sy7tgp
xIFM3jzJk69xQPeQ1vqecetJ9onU+n5Mwi2f7AOq/GjxZD9mjQO0n44D5sj/
q7jP5XN9d3n2fStwfmfcepgHID/a8SGTN2ce4Opevnl9Jm/ufROup1m9tjz1
0f6n/2+OPOeDuj4i7/prPcjzfam/yXmJtf66/Cf319T6e1TCk3pU+gP1nt9a
rzN582TfSq3Xuhe41t+MW09yX95wr9L/N0/u3av11/Lw70mefozlqadw12tz
5L8v7vMwXX/xj7nlvT/I9dp6nP/j+mvO31sPcubU32t6+eb1mby59zG5n2B5
6nvGrYd67e9FHDBHnvM1Xa+RdxywHuQpD8SB5LzTWt9dX5L7lYbJPq8aB6wn
ycvq5gHEiQ9J/U259ST7y2rcoLw4Pvz/eacnuTezxg3z5P7NGh8sD/+I5Ikb
licOwB03zJH/hLjPuXV8wD/9vJP3Pj7HB+txvhzc+/4cN6ynza/LeKeH3/2c
+7A2J/Id9z5ExxPLt3l9Ge/0EB/8HYkn5shz/q7jA/KOJ9aDPOVkU/PcsL9y
2N7DtTnhnXyyT7PGDetJ8hiHyb7OYXvPV6jXs/BOT7I/tMYTvrPjRsatJ7lX
t8YT8+R+3ho3LA//lOSJJ5YnPsAdT8yRXyfue83MGTfDfe+D4wP9dOvBz5Y3
Jw7Q/jueZPLmlI81vXzz+kzevM1/694XuUzenPru70J8MEee87Zd35F3fLAe
5Pnunld0OYfz3eHJvRu1vp+vcose1y/kk3o3cVD57o4Pmbx5su+7xgG/F/U9
49aT3Jdd44B5cu92re+Whz9F8sQBy1Ov4Y4D5sh/Rtz3/Zkzzw33/Smupxm3
Ht+34nqacevx/Syupxm3HuYVuZ/H3Hp8j6G59VN/uPfG3Hr47e/Ib3PkOXff
cQB5xw3rQZ5y4rjhegHnfeHJ/Tg1DjxV5Rye1McJ9tk7PmTy5sm5DTU+2H7i
QMatJzn/oa5LWg/xIePWwzrj4eKsS5ojz3mW9buUff0/u3Xx2Uu2DyZu/MWt
e5y+bGM9j4tzvCgPzOeiH866pOWJGxc+cu7uG6f1X/3y8+Z//LBuXdJ6WJe0
njvXXH7OedNx46TnPOdb107rWXz3hQ89dFi3Lmk9rEtaz8Jvznvu/q/8/bEv
OuPi4/5xWs9H5p73L7953Lqk9VDfOd/UccPvhbz1UK/PkT2HrPniPW+YLpfv
evDac782recDKx98y+sfty5pPdQfc+ptJn+n7Kc8Ie840G//YIJzZPv7D125
gpMHAU/ut+ryiYt/zJN6N8G5Go4Dmbx5cu5KjQO2n/qecetJzm+pccB6qO8Z
t57kHJiax2M9xIGM9/thMMV5YPCjEo78QvHknMO6TmA9xAfz5J6XYXJeYp2X
tB7ihnlyL8wwOXexzl9YD/HEPLlHZqh9E5UTZ6wHefPkfIw6frM8cSbj1pPc
O1P7WxsSHupFqf9+7uEJr/tVxJNz9obJPcI1nnDejHlSryc4B9FxJpM3T85l
qnEGex1PMm49yflONc5YD/Ek49aTnBNV44z1EE8ybj3JeVN1vGM9xJmMW09y
Tl2NP7uV+xUdf8yTc/OGyfl4Nf7YzuQ+6Lruwvy9ufUwX7Gql29en8mbJ+d3
1fhjeeJDxq0nOQesxiXrIW5k3HqS88TqOLPfzkHKrSc5l6zmeVoPcSfj1tOe
R9Fx/r7fD2OBE39cfohXmbx5cq+392GFuMR9s+bWk5znVvVjr+NSxq0nOReu
xivrIS5l3HqS8+W69WLpqevFCbee5Jy6mqdlPeT3ZNx6kvPuajy0HuZpM249
OlcqxD3rQd6ceDXs5ZvXZ/LmyXl9Nb5ZnjiWcetJzv2r8c16an8p4daTnB9Y
41u/nYOUW09yDmGNb9ZDHMu49STnGdb41u+HsZRbT3L/YN3X1l/vonxy73Dt
p5mX90r3sZoXPweenPM2PKicL91vTzj/bfjOMs4yT86FGy4p4ybz5Ly44ZYy
DjJPzpGr9bSfh/PlhveV8Yt5cu7ckPPtzVWPKuf87X794Zw62pHAk/PraNcS
e8K5dsPkPM8aB835Tblzu+b9F+8o6wjeH1fzEyRf9y8k3Ho+VOYJzWmnrKfm
PyTcehaV/rY55dl6kvP9hpeU/rk55dx6kvMAy7j+tsAp/9aTnB9Y60U/D+cK
ul9dOe2Ln4u8+e5lvcH6aUf69wdtD3rg1sM9X+a0I/12DlJuPT8q64/m1Efr
Sc5XZLwcOPXUnH3TyX7ndD+U5am/tANuL6ivrtfeT5Hcd1DlzZN7BGocCPvy
yj4cy1O/LA+/TfLky1oP9etdet/k3IxajzLevw9xcv3BCbd8cg9I7R9a/o9l
Pd7yyb0htZ5aD+tzlk/uHav11OUhuRdpmJxby770dP+g+ZWjefLAKf/ZPiDL
U/7p18AZ93m/APWCdiaU80TenH223g/VngfS8eTexlpfvO+P/VrIb2rWs7r7
Q1lPob5wDre55ckXN6e+cD63ueV9znN/3m/klqceZdx6fE8lnDwVy5OnYnnf
a+n1L+th3dryvp/I/Fz50/ff1fXEZJ8d7Q7nZJsn+1jT/XrmHyrnciT7atP9
OJanPjJucH10nj/c+4mS+19q/WI+te3X7RE48n4u+y1ZZ3Z9tB7s8P4pfpsj
z34716O9yj4pc+/nor4wf2Pev2+O8zG8b24y3TfnfXajft2D6X43y99V2h3L
U/7xM5z2xX6jPNv/rN+YI886Xv2Oo/2b6T418xNH+V2BU/6zfSuWp/wzDnY5
dx473PtuknuLanlmvdHl3xx5P5fyT36Ey7/18J7ef8T3MEeefaL1+5b9MN4/
5fO6nZfVzycDb8cp94Vy630ccOs5qKwvmFOeV0s/5dl+oHzan5Rnc+RZN3a5
zfZnmY/m98K55bU8Z/spLE95vr3M07jcOo8a7n0Zyf1Z3fx5Wd92eTZH3s+l
PJOn43Lr/TKUW3Pk2Zfs+HxzKb8un94H1PZbtobyOVnsdDlEn7n1MD9sTvn8
gfTXeV29b513lZ8pn+bIk3fgcniL9ru15Srs48vy8H2+Yi1XWV59Ju98/uT+
tSHnwlgP5c3PTe5lq+Vw1N+8d9zl0PssKIfmyJ852hdW+aLSrvBcl0/z60q9
Nfc9Ai7P+AdOHojlKZ9Zvnomb/1XJpzyjD9dnu23Om9TuMuzOfIfKH5WvPK5
mrWcm7NOaU45z/LMLU95vr/42+XZeafJvX5V3pxzi8wpz9af3A9Yy/kyccqt
9wtQzs2Rf2+5Dw1O++39EbRb3j9C+c+49RB/zSn/1kN9yXimp59PBo5e60fO
fP/SP8n0mFOPlolTj/xdqBfeH0Q9Mkf+feU7qh+b7u8wZ1402W+V5mNbnnrE
ek7V03+vZa0v5syLmlMvnP+Z3I85TO6pr/Oi8PnlnCLqhfPnqUfmyHOOiMs/
/Vlz7wugPNO/MO/fNzG5/kqVT7jl2Xdkzryl+YFlndocv9sPzHNanvLpfS6U
Z3PkX6HvxTxntu/AnHnOZN9Qmldsecoz642en2SdxPOTzotu43nHk3u663jQ
+f/Mizmvm3lL9DBv6Xu3ze+X/cxfWJ55S3PKM/cBck6Xz0tH3vfQbVI593v5
fPVNvfE8cuth3tLyxFPLM29p+SubON9x5ifNmW80p/y99/p/2/XG7YOJza/8
t6W3HLZxnLx8yzM/6XJCfeEeQnPLMz+Z5e2bc25wsr8mzZu1fD3np6zDux6x
HghnvYH9Rq4XzgeG254LS5y3PHHb+cnws/RcyrPl4T+U/e2+V+fbT/f/5QfK
reXpN5sjz75wOOXZ8sRZc8qhOf4y53cmf7b8dnWZD8zyt83Lfs/AKW9Z3qPl
KW+MJ8yz/EP6TS6HtD+tPfV86U6+xE/nf8Jtf3KPZC1Xzltm3soc+bfK/u+U
eYEsP9mc/nM/D/eX1f63/UY7ar8RF3aX/Xw/yguc7+TvxTyb7aE8WL5t3zt5
zk+n/6vyxn0BjoeBU36sR/cUBHlzyhv9F8e3TN5c9x2EcpjJmxMPmaeH656C
IG9e42f5bnDdUxDkzSmf5rrXIMg7P5DybE559nfUvQNB3pzy7++oeweCfL/+
en9B5bp3IMibU79epe+oeweCfL+dYxMH6jtS3zJ5c+XFhXpq/qKbPn/YvPfM
neLfW7fMXf6i/d5d+8POWziqKc/xPN5svdjnwdIvtH78zPoy/TT60+cqz6E9
X27nKs+5tDyf82mx4yzto+S9vA8dznPu1fu6P4le76t99aWX/fyax/YPF/1/
eNHbX7Nwabef1PpfKI5+xdXqB+Kn77NQXPU6eNCj+BzWx30fispnsp7e8d3a
POSwLp+dq5/J9+fZhvuYahx2vtMRiTzl5DTlX1FeXW7Rc1XCLU88P1fnpTMf
Yns4RyLLN3udzh9GT/ZczpG+tMzPIO/6e1HCaUd8jjr9KNs5Vtb/sjy3RxQf
0GP7kff51cjbzqmE13wen99e1ods53fL+pA55yFyvvex5Xxv9Nh+uO1Zm3Da
01XKn4Q7r5Jxje38bFkPMOdcNp9Pjh7bD3ceEdz2X5Fw1g9sP+Ms23lWmYc1
5xwoty/osf1w27Mh4Yzv+vMAtwfOeTS2Bz22B+7nrko468jWA3f+0sEJXztL
/p45ccP5MPR7nT9T71tPuM+hbdejdw5x5pnKt6G+958fvjXogZ+h87Gpj9ZD
/bIe1rdsP+XK/oFb/w1JvtyNCaecWD/c+imf9yhfC/22H3lz+ifzld9F/8Yc
efuNfgznMtKfeeKrv/KSq6b7RTz373/38APPWvq48/3Ke21S+XeeEu2oOfVz
hfL30OM8KOTvUf4V8c7+px2F057y/b4tf3K/As/lnoV230f3HenvOt8M//q7
w/0d4dl57NZzQFmnsDzlx5x5q8T/gSNv//NdnLdDP8Oc7/U85aehx3lByI8p
H4nv6/wo+hlw+ht8r/XKv9rzH3+96rHvW/evn/2xjzz9cd+X/gjyzFP5ub5v
3dx5X3zH7Bzvecpb4ztmesyp19bPvvL+vLXBBP7ZJD395w9zL1h37jflxN+d
cfS5Zf+EecgfK3pcHlgPdR5Xe3/N1lB+njOvzR9D3vk/yNN/rP2oEjfqPZMl
brT33XR5UJSfP+947L97az7Jgpf/r899Y7q8nbJ86bMv3LjL8D+vvejaox9X
3uhXIk/erfUTH/xdKG+Wb++L3xzOd83Okeb8OZfDTI8566HW394X4/y0wQR+
o1x97GOXXf3ftw/qc6/e8sd5T3pcu4PfXA5dHihvl47614FbHj0uJ4ub8tPl
cS1KOPuInG+DvPNz4JZnfRP97bphxz0f4jwoyhv9fXPLsx5q/Tc3vPvubXnr
5Dk3yfqRdx5XvXdS8m156/RzvqHlKbfZ+aUZtx7WJf3cw2fh1kO5xf+bxJH3
uqfL1VNn4S4/Zfwc+D2lvfY5vZRD59vAnfdC/DxLeTjJfdB13sbPPe+Jn/3R
V6fjJN/lf1+7duXJSz2/ty2UW8aF5panXLHPwOU5K4fOg2rvH+/0cw6mOeXQ
eihvGc/yqfAbnP459tM/b+ctt4VyiN9cDpGHEyfn6zxbypvjGPJzi58t7/JA
OfQ5sZQ351/BnT8Ddx5Le15Tx5lP4bnMC9H/57nu/8/Veaf0/82RZxzp8nOX
zjWlHLo80O93fhH1iOd6fsB5PtgzlD1wz6tjJ+MM25PJ+5xJ5D1/fpE45Y15
A78v3PlX9CM/qPl85G0n8j7HEnnbOSWOncxL2E647WQe0usOyNtOuO1ZK+78
H5cf4r71M69oe5gntDzc+UJw23mFeBtnttV8Us/D2G/ElyxP1XYSH/1e6Lc8
3PZvEMf+9vyumB9o/ciZY99T5If9xo9+wRXT8Zz3/fQRP33pxOPiuZ+LfcxH
Op4jD+d59g9+t51w+2eVuNuLN+t8Y+K/4znyW0o8tLzjNuuIfu7N4tjJ/Fd2
DnAWx96m8xXRY478QOcrMh+0RflRxEPnwxB/nM/D+Nkceeshblie8U84Z7XU
U/PrRuPAwOu9pcrjqvefJnlZ1kP/oP9czW3jd8lvlEPLU26y8zydR1f3u+nc
Xcqb202481HR8+86j7rt53Scv7ed/H12vijnDcMfSs6jm9ue++S8giTvJcrD
nUdEXojzQ8jPsH648ze07hz43OT8vWT9mvP6pmxnss4eOPV3N51nAvc6DvU6
W/c8NTkPxPLs5zSnn5Bxr3ez787ytO8Ztx72O1keTn/5paWfTDtrebj1sw/E
8nCvx9FOWR5u/dR33/MLz9bZy7l0U+6ven0E7nl19SfDfdPWA8/23S+SPcRz
y9d1cOmnH3iLeD2fOeHv1H5/vqPPkajrv73rR9tSvp/WofiO1l/Xc6WnrueK
13NjkvUs5rHcL0KefgLlw+czUM7Myefwugl6zMlbs57Pj+pV5dQv5H3+AP2M
TH9mj/fd817mj2g9xXrM+X7en45/vT8d7vWIDybrFHxfc97X9uNP+LHyp/e/
v7X05/xeyGd+8L5v/GmOvO/lJN6Z40/vp67npmq9AO559fY+946zv8mc97X9
+BNuf3q/NtzvRb85u5/U+5fxpznyvq8Qf5rjH8/HEvfN2/ntbl4Xf2bzzJYf
Jhz/+L3wM9xxwPuI4X5f/Jzd5+j9s/jZHHnP07bjrG5ekfbPHHnv98Rvlue9
bM/mL373M0um/bPtzU897qfTfPUXJp/x/u90/vF8Ndz24x/zvUr/z+NN/JDx
MG9ZypXH6fjB8xvtvolOnvvXzV+bcOJUNt+1s+Ynqf/9+bRbh8t1bxTl2PJw
z3NSTzx/yHfqn8fYNu55PJ5nefxozu8D9dwTyj5Gf0fKieeT4Zm8vzvlypzv
9Wrto6Rd974t5M3pH2Tc8xJ8d+/TpP2zHuTNaUcz7ucS3y0PJ84dozxMy9Pe
ZNzPJd5ZHs5zj1X+pOWJvxn3c4kjlof7fSn/lifeZdzPpZxZHu79rZRvy1O+
fT8I3PJXlN+e30DO8yRrZpF3nj/vac5v2wPHz7Sb2GF57Lgq4ZYn/z6Z38jm
VcI8CdzzIYzTnE9Iu8B6FOtQNyfyzE86zxl5j3+Ro7+J34591ymHfn36efzd
8r2O2O/lS7vxkc/la/OmuvFXzdsXJ9/O9n8z4a/7+u5XPjodlz5+/Kqzj5i2
98g5F571ph+fXvNT/V7kM1nPtQmv5x6XfB/yfJDv31+zdeh5BvJX+vPDN6fn
TJLfsUnyfi7y3r9wSVkfyfK3M279Xy3z8pb/+izcevjtvEH+nvu6XU6cD0l9
RN7jd+Q9fnf+WLu/4xfhuVmeG/J+LvJ+rvOF0L+P+v9w58+gH3k/F3meS14r
/awvlnKLPV6XZ76i/7ygwZTvF4Y7L4L5ao+D6OdleS/o93uhn/cin5P+IPmc
vJfXjx6RvN/L54TAvZ7IerDHIx9MOPaj3++Fft6Ldsp5AsgzXrQe+r/oIX56
/eub4sgfXfp1Xv8iTlrPteLoIe75Hka4+9vEw/516s3rrZ/4Rr6V46TzFoh7
1v8VcfQT3yz/dXHkb2jGp/H8imy/oeddaV89z0m/3Zx+tTn9XnPqm+NzvV9P
88ntvt1B4J7Hpj/keA53vIU7HnJOtOMD7+Pz1jjXA/lVJb5xHo3j2Mpk/gH9
PoeKc1scZx4Ud//wBtVT+p3Ua8+PeT2R787fvaTI499snOVxBH7PxkfuD/M9
LI8fXc7hPv+H+pXp6e9vbwv64R6fUh8zPdn4xfr5HpaH2z98p2y8cIXfd7Qf
e4J/byv7svl766Eceh8f7Zr3TWMfcRs76edn61ne9zc1y3jB8YT2IlvftH76
Z9aPHuunvcj61Vt0njzzBtbz/TJvkPWrrZ/y6X24zA9Y/yfK/EAWJ70flvln
/Aon/nr9jud5fxZx0vLYYc5z8Xc7Pp0T1ll47tHiKxN5npudS2w9lHvbw3yE
OXHY+3eod3DqNeOusB+k+NnrGpQnc/xA+fL7ZufcWv74Eh9tD34w/0Jp1+C7
lnYN/3h9BD8gjx8YBzoPnP6H1x3acUfH8QP1YDZ56pXbX/xjPcRN27km4e14
pxsH4R+va2TyvJfzpbHf7Tv6vS6AnR5Pod/5e5RX50kSJ91OMb9x3mh+Y4L5
jXpfaikv7f6jrcPj1S4TD62ffpX7//jL7Rpxz3roP1kP7ZTzqPGbx2u0v9aj
eTbNL6V8IjkfI+T51HugyriZcy95T/b3IM/383037fxAPBfF+80PT7jmISsn
D8ztFHllfm677yne08E5cJb3/nG+l9sv6oU58p4P/Gwpr7RTq+VnuPcLu5+M
v76g8/3a+jsI8ub4JbsX3vl1OnclcM/3Kt8szPeaU98y//s7rknkmSd33hTf
y5zzg9xf5Xnur+q8lMCzfrj7h+35TpE734n44P4Y8wLWc3jCiS+cM8T5Qsit
0jos5cr7KXgfrzOix3EM7nkMuNuFdl9eHC94HYf6lq0bUv8u1bm+WZ6z7Xmh
/Ol9wf4uzAe6X4q8OfqJJzUOlHLgOMn7Og7Xcy0kj32Ok3DnDbb7cDt5ziOw
fsbp2Tk5tpPxvp/LfnjrYVxvzjyA9bDP2fKM982ZH7Ceei+P71kr/Tznx9Z8
QskvTjj9ED8XPf5evyrn0Wf30PW3p9tS7rxceJaPajvJh8jus/N3J45YPzzL
X91Lfkav21nsYL+4ueWxw+048uSbuP9gPfQfzJE/TfbQTvm5yDtfkTyJ7JwQ
7v029/wk7+vxJvc1ZudUcN+jeXa+AfubzW0P/FHZj39s54MaF9ueF2tcCfd8
LOXJ49D2HsCwXz49V+GftY/+5kSe912scz/gtvPGZD8+eQnmnJvk8SP2eP65
5Z08cd/8moSj59Mz/39d2Gd6Wdk34/fdOJIPfrCd9Lf83FY+8uv0XOzhXlBz
j2fh3AsqHubbeW62/9fyNV5pXxjc40T4D7QvrN5brftK4NZDPfS+JOqhxwXI
m5OvZf6yUi7NKd/mfO9+Xtf3A7c8+7HN+R7mzyvfI9vP5f1rL0jkubfGnPad
+YCjyzwA+wAtz3fK9n+dqnwn+FvFuf/DemjH3X+mnfU53uwHsx7ad3Pu+ejf
17Yj5Gvx3BM0b8Pf+94QuMfFcOdZtechd+NE+CLdV0v/w+sO2J+dH+tx0MY/
n3jJjj91++L3uWv/I973/G7+zfNI3Cdr3p6rEO9r+Nmti89e8tj5rL+4dY/T
l3Xn5Lg/hrz7V/RvsvM5zelnmNNOWz/tk/tvtJfhXMTSfvT32yfXezwCtzzt
TRg3ld/eP0K59D4U5L0/Annvs0De+f/Iex8B8pxz6f6t89uRN2cckrUv5sQ1
c8bPWbv2fHHey3n7PNf55/QzPc98asKJa+Zt/mTQEzh2On++vRcjnt9yoPbD
wrN5OedLUx8sD/e8Cu9ljv3m3APufOybEk6/MZwHUsYtjv+MWxzPkc/u0bhZ
nPjg+Rl4lqdt/fVeA8kTZ5yvC/dz4dbPOpPtIc5Yz7NLvLIe1mOyvOgsb9mc
eTTzOp5N4lt2zmom77xNyqfnSzm/KxuHmqPH8RbuuAp3+WS9uP8cgDlT9g/3
c2fz2+aUe3N+m1MOXF+Iq5m8OXkk5vTP/F7k/2T74rN7cLL2PevP+7nIOe+F
93e9QN78qiZud/00nud+KXr+QeeN1/kWvRfc807ouVXydT4n4a5H7fl4cV3J
4wXey/6knDufHzuWq987uqd8fqhH3BvydPVb4J5vgVsP965m97ybcz6V56+w
0/Wa516i/hLc8x5w6/lJcp4qdppjp+eR0O/5E/j16qfBPS/Bc62H89nNscf5
DK3+bh7jt6cdcOKSE8ZC/w15zzPAs/tzrX9VwrHTeQXocf+z3OsR+m/Y4/mH
1yTy6He/Efnd1f+BZ/dCuj9W7xHQvEe7f3As8Ofr3iLGCSdKvj2nK97fZH5s
wqm35u25Z1G/3wv+SslTH2w/fvP9FMRBc/qB5thvTj03p7xm3PdrUO4tTzkz
p/9tTvtkjh/NOY/lof57PaYoj3DsNsfP5vjZvO57EsfP5vjZHH8SV8x9r8EN
ZVxnPfjfHP+b439z/G+O/805f8cc/7sdx//m6Om/b2VBmC9Cj3l7j8wg6HG7
SZz1+erEU59njn7rQb/bO7678xL5vtxbbu79PpeVuG89fHdz7LQ92Ol2kOc5
nxB7uC/dnPYXfnEZf1kPdppjp+3BTreDF4zuC0zb3/Wa9+C8GOfz877o93tZ
nt/eZ8TfWx4562eeOTs3+HNl3sn+sR/wT9a+Hy7OuTbed9Duo9kW3pf1C3Pv
SxoWv1tPu89lW3hfzuP1+/bvk1oQzzcY3UcY+EfL+qjngdeVeU7z1WV+0pw4
4PMQ4OFczWJ/cq9xyPtq76PvOOuG5q1/wn2vYRyN/nCeXmlXzNGf3O8Z7s1s
7weP/Rbz9pyKjlOufB8o3Oe8rS7x0Hoob+aUV/P23IaOt+cqdJx20Lz97mn/
LfjBXP230P80V/8t+G03nVPX7rddEOTNLy/x3PrV3wt+Nld/L/jZXP29zM7Q
X0r6IVn/JOtvhP7DGSUuO0+MOGD+3hLX+vdHLAj9B36fU+KW463b9zll3NW/
D2JBaPd/V/qXbmd57sUlLvq5bq+ZB+m/V2JBaMeJD26vL0nGuW0e4B2hnXK7
Sf8ja3+zdtztMuXW8uyjszz1vX+f8oLA2/1rPh9+QWjvkKe/YPmkfUnvAc/W
0x2vWv3h3t6p+5L66HrKfpYsT++2hN+jfVX4hXUq5OErlefJ83g+8tSrUH9L
uQ/nFpbyZ17z3lV/WecKeVAlnhMnvN/H/Qf6f+b4h/lm9tHTf8rOKWLfEvuV
yFNHfu+ih9/8f/YdnJTMS+sc0cqp/xskT/1ZqPn5es+g9iOzftmfX70tcOL1
JeqfUx/gmyT/VfVjkYd7n7vv/cRv3g+Iv/5a8RD+rCQv6xDFDfgvlUdUz33V
fdy0i44/1N9l4vQrHPf4vl8p/Szvi2Sc5/K2QfujacdtD/Hly5rPJI58Vf6h
/GT7F9yO6P5uvtd4O28wK8/0+F7vqkf3ic/GMz11Xcx6dM/4bDzT43vAqx7d
Pz4bz/T4fvCqR/eSz8YzPb5PvOrRfeWz8UyPy1vVQ3/jL+SZHt9LXvWofz4b
z/T4vvKqR/ekz8YzPb7HvOrR/emz8UyP7zevenSv+mw80+N7z6se3bc+G8/0
1LikflHtv2k8m/FMj89Fn5KeKc3PZzzT47hX7VQcm41nehz3qh7Fsdl4psdx
r+pRHJuNZ3oc96oexbHZeKbHca/qURybjWd6HPeqHsWx2Ximx3Gp6lGcmY1n
ehyXqh7Fmdl4psdxqepRnJmNZ3ocl6oexZnZeKbHcanqaddHZuWZHu8/DXGG
cwdn4Zke378wldg5G8/01PKaxEmvM2Y805PdZ+F+5mx81nsxknbE84cZz/Rk
91+MJzy7/2I84dn9F+PJ/RcZT+/RSM7DHE/Ow8x4eq4mv7X/upYTnZ+Z8UyP
nxvq0V/IMz3ZuQTVzkR/Wo+S8w28P912zsbTfe7JfnbbORtP98WrPLgcpv5M
4p55fa+knJhn99e4XgS/ad57POFVXvkGVV7zeBnP9FSu/D1998FsPNPT5Ru0
+z2rHs23ZzzTU7ny96oezftlPNNTufLuqh7Nq2c806P19JovN97yydl4pqdy
5b9VPZrfznimp3LlrVU9mg/PeKancu0LkJ2D2Ximp3Ll31Y9ml/NeKancuWb
yQ9js/FMT7Y+6HmJ2Xi6zpis641n6338fRKvvN6X8UxP5Um88rphxjM9lSfx
yuuPGc/0VJ7EK68/ZjzTU3kSr7wOkvFMT+VJvPI6Y8YzPZUn8crz1RnP9FSe
xCuv92U801N5Eq+8PpjxTE/lSbzyOmPGMz2VJ/HK65UZz/QM2/cNcS+sbxJf
ku8e1lOS9YjxhKschnY2rF/8P9tvd74=
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.7], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
66TwvJyfHOp8omuvFf21rq0GvcbVwhfoHvcxttPu49TQz+FhH2Q/XJe1Duad
rAF6otpZn7Ve4VrR72XMZ9XPek1Az9BAdPOM15+Weq6WGa8zrUS3ED1fdIuc
1yX4geY5z9928CTwDxnrjnZWeVX0eYx50TuIniR6N9HpjOfgTqLXJC3j7yc8
Q8dvJ102OjwjuqamrOOim+l8TvCcnrdpzt9qvOBY5k/gDeARXucdBJ7hUvZq
QX/R74dn5x28rzZ3Vlkd0e9mzWdcobIOCe9P7E276fgm4T1z1ivBp1BnvWBX
XbtF1vsY9XnvG1TeRHhL9D85tzEl4z2XcTss8IXwh8cJP5r0Hl4Q/kPXPKQ6
S5Gnk157tg7l7PdvMx8TrsMa8WnWe8+3GY+RaYLTde8T0+YNxgn/pToPJ7ym
wRuMDPtaH3iquPcm9jvKkV/+Dmvfx7q2ifDihPv3u8ofSJi3+UVwj+gRGfOP
94dxy7XUX6nyfcMcZ16/mPTatmvSMjqyepe45zvXVoSLafOHddKe/6wDZ6XN
Y7GnTArn7xW9b8zXLQr3Zb26WucnCw8UPifhdfUh9eMX1k/GWsL3RT/AmB+i
89trjRqSsAyM/HtM2nJJA51LqmxQwnLnsWnXY107OOe1cFLOfD+8dn+eg3ch
+i90aILv2EeEH9D1wxLm2VkPhyb83Rey1iQsH0xKmY//SPjUwCfAL1wedAcf
Cj+gtn7iHQtfx/6csP5iVMJ0T5WhEEdWRE48N+H3gGx+bdzH0KcmrB9Bn8B1
o0I77GXnB34GOYN2kFEGpV0HXguehzrI3bRNm0fAcweeB94HXh4ZnnnSIW0a
nhyaedUZ/baErR1L4hv0/q8Uvb3ol0SfUdberePXBROrpicIZgvW6dw7glGi
fxecJ7hV8LHKNgqWiP5L7fxV0HcQ3b2Ovr02q2dEfyIYpTpzhX8R/lWwQvS/
qv+v6n8j+gjV/071Pxbdt6I5quOegr9U9qvKUipLCIqi3y27P3/r+Ley20yr
vI6OI8EWPJPwdoL6oh8V9FNbJ+t4vej9hY/T8TrRnYX7Ci4s+7n+EKwRdFRZ
H8EG0YdVfP0nZT/vp4L3Vd5M5ceq/Mmq+3udjh+suu3eom+vus9JwdZ6jq0E
9QS9VH6Hyo4S3kLHNUEdwQ6CRoIdBdvx7gTbCiqRv1dZ+HBd94joxYI9dJ/p
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
/LHx38JOTn3+j4YtFrkS//SvI+t3/h8eX7Je
                   "]], 
                  Polygon[CompressedData["
1:eJw1nQfcj9X7x+/v8917SFJJsloiDWlSoWX2U1qKFBkppSFtLRGlvSQqaZCm
hoYWKmmINJE0JA0t6f95+5z/6/Vcz/ec+5z73Puca3yu62rSf3ivM+uiKHox
G0UJ/W6jf9/o98pYFH2hcttUFD2n+u/xKFqViaJp1Sh6Kh9Fh6p/J1FrtT+j
9l/VvkLtD5Si6OhyFF1aUV+VJ2vbwWq7Tn1SKu+VjqItNPa7Gruq/R9WnwM0
ZsNiFO2scYuQyhX9rsxpLO1zpvbdSWN8pPIyjbtc9KnoeO3bS/36q7yDfnuK
Bovmavt++j2DNtGTqm+vMfup/KeOVVG5pnI90e46/2c1/m8af6XG30X16aqv
Vf1r1Xsko6iPblA7nfOlOuf7tf8s7Xegzv0g0Wht20NtL2qf07TPgdr/DZX/
Vflb7T9Q+++p/Yvqc7rKG1Vur/Y/VK+n+k7q/5DqP6r/V+rfJFzP7jrHdjrW
wWp/W+08nO/VXtI+67Xv1RpnksojtX03xhZlVL9c/S9R93Ya7zb1n6oxZmvM
jjrXg0WP6l501LZtNP5u2j5Lv/fpeA+pbbqog/Z/U/tv0v5rtH9H1d9S/T/V
v1N9hI63s441UduO0LZr9Tw3qF7TsRtp/73qRdHeonaifUT/qP0pneuJ6v+V
+nyk8c5RubX2Xabxuqj+LpencX/k+nRuE3Q+Y/UOlVX+Tvsco/ZXdIxTNVY3
9f9Y9bz6/6z+3VVfonpB9fWqt9cx9xXtJ9pfdI72eUf79hEV1fcI0fvqn1b/
der/bspjjxK1Ud/DVV/Eu6r2n9TeU/WlqpdU/1X1w1R/T/Wk6mtVj+sc39M9
XKprXyI6RmNM1lhDRdurfJBolvrfp/qxKncX3aXyIFFDlRdovJdUvlDUWvX9
RI+q/92q91K5Z9rlM0Rbq9xM96Ok+1kWNVe5h/b/RP2LOp9fdD77q89jqt+j
/v9T+Vk97026n6t1P88RvaNtfbVvT+27Sf17q36v+g4Rbafy8xpvo/bfi8lA
1/Oc6v+ouIfq/6n/0WmPPVi0rcq91L5M7WW1/6b2nQtRdC7fp/Y9T7/Hqf0r
tTdQ+99qT+l+TdY5/aFv+3fRIp3HQWp/Qu/D82r/Tee2i+qP6PcGtQ3TMebr
WHurHtNYozTmUO1/ru75CNGFqic05vn6na/x3tU+B2r/WRpvjsbbTcf9U/U7
tf/Fattd45U03jy+GZVPS7vcRu0/q/1DUVf1f0b7v6D913KfVf9J1Exj7aT+
56j/OpVfVHsz1Z9Q2xTeMZ6nzm2+aLTO7WLR1txD9W2p9i91/g/oXJ/Rd9dF
2w/jfdG2z7X/Furzh8bro/qXqm+p+l+q76kxG8T8Dp+r8rFq/0Lt9bkute+r
bY9Efqd6qJzT+GN1Ly7Xs86r/D/1X672mvr/rv4JXd8crkP9v1ZbQ53DUNU/
Vf1i7X+iylsz14k2qNxbfT7T/vVU3qD9v6vp29F3lRF9r/LpupZndL1NdK2n
MS+KWqp8kH5Loje1//Mx3zPu3fOimso9NV4LHXvrlOeSr3S/v9D4G3XOO2v/
jtr3YNE76neJ+ldFC7knon4qN+edTXieY77bRvWTVI9p/0d0/WN0/XUqd1H7
BLW3UPswte+u824r2kO0p6ixjn+72r9Rvy91/Nf1/h6t6/mBeV7v00s6l0jl
V3Wur4lO0RiNNNZloj9ULmqMuCglKone13gDtEsTjfeuxmuh6x2uvtfpvq9W
fe/wPBdp35rG20rj36rxH9IxW+h6r9L+V2r/A7T/3eo/Vv3/VP8x2v8b1Ver
78s6xwd1bg+Jttb+k7VtRsnr57kat5X6XyFKa5/OGu8djRfX9h+0/y/a92Td
n/rab6h+F2j7xTF/E/NV7iYqqzw8rLk9tc/J3F+V56uc1zX+p+dep9+C6Gmd
wzsa8zn9zhHNVPlGnc8q0e2q/61j/CX6U8/jH/1O1PncpPGO1HjTGFvH25bz
Ddc8W/VzVX9E1ELlJ0QjVJ4u2kHlFRrzex3jG/0+IzpI13iAvtHt1N6Pa9c5
7SZqLWoj2lL3uKm2z1D7CbqX+6T9/D7Uti3U9qN+n2JuZ87QuTXQtpaqP6Y+
J6rvVqo/ydqi9sfVfobu80G6lst1LcNVbpf297JYferxfmjbhzq/j0Qnqc99
OscXVJ6q32miAeq3vfpfLvpT5VNFjVXuoGvooGvZVnSK6k1FA9XWWffkBuYe
1gDVTxA1VHlf9T9AfTupfTzvm7adprZ5abcPVVsbnc+9Op+99Cz+1bk8p/KJ
ol1V/1L1u1Uen/L+jHOfnsePaluk831B5/qi6DfV16r+rcprcu5D33Ha5xiV
X1Z5W9Epqq/SMe/P+JvjnLfS2HmVu/Mu6Xz3VPv3rGcqX6JyM53fLJ3H4/By
oidEMfXvoP5N1Wd39blYx79IdILO4ThRG21rorYfdY1ZlRsmzEvBg1RVv119
r9V3cL3oGNE/vBuiRqJHNXYPnd+uKu+tvs11/Lb6Dm6r+huE55qr89tL7fuq
vaXa12j88zT2Xjqnb1U+OuH2yaLL1Wcv7TNOx5kg2lPlBbqGd0QLRQXuN+cu
+kfvzEn63Q+eTWON1v6DVB6h81mssl7V6FHVz1X9Y9Xr876pnld9nupTVG6n
85ms37Fqe1Xb7mO90nE+En0AX8war/4fqm0L9XlM7TvqHG7SfZskaqnyWfA8
dZuntOhhtV+ve7JQde0ePajntW/gn4fp97iq599bYj7nNurbXNd4ptrOFjVT
+QGNMV9tb2mMB1nLte91ek/GipqqfLaOt0htNdZ0ta8QPa367dw7Xc/HOq+b
dZxJVX8z+2jb4xp7P/3un4XREq+r498LD6pzuS1t/gc+qInaG2tbU/gfbWui
bbeoPaPy9ipvr/aNar9K+9+jPv/wLHWMy3Ws0aJjVN6ZtVltDbXPTtrnRm27
Rm1Xis5VeVTa3+r16nOhyh+KKurbQn130/jXaP+Bqp8u6qNtr+u6J2rfx7Xv
PJX30bbTte8Faj8taZ4N3m2qxvxc+45Oe65mTrxI5SO1rbXa7xVdpr6TtW1L
lfuqvIOOdy3ru+i6qp/p/3Sv7lH5az3AO5h3tf9Ijbenxlup8q6s9So31hit
NMad6tOHZ5v3mnFf1esH+0/R72J4IvU9Vn0b63h/q7yNaGvRI3r+jzKXarw6
tqvPj3oHMrrOz9V3psbYRe07qn1b+Di1byc6UueTUr2xyuM1/r/wprTxjLXv
FTruhbqW80Vbw3eq7wDRMerTU8e8K/K2rZI+L84vXuf5Ef4VXuZ5lXMab2e9
b6+Eb2Nv1bszJ2n367TtbJUPU//f4e/U/1/17a/fMWo7SWPcr/JZ6nON6rNE
N6uc1D1qo3PcXfSTrvU19ZkIr4XMoXP7i3kK/ivwl6+r/UZ4fXg6tR+v+mVq
O453UOULRXPUdr22naP+azXmbN23rrr2bqJjdS8OCLzTAPiXtNemp7XfPzrf
pWmPN0T7ttb1vantN8W8Rm8dN7/LufyFjKXypep3j+rniU5V+Xftf6b6z0Ru
zfod410bVWf5tG/c/OwDdeZZToj7ed9fZx7kRu3Xg7VG215X29Xa9orK09R+
bdJzInPjJaIzVB6X9HgzVB+v8hWi+1S+os5rFOsA68EI0SnMf0nLRtNVv17l
ebo3b4heF3VgTdLvC6Jlmute0u95fKfMq7p37QuWj2dq3180Rlnl0Xw3zG3a
NpY5Qc/zBI1zoiiD/kD77qOx3lL9DdFF6nOT+t4oulDlo9Xevmp9xv/0e7We
we9BRpmn9quCzLKz6q/x7qi+QfVduT+qT9I9Wq76pzwDtY0R/Vrnb/JVtV8W
ZIxm6GC4f6r/FGSOl1S/Ep6tzt/UK6r/pvfiFJ3H9Xpvxoru0baL1DaXOUPl
VTrPfmrft2p+cqT2/0RtW6rPTLWfr/rnfEvIXKov0fO8M+ZvpLfOda7qY1Xv
yCcHb63+P9T5Hj6fNL94c8w6mR3V/rG2zVb7reg5sv5m+HZmBv3EY+p/Q53l
i79VPk7jjQvPdnf1v0C/E1WfwP1RuVfCa2Nv9b9d5VHqv5K5Rsd7ivkLPQTz
u+rP8nzV/i3ru+pdVH5b+0yKec7dQX0v1Lavmb9Uf1L9L1D9S9Ubqj5b9Uvh
eeq8hrzAvVT9G9W35ZuD/1D9e9YW1eeoPiVjngyeqYHWyxFpy0qjVT9b5QlV
87+sAbP1Pt6i/ntwHqxf2v9WZDrVR3F/kac1xkJEDJ33k6ovUNsuorO07Vf1
/6Ni+Qpd1g563jeoT32191H752qfoPqWqh+n+hfMr6pnVD9C9cXwCqr/Cz+j
+gLWe9U3qb6f6gtV36jjHwy/yDND1hd1RL5X/TGV/xUdwvNW/QmVN4kOVf0s
1Z9U+TqNNyFpeX2Drn+c6mkd/3CN/762r9c5vwIfjDwmmoTMrPZBav8hySSq
56z229S2XNf5ufo/rfpdqv+l+jPhfW0Y3n9k7gN0r+JBnnxR/bfQGDXRwxXL
7P/VWQeALD9R9UY6Xj9kvKR1DH+qvU1k3cOzqq8J79ObfPuqN1X/gap/n7SO
A13H50F+R0eCruSrID+j40HXsxJCV5rx+8n78nbSOog/VG8dWTfxmuo1jd9b
9TXwBowZ+R3mXc5qvCM01nOip1KWkZCVblSfparfpm9mod6Ft0W3qvxAWMOQ
f15HF6D6schW6t9S/WeofozqU5GBVb9H9YNUv0r1iuoPq34+PIf2X6D926ct
P36sbfU1/tdx6/mQ0ZHV71X/Dsz76BRUvwudk+qXq57jXdI1HVLn8c7TGEvU
tp9oX9Gd6nsOPEnM13NkkHGR+65Q/eOU+bnvI883zDucD7ro1aJv1H4HOj71
v1TtqZT5jd8i83DrmSeDfmYac5ra46p3UXlWzPJbGh2fys+IZqueVP0wlZ+M
Wf5DZ4pO4WKN9z+Vrwvy90kaexq6Am3bJ+gcEqofqe/8Fz2L9aIX9C5+qfM5
SP3XRpZXH1L/bup/i+qN1P9rbeuA/iiyfPug2ruq/WZ4Jp5HytffNPC309V+
esLyXVXn8p+O84COM1VtU7KWv0qiXuH9jus7mKzv4E59P18i+8U9N+1XZ3mx
sc53e9En6vNI2frrF9R+uNoPZU5GT6d6T3jquPV+6P8Yn+PkS5ZtHtC+FdEh
cfPGHessv05U262sSzq3u0QXJ6wbP0rtndR+BGuqyv+D59K+P6dcP1Lbd1H/
+brG3qofpfquWfehLzrVn1XuBg8Ibyjqynyt8Z/X+J1VPwQZSeN1V/kwlXfO
Wr7m3KaIrtS2k0XDmMtilueuFZ2h+iB4tKT5z1Ua71TWINUbwD+ob/8686zv
6vz+Vn0LlVuxfqWtC0Jnc77Kxyc9dw4RnZi0vM6938zzqP6vnt+96NyRzUV3
5MzL31CwvuSkpOdizpFzRQ+LPvZoUTnuMRn78Zj5+72S5jXP1bb+Kh+ccLmr
2m9Q+YiEZY+eqk9CP6D3qV7cOvVuyOrapwftnG/cRBmd8DqVZ6nPufpdoP6H
6t72U/8d1V4XM7+W0ZgXxa1TR7cOf4wum/n5VZUf1/5D1f4q72DK6zfyZy2s
pwNEu6mejpk/vRYbiPb7Ue1/qX8HlZMxn+/z2vd1dPDalo9ZX/9Kxu8p7+tC
9Z+r+iEJj/eE2l9W/VDVMzHr13euWv+xQPd7F/2+xJwbt84X+wTy0obI/BZ8
F/w8toGYaJ7KzYM+7yHRAzreUxnLz9XAj8xWfbTGW8z8pvaK9rkybh15r/B9
/6DyQ9pnespr353IbmEN7Kz+2Zj1Kejc4GdGx3y9b6ncNWPZg2vm2uH/L4r5
+t5Al6XzK6h8eML6jR1UH6b6d8yh6AJTXnt4B3gXZoqGqfyatu2vtkfRyaGH
U31X1R9T/RTVn1S9Ffovjfcm8hv6T97PYF9D97unqBX6mMg8AvqZkYE/P0e0
d8H6NXR8zH+PYvtImOdkzmbuRl+Hzo/5cwb3T/UrErapdVX9T704H4qWiP6q
WX/9bML64M/V3hQZMGl5/n6N97qOu6eO+7W2r8h6fj+GtS1mW1lZ285Pmv/8
Ad0r8mDCNgtsF9xDdEW71Pne7obclfT1wQsxR6OL4JnybNFpIdPwfbyRso3z
vYR5RGyfy1X+LOF3iHcJHfD7Cc8h6IbhOeA9eIbvaf9dde6LNF/8rnu8i8rJ
rL9rvu+ZacsXy+o2m2o28/MJFfZVexfVP0uaR4RXTKn/2ynzmGO0z6eRec+b
0YepfrbqvyVtj+Jd6oY+Ne33JRezTht+BZ4AmYE1mbUZHepHCesw0K3OT/nb
Q8fzb9o60Q8S1qGgK0UnidyH/Pdp2jpD3nXeeb7f5az3alscs74F+xzvPjIn
9j90Ouh2fuYdz1hHgU4Afely9X1Ez/sVdH9sF81Qfa7qR6v8P2zc9cRX673Z
IEqq/JjaX1f7iaw1Wes3+yZsT0A3muF6sDkG/gUd+kCVX4qsW39Y+7+o/Xto
356iaRq3rHErogewlWjbmQnrn3ZQ/yw2UW3fJMqp/Kj2fw19jPodj76K55G0
vvLBtG0tf6jv3zXbXB5U/+fU/wj1PTJrG0p71u0621bQEbyMzBWz7uAazSsb
9O58onfoY2wZGmOdxvpFFFO5IWte0jwOvA42XGy561jT0tbRsO6x/i1Sfdus
5Wrk66tV/0z13fVefsl3K2qoMbcWbSPaVtQoab0P+p9J2H90DmfrnM4S7Yit
QOe7ne5nf53aavX7TuWHdf6nafwt09ZPbpvYrP7ZrK98Qde/Wtd/OfOC6E+N
cV/J8vkfBdu4zovb5oHtayrrRbABNUz5GcKLXhb52b6k8X7QeNegWxO9nvK3
i0z7N/IFNmi1j1HbVaKnM5bnkZ9fTvr5YlfCvvSF9k1lradHX/9ZyvZb5iZ0
kNhzb0257YbwPsxS/7zO+0n9PsX8lPJYnG9TlSfofhV1Du+ix1W5lDWfA7+z
UuOtU5+9YuZ5vlG9TvVj4eVFw1UfIHpV5VZqf0blW1LmJTfbDFReDz+G7CAa
qPYxaX9bLdV/lsqz09bd74y8h3yRtm6+mejRtO3ZfHtjYrY/Yh/G1onOFvtz
Vuc7HJ0gMhOyZdpzOzaeg1X+PMjHyMP1kU/StrXWgwfh/VJ7W7VfwDa1v5Wx
jhQ8xbOsRapvpfaT1D5M5Z30zu0s2kW0az3P7/C18LdD4A3SXnvQkR6qcrNg
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
6vd00dll+wsOrHouLWu8Q3KeU48QLdb2o/R7eM62DGwa/VU+VVRffTvpt7Po
n6Kxjvh8zi8Y84huEx3nZJXblezrjM/za6JeKj+Kfy3+ZSrPC768+PTiz4ZP
w8P6HVyzr+/zokexndTsK/oSPsk6Zv2gC5sBll+ULBiL/JzKM0V1BWP9Z6vc
Xb/fqP8g/XZDL6dtG/L2bRmMb7Ooim8gGIqAhQETcze8Vd5Yj1bB1xfMB7ac
tsG/5+Tge4sP7hTOt2DfaXyo52B7pU3UWuf/mNofp7/u+/OiTkEGzeoYaUjH
7KL6jTqPI8suo1NGN7w04HfB8W4QrcVXDF827XeqzmmA6DTR6aL12r5e7ev0
ux0YfpVnFbz/LSqfL1qOP5x+z8sZewIGZbBoiKiNjjlC288RbanyHsjz2t5V
v21L1vU3D7YhdP5HhveF8UaJPlP5C9Ej6I+rbr9Ux+6u366is+sZQwN2ZkSw
NZ0dyticJqjvAGxKOZ/vnaqfXrNv8wOiu1VvVbNv+nSeg/YZKTpPdFI965J2
DvogdEr7iUYWbCvYl+uq5zmfuf5c0Tsaa5HoA9G7ordFC0XvieaLXhe9JVog
eqPmteJl/b5W85rxnH5fEM3lna3ZN3z34PuPj/gr2jZP9KboVdGjopmi2bwT
oumiR0SPix7G5oFvnn576X3oTdyPmm162PKWBdv98GCrHxlsO9cHWwk2Hnyr
8bHGl/q7nG2BtwVb4z3B9jgp2OruCLa7CcE2hA1vluhJ0TOiJ0RPiZ4VPS96
mvMHI6Z7XMROT1/VWwTef51oquo53mtk+JKxJWBMwNI8l7Uv/9PBt351zlgb
MDdgZ1dmbXvIBlvpnjljVeoHbAmYFbB0YOrAsj2dNXYODN0q/a7J21aGzexz
/X6dN5YPTB94EnAlYOHAxIEl/CprLGGjYBsBU4jtChsWttt2xBzQ9ewUeMVf
RUNU30r1K/SNXlm2r2/zmv3HRwcsMJhgbF+lnLGLYBixpeRVbyzaLsyfzK9g
ZxoGLGODYKtpEmxp2GzAXiwI8zHfz9c5zx+TmGfxn0dvWnUsgF9znk+YP25X
e0blE+r5G+Hb6CuaV7U9qqxxK6L6BdsTq8HHqYv6HCY6XHSE6FDRcl3fF6JO
Kt/H+6ffs0RTar7ng8L8wTN5UzQuzK1vqJzDFqc+nVTvLCpgq+McVT5KlMe2
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
c0Q1xPYWHVY1f8X1Hqpyp6ox+thbGrFeiu4t234yqGB/6F1zvl6+f2INN1Xb
2qzXS3jdAwqWfYmHSqxhZOCttM+Wop5qPwk+BR1YkC84JvI58diIjYeOgvg5
5CQgFwE5Gl7WOHOLjg3/L/yfqFi2bLBNxd/yI0Gfxzf9C9+EqEvVPnCsrd+L
Ole9xr5Uss6Z74t7MBveIegH6fO0yk+VLJsyxo+6x5+IPhWtDe8DMUiRx1uH
d/MT+IHAs7dT/emyfaF2Lft9aVG1Pgq9VMvQhza2oQtFB4RuBZ3o5WEOZO47
MGf9Dv5V2EtOCPpo/KGwFxyP3blkmRJZclXZ+mn8N7C/HFczNn6FaP+q9bft
y46fiq7tAm3vpvJRom/g3cL7C48Nf/+3yhvzxnNgHyMWWkuN+bHqvZjTqtYF
7Vi1bg6dUGueSdm+I43KjveCjIlsSQ4Jvk9ySiDvIfeh++L68W/Az4F4d4zB
vujsrmBdDevTO7qmG4uWSZBFsGkwB6BjezDwWNi6iW+MbyU2b/Q9rAe8e9gE
Wa9Zj9B1YzPE9kE8Smyd6IeOKHg+xL7InFxmflL5o6xj9L3KvVa/Q5mrkUtY
e0UrROtFBfV/n32zjg+GbMaczFyM/aUz2+AFRB/nLB/Dr/LtYNPD3vt61n3R
Mc8t2960qWx96WEFz2fIJ/iAwu/Aj6F7B5OE/vJ7bTsKPhqZIbwjq8IzJnYx
/DL6U/SorD8/FC0rxXOea37jPIqec5Bl1osOKlimYe36QzS/6DWMb3ldxbIb
3zQ2mKtz1hciA+wf1izWqr/gucq2D+5dMQYGe+E9Oesr2Tad9zdvXwVsCHzb
rfP2xeMbT6mc4P6rb13RmJThOev/8XfCPpfL2xbCPZtdtn1tn4rfsWfLtj/u
WzGGibltYNC3MMexHjau+d7iZ8v60Uj1t3SPN2Ztr5udsz6aMbFVNQj6pftF
r2m/FSXL42DCsUVhk8I2fmfe9s+3RfuHc2Dugd9HVmYOOqzs60uKljF3FjwH
MveBkSBwHfNhg4JzXIAdA0PWQscYXTB2CMzZJQVjiND33FRx7ELWJLBIYJJ2
rVlGQP8BZm0KMnfR9ppryrYtwkOgC8Mm3aRmnRi6U2RmZOWVgfdFhkJ2ggfG
/oA9572sdQpgh8AQPahtVeQPjlGxrYI5BV0rOtep8G0l25L7BF0mNmV0l+gw
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
4sSagEf4P6dVo04=
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xegz9X/B/BPXO513cu9ViGERIqMEtkZIWSUkRApMitfaXy/stpGKoVK
C1GhQikkqbT3pBChIZT2/D1ev+OP5z3n9Tyvdc7nvM+61YeO6zW2SCaTWXBU
JlNM2TQvk/m6RCbzDZRVL4AN+ZnMelhWkMkcVZjJtC+TybTNyWTKZGUy1xfN
ZKbDKnIbKI2bSv6Ur57FM5kWuJK4SbgPcd1wHXFH427B7cD1w7XC5eMm4z7G
nYNrhyuHuxH3Oe483Jm4srgbcNtw5+La48rjbsJ9geuDa40rhZuC+wTXA7dc
n0rozyh9GAFfleSf3jI6vxmEU+i9YhA66N++UpnMXnhJv9uyGcB+Br036Sky
j9HbmJ3JHGPc+ovTgnwJXx2gAvlmStvp9Y3+8vcNX9/CFv7a8XcR/i46O/kj
ZlazH4a7G7cLRy2zBjdUzivlOks5G7bIeSi9ueGfHjGzit50OrXEaZUrF5jI
6XP0TpXLrXCWPLPkezFuHtuv2Eon8zTbtbhG8XtAR3pF6DXRjwz5crpbVNvS
uRrWk3PgbNwOtqfR+5d8GbyCa0OnJ64b27nQm78f6J2K+4fOOHiZXit6ByO2
PBYo58MYOlfh19HJhi70tuPvN+8Wwpn696ByQWn9Ua8KfeB1g9VBf3Pk3Tn6
ybaZ2Bv5Ko7rhCuKOx23AVeN7gw+fjaeXxuEHD5vNX4n8TXK2F0Ks8i5bLvE
d8H2DLYvsq1L51NtI+nM4ec2OF3eRbVfSW8CPEluBsVwV5Hf0o+z2DbFZeEm
xjzCdcS1xOXhrsN9hOuOGwy3xfdibKSQWWkMBuFm497HqWZW4G5T2YV7gP0F
8ixFeSBuFu7dIul7Xu7Pc8bnWTisr1fo6yB9uJDenPjW6MVP/QS9C3AzcW8X
+f+fPvM4rqHGn3BD4WncKTFXcD+TL4JncA1xtY3JCTCU7y/EWG188/H95HUP
Z33hPHZnQHH1qyMO2050muOycdfg3sF1xg2BO+O7l4uhzjwll8b0/saNhZdw
rekc1udldGZqn8zHYdwL+rkRWsrlZP3erN6A7WF2Q2AN2wb0rodPi6b8Is88
vvr5PcsKWA4m6E8Tcmd+8vUnD0aRi/N3Nq45uQW8Gt+bPvfANyJvobMS9x37
OWLcIV7X+D3F6SrGa3Kti5ulnA2j5XYa2+PZLmI7je2XbE/m8yQ4Rdsj2pZA
b/x5UNOHXx1OV9+B3w7ny+kpZTM2ZflcKuavxqa+WFvEKUO3PCw27/9l+w+U
5bs8m3Jwrdgn8PG7McsmF4dBuOq4C9gNghZszoD+6pP17X98N4nfUt8669uM
WCdx7WOu4s7G3Yq7FdcON0YeW3EF8ptP/lp+1bStxdeXS00xu4h3l7gnKzfR
Leu3uVT7SLiU3Q38TY81JOa5GF3oLIbTY87iTo61lN4C/ubDaD7/MiY9+cuV
dx78pg+/ws34dWwvib2PXTNYT36DzevQjc0B5UFYRXcAZPt9isE/fO/G74IL
6K1TdtTeQLkTBuCeUY6gV0P5OfTHrQi/uMtjT5Jv7pH5EPNivrZ50C7WGWXn
mEsl0t4V+1U3/gdquyj2Rvrli6U1qoSc6+pXncKUw07YAWXoPSTGD8a5thgb
6X8j7jXGbUKMJ9vKbAvpPUjvEL2DMJU8AnrS6QU1cMvovSWnN+EcOfyoPAxN
xDwVvpbrXuiGO02Mx8W7ku1EGMXXFlxbcRuTa/G3gr8e/HQtnWx2GNO5xuX7
2Lfk1YHeNfAVvcb60hC20VsGS6EX26aF6Rs42pw9QzmFbXm2HyiLQhbkQUn4
ECpo+yj2XvZzoS0fH8d+Iu8bi6f9/GNlaSiAwviW4JDxPwB74xwkx6XQl10r
MXvHeYg8UnmrPtwMS/j7nu5+WMn+CeikPRbvdfp+r37dA2NjTVP+BUepP6et
SKyvxdMaF2vdVGP2C3kvH3vgXH5ai/ut+I34bwA3mhvzcBdpu0l5Z17aw2Iv
+0zZg8/O/NwBPfVxjTGtI+cTYAibY+lUgdbkVnAh7qOC1I/qyuOgHP4hMR+E
t8RbRX+cMRkDo+B5OlVivRKzXm5aL2fTWcXH7cq7cV8p99M5CFXl3YifBtCQ
70vE/A+dK+BuNitw7WO9w1fJT/qD9eMzfdgKY/Sjhn7Uh45xDjJWL8ReSOcW
4/U5eaFxfT72UVw9eh1iL8FvpDcA1wq3Encozqy4Qbg3xPkrzlpivxL7mnwe
pvcjvRPjW4VF5JawAncwzphsB+ak81Scq6qQq8a5C/eavr4Kg/Vji3Krcamg
PAYq810xN621DbXvFG86+SH9fxBq06l1xGYRPAyNjdePBenb+ylKGBffr9gP
wavin6n/m/Gb4AF6Lyg3whdyHkunbbG0L31OriDeM9rWRk7i94RJ7N8vmuZp
zNei/F+LexlXHvqz/U7bH7g2cQaOb1p/HyP/Je/NpdP8bM1nKxgtzmHtNYqm
tXYUuXXM1YK0Bs8z3jcZ97fEHsa+h5zeVH8j5g3+d33+A941uAvId7OvKWZ1
yJffPPKI+I3EqCTGYDGGky+Dn3B14tyAG0e+Rqxn+V3Bz3Y+P4fa4r2N66Xs
DRfLYSa9jbjnlOvgIL1h2en7uZ3PTnCOcambdWRuZKW1M9bQxvr2OB+jlbP5
21WY1odlcf9QzshNa8WF7Pey2wPt+DiJ/5NxX8u3NwwTq3z0NTvN9276Oyni
GeeT6O2j0yvOYtrK0TmF7wfEuFR5Hf87xP0GNuEmG7uv1ffBWtimP0uMwTPq
T8NCPv+MsYv7nFxaxNmFj93aNipfgOUxL/El4vujtznONrFWij1YDovwl8R5
Lyf9ljXKpO8pvqHjYy3yW7cpldaVR6BmYdp7HuBrq3HbBmvIc4z3C9qej98A
Dsn1SjF+5rtBnLPFnZCd7qGFWencHefvn8knxPfL9kw2baA1PAAV5DJY20Uw
BO7FlY+zjfqFMAjKkPsqxygLoTTMi3uisj9+IAyAO+PshCuA88n9oE7sQWET
dzztbWES5OI64rpAJ7gs5qOxGhdzSM6di6Y7RJEYO/Xh8F2cc9jmxf7Ipgd0
h/nG+lvt3WCuMahNnkqvJL3O2rvB2VHGXZS/22KOirU71kHj/71x+U65H941
/vfSPVZZBfYcufNeHOd0+r2z0tlrg3EuTf81ts2UZ8B59L/yu7yMKyAXwmm4
odkp3my27eO8y9ez9F6ktyf2TyhNb7U4p8u7KYwpnc5o/9OX9/TrvZy0H8a+
OBX3QdyN4j4V97m4F8i5Ih+VYFecwWK/EjdL3FZitowzIf2+5lo9OvVjLylI
+/C0OAfEvSfuHOo5sEFOmwvTW0e8eRTC/bGO0bsQVhvnluQqsTeQq0I1eIP8
Dd2f4uyj/3thD3wol0Fyr1MsrQsr485E79i4Ryh3i/clrFd/AR5lszTODHB6
mfSNxre6Q9uP6g2ULyl3sdkJO+AN3H7cejbPwdq4b4h7n+/nOnHbxdlbft8a
3+fp3crmZrgR1sY5DfcIm8Wxt8V8oFdJ7OnGdgadW+BD3Bp6E9THw+XwCW4r
XKV+JfwHXo07tpgdi6Vz24H4HemsZnuF9stgLAyXz9lxXi2W9tymcb4yjgXQ
VL5/xz0g1mn5vRN3L3mdCo1z03fZCorAHXzPgenidhNvJtvmcf/gf2Fe2kdj
75yam9bBpXlpPY41eFZuWn/fz077Ro3YQ+I7ZHtPzBVt9ymvpTcifi96A8S4
P84G0IfeZdqP19Y77v4x7yFXfRP/z+jnGlgFReOOCE/4LQfLd2B8z/Qq475X
X0vn6RJpfT4t7s3Kx/haBncam6+MRRu40bhUJe9gs47OVDaTYRIsKZHW71jH
F+enu11P9h/FHFJOCYj5rrYi6kXhp1LpLSDeT6pELur7S6W3lF50j1M2VpaK
M1yc5cj35qXxuIq8je+msX4oL1EOh/Ha3xSjGp0f+DoEB+FDOrXLpL089vTu
MAgGwi0wM8q8pDdZOYn8gfr78Ba5CdvH4g0Svw6GwMfabov3l9hD46wAr+Ly
ySXjt4Bn4z7ot61o/AbFvIo5ij8rcoUrYRK7bbGusl1ubXi0IL1xzs9LfY5+
Toz+lUn7ZcWYS8qrjfFE2O33WE++Xn0aTIFH2Z5Kbyzcnpv2/330NtC7SfsN
MB2GxHtYzPmsdE9qLr+S0NdcWxDzDM6lUxE2HflG4lvZlJPOyQvyUl4TctOZ
eUi8KUIt9ZpQHYbF2QN3sfJi8ieFaW+JPeZ/Welb/TXej8yto8gXq6+XSwfy
f+EVcgU4H7ffWH7HV1O+3lZ+w98+uIPebjqt4YY495IrZad75R98joYv4k5m
DH4Xv4OyIxTGGh5nOlxnZRcog6ui/BPXTdk99ljccfr8Lv+NYKIYf8ilGu4d
csPY93G/46rGmYNcH67A/Yw7Os7k5BLQFfch7vt4k/DtX6FeEG+s8Yap/CfW
gpy0B83NSev9m+r14k0B7oyzvJyekt9ov+FIGAEz4wzN9uGsdAaaRS5P9wk2
/4rTUty3tR/ELyLfqD6F7vl0jspOb667yLVjLhirf6EDbie5JjxKHiZuMWM/
X7kAmuenu23ccWvkpD1yXk5ac5rlpzUy1sqjoHLcvbXXgpFyOSD+hdqztM1V
3hVvOmxGKIvH+qdcCC1w63zDJZS5cW6Ks3n0XVt2rLHKh6CltgpiPBkP49BK
8ZYY7bX9XZje3+Id7iRYnp3u/o2058E08lL8PXEu5HNRibSGHcPfBr6OhgH8
fUn32Bh/ct14R8b9iBun/0vIe/isgnsp3hpw98edDHc07nncCNy9cbbAlcOt
i/ck3MI4W+Aq4DbEewjuPtwHuPK49XFHxy3G7cYdi9uM+1Lew/1Gj8V7brwf
ym00vYfp7aBXid6meEvCNdE+Iyu9Q8d79BjcInpf0qtM78V454h3S1zpOPfj
9uKG4+6JN1F6ZXHP4X6Fc/m5K8510Cv+D8PnENwS8kj4nN1l8AjbfWyrsn05
3mFwa3D/4Frg3seVcO6qGe+kvuW6MNK3/Yrf7WVYEWuy32ZKflqHXjxy7onz
zxzy63E3LZXeDd5Vfwcq4TdrPy7uJGLsE+PR7PR+1FC9hfxelkdXMQ+zm8Z+
Cnwc6xh+Jbtf6NZj+2a8VUEPfZsTd2nozn93tmfJewa7W2BrrOdsV7P9m21z
tu+xG49bEXcC3Mm4N3Az89Ibfrzbj8hNa2NZ+Q0V4xH+x8J2dp3ifVR+1yr/
C/WMQVflv7jrlJOhftydlM/GWmXOdoUu8CR5Uax16u2gbfwPB/dw3EnU20Cr
2AfE+STeHXLS+1S8U82G7bhmMFnOFWPewg/kPrAIV4+8ir/F/HXipyO0j3NH
3OdwZ6t3hrPizUoff8FV0lYZDup3a3m30O8TlRNw4+MdlM+t8d4e/19TLwe1
4n2J3vW56U063qZvwn9Gb1vcu9TLxH1E289iVODnaDgQZwe+m7Hdr14u1nbY
XDLNrZhPg+R2ASxg/x1/3eEufasT53E6j/HXV/t50DveP2Otifcp9ZbQHK6J
OyFMhLPif0CwKHIQd6j6JTAM7uPzR/77wmIx6pPryH8H+QxoDtvJG9k+Lsb5
fPeDPiXS2W1lqfT2VC0/nePWwaP0ztXeC3rAb9lp3Yv1b6559js5j/5v9MrG
fgcFsAmW4wayGQD946yNy5fzOfR7Q0+YJccv4lwM13F7DPlyeWTHNxlv2fH+
CRXj3SPecGONM3e3xf+U4l0Sthr7T/PS/yjq69/38W4Dj8RbBb16uP3kfrAE
Vxd3Cu5A7PmwFHd9vJfEeU7cdvycGfc0cjf8R7E3ZaV1sDv5RLZ72J0Dd7M9
jr+68b5B7hH7Ey4nJ71TxHvF0vj/Iuyk1yP+kWkMpsW5Hk6JPUWsOnEfj/sm
3KAv/eN/hGzGF0t7+C6+fpXbIW1V2VWDQQVpbfkhvkE+2pdO68z4OJPi2pLb
wJXkq+B3tn9An9LpTbfgyPtvrZw01+/LSfM85vsJOek7WaisDdvU28JN0q9w
ZF7tPHKnj7v9w+Qm+tI05rzcLoAB0T9x9sR9Qdw1cWch58a7Chyfk9aFe5R/
xh2H79wY03gnzk534LgL18xJd9n5ypEwSvv5WekN+0V61WMOiDEvL/0/Jf6v
coD8nvpB43kozm/xfs32vKx07ozzZxG+/w9ByhSa
                   
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwl0kkrRWEYB/CXe03XNRRZGnZSZC2XD8DKEis7FoYdC/PsA/AJUNaUPbKR
ZLhm95JIyVZS+J0snvN7nlOn/9P7nrq+oa7BnBDCvCrODSHqvzxeuZUXQjl3
WcNDNvGYKZ6zk4/s4QcH+MNfNaavyg9hibVcYwM32MwdtnOfn2yR22OHM3MR
h83jMTnmCV5wkmlO8ZLTvOIMrznLG85xXt3qF3jHRd5ziQ9cZoYrzEZnEA+h
VWav7EdzgiPmbrudmju5xxS32cR11nOV1VxkJSvUqP7bOfTznd3MsIOnbOUR
G3nAam767o1J2WWMs80OLyw1P7OET0wyy2I+MME7FvGaV6pQn2ZBdF/Mj7Ip
LpwwHt0nY9EuzI3Oy8tUzv//8AfZREZK
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3lEUB+B/GpkkvVkUxRtFY7FRFEWKolgqGotNxUbZu1Qai6JSbCyK
YlEURVFsLIpGURQbRVEURbJYFI1FPfTh8Tvn3uucLzdcH6l6FxUEQR/vQ0EQ
oY1WPtBBJx/ppoteehign6LEIPgsPzHIF4YZYpQRxvjKHruc84cb/vPQjAO5
T4m6mDJKqaCcSp5TQzUvqKWdOl7ymlc00sBb3tBMExEm7BjnikseOIsmjlP9
b36xxSYbrLPGKj9ZodD7AlpZ1i+xyA++840F5pljlhmmOeKQC/4SmHErY+WJ
PCZfnUcuOTzjKdk84TFZtJBJBumESSOVFJJJ4hEhEohnyo5JdtjmH9fEuDsL
3f+HO/lOTco=
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3WEUB+B/UTJJKjaKlWJRFBsbRRmLoig2iqLLYqNbXXUpiuLGxqKx
KIqisVgURVEURbEoGouiKIli0Sg2e+jD45zf+77O+fLmhNrqwnFBEMSIpAVB
BxckpQfBnXrLT/b5yjSp7jJI5xEPySKTbB6TRy75PCFCIQUUU8QznvKC55RS
wpkdpyTr44njWv7NCcfM8I1ZvjPPHIsssMwSq6zQaUY5ZazLa2yywTZb7PCD
PXY5J8X7RBL4I98wxSTtzsK08p53tPCWEM000UiUBup5w2vqqKWGaqqopIJX
HNlxyAP9P/UvV1xywC8mGGeMUUb4wmeGGeITL834qH5gkBgD9NNHLz10E6Ur
7f4//AcCP03J
                 "]], 
                Line[CompressedData["
1:eJwl0jtrk2EYgOGno9acHES0QwWXzEoxElEsrUlaG80BNRoNSZrNSKfSWiqW
6iRO/gnbgrtLMBJKaBE3f4A42Y4ODoKXOFzc73fgfT5evgvtZ5X+RES8In8i
4hrXucFNZpljngJFFlhkiTJnT0fc1Qo16tzjPg0e0uQxLxMRWxwmIw5YSEeU
aHn22v1tztnveDLivCZORUzpJZ3Wql7UFc3qG+3rZXatZ/SLXtEjzWnKnlc1
q3l9b+8dNlIRz+mZv8zI9+yz7L0ebTo8ocUjmjygQdpeGZ5Sc12nQpUyd1jk
NkVKzHOLVfM/mbVu/hpd8zvMejZ0/zN/Ms7ee7/1jP7SnyedjQ70u77Trvnf
rHvWXzWnY03rSH8426F+1IG+1Q/a0T37vjBz8983ml9gw3qc/P8//AWvL0Ht

                 "]]}, {
                
                Line[{1450, 1702, 907, 1449, 2160, 1627, 1451, 2161, 1628, 
                 1452, 2162, 1629, 1453, 2163, 1630, 1454, 2164, 1631, 1455, 
                 2165, 1632, 1456, 2166, 915, 1457, 2167, 1633, 1458, 2168, 
                 1634, 1459, 2169, 1635, 1460, 2170, 1636, 1461, 2171, 1637, 
                 1462, 2119, 2172, 1638, 1703}], 
                
                Line[{1464, 2064, 2228, 1463, 922, 1465, 2173, 1639, 1466, 
                 2174, 1640, 1467, 2175, 1641, 1468, 2176, 1642, 1469, 2177, 
                 1643, 1470, 2178, 2065, 2229, 1471, 2066, 2230, 1472, 2179, 
                 1644, 1473, 2180, 1645, 1474, 2181, 1646, 1475, 2182, 1647, 
                 1476, 2183, 1648, 1477}], 
                
                Line[{1479, 2067, 2231, 1478, 2068, 2232, 1480, 2024, 2025, 
                 938, 2032, 2033, 1704, 1705, 2337, 1943, 1944, 1942, 2002, 
                 2120, 2184, 1785, 1946, 1947, 1945, 2003, 2350, 1707, 1786, 
                 1949, 1950, 1948, 1371, 1709, 1787, 1952, 1953, 1951, 2338, 
                 2004, 1711, 1788, 1955, 1956, 2339, 1954, 2005, 1713, 1789, 
                 1958, 2300, 2148, 1957, 2006, 1715, 1790, 1326, 1960, 1959, 
                 1921, 1922, 2331, 1649, 1481, 2156, 2185, 2038, 1650, 1482, 
                 2186, 1651, 1483, 2187, 1652, 1484}], 
                Line[CompressedData["
1:eJwVz0tKAmAUhuEjZeYC1CYNGiXd1tDFsqE4Cy1CJ41yVC2gSZBNagc2KjIk
KkgIWoDaZR3tIEwfBy/fe873c+BfqDXKx4mIKGGQjMjMRryhz7Oyi0/+MhNx
l4o4Mv+jx1/t9mRL5uX7dMS6XEQF2XTEvW6EDfMmllBFTvdgn+BbKGAZh27P
6R51U+Zt7GAFv+537JO8iD9vK1jl+3jSpeQuhvZVrPEDPOvSsj55736fX+LD
vikHuOU3ct5/r+XFxL09l22c6L90TTdO+Te/4mf8h48BLnUpTA==
                 "]], 
                
                Line[{1492, 2071, 2235, 1491, 2040, 2041, 2356, 1493, 2042, 
                 1732, 1962, 1733, 2340, 2026, 1963, 1964, 1887, 1734, 1833, 
                 2236, 2122, 1888, 1494, 1072, 1792, 1719, 1495, 2303, 1720, 
                 1794, 1721, 1496, 2304, 1722, 1796, 1723, 1497, 2306, 1724, 
                 1798, 1725, 2305, 1498, 1726, 1800, 1727, 2307, 1499, 1729, 
                 1802, 1730, 2308, 1500, 1940, 1731, 1941, 2336, 2121, 1924, 
                 1968, 1967, 2309, 1735, 1966, 1736, 1501, 2190, 1656, 1502, 
                 2191, 1657, 1503}], 
                
                Line[{1505, 2072, 2237, 1504, 2043, 2044, 2357, 1506, 2045, 
                 1737, 1969, 2238, 2123, 2027, 1970, 1971, 1889, 1738, 1839, 
                 2239, 2124, 1890, 1507, 2125, 2240, 1739, 1508, 959, 1509, 
                 2192, 1658, 1510, 2193, 2073, 2241, 1511, 2074, 2242, 1512, 
                 1740, 2243, 2126, 1513, 1891, 1741, 1840, 2244, 2127, 1892, 
                 1974, 1973, 2128, 2341, 1972, 1742, 1514, 2194, 1659, 1515, 
                 2195, 1660, 1516}], 
                
                Line[{1518, 2075, 2245, 1517, 2046, 2246, 2157, 1519, 2047, 
                 2048, 1975, 2247, 1977, 1976, 1520, 1893, 1894, 1841, 2248, 
                 1896, 1895, 1521, 2129, 2249, 1743, 1522, 2076, 2250, 1523, 
                 970, 1524, 2196, 2077, 2251, 1525, 2078, 2252, 1526, 1744, 
                 2253, 2130, 1527, 1897, 1898, 1842, 2254, 1900, 1899, 1528, 
                 1979, 1980, 2342, 1978, 1745, 1529, 2079, 2255, 1530, 2080, 
                 2256, 1531}], 
                
                Line[{1535, 2197, 1661, 1533, 2050, 2198, 1662, 2051, 1746, 
                 1985, 2153, 2345, 1663, 2007, 1905, 1906, 1845, 2321, 1865, 
                 1664, 1803, 2132, 2199, 1665, 1540, 2200, 1666, 1542, 2201, 
                 1667, 1544, 2202, 982, 1546, 2203, 1668, 1548, 1749, 2204, 
                 1669, 1804, 1911, 1912, 1846, 2322, 1866, 1670, 2009, 2008, 
                 2351, 2154, 1986, 1671, 1552, 2205, 1672, 1554, 2206, 1673, 
                 1556}], 
                
                Line[{1555, 2268, 2086, 1553, 2267, 2085, 1551, 1750, 1983, 
                 2150, 2344, 1984, 1550, 1909, 1910, 2266, 1844, 1908, 1907, 
                 1549, 2133, 2265, 1748, 1547, 2264, 2084, 1545, 2263, 981, 
                 1543, 2262, 2083, 1541, 2261, 2082, 1539, 1747, 2260, 2131, 
                 1538, 1903, 1904, 2259, 1843, 1902, 1901, 1537, 1982, 2343, 
                 2149, 1981, 2053, 2052, 1536, 2158, 2258, 2049, 1532, 2257, 
                 2081, 1534}], 
                
                Line[{1558, 2087, 2269, 1557, 2054, 2207, 1674, 2055, 1751, 
                 1987, 2352, 2010, 1675, 2011, 1913, 1914, 1847, 2323, 1867, 
                 1676, 1805, 2134, 2208, 1677, 1559, 2209, 1678, 1560, 2210, 
                 1679, 1561, 2211, 2088, 2270, 1562, 993, 1563, 1752, 2212, 
                 1680, 1806, 1915, 1916, 1848, 2324, 1868, 1681, 2014, 2012, 
                 2013, 2213, 1988, 1682, 1564, 2214, 1683, 1565, 2215, 1684, 
                 1566}], 
                
                Line[{1568, 2089, 2271, 1567, 2056, 2090, 2358, 2057, 1753, 
                 2015, 1391, 2028, 2016, 1807, 1935, 1754, 1999, 2334, 1933, 
                 1934, 1808, 2135, 2216, 1809, 1685, 1569, 2310, 1756, 1810, 
                 1686, 1570, 2311, 1758, 1811, 1687, 1571, 2313, 1760, 1812, 
                 2091, 2312, 1572, 1762, 1813, 2092, 2315, 1573, 1764, 1815, 
                 1001, 1814, 1919, 1765, 1849, 2325, 1869, 1870, 1816, 2017, 
                 2136, 2217, 1994, 1688, 1574, 2218, 1689, 1575, 2219, 1690, 
                 1576}], 
                Line[CompressedData["
1:eJwV0E1KwlEUhvETmH2QC1CkLGxQag2cZeUSLLMPgoxaQK6gaFLgrMbZzGa2
kiY2ligJagHSvN9/8PA+97zncuEuX3aaV1MR0cB6OqIyG/GFNb4hxyjxu5mI
TZ6fi7jnb+ibd2V2OmIoH/Br9ijfsWR35JzlDexhC9fJHd2HLsf30UQNF97I
6T51eecDtLCNlHfG5ov8EPP2zuzv8Bt86wryCAu6tm6X3+JHtyLPzTK6Y17H
KV50q3KUijiRRfyham+im/AnWcbA/V7yT3jlz8k/4R/vcCTJ
                 "]], 
                Line[CompressedData["
1:eJwVzTlOglEUhuFDgUoDCzDGEBMLIGFwwAGWQEMHJQ2FCayCmLgI3QGuwmkb
TI6AEhNbn7/48r73O/fek+8N24NURLSksiU7ERMp8ypOpcprOJMav96OuJG5
c0+W/Eg/wU5yPxOx4W+6BzzGKWb173yXf+AjnuCVNzmzT76n+8InPE326md8
yfdxhc9Y0Nf5nK8xj99Y1Pf9d8YXuh88wA2WzF74OX/FXzzEhftdWfML3R+O
0ubJPrnUjc1vsSH3/A6b8g9srC4s
                 "]], 
                
                Line[{1599, 2099, 2279, 1598, 2100, 2280, 1600, 2101, 2281, 
                 1601, 2102, 2282, 1602, 2159, 2359, 2059, 2058, 2061, 1603, 
                 2063, 1444, 2062, 2060, 1604, 2224, 1696, 1605, 2225, 2103, 
                 2283, 1606, 2104, 2284, 1607, 2105, 2285, 1608, 2106, 2286, 
                 1609, 2107, 2287, 1610, 1032, 1611, 2226, 1697, 1612}], 
                
                Line[{1626, 1784, 1155, 1625, 2298, 2118, 1624, 2297, 2117, 
                 1623, 2296, 2116, 1622, 2295, 2115, 1621, 2294, 2114, 1620, 
                 2293, 2113, 2227, 1619, 1040, 1618, 2292, 2112, 1617, 2291, 
                 2111, 1616, 2290, 2110, 1615, 2289, 2109, 1614, 2288, 2108, 
                 1613, 2320, 1782, 1781, 1783}], 
                
                Line[{2986, 2984, 3432, 3431, 2983, 2980, 4631, 2979, 2976, 
                 4630, 2975, 2972, 4629, 2971, 2968, 4628, 2967, 2964, 4627, 
                 4670, 4626, 3415, 3414, 2958, 4622, 2957, 2954, 4621, 2953, 
                 2950, 4620, 2949, 2946, 4619, 2945, 2942, 4618, 2941, 2938, 
                 2934, 2937, 3775, 3776, 3778}], 
                
                Line[{2988, 2987, 2362, 2360, 2990, 2989, 4514, 2992, 2991, 
                 4515, 2994, 2993, 4516, 2996, 2995, 4517, 2998, 2997, 4518, 
                 3000, 2999, 3001, 3002, 4519, 4521, 3004, 3003, 4522, 3006, 
                 3005, 4523, 3008, 3007, 4524, 3010, 3009, 4525, 3012, 3011, 
                 3014, 3013, 3461, 3459, 3462}], 
                
                Line[{4527, 2402, 2405, 4528, 2406, 4529, 3020, 3017, 4530, 
                 3024, 3021, 4531, 3027, 3025, 4532, 3030, 3028, 4533, 3033, 
                 3031, 3034, 3035, 4536, 4633, 4537, 2426, 2429, 4538, 3042, 
                 3039, 4539, 3046, 3043, 4540, 3049, 3047, 4541, 3051, 3050, 
                 4542, 3054, 3052, 4634}], 
                
                Line[{4543, 2445, 2448, 4544, 2449, 2452, 3059, 3058, 4427, 
                 4425, 4448, 3060, 3062, 3463, 3465, 4671, 4232, 4234, 4362, 
                 4364, 4365, 3471, 3472, 4238, 4239, 4366, 3067, 3065, 3479, 
                 3480, 4242, 4243, 3068, 4369, 3487, 3488, 4245, 4246, 4372, 
                 4370, 4373, 3495, 3496, 4251, 4250, 4248, 3072, 3074, 3503, 
                 3504, 4256, 4254, 4255, 3075, 3077, 3509, 3510, 4260, 3080, 
                 3078, 4177, 4176, 2479, 2477, 3081, 4460, 4457, 2482, 2480, 
                 3083, 3082, 4545, 3086, 3084, 4635}], 
                Line[CompressedData["
1:eJwV0M8rg3EcwPHPksPkx2hENE0i2pqt/SHLxd1FmkhxlMMOVhwoE8WJIye7
bM2PcLaTdpG/ZS+HV9/P8/48fet5spt767uJiKjwMR7RSkZ0+DS/ON+ZHI5I
0xnRCLtX5xtT+jRV8w5HYxHHJFIRs/oMl3qDE73OoF1Gn+NWv+NUP2NeyzLk
nXv9gXP9ggV9VH/UnvjRGlyxaLfEs96kp11zw7K+Qktvs++OAd/wbe6Ss1vl
QD+kxhbbFPQ8G+Y//+KXouc1vtxRdpb+v2Uiog//6yk8
                 "]], 
                
                Line[{4549, 2532, 2535, 3127, 3128, 2536, 2538, 4472, 4471, 
                 3548, 3547, 4430, 4431, 2539, 2541, 3835, 3834, 3553, 3552, 
                 4116, 4115, 4113, 3560, 3520, 3812, 2545, 2547, 3138, 4677, 
                 3815, 2548, 2550, 3140, 4678, 3817, 2551, 2553, 3142, 4679, 
                 4638, 4637, 2557, 2554, 3144, 3532, 4639, 2561, 2558, 3146, 
                 3536, 2562, 2564, 3563, 3562, 4229, 4230, 4188, 4187, 4275, 
                 3840, 3839, 4274, 3565, 3564, 2568, 2569, 3153, 3152, 4552, 
                 3156, 3154, 4640}], 
                
                Line[{4553, 2575, 2578, 3159, 3160, 2579, 2581, 4479, 4478, 
                 3568, 3567, 4281, 4279, 2582, 2584, 3844, 3843, 3573, 3572, 
                 4121, 4120, 4118, 3847, 3577, 3578, 2588, 2590, 2591, 4554, 
                 3170, 3169, 3171, 3172, 4557, 4642, 4558, 2599, 2601, 3175, 
                 3176, 3580, 4643, 3849, 3848, 3585, 3584, 4126, 4125, 4286, 
                 3854, 3853, 4681, 3591, 3589, 2608, 2610, 3183, 3182, 4559, 
                 3186, 3184, 4644}], 
                
                Line[{4560, 2616, 2619, 3189, 3190, 4481, 4645, 4484, 4485, 
                 3593, 3594, 4293, 4291, 4289, 4290, 4127, 3598, 3599, 4131, 
                 4129, 4128, 3861, 3603, 3605, 2629, 2631, 2632, 2634, 4561, 
                 2635, 3199, 3200, 4564, 4647, 4565, 2641, 2644, 3203, 3204, 
                 3607, 4648, 3862, 3863, 3611, 3612, 4137, 4135, 4133, 4134, 
                 4297, 4296, 3618, 3616, 2651, 2653, 2654, 2656, 4566, 2657, 
                 2660, 4649}], 
                
                Line[{4567, 2661, 2664, 3216, 3217, 4487, 4651, 4491, 4492, 
                 3620, 3621, 4298, 4300, 4301, 4302, 4138, 3625, 3626, 4142, 
                 4140, 4139, 3875, 3630, 3632, 2674, 2676, 2677, 2679, 4571, 
                 2680, 2683, 3229, 2684, 4656, 4575, 2687, 2690, 3233, 3234, 
                 3636, 4658, 3877, 3878, 3641, 3642, 4149, 4147, 4145, 4146, 
                 4307, 4308, 3646, 3647, 2697, 2699, 2700, 2702, 4578, 2703, 
                 2706, 4718}], 
                
                Line[{4579, 2707, 2710, 3248, 3247, 4497, 4495, 3251, 3249, 
                 3652, 3654, 4390, 4391, 4151, 4021, 4019, 3657, 3659, 4064, 
                 3888, 3887, 4581, 3663, 2722, 2720, 3259, 3256, 4582, 3263, 
                 3260, 3264, 3265, 4585, 4661, 4586, 2732, 3269, 3268, 3667, 
                 3664, 3890, 4025, 4024, 3670, 3672, 4066, 4067, 4393, 4392, 
                 4394, 4396, 3676, 2743, 2741, 3276, 3275, 4588, 3279, 3277, 
                 4662}], 
                
                Line[{4589, 2750, 2753, 3282, 3281, 4590, 4500, 3285, 3283, 
                 3680, 3681, 4434, 3896, 3897, 3286, 3287, 4217, 4356, 4683, 
                 3899, 3901, 3902, 3903, 3689, 2765, 2763, 3292, 4591, 3699, 
                 2768, 2766, 3294, 4592, 3706, 2771, 2769, 3296, 4593, 4595, 
                 4684, 2775, 2772, 3297, 3911, 4686, 2779, 2776, 3298, 3914, 
                 3727, 3913, 3299, 3301, 3732, 3734, 4688, 3916, 3918, 4406, 
                 4404, 4405, 3742, 2788, 2786, 3306, 3305, 4596, 3309, 3307, 
                 4664}], 
                Line[CompressedData["
1:eJwVzs0qhGEYx+H/hDHMJ2fgMJSFcgDKCZCFpWkUGQtW7Niz4TwsiKJ8noca
zagZI8I1i6vnvX/3+9Qzt95c2SwkWaY/k7xNJx0Gvt+dvZFK0uVTW2skq3yY
+2xXkx2Kdue15IKhPqCkTdLStriqJ9csuP9t/8Wu3uZGv+VH+2XRP/v6AXf6
PX/6kn6oHdHRHnik4A1jHOsn9LQnnhnXJzjVz+hrL7xS1Eu02aOptdjw7rJ5
ikt36uWkOmKuMLRvOGvMzyb/JZcySA==
                 "]], 
                Line[CompressedData["
1:eJwVz18rg2EYwOHbsaYR2mrKSrZMOVhhakrt1Mlkli2LD8DXopkizvgy/kw2
0ZSyceDawdV9v7/nfd96sidn1dOJiNhlOB0xNxmRYmRPmxl+7QvmIrOJiHmO
kxE1fZ89SmxSnXFmPjvPeX+JJ/sjZf1iKuKcgp6nq7+w4+xSb7Omr/Kqv1Fx
dqV3+PT8zgd9etzo13zb131X5Ms+4E6/ZUMrje+lDfnhQb+n5f9HNGlwSJ0D
yr7ZJufOy/xpK2aeLXf9B7peLO0=
                 "]], 
                
                Line[{4605, 2884, 2887, 4606, 2888, 2891, 4607, 2892, 2895, 
                 4608, 2896, 2899, 3376, 3378, 4503, 4510, 2903, 2900, 4509, 
                 4508, 4507, 4506, 2904, 2906, 3383, 3382, 3384, 3385, 4611, 
                 4667, 4612, 2912, 2915, 4613, 2916, 2919, 4614, 2920, 2923, 
                 4615, 2924, 2927, 4616, 2928, 4617, 3393, 3391, 4668}], 
                
                Line[{4660, 3242, 3244, 4659, 3240, 3241, 4714, 3649, 3648, 
                 4313, 4315, 4385, 4386, 4063, 4062, 3645, 3643, 4015, 4016, 
                 3876, 3637, 3640, 4576, 4657, 3230, 3232, 4655, 4572, 4574, 
                 4654, 3227, 3228, 4653, 3225, 3226, 4710, 3633, 3635, 4570, 
                 3873, 3874, 4060, 3629, 3627, 4010, 4012, 4143, 4383, 4384, 
                 3622, 3624, 3218, 3220, 4488, 4490, 4568, 4650, 3213, 3215, 
                 4708}]}, {
                
                Line[{716, 908, 2160, 717, 922, 745, 2232, 937, 760, 2234, 
                 945, 768, 1429, 2356, 1430, 951, 778, 1431, 2357, 1432, 958, 
                 792, 2246, 1433, 1434, 968, 806, 2258, 1435, 1436, 978, 2198,
                  820, 1437, 1438, 988, 2207, 834, 1439, 1440, 2358, 998, 848,
                  2273, 1005, 857, 2275, 1012, 866, 2280, 1022, 879, 2288, 
                 1035, 894}], 
                
                Line[{718, 909, 2161, 719, 923, 2173, 746, 1404, 1418, 938, 
                 761, 1405, 1070, 1071, 2302, 1361, 1362, 769, 1329, 1084, 
                 2340, 1406, 1376, 1377, 779, 1332, 2238, 1091, 1407, 1379, 
                 1380, 793, 1335, 2247, 1099, 1408, 1382, 1383, 807, 2343, 
                 1338, 1107, 1409, 1385, 1386, 2345, 821, 1341, 1115, 1410, 
                 1388, 2352, 1389, 835, 1344, 1123, 1411, 1391, 1392, 1428, 
                 1427, 1294, 1295, 2332, 1006, 858, 2276, 1013, 867, 2281, 
                 1023, 880, 2289, 1036, 895}], 
                Line[CompressedData["
1:eJwVzrFKglEchvF/VlBQUARmDsVHBV2BW02OLom21BTORV5ANDTX0hKEizfg
BZRiUFSQpM6NLTUYEuLYz+HheTnPd/hOcnxaPJmKiCI+UhFX0xHVuYiufWef
2z/2xkxEMhuxiWQ+You38ek8gwYe0ETKvQHfu7vLe2jjEQvaL7e0PF/jCc/I
akN+0Qp8g1e8YUf7475W4lu8Y9lbOpzTR3yEGrpY0Xqc18ZcQR1p717XSryK
fT3DZWT1A16bbBxql/zlv0tcxchZBd/Owvdnk3fbi/aF/Q+BaCtA
                 "]], 
                
                Line[{722, 911, 2163, 723, 925, 2175, 748, 1056, 1314, 1057, 
                 2184, 1368, 1159, 1247, 1058, 1201, 2326, 1059, 1248, 1161, 
                 1072, 1087, 1073, 781, 2240, 1093, 1168, 1094, 795, 2249, 
                 1101, 1173, 1102, 809, 2260, 1109, 1178, 1110, 2199, 823, 
                 1117, 1183, 1118, 2208, 837, 1125, 1188, 1126, 2216, 1189, 
                 1308, 1127, 1367, 2335, 1128, 1307, 1196, 1396, 1419, 2353, 
                 1144, 1395, 1145, 1443, 2359, 1441, 1442, 882, 2291, 1038, 
                 897}], 
                
                Line[{724, 912, 2164, 725, 926, 2176, 749, 1060, 1318, 2350, 
                 1061, 1369, 1160, 1249, 1062, 1202, 2327, 1063, 1250, 1162, 
                 1074, 2303, 1075, 782, 959, 796, 2250, 969, 810, 2261, 979, 
                 2200, 824, 989, 2209, 838, 1129, 2310, 1130, 1190, 1273, 
                 1131, 1207, 2329, 1132, 1274, 1197, 1397, 1146, 2318, 1347, 
                 1147, 1447, 1448, 1444, 1446, 1445, 883, 2292, 1039, 898}], 
                
                Line[{726, 913, 2165, 727, 927, 2177, 750, 1064, 1319, 1371, 
                 1370, 1372, 1251, 1252, 1203, 2328, 1254, 1253, 1163, 1076, 
                 2304, 1077, 783, 960, 2192, 797, 970, 811, 2262, 980, 2201, 
                 825, 990, 2210, 839, 1133, 2311, 1134, 1191, 1275, 1276, 
                 1208, 2330, 1278, 1277, 1400, 1398, 1399, 2319, 1348, 1148, 
                 869, 1025, 2224, 884, 1040, 899}], 
                
                Line[{728, 914, 2166, 730, 928, 2178, 751, 1065, 1320, 1374, 
                 2338, 1373, 1375, 1255, 1256, 1204, 1260, 1259, 1164, 1078, 
                 2306, 1080, 784, 961, 2193, 798, 971, 2196, 812, 981, 2202, 
                 826, 991, 2211, 840, 1135, 2313, 1137, 1192, 1279, 1280, 
                 1209, 1284, 1283, 1403, 1401, 2354, 1402, 1349, 1149, 870, 
                 1026, 2225, 885, 1041, 2227, 900}], 
                
                Line[{732, 916, 2167, 733, 2230, 930, 753, 1067, 1323, 2300, 
                 1324, 940, 763, 1261, 1262, 1206, 2301, 1216, 947, 772, 1081,
                  2307, 953, 786, 2242, 963, 800, 2252, 973, 814, 2264, 983, 
                 2203, 828, 993, 842, 1138, 2315, 1000, 851, 1285, 1286, 1211,
                  2316, 1240, 1008, 861, 1354, 1355, 2347, 1353, 1016, 872, 
                 2284, 1028, 887, 2294, 1043, 902}], 
                
                Line[{734, 917, 2168, 735, 931, 2179, 754, 1068, 1325, 1326, 
                 1327, 1328, 1289, 1069, 1363, 2349, 1300, 1301, 773, 1082, 
                 2308, 1088, 954, 787, 2243, 1095, 1169, 964, 801, 2253, 1103,
                  1174, 974, 815, 2265, 1111, 1179, 984, 2204, 829, 1119, 
                 1184, 994, 2212, 843, 1139, 1193, 1001, 852, 1288, 1141, 
                 1212, 2317, 1241, 1242, 1358, 1357, 1150, 2348, 1356, 1017, 
                 873, 2285, 1029, 888, 2295, 1044, 903}], 
                Line[CompressedData["
1:eJwVzj1LgmEYhuE7M/uAhjKHkOzjF7QLzQ0NIgROEY0NtrQ4CkE1tDTU0iI0
BfUnDAoKC/oYTKIWx0BEimjoeIeT87rv63ne513c2ilXhyKihI9UxMlwRG0s
4lM+l/fkvjwxEnFpzo9H/Jmz5tl0xBTPYR4FZJyZ5IUEZ4vOHKGJa8zoe0n2
3VU+xg1usaTrc0tX4lPc4R7LugG3dRU+wwOmvfHIK/pv3kQDT8lbumde0436
n135Ai/I6V55XffOeVzhDR1s2B+60/Ve3bwv/9pt48suY1eTf+ScfCD/A0As
LKo=
                 "]], 
                Line[CompressedData["
1:eJwV0D1LglEYBuCnD6moycHNoSFpCxKjKIzcdMhyqy0hEASjpcClFiPBr2qw
pSVwkAb/k/6AlpY2L4eL5z73ec/7Ht7t6l2lsRQR50yXI4YrEc31iJk8klvy
n9xLRPRpWw/MNzZJkt6I2DL3yXK2GpHQ9cwCVV2OA3b0Rd0HJW51hxyRsXep
+6RCTXfMrv7EvNJ9cU3dek+fN0+50X0vvsXIHRuLe1DgQffDI2N797oyFzzp
JmS969ns6jq80+KVF+r+xa+za55pyv9ySm7Lc9qaI6Y=
                 "]], 
                
                Line[{740, 920, 2171, 741, 934, 2182, 757, 942, 2186, 765, 
                 948, 2188, 775, 955, 2190, 789, 965, 2194, 803, 2255, 975, 
                 817, 2267, 985, 2205, 831, 995, 2214, 845, 1002, 2218, 854, 
                 1009, 2220, 863, 1019, 2222, 876, 1032, 891, 2298, 1047, 
                 906}], 
                
                Line[{742, 1053, 1054, 2172, 743, 935, 2183, 758, 943, 2187, 
                 766, 949, 2189, 776, 956, 2191, 790, 966, 2195, 804, 2256, 
                 976, 818, 2268, 986, 2206, 832, 996, 2215, 846, 1003, 2219, 
                 855, 1010, 2221, 864, 1020, 2223, 877, 1033, 2226, 892, 1155,
                  1156, 1157}], 
                
                Line[{893, 1034, 2320, 1154, 878, 1021, 2279, 865, 1011, 2274,
                  856, 1004, 2272, 847, 997, 2271, 833, 987, 2269, 819, 2197, 
                 977, 2257, 805, 967, 2245, 791, 957, 2237, 777, 950, 2235, 
                 767, 944, 2233, 759, 936, 2231, 744, 921, 2228, 715, 907, 
                 1052, 1158}], 
                
                Line[{901, 1042, 2293, 886, 1027, 2283, 871, 1015, 1350, 1352,
                  2346, 1351, 860, 1007, 1239, 2314, 1210, 1282, 1281, 850, 
                 999, 2312, 1136, 841, 992, 2270, 827, 982, 2263, 813, 972, 
                 2251, 799, 962, 2241, 785, 952, 2305, 1079, 771, 946, 1215, 
                 2299, 1205, 1258, 1257, 762, 939, 2339, 1322, 1321, 1066, 
                 752, 929, 2229, 731, 915, 729}], 
                
                Line[{2365, 2363, 2990, 2407, 2406, 2451, 2452, 3056, 2495, 
                 2496, 3089, 3091, 2537, 2538, 4470, 4468, 4469, 2580, 2581, 
                 4477, 4475, 4476, 4481, 2622, 2620, 4482, 4483, 4487, 2667, 
                 2665, 4569, 4490, 4489, 2713, 2711, 4580, 4497, 4496, 2756, 
                 2754, 4500, 4499, 2800, 2801, 3311, 2843, 2844, 3346, 2890, 
                 2891, 3373, 2940, 2941, 3397, 3399}], 
                
                Line[{2368, 2366, 2992, 2410, 2408, 3020, 3019, 2455, 2453, 
                 4425, 4426, 4428, 2499, 2497, 4352, 4676, 4353, 4267, 4266, 
                 4269, 4431, 4374, 3551, 3549, 4277, 4276, 4281, 4280, 4376, 
                 3571, 3569, 4288, 4287, 4293, 4292, 4378, 3597, 3595, 4299, 
                 4300, 4303, 4304, 4382, 4380, 4705, 4384, 4311, 4310, 4312, 
                 4389, 3653, 3654, 4706, 4317, 4316, 4318, 4399, 3681, 4466, 
                 4398, 4397, 2804, 2802, 4192, 4190, 2847, 2848, 3347, 2894, 
                 2895, 3374, 2944, 2945, 3400, 3402}], 
                Line[CompressedData["
1:eJwN0D1LQgEUBuATtFRUJi3SJK6Zv6FySlpuEEibREvqpcWgjy2lwPaIJGqo
qYaG/AMh0pK/IZrFKRp7hodz7vseLpebr6VJcyoiEjZnItZ5m4tomIeM7F/c
2m+4nI+44jqD2WUg/6BuHy1GdGiz7GYiH/Oj+6YnvyOnW5k1+ZP/8ih/oKAr
yzfILkRkeJY/saY7kqesyotUsxGvuhfu5T225BX2dH35O5/yIcfeMb0Usa8/
oEGdE/kpZ7R8z7mZ0mTXfcF/yFPznJg7lNxdmG0q9m3+AbVCLTk=
                 "]], 
                
                Line[{2374, 2372, 2996, 2416, 2414, 3027, 3026, 3470, 3063, 
                 3064, 4365, 3789, 3790, 3473, 3475, 4096, 3099, 3098, 3810, 
                 3522, 3520, 3134, 3136, 3523, 3578, 4641, 3166, 3168, 3579, 
                 3605, 4646, 3195, 3197, 3606, 3632, 4652, 3222, 3224, 3635, 
                 3634, 3660, 3253, 3255, 3663, 3662, 3687, 3288, 3290, 3903, 
                 4225, 3694, 3696, 4226, 4360, 4224, 3921, 3923, 3749, 3747, 
                 4449, 4410, 3351, 3352, 4502, 4503, 4707, 4504, 2952, 2953, 
                 3406, 3408}], 
                
                Line[{2377, 2375, 2998, 2419, 2417, 3030, 3029, 3478, 4240, 
                 3067, 3066, 3792, 3793, 3481, 3483, 4100, 3102, 3101, 3813, 
                 3524, 3137, 3138, 3525, 2592, 2591, 2633, 2634, 3198, 2678, 
                 2679, 4711, 3226, 2725, 2723, 3259, 3258, 3291, 3292, 3905, 
                 3904, 3701, 3703, 4155, 3323, 3322, 3926, 3928, 4414, 4691, 
                 4413, 3353, 3354, 4511, 4512, 4507, 3379, 3381, 2956, 2957, 
                 3409, 3411}], 
                
                Line[{2380, 2378, 3000, 2422, 2420, 3033, 3032, 3486, 3069, 
                 3068, 4368, 4103, 3983, 3981, 3104, 3105, 4104, 3816, 3527, 
                 3139, 3140, 3528, 2595, 2593, 3170, 2637, 2635, 2682, 2683, 
                 4712, 3228, 2728, 2726, 3263, 3262, 3293, 3294, 3907, 3906, 
                 4037, 4036, 3325, 3326, 4158, 4159, 4416, 4415, 4692, 4417, 
                 3355, 3356, 2908, 2907, 3383, 2960, 2958, 3413}], 
                
                Line[{2383, 2381, 3002, 2425, 2423, 3035, 3494, 3493, 3071, 
                 3070, 4372, 4371, 4107, 3988, 3986, 3107, 3106, 3819, 3530, 
                 3141, 3142, 4550, 2598, 2596, 3172, 2640, 2638, 3200, 2686, 
                 2684, 4574, 2731, 2729, 3265, 3712, 3295, 3296, 3909, 3908, 
                 4041, 4040, 3328, 3327, 4162, 4419, 4328, 4329, 4693, 3357, 
                 3359, 2911, 2909, 3385, 2963, 2961, 3415, 4717}], 
                
                Line[{2386, 2384, 3004, 2428, 2429, 3036, 3038, 2473, 2471, 
                 4256, 4674, 4257, 4258, 4111, 2515, 2517, 4055, 4675, 4056, 
                 3824, 3825, 2561, 2560, 2600, 2601, 3173, 2643, 2644, 3201, 
                 2689, 2690, 4713, 3232, 2734, 2732, 3267, 3719, 2779, 2778, 
                 3722, 3912, 2820, 2822, 4081, 4687, 4082, 4084, 4340, 4339, 
                 2870, 2869, 3763, 2914, 2915, 3386, 2966, 2967, 3416, 3418}], 
                
                Line[{2389, 2387, 3006, 2432, 2430, 3042, 3041, 2476, 2474, 
                 3510, 4264, 3809, 3808, 4172, 4208, 4209, 4702, 4210, 3828, 
                 2563, 2564, 3561, 3538, 3540, 3580, 2604, 2602, 3581, 3583, 
                 3607, 2647, 2645, 3608, 3610, 3636, 2693, 2691, 4577, 3640, 
                 3639, 2737, 2735, 4587, 3667, 3666, 2782, 2780, 3727, 3729, 
                 3915, 2825, 2823, 4085, 4689, 4348, 3950, 3949, 2872, 2873, 
                 4343, 3766, 2918, 2919, 3387, 2970, 2971, 3419, 3421}], 
                Line[CompressedData["
1:eJwNz7suRFEYhuGPEDHOekSpEJVGxiUImYKdyThESWKiIjqZBDdAOVNQUJqo
iInLcChEgksgOk/xZK39/mtnrz29Xa/sdSVZoehPVnkaSBrWY77tv1gaTdbH
nbMuU+HN/IWGfX0o2ed3OPnhVKvRV0p6eTV7pjWSNJk0m9Nn6XG+myv9khmz
ql4wpU9wo18zb3amn1DWF6m6V9vslju9zZpeUDN70O/50N851y/41Do8Mugf
Sxy545/nQw7YHPMdfYGOd3asu5Sda1pbbNhv8Q/ANCzJ
                 "]], 
                Line[CompressedData["
1:eJwV0E0rRGEYx+G/DTEI32BMdmJlaW+DomSahbeUGnPOlxD5DLIh2Uk2alhZ
IDtiw4KVxofwcllc3ff5Pefp1KmulwtFV5I5Gr1JnZtKsmvu8GXvsDWcNNmm
xeJQskRhn+xPJjjzfM7MSHJhzmrztO1XXNMzmHTT1FvcanesuDOqV9nT93nU
n3hm1fmLeaKfUvPdN8+v1N1pcK8/MO7sXf/gQD/kU+8w5exb/+FSb/Nrrwwk
fWw436RkmZo2RuEflEzbj8xj1v7f5w8ELS7E
                 "]], 
                
                Line[{2398, 2396, 3012, 2441, 2439, 3051, 2485, 2483, 3083, 
                 2528, 2527, 3121, 2571, 2570, 3153, 2612, 2611, 3183, 2655, 
                 2656, 3210, 2701, 2702, 4715, 3241, 2746, 2744, 3276, 2790, 
                 2789, 3306, 2833, 2832, 3341, 2880, 2879, 3367, 2930, 2928, 
                 2982, 2983, 3428, 3430}], 
                
                Line[{3458, 3456, 4526, 3461, 2444, 2442, 3054, 2488, 2486, 
                 3086, 2531, 2529, 3124, 2574, 2572, 3156, 2615, 2613, 3186, 
                 2659, 2660, 3211, 2705, 2706, 4716, 3244, 2749, 2747, 3279, 
                 2793, 2791, 3309, 2836, 2834, 3344, 2883, 2881, 3370, 2933, 
                 2931, 3393, 3392, 3432, 3784, 3783}], 
                
                Line[{3777, 2936, 2937, 4669, 3372, 3371, 2887, 2886, 3345, 
                 2840, 2839, 3310, 2797, 2796, 3280, 2753, 2752, 3245, 2710, 
                 2709, 3215, 4709, 2664, 2663, 3187, 2619, 2618, 3157, 2578, 
                 2577, 3125, 2535, 2534, 3087, 2492, 2491, 3055, 2448, 2447, 
                 3015, 2405, 2404, 2362, 3786, 3785}], 
                
                Line[{4625, 4623, 4670, 4610, 4609, 4667, 3760, 3759, 2866, 
                 2864, 4334, 4333, 4080, 4078, 4685, 4077, 2819, 2817, 3910, 
                 3713, 2774, 2775, 4663, 4584, 4583, 4661, 4573, 4572, 4656, 
                 4563, 4562, 4647, 4556, 4555, 4642, 3531, 2556, 2557, 3821, 
                 3820, 4054, 4673, 4053, 2514, 2512, 4108, 4253, 4249, 4250, 
                 4672, 2468, 2470, 4535, 4534, 4633, 4520, 4519, 
                 4632}]}, {}, {}}}, VertexNormals -> CompressedData["
1:eJzt3X1QVOUewHHmkobjNDlgqKFWpBnFYhmEwLFH0y2scSawccyx0eiFNKdE
U8zC6/IiKATCgIMoLGi+oJmFjkIdOyYqjNxUchcTEV+7JiyryTBW9nKvcBbu
LO1d3uPlyz87fPbZ3/md55zzPM95zp6zD4W8F/zmPxwcHJa6ODg4Otj6uyFw
HMdxHMdxHMdxHMdxHMdxHMdxHMdxHMdxvD1+KPX5h/JTVsrlL2jGeR4zKBMe
W5N6YLJZhB3w96q+y6gUZJhWjNHvlZJ+vmZe52dujHNZLR+glrcVf/uo6vGH
jwQr584O+qjkhEFxdhl+/PCzZhFd++P9bndvk6us4jjfOuZ7bFG2XKG6pPpZ
9f/I+s8VyRavcN11NO60oXH520p8Xg6bZBZHboeeiygxKNenvV4VGb1RjikI
Tov6P3neGvnHn/OvG5TL2uq6SU/FiviandMLJbMIXTss93R+U3zPzx2G7nvO
LKqiR3iEuBsVt9+/r4wYnC49vOuzyMXeZmGyymeLms85Nf9nAgsnnnogX7LU
s39cP/2a203lhx6tvOAbYBazDHPDipUmXyiWnInRmsWiwT7BenednPnNSL+4
w6eEf6CpLuw9s7iysyYq0utNEXLS5DtiuUE4Tc2YNjPILEZf/C38rQvLlOne
/c5X9C8THpoFw+YMNIv57o6rByQlSB+rcSaocZyin9w+oHqJCNecn/fFcKMI
2u80N9jnv8sd6XxpgbdOTtTqrn411iCKEtwjja+aRerUxV/+cDJSsq7P3R/c
l+AxO0luqdvaLoWJWe/HVCc3K6+rj6Nv5vGvTdkc67q6madXROx5t7pMnAjP
zf01dLM8dkhyxc4LNcIceCf/lGb5b1DLjw2Sih/xT5CeUMvbyjNDLW8RS/k4
U8aQohdjm8Vfr5bvV+R9/WJeumTJx1ifz6Zm5YfXvZ1bW1smKlPqrhVv0Imb
EQt99lXWiHVqnHuq3PtHvXRCts5zk/q+xsr1qntZuWU9LPncqDz0TlbQQXmH
6p526uGX7JWBe6N2yRut4iS6+rkcUr4VSeqrbtXWGeXjzWJ9w/+KXn1dqbqm
vt4/lbMa4iiWPDPV/53q6y2/cTs2LD/Rz9Z2TMldOnpPakFj+UuSxjXz8S3N
8lxx5Wb+oNL9krp9FOv61FvlY2v/XPZghL8wz1GSS5fWGmeXKeHOowL0ty3L
jZGs42Tb2J+1aaGLPVblyetamI9i4/hS93sp06q8Z0M9S+p2V8ba2b44jjf3
DZbjp/54WtDYX4TMvdMfzWvWntuKk93K/vHREQ3tTHxDOyMs7cxxY41X4MXl
LV6u4430r32zZCnHql8Y5CgmRoicFsextNtpahx7/aY9/+t+KqnAunyqWk7O
Gz1h5ic5dvtrHMdxHMdxHO/LbpmHSbaan2ltnNirP1UdzNshb9qbnDJlTLny
XU7VuCLvpnH4VtVPql7spQ93LSlXLO/vTpsxcO29NSJJLWfxMrX8G1tSPyyY
FS8/7eI2uVR3RgwoNGm1rzTFD1Ld0crbWz84juM4juM4juM4juM4juM4juM4
juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4
juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4
juM4juM4juM4juM43g5XcBzHcRzHcRzH8fa5viJiz7vVZcJrSHLFzgs1jX75
Bc04z2MGEfDYmtQDk80241ySNK6Zj8fItuK0N5/to6rHHz4SLM6dHfRRyQmD
cHYZfvzws7bzseXRtT/e73b3Nqmqhetly51vHfM9tihbqlDjSHbixF79qepg
3g5p097klCljysV3OVXjirzbXj84juM4juM4juM4juM4juM4juM43hX+xpbU
DwtmxUtPu7hNLtWdUQYUmrTaVzruOteiwT7BenedlPnNSL+4w6cU/0BTXdh7
rb9+d2VnTVSk15tKyEmT74jlBsVpasa0mUGtjzP64m/hb11YJqZ79ztf0b9M
8dAsGDZnYOvjzHd3XD0gKUH+WF2vCW1cL6foJ7cPqF6ihGvOz/tiuFEJ2u80
N9in9XFwHMdxHMdxHMdxHMdxHMdxHMdxHMdxHMdxHMdxHMdxHMdxHO8+vmik
86UF3jopUau7+tVYg1KU4B5pfJX7BXAcx3Ecxy2+3tXP5ZDyrdCrrytXbZ1R
Pr7nj5eS1OfSWqSsS59Pm1hg7bMMc8OKFUPj5xaKJWditD2/nnG8L7s2LXSx
x6o8aZ36fO8n2vmc8K72E+G5ub+GbpYzO+g55ziO4y31CtddR+NON42LtpX4
vBw2qfeOi86qv68QWf+7DUWSvd9ZiH9tyuZY19VSV+eJt82P3A49F1FiENen
vV4VGb1RiikITotqw+9x4HhL/NbIP/6cf90gLmur6yY9FavE1+ycXiixv9nz
0LXDck/nN/U7np87DN33HPWG473Rq6JHeIS4G4Xb799XRgxOlx/e9VnkYm+O
d3tushqfb+nl4/OO8g3qfMrYIKn4Ef8FsmVe6Jw6/n8msHDiqQfy5Qlt/L02
HP9fP26s8Qq8uFzuLvkMchQTI0ROt8mnb3qSn7X7x/XTr7nd1J4PPVp5wTeA
9gfHcRzvWvesHx9/KmdYxstcf8TxDvP0huPKcp1f6mnHlzlw8Zc/nEzpNucR
6nm90nBenyD3tO97dDdX2/3G96nPzvH1aj33K/K+fjEvXe5p7UBn+/C6t3Nr
a8uUypS6a8UbdMrNiIU++yqpHxzvCe54I/1r3yxZzlHbua76HqOm4fxFSlOX
29X9l76L17ev+SVJ45r5+BZpo2Xc10vq+VDq8w/lp6yUytXrUfauQ624cjN/
UOl+eX0Lv+ds+T6xU/14I7/xvCPsgL9X9V1GUZBhWjFGv1dO+vmaeZ3f3zf/
vOzBCH9hniOSS5fWGmeXiXDnUQH62z1/++I4jne2Z39wX4LH7CS+n/w3eerU
O/Njkc3mx3bb2C62vLPz/Ls8zpQxpOjF2E6bPzTWz09u6rT46n1lyj1V7v2j
XjohtfT8YpP6OU0Ly7f2PCKjl42HO8p/yV4ZuDdqV7vPFxIb7sdWktRXnZ37
si3noVktvI/PMo+dkrt09J7Ugg6/LlCYmPV+THVyp7UzDf2Ovt3xlT7WHuI4
3v09ZO6d+/7mtXtc8eiIhvmN+Ib5DaWnzW+kqv2UnDd6wsxPcrjeiuPd0C3P
EUpu4Xi1t/hW9TlDJ7v0+UI4juM4juM43rv9RuWhd7KCDko71PkAT+YB+oQX
e+nDXUuanuO6O23GwLX3dvx2D3Jxm1yqO6M4Fpq02lfYr3Acx3Ecx3Ecx3Ec
x3Ecx3Ecx3Ecx/G+7bbu+9N10P16eF/y7pIHjuN9x28IG+U6yjt5fdqcF47j
vd67rP3poe1zZy+n27b/3aT/bfTOqv+u2n8a1+tfAf98Kyv734rl1Z7bimNr
uernhY34zdzOejXLwypPYc9txbG1fKs87Xpb1+OvvbOPk9Yup9sdhziO91hv
fL+zx5ndZPyG43gf8s4ej7U4n/8AotWgrw==
              "]], {
            Axes -> True, AxesLabel -> {"x", "y", "\[Psi](x,y)"}, Background -> 
             GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {-0.7334464586120832, 
               0.7334464586120832}}, PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyNnX2wZVV5pxtPiI1w+WqHoIMI2I6pUmdagqBW5Haio1BiJmqSYSqUE/nS
UpuUNWMJGE3ElH8kWMGWNGAlHSFKgVjmjCY9lrR9roiGmAoR6MGPZqYURqxE
RKGJ0gltT88961mH/bz7lyv/dJ2H97577d9e691rr493nXz+b7/+oqesW7fu
nKPXrZsc/PfFnzj6qwcObFjh38v+4d+9aP0n3768ctaRJ23deEzh2+78uW+d
tfWIwj95+Ibf27LnZwu/bdXPIYX/xar9j2bmf7nKHyx83ep/u3eaf3Ruv2z+
8bn/wj8/L89m85vm5S986/x+C98116fw9jvxFXS1zubobI7O5uhsjs7m6GyO
zubobI7O5uhsjs7m6GyOzuboHPgK+llnc36bo7M5Opujszk6m6OzOTqbo7M5
Opujszk6m6OzOToHvoJO1tmcvzfntzk6m6OzOTqbo7M5Opujszk6m6OzOTqb
o7M5Oge+gh7W2RydzfFrzm9zdDZHZ3N0Nkdnc3Q2R2dzdDZHZ3N0NkfnwFe4
b+tsjs7m6GzO9cz5zb+Hvu+PX/GHb7+n62yOzubobI7O5ujs8qCzOTqbo7M5
Oge+wv1ZZ3N0Nkdnc3Q2pxxw62yOzubobI7O5ujs8qCzOTqbo7M5Oge+wn1Y
Z3N0Nkdnc3Q2R2e4dTbntzk6m6OzOTq7POhsjs7m6GyOzoGvUF7rbI7O5uhs
js7m6Ay3zuaU25zf5uhsjs4uDzqbo7M5Opujc+ArlMs6m6OzOTqbo7M5OsOt
szk6m3M/5vw2R2eXB53N0dkcnc3ROfAVrm+dzdHZHJ3N0dkcnc3R2RydzdHZ
nPs057c5Opujszk6m6Nz4Ctcxzqbo7M5Opujszk6m6OzOTqbo7M5Optz/+b8
Nkdnc3Q2R+fAV/Bnnc3R2RydzdHZHJ3N0dkcnc3R2RydzdHZHF3M+W2Ozubo
HPgKf2edzdHZHJ3N0dkcnc3R2RydzdHZHJ3N0dkcnc3Ry5zf5ugcOONpRWdz
jdcVnc01Xld0Ntd4XdHZXON1RWdzjdcVnc01Xld0Ntd4XecfWfXzxIx/4VfN
fy+b85v/b3vzyy876vGzth67wr9+vubt9+ZgXzjlOWP1/08K9/fv7au/Hyn2
cN/vrlX97y32cNtvm/Nl28Nt/7n5dYs93PbYmXOf5twX/9LvovzmlNOcepvK
b3vqAdzlN8evOe0xlcf81Ln/zem63Leva87fw/HP/Zpzv/ZDecwpD3q7POaU
B+7ymFMe+6E85pQHfy6POeWBc13s3d/G3vEBXewHbnvKbXu47bGzPXa+L37b
D7rZnvppe+6Xv/P9mlN+c65nzu8Uh22vOFzes+aKw4X7PYJ/zwfJvsTbMp7Z
9CnjvU0fc/RJcd7jgfg3x785/s3ROY1/Ov7wfjfv/T3Fh97fU5zp/TTx3k+T
nz6Po/be53EUN/r8i3iff5Ef/Kd24XbH/XscgHKbc700nmD//E7jDCmOle/c
Vp4yDtDKY47f9N2d2qnt1Y5K/83tEZ39Xv673zjnfzyy7YnZpafu/o833/ej
2SlH/dK5n1/3tt6Pvf9dL7j0Gdc+MTvvsS2bTn7xW3s/1n7ox6Z+oMdjuS9z
7D2uiL059h4fwz5xv3coh/Xneub4Ncev+fbV3w/NNm75N5v27NjX2+Pdq/Zf
LnzH6vP+9rI5v/EHP3TTM6/aseVAvw7XxZ7r2B5ue65vezj28E2r9W5vuV/+
P7yXQ7xfTxy/5pTzqDnv5ec3/x/+zPnvqCf/3/cLtx+X52XzcpbyoIM59i7P
V+Y6FHt0M8fefq6Y2y/bHp3NsbefP5iXv9jDbY8+rp/8Pfft5wi3vesznPu2
H7j9uJ5TTtvzXO0fe7cj/KOfywO3vdsR/m1Peewfe7dT/PN8XB449ujr+s/9
m3P/yd7tgnLbnnKb9/uXnx+/9tce+a3P7+v1bsM/X/LtV1y80Mf3+9IH33vt
RQftX73ngVedtu6x5U0XvuKWl1y8qM/4w8/xp7/riL0H48zZL7r5vmsP8t8/
4ytH//1FC3uX5+vHHH3hxrM3rPCv+GbzG+469KX/dND/Sy563rpv7do3e8cb
3vfQreff0+Ob6z+/zb/+0hd86MO79i1ve/TZ13xp3WOzi17x0cvfdsHCT4+X
zZ7f7ueo/JtD+Uv/3/eFf8cH+H9+3vTv3n7dE7OX3//ww3fe95bl++fln+1+
0yGHvezg/6f8/L3fI/3+pf+eNxz91r85yO/686sfPfOgHn/+kl/6X792Yb+v
8h2BH/fP8eu4xG/rCU/9TNujV+qnBf3L95Hsy/oTj2/Qrl1/4Gkdhf3Q3u0H
ntZd2A/t3X7g9oOO5vy2H/Q3pxxeh4Cd4z/+zem32w/ltD3lMac8nq+nPI7/
lMec8tgP5bE95TGnPJ7Xpjx+X1Aec3Txdxb1ze0CnuaL7Yf6Zj/wNL9sP9Q3
+4HbD39vffh768Dfmyt+lnjr+ID+7kehvznlMac85lu2Pe3S5x+My6+685zd
f/qTvcvPuO75zzvywFv6dV87j9vLZ7a4TT12+4K7nVLPbA+3PXrZHp7GVVLc
dj+NvzdHN3N0M8e/+134N8e/Of6TH9dPdE7c9RadbQ+3PTrbHm577Dy+BPe4
EDyNr3peA+7xOvqL7m/w9/7u5u/N+Xt/3zGe4HFRuMdhsPO4B3bm9Df8fYrO
jhvoZd6/u9Qv4rf1oV75vvBz6ep40VPK+JWfb58XFqd8ft/hx/Whr+sWx4/f
U5Tb9QTuesL9WIeHrz7y3gO/W/cX/KcDx3/2wIGl0u+Cl/0Fu59++4ED6+v+
jsbH1+FPQr9uUux/dfW6+8u+D7jtT29xyfZw2891fKDYw8f3QUzLfpNfmNuX
fSXY2w/25qe1+GA/cNv/ylyHYg8f9z8p3wVw239h/hyLPXy8PEvFHm77Vg+L
PTzYl30W1M+yL6PVw/F9CpPCqVfm1B9z6sn4Po5p2cfBczfn+ZrzHMftJ2X/
Bc9l3M9S4egceNlngc5lX0bTeXyfwqRwdDZHZ3N0Ht/HMS37ONDZHJ3N0Xnc
flL2X6DzuJ+lwtE58LLPAp3Lvoym8/g+hUnh6GCODuboMG5f3y/oMO5nqXB0
CLzsg0CHMm/YdBjfRzApHB3cf0YHc3SwH3QwRwdzdDBHh8DLPgV0KPsamg7j
6/wnhdOOxvc1TMu+BnQzRzdzdPN10c0c3czRzRzdAl/xvBi6maPb+Lr9SeHo
5nEGdDNHN3N0M0c3XxfdzNHNHN3M0S3wso8A3cq+g6bb+Dr8SeHoNr7vYFr2
HaCbObqZo5uvi27m6GaObuboFnjZF4BuZR9B0218Xf2kcHTw9yY6mKOD/aCD
OTqYo4M5OgRe1u2jQ1nn33QYX/c+KRwdzNHBHB3G7SdlvT06jPtZKhwdAi/r
6tGhrMNvOoyvS58UTn/JnP6SOe1ufN3+tKzbR2dzdDZH53H7SVlvj87jfpYK
R+fAy7p6dC7r8JvO4+vSJ4Wjszk6m6Pz+Lr9aVm3j87m6GyOzuP2k7LeHp3H
/SwVjs6Bl3X16FzW4Tedx9elTwpHZ3N0Nkfn8XX707JuH53N0dkcncftJ2W9
PTqP+1kqHJ0DL/NiGocpOo/Po00K1/hJ0dlc4yFFZ3ONexSdzTVeUXQ21/hD
0dkcPfnXep7w7SOv3LKnjl+95oVH/fKe071+flLW2/c4/KWjPrXj+wuOnl/T
vCR6HvrGo5+59WN1XOi0MI7k8qOny4+eLj96uvw9Dqv86OnyU45HLz7+nI1n
LxU9+dd6fvKaZ2zcs+PIoudhq+OQRxU9f+HCpZ+cdezRRc/zp0t/uWPL0UXP
q55YeuvGvzm66DkL42yPqPzo+Ssqfx8HUPnR82kqP3qepvKjp8tPHHD50Xn9
xzY8dNbWpxadL/rFp5+78ez1dRyg/Wudn706nn1Y0fl3Dj3uT3ZseVrR+Zt/
etz6rRsPLzqfcfrP/fctew4vOl8dxrWeqvKj84Uqfx9nUPnR+SSVH53fo/Kj
s8uPzi4/Op+42o7qeMu75+PlRef5/OSk6My/1uFZ8o8Ol8s/Otj/MB5Oig4f
/uVjfnHPjp8pOvzwm8fctGPLoUWH1/63Y5++dWMdd3rz6nN5vIwznKJ5GXTY
s6rzv5Rxhm2a30GHi5t/f7+cpPVyw/HMJ8r4wOtb/fX9HjE+r9Ha3bpyv/N5
nn8o93ud1tdxv3P/Pyj3u6J16dzvyc2/73eb5p2H4+2PlPt9z2o9ebTc7xmt
vfp+58/9n8p4yFdX+887yv3ubPO5vt8vrZbnrnK/n2rzXCU+8H7T9/tn23Wt
w6c1j4wO9o8Of7aq231Fh9u1LhEdTm/lsQ6bWrmsw61af4gOfzS/bvlOv7HN
01mHa+b3W8Yx+Nc67NJ8NzrYPzr81fy5lO/0j7T5QetwfSuPdfj+vJ4UHU5t
5bIOl83rYdFhl/YF9H5L8+/75V/fr/1wvz8zb3flfq/S+kbu98R5uyv3+6Z5
HCj96vWaL+Z+ice+36s1b879ni//3Odh8o9f+0cH+0eHr83jbdHhWZqvR4f5
e/bxosM58/hfdPjB/H1Rv5fn75fyfUF5rYP9o4P9c/8fkn/82j863Dt/P5b+
/2War0eH9v4t3wWnz/sDRYdvzPsPRYfWXyo6tP5V+c5qf1e+s1r/p3xntf5S
+c76RBifOUPlR+dvqvzo7PKj74kqPzp/QeVHZ5cfnV1+dG7926Jz6w8XnVv/
v+jcvheKzq1/XnTu9UI6t/5/0fnqMD7j8qOzy4/OLj86r1f50fcWlZ9yu/zo
7PKj81Pn35VFZ6+vQ+eb5999RWfvk0Lnc+bflUXnefuq4zOU1zrPwviMy4/O
Lj86u/z6zi06v0blR98TVH7ul3/NH1C/l/KcG+y/obgNf5XiP37ulr2eb+nP
ezyh9wM1btDHM/W9AL9P3x09jml+lufu7wv4e/VdAz9c/XP4z7f+/z/+3rw/
QP3xdwr8ZH1PKU6W76/XyQ/2t4d58Md0X7SL7foegXs9G7qZc7/8S/+H3zfq
u4D7fZG+Iyj/zjAP6+tSr67QdwTlv0PfHZT/3bKHn6DvIMrv9e2UZ5xPNvu6
lOdO9f+57jXq/8O/o+8UynOb1t3BH9V3B/r8T/mnnC4P5fyA+ueU5/Pqn8N/
W98RlOcGreuDf0rfBZRzu/xTTpeHcu5Qv5ryrFe/Gv4O9fOH8x0PlXK+QP15
/Hh+EPsTW3+V9g4/RP1k6v+zWn/e9f+mMF+8JHt0e/w/DO8X3awP5XF/Ev49
9WMp5wnqZ8LPVn94+B6s85vHyw/2N4b5uHeqnNzXlfqOQId71H/m/fKQ3te8
R/we13un8DQOn9Zh+v2CbuP5Y6clfyx+vG6H+u+8AdRPc/Qx79+5IS6Z93kr
rQfu3/vifb4pxBnnDejrEsX7ukStH+7jTuJ9PWGIG97vz3XNua7XscPTugXb
U57k3/Ps1JPxvH/TkvcP/173jv/0Hve6LK5re65rTrtO/r1+Ce71OfC0rmZ8
n/607NPv3zXiPJdkT7/3hjt//IYHPv7FrqfHReGbNL4K/7Le1/BTjxiOT8I9
/gbfqHE8+KV6f8G/q/Eu7sv9cHTw+wj9L9I4Of4v0HgL9WpD6Pd63JvneIHG
q+H+voBfonF1OOPzR/79/HlRH1ZCXHX/Fn3erPLA/X2En88oDsMZz//HHw31
3KfxavhJqj/wszSuC//M4eP15yXBfoPGReGnhXq1NdgfofFG9Gf8zc/lrvZ9
x3OBv1Hjh3CPE6LnzYqrcN776MzzOk/lgfN9SrvGz60hrnp8kvKdIB1oR8dp
Pzvc/UC4vwfhZ+q7CZ6+p5K9+6twt1O4v1t57j9QPOG6Hu+FWwd0e0T1H/vx
cfK6n5164u+s4XfugvPcE3+8lcec70GXx/sTKb/XA8Pv1ncZfhL3dxzc+6rw
z3vT/Hx9Z/VxvMD9XQb3Piz8ez0q/Ap9N/G83P/heZmjf+J8r5Vy6rrDdWWV
ez/dcJ+L5yv3Lnu8Au59tbQX5zHAv/sb6PND1UP4+1UP4eP796c7bwn8jtBe
0vp/76ul/OPzmHuXPc7Q67n4cJ2b5wH3LnscAO59sujwoObd4JepnsDH95tP
d14f+K5Qb9M65G0ab+T7wt+ncNcH6k/iv6l+F/xr+s6Ff1DzTcNxm7pO2P0i
7iuNs90Xxoe3pH6j+lfUB+9LRedPhn0Zr27Pc3w/wv1lP4K/Q4f202J/vOa1
sbs2jMOMf4dONr+0PWfui319XufGeIE5+9PM2U9lzniBOe3cnPeWOe8Vc+K+
Oe3BnHpmzvpmc9bjmrN+1Bw9vR4PPc3R0xw9y7q+pqc5epqjpzl6mqOnOXqa
o6c5epqjpzl6Bt0K7+crja6721B4P3dJvJ+7JN7PXRLv5y6J93OXxNHZvJ+7
JN7PXRLv5y6J93OXxPu5S+L93KVx3Qof5i33ursNhQ/zmU+KzubDfOaTorP5
MJ/5pOhsPsxnPik6mw/zmU+KzubDfOaTonPQrXB09nc9Opujszk6m6OzOTqb
o/P4OMPunebobI7O5uhsjs7m6GyOzkG3wtG5zzNIZ3N0Nkdnc3Q2R09/L6On
OXqao5v9o5s5upmjW9ChcHTr/VnpZo5u5uhmjm7m1E+vb0RPc/Q0R09z6qc5
Ors86GyOzuboHHQrfHj+17ScC0b/zvrbHm774Tli03K+mO2H54tNy7ljth+e
OzYN545Nw7ljlXvdJs/X9nDbD88pm4ZzyqbhnLJpOKescuswPL9sWs41s/3w
XLNpOe8sPPdiD7c99YfvV9cTc+qDOc/dHB3MuV9z7iuUp3DKP74udEPhlN+c
8ptTfnPKb075Q3kKH+q/+K4c6v+kvPoD/Rd8qP+C0+7MaUfmtBdz2os57cWc
9mI+rA8LPqwPTzpfYFAfij6Fo6fXSaKnOXqao6c5epoTx8zR2RydzdHZHJ3N
0dkcnc3R2Rydg26FD9vdUtHZfNjulorO5uhsjs7m6GyOzubobI7O5uhsPowP
S0Vn82F8KLoVrnGYoqe5xluKnuYabyl6jq8X7eMtRU9zjbcUPc013lL0NNd4
S9HTnH2SHp9hX585+9DM2Zdlzv4l86+3eVDzh9q4sDn7IsxZx2/Ounlz1kmb
s67XnH2MHldh3535yW1e0PzaNt9QxnPaOLs5+z3M2Z9gzn4Ac9Z/m7NeeZxP
yngO48XmrKswv72tnyjjLW1c25x1/+asUzdnXfX4+NUTZdyDfWvm7OMyZ7+E
Oev7zd89OAfnSeM27T1Rxh/aenpz1q+bEwf9vcm6dnPqsfu37Cs2Zx+sOftC
zdkn6e8I9hOas7/OnP1X5uxT8nXbeuvC2WdiTnsv99vauzn7q92vZj+wOftj
zVk34/lx5inNmZ8zZ57e/okD5uyrMScOmBMHxvmk9P/ZB2VO+zWn/ZrTfse/
R54o/XDarznt15z2a077NWc/hvnvtHlc9/e2t3XY5uyTMWdfh/kX2/oA93No
1+asb3N8YH2MOevGzNm/Yf3ZvxHmucr7cXuItx9Zg7s8d4T4fHnT3/as7ze/
M8Rz1uXbnnX55qxTHx/3vqvoybp5c9Zt2w/r2m3POokyrtvmp81Z3+DxT9aj
mDPfb846EnPm9c1Zn2HOuiVz1lHBWTfF/hy/v1hfZXvWu9uefTgeJ2Rfisct
WQdve/bneLyI/Tl+X7C/xeNjrO/3e4319PbPenr7Z5+P4/NHBnFywVl34nbN
vhFz9mmYsw/BnHX8vu7wO3Rhf0eI23eGuE27M6cdmbNPwNdl3YbtDx3Gt87Z
hxa+mwo/dPi90PntIY7By7xMiFfwMp8V4hLc9p8L8Qdue8rp9kt5zLmuOf7H
41LtT/L9m8bJXd9uH9SrRX9p16BePanfNahXC/65Qb1a8OF4Xb1uGeds1y39
mXZdc65rPhxXWXDWFZkTBxwPh+cmL+LbMG//A8XecWl4ft+0nN9X+tvNPnHr
ORyn8vphxqkWfDhOteDDcaoFp79EeVg/fEjoV/M9az/sEzBnn4A5+wTM2Sdg
/pxWPnP2CZizvt/tl/X9tmf9uu1Zv27OOnXzY9v6KnPWl5uzXtn18yS932l3
rDNz/WRfgTn7Cvx+Z18BnHXsrHe3Pevdbc96d18XfcfnJeu8HvsN3E/YpnbH
enj2M7gd9fxj4qyzt/8r1X7xf2voh7D+3v0Wvi/cjthv4PrGOnLH1RPF6dex
Lt9+WB/venKc+pPuf/q6m9bgrrc/r+93ykl9dtw4PHDWzfu++K53u+B+Xc6X
BT6cb6rjDNbn06H/vyv08+nXmXNdc96Pbl+skzbnPWjOOmDz4Tlci3p+S2hf
w/O2FnxX4Ph3/R/ODy50vjGM52wPfDifuOB8l5nfHfhw/nHB+V4z3xE4+vh+
qW+ut+x/8HNnf4L5FeE7kf6A6z/7Olwe6qE538vm1M/kp+jc7sv8tsC/Ejg6
mN8Q+BWJN93Mtwb+B4ET/93/v2oN7njI+vXyPdLGJVxPhvOVT/reDON79Cdt
z/p4X5f5CNuzft2c8eS0rs/luba91xx/6KeZs//f/MftO9qcdeppHY45eQQc
r3aEOLap3Y+f76lrcOvDuEQZf2t5XT1/RH46c/K1mZMHtqw3bvlMzT/Y+s/m
9JPNLxuct17mcQonD6k5ee7G16/W7+urQ/sij631JJ+sOflPzcl76/hJ/lZz
8o2akyfLnHGS8v3Y8sCak7fUnHxb5uSHMu95UMXn7bOu3yN/rjn5Xs3Zl+L2
Qv6y4Kdw8kOZ0y7G13HV9y/1v6y/avXfnPzIjlfk+TUnL6059Xl8fVEdZ7s6
jKdRnz2vQX5hc/LhmpMf1pw8qubklzQnD6P519v3iznvl3Fe1+3QvsxpX+aM
b5uTB9Z8e+sPmJNHsswTte8g8zYvWeaPaO/Ff2vXHs9s6ygKb+suCuf73Zzv
IPOPtfeg+bPb+9Sc73dz8ieat3Usad1L4YwzuN2Rd8bzX+Qjc3w+JHzfkXfM
/PAwTkIeH3PyizlOksfH/PYwLnFjiHvMG3qcgfwU1od9fdZhexhXvDqMK7Jf
3X6Y13A/in2k5neE78TrwzgJ+8bd72IfpstzbeiP0b8p+/tav2R8XnVSONcr
65paPTBXPsPOKV/Kz2/Ocx23n5T6T9wc97NU+MOhHaHP+L62SeHoY44+5ugz
vr9vWvb3oYM5Opijw7ifpcLRId2v+7HK11ru17znpxrdZzct++y4L/N+Xp44
92XOfSU/7g/jx3yYp6vmk0/ro8zx89Oupxrm5V57PRXPr8xbkSdWnPv5acd1
eY7jebknZb4MfcK6psK533Rf7sdyX+P7ESaFD/PVLDjlN+/nU4hTfnPKn8rj
9xTlMac85pTHnPKYU57kx/3n4X2VfHeFUy/dX6WejK+rn5Z19VzXnOsm/+Pr
yadlPflQh2of8vWVOE+9HI/DdTwBP44//XxSry9t/sfj4d7Ch3kCJ8V/WP9Z
OH4cl/BT9qU2P+P7N2v/k3oT4mHpf3Ldsk+zXXd8/+OkcK5rTn1KcdX9VcpT
9j+28ozvE5wUnubpKKc55Rz389OPV3Bf7t8Oz/dc8OH5nt6nNil8eL5nzYNh
zv3az/BczgXnfs2538BL/Ic7HqJDiJ9lvGL4PnrSfq7B+6jmC3Ucw0/Zx9T8
jO/3mRROuzJH/zIe0nQZj8P7g30dlxjquVTuq+wbGpwT4f01k8KH78elcl/m
3Jc59zVuPynvheF7tt5X2b8z/J4q92Wu76nyPjXXuWblfs313VTu11zfTeW9
nMrv98jwXLzKHf+H5+Ut7OFlXLrpMJ5HYlrySKBP4m7vXNftl+uO78eclv2Y
+B/vX+0vnHaUdB6Ph3U8ZNj/qXnyHQ+H7ajmS0z5/P3ehKf3nctPOex/eA7F
/lLOlLfQ4y34Nx/mu/P7aG95Tw3rg+fNp2XefFhPah5Cfzfhfzy/xLTkl0AX
689v+8fe9X/4HVTrZ3ouqf6nc6zG8zxMy37/kM9qBudfuNpL5+GcytkwH86G
Ym8ezrWcDfPkVHtznQ/S+TCvTrU353no3MnZMA9PtTfnOeqcytkwb0+1Nw/n
cs6GeX6qvfmwHZmTF6jam9O+/NyHeYSqvTn13899mHeo2o/7L+eHzoZ5iqq9
eThvdDbMa1Ttx8tZziedDfMgVXtz9md9XX7Yj+P7ZR+TeZiv7/UjtffE7Sec
r9q5/YRzV3t7T/bmtF+d09rbe7I37+Nvw3NRe3tP9uY9j+vwHNXe3pO9eTg3
trf3ZG9O+52N8t07k715WL/R27vtae+J2w/t2vWBOGA/2I/7L+fe9jiQ7M3D
Obk9DiT78XKWc3V7HEj2od35HN5+vniyNw/rbXocoP25vSduP2HdTq+X9kM9
SNx+wjnCPW7YD3bmxAGdO9zjRrI3Jw7onOIeN5K9OXFA5wL3uJHszcM5yD1u
JHtz4sDVo3z3zmRvHtZl9bhhe+JD4vZDHDAnbtgP9uP+yznOPW4ke/Nw7nOP
G8l+vJzlnOgeN5J9aKc+V7rHjWRvHtbR9bhBu3F8SNx+wnq8Hjfsh/iQuP2E
dX293ttP758EPq5DOV+7xxP7wc485PPsXOcKzUK+i1nI/9m5/YT8GPouqNx+
Qj6NWcgv2rn9hHPJZ2E8ahbylHZu/8QTnW8+C+NXs5DvtHP7J87onPRZGB+Y
hbypnY+Xv6zj7fFE5613P65v2JsTT3R+Yo8/yT60d5/n3uNPsjcP62Z7/LE+
vX8SuP2E9bc9/thP758Ebj9hHW+PP/bT+zmBj+tQznls7/fKsVfe+FnYV9jj
j/3w2zzkqZiF/YY9Lr3+uZOzLr3yidl5j23ZdPKL39rPC7H/kP9hFvYt9nhl
P+zbNQ95IXr8MSeO2U84V2sW1rn1eGV74lLi9hPyfvT4c27gtg/r32Yh/3CP
J68PfDxOLm0+Ynh+TY8zyT606/adta7EmWRvHtbV9zijc9Z6PEncfsL6/B5n
7Id4krj9hHX+Pc7YD/Ek8XEdynmFPc6YY69zVGfe//tfv/PVU/bsu7vvx8EP
nHpv/84T8spm7/2P+CHO2D+/zZ1fBe59lHDijP0QZ8ydjwXu84zgxBn78XlJ
cOKD/RNnkr058cH6s1/MHHud5zsL65l7PHE9DPm6Z2HfSo8z9hPWn/R4coY4
8cd+sA/tffMPh+dk9fiT7M3Dvpsef3QOY48zidtP2L/T44/9EGcSt5+wD6jH
H/shziQ+rkM557THH3PsdT7ybGOLG+zjdPzBj+OP/Tu/kOMM/5rbvo/bBG4/
3ofoOPDqwG3fx1WkA/HBOmBvTnu3PsQHc+x1nvUs7F/occD1JOSZn4V9Zz0O
2E9Y9zUL+9R6fLAf4kPi9hPWj/W4Edp15PYT9s31eML7ynHjX+cLP2H/XY8n
9jNc/5b4wk/Yx9fjif0M19Elbh3K+cU9nphjr3PMezxhP7fjCX4cT+zf+cQc
N7ivcb6w9z5HxxP78XpCxw2Xn9/mPofLceMG6dPHaeWnjwOL9/Fb6UacMcde
59HPwr6n2fD8gt2BL+zDvtHZcF3l7sBLPS98eD7Cws9wfWbipZ0WPjxPobT3
NfjCT9j32uOMzoPu8SRx+yE+nCpOnLEf7M37PMHw/OUeT5K9OXFA54D3uGGO
/Q5x4gb5Gxw38OO4Yf/EAdvTLzfHnvvy94vteX+bY28/Pg/UccMce/ImOg5s
lT7EDfvB3pw4YN2IG+bYkwfRccD1E0654CFPb48D7Fe2H9c37M1p7+wPdtxI
9qHdbT5xeD5yjw/J3jzsZ+9xwPrQ3hO3n7AvvscB+yEOJG4/w/XS+0t8sB/s
zWnvOg+0xwdz7HXeaI8Pz2z7vB0f7If4YE4+IvshDtieuGFOPiL7IQ7Ynrhh
7nO9f+OaS459/8ptfXwj2ZvTrsgr9krFh2RvzvM253eyJ4+y26/rD1znt85C
Pu3e3r8m/3DXN9o1+QAcB5J9aHebLxyeV9vjQLI3D3kqehywDrT3xO0n5Lvo
ccB+aO+J20/Im9HjgP0QBxIf12FSOPNe9oO9OfHh0pbvAU580Pm8PT6Yh/OP
Oqf+DnUueX37d0Xi9hPyt8/C+Uqd2w/xgfNAzO0nnNPUuf0TN3ifm9tPOO+p
c/un/X9oeO5z5/Yz3D9b/bueYGdOPLl3eA5157bv+3NU34gzyT60683k7XCc
SfbmIf9MjzPWmXiSuP2EPDY9ztgP8SRx+wn5cHqcsR/iSeL2E/Lq9DhjP8SZ
xO0n5Ofp60vsp6+rD9x+GK9nvN/xzX6wN2d8g3FBc9vzffuJwG0f8g71+JDi
ie1DnqIeB1LcsH3Ia9TjwHh5qj2/zfl7++nr50fLubTZz5G4kexDO93s50jc
SPbmIb9TjxuUy/EhcfsJeaJ63LAf4kPi9hPyTfW4YT/Eh8TtJ+St6nHDfogP
idtPyH/V44b9EB8St5/hvrYFJ27YD/bmxAfmAdwvSvbmxI2rR/nuncnePOQB
6/0i2w/HTyq3n5BPrPeL7If4k7j9hLxkvd8yXs5J5PYT8pv1eGU/xKvE7WeY
92PB+ftxHZYKJy65XhHHkr15OA/R++9KvOL8K3P7CXnhun/K63iVuP2E/HI9
jtkP8Spx+wl56nocs58+vxy4/YR8dz2O2Q/xKnH7CXnzehyzH+JY4vajvGEl
vtkP9ubEq9ko370z2ZuHvH89vtm+z0cHbj8hf2CPb/bT57UDt5+Qh7DHt/Fy
TiK3n5DPsMc3+yGOJW4/IS9ij2/jOixFbj/h3Jy+n3G83VX7cE5Z77+Zh3NO
HZdWpHPhIY/fLJyL6rjReTgv1XGg83COqtt15+F8Vbf3zmmn47zkD5yFc1rd
7joP57e6HXUeznV1u1joMH7eq+t55+EcWNfbxf22+meu83Y75zf1Dh7Ok+31
yjycM9vrlXk4f7bXK/NwLm2vV+bhvNper8ypV+O85F10v3TRHsfPw+31xzyc
k9vrj3k4P7fXH/Nwrm6vP+bhvN0e39I+LNtTr4hPjmPUr+F1Sz7J3j9J+5Js
H87/7f0Q+6G+JW4/4Rzh3g+xH+pn4vYTziPu9dN+qM+JJz/jvOTb7PX8Qj0v
+iG+Lvbm9CvG9+PsL/bh/OXeLsavW/KCzsJ5zYt1/uLhHOfFen7xcL5zby9p
35DtaS8nah8Z7eXd2v/F33vfFtcr+3Hab/PejoK992318Q3t2wp5n3o99/6s
kA+q11vvwwr5oDz+Wbjtwzmns3D+yCycTzEL524rz0bZN1r4MJ/Ggodzunu9
SvtEbE+9oh/nenVKew+7XnEumeuV14HDvb8mnAPb64n3B8Ef0HWpJ7aHs6/i
lVofSPlva/P1cPuhnrA/df19Q2571j8xn8m6Atbl2J71B7Znnt72xElz5kGT
fdgXE/c9mYdz3nv9NA/nv/f6mfYR2J76yXeD6+d1rd/n+sl72PXQ643h3k8R
zvPt9dD7ROAn6Lr8vfehwNmX4/WrtoezTn+4XmVa9umwPs0ce9bnun7anvEK
r9un3m5X+alv1of6aY59Wsf+Hu27ob6l/S/mnD8e9sHF9ee2px5+tX2Puh7u
bN8Trodfav011zevR4V73Xs4D3ox/tbWHZh/R9ft42nN3usqzbFnX5fXR/Gv
ufdlwF1/qIefDNx++riZykm9Ncfe5aTe3q376uNa0pN6a469nyP19s+0H4T6
eXvbnzJe38o+qeKfeqj8jZG3cfnCQ7535pULp36mdcXJnucJD+eSL/LJtLhl
zrn0rs9eV099NseecwXhn23tmfI73no9sPPYj7eL6U7XZ3Ofq+566+v6PDXX
5x26r3AOe6+3fo7h3Gr2wRUe8vP38Shz6n+pb20c1Zz6n9brpvr//Taep+vG
dfjmfMeaU5/Tulnbh/Puux9z6rnXb8PfoXX+1GevD4dzfqzrLfsFzMfXwzOv
Ubnt6fdu0nV5frbnt/m/7L3lr391um/5GZe9/L/87f9fj/aU59z6wnX3LL+z
zbdaN+qtn0s495z1BnEduznjY+bUZ3PGx8L+kbju1PbUZ8abXW8ZR4SH8yt7
fTOnXnk9MPxVsg/nqHZ+qMoTzgvu3+mJuzzUt6sDt304f7nXb9uzL8L24fzx
Geukze9p65TMqYfmjDul9dLmjDuZD+fxF5xxp7B/Ia5LtD310OtRqYdeR9rX
52j9J+MRXucJd3moh1/Tes6Qf3hGXgZz4uH3VM6Ql7iP07o81M8TtM4z5P3u
46j2Q72dBW4/jEeZMx5lzriTeTi3pY87mQ/j24KTlzWsh4/r1mzf84q0/oXr
FfMYrle0m+F1e/7DUk8Y5+jtrn1PpvWZ5ttbP948nFPTn/s4L+fX9PHwb+p+
aYe+X3Q8Ufd7SxufGV9vWc7HYX9T4TzHtG7H9jxH+n3maf0M79XyHdHinJ8v
9dTPl3Ep+Bfb95XXNYVzf/rzGuflPKD+vFx+npfLz/Nar/Kj4y0qP3pZN8Yx
XB6ei+2H8XxhT/5l+il67uQbd3svnOdoP8pzXuzNee68r9xvSfbmypde3i/J
3px6xfglXHnOi7058YTn5vdLsjenfporL3qx9zoT6rM59dnPUXnLi7059d/P
UXnLi/24/57/vHPlLS/25rSv1+g5Km95sR8v59LmE/QcaW/J3lzrK0o7Nade
pfkRz++8+VUPHPnRDz4xe/D/vu5zL/rmj2anHPVL535+3dt6veVfzy/YP/sY
U761LZonws94fqH9/Xx7l/83tS+PeQt/H2H/De0fxN79Va5nTjntn9/8633W
4/3t/cvu1ymu9udy+SDfbOXOb49dyJNf7Kk3Pk9B9TPMAy74U4fr2cp8YsrL
nezNeV6ef4SfIc5zv0/z18yTHaU8e/hxu2A80NeF+7pw1//LW7/RnPkPz9/h
x+2OcWSXB+7ywH3da1q/1JxxbZcHPy7PcBx+MT/ezxOUnoyrlvyfjY/PP95V
7BmvdDnx43Ly3nlM6wT4rrdujDul9Se+L/y4nOvbfijzXVf82zc/bd1jy0e/
c/Jb935q32zvsd+57BOTe/p4lsvP8075TrdJN8rnuIp9mc9t9tYf7utSP51P
j9/m2Hseh3ple/JwmfN8zcmnk/IHnqx5T7jLw/P1vD/xPdWrk1QPeT+lvKbm
PHeXn3wf5oyTev4UP74v3l+Mt3Hd8z76kztP+Yt9y//nTYcc9rKD/MApX/7e
Pz9lcX7TJs2b42c8r9f+Zc+bU99S/kz2T7u+2T/25tTXNM/+bs3/hnPEeryz
nvj3dakHtj8z1H/szU8LzxHu+f3j2nxNymNpzv5k3y/9XscBeLL384Kn55Xy
FrLf3c/d85XYmw/f+3Vem/ebue157p7Pxb+v+/5Wnzy/POwPVO555B+3cWPb
D99HD5T27nJib/93tf5uX6fZ1inRfq0D7ffUI4brE7C3Dth/WesEGN8cz79X
zpnt3PUB/q/Xh8X8L/nxPa9HvUp5qxK3n+2D+jAt9dCcdWb4Ia8L9r4u3Ne9
Y1B/FvO/t6/BPc/L+898x6D+LPx8LnDmEe0He887w21/5aBeTXeyLu4qcXRg
PqnMFzd76wm3PePm9j+sbwve1s+U+WLsfV247TlfwfN01M+UNynxNP97hPJW
wdcrvxb9G/y8UnHP/nkfXNH6I65vfu7DfcQLe95n+Lcff0fDbc99/UDz9XDr
xnvO/ikn71Vz51OiPP6up9+T5iWfpXxurIvyfdEfdjnhtidvr/NQYe/yEK/N
qfc36TnC/XxZB+Py0D93+eG2J0+oy4+951vhLv8ftfU9ad7WeQX5bc66B5cT
P74vuO1ffuW9l/z6dF/3/7q3//j3T1l3T7+f8fUA+5cv1TqNYd6bhT1+uQ7+
KY91wK858cr5GFm35vUk2Lt9DfPwLMrJeJ+vS3s0v27dMaefvu6x2QWnb9vy
roPfJV944XM/dMxTFufnOt8Ofjyehr057dd5n2intr9z0O4W9rQv+6G92A/v
A89voq/t4fZPO0x5jZw3j78fz/9W1xtgZ/9wl4d6YPsfhn30hw73q5b5vvF5
lmoP97yVzgkt8872r3NCy7h6yBvAeGkqv8c5yTOw4nKGcd3C+34ujTvB36v9
O3xPepyT+m8//Tsh8JO1b4jvEPunXdgP7SLx28VpL2/WOSa0C49/wtP5VhtU
TnTzuA3c4zzomTjjKn4v2x7ucUv0tD3c/nlv2h5u/4yX2h5u/7xfbM93aOL2
Q3x5ROdBwNM4pNf58/w8LoG9OevJeD5w4lTy43XacH+3ku/CnPvxdzrc5yyg
lzn11n7gXldPHLYf+lXm6IN/6+P7Qof0fe3vppXA0cHrjamv5tg7nzy6maOP
/WwKHHuv60ZP+0dP83beUlwvbR2G69kW/SXiKe3P9u6PoY/XzV48H9edXfno
s6/50rrHlhnXxd79XvQ0H65z21u4+8O0N3PqX/p+cflvC/bUV/vneaTvC/u/
IdhTP+wf7u8U/t7+NwWOvddXc730neJybg2c67n8Z534iQ8fcbAefO+m973/
WQe/F7717//k1685+L1wWIsDaV206xvP/TCt1yVep3WPb9Q6ZOJsWt94a+g/
p3718VpXiW5eV8x9jvef9/Z14tbB/Wfqgf3zXrtH606Zjw/9z9TvLf1YuPur
+9r7NZ1XmNaBXKT1GHC/l4nPfr8z7u/+AOfupPMN07mE4/PLu3eO23M+e+1P
pvMKGZd1nm1fF/uLmz5wxtfSuYdJ55M0jwb3vAn7ij1uT/k8r3dJK5/nC2j/
tqd+vkTvd7jLQzk5T9Lc4/PMQ3tcl/J7nuIzA74YZ6b8tmcdv9+nlN/lGfK6
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
8WdYnpJXduWh0L7K+detnnldCvXjXNVn+iFuFzwnj4/RP7E9/pkH8zgk7QJO
+dL+QffbGXfzujWek+0Z7/X6OnRzXn3qh9fDMK5axv3a9TyuyDyRx6WJI2ep
ncI3tHYPp15uVH2Gf1f5OtDR6xngnsdn3ivNz3pejP5nqieOA8T9dD7IJnHi
/q16XsR3r8fmfZrWK17T9ByOV9f8M7RP+olDnZc2f0T1jfZ2vZ4XOqT1Y46f
ysOMnsvD8Z81efLj/Mzdj/JCr8WTH+dt7n6UL3otnvw4n3P3ozzSa/Hkx3me
ux/ll16LJz/OC939KO/0Wjz5cX3rfngv/5Q8+XF+6e5H/dK1ePLjvNPdj/Jd
r8WTH+ej7n6UB3stnvw4T3X3o/zYa/Hkx/mrux/lzV6LJz/OD0y86t8V+o5L
PPlxvpEV+VnR/FTiyU/KY+84thZfMx++/YR8+ImvmSfffkKe/MTXzJ9vPyF/
fuJr5tW3n5BXP/GYbz/k1XccW4vH/PyKS91PyLefePKT8uo7zqzF18zPbz8h
P3/iyU/Kw+84sxZfM5+//YR8/onHPP/EDe2n6HFG+dsTj3ngQ/52l3MtHvPA
cz8hTnqePfG18saXOKN+5lp8zXxT4T3icbPEY36qkFdqOfCUV2o58JRXajnk
lUo85qcKeQyWQx6DxGM+BH5r/0uvJ8p7kHjMnxD2N/Xn+FPy5Cfth+rlDP5j
O0rnOAR9iv6BJz9pP5HLuRaP+5LCeRauJ0WHEPfM+32FepLOJyr3lfLF4Ufj
vcuBd3utt+n2GgdOPPnpXOtJ9Nwna/HkZ7HeZjhe1P1onDnx5Kdz5RvpfjTO
lnjy07nyWnQ/Gn9OPPnpnH6c/Wj8JPHkp3Plf+h+ND6cePLTufI/dD8aZ048
+elc49Iq52Qtnvx0rrya3Y/GsRNPfjrX/Kx0WFqLJz9pXszjEmvxOL8W5rOW
0zwXfx/ilee5Ek9+Og/xyvNiiSc/nYd45Xm0xJOfzkO88rxb4slP5yFeeT4u
8eSn8xCvPB+XePLTeYhXHsdOPPnpPMQrz5clnvx0HuKV590ST346D/HK83SJ
Jz+dh3jleb3Ek5/Z8H5L3CvzgMSX8NzLPEuYj1gOXPWwvGfL/MX/A6Lh+VY=

             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.7], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
9IPqP4MXib4X/ok60YFqc0XgA7uJaut+W4gS5qHKougQtflebVeJDhC+mHcU
zYBfVMzz91C7w3Tf9qK31G+H8J1EvVR/qupOEa1R/ckqu4i+Fz5K5ZGiD4U7
qjxa9IlwN5VdRb8In6dyoKhCn6s8TfS76s9WeSbjUvXnqjxHVBQ+Fn7Pf1Wb
E1R2Ei0TPl7lcaIvhPeDp1e89v6jur9L7tvrAg/cV/QzfVRyH65V+VvJffUr
71VyP1yqcphoOz33cpWXibYXvkLlcNFOwn1V9hHFwnfrmT2LXid7qa6HaL3e
p6R+Kpbdz7XK5nt11G6rwBu3Fe7C2lCxLHAdvCGs1buUzef31nELHe8qeo6y
bL69H+uRykNFvYUPh/eK+go3KXu9aC3crWwefrPwNSqvFq0V7scaInpMeLDK
QaK5wmerPEs0Q/hSlZeIPhfupbKH6A7h7mWvBbcKf6D/+a7oCP3natl8nnF7
gcrzRC+rzQkV8wdkpdaS1YZJ1hoh+eqFxGPpNtaPxP9lbNE+jOmSr15V259j
+zX2U92X+H6EWwcbLf4hbM5tcra7n6ryhaztCavQHfHN6Jrx6Ihq+1ba9rbu
6Ppp21+RL98OtgVsk48G+2RXPWOq8MvBDvxE2n4xbL9Ppu07ey5rO8a3KnfP
WU7/QXiszj+etg7wemz/Tjf0KtHDadu79w6+A3xoM1T3SNr/AT8ZNsVD+C/B
LoF94tuM7ef4Lo/IWAfooHJmsDlge8C+PU+4fcY+ijlp2/I/ybntbXnbi0/X
fQ7K2R7zatpy8FEaxx1FRzPOVfdK2rZV/EPYQfED7p+zzXQrlQfkbOfZU/Wv
xJaRf8JuGXSPo9F9ci7vyPs8Pq8RuuavjH2Y+Fj7CL+h+iMz9um9lPbz8PvN
Dd8Xey523YMztuNi28XH0jlnu9Inqp8d6rH34o/FR4uNv3vOvsE78x5Tv4X6
U8OYGZW1nefXYOsZI1qbtj+5q9qcrWvH5u2LxafAcavY739psC+tCTYm/LjY
v6/QPU/K2T/cBXu8rvkp2JfQ7bCDoDu1j21Lxo+B7/rDtH0YjIXlafuUTsvY
7ttDZSfsfaqbnfV9uT/2fPS8X4Kux3N+DuO8R7gWvxIy9AmiTqLTM+4nfEDf
qN23YS5gq5uZtt1wVtbH36hslbOvhL5aGPqWZz+Ttm2aZ+ArwH/QOO15hK3/
+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
hbOBtwwVzoe5f4lwLsypYcKxcFPhIfg0GcP0v3BGeBfhi4WfE35B9DzPF/WA
n2Rte50rmpO3DfRN0RvwNvXXtsj1Bdu86onqFmznaiCqX7AtvpGoYcF2vY9F
H8F3ddwauR+7JHZHbImiNqK9RXthxxXtJ9q3YDvajqIdRIN0/dWx/eyLhBeL
Hszb/vua6NW8bbsvi+blbX+cL3o7bzvvU6In87bzPi6akbddeJroMdE7eetP
C0RT8tavuD925EdED+dtp35GNJM+Fm0TOx5mP75p7Jic/fOWpYjJOT52DNa6
2P7gVeiLseOa7uS75B3jtUL1o2PHI93Nd1H9Il2/hcbJJXnHTd3LNxX+M3ac
ZRo9N3a8Wp2MY5zu1/FlanN77Jg74pDezDkG4HXiC3S8Cd907Lga9PfuxCDE
toO1w98rvE74gdj2GuK6ie9urGNieJ5QuXvsuJpZKpvnbH8h5rqFKI09QmWz
rGNCkMF2yTreA7lrYc7Xtae/dd9TU5ad3hXumvKYf0+4W8pzYYHaP6n2h/At
hR8TPoDvlfO7HAgvVPtp2CJUfh78y4z5pcLnpDzOVwbfNPE450a2Yw2nDzOO
tWZer8G/nvKcOk/3r6jdYGRA1V+W8pyC78B/mGt/ZR1bD+/arPprU+YJS3V8
lY6P0bu9Kzxbzzxa+D3huXwz4S3hibp2fs5xTfDVXiofj20rOwXbWMbxhfB2
4sHw8V+QcSzZhODnx77BdffkbfPhe96dd0wasef35R0/QOzRJRn7x/lfIzL2
xxPHPjLjmDRiz/DxE3/7FXavYL/CltI3Y5n3X+HzhIfq/luq/TCVT9Mvep8V
Kvvo+G/shDnHR2FnOk54U9Zxn41ztpX9jr0q53a0H5XzmoZt6qyMbXHrhHvm
HG9PLPwD+i9p3ee6lHn1sPAOxFbQ59hliRFolXUMErLl4aLPU47bIT6N3IVP
hNsKL0o5vqll1jFOxFXtm3U8EnLj7qLXUpZLmZ/M0ykq98k6FoiYpnZZx7wh
W74SOX7y49hrJ2so62PLvOMOiVdck7W9sBvvDv9nnRNunncMJXGSP2UdC9lD
+NWsbbYHCv+cdezG6cg5wl2EdxHekHVM6jY59wV9QgxMrPpRKa9l22adj0D8
/5bCD6Ysi74ZO07h+IzXrkraY5R1Zjvhd2KvP1Vsair/iR3710jt3xKuLdxJ
+ISMbZWdVf4bOyZzl4zjXcsqh8OnY8epM4YXCNcTvoy1P+t8iCuQh1Q2VX2S
sc60E/NL5WdZ9+vIvHMHiP2/Urh35Hhoxja8gnj2rzMei4xJZAziPon/RPaA
hxAL/KHabI4do1vKeEwwNj5VeXiwmWM77xhs1Niq/9C5jthaM47Fh7fD40/K
OHaHOPTFuv9OyKB6N5KUiIOPdfx2xnyb2Pm/Yn+v7bHzq91OsWM72+ZsY2+n
8rLIvCWrNu/rOA9/yTtmmPe9Pu/4S74FuUebYucX7ZxxbHP3sEbcEXmcFDOO
Z+4Z3of44dPD/Yk9Pivt70QcOG1H5R373SftZ8PHyCtam3HsETFIA3OWlweF
77VXznZzfDK3RvZxDBYu6z3Hpaznllj7UtZ/i6KxKeu5NVnnp5DDQv7UzeF/
IR/lsbfGznUaE8befzlTYYzdEFnmZ6zmmaspyzkjI+cQvaT6+lnHTyLb7JR1
XCV6xI5Zx1KSk9JA+JmUbR1biR5KWe/YQjQlZd18rO55R8pj8roQe/U262HW
OTjIiuR23RC+BXkN56e9lpNXdVva8jk5NfhdyCPA93Fh8HUcm7Hv47iMfSUL
A8a/86bwURn7rV5IWx/Bl4TvCR6yW875UPiJ8GdNC/IzfiX8BPjFPs35Hrfn
7evpm7K/6GPhw/hueeehIFPckHduyJAwbsnJujZt2ZW8rZFpj3Xy5q5KW48m
B4FxPTpvf9PLad+Xd+LdDsxYVkBmwDdHLhgyBrLGpLxjs1hzyc/6gzUd+SLv
mDzWCPgAuWVLVA5X3Ud6/w+IT9Px6ynXoweQlzQ9st5ATtCMyDYJcnNuIr4t
7bykSSmPLcYY6zS+P/whxPuiK5GTRW5Wh7Tzm4jFX5w177oz635F38E/hL+P
PA/4yGfxf8v1f/IevI74st9i87rtdX6cyvdj5yisja0nkcc0LTIvYm16X/jd
2PkNv8dep1mvkS2Q5ZFJro7Mo/BHETOIvoIMc1Vk3xx+DGJqWUd6pxwDjgwE
Ju77x8DbmSPYJ5iP4yLr3MzTuyLbpRjzd0ZeP5inEyLLSMhQk/Pmmfi1iCtc
HuRA5DbkvX4px6STQ0J8NPmYyELk05FXhy6C7HdmZH0FmbBvZBmPOHli8Bkf
yEXIR+Rj4JfBX0v+A/Haz8b2F+FnwmeEn4c8KXw9+PpmB4z/ijwafFj4cfD9
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
NmXnrZ8TeBhr1rTEeb4l0WDWT7UZVPB+EPA82nwe6ubquod07/5V4/oqn644
lg9+RJ++orrpiXOTk6JlvFWBv5yrclVYs7Kqf1bUOsgiyB6vqJwVvht5+tOq
/r585yEF5+bD28ifal5yLgYy236iStUyePsgh9epOr+Ka8lVnl2xnLmVaFTZ
Y+qsxDGFxPR+H+bQD8wj5BedGyu8LKzR5G40Qk4MfLxDxfkXh1c8H8kX+t8e
EQfQVnQbsozan6T2BzIOKuZhh1QsE/7JPAvyCuOcfTcYV4yvkqgsulN17UWH
8W0rzis5WNS04vmwVZg77EdB7gdjnPHQteL1ZxgGohB72S/wW/gu3+S78F3g
6fB5eHx7nftW9YcWnE/SO9xndWjLWnFp4vzrfiV/xzFqkwvzsE74XjdXPD5P
KHtvC0ra3FpxfxSqXhf7hPsPDX05DN5ScQ4MMvjZFee9MGbblZ1Th/zPOjww
jOMBoaQN+4/wfVhva1UtU99T8f4qbUSZoscWz2UNjypeI5HD4fXwfL4RzjJ0
hbTKTWXn0TH20CE2Bz2iadV7mrCfCXu2bCpZzke27Rf4NXJ9Et4DXvA/3QK+
A//he8FjLg58phK++R2i8yrO/0EeRS+5Olw/MnG+OXmac3W8RdV9ck3i3PMT
C96/ZXDFuWkXhntzn6sT562jt5Lz3zJ899t0nztEt4tuFt0quoVvh5zAnBd9
GOQRePvHZcfxflL2/i+se6z58I8lgV+wHi4L594pO9Z3gcoZZec1kmOIjLM4
3Jf714M/Cb9fdjzwByrn09+it0Tvlh0v/J7K0bp+QBiH7Yi/L1su+Sw8H771
WNm5luR8wV9eDfzmOdHzQT5jTM0N44q8LPgxMtgtuu9S7lVy/uWM8M7IYu+H
OOEbkGVEZ5S8lw3zi3k2qmJZljFGLtpTQQ57WOWjokfKzqMkB5L8R955x6pz
JB8Unip6SNRKdbtXzU8m6Pg+0b2i60U3im4QXSxKBTmc/Qv2C2N4GPMsyO3f
lpxLB4+aqPpJovsZ14n3UblSNFnHU1jH6Vu+PX1Stsxwd9k5dGNF40R3is4v
eX+GQUG2ZO8h5MchOrcp6AhXCu8cbAt1g5xAP43g/wZ9n9zVHcJ3v0L1dYNt
YSi8MOgj6ChNSv6OyJnsH/R44OPw8+tEw0VbB/30wrJz+dBPt2btC/ImulEl
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
icfo/wNZZByw
                   "]], 
                  Polygon[CompressedData["
1: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
jL6NuRLoYyFfsm6XfuI1q1RirxqfMYfotlp8On078agbarHRtdU3NUeU/WZj
+XQ3OV7/Kf6GuV/i85MgnO4fPH/qweD14vv/qidn/VX0N4p/Ip52VS02v7a/
+NmFtfgU+hbiBdfX4oPoixivWrkS/2KUcr3mPm3Ouqd41vo8M3Mi/+P3+RvZ
1He9l+vdzNwf85JYXtxJPtW86KsY92ebEf3gi/oP4stvcLwtzfv1mWZ5TS8Y
/pW12PBi+6txrtWty0DWRDZDNke2QLY0v5Hjn8l+d5qXyHJdbsxCrNuA5UzI
jUOJT97MOW5B7jK/zTGCvo3byXl4vJqcBnMhtPd9znze/l1PTpO5TfpY+lr6
R+fX4nNrn5sDZS6UeK61EfqX3Xqeb3P/jPlsX3wofSnz2YyTa7Nqu07MtRzO
dd/EdR3aS4zaWLUYgViBMV1juxdU4rubX+lz+M/z2Ij/+gz6NZX4p+IJz9eS
86b/OirHX43j3sDxx20HHzup9k/60z94mv7iObVgCvofzr/GmYw3rdvM72Fs
xfjzY8XeNU5ivGStYg9uUE98/uV6ck7MPdGm0Lb4j/UaXMPxnHu9duzvdeuJ
j79Uj71vToI5hq81k/NgzEeM4alG8gWNmxs/n734P2fW4mPpb+mPnVYLHiwe
Zczc2PmFleDB4hkv15JDsmAj9vZS9dic2p760yPVE88391J/ZdF6fIz5mv8/
B2JT/RntSZ65jZFNkE3NBR5M/cjvyG++S+ZZ8/+Oyf86FrIc2yyPrICsOBz7
etd67AXtKe1hsUd9zovQ5+JaD6nHpte2/7UeO0/bT9td//vQeuIx95R1B9cT
M3dbMVOxU+1D8Vb9BbFWMdUdi70v9uh4+wLne3ow+bTP+hz57Jhvz/Vfy7Xv
jezENe+M7ILsimyHbI/sYG67cx7bb872V7Ht1chSrFsaWQZZFlkJWRlZBVkV
2QrZGtkG2Rb5czD1UH8PJp93MdYtjiyBLIlM1Ur9xDSt1OfcwblmNWcZmQ2p
MQfXkQbSRKbvxr64Yyj5N7ewnIZ1c5k/jMyITI4+C8tZkevoH4E+Gu3RkZvN
P0afnfYcyEeDyd//BPlY3916N/pPoe9UpMs5e0gfGULes36B/jfoexMZuRV7
d9RW8u8nayW/eQpzXZHpWsm/nqGVerD5kAXN1UbmRz53XOB4P3CsHx3bWLco
skgrOYOLIUsiS7SS4z0W7/oYJZ+/xv07tplYjTEZYzNnNoM/6UPoSyzh/+t8
1ksOlL/nlZxnU875Gsv/oj/Bcjf0/7F8Fv1Slpugv8TyGfQLHUvRn2P5MvqY
2lgs30PfkzF3mn5ya17gHG+bb8/63dm+Zp0Y+gvoe6APon+F3mB5PPoJ5tai
/0X/kbSPQl5xLHeupf2Rx+Fci3HfF0f2GE7+qef0XC8i77L9K14H23etG+vF
ZtZW/pb21/S3WX8S/Scjr5o/y/bbmnvK8i30R1nugv4Hy9PZb6F+bLcHWV7K
/9XkOE8hj3eSW/a4eX8lx0z8+U3xfK5tCmTC4fy+f1sLgYxs/ou1E2y7K/Ib
x92tFdv5U9qj0zcaUkOeYd3Ew/n936fvA+9HPzmq5qa+7LVxHxZGFkEWRV7j
HHdy3dux7Vft5OZO1kturTm6P9I/njUDLL8byrE8ZmUoz8Q3LPv8X6ey/Wna
6/QtZW4Dsir6l25nTRLtY5FP0b/gPAfQnqiTudk5+ljWHVfm5nXLXHACclc7
1+i1fd3O2OMY5LvzVju2uzb8d7S/97njvPN1Y0ucZSxoRMaAZsm59132nV7I
2Ek7Y7Fj8mK0F0da6AsM592fDTnCnKZ+ci0+6sUX0CfwXfvJMYC+I/upJZmd
ZZ/+kYczlszTztzqHGu+n3l/HZYjDWfsmNPxkHVLlmNrM+o73En/PcPxIRw7
fed8115HPqH9Ccv9WT8e5/wY/QP0/dDHQv8IfWxzefSj0T+zLoX+A829Qp/N
ubYfe1S7tE7/zN34Zrf245vqo+oL3d/OWOaYpu/zUDtj2XDxbRzTtJW0mfRl
T/Y9cD/0i1legrzazjvmu9XrJBbSLWOhMZFjvMe+v8gd7dgC2gR3076nndiD
MQjH0tN8TrlP21ojU56xX+mbhONewnaXIiv6PxjTQ1bwPUS2QbY1jw+Zq5Ua
0K1Ljdw1yIasf8Y5zXGdvie60bVZ7+P423PeJdHP9/6z/Bi5jWvYUd+a/q1Z
vwTr/sVyLv6nuZF5kHmRHTnG9sYd6d/ZMd33q599Hb/PYf/bHfu4nk9auXc7
+1x0cw/1v15FbuR80w6nHulatnvKujCW79D3X2S64fyPU3HOqZFpkGmRJx3r
e/E19DlmtpbB2qVWarteZ3nBUI71Wivvxqicd6ibd+Rx1r3tOIw80cq1es13
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
8EFtHG2bweHgo98gX4v1dOK7OsY5tv1cxqu7+8kl0sfR9nIMd+zWBpMbw/jR
kkPhyPD30Oc2lvRUK8/DguX9WqGb33P+Yq/s2UqsyJjRgb5LHOfObuxbbaX5
hpJbdEQvbXOM5ijzi7aNnCg3su0N3XBnTF1+/ytY/tEK9uPzNdNQ7C/tsMNZ
HtJOPoLY4MzFptKWchvjYV6/WIH/01/s82c3xzbe5timvW1s0THu6HbwbeMb
YpOrd4O/7Ic85P/dDWYnVidXlrEfY3zmNhoD0n+T89D8ppt7wXfEBMUCpyn+
mxix2PAEw4n9OAc69xkD0t4yRmRs6Px+uA/Fv82nuL4X7FwMXXt64k7wTzEq
samZhhNLMKZgrO5FlgezPKCd/CGx11W6wZeMBT84lFoKY1rGsmZEfmP9z+3E
xsYdDj5v/tGq2uXDwUvNdxKfnVn/ims4Ejnc58MxRX+9E26sN7vBMsU0jR2N
3wlWKWZp7GN0bWvf9U64qjYo719lOMc7ohNMbHXH2X74oo4V1+on/uHzI+Yr
nn1aP5jhmcXO1N50HzHbk3rxvfTB5PqR80fuvnVa4X6SA0puqjVaifGt6pjW
C5+E7Ul9J7tZJ34+XTv48GnlHbae3lpx42sXlN/N3+939jnPcbqb2N8jvcQC
xD+uL/642P9kBRs1BuD+7uO2j/bCtTVeyb2Uc+uvXnwkfSN9PGPNcn7N3ErM
eaZWfo9NkFlaibXLWWgs2pi7sYkdWsm9M0bxSHlGfDbE4/3fxMHFvv0fjW3L
4WWs3hj38+y/TSu5Pdf2Yjs7xju2a0OLR46uT9FLfo6xmi1ayX0yRiN2IIZw
Lcvr+sktlTNu3JJj+lonOK94r5jy7chH3cRv3F77wpjs+a3we8i9KR+F45k5
kmKwY/rctWOTV1maXKX/dXQ/sT9jgEf1o8u3dy/yuL66Nl+ZI50bjcHs0A9m
JFb0YC8+zfG9+OL65D2Ofc1QsPQu0kKuHgqWPtjOfFHzeWmHy875p8E52r1w
x1nHJN/cXv3UM8kH5bjt+L1RPzGW51vxX+XHEGP7uZP4s/l0U/bDF+i1e0z5
67yH3juPaTzFecL5YuN+ctnkm/LYxpecHx1XHV//FH9i/a/91O79jvzWSl6Y
871432oca5V2+sxZ9HnUDtEekRPlIefWTuwBOZ/u7IWPawv6L/K5pu/hTuZv
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
3dSwWbtmjZmxeWP0xkiskRD7kiP7/YKBid+s2Q0WbY6A3zLzm2Z+K2nVVomX
DiX+bLxZfgPrEa09EgPeuJPvVRlLNaYqv5Rc/+KBciGZW7pPP7E58fPzm+G+
kyNPrrxlO/neY6uV7z3JhyZ3l3OU/KjmnoiBi33rf4uPG3/s9TKn7i8mUQkH
onifuTzm9BgjlePe3A9zQKwN0ycytm+M35iTOZgbtfI9G/F1Y4rfdVIzYK2A
OZfrdFNDaO2gNYNTdZPTay7v1CzX66am0FrC9Vmu1U3Nn7lM5jSZ23pkiaWK
7+/XDHeF9q/4r1wD8jn7jS/57r2Xe5Z49SzleZZrwG8MykdpfYMxCGMPxnM3
66am0tiRMSSxbzFwc3HMITQ3zhy569vJ0ZijGe5LOS/kI1BsyxEmV4H80HJ5
ySkmH/3SnXw/stHK9+jMDRq3xGbNGfV4chtoI8inuUU3Na1vFTzD71/KnSAn
ktxIB3TyjPlsHehz0wzXgnO2fIDbdfJ9JL8jZo7EvM3YHhtVwh8oR8GGlXCs
yV3gtn5Taeuyj/VF1g9b+2POod/a85t74vfLtxL7/yfG1cnzukgnNQrWJliT
cIH4SSUcU3JNXdQMd5ScUnJLmU9n/p6xdXN+zeUwp2O4lRibuVHnF6zIHCnr
Kycr2JQcQRc2w10lJ9VqZTwzH8b/1W+m7dnJ9wD95qTX7PNv/MZ7bQ6W+S7H
DGVbv7O2WSffC/Q7hcboTmqGi1bOYbmHt+rke2p+R9F7ZC6OeLu11ObkGNsz
x+qYsr+1c//Ug7US592nk3vovfP7Z/t18n3DlVoZIw4ueKKcz3I/y0GhP7R2
LdwUctzJdSfHm1xvXovfeNu8XJP5NXP3gvUZ67d+znpEa+vMAZu6k3im39ob
rZ/8LmuirYe0LlKsb7diS4n5yXGxQyUcc3JfzNUM96scfXL1ee1+o9H/xf/h
BH3GSjhg5YK1vtWaVuMRxr5PbIYbVo5fuX79xqLcPsdV8j3fT9nmpn5yOYxH
yVmi/7FWLVwmCzZju8pB8GgjHH9y/clfJ9edY9EJvcS/HZMcqx8eSjzbMXvR
bmqGrRVerJvf2m9EblJ+c/MbrafXt7Cuylo86wPNv3O8WaKeb1/6jQD5/F9v
hivQb8jKx79sPd/KlNPf7w2YOzd/iW2YE+H34Px2iN9Acx9rPycusS/zX3xW
jcfvXp7ZPzqpIbF2xJxE4/XWx5i/5XcpxKfkD/Dd9DdeqJMaOGvfrBH6ppMa
LWuzrNmSY2Zxzj1cC/fMcDNc34tWwodprqE5JOaOiIG92kq9prW/1gRfJr5Y
CSea3GhDzXBjy//yaD258ubUm0tvzrycKN9UwjkqV4rfn/FbW3KGyhc+ey85
+XOWfAL5541Pmutujri5jOZkmIthzoXcuH5z1rlNjtyRuqnRN1fYfDq/5yzX
4kGV8Ble1Yg/IwemXJjmkplTZs7RP/XI9cQqRtTCteM3G/x2g99c8XsQcnDJ
XTtHwVP93oDfspET1O/K+c0Bvz2waSXftxnuhkNAf82cZXPsdutkbHCMWLmX
mn9r/a0XsVbImiJriawZOo3r37oSTlK5SeU29XseK1bCXSVHl3hXtRbuLmuT
rCGydsgapVObwav05+Xi3KURe1nOfP2fXdHXroTDX//FWiZzkM09tqbpl1Zy
cMy9seau2U6OkblF5hSd3Qx3rpy5cufO10nNirUq1rCYH+Jv6VxvDaRg1B4l
H8x8MW0Tv0nt3KeNskIvNbjGgOVUkE/LeLS1pdbYDNXzvTbx+DeM5zbD1StH
r1y9C3RSQ2PtjDWf1lJZg2XtlTVV5zTD5W98TC5fvzctF/oFmvi0u91wMsjF
0OvmexlyE+qzPVbLXO03n7VFnbMn66ZmyVola5QOaia+LKe08VU5COUi9Bt+
8kean2RdvLlHYmL7NMMtLse18WZrk6z5stbLGiVzT8xZH6mTeIW1Mda8WOti
jcwx7L9sJRz6cunL92G+n7l/4lvHNcOdL+e93PcvNcNF67ft/N6TtrX1Wda/
aWP7jRO/dSJ/kt9zeqOVem1rJa2Z3L+R75nIYXpGed/l9vKdkg//rGa4luVU
llvZ+Ilcs2Io8ucf1Uy8WI7/Wct4I5eZY4LfFxBvNx/EWnnx8yPpn6+SbwwY
/5UzazH0oVq4tNrdcGTIjSGHhrnh5oi/28k9tjbImh1rdawR0n4wx1NbW5v7
q05qVPVXrWlYrplv+fgNcfk/zXeyntn8cTnf5aSUm9Jvjss/eXQz8W2/SeC3
CQa74QSRC0TOjp0b8T/1P8RH5LAy9rpILdxWU3RT42ZtmzVsM7dT42YM3Bq4
g9l++ko4zY2vH9JM/F0Oc+Ppfm/ab9fpo25fzfeX/faX3/DxO5lyZ71c4oV+
z+3QZvID5EQ3X8DaQmsarWW0xvD/AVE1cGs=
                   "]], 
                  Polygon[CompressedData["
1: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
                   
                   "]], 
                  
                  Polygon[{{1647, 1148, 619, 620, 1149, 1648}, {3151, 3903, 
                   2309, 2307, 3856, 3754}, {1699, 856, 683, 682, 977, 
                   1492}, {1408, 827, 957, 1742, 1276, 1277}, {3781, 3779, 
                   3778, 2480, 3218, 2433}, {3846, 2251, 2252, 3064, 3650, 
                   2784}}]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwl0kkrhWEYBuDXMc9KJMlMEpI12RI2luzsWLDlBxh+gFgjysoQa4m1TMeZ
jCtR/AbXm8X9Xc9z6nS/39vXNrc0vZgXQliVE0Ocdz0+uVYQQg032cI9DvCU
I7zkJG85yxcu8Ie/smIuLAxhg5XcZh0P2MFzDvGaWbbrzcqD/YhjcpsI4dF+
xyTv+cQHpvjINJPM8IlZpuLvkjNn+Bw7+MIcX/nMt3huvjOdH0Knzpx82I85
LlPOdm8f5RUHecY27rOWWyznOvOZkGXzt3uYj52c4Q0neMHh2MF+7rCZ+/73
Fe9YbzUP2S2DzlhlH2Al+1jBXpazh2XsZmm8X7ZLibmVxWxmEZuoJjRSbWig
Vw/1TMT7snTl/X8Pf4/+QtU=
                 "]], 
                Line[CompressedData["
1:eJwl0mFEnQEUBuAvRbG4UaRR3FgUjaIoiqJyS1EUi8aiKGo2GouiKIqiaCwa
RVEURdFIimJRFEWRJNnYKBaNRT304/E6HO/5c8LN7+s6o4IgGKA8FARlVBKh
hmrqqKWBehp5w1uaSE4Igmb5jlZaaKeNTjr4yAeWWGSbLY445IIVlnmpL4U0
UkknTAavyCKT12RTRS455JNHIQUUU0QpJZTxyY0u9vjBGadcscEcs8wwzTem
mOQrX5ggSVciEcbNY4wywjBDDDJAP3300sMaq+yywwnHXPKddRL0hojnBXHE
EkM0AY/2KuSD/M8/7rnjL7fc8Iff/OIn13TzmQXmOWCfczZDz//wBCrgS1Q=

                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuCvaDS2VmyisaZRLIpFUTRK/VaUiqJoKhZlRVE0ikpRbBRF
URTFoiiKklgUxaIolkkmio2NRlF66OJxHF7vuTkva5pKPoYFQdBLKCoI8tng
J3t8Z46vfKKDMy445w+/+cdf/nPJNVfcckPoSRCEE8YDInhIJI95RAzRrMmv
csoRh2yzxQrLdNFJD93008cgA3zhM8MM8U7vM54yah9hnDEmmWCaKWaZYZ1f
HPODXXZop408Xbnk8JZsssgkg3TSeEMhqaSQzGuSSOQVCcTzgufEseTGIicc
sM8m31hgnlZaaKaJRhqo5wN11BKr771ZTRWVVFBOGaUUU0QhBVH3/3AHJSJL
Uw==
                 "]], 
                Line[CompressedData["
1:eJwl0skrxGEcwOFXKdugLElOLor8Aw5O+AccHB2UciIHd5dRRLbsa2NfI4aI
7FtK7o6uLlwkieeXw9Nn5p35vd933qa0qa2+NSWEEGclLYRV1tlgi2122GWP
fQ445IhjvnJCONFTzjjnkituuOWeB66zrLEWM4vp7BCmeIw+t37Ht/0aM0P4
0U791QlNyQ0hqan6rOn6prWaT8yzBVqhhVqnRdqoxdquJVrumQoKzS1gkw0S
zrMYnSs6H0ssk2CBOeaZZoZ35/qgxp5j3o8zwihDDNPPAL300U0PnxkhzJqV
b24e66zRFc2xPs+Lva9971HH9ERbNKnVuqV5WmV+wuvXdHepSR3VuA5qg8a1
TDv0y10365NWuodLMy+YNH+Cs+h3x/7/D3+BAFPc
                 "]]}, {
                
                Line[{1158, 1444, 734, 1157, 1756, 1358, 1159, 1757, 1359, 
                 1160, 1758, 1360, 1161, 1759, 1361, 1162, 1760, 1362, 1163, 
                 1761, 1363, 1164, 1762, 742, 1165, 1763, 1364, 1166, 1764, 
                 1365, 1167, 1765, 1366, 1168, 1766, 1367, 1169, 1767, 1368, 
                 1170, 1733, 1768, 1369, 1445}], 
                
                Line[{1172, 1659, 1833, 1171, 749, 1173, 1769, 1370, 1174, 
                 1770, 1371, 1175, 1771, 1372, 1176, 1772, 1373, 1177, 1773, 
                 1374, 1178, 1774, 1660, 1834, 1179, 1661, 1835, 1180, 1775, 
                 1375, 1181, 1776, 1376, 1182, 1777, 1377, 1183, 1778, 1378, 
                 1184, 1779, 1379, 1185}], 
                
                Line[{1187, 1662, 1836, 1186, 1663, 1837, 1188, 765, 1189, 
                 1780, 1380, 1190, 1781, 1381, 1191, 1782, 1382, 1192, 1783, 
                 1383, 1193, 1784, 1664, 1838, 1194, 1665, 1839, 1195, 773, 
                 1196, 1785, 1384, 1197, 1786, 1385, 1198, 1787, 1386, 1199, 
                 1788, 1387, 1200}], 
                
                Line[{1202, 1666, 1840, 1201, 1667, 1841, 1203, 1668, 1842, 
                 1204, 781, 1205, 1909, 1446, 1447, 1388, 1206, 1910, 1449, 
                 1500, 1389, 1207, 1912, 1452, 1502, 1390, 1208, 1915, 1455, 
                 1504, 1669, 1914, 1209, 1458, 1506, 1670, 1916, 1210, 1634, 
                 1635, 1671, 1948, 1211, 1655, 1656, 785, 1212, 1789, 1391, 
                 1213, 1790, 1392, 1214, 1791, 1393, 1215}], 
                
                Line[{1217, 1672, 1843, 1216, 1673, 1844, 1218, 1674, 1845, 
                 1219, 1461, 1846, 1734, 1220, 907, 1448, 1440, 1547, 1221, 
                 1549, 1911, 1450, 1501, 1451, 1550, 1222, 1745, 1913, 1453, 
                 1503, 1454, 1551, 1223, 1929, 1552, 1456, 1505, 1457, 1047, 
                 1224, 1553, 1459, 1507, 1460, 1582, 1933, 1748, 1225, 1637, 
                 1441, 1636, 1442, 1950, 1645, 1226, 1658, 1642, 1657, 1847, 
                 1754, 1227, 1792, 1394, 1228, 1793, 1395, 1229, 1794, 1396, 
                 1230}], 
                
                Line[{1232, 1675, 1848, 1231, 1676, 1849, 1233, 1677, 1850, 
                 1234, 1470, 1851, 1736, 1235, 1554, 1737, 1930, 1526, 1471, 
                 1555, 1594, 1578, 932, 1508, 1462, 1591, 1236, 1944, 1616, 
                 1463, 1509, 1464, 1592, 1237, 1945, 1617, 1465, 1510, 1466, 
                 1593, 1935, 1238, 1618, 1467, 1511, 1468, 1074, 1595, 1579, 
                 1469, 1619, 1946, 1735, 1587, 1239, 1472, 1852, 1738, 1240, 
                 1678, 1853, 1241, 1795, 1397, 1242, 1796, 1398, 1243}], 
                
                Line[{1245, 1679, 1854, 1244, 1680, 1855, 1246, 1681, 1856, 
                 1247, 1473, 1857, 1739, 1248, 1556, 1557, 1931, 1527, 1559, 
                 1558, 1249, 1597, 1936, 1749, 1596, 1474, 1250, 813, 1251, 
                 1952, 1647, 1648, 1953, 1252, 1649, 1650, 1598, 1599, 1937, 
                 1750, 1253, 1560, 1561, 1528, 1858, 1563, 1562, 1254, 1475, 
                 1859, 1740, 1255, 1682, 1860, 1256, 1683, 1861, 1257, 1684, 
                 1862, 1258}], 
                
                Line[{1262, 1797, 1399, 1260, 1798, 1400, 1264, 1799, 1401, 
                 1266, 1477, 1800, 1402, 1512, 1567, 1568, 1801, 1531, 1538, 
                 1403, 1621, 1620, 1947, 1753, 1604, 1404, 1270, 1802, 1405, 
                 1272, 1954, 1651, 825, 1652, 1479, 1614, 1622, 1943, 1406, 
                 1623, 1572, 1573, 1532, 1743, 1925, 1407, 1513, 1481, 1803, 
                 1408, 1277, 1804, 1409, 1279, 1805, 1410, 1281, 1806, 1411, 
                 1283}], 
                
                Line[{1282, 1872, 1691, 1280, 1871, 1690, 1278, 1870, 1689, 
                 1276, 1742, 1869, 1480, 1275, 1571, 1932, 1747, 1530, 1570, 
                 1569, 1274, 1752, 1939, 1603, 1602, 1654, 1653, 1273, 1755, 
                 1868, 1152, 1271, 1867, 1688, 1269, 1478, 1600, 1751, 1938, 
                 1601, 1268, 1565, 1566, 1529, 1746, 1924, 1564, 1267, 1741, 
                 1866, 1476, 1265, 1865, 1687, 1263, 1864, 1686, 1259, 1863, 
                 1685, 1261}], 
                Line[CompressedData["
1:eJwNyzlOglEYhtHPMIkWiAO9FRYaNVEaW2QQLKRynhaAm0BBVCq1kg1p4zpQ
cAUmnOLkee/9/7t6e9dqz0REk1Qq4iMdcZSJSNo57WiaBfteM3ySd37QEVve
bLPo7st50+7qse6wy14y4sddxa7Ss/f11ZsTPeOUX/d1PeDRrumbf871kgvG
7pt6yJB33xt6xQ3XTPyzrhuUExElLbLGv29dbxJ23/7jmyV3TzrLsv2sWVbs
F52jYA90nikqyh+q
                 "]], 
                
                Line[{1293, 1694, 1874, 1292, 1695, 1875, 1294, 843, 1295, 
                 1638, 1815, 1423, 1639, 1732, 1816, 1641, 1643, 1644, 1489, 
                 1586, 1615, 1934, 1484, 1520, 1540, 1541, 1534, 1062, 1485, 
                 1521, 1542, 1543, 1535, 1926, 1574, 1486, 1522, 1544, 1545, 
                 1928, 1536, 1577, 1487, 1523, 1546, 1917, 1744, 1537, 1548, 
                 1443, 1525, 847, 1524, 1494, 1817, 1424, 1296, 1818, 1425, 
                 1297, 1819, 1426, 1298, 1820, 1427, 1299}], 
                
                Line[{1301, 1696, 1876, 1300, 1697, 1877, 1302, 1698, 1878, 
                 1303, 855, 1304, 1949, 1640, 1428, 1646, 1951, 1490, 1429, 
                 1305, 1918, 1491, 1430, 1306, 1920, 1492, 1699, 1919, 1307, 
                 1493, 1700, 1921, 1308, 1495, 1701, 1922, 1309, 859, 1310, 
                 1821, 1431, 1311, 1822, 1432, 1312, 1823, 1433, 1313}], 
                
                Line[{1315, 1702, 1879, 1314, 1703, 1880, 1316, 1704, 1881, 
                 1317, 1705, 1882, 1318, 1706, 1883, 1319, 1824, 1434, 1320, 
                 1825, 1435, 1321, 1826, 1707, 1884, 1322, 1708, 1885, 1323, 
                 1709, 1886, 1324, 1710, 1887, 1325, 875, 1326, 1827, 1436, 
                 1327, 1828, 1437, 1328}], 
                
                Line[{1330, 1711, 1888, 1329, 1712, 1889, 1331, 1713, 1890, 
                 1332, 1714, 1891, 1333, 1715, 1892, 1334, 883, 1335, 1829, 
                 1438, 1336, 1830, 1716, 1893, 1337, 1717, 1894, 1338, 1718, 
                 1895, 1339, 1719, 1896, 1340, 1720, 1897, 1341, 891, 1342, 
                 1831, 1439, 1343}], 
                
                Line[{1357, 1499, 982, 1356, 1908, 1731, 1355, 1907, 1730, 
                 1354, 1906, 1729, 1353, 1905, 1728, 1352, 1904, 1727, 1351, 
                 1903, 1726, 1832, 1350, 899, 1349, 1902, 1725, 1348, 1901, 
                 1724, 1347, 1900, 1723, 1346, 1899, 1722, 1345, 1898, 1721, 
                 1344, 1923, 1497, 1496, 1498}], 
                
                Line[{2602, 2600, 2987, 2986, 2599, 2596, 3832, 2595, 2592, 
                 3831, 2591, 2588, 3830, 2587, 2584, 3829, 2583, 2580, 3828, 
                 3869, 3827, 2970, 2969, 2574, 3823, 2573, 2570, 3822, 2569, 
                 2566, 3821, 2565, 2562, 3820, 2561, 2558, 3819, 2557, 2554, 
                 2550, 2553, 3228, 3229, 3231}], 
                
                Line[{2604, 2603, 1957, 1955, 2606, 2605, 3672, 2608, 2607, 
                 3673, 2610, 2609, 3674, 2612, 2611, 3675, 2614, 2613, 3676, 
                 2616, 2615, 2617, 2618, 3677, 3679, 2620, 2619, 3680, 2622, 
                 2621, 3681, 2624, 2623, 3682, 2626, 2625, 3683, 2628, 2627, 
                 2630, 2629, 3016, 3014, 3017}], 
                
                Line[{3685, 1997, 2000, 3686, 2001, 3687, 2633, 2632, 3688, 
                 2635, 2634, 3689, 2637, 2636, 3690, 2639, 2638, 3691, 2641, 
                 2640, 2642, 2643, 3694, 3834, 3695, 2021, 2024, 3696, 2646, 
                 2645, 3697, 2648, 2647, 3698, 2650, 2649, 3699, 2652, 2651, 
                 3700, 2655, 2653, 3835}], 
                
                Line[{3701, 2040, 2043, 3702, 2044, 2047, 3703, 2048, 3704, 
                 2660, 2658, 3705, 2664, 2661, 3706, 2668, 2665, 3707, 2672, 
                 2669, 2673, 2674, 3710, 3836, 3711, 2066, 2069, 3712, 2070, 
                 3713, 2682, 2680, 3714, 2684, 2683, 3715, 2686, 2685, 3716, 
                 2689, 2687, 3837}], 
                
                Line[{3717, 2085, 2088, 3718, 2089, 2092, 3719, 2093, 2096, 
                 3720, 2097, 2696, 2698, 3721, 3018, 2102, 2100, 2700, 3722, 
                 3023, 2105, 2103, 2702, 3723, 3029, 2108, 2106, 2704, 3724, 
                 3726, 3872, 2112, 2109, 2705, 3253, 3874, 2116, 2113, 2706, 
                 3623, 3895, 2120, 2117, 2707, 3667, 2123, 2121, 2709, 2708, 
                 3727, 2711, 2710, 3728, 2714, 2712, 3839}], 
                
                Line[{3729, 2133, 2136, 3730, 2137, 2140, 3731, 2141, 2144, 
                 2719, 2720, 3050, 3840, 3055, 2988, 3424, 2151, 2148, 3351, 
                 3350, 3430, 3026, 3025, 2155, 2152, 3357, 3356, 3433, 3032, 
                 3031, 2159, 2156, 3359, 3361, 3435, 3039, 3037, 3438, 2160, 
                 3366, 3365, 3047, 3046, 3503, 3504, 2166, 2163, 3069, 3068, 
                 2993, 2992, 2167, 2169, 3646, 3643, 3642, 3639, 3638, 3670, 
                 2170, 2171, 2737, 2736, 3732, 2739, 2738, 3733, 2742, 2740, 
                 3841}], 
                
                Line[{3734, 2180, 2183, 3735, 2184, 2187, 3736, 2188, 2191, 
                 2747, 2748, 3079, 3842, 3275, 3274, 3877, 3085, 3083, 2198, 
                 2195, 3090, 3089, 3057, 3056, 2202, 2199, 3522, 3524, 3591, 
                 3060, 3059, 2206, 2203, 3525, 3527, 3594, 3062, 3061, 3533, 
                 3530, 3532, 3529, 3528, 3071, 3070, 3489, 2210, 3094, 3093, 
                 3492, 3597, 3516, 3515, 3513, 3277, 3095, 3097, 2216, 2218, 
                 2219, 2221, 3737, 2766, 2765, 3738, 2769, 2767, 3844}], 
                
                Line[{3739, 2228, 2231, 3740, 2232, 2235, 3741, 2236, 2239, 
                 2774, 2775, 3100, 3845, 3279, 3280, 3446, 3106, 3104, 3369, 
                 3371, 3448, 3537, 3538, 3109, 3110, 2246, 2248, 2249, 2782, 
                 2785, 3846, 2251, 2253, 3654, 3655, 3112, 3113, 3545, 3542, 
                 3540, 3546, 3450, 3116, 3117, 3454, 3452, 3451, 3289, 3121, 
                 3122, 2260, 2262, 2263, 2265, 3744, 2266, 2269, 3745, 2270, 
                 2273, 3848}], 
                
                Line[{3746, 2274, 2277, 3747, 2278, 2281, 3748, 2282, 2285, 
                 2804, 2805, 3125, 3852, 3291, 3292, 3456, 3130, 3131, 3377, 
                 3379, 3458, 3549, 3550, 3135, 3136, 2292, 2294, 2295, 2297, 
                 2814, 2815, 3855, 3854, 3660, 3661, 3139, 3140, 3557, 3554, 
                 3552, 3559, 3463, 3144, 3145, 3381, 3383, 3464, 3303, 3149, 
                 3150, 2307, 2309, 2310, 2312, 3755, 2313, 2316, 3756, 2317, 
                 2320, 3908}], 
                Line[CompressedData["
1:eJwV0D9LQmEUB+BTTmFlF20KCfun4hJBu+5NF4IaQmiKhoq2iGjrI/QRosXC
bC38OEFSYhY51XOHh3PO733fe+97K4en6clUROzQmY9IZiJKPOgX8hEFHvVF
NWGREruzESlvPM1FdO2ZZt+8R1f2ygt9PmVtDvgwD3in7MwSI/mYY44YWRtm
56hYX+ZH/ss5Z0ysbRcivtUvVu35k4f+Ur3gXn/HLS2aXMmvs+/U51hznxVu
ZFvuvsmGeZ2eZ9bUKs/6hlrP/oH3/gN8hSiW
                 "]], 
                
                Line[{3765, 2364, 2367, 3766, 2368, 2371, 3767, 2372, 2863, 
                 2862, 3628, 3627, 3629, 3635, 3636, 3000, 3001, 3207, 3208, 
                 2868, 2866, 3588, 3587, 3173, 3174, 3396, 3397, 2869, 3470, 
                 3180, 3181, 3401, 3402, 3475, 3473, 3476, 3189, 3190, 3420, 
                 3408, 3406, 2873, 2875, 3201, 3202, 3422, 3410, 3411, 2876, 
                 2877, 3427, 3004, 2879, 2878, 3224, 2398, 2396, 2881, 2880, 
                 3770, 2883, 2882, 3771, 2886, 2884, 3861}], 
                
                Line[{3772, 2407, 2410, 3773, 2411, 2414, 3774, 2415, 2418, 
                 3775, 2419, 2890, 2893, 3633, 3634, 3648, 2896, 2894, 2427, 
                 2425, 2899, 3215, 2430, 2428, 2902, 3779, 3781, 2434, 2431, 
                 2903, 3782, 2438, 2435, 2904, 3783, 2442, 2439, 2443, 3784, 
                 2906, 2905, 3785, 2908, 2907, 3786, 2911, 2909, 3863}], 
                
                Line[{3787, 2454, 2457, 3788, 2458, 2461, 3789, 2462, 2465, 
                 3790, 2466, 2469, 3791, 2470, 2473, 3792, 2918, 2917, 3793, 
                 2920, 2919, 2921, 2922, 3796, 3864, 3797, 2481, 2483, 3798, 
                 2484, 2486, 3799, 2487, 2489, 3800, 2490, 3801, 2927, 2926, 
                 3802, 2930, 2928, 3865}], 
                
                Line[{3803, 2499, 2502, 3804, 2503, 2506, 3805, 2507, 2510, 
                 3806, 2511, 2514, 3807, 2515, 2518, 3808, 2519, 3809, 2938, 
                 2937, 2939, 2940, 3812, 3866, 3813, 2528, 2531, 3814, 2532, 
                 2535, 3815, 2536, 2539, 3816, 2540, 2543, 3817, 2544, 3818, 
                 2948, 2946, 3867}], 
                
                Line[{3859, 2827, 2829, 3858, 2825, 2826, 3857, 2823, 2824, 
                 3903, 3151, 3153, 2820, 2822, 3302, 3415, 3146, 3148, 3387, 
                 3389, 3467, 3608, 3609, 3141, 3143, 2816, 2818, 3658, 3752, 
                 3896, 3853, 2811, 2813, 3901, 3138, 3137, 3560, 3562, 3603, 
                 3604, 3413, 3132, 3134, 3462, 3460, 3459, 3290, 3126, 3129, 
                 3749, 3851, 2801, 2803, 3850, 2799, 2800, 3849, 2797, 2798, 
                 3897}]}, {
                Line[{534, 735, 1756, 535, 749, 563, 1837, 764, 578, 1841, 
                 779, 593, 1844, 790, 604, 1849, 800, 615, 1855, 810, 628, 
                 1864, 821, 1798, 641, 832, 1807, 654, 1875, 842, 665, 1877, 
                 853, 676, 1880, 864, 691, 1889, 879, 706, 1898, 894, 721}], 
                
                Line[{536, 736, 1757, 537, 750, 1769, 564, 765, 579, 1842, 
                 780, 594, 1845, 791, 605, 1850, 801, 616, 1856, 811, 629, 
                 1865, 822, 1799, 642, 833, 1808, 655, 843, 666, 1878, 854, 
                 677, 1881, 865, 692, 1890, 880, 707, 1899, 895, 722}], 
                
                Line[{538, 737, 1758, 539, 751, 1770, 565, 766, 1780, 580, 
                 781, 595, 1846, 929, 930, 792, 606, 1851, 938, 990, 802, 617,
                  1857, 944, 993, 812, 630, 1866, 951, 998, 823, 1800, 643, 
                 958, 1003, 834, 1809, 656, 1135, 1136, 844, 1815, 667, 855, 
                 678, 1882, 866, 693, 1891, 881, 708, 1900, 896, 723}], 
                
                Line[{540, 738, 1759, 541, 752, 1771, 566, 767, 1781, 581, 
                 916, 1909, 917, 918, 907, 931, 908, 1036, 1014, 1050, 1930, 
                 939, 991, 940, 1051, 1018, 1052, 1931, 945, 994, 946, 1053, 
                 1019, 1924, 1055, 952, 999, 953, 1801, 1056, 1020, 1058, 959,
                  1004, 960, 1113, 1810, 1079, 963, 1138, 910, 1137, 911, 
                 1816, 1141, 1139, 1949, 1140, 679, 1883, 867, 694, 1892, 882,
                  709, 1901, 897, 724}], 
                
                Line[{542, 739, 1760, 543, 753, 1772, 567, 768, 1782, 582, 
                 919, 1910, 920, 986, 1038, 921, 1911, 1013, 922, 1039, 989, 
                 1075, 932, 941, 933, 1110, 1091, 1936, 1092, 947, 995, 948, 
                 1122, 1096, 1938, 1097, 954, 1000, 955, 1125, 1947, 1101, 
                 1102, 961, 1005, 962, 1083, 1006, 1081, 964, 1114, 1934, 965,
                  1080, 1009, 971, 1147, 1951, 972, 680, 868, 1824, 695, 883, 
                 710, 1902, 898, 725}], 
                
                Line[{544, 740, 1761, 545, 754, 1773, 568, 769, 1783, 583, 
                 923, 1912, 924, 987, 1040, 1041, 1913, 1015, 1043, 1042, 
                 1117, 1115, 1944, 1116, 1085, 934, 618, 813, 631, 1867, 824, 
                 1802, 644, 966, 1103, 1129, 1940, 1128, 1130, 1059, 1060, 
                 1021, 1062, 1061, 1010, 973, 1918, 974, 681, 869, 1825, 696, 
                 884, 1829, 711, 899, 726}], 
                
                Line[{546, 741, 1762, 548, 755, 1774, 569, 770, 1784, 584, 
                 925, 1915, 927, 988, 1044, 1929, 1045, 1016, 1049, 1048, 
                 1120, 1118, 1945, 1119, 1086, 935, 619, 1148, 1952, 1150, 
                 632, 1152, 1954, 1154, 645, 967, 1104, 1132, 1941, 1131, 
                 1133, 1063, 1064, 1022, 1068, 1926, 1067, 1011, 975, 1920, 
                 977, 682, 870, 1826, 697, 885, 1830, 712, 900, 1832, 727}], 
                Line[CompressedData["
1:eJwVzDEvg2EUhuGjGgaD3SYRBokPUQMmoZJqOuALHZo0rVSXajeJMFh06oCh
k6SjQfoH/AOjzUwipk52V4c7z32ec953vtY+upyIiCIWMxE/+JqKWJLL0xF/
chsJz05GFPhA3phnZWrOZSM20dO96Fb5nKzarfFdrGOoO5VnWOAt+wdv9s0H
yONbX5fnSPi1myc3BXMRh/jVN+QFtnjfvuvu2JziBCP9htzBHn+0Xxn/icCt
NzOyZPds9yHvdGX5aq7wJn/jDX7F33mH3/NP/g+UPCH1
                 "]], 
                
                Line[{552, 744, 1764, 553, 758, 1775, 572, 773, 587, 1134, 
                 1948, 784, 598, 1146, 909, 1950, 1143, 1144, 1145, 609, 1082,
                  1121, 1946, 937, 992, 1026, 1027, 622, 1054, 1858, 949, 997,
                  1028, 1029, 635, 1932, 1057, 956, 1002, 1030, 1031, 1925, 
                 648, 1069, 969, 1008, 1032, 1927, 1033, 659, 1037, 912, 1012,
                  847, 670, 980, 1922, 858, 685, 1886, 873, 700, 1895, 888, 
                 715, 1905, 903, 730}], 
                
                Line[{554, 745, 1765, 555, 759, 1776, 573, 774, 1785, 588, 
                 1156, 785, 599, 1847, 1142, 795, 610, 1852, 943, 805, 623, 
                 1859, 950, 816, 636, 1869, 957, 827, 1803, 649, 970, 837, 
                 1811, 660, 979, 848, 1817, 671, 859, 686, 1887, 874, 701, 
                 1896, 889, 716, 1906, 904, 731}], 
                
                Line[{556, 746, 1766, 557, 760, 1777, 574, 775, 1786, 589, 
                 786, 1789, 600, 796, 1792, 611, 1853, 806, 624, 1860, 817, 
                 637, 1870, 828, 1804, 650, 838, 1812, 661, 849, 1818, 672, 
                 860, 1821, 687, 875, 702, 1897, 890, 717, 1907, 905, 732}], 
                
                Line[{558, 747, 1767, 559, 761, 1778, 575, 776, 1787, 590, 
                 787, 1790, 601, 797, 1793, 612, 807, 1795, 625, 1861, 818, 
                 638, 1871, 829, 1805, 651, 839, 1813, 662, 850, 1819, 673, 
                 861, 1822, 688, 876, 1827, 703, 891, 718, 1908, 906, 733}], 
                
                Line[{560, 914, 915, 1768, 561, 762, 1779, 576, 777, 1788, 
                 591, 788, 1791, 602, 798, 1794, 613, 808, 1796, 626, 1862, 
                 819, 639, 1872, 830, 1806, 652, 840, 1814, 663, 851, 1820, 
                 674, 862, 1823, 689, 877, 1828, 704, 892, 1831, 719, 982, 
                 983, 984}], 
                
                Line[{720, 893, 1923, 981, 705, 878, 1888, 690, 863, 1879, 
                 675, 852, 1876, 664, 841, 1874, 653, 831, 1873, 640, 1797, 
                 820, 1863, 627, 809, 1854, 614, 799, 1848, 603, 789, 1843, 
                 592, 778, 1840, 577, 763, 1836, 562, 748, 1833, 533, 734, 
                 913, 985}], 
                
                Line[{728, 901, 1903, 713, 886, 1893, 698, 871, 1884, 683, 
                 856, 1919, 976, 668, 845, 1928, 1034, 1023, 1066, 1065, 657, 
                 835, 1942, 1106, 1105, 968, 646, 825, 1155, 1153, 1868, 633, 
                 814, 1151, 1953, 1149, 620, 803, 1087, 1089, 1935, 1088, 607,
                  793, 1025, 1017, 1047, 1046, 596, 782, 1914, 926, 585, 771, 
                 1838, 570, 756, 1834, 549, 742, 547}], 
                
                Line[{1960, 1958, 2606, 2002, 2001, 2046, 2047, 2657, 2091, 
                 2092, 2691, 2139, 2140, 2716, 2186, 2187, 2744, 2234, 2235, 
                 2771, 2280, 2281, 3899, 2800, 2327, 2325, 2832, 2370, 2371, 
                 2861, 2413, 2414, 2888, 2460, 2461, 2913, 2505, 2506, 2933, 
                 2556, 2557, 2952, 2954}], 
                
                Line[{1963, 1961, 2608, 2005, 2003, 2633, 2050, 2048, 2095, 
                 2096, 2692, 2143, 2144, 2717, 2190, 2191, 2745, 2238, 2239, 
                 2772, 2284, 2285, 3900, 2803, 2330, 2328, 2835, 2374, 2372, 
                 2417, 2418, 2889, 2464, 2465, 2914, 2509, 2510, 2934, 2560, 
                 2561, 2955, 2957}], 
                
                Line[{1966, 1964, 2610, 2008, 2006, 2635, 2053, 2051, 2660, 
                 2099, 2097, 2695, 3050, 2147, 2145, 3051, 3053, 3079, 2194, 
                 2192, 3080, 3082, 3100, 2242, 2240, 3101, 3103, 3125, 2288, 
                 2286, 3750, 3129, 3128, 2333, 2331, 3760, 3157, 3156, 2377, 
                 2375, 3768, 3628, 2421, 2419, 2468, 2469, 2915, 2513, 2514, 
                 2935, 2564, 2565, 2958, 2960}], 
                Line[{1969, 1967, 2612, 2011, 2009, 2637, 2056, 2054, 2664, 
                 2663, 2697, 2698, 3020, 2989, 2988, 2721, 2722, 3352, 3353, 
                 3442, 3085, 3084, 2749, 2750, 3367, 3368, 3887, 3106, 3105, 
                 2776, 2777, 3375, 3376, 3456, 3888, 3457, 2806, 2807, 3462, 
                 3384, 3385, 3158, 3159, 2838, 2839, 3507, 3586, 3168, 3169, 
                 2997, 2999, 2864, 2865, 3636, 3632, 2892, 2893, 3776, 2472, 
                 2473, 2916, 2517, 2518, 2936, 2568, 2569, 2961, 2963}], 
                
                Line[{1972, 1970, 2614, 2014, 2012, 2639, 2059, 2057, 2668, 
                 2667, 2699, 2700, 3243, 3242, 3428, 3870, 3430, 2723, 2724, 
                 3256, 3257, 3512, 3057, 2751, 2752, 3535, 3536, 3538, 3891, 
                 3539, 2778, 2780, 3547, 3548, 3550, 3892, 3551, 2808, 2810, 
                 3605, 3562, 3561, 3162, 3164, 2840, 2841, 3311, 3312, 3171, 
                 3172, 3511, 3588, 3509, 3333, 3212, 3210, 3649, 2896, 2895, 
                 2476, 2474, 2918, 2521, 2519, 2572, 2573, 2964, 2966}], 
                
                Line[{1975, 1973, 2616, 2017, 2015, 2641, 2062, 2060, 2672, 
                 2671, 2701, 2702, 3247, 3246, 3432, 3871, 3433, 2726, 2725, 
                 3434, 3590, 3523, 3524, 3875, 2753, 2754, 2250, 2249, 2296, 
                 2297, 3902, 2813, 2812, 3175, 2843, 2842, 3613, 3612, 3468, 
                 3400, 3398, 2870, 2869, 3335, 3214, 2898, 2899, 3777, 2478, 
                 2477, 2920, 2524, 2522, 2938, 2576, 2574, 2968}], 
                
                Line[{1978, 1976, 2618, 2020, 2018, 2643, 2065, 2063, 2674, 
                 3035, 2703, 2704, 3251, 3250, 3360, 3361, 3873, 2728, 2727, 
                 3439, 3593, 3526, 3527, 3876, 2755, 2757, 3650, 2784, 2785, 
                 3742, 3657, 2815, 3896, 3751, 3183, 3182, 2845, 2844, 3617, 
                 3616, 3471, 3405, 3403, 2872, 2871, 3475, 3337, 3217, 2901, 
                 2902, 3778, 2480, 2479, 2922, 2527, 2525, 2940, 2579, 2577, 
                 2970, 3907}], 
                Line[CompressedData["
1:eJwNz7suRFEYBeClcp0RDKLUolbpKFUiMhWJVkIho1PyDBJxiQiVhkIhXkEU
hnrOifAKHJPxFV/+f6+1d7Fnt/fWdvuSrPLcnzyxNJR8md+s2xsDyST79hbF
cLLivMyn/XEkuaslB84tfmQV57JLLriSX9Nwd4KeLPXk3WzzwYv+lbb+jTH9
OIWuQ0lX36PUd1gcTWbc+dVV/DE3mCzQ1VfcyG45YUPeZNM+7+2WWaPOsfyI
ex7Y8YfCLDm0T/n7NKf2M/4BTGEw9w==
                 "]], 
                
                Line[{1984, 1982, 2622, 2027, 2025, 2646, 2072, 2070, 2679, 
                 3620, 2120, 2119, 3622, 3625, 2168, 2169, 3644, 2996, 2994, 
                 3272, 3271, 3598, 3516, 2215, 2213, 3078, 3076, 3374, 3373, 
                 3454, 2259, 2257, 3120, 3118, 3382, 3383, 3465, 2306, 2304, 
                 3414, 3889, 3415, 3391, 3390, 2351, 2349, 3198, 3199, 3890, 
                 3395, 3394, 2395, 2393, 3004, 3005, 3345, 2442, 2441, 2485, 
                 2486, 2924, 2534, 2535, 2942, 2586, 2587, 2974, 2976}], 
                
                Line[{1987, 1985, 2624, 2030, 2028, 2648, 2075, 2073, 2682, 
                 2681, 3664, 2123, 3666, 3670, 3669, 3640, 3096, 3097, 3843, 
                 3098, 3099, 3122, 3847, 3123, 3124, 3150, 3856, 3754, 3153, 
                 3152, 3203, 3762, 3206, 3205, 3222, 3769, 3224, 2445, 2443, 
                 2488, 2489, 2925, 2538, 2539, 2943, 2590, 2591, 2977, 2979}], 
                
                Line[{1990, 1988, 2626, 2033, 2031, 2650, 2078, 2076, 2684, 
                 2126, 2124, 2709, 2173, 2172, 2737, 2220, 2221, 2764, 2264, 
                 2265, 2793, 2311, 2312, 3904, 2824, 2357, 2355, 2854, 2400, 
                 2399, 2881, 2447, 2446, 2906, 2492, 2490, 2542, 2543, 2944, 
                 2594, 2595, 2980, 2982}], 
                
                Line[{1993, 1991, 2628, 2036, 2034, 2652, 2081, 2079, 2686, 
                 2129, 2127, 2711, 2176, 2174, 2739, 2224, 2222, 2766, 2268, 
                 2269, 2794, 2315, 2316, 3905, 2826, 2360, 2358, 2856, 2403, 
                 2401, 2883, 2450, 2448, 2908, 2495, 2493, 2927, 2546, 2544, 
                 2598, 2599, 2983, 2985}], 
                
                Line[{3013, 3011, 3684, 3016, 2039, 2037, 2655, 2084, 2082, 
                 2689, 2132, 2130, 2714, 2179, 2177, 2742, 2227, 2225, 2769, 
                 2272, 2273, 2795, 2319, 2320, 3906, 2829, 2363, 2361, 2859, 
                 2406, 2404, 2886, 2453, 2451, 2911, 2498, 2496, 2930, 2549, 
                 2547, 2948, 2947, 2987, 3237, 3236}], 
                
                Line[{3230, 2552, 2553, 3868, 2932, 2931, 2502, 2501, 2912, 
                 2457, 2456, 2887, 2410, 2409, 2860, 2367, 2366, 2830, 2324, 
                 2323, 2798, 3898, 2277, 2276, 2770, 2231, 2230, 2743, 2183, 
                 2182, 2715, 2136, 2135, 2690, 2088, 2087, 2656, 2043, 2042, 
                 2631, 2000, 1999, 1957, 3239, 3238}], 
                
                Line[{3826, 3824, 3869, 3811, 3810, 3866, 3795, 3794, 3864, 
                 3218, 2433, 2434, 3339, 3338, 3407, 3408, 3882, 2389, 2387, 
                 3472, 3576, 3572, 3573, 3574, 2343, 2345, 3659, 3658, 2298, 
                 2300, 3855, 3652, 3651, 3653, 2253, 2252, 3064, 3063, 2209, 
                 2207, 3532, 3531, 3412, 3364, 3362, 2162, 2160, 3252, 3036, 
                 2111, 2112, 3838, 3709, 3708, 3836, 3693, 3692, 3834, 3678, 
                 3677, 3833}]}, {}, {}}}, VertexNormals -> CompressedData["
1:eJzt2l9IU30cx/Edw2FB9FiQQsOywgihqKQbF78LxTKebh68qiCTnif6g8v+
X6xGIolRGcsYVjwY3q11ocEaMviZ7qZyJFhQwU4O00Qr50VISPWQrQX6HHS6
o2f63s3gdc6+v8/vbPue385Zdpntr79TTCbTn3+YTItMWo+IwHEcx3Ecx3Ec
x3Ecx3Ecx3Ecx3Ecx3Ej+9DtKveK4AvZ9a225JnZK3ta089Z1n0S1V/ufB+u
OekPhqz7Kz+/lik3t2xWxUfD5cdxHMfnt7e+OVZUkBWKba8ofNKR6vigub+i
2EbTtoXE0pyRneGia+Jx4Oz6wPnf+7dH652I1hnK3OWRF47LEk+Z8j5DFeY1
ryIvd2jXj9f3RDLTbY2H5cYzI2puX1iqN8yrb10eEKcPFjZWr6yxTrVObsU7
Z21+WPTmPM+2u+5L6xKl/Gr/gLhX7GpJ89j9M82ZaN+kFDQd6n4rHXfd7jo5
+Cu/7BmXP976eRZ7W96+6yLra6fzwcVucWBx16PA0cE5m6+3NL73Ecfx2fcr
D7dbzMurJvRJ16iveVV/3Yz7Z/tYH6g3TB/QyrP76ZEGn1+V3vKtGWubfLJl
2FkZ7P3dPzf87NviUrRvn0ot7mxu2zvleS0bO6/VTziefoMdHxzHcRzHcRzH
cRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzH
cRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzHcRzH
cRzH8QS5xHEcx3Ecx3Ecx3Ecx3E9vPrLne/DNSetwZB1f+Xn1yLl5pbNqvho
uJw4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4juM4
juM4juNarii20bRtIbk0Z2RnuOiafBw4uz5w/oPhcuI4juM4juM4js+VD92u
cq8IvhBd32pLnpm9oqc1/Zxl3SfD5cRxHE923xPJTLc1HhYbz4youX1hod4w
r751ecBwOfH57bkV75y1+WHZm/M82+66L6xLlPKr/XwOcRzHcRzHcTweb31z
rKggKxTbXlH4pCPVkfj/IbRHxzmhU/3Z9jyLvS1v33WZ9bXT+eBitzywuOtR
4Oig4XLiOI7PlftLCxurV9b7jZLn9MEfeWoMkwfHF7JHr+uKHq7rxuWuUV/z
qv4660zr3Ct2taR57FOu065zPx/K3OWRF46LEk+Z8j5DleY1ryIvdyT/7wUc
x3Ecx3F8bl3vdSyO48nvm5SCpkPdb4XjrttdJ7m/g+OJcG8p1+FxHMd/+JWH
2y3m5VUzvp6fLL776ZEGn18V3vKtGWubfKJl2FkZ7E38+mrDz/WbvDTN9dup
1OLO5ra9Mz5PLRu771y/YN5fHMdxHMdxHMdxHMdxHMdxHMdxHMdxfdwoOXAc
XzgeERr7Jcp1ns+0c+E4Pu991vpPkvZnvccxbP83yPk35nod/9n6/MTm1ZHv
+Offhj7563ky16qjNW709UKj/gSfZF4TcozLKSZzrTpa44/LOalPdx7/73p/
T+Idx3DfQxzHk9Zj2/VeZxpk/Ybj+AJyvddjU87zH4nY6/U=
              "]], {
            Axes -> True, AxesLabel -> {"x", "y", "\[Psi](x,y)"}, Background -> 
             GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {-0.7334464586120832, 
               0.7334464586120832}}, PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> 
             False}]}, $CellContext`ProbPlots = {
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJx0XXVcVksTBhFExe7uvLbY4q4tdnc3CnbHtfXait1d2IUFntfu7sZur10I
fGdn9nm9Lh/3n/Nz7rrumTM7O/PMM/tmad+zfqdYLi4u/eK7uLjZz2JBiS9G
RSVz4Dn4Zc7Cnpv8haNawsyB2ZNEk889nyqsWqCXUz5XyzfFTzYy4I6HU37p
M8uP0jyujhJa7jI8N8lP0fivVk0tP5SxDMnzeSn5M2uplpeoMZbkZR7UmRoV
dSXksZYv7nuY5Kl5vDDHWzy/MOe3eD3SXM96Xr801x/I7yvN9z3I+pGmfvSf
Y5I7oFdTz3ie0fJ5Ws+Qn5W5SH5D6zlMy0VgNZKLWqxnn1osz5jiajEl92/K
eq49muUlbqQNUPJ6PZKTnoPrJyJ5nNDCVeKq7zLg4LK0tp4PuiUm+c7cCyOV
3IfHC3N8e55fmPOX5vVIcz1XtJ7N9c/SejbfF3o29QM9m/p0fietv7mGnqFX
zP/XBf4znk77KcV6zu+ZmuStO+VopORHUiQjPb89n4nkk8a0KpxAjU/XifS8
sf3fJF8Rd1etarY8ToVpo5Sex1z+8FDJ509Y0LfQZn/x/p5S9JWQXk3yP1by
OAk3rv1iyz+Vp/HCHL+b5xfm/Ad5PdJczwFevzTXn4vfU5rvCz2b+oGeTX1C
z9j32C/4rrBTfF+sA3rFeh6fy05/xjNj4MPEKW15edcXWZSem26aNFrJoZ8S
S3ctU3ruQk8PxwnvAd0OHvUXFT75JO1h67njZ/X0cEzwPba0VMYAcXrWlPdx
Nn0rmzXLxL5K3mVexaJluwWIzDxemOOT8vzCnL8kr0ea67nP65bm+vPw+0rz
fe9rPZv6gZ5NfcJPwY/CX2FfYd9jf8EOYKewB6wbesX6N1d80E79Gc8smSfl
n/feXzzwS/e0t63nNTOvdp9jy+OX6Nd3cIJeovr+oPOjbD1XzuTSYoUtz9uk
QOt1lQYI74tD1zRsUdZn9NNHwzfa8u/7uhctPGWo+HaUxovbGfX4Rjy+dyea
X2D+ziV5/sy8DrlNr6eoXk91Xr801/+S31ea71uG9SNN/Wh9SlOfOCdwLuG8
gF+DH4V/wz7Evsd+hN3ATmE/eE/oFfr8+ubSlTX2n/Gss33Pyvl/jRZ9m1/y
7H33mXX7rnp+tQp827WjZdRiMWbRidD6/Yb5XHjRLWf6e1+tokeKNMv1ea2o
moXGi7d6vFViN40/tJvmFQNf8fxbs+6l+cdOovVIrGe+D6/n6RJavyyt138R
6+f3leb71mT9SFM/Wp/S1CfOaZzz8D84V3Au4XyBH4QfhT/EvsW+x/6FXcJO
YZ/QI/QKfd67kGeka9gzC0/fb1muBpU7KN5f25Gi8vqNPpMaH17x89EzK/vp
sW6Hn5wUPidonBiR8i8aX71xZhqf4PZFNb/wFjx/6s37aP6EUVHN7fXIGno9
CcN4PWk+0vqlt15/heq8/n78vtJ8312sH2nqR+tTmvpEnIS4CfESznWc8zjf
cQ7hXML+gt+EH4X/xD7Hvsd+h13CTmGf0CP0Cn2qc3vvxhAfPBulzPf3P/Ov
io7Zj6jxYu6SITS+2csxNP79eD81v+haKt3BywOm+JSMKEHz59xK65GjL/29
puGYmj6HSwfQeupmoPXLVr38Pru7uvn0XMDrb8bvK833DWH9yJlvh4likb/1
o/UpTX3CnhGHmvaMuMm0Z5zzpj3jXII9w2/Cj8J/Yp9j32O/wy5hp7BP6BF6
hT4fJKDxzmft3RlpfPgttueSg3j+3f5sz5W0Pbc/xOvZcJfXk1rbM9Zv2rP5
vrBnUz+wZ1Of8M+I603/jDjU9M+Im0z/jHPe9M84l3AewW/Cj8J/Yp9j32O/
wy5hp7BP6BF6hT6P6nnxLD6J5++m/fNLvZ7n5Xg9T7R/TqTXb/pn833hn039
wD+b+kS8gTzJjDcQ15vxBuJQM95A3IT9hXMd53xRI97AuYTzyOk3td3Bf2Kf
Y99jv8MuYaewT+gReoU+M+l14OlrxBvm+hFvmO+LeMPUD+INU5+In5F3mvEz
8iQzfkZcb8bPiEPN+BnvgfXjXMc5D/vBOYRzCfsXfhN+FP4T+zy1MR52+cSY
H3o014N1m+tH/Gy+L+JnUz+In019Qs/I4818EHmnmQ8iTzLzQazLzAdhF2Y+
iH1p5oPwi2Y+iHPJzAfN8djn5vywS3M90KO5fryn+b7IB039QM+mPqFn/D0T
34DcxDcgN/ENfGcT38A+M/EN+DkT38A5g/MF5zrOeRPfMMfDb5rzY5+b64Fd
muuHHs33xZ9N/UDPpj4NvC6ank25gdfJGPA6GQNeJ2PA62QMeJ2MAa+TMeB1
Mga8TsaA18kY8DoZA14nY8DrTH1Gkw8ZnOh7tcCkDjxN/Zty/WcZw/ho8qIz
T/4s/fS6haf352oFZ7pcFAXKn1Z/FoXHsrxjEMvxZ/x/yPN585/xnN2W5Sua
7z4dkT7E53b+Ux23PLsu9l7/q9yTnJfN94pmV6bceK9o8pj0ZuKfxnin3IX+
uxryLZ6l1mklvJ+f1ok/4/9DjvfB+5nvFdP3Ndd/M0nijtl9kznwNOQyBjnG
m/NIU473jGl+Uw8YF9P6Y/h3o+nZGB/NbmNav/nvvpud8HrUiN+4tEPL60Sl
3hsVlcD570435Bjv9Rf7t8NXkx+NivJ0jl/0nsff0/KrevyuZGVJXpzGuTmK
6/Ev9/I8EzexPFENHr+1wbSiSt6S/t0ISyCeGlyQxu/Kkobk2dvx+BdLplVX
8qY07pPVVo+/71eL/VLiJCTvGszjN85ou0rJl9O4x9ZaPb5i4ik0flRYEpLf
6Mp53rDT5Vqp86Lct7+7/YraGq1OsZjnEeY8PT+/jrj6fasTb9+lz6PhPL/A
/EP1/I15/cJcf0pevzDX35z1I0z97GD9CFM//J3cpKn/f1j/0tT/If6O0vy+
d7Xc/L612U6kaT+Qm/aj7TDafoHctE/YLc69p8V4Hkvbp4eO7xZ7BpD8+Ae2
w3MfWT49/GRVGp8rGdnb1NfpSD64X/kj8Wz5/GM+ZFeNqlQkee/vES2y2fIE
S4aT/awod4fkz8flbzJancuDW15SdpKlYppHSt74WHgaXzt+O9e0u/3h10fD
/0N4vDDHx+P5hTn/HF6PMNdzkNcvzfUf4/eV5vse1Po39QM9m/qMN4f1fFnH
ETNbVyL5zLxpSM+VC7B8bqECNZU81C0z6blR8Ywk/9t16KvEtnxGF49LSs8Z
QpuMUvLO/x6/426/76OQyseVnjN0GTJVySssbvF+ZLC/SFos0U+l5zefGoco
+Z3DtUtnuOMvLnt/rePi8sRya94lo8JR3u9a+nFfrgDx4lHmeJ6bwp34f1eN
X13k8cIc/8Ob5hfm/Jd4PSKjsZ6pvH5prj+E31dGe1/WjzT1o/UpTX3enc96
3laT47K0K8tRnHnBNRPpeeXjJCT/lGvox/hqHy1YeUzp+WPukpT/LZ6zZUg5
ez1u370/Kj0PWfm4vJJ3f1fHv8oFO47tXn6bq0ukNbbGonGzbLlfs83+QzL3
ED1HbVzj7vLZylVwRZf5Cld/GfCg2qLe4uLFG7OT2Ho+v6/1spWqXuD1cNrC
twPE2wdN7jdc9Bv//6rxwLR3aLzopceviMfjh4yg+UUCPf+YVzz/y660HjFe
ryduc17Pvm+0fjlUr7+XXn9Vfl9pvu951o809aP1KU191jrBer5Zm+PcPGFL
Oyl5zvidSc+vg+qSfIQ1tVFJWx5V1eWm0nP1c19nKfnjohGZAg/Yec26o+Nc
XWI7lqXuerinLd+S4+bmWz17iHP3R39Nbeu5cLlnrcfZ8qW1562rtmGgCD5f
ZHx1W88nXWMF3bTlO3ZMOf4j8xQxZujaj49sPRd+HH/I+LtfLVn8yre16ZeJ
fKFFXtcf9Bv/L6TxVUcTGi9K6/HLmvH4/EtpfvFvlCvNn7nkVJq/5CFajyjv
w+upMpbXc2oVrV8u1+uvl4fXv4XfV9bU7/tMv2821o98ZehH61Oa+twxPBHp
2asC52fnEi7Ops61snGG71N6TnuuIOXH1Y+K9c+U/+ySJbOLS1zH/cS/7hAe
7l/W+/on29+uWhUcx9Zz2W5D3g+05Q4rrMcrvz4iReVuOfvZem5b+9HsO7b8
7rejxeMHTxFDXl7d38j1szWkQ1rR+J49f/oNWzK4BIkT97q0cIv9xMq4+U3e
DmHPrPZVl78t09QhbsRtXPDYf/D/LBqv7lqhqxovspx8S+NDKi2j8dtz0vzi
1wqe/1iWjTT/sgN+aj0iSSVeT61CJ2g9F2fS+mUxvf7jT3n9dTrT+8pr+n0f
6/ctwvqRpn60PqWpz5WpE5Oeb6zq5VPCzsOSFIk6quS93brtV3oueOjkgIMN
roR8r78uZIi9X87u7txK6XnQhdHxvWK9Krv2Z81zK7IFiKxpTn33svXcIW5w
/fLX8/vsDS3cOyRzf1GpX8W8h5Q93z+3KdbcLj4ZTrYtkX/8HNG/xO0lxWJ9
tgbcjjM0t/csnxme88p3TbhbrLm1Y3bSOE9ExNUrVRp33e6zrN7N+omtM6Ku
7y01XoS8mJTHMXW+T4oWC2h8so0V1Pwi/ddYm2MtGuhztGcHmj/hr5NqPbLo
0aVTZuz08RmTuwitp+NOWr/0yzlp3MmvX8r2C+f1t+f3lQ9b7804zn7fH/p9
tX7kiRolJvaI/K0f2Of38owHmPbpwfoXpn0e4u8lYJ83V7J9jupJ31dIbZ+z
K7F9zhdkDyK95zGyh2NJr5F9ni1O9iOqXlxP9lMjguzNOuQg+xS1ZrO9jb2U
gewTeH5jjee/aedH9nnkDtmn2DBzKY0/VIft88tpnn/RkCCa/562z2eteD1j
U7J9vtL2uSeA1//qCa+/trZPvK9pn6Z+YJ+mPuFvz7N/EKa/DWN/Ikx/W5D9
jzD9baOU5K9E55zsr+7dY3+7Jyf5N9F8IPu3DqfY386eR/5QHKk1jfzhuJbs
b/2vxlP+U9T75yb5T3H64tXLg37j+cU0nv8uiP1tIz3+TmkeH3sD+9s5ev6s
K3n+VNrfxs7F6xm/gddzQPvbGXr9sfP+6W/z6/d9bvhbUz/wt6Y+ET9s5PNO
mvHDEj4fpRk/vOLzVOI8ddfxQ0E+fyXO33I6fhhZjc5reajFn/HDoSx0vsvY
rj3ofG+t44crcykekNU3czzQ6NabQw1X/cbzHRrP73aT44dY83j81w08vr2O
H/br+Z/o+ZP7cfzQX6+nXUtez14dPxTQ6x9gxA/m+yJ+MPWD+MHUJ+Lh8xqX
MuPh8hzvSTMersfxoTTj4eQcT0rEk491PPykM8WfsqIRD3//SPGqDNfx6mEd
D09oQvGtPLtbx8Pzirp6uLpHw/Ov6Hh4vDH+u46Hv+n5f+n5L+p42FwP4mFz
/YiHo72vjodN/SAeNvWJ/A44n5nfxdI4tpnfneJ8R5r53UTOj6SZ39XlfEqa
+d0Czr+kmd8l4XxNmvmdiecjvzPHI78z50d+Z64H+Z25fuR35vsivzP1g/zO
1Cf07OTfGTgP5MjTgedc1nLk+8BtEjBuIIEbAJ/JyviDBP4AHKYz4xgSOAbw
lmuMh0jgLbuCHoRv+LDVieeb+AnGAz8BTmLODzzEXA9wD3P9wDfM9wWOYeoH
ejb1CT2b+JuBs0ngJAaeJoG3GLiZBG5j4GMS+I+Bg0ngSAbeJYFTGbiWjAHX
co43cCrn/AYe5VyPgTs512/gS873NXAkp36gTzyDDX2mf5hwSsCdJI5vef+0
2zb5E1W4Uzypw+UT1x36abvdN5Rx5e9jh9N3T5Oe7bbcnURbgt8mdVxrvYr2
15LrrM9ODRl3rX980ID/6tMxJ3HawNXJHM89cnVX8tglB5I+Hxk4Iez2gI5D
b19ZRfHSpcesz3ZeiWj9JbyLtVbjP8fWdluI139gb1pvJa+u9TlZ4+LLJpT8
Q5/rj/H66yTJ9Yc+b2jceJWhz4+dU9fM7pvA8cjwt3je/ehP8mna3248kCb7
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
8P1Q30W9F3Ve1CNRn0Rdcoqun6Gehjra2B1Zuyp+2OX0nUsqvtj8GjePK/6G
5/INNRWfqd4M1/6K37Q+fZaeij+D+vEXg/+Geifqn6h7oj6Heh3qdCvjukxX
vKigND2nK57U8IcBLRVvB/XRuQa/C/U81PdQ1wNPabjBUwJvGPkR6qrnNM/1
rM6zVmi+a7JTyYiXmXTXTcrX0pc/SryC3PmSXVE8wvIFx1Le96lm8QaK1/Ex
2bRfvgdeWsWjqk5VPLgK6//27fnsgJPXBZ4X+F3ZC28fpvg0C4flbqz4Ne09
fLIpXk2R4EORiv+R5m1R4oO8+twrSPFAXnXbS3yFe/14nUMe7SXewjNdX0e9
HXV21IOhB9SFUb9EHoc6JvjTsw0+Evi+4P+C95v8K/NTUzRjvmq8RczHmOI+
j/iUo8+GEb/y6oW1xIcZ6Z6mneL/PQj1+qz4gI6H0xcrPlKbQucvu4cdtzx7
TZ2h+G4zi3hUUfyuuvdW91Z8l7RjH85S/JcS76o8UryXKwGTiJ/x9QzzNZqP
yEg8jWmaT1BM8wvAK0D9G/Vw1MFRr0X9FnVb8GvBtwXPttg85oPe/8n80Nma
F/rLcwDxF4tG9iM+Y4GCCYl/lSjrs+eKnxd07dnVkcTPOScVn+0Z84nltebM
K3HVvGLwHsCDAP8BdXrU7VGvR10ZdWbUl8FPBV8VPNWAKsynvFCb+ZWTNH/M
r+he4gvGusL8wez3pxIfr4zmW4B/Ad6F5v1L8AXAE0A9G/Vt1LUraL4m+Jvg
bebUfMScmp8IXiJ4BuAdgG+AujjiXtTHR2n+IviM4B9m0PVyxGmom6Nebp6n
RhzilKP+jXo46uCddd0adWzUr1G3Rh17rK5fo/5t1q9Rt0YdG/Vr9Fej3xp9
1u5/rt8ZL6Gub9apjfqvc7z7n3GFU446NOrSXsZ9Taifo26OPhyc19Az+KDg
h+K7gO/Y3OjXQN8O6ln4vug/QT8K7CGF5pUu0jxT8Evzad4keJTgT+7V/T/o
B4J9oo8FfS2wZ/RdoA8D9r+5HO0Xce4J81i/7+L9UqIS8zJHN2CeZqGzvL/A
I/TSvELwCdF3hD4k7F/0z6CfBvsd/R7o/0Dfx/Je3J/QqCX3KzgSsD/xTkP+
R1wb8lz5H2vd6tPkfwq86E880c2l+hNvNHxdAvJXmaczr7Gr5jlW1fxG8PDA
ywMfD/1R6JeC/0SfD/p+4G+z6r6UUrpPJZ72z4UHkD935GV/bnUYwP78V+41
yv9bLceQ/7e2FWf/3+YenRfi6spp6ryw8m1wo/NieUBqdb6I42MSqPPF8lw3
lc6XnOfnEi9z80c6j6xJn/k8yv+eeYTtud/CSreSzy/w3sCDA/8NfV/A7XFu
on8JfGmcs910vw36b5Lpc3lXXzrHHXP6ch1h5C0+xwNe0LnvGHCJzn3r7f2e
dO77e+xQcYLl+SlXY+LjW6UpTkgzb4qKN8SKxL4q3rAi646geCOiTFIVn4hY
1Sg+sXZ6lqb45PQmimfsc5/iGSvvFo5nzmo+n8bzrSKa1wf+GeoaiJfAlxpl
8MPR/4Z+OODG6ONCXxfwZ/QdxdZ9SMCx0SdTfkod6ptBvwz6Omq7z6A+D/R3
oA9h6A2/yaovAf0I4DE7uuQnXjP4zODdlghlHi74t+CJZuvPvFHwRcFrBM8R
+Dx4eODlYf3gjYFHhvdFvx/6/xCvLoykuFfs6N1Dxb3ixr89KO5FHyD6AhEn
o58N/W2Iq4vkCVLxucjy2EXF56JFmWwUny/ZTfG8mLejk4rnRd2DtyieRz8h
+gsR/6MvDn1yyBfQx4W+LuQXnyKYN/+yLOUpcnSimpSn+HWkvEbECaO8Rj7p
wnnN4mPMS+6+nnnKoz9xHoQ+RuBXyJvQj4f+PORZ6B9DPxnyMvQ7of8JeRz6
czYbfFfw+0drvn8TzfM/r/noLTU/Hbz0dJo/DT41eNTdNd8X/F/kp+jDRByC
fBb9hOgvRP6L/jf0wyFfRr8W+reQX6O/CP1GyMd9dH8C+hWQv4NPD3498n3w
v8EHBz5QRfOVwV8GngB+Lfi2wB/QD4m4AjiGxj2ccuAeGidx4mDASerr/ij0
SwFXyaj7edDfAxwmve67QB8GcJueuk8AfQPAecBrB88duBB42MC7gCNp3MmJ
dwF30jiVM44CTvXmT96gk28J3uSx8FPETwR/ErxJ8Ci767gR/MXuR2bSePAY
EW9h/lhG/34sjTud82R8eKyOe0rNY7lr5kkU/8zJzPHH4U0sf5L3h6+Sj/Fg
fkCXcJYvXvBkkZKX3cV+/8oszrMrpN9Qmvx/y+Gv9/3YGo3X9+kH+7uOD3me
3o9Oj1TzZEjNfi3bWpbfWpu0opL/2Mh+Z/Ncfd9J2PcixEPQfiFSv69HWIk/
+LHQQ47Mf/bnmvpfruPIttkYp/qydzvFXZXTc/z3IUEGku8Q1ferOLBxuzKk
n+KDK5A8/pJ0GbLa8pL5/Eg/6Z8fJnm58nHa9LHll2NH8rk4cDXFvTPjr6wd
ZctP9fm5+dOSoGg8vUMN85AeLrzLS/OMDbrRIZna71+SkB56ZkxH8nup24xV
+qzxjPVQKAWv/+TxS+XU+hdoPSzUduF6vNEfeoC9QD+xLkbR+377WJ/wtP6d
2+52UX2jXs+OqvdN3jDwopJ/2tv56Ck7zszRsd479b5jl6z8rOSl7694//6S
HQfW35VGxQ2tz1XPp+LwWVPbT2wc4S+eBTfK5OH6IRpfTkxvTO+VPKgnfYfM
Y05tra32l38aeq+C/HRs6ZX8qPIzBfk9ZU1+b+f7ajuQN7W9wx4+567eS8XB
PV0+pFBx+N6Es8/mibLj4VffRqs472mTmaNi2/K1I2+dCT3WSwzapOpkT6zs
+13DPW1590Z5TzxI2lccPdfjaPnGBZw8tGDNQzscA/6WhN9Hluf3c75XD/5+
cil/T+d31PYtf7K9O+28YMviifPa6zzTeOK5GvZ7tC43uG+90+NEVOImvWrZ
62xx6/OsibZ88NqZ43sNmiHijj0Ux23pbx5XKs3j2hwDLnee7UweYbuzYG96
H8pMvC8t7MeAf9ckauz6xLpSrezZcXa8Xcd9Rvnqj7eI9bP8tuQu9pvXNEnz
mmLC6/T+l1/YH1jwAzHhdX8X5byxsshPuNbySzUtdU61vlmN8r1J1U7/pXCw
7X/Pu/3OPpeXuJ07rPKxRfOKFIhnyzulSjYmqEcfsb5Pwa0DlL7OBjTvbsuX
/jxTeES8qeJi9tHlutvv82/hqZlOuj4RNeqPqHkk4UZn3g4/3Ef74b4pHdft
9xfbXDp/b2SPb5LUo6DSw+Pd1xbZ30P41nqmvo84Wdq/r/oul7PHVvYkx2Zb
rexL9EuZne3qDO0TGcD7RrzX++UC+wt5nv2HgN/QflaWZL8rKmp/2zwGvO5L
tlaU946tneiJktft2yfPWTs+afOr80q1H0ZsPJxe4Wb5DpZvV3J8DzHzcup3
GW39XBsfkCmNLS/erWqLhCUGi5udnrUcbtuh76IurYar/rNPA457xZ8lpuZb
1czWl9Xsxe26tv7EyLuHbxy29XYp9LW3Y1p0fkWC6hsu2nYs4rhMTWLbtei+
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
Vf3qc1Tgp1B7no8Hk9J+L5KIxx8IL/JF7d+GlXi/p76TgORVK7w9qOTv+iai
/VvjwB0/VS+6M9lrxil7nlQbktB+P12Ox79OkT69Gv9Wj9+Qm+X9PBO5K3nx
93+Nm+O2LeTQVC+Slwza2cHDlpeYWL7tU3u/H9byElp+yj3eKDX+sDH+8ofL
6r1Epcln9qjv+br6kOs37PW48XqEuZ76/F7CfK+rMcxT5VFS2tc1/JPzfaR1
Jv6MbY9/wXoTpt5esf6Fqf83M3hfH0rIddpdKS6lV3LJ31Ga3zGM7UGa9tBD
7+vYur7a+M47sufh2g+YdrVWjzfts5ZxPyrseab2A6adm78Phf1i3qdaQO9H
5z3L//+8lub+xfmK/YRzFn4A521LY79DnmAJy29rOebJcZrnwX7G/sa+xjqw
v/G+8Bc5tbzxafYb5e6w/ImeJyLNYpon94G49Gc895UuOC7Kth9X/ffxxLlz
UP/9NkEs73BjLM3zJjjbBeUHIkfcKqDq9jMWdeiYxJ5nwb2k5DeiZvP42QG5
E6jxG/Oxn1m2PRnJA1p7LVN+Jl3X4pvo3uke3jNUvX3Up8v7HSvtc2FoXPIb
4nwiGl+6zvtCbvZ4z1Kfyc/caPzmgZKvu1bH46397xY7NDVU+YG5n8s9npk9
vmNgi1l7a0y3/Vu4Y4TyG6NKb6fxe7YsSH7SHt9mzyryM5NbNyR5vU+Z4k+z
5btvHz1PPJttcRuqevLhglMCys2yz/Fr8/5WfmPDaZ/7avzPWjvePQjyt7bo
8fGbpyT5O6tOtRO2fOsQv2Wj5+wM2V851j0lTzVgyYG0tjxxVuU4roaEGPIF
DarbjmNnNPnRDm5PqgV+FLNTLd2qvkOYe1SRXIvtfcHrEeZ6WvN7CfO9nrgn
DVHy6ePO0jxF4h4sUcmeZ0vSoN1UH5zf4bCSrxn9K+SAPc8c1psw9RaH9S9M
/c9v705+4NZkT+Jx+FUtcCjSlofwd5Tmdwxie5CmPbRayX6g5MUUxL+A/cxh
u5KmXYXu0fmRYZ/neV/INkv0fb/9b5I9R5xjv2Ha+X093txH5v3Aaxb96TfM
/Wj+Dhr2e2kdTyO+RlwNv4H4GnHRZe0fxmt5u35xSb4qkOXP9DwfdhyheXB+
4zzHOQ4/i/Mc/jbBVfYPyV7yfm25MlNK8j/vk3MdtyTP4z3Lbb2aB/sc+x77
Hd8D+x7f5cQa9i9uD+OQ/MXFywOVn5kafJ3srOvYLDRPmWRvNiWy5StrZNqq
/oznm/2uIfsm+lv9fV3p7+PZT/jX+2mPv/0mLf/95uf/VvK0Q8aNj2fLq619
mijS9g+jU6WPvBUc27HwnsvIUu26WxVneGdU/sSl+6Lhajz218HybzYof1Jm
28Y+Sp7ybe/e01f4W2nrjCkQoe4v8Ft4aEeAu2NT/U35U63sauUa3Lut8icf
Bqmnh6PUrgxf6tn+oXmmpGuVP/HPdqGikieonTHTp2H+VrOzeevS7/q97dl1
WnZb/ytc2g782dXKmf3FW3/bn3zOqp4eji/fvAKvl/K3Fmf6i8Y3Cj34UMmD
Nl0o3riQfV7TPc8RId5fF09R8jwzrm2+8ra79dS3yne36y6hxbU8v5ZzX31E
COQFtLxyraiT07N/EC9cUj+MsPV3ttXd/gMOdLMy83qEuZ6e/F7CfK+ka1qP
sfUjMjTaH6HmuSyydbt2qZv1Ld6AadUCf4nWHZosI3yo3ogpnYb7WyVZb8LU
2xnWvyht6P9B1Gc/JV++4tdKik/rBa0pN9KOEyKen1N+YwU/HVvG8HeswN9X
mt/3DtuJNO2k3AEP8ht1W8YmPlevYz5rImx5H7YzadrbcbZnadrz/UvsNyru
Yf7U6kO/kiv7D+d9Ic194cX7Tpr7Tu93mUvzlVpU5P2+VPsZc/9ivOkfkG8j
/0beXfSPPMXVmce5zGR/clXH6TcLJcqv5GmHszz+fZ4n4fqGqZUc8T3ifcT5
iAsR7yM+vPArKfmTR5vjkfxp0OWeKi7tOu5fil+rL/lK84wpXKTyO3sexAGI
CxAP4PxAXIBzpHjiCeRPArs+of3tmW3J80v2d+/VaN4eJW/5scZGNU+OgoOX
VLHnGZuc/UKNlewnFt5m/wC7gZ+A/XRp+WazsrN4/5aMnGnLjy3//P7UP7Y+
6xWaFGnLU11+HhVhz1Or++pKT5t2t+ZHZaryyv4znl7bMo45F9nEulHL5776
+3geS/8wy+Au/lbnWe8t9fddqozaP8OWZ3Lr1XB2ie7W1UzpE95VPIa8dXf0
CoiyQpo9Pl37cFcxYnO8dH62/3kQVfXqNHv8v4927kvu42dFXO7/84c9vlX7
oTcnq+/YpsOjDlk6W9XG1fd8Z/uTC0ma9pwW4OI4vrvA5cMzuouMrYYWbmb7
H9En/dPR9vif7oVXd1jczFo6xje+Gh98I3T5KFsekvSBo9f3xhbdf36gbKjL
plKHB6n7VNq5ZinxsbDlfXHomobhZUNjabmjA8vpno4Dv+UvtPzRwIPLRgT8
Kz4dDZl2w37v9488PyQOL2z51qf1iCC9nsMRhWg9767Se4mB+r3Ot+P36nt/
/chntjzqZ7zRYfY8Nes3ne27uoYVuCn9xSnZw0XJH8M//bDlTXNlfKT0c2s7
6U1Abwuest52ziH9i8jKrH9L67/ZvEGDwm150mn0tIr1SL1wS5xu1sj7iQsq
HubWAt+aKbtaacXp82qg7f9r03eVV/Gd9ffdyvYj42r7Oa3tJ8VK8muyOvs5
65D2b9c4DpObOS6zEI95sH1K0z7LsP1L0/45H0wgW7xMSvzN1j9d2qt9V4b3
kTT30Xnep9Lcp5Ez2M/03cR8yeV3vcg/lOf9Ls39rv2JNP0J8DvgecDxgE8B
zwNONb29jn9Oct5/6uOWX2p8/wIsf1mL52lcyu+4kgMvAH4A3AB5L/AD5L+D
PnH+3Nf/GuUHvWM7vG7a40en6kly79x7aZ7Rtau4LbXlgTqvKKrzjAE6v0B8
jDwDcfK4dnm2Kf+TvHpBfyXv61q2/N92vP0r/oRZSl7l/YXtap4Jezz9M423
7UQsoDijwsTRFHcMH7WB4g2cl4g7cG5e2dQyrfI/VmSoT3dbfnnZzJbeL7pZ
zd2nZwxXv6N0L3eGX/Y8uY7kmDf+bBcrbYnpW5QfSXxJeCm/cmH7se/Kn2A/
wK/An1zJtHXwM9v+8t8SKxrZ8ngtQ5pvjtvQutThn2U7bXlI7dnTrtnzDGlb
sVnjawHCL233uhXsP+NZtPsGMfnNEtE1b8N8xey/j2f1r6/iTN/ZWgSPe5dm
t8rXUmRvHEvdK3a0d+7AhUOF3+uDpdPb/udssZMRzfy/WBM3Z++eL3CN+BLS
8Jvf7WfW2NLq+dUKWljFJ83tOeL1zSGb1fj83mnHN7TlORNerfvy2zz+HYEh
w0InFzhw6+Ctr9bFC4NdIzquEmMWnQit//ew0OlafkTL6Z6gIb/lDi0fWzBV
m9gz34i1F5NtSk/3Fgc0eHRrjvjxhdYjeuv1VG3O6ykTTO8leqbi93qyrxe/
V60yFUcrvlTzfRXsp5XG+8XqdkcniJResxtsCP4hrHYyzhVbfv1y7pS+y+qK
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
r/1Fff0iu75n8tarK9TXX2UQ4cnizJjqCk+28mxaSngy7itx3l+i7y3BPQW4
twD3FaDfGP3H6DtGvxn6AtF3hr4OUz/gQ5v6dP5ukM5fkQ/i90XATwdPG78f
gP4b9KfgHnD0EeI+cNw7jL5n3D+M+z1x3yfu+cR9ebg/D/fmLWxaUN3HIl7M
u6XuY7FSFf9K97FEJqF6tqhah+Jka1KqmRQnPyhFdR8xf3ugqvtY3gX/oboP
7nn5X2dnF+JlEYXx9SpqvSi6qLC6ECmrFbNSQ6EZElHI3OiiTFxJKEkhTAwy
pbqJPi0pTYLcPkzEPrALW40w/1JBuhJl3RUUZFlLQoXZhwlb78z8XuJ59+Hd
9WrhsAzzn3fmmXPOPOc56L6g94K+A3oP6DxQp838qdemTpLfS70kdTu6PvDd
dT3pI0U+gDwAfgP8fXj73HPULXHfgb/Ua4LD6DWj34xuM7qo6KSij3rr0JLK
Xw2vLR4Y7L9k3wcLx407q/JX0a1AxwL9CurPqUenDp36T+pBqQOlzkrnT32C
/l504eiXRf4EPTf66lCPgA4b9VjUYaGfhv49uvfonqFLjR41emXov6L7elji
vpkl7iMeXF7svcXedTTzJfg7ZWfmS6DfgZ4HOh7U4VOXTz0+dbDUxVIPS72Z
/l7qNKjbYH047+SB9LxTn6Hnnbo0Pe/0AeC8o8eNPje63OjeooOL/i26kOhE
og/5x7Kk9xvmdh+q9H7D7rsnJr3ftW9kvD1Z9uPw2Z+lffj98xMqXlPY813i
NYW+WfsTrwn9I/SQ0EFC9wQdFPRP0C9AzwAdA+qHqSfukfOu68N51/XkviN/
pvcd9St631G3B57TF4E+Cdx36JWjX45uObrA6ASjD4xuJjqa6GduW5H04cOp
OUkfPh5ZemXShz+9Pvsba8u5n/9kPu/H1yTeYFg/YVrFGwxfjL898QbRjUJH
Cv0odGHQiUEfBn0H9B7QeeC+o95a7ztdH+47XU/8PfKO6u9R36P+HnWN6u9R
n43/g547+u74S+gmo6OMfjK6ouiMoi96zuHMRzl+MvUHiXt35/4gm4q/PSj1
9b0XJd5YeOSCcRVfNz6+/UDij6G3hf4Wulvo6aCvg64O+hfoYXwu/p7+Xvw9
XR/8PV1P4h3ytRrvkPfVeIe6T413qF/XeAcdDuIFdKXRAUJfGt1VdFjRE4Pf
s7nwfeD5EG9qvfDTKd48ErrmJ35fnD6YeX3EO9fJ+OgQMZ8HJN7R+RPv6O8l
3tH1Id7R9WT9yXNrvI9d433qYjXep+5f4330S4iX0d1GP0njffTYiMfJn8Cf
gjeFHX+BvMrwzsSzDPsz7zLCtyTe1/GJ93U+xPs6f+J9/b3E+7o+xPu6npKn
iiZPFU2eKpo8VTR5qkh+CT4Z/DJ4ZdJXtH7P4v/1faon81xD4b1G+K6S14om
rxVNXiuavFY0ea163WSedT9W+JfwMXkvJm+o+a6vCv9yUuFjwsPk/zU/s+3d
xA8JkzYkfsiB/aszP4R3LM0nPPVT4hGFTaeGKh5R566VBxOPiPczjX+nrUv8
tBDun1vx0zo9V01M/LT63U7iNfxR/NPri/+5XHS8byn2wfNz3nlVd85bf/RW
zlfzvV08wvlbI/EIuKjxCPkh4hHyFOQtyFcQPxNPE0cT1xHnEd8Rp/T/cPmx
vv/ilAUlTsEvxE/EP8RfwX/Bb+Ee5V7VOEV/F7ij68C6sR9Zt+696yr+fHju
7cSfD2sHliX+PN9R/fDJE1OdRVj9fqqzCNcMHEx1FuwT9Rt/ez3zU6/dlepx
4ov35noc9qH6OacKP/WTwlfdUXiq7HO9l+GnwleFp8r/6z1C3vm4vEPBT4Wv
Sh0r++9Q2Y/sQ/jl8M3hmfO9+f58d+JV7MSt4IJ+F/L1x4TXTb6Y/DF5459L
HrO75DXJZ06YmvjqB+b+vSrl2zafl/nqU5ZeXPHbO0v3JH57+Gv7L4nfPnzf
CxUfvrPr00UVHz4MHJ6V+PC88/Hux3vfE32rK55/eOXreyqef+jrej/x/E90
Ul1AeCykuoDQf8ePqS5gXn+qI4gLb8z+4PzeZ5MfeGJe9kvwU64u/gn35T/l
/uTeBN+vKHgPzkvf6ij67VHjdO1LvrH0Tzd9zJ3d9jfXfuUv/ZrH0f7mW4ZG
trf1PZ9RcHxGsQ+9l/vLa9/zI79fNqK9rR/6koL7Ad21B6emcT4uvJeZxd71
0OT/rc/o+6QvKvfEncX+zYqb0ziHCh9mAf74pbOTfaz90199M98TO4p9zrkb
0jg94zNP5uVin3nTo8k+1r7qN/z58MrTw+/sO1rG2brmwzTO7G97nxke/rJh
H2u/9dsK/ur6XJjnH3T+Y+3DvrjgtX7fTuHn6PqPtT/79ILvuj87hbej++dM
+7br+dK+7ez/M+3nrvig/dy3GHtbn3ejRxGMfoWzW10Lo1/BONr/3dmtDoby
7jaOjGPR4Nuo+XvY+b7K3zP41srrE/yM7E/Bt2jwrZXvJ/gZOV+Cb9HgWysP
UPAzgg+Cb9HgWys/UPAzgp+Cb9HgWyufUPCtnr/gTzT408obFHyr11/wJxr8
aeUTCr7V+0f5hAZ/WnmGyhtk/yvP0ODPqPmHen4N/9DZLS/R8ANrnBF+oLNb
nqHhB+o82+yWZ2j4hDUOG1wdKy9R+UXqZ7bZW/ly5h5RHp2zW36d4cWFFr5c
w692fDnDiwuGF+fsll9neGvB8Nac3Y3jeG71PhGem7NbvpzhxdXfcZT2Nn6d
8ujqeZrx7TlyPGGzPo31d3w8x98zPD2dZ5vd8v0MX1r3SWMdDO6p3dVNKE62
8Vr1XDTWDf9ro4yvecja3y1+3Bb5f/ws7inHH9Nxlsj4+HHcm8QP+Gvcs44f
peNwzxJv4N9x7xP/4K/hJzj+j+tLTryEf4ffQvyGv4af4/gtrr8w8R7+HX4d
8S3+Gn6a42+4vp/Eq/h3+HXYiXexO/6D65fH/IlfmT/rgz+o66N5SNevivXH
f2T9+b74g/p9NW/p+uCwf/Af2T/sT/xB3Z+a53T9Mti3+Insf+z4cXq+NC+q
47D/seMn6vnFj1Mc0DyqjsP53Zr3X9B4QfIV0eQrWt93ZPw6n+PeWWr/eGS8
igb3Gu8vOo7gVVS8wm7wsPFeo+MIXkXFK+INg4eN9x2n+0R8pXhFvGTwsPEe
5HSH+N6KV8R7Bg8b70dO94b4U/GK/WfwsPF+5HRXmL/iFeOzH3V8zec7fQzW
X/GK9TF42HiXcXoI7B/FK76vwcPGO46rr2ffKl6xPw0eNt59dBzBq2jwKho8
bLwT6Th6fg3uNd6PwB3z3RvvOJIfrvMk7p2C/zP3bOP94l/2pOuE
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.4], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
BWuwVK+/MO+1RBqGi/JeS6QxGJf3OJYW5eq855u0K5fkvdZKl3Jj3nNJGrab
8p4n0qpNyHv9lv7tmrzHq/Qq1+Y9T6R1GZ33+ioNzPi8x7F0LDfkPfekq7k+
7/mmGrTiXGmBzg2OfaQROi845pXG6cLguEz16JnBsY/q1C8F52YWwN8NjstU
p345OJcjLcr84BhN/uqVbM5q7jwfnJuR1uWd4LhMdfN5wXGW9g7aQygOUv36
xWC/Jz/2XubTtJdZFpyXWg7/PDi/JR3IouAcmLQuHwbnuqQb+SA4T/Y5/NPg
XNoX8KXBObZV8K+Cc29fw1cG57q+gq/I5r7WjreCc2Yr4V8G58lWw1cF5+SW
wT8LjmGlPXg9OIaVVuGN4JhuDvzN4DhRmrozgmNhaedODc79KNd6ZHC8LJ3b
KcFx/XD48OD4fQR8RHDsKZ3emcExrzRdFwTHePK9NYNjXum7zg/ev0r7NzJ4
XytN4FnB+byl8E+CY/ya8BrBWketC9LLaL8izWqT4P3xJfCLgmNb6SuezXy+
1oWmwXsa6VoPDN6jqJ7SMjg30B7eLnhvofpL2+B9j9aXA4JzBqqnHB681nSA
tw9egxSrtIIfje/9Cr+7InV+/xuwGjTn81Ul1506lV3Hf1e13pJrTr1A57Jr
9AuyGu0M7EtZTfdZ7PSshvcwdmpW952m2nFWZ52perDqFmCkcvUl16VV116U
1SYvxF4C2pddQ38d3qFsPcBbWS1zNHZMVnc8F3tBVm9+TLlz1TzL1k7MzeqL
96rGXXLN8izdL9jKMzfEHlh0XXZ/bAMwI3WtbKRqEEU/u2ptXcqu139GW9ey
6/7L4Kv47mPVHxLX2g4v+7m+Tp3Pz9O+OnWeP0lc3x3P8ddnNeN+eo6sZnyi
6r9FaztqYGsXrQWpg61XtP5jb2z1rBbbSt9n9do22Hagseq6RfeXaq4D4YOz
+m57/Q58k7puUk5cr72Ttnuyuuwk7B2q2XJMPVA7g2qbdVLn+U7Ocn2qMdcA
1UHN1HVP1WFVt95HtUywR9l6mKvAYXxuAT7i/JOLrlM+UHQttS3Ynr1rtXXH
HguOA3/T3hXbLXVe+UG9u6wm2ir1WNJvVAOtDw4AB6euk6rf65StM3km8TVb
ZddQXbV1VsevltWUx4MaZWtp7gLVy9bS3Ja4zjMiq/Wodn4Dv5sArkutUVEt
VbX8PUG11PXvm/n+VvV3ao3KWuVAy9aEDAE1y9YC3SddTHZfegenY5uppott
ij0IjID/zm/2kR5B+gDs3mCu6v1la40mqv6c1cRVw9L47ZPN38acowFoCB7K
am1/cc6eZdfUngLfpq49VdbGAjTN6lnqgwFZn6jefK6Oy/L8/VP3jzQN7Tm2
U+J25f770d5B9WjQK6upTwIFjdWS6+yqpdyeuta5FNyfWgf1m+oLqWujy5Xb
SF0bnQ1uSl0/nat9f+q66psFj1WN0z6ptSyNuJcmYELq+sT87Ji+qce47q9/
Nq6kTxqsOlj2vP/IZ/Dd73xulNXXT09dlxxWsPZlDc+xDpyRus6heSHdTFV+
U03aqcRzpm72Hjqqpq9+Tq0J2VzwGNfY1zV7p9YO6FhppE7i98MTj/2h2fvW
PQ3I5sXA7N3qeGlNOnNsl8SahT0T6xakKeiR6QqkFeuKPQpMTu0Ht4H7UuvK
1oN7U+vNfgT3pK7/7sH57k5dF95Nc7fsWnBL8GB2HvnSu1LXgneBz0qtiRoL
n5haj/QPx92c9YWu26jkOnLkmBZl67JqqSaaWge1gfblqevIf8K7la2/WgE/
qmx91Gr5i7I1USvhPcrWQd0KlqbWVv1M+7LUWqnf4F+krlP/AX+Md3E4n6di
b0mtP/lPdYiSNSfNOeaa1DV0jflxqeudqnVelroGpvrXpalr9JPA+alr65eC
aiVrS1TDHJ26/n6zkjEl6zdU93sotdbloKI1KFelngvSJPWirS/oV7J+TH7g
+dS+XvP6ydSat+7yaWVr1Y7SM6T2WZq/0vH01DoDtqfW4zUE/6bW42mOjC05
BpDPlC/fVrI/75CNSY3dIWB14lrkifBViWtzQ+HfJq5XDoZ/lbg2p3tskq2z
0r01K/oZpdurUvQ4GcTxKxLX9TSO/srGRuC7XNFjQ7q6rqALOFlzMPW71Rp9
StHvZC3nWJO4fnqwxlPRfXcWx/6ZuNYs/ZASZOpf6Yq2FzwmR2k+Ja5NSztY
tehxLs1ftaLHv/QKm4seM6rf75jYT16RWiuoGu7lqfWEql3uUbL+UDVi6TN+
L3rs7c9v6ifWhKh/mmd9JI3gUUX34zbwd9H++crU2kXVi7Umy5fIh/3Hb7Yn
ronfn62pWj/kt2PimES6gULiOET6ia1FzyPpAyoljgGkJygljk+kA6iXWMdy
ZubTNLY3SfeQuBYsHUP/xLom6VR+yvzG8XwemFjjJM1KUdcpWhO1LLHmStqX
DZlvlw/YkvW15tC8zD9Ls9InsSZK82xFwTocaUdGJdZ1aP2bkFjLIc3KDYm1
GVrDr83WceljRibWhEhn83vmb6WD+TxbU6T1OD1b06WteStbU6SPeS1bU+TD
lyf2+SN4Jz8lro8Pl59MXH+XlqJtYm2VdBitE+tGpM9omVgrcrbmVGI9w6nw
DYnr6afI9yaufY+Eb06sf5Au58nMz2jt7J35+Tf5fk5ibZvWpk1Zv0grMzHz
P9LTPJJY06JY4KHE8UCfbO3T+JH27Y3EOjr1821ZX1+bWmerfcH4zNfp/Us7
Uiexrkna4vewCxPrm+dh5yfWJu4AKml9LVuj+FJiPfEtieOo/cu+tq5bt2w9
6nSwe9la6MtB1bL10qPBbmXrqy9MrHHcFVQBubI1ye00dsvWNmuN07l3TK3r
K5atc9Z6J93z1dnYyJetYVasUihb56x1U1rnS7N7kDb6isSxa72ytZezEmu4
n83uWZrvaYljywM4pgGoX7beWnpBaQWl3dwdVE2t856RvZMjU+sGVRPvnFqj
qFi6zO8rlR3L7cznhmX3uTTlM7N7eDSxZlvnb1S2/lNxoPTZ52XvSvrsi7J3
KB327YljWs2RV7P3r/F/fzY2pOG+O3EsKl1pCkqptcJFxWyp9eWL+P6jxLqr
L4tei6VVWlX0+itt1jdFr8vSNn1R9F5J2qalRe+hpA+bX/QeU/qw94veV2ov
9UnRMbl0YB8UvTeUvnle0Xs6xf8PFR0bK7bZN3GcI51TTVAjsQZuY9Hxg3R1
ZWzlouOiX4qOB6SxnlP0vnJMto7L/0iH/UbRe892qfcm7cGHfF5c9P7lotQ6
ZOmgKpetmR8EVtO2Q9m+cKeytfGK33bOdGXyM7uWrck/V+O0bJ380Gyefpp4
zdX/BiyGf6K+5FqxZJ1V47L1wJprTcrWCasvpN1X0eU/7MFl69grlaytz+n3
4JLUGmnprBQ7bs9i3APL1iFrLjctWz+s616cWnctHde6xGuutBhPpNbeay2e
mlozLD+fK/k+pUtan9inSeOzJLXeW/mBvxL7QOl6tiT2ddL1bE28RkvXsya1
/lxx9Xep9effafyk1pzP0nhJrfHWXvX71P2qPv0n8TouzdTPiX21NGjPZfGS
4pCPU+vYlZf4OnEMI+3J4tR6eOUQXkqtbdb++svE8Yk0LC+m1j+31DhNrXtX
DqQ/z/1C6rhjY2LfLq3TutSaTI3Jo1LnB7Sf+yO1Pny3xPr8Q1Lrfa/m2HHg
GvBmao20cgKvpdZUKw5cmFrTrj1767KvOx3MTa2xV/5kdmqNt+K911PrrpVn
+EtxTuqxOi+13l65lOPL9jPyYW+k1nIrbyCt57qC961bUs83zbVNqXXsOyf+
34BdsmdZmTj2kzbnt8Qxg/RiraS/5zdTwJzU/yNwTjbf/y06Vjm1aB24ci+b
U/9vi/ZQL6fWsSt38W/imEf6uJmpNe3Ke+j5lbvRb79JHKNK/6XrPZy6vz7Q
eE8df71Scg1iW+ZLpmT+RHmxL8F2tZWcK9O8X5n6XpdkPkD9Iz/waGptvPaz
HUt+RsWt6kflF6TBXp/6fyt0zg2p47OQzadhWRw7LbXefi/5utT/N6G81qup
/y/gaPmd1P8rodzau6n/P2IceCr1/y8oL/RYaj3//30d/OfUcf5xZT+7+v+d
1P/7oH3Zj4ljGGkqe5ftu7T+PJ36/xqUg3ov9f9EKNfxXeI4X/qs7xPH29Jk
9S07L6GcxILU/zehvMf81P83oXzXs6n/P0J5tmdS/1+A8lr/AzN/K1E=
                   
                   "]], 
                  Polygon[CompressedData["
1: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
PUfT7hj/G7mHfITv0fHbiX9iP7AvmJljZgGzgtnAS+3wSXImb3CtTcoK0AJt
8AHnu1zdjnt9uwz/NAag+D8+azhj8nhwAjgRvE/FpbR/nbZvgPeQL0Z+hf1X
wd+0+Qf821dhop9Sfw3171P3gc+Tst+p+wtU7L9F/fnUP03dM+APyr8AX4M/
wYfUX0n9/6h7t4yt/hJ4tbbZ9bE8VfdHfS+e+4/6WP9DzvBN6t+u++tJlJ0M
TgGngt6AXLPX2gfb8H8/aFfxLDcCWyF/g7w2++tojyN/oe2k7Qk2Rf4YeRnX
ejBvJ/zSAmwXBJtR/6k2urZ1J5zb3c1wdHJxG1H/LvULU7cI2Bj5feTF2F+8
k7W+Wb8r1/zzqV+E5/EndX+BHZB/of02NZ/1ofZGMzZHW32E+u+oX4+69Tvh
3kblPKMNCAenj+yaZjhBfWdvqy81ozONdJ5Vf2tGhxub+h0532+cb3v/GwxG
/kreg/01wZvI53J9T/CunrSPIJ+N/Cj7j4HT+M/TwRngzH58IPL68vtTtuI/
uEbesRF+9HT9S/Yf2n0AjuaYY8Cx4DgwFWX3cMx9tD+mFR35piI6tbrzqxx/
Ksffw3/fC4YjT4/8pO9C3aUT++bKTvyN2hs3yIM2Yn/pc3ua8z/biC/uSI6f
nONvcd0GRyFPhXy78xIYm+c6DhgXjAfOpH4+6j+lboRzO/LcyB+x/7Fzu3yd
/Zv9d8GE4NpmOI791Kc4xwRgQjAReI32p+vL414eAMcjz4j8jPMmeB35TOSH
qHu4zFj8Bnxfj8kTO/H/ndyJvn5cJ/7B48HwTuaGH2j3cz9zxOad6Pdbgi3A
Q87XzuGd+A/Pot3Z4Bxwbq1bj6y5NHVsfSbncT8XNOJL2Ynr+4P+shPlO4ML
kBfjev9h/1+vBXlm5Oddx8AoXlsz/OzGrh+ccwYwI5gJnED/XIr6paj/mfd2
H+0fdI7txN/5KnjD59KJfbcz5/+L/9/FdRnc5fxsHwJ3238dv+DtTuzdL2h/
G9fzC8/yV7Ay/7kKWBWsBr6n/l7qS87ZBWdxPRtwPetzPb1WfKb6TvU5z96K
T1DfoD7VOZEf4fh9Oe8u6rBsL6X+gGZ8sNuxfyZYv7ZPqlZ8svpm9TEOUh/g
+D05bgjHX1vGp61vWx/EbNSfUds32i/yG+fWfMo2tb2zJ/Ikzej0z/H81uae
1gHrgvXAo5z/QM67K+e/le1e2mC0n1T9hP3TwBq1vVq0Yr9qe25W2zPntcP3
yN9MgHx2O/b85o3Yt9oQ2hL60J7l2If4v934n535vyvZ3oO8JtstkI9je2o7
9rH2UrO251er7R/tW32M+hr1Mf6Pum05bkuO25rtNuBBzrcz8k7sX+ocxTEb
NPLOfHf6MPVl6t+Wz5DfkMuT05MfuZfj1+W4LTn+ROc0jl+zkWfgs7iP+g0p
H0z9qWV8QHvX+sJMvm+wIvsrUnYKdQ8hL4+8vDpXOz4i9Yt9KJvF9wtWYH8F
dVTqHm3lWfsMfBYPtsJdyVeciHw//78p/7sV/38m20W1B9juhjy0ig2lLnJU
EdtKG0pd5egitpU6oLbLrkV0w+vUaZCn9h7a0UG1ZXYpopteq47jXOs1U385
/78s/zMG/zkmuF4dh/pp7JPUvyYH0gyHPoJzTOjcRPsjGTtHgWta4ZLklPam
7RWcb3nqx+Zc44DXi/hzf3YMUX8n9ZtRvzx1K4ArkVdCHo/98cFVrfRV+7h9
fWL69CRgUjDZgOjY2q67FdG9p1J/UN/nWi7Sf9CKf3Zax3A7OrG26fZFdOX7
kZdU16V+OPUPtDIXLYl8fDtzkv7YsYrMVdrI2pKHFDU/3ooue1gRW1mbWVv0
0CK29B3cz8ZczzLcy7Jl1gTXuiOLrBVj1f1vduRz2rGh1SWPKWJbL809LgOW
BcuBp1rh0hyDjkXXTNe204usperU2qYnF9G1tUnV1U8oYqtq02qrHlzE1tWm
1RY+qIitq09Z37IxAR8VsZEfU9ctYjs/3cpc4BzkXKTNrW12UhFbXBtbW+DE
Irb3M61wxc4hziUXteJb1qepb1Mft75ufdyfFIkpMLZAn/s7ruU8v7V5frPz
7OYos946vw+kbFTnk17Wh9m0+cvErAxvhpM2luXYXtaTaaj/ge25yD+p2yFP
R/vjelkPp0UeyfaYXtaTqbUxO7GPjMmQw9uec59H/a+ULUT9TBx/jvoZ8gLI
UyGvzjtaA6wJ1gL/cszOHD+E4+dqaWSx34x+MrdzB21WACuClQbEZ6zv2DFi
bMDVrcSKfAp+d/5VX+Mc82sj839TIk8BJuuFezqfNiNp+00j9uQplM2j3iBv
QPtL1Gf0hbKdF3ntdvqzHIrvz/E/OuVLc/4ly/TJLZrpc/bV76i/m7oWY6vt
ePf/abeKMQiuf/IPbJfU58z2ajkw113k1ev18dYiMSwvt+IzOLcZn4O+hMto
P4B2S9F+Uecf5Fl8rsibs70FeQGu/0a2OyLfynZ+tutRvwvb65BnYLsa8sZl
xt/SbDd07mR7Ov+3ZjNjrsX/XSuvR/mq1K/P9jbkhdmuj7w729uRF2e7AfLe
ZfiLB4vE6Ggv3039qpRvTv1RZfRXud7PqP+rlTnTudM5+NUiMSHGhhivpf/d
Ocm5yTn2tSJz4nTNzFnOlcZXyYXKiRrfpQ6lLrZdEd3KNce1xzXktyIxPcb2
GK9mPNbGcoBgU7DZgMzxzvXO0S9TvwzPclXuYc6aY3yiFd1HnUXdxZgXY1+M
eXmb9o+3osuok6ibGANjLMyMlL1V5Jk6f05Z5Fm75rj2uMa8UiReT3/FFI3E
/7lGuFZM2Uj8nmuga6Ec/n/xdlzTylzj22z/LrPmuva6pv5RhG8y7sj4o2a7
8V8Qovtfq8+0Y5Nom4xoxP9gzNQDtP+xkVgq+a87isS8GStlPJdc9GKNxMfJ
UclV2V//bqXPuv9l3d6YK/0RizcS/6V+dV2RMevYdU1xbdFf8WORGC5juYx5
+qpIjJaxWsZkfVFER1BXUKf4vUjMj7E/xvx8XCRGylgpY7y+LBJzNHcza5Sx
SOvzjjcAG4KNBmQNcy1zjfupiD11N8/xZPrrZ2zXaWe9kpNxvVirnfVBztT5
e9N25nc5T7nPJ6rwm2t1E2/0VBU+cF321wd/c/7VXYN78Wc+Q92zYHr2ZwA/
y9+wfbiK/3NzrnELsCUYDH6hfiLKH63i7xwpf8f2kSr+8ceq8IP6P41v+sbx
x/99qd2BPGcVe3OsWt8YrR//6odV/MHHqoeCd2o+Yox+/PMfV4k/GVculu1X
VeITRu/Hv/tRFX/xv9p7xgpU8edfVYUfGY39q9l+S/2/nPdO9gdS9g/yrGyf
q+IfHs72ePBezaeM149//esq8Q0T9ONP/7ZK/MMivcSG/O386VynjdONLadN
57jdroxvwPG7MhgE1uc8G/hcwGvgTfCV/hLwLvgAfNePf2F7sIJ2P+eZUfu6
l3je5dneVWW+H9RNvNg9VeylebuJJ1uQNsOQN+RcG4H7qvDvC3QTb/RAFb55
YfYfZLsIbVbs5T+95vH7iRf4pko8x41V+L4pav781ir223R1/7m+Cv87ac0P
387+HeB3uSdwcxX+b+qanx6V868J+v3EE4wjV832iyrxNyewPQl8yLEnVrFd
tWG1ZRtldDfXENeOA8roIuokazgGwKz1GuXatEUZXVad9mD2Dynje9EHo608
pBMuYOJad52w9tVMXcd+6rORC5ATkBv6u1Pb2r1wned2wt3I4cjNnwW26sSH
d1LNCcgNjV5zj3JEcldyWHLZe3TCZchpqFtPUMYXoU/C2OhrO+G+5cDlyi/u
xNegz0HfwQ2dcFVyVqexf3ontrg2udz3BZ2MPTkfbQfHoFyJnIljcdwyXIk6
nLrbaOBI103wWs1HdvqJj3ijSryJ8YzGO7yNfLg2ej/xEG9ViTdpIy/O9nWv
k+1W3PPW2gVgW32ZlB8BXq75ze0o2x7sAHYER1N3DHizDH+qLmX816S1TlX2
E5/zZpV4Frk+OT+5uu06sW20cdTtlyvD7cnxzcb+QPBbJzqjuuLMZbhFOcb5
Oolh09bR5tH2WbGM7aUOpu61VBlbZ/Lal6fNI7coxyh3t2Mn3IscjLrxnGW4
TDlNuZHdwOz9xDdNRNnEYPJ+4mN+rhL/Jvfs+9cXtV/dn3ao78/rO7UTn9CZ
9fuWe9qvfv/2N2P33+Kc/+snhl8ubljdn+Tk5LLktPTVfFeGq9q37q9yVld3
4qO6vu5/6vb2j3drDkfdXh3/rZoDeqwTDlDu74lOdHd1+Mc74bTU9dX55bbk
kOQu5TD1HfxYRrdXx5dbkjNapsozX6q2z7S1zElYqra51LXVubUFvuxEV1+6
tsXU2QfX42++ej6WO5VD1fcwsgzXJ+f3Fftfg32QF++H+3tQexB5iX64vkfA
XsiL9cN13gf2UI9FvpP9u8rEig8BuwxIzLhryQr9rGWuKQd5L/1wt085Z7nO
9sPdPl7GV6DPQK6r6sYXoE9AXb7TzVom569v0DXNuXHFftYq50i5u5lr34Qc
ntysOoW6xOdlfAH6BOTafivjW9DH0ORcBXixjE6nLvcP+BJ8ijwBdRN24yvQ
Z6DvdkA3vpCBtS9Yn8jr/XCWcpVvgF0HJObcWPPdwD0cMz3lAzjHaL3sG0/Y
76Vsun7iB7vsV2DqfuIx/+F//wXT9BOf2KSuANP2E3/Y1n5ynFYZs47VFV3T
27G39Unrmx7YT3zp+N6Ta38/8aFjqvdoyyCvB2YAM4K9q/QJ+4J9YLJ+4t9+
qhJPO2U/8bG/VIlHnaKf+LWRVeIV7QvT11yqfWJS6tcGE/UTj7p/lT7gu7dP
HFilj9g39NfsW6UP2vfsI8bK7sR5dh6QmFl9y/qo9U3rY9YXrc9ZX7M+aX3X
+oD1/e5Vcy9yML+6JoPz6nvw2o2pfY/9y8CV4H1wObgKXAuu8FmD2+zv4Bbv
wb5rfwaPgPvBQz5Tx5DvEtzleAF39JN7cB/bB/vJQZitn/jkcXj24zrPIN8E
bgU3gMfBU74z8EQ/vnd97vra9cE/DZ5zDgXP9OPr1ieuL1yf99XgOnAjuKYf
X78+fH33+vzl1vWZ6CuRY9d3og9L35U+FH1z+kT0heij07elz05fnT4ufVX6
rPat52fjgz+jbG/2t+jFdzO4nr8Pci7iHS7cj26lXqi+6HqjL8tYlpnsk2DT
TnQ8++IsdV+ZmO3cveh06nIb1H3fMaBuZgyuup71z3Puw3y/cgRl2nqMuv/f
tS7+VS+6/ca17amOL5crp6v+pL6k7awNLTewShmuWM5YLmGNMlyynLK2+K7e
G/uLqh9V0YnlauVstfU3KMOd3l/rY5uU4XrlfLXt13H9V29nu1UZ/U0uWU5Z
7mCnMtyCHIPcyEW9PM9tynANC/Vz/4eC53rRee1b9jHXUmPg5WNeUx/ppv+r
S6hTOB7s/67Fs9fjwZhj5wrnDMeyMenOFc4Zjn1jygfVOr35WeZpbV3m+s3V
Ume/u57v7u0mZlpdV51X2+vPXubD0dk+wPY+7Zh+fKb6Sj/u53n4PuTWzQUz
Ft2YdHXjdamft5d37Lv1flesr2GFWod/ux+fsL7gd/o5fqFe3o12y8v95AyY
K/AKeKsb+8VYqul68Z08UuvX+5ThpuSo5KpOYnsM2yd68R0cXYbbua7Wp6YH
Z4OD6+s/i/2rwYu9+FKuUjcHL/Xim7mujO3renVvvZ7KfciB+D5XAbf7rvvh
2m8rY0sPBbvXNvXllL3Qi2/jMtc38HwvvoiLynBV19f6n/qe653rn7qnOqhc
zPq1bS4nczplT/fC9Z9W5r/Wrn03/uenlH1Sr6+flLEtv63X0/9fP0fU+pX6
xRf1evpVvR43uuHs2vX6e7PX0Ysv6KYy3JccmFzo1GXsmRtqfVL9VV/S6jWX
uW7Nba5c+87kOOXW7qj1X3UouRrX95ccS734nvRBaQ9pP+nL0KexaRX76Aj1
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
ynD2cvX6ADYr4zPQVyCnv1EZjl9uX85/vTI+ALl/OX5zCY19/BbcW6S/G7u9
ZpFvsehL0uejr0efklycHIzcy8xs52xn/jbH31x/jZdva/vZNcpYmO9qfkG+
YZIqnIdchxzQRFU4FbkUOZCJa3tc/kG+wtgZcw7kK4yhea7WOdU19TGZ++o3
jPx2kTmwy7YT72dOrbm173UTA6Dv35iSDduJFzYnzdy0j7qJAdD3b8yHsTfm
fBqLYwyOfIn8iPa2fIvfgmrU/Iv2uLFd5rDKtxjjZayVfIV8i/yLsV7mgBr7
ZczXgu2sX+YMmjvot5f8JpTfgvIbTAu3EwtvTLzzzULt6Afm5JmbN3oVzkmu
SY5K7kcO6JK6/4xZhcOSu5Kj81tWzZo/2FE9oAqnJZclZzR2FU5PLk+OyxzU
VxuJETRW0Ngkc4SNXTJGaYN24ufN4TOXT12uV/Md6nTGHplDYiyRMUjqflXN
b6gDymeMUfMH8iFbtBOPbU6juY3qbmPWfIk6nLFJ5iga22SM0i7dcJpymbt2
EwuzbD/+AmNijIX6rOaLjImSD3qmF9/ts2VioUbUfI98krEug/vh3/U3qGuP
VfMz6tzyORPU/JL+InVv+R39R+rgi3TDecl1Ler9dhPzYqyLMSfrt5N/YI6k
uZLrtRPPbo6kuZLaQn5zym+DaRPt3g2nK5crZ7tRO/Hk5pCaS7pJO/Hi5via
6+u3xD6sbSO/KbZxO/Hr5piaa7pVO7mk5oiaKzq4nVxTc0zNNd2ynVxSc1DN
RR2zzrcYWCRefoF29Ctzfs399Zsvl2ifFfkWzAtVxoRjwT42bzux3+YAmwvc
rfM1pisS/2rOsbnHOxb5FsI87azfxnhLhOxeJYbD+VGfk99Y8ttQWxX5HsjC
VWKG9LXocxm/jq+dp0h8vVydnF2zDIe1aJWYH2N95PD8xoPf2tqpyLcf/N7e
Z43o5MYpmws3ohEbTpu1qvNVpi8S37tmlZi2tWoO86UqY8yx5Ts0ptjY1PGL
xBr36nyWGYrk2xiDayzrhEVic+drZ30xR9pcaWNYjVWdoEhsqznZhyJvVOTb
XuozxiqPVyT2d88qMTDGvhgjM3c7+q8x9MbSz9/OemYOt7ncflPsMOSNi3xr
TC5WTnau+vlMVoWjl5uXszfnaAnaT14k/2audvQrvzHjt2Y2qhLzp36uPu83
cfzW1zZFvofjN7/M7VqvyLfA/CaYuVzrFvlW2AR1/PS8RfId5G4ds45V/Sd+
Q+1w6jct8m01vxFmLtk6Rb4ddkgVn6++Xn2afhPrCOo3K/I9FL/h4bfIti7y
bY+ZqsQsNur+YSyWPll9scZkyX3Kgb5Uz4/mkB9L88FFvtdS1PkvUxTJfxrU
jv3jN3/89s88VWIGjRWcl+0mVWIctXf04fmNt2G036TI94X+D5PGIAw=
                   
                   "]], 
                  Polygon[CompressedData["
1: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
HuO7aCedFD9CvseiXpNvQKxzNDx+I/G7wm6LdyPqbc88lB1G+2N/z0j2++ys
ZA2IteBQ1J7YPWLvE9tM/yz/f2gUvxF0Z/jrZ8o3gh1Jn8R7n5G8e1lZST0R
dcVF+OQ4E2Ev0gv0Od6R373mGGuO5lHHRq0d6yo2BrtR/9OMZE3KLaZh7Dl0
mDphY/iN49dCf2z8/mMOdgMNM+dBvB2/0fzu5ddU/0Ds6dhd2D1Yk6gh+Fb3
OfLGe2yejVROe6Z872u/R9vp+/g74pf5rN9pn6DT4ifGminfs/Ldrf9XxPHr
wu+M9p90Cn8g9iB+a/iNjj3T+Flj3djutEvMOrasZ8nC88Q5KebEymEp7Xzx
btOHUevIFwe16vF7pOf5leGXbjybMmkXVhkrqn0RXUirokalFVE46v9t3h3a
V/ArrF8s9r48SS3/SHqyDsd6vEv/GX6l+f0jJoNPLkrXHsHe71nG0hj61fPM
EPuiuPWmuT/qC7F/8+vF3ky7xS1g/xN7ALuHfovzId8xYpeJXSF2aNRHxn4V
25htQlv4/RW1P1ZBvyK9jBVif8EasA3pHewX8dPjXCjfOvnGRX0Zeyu2HFuJ
DYs6KvZMbCm2HLtDf6sclTxfQTmLRC1HP2C3xN/N5+xCneiteAZ+l1EhYwXo
ELXISc4JcV7YRRX0z9O/nb2cLqWPM5L1Nj0rWWtjzT0j3xB+w7FhdEesL9gg
bLD2QBpAN8Q5Wo7R7N30aSqZdwl7Js50cQ6J/ZWu4fcwm4Hnoq/peHwmcYXp
2TjPYV9i5+kXoDVxpmVzi72fHU8HYw+MvQUbw95HB7CX4rwR62nkpdnYDGMl
+L0df4tYz/6tjx5OJfvGuuykVhpn7AL99ewG+iH8fCdjYw2Ks3PU27GW8Dll
7E0+xbUvjFzaF8c9A7st/v7G+7DnYo+w8+lLrCubH5vJzqKj2Gxz14jPxn7s
+/yQusealkruKyZ4vq15kjpqbCqpv+ZnJzVV1D2TUkndsiQ7qYGiHhyTSmqt
OdlJbdjTXOfoz469mI79ey8yKpXULZOzkzuSqGdGp5K7nWnZSW2TT/sINj3O
8do5Ock90D2ppN6clZ3cCb1ItfSXstWxqtlJPTM9ldQoz2QntU3ULjNTSV36
fHZSx8T3vJEGZCb7f9QB88xXMmpHdme8e2LuZYtgL7Br6SSWTaPkmOx7m0gT
6BvxA+V72N9tjveoV5x5KC7S5mDzsN5Rn9MQbC72CNYn6mQahM3G5mI3R21g
jruizpP7QZoUezXejd/9/Cbwa63/q2caGO+W8dvoFvoDG4wN1R5CgyhTvpHY
A9rjaRzty0jq0syspIaMWnJvRlLzZGQltWvUsMPlO993sJp9KvaBWK9yJzV5
1OHd+XalAvh9+ou0H6fHqDB2Aa3QXkZLom6Qs585pvocM3yOLvpfU/+oNaOm
wbrqH6e+2BRsOtY56i25qnqWCuaZJtcUuiveZWxNvM/0fayJNJbPUuOL6Qn6
Unwv+SbKN1m+dvpHqQc2AZuItY0aTOwYsQvFLKD5sRbJWygnueeM+85vowbi
e4vY6WJnie2mf4x6Yg9gk7Cb9I9Qd2w89gDWJj6bfF/HfYjczahp/Ib0+8p/
k3YbakUnsH5YB+12cSdFlf1mG8g3Qr6R8pWLvQK7BGsX5/j4beln00ntkiF+
HxivgjVkR2KjsPJiK1IFujIzOd8uYq+g+trD+Y3gVzb8sOuwYdidWGnsMqwO
NhgbjF0cfyPsrH7lEHY46lysHjsUG4Zdwq8Sdj12JzYcKxP1QZzDsCHYEKxk
1M7YX/pXhLAv0pM76c7pyToZ62WerOQeOBOrEWeX+Bvrn0cF05N+8INxH8j3
bt/pZvYNOsff8i12WtyvsaeoLFaA7/lxpyGukXl/1S6EXcg2x5pjZ9OTs1Sc
qWpkJvXJ8szkjPdgKjkvLs9Ozntx1/drruSOOu6qx8S5FL+KT2/2LvOOpOk0
Wv8V9lXKL894/aKpZL2OdXscpcT/Js+lkdOzfBJnlViPjO1j91OxVHJPEfcV
V2Umdx+LM5P7m7jHqZ6ZnAuXZSb3LXHvUi0zuetZyh4XX9DzDY51hgbkTp6l
WtTU7EpzLKdSkVNMX8/Sx7MUindabDt+e9khsY9H3RP3R/z68OtNC+N3G2dS
rJ9+X7HnZyR3pZPSk/NrnGOLmeP3uJeS77/sMrmW0Fbt3z3HJZE79kT6Mc6D
NE17Ck2mHfo74ywRdWXUjPR53DtSZ+2O1D72Uv0/5CsbNR+VivXfs5TwLK08
RyvP90/cM2HV2P5YP6ywZy4be0nsKdgArDhWDquJ3Y7djl2IFY/7I6wr1hXL
h5XHamEDsYHYRRnJ3VTcUVXNTO7FlrCXxvlUexC/QfxKGC+DVcduwfpjRaJm
wC7HumHdsLxx3sLKYh2xDnFtiZWMezCsJ9YTOxcrgVXAumPdsfxxpsMqYj2w
Htg5WFGsNNYea4dlYsWwMlgHrH2U6tge32muuDfxXV5N1WO95ncRv5b8WvL7
W7sgVphtjN2A/Zae1HD1U8n+Hvv8kqjxtZezV7PXRP3xb01TKZXUeVHvPRTv
h/YKtjZbhxoaz8eujPMlex01ilo59iusnH758I07BmxunEf0c6gyVox9Kurb
uPOhFqmkVrkpJznzxNmnE30T+0acO/gUp5qxX2IL43eqX5pqY9/HHoldrF8y
7tZTyXmrVU5Sw0Yt+0d2crZqk5Ocv+IcVj7OpPjb+mvYZ+mOOPvh3bBrY++O
ujrO/HHOijpLux7VjXoPqyJfcbwklaBjWK+olYw3iRo7zn5Yf6yzdkdqTyXM
9XQ8D9s2vgfzHuHXM84pxhtRAzqM9YgaMs7McS7OSurY9jlJTRe13dQ4i2Um
/1uJ/7Fs8vfOlZmcFzrlJLVu1Lyb6Z64j5fvBXYtDU0ld5lxp7km7sni9x/r
NRXXbiFfC2N/aZfi/4zY9mwHaiW2NfsK9iA7Je4JsdFxxo+zIruackW9GXUV
NoOdSb/kTtbsuMyKtS/WwDtor/YcNkuubLoilezJpczfMPYPOhrvuLH1EROf
gTqnkjWxSnqyb8f+fUL/XMqP1dOvZ7of05O9rFB6kityztLfFDWQfN9GrUCl
5XudnYqdZH+gMlh+vnnF1hVXV74f4rvD8sVeil2LnYz6Ie7KxE5nZ8Td67/3
n1NTyf3gquzkLvT2uC+Mu8B4L2mQ8WvjHiLOb+wI6hLrftyHYivivaPB2J3s
W9jqeJ9oSNytsZuiPmUnxr1ynAniHhV7lF0Qd69Yt7jPw+ay8+L+NO4m4h2I
OpTtQW2w+uzG2FPZ0dQVq8GuwwbG81KnVHKG6Mheya6N31es/cbWxO8+PgO1
Nt6JfS3WlVhfqC/2f87rzto=
                   "]], 
                  
                  Polygon[{{1019, 688, 354, 355, 689, 1020}, {2629, 2507, 
                   2508, 2649, 2177, 2176}, {822, 821, 1128, 691, 692, 
                   1129}, {2622, 2621, 2620, 2481, 2353, 
                   2352}}]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0jsvQ2EYwPGXutWtEhERQWwSl0/ARgxMIgY2YmAgEQOjiDCa2Gx8AjYW
fAB31VZLxCYYGNz9Thj+/T1v2pzznJM2j04PTOWFEJb0rWh+153280Oo4hGb
mGMHH9nFL/azPBbCCOs5yVa2ad7cyxUOcZ3j3OIsd7jIQ+YXhPAQ/hY4xade
dOx8xhOe85QXPOMlz5nkBa94yRST0Vlpc4oZpnnNDLO8Zo5Z3nDX8zxGKzjf
Rs+nV23Y8YSrPOACtznDTY5xjYNcZg+7NWdu4QTrOMxS9vHDvTr5wPZoFzby
zff3/FEi+p2e1WCnyugdsyK6HstZyzLWsJTVjLOKCZWYK1jMMhYxzkIW02sP
hXTbEKM1wp6Pp///wy8tckYZ
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3WEUB+D/jUklRbForBRF0VgUi2ksisUuRVF0KRr3Xm2KRlEUGxuL
RbGxKBZFURQbRVEURVEURVIUjaLR7KEPj9857/s658ubG4mHY6EgCAaIJQdB
lLd00EUn7+mmlx766WOQAZ6nBMFH+YHPfGKILwzzlVFG2GWHc874yy2JZuzL
PV6oK6niJTVUU8srwrymnjre0UgDzTQRoYU2WnlDO1G+2/GNP1yR4CxECif6
TTZYZ41VVlhmid/8osL7Z3SwqF9gnjlmmWGaKSb5yQTjHHLAJRf8444ks47l
EeXqMkp5yhNKKKaIQgqIk08eOTzmEdlk8ZBMMkgnjVTG7PjBNlvccM0Dd6fJ
9//hPyRLSZc=
                 "]], 
                Line[CompressedData["
1:eJwl0mFE3WEUB+B/luQuY1EUxY1i0SiKosSiaCwVRVG2KJZ706IoNrYURVEs
NjaKxqIoiqIoikZRFI2iZCyKYmNRD/vwOL/zvq9zvrzhl9HqSEwQBP10hIIg
yi/iHgbBX/UP++wxxSSP3CXymGSSSCWFdNLIIEwWmXSQzROekkMeuRSQTxGF
nNlxSkgOuJOvuOSEY74xzQzfmWOWBeZZYpEVluk0p4Ri1vSrbLDOFpv8YJtd
djgnwftYHnCjv+YrX4g4a+c1bbTSwiuaaaKRBrqop45aaqjiBc+ppIJyynjG
TzuOiJdv1X9c8JtDDvjMJyb4yDhjjDLCMEOUmjGoDvCB97zjLX300kM3XbwJ
/f8P9xBYSZY=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPGDMGOQiLwiiTyykCSRQeP9aIwxGKTsRCQrexYWytbehk+A
lY1PQGRtIWtbxW+y+PU/957bOffcbsvOYeogL4RwxlBhCMOMEGeMcRJMMMU0
s8yxwCK9JSEkdYll0mRYZZ0sm2zREQ2hkxmmWSXDtrke7abPerFICP3aogM6
oIM6p0O6rXE91n2d59J4UW81qY+a0hdN66dm9LU4hDeW7ZVigyzjJGiimQYa
qaWOamqopCp3Dmt1sUeZ63JilBIhSiFF5FPAr3cIem3/EV0iyTpr/OTOpaO5
Pax75LkCjeu3exX6oR9FITzrnW6ZfzI+Nb7XBb3Rer3SL9/2XB/0RC90V3f0
3Xrtxm2skKaVyej///AHD4cymQ==
                 "]]}, {
                
                Line[{706, 1016, 479, 705, 1131, 927, 707, 1132, 928, 708, 
                 1133, 929, 709, 1134, 930, 710, 1135, 931, 711, 1136, 932, 
                 712, 1137, 487, 713, 1138, 933, 714, 1139, 934, 715, 1140, 
                 935, 716, 1141, 936, 717, 1142, 937, 718, 1127, 1143, 938, 
                 1017}], 
                
                Line[{720, 1030, 1232, 719, 494, 721, 1144, 939, 722, 1145, 
                 940, 723, 1146, 941, 724, 1147, 942, 725, 1148, 943, 726, 
                 1149, 1031, 1233, 727, 1032, 1234, 728, 1150, 944, 729, 1151,
                  945, 730, 1152, 946, 731, 1153, 947, 732, 1154, 948, 733}], 
                
                
                Line[{735, 1033, 1235, 734, 1034, 1236, 736, 510, 737, 1155, 
                 949, 738, 1156, 950, 739, 1157, 951, 740, 1158, 952, 741, 
                 1159, 1035, 1237, 742, 1036, 1238, 743, 518, 744, 1160, 953, 
                 745, 1161, 954, 746, 1162, 955, 747, 1163, 956, 748}], 
                
                Line[{750, 1037, 1239, 749, 1038, 1240, 751, 1039, 1241, 752, 
                 526, 753, 1164, 957, 754, 1165, 958, 755, 1166, 959, 756, 
                 1167, 1040, 1242, 757, 1041, 1243, 758, 1042, 1244, 759, 
                 1168, 960, 760, 1169, 961, 761, 1170, 962, 762, 1171, 963, 
                 763}], 
                
                Line[{765, 1043, 1245, 764, 1044, 1246, 766, 1045, 1247, 767, 
                 1046, 1248, 768, 542, 769, 1172, 964, 770, 1173, 965, 771, 
                 1174, 1047, 1249, 772, 1048, 1250, 773, 1049, 1251, 774, 
                 1050, 1252, 775, 1175, 966, 776, 1176, 967, 777, 1177, 968, 
                 778}], 
                
                Line[{780, 1051, 1253, 779, 1052, 1254, 781, 1053, 1255, 782, 
                 1054, 1256, 783, 1055, 1257, 784, 558, 785, 1178, 969, 786, 
                 1179, 1056, 1258, 787, 1057, 1259, 788, 1058, 1260, 789, 
                 1059, 1261, 790, 1060, 1262, 791, 1180, 970, 792, 1181, 971, 
                 793}], 
                
                Line[{795, 1061, 1263, 794, 1062, 1264, 796, 1063, 1265, 797, 
                 1064, 1266, 798, 1065, 1267, 799, 1066, 1268, 800, 686, 1018,
                  801, 1331, 1019, 1020, 1330, 802, 1067, 1269, 803, 1068, 
                 1270, 804, 1069, 1271, 805, 1070, 1272, 806, 1071, 1273, 807,
                  1072, 1274, 808}], 
                
                Line[{812, 1182, 972, 810, 1183, 973, 814, 1184, 974, 816, 
                 1185, 975, 818, 1186, 976, 820, 1187, 977, 822, 1129, 1188, 
                 978, 1023, 1332, 1022, 587, 825, 1189, 979, 827, 1190, 980, 
                 829, 1191, 981, 831, 1192, 982, 833, 1193, 983, 835, 1194, 
                 984, 837}], 
                
                Line[{836, 1287, 1084, 834, 1286, 1083, 832, 1285, 1082, 830, 
                 1284, 1081, 828, 1283, 1080, 826, 1282, 1079, 824, 1130, 
                 1281, 1029, 693, 823, 1021, 1028, 1334, 1128, 821, 1280, 
                 1078, 819, 1279, 1077, 817, 1278, 1076, 815, 1277, 1075, 813,
                  1276, 1074, 809, 1275, 1073, 811}], 
                
                Line[{839, 1085, 1288, 838, 1195, 985, 840, 1196, 986, 841, 
                 1197, 987, 842, 1198, 988, 843, 1199, 989, 844, 1200, 990, 
                 845, 1201, 1086, 1289, 846, 603, 847, 1202, 991, 848, 1203, 
                 992, 849, 1204, 993, 850, 1205, 994, 851, 1206, 995, 852}], 
                
                Line[{854, 1087, 1290, 853, 1088, 1291, 855, 611, 856, 1207, 
                 996, 857, 1208, 997, 858, 1209, 998, 859, 1210, 999, 860, 
                 1211, 1089, 1292, 861, 1090, 1293, 862, 619, 863, 1212, 1000,
                  864, 1213, 1001, 865, 1214, 1002, 866, 1215, 1003, 867}], 
                
                Line[{869, 1091, 1294, 868, 1092, 1295, 870, 1093, 1296, 871, 
                 627, 872, 1216, 1004, 873, 1217, 1005, 874, 1218, 1006, 875, 
                 1219, 1094, 1297, 876, 1095, 1298, 877, 1096, 1299, 878, 635,
                  879, 1220, 1007, 880, 1221, 1008, 881, 1222, 1009, 882}], 
                
                Line[{884, 1097, 1300, 883, 1098, 1301, 885, 1099, 1302, 886, 
                 1100, 1303, 887, 1101, 1304, 888, 1223, 1010, 889, 1224, 
                 1011, 890, 1225, 1102, 1305, 891, 1103, 1306, 892, 1104, 
                 1307, 893, 1105, 1308, 894, 651, 895, 1226, 1012, 896, 1227, 
                 1013, 897}], 
                
                Line[{899, 1106, 1309, 898, 1107, 1310, 900, 1108, 1311, 901, 
                 1109, 1312, 902, 1110, 1313, 903, 659, 904, 1228, 1014, 905, 
                 1229, 1111, 1314, 906, 1112, 1315, 907, 1113, 1316, 908, 
                 1114, 1317, 909, 1115, 1318, 910, 667, 911, 1230, 1015, 
                 912}], 
                
                Line[{926, 1027, 698, 925, 1329, 1126, 924, 1328, 1125, 923, 
                 1327, 1124, 922, 1326, 1123, 921, 1325, 1122, 920, 1324, 
                 1121, 1231, 919, 675, 918, 1323, 1120, 917, 1322, 1119, 916, 
                 1321, 1118, 915, 1320, 1117, 914, 1319, 1116, 913, 1333, 
                 1025, 1024, 1026}], 
                
                Line[{2007, 2005, 2337, 2336, 2004, 2001, 2608, 2000, 1997, 
                 2607, 1996, 1993, 2606, 1992, 1989, 2605, 1988, 1985, 2604, 
                 2648, 2603, 2320, 2319, 1979, 2599, 1978, 1975, 2598, 1974, 
                 1971, 2597, 1970, 1967, 2596, 1966, 1963, 2595, 1962, 1959, 
                 1955, 1958, 2364, 2365, 2367}], 
                
                Line[{2009, 2008, 1337, 1335, 2011, 2010, 2396, 2013, 2012, 
                 2397, 2015, 2014, 2398, 2017, 2016, 2399, 2019, 2018, 2400, 
                 2021, 2020, 2022, 2023, 2401, 2403, 2025, 2024, 2404, 2027, 
                 2026, 2405, 2029, 2028, 2406, 2031, 2030, 2407, 2033, 2032, 
                 2035, 2034, 2348, 2346, 2349}], 
                
                Line[{2409, 1377, 1380, 2410, 1381, 2411, 2038, 2037, 2412, 
                 2040, 2039, 2413, 2042, 2041, 2414, 2044, 2043, 2415, 2046, 
                 2045, 2047, 2048, 2418, 2610, 2419, 1401, 1404, 2420, 2051, 
                 2050, 2421, 2053, 2052, 2422, 2055, 2054, 2423, 2057, 2056, 
                 2424, 2060, 2058, 2611}], 
                
                Line[{2425, 1420, 1423, 2426, 1424, 1427, 2427, 1428, 2428, 
                 2064, 2063, 2429, 2066, 2065, 2430, 2068, 2067, 2431, 2070, 
                 2069, 2071, 2072, 2434, 2612, 2435, 1446, 1449, 2436, 1450, 
                 2437, 2075, 2074, 2438, 2077, 2076, 2439, 2079, 2078, 2440, 
                 2082, 2080, 2613}], 
                
                Line[{2441, 1465, 1468, 2442, 1469, 1472, 2443, 1473, 1476, 
                 2444, 1477, 2445, 2087, 2086, 2446, 2089, 2088, 2447, 2091, 
                 2090, 2092, 2093, 2450, 2614, 2451, 1492, 1495, 2452, 1496, 
                 1499, 2453, 2097, 2096, 2454, 2099, 2098, 2455, 2101, 2100, 
                 2456, 2104, 2102, 2615}], 
                
                Line[{2457, 1512, 1515, 2458, 1516, 1519, 2459, 1520, 1523, 
                 2460, 1524, 1527, 2461, 1528, 2462, 2110, 2109, 2463, 2112, 
                 2111, 2113, 2114, 2466, 2616, 2467, 1540, 1543, 2468, 1544, 
                 1547, 2469, 1548, 1551, 2470, 2119, 2118, 2471, 2121, 2120, 
                 2472, 2124, 2122, 2617}], 
                
                Line[{2473, 1561, 1564, 2474, 1565, 1568, 2475, 1569, 1572, 
                 2476, 1573, 1576, 2477, 1577, 1580, 2478, 1581, 2479, 2133, 
                 2131, 2134, 2135, 2482, 2618, 2483, 1590, 1593, 2484, 1594, 
                 1597, 2485, 1598, 1601, 2486, 1602, 1605, 2487, 2141, 2140, 
                 2488, 2144, 2142, 2619}], 
                
                Line[{2489, 1612, 1615, 2490, 1616, 1619, 2491, 1620, 1623, 
                 2492, 1624, 1627, 2493, 1628, 1631, 2494, 1632, 1635, 2152, 
                 2153, 1636, 1638, 2379, 2622, 2621, 1642, 1639, 1643, 1646, 
                 2496, 1647, 1650, 2497, 1651, 1654, 2498, 1655, 1658, 2499, 
                 1659, 1662, 2500, 1663, 1666, 2623}], 
                
                Line[{2501, 1667, 1670, 2502, 1671, 1674, 2503, 1675, 1678, 
                 2504, 1679, 1682, 2505, 1683, 1686, 2506, 1687, 1690, 2176, 
                 2177, 2356, 2381, 1691, 1693, 2359, 2630, 2383, 1694, 1695, 
                 1696, 1698, 2510, 1699, 1702, 2511, 1703, 1706, 2512, 1707, 
                 1710, 2513, 1711, 1714, 2514, 1715, 1718, 2668}], 
                
                Line[{2515, 1719, 1722, 2516, 2196, 2195, 2517, 2198, 2197, 
                 2518, 2200, 2199, 2519, 2202, 2201, 2520, 2204, 2203, 2521, 
                 2206, 2205, 2207, 2208, 2524, 2637, 2525, 1744, 2526, 2210, 
                 2209, 2527, 2212, 2211, 2528, 2214, 2213, 2529, 2216, 2215, 
                 2530, 2219, 2217, 2638}], 
                
                Line[{2531, 1762, 1765, 2532, 1766, 1769, 2533, 1770, 2534, 
                 2223, 2222, 2535, 2225, 2224, 2536, 2227, 2226, 2537, 2229, 
                 2228, 2230, 2231, 2540, 2639, 2541, 1788, 1791, 2542, 1792, 
                 2543, 2234, 2233, 2544, 2236, 2235, 2545, 2238, 2237, 2546, 
                 2241, 2239, 2640}], 
                
                Line[{2547, 1807, 1810, 2548, 1811, 1814, 2549, 1815, 1818, 
                 2550, 1819, 2551, 2246, 2245, 2552, 2248, 2247, 2553, 2250, 
                 2249, 2251, 2252, 2556, 2641, 2557, 1834, 1837, 2558, 1838, 
                 1841, 2559, 1842, 2560, 2256, 2255, 2561, 2258, 2257, 2562, 
                 2261, 2259, 2642}], 
                
                Line[{2563, 1854, 1857, 2564, 1858, 1861, 2565, 1862, 1865, 
                 2566, 1866, 1869, 2567, 1870, 1873, 2568, 2268, 2267, 2569, 
                 2270, 2269, 2271, 2272, 2572, 2643, 2573, 1883, 1886, 2574, 
                 1887, 1890, 2575, 1891, 1894, 2576, 1895, 2577, 2277, 2276, 
                 2578, 2280, 2278, 2644}], 
                
                Line[{2579, 1904, 1907, 2580, 1908, 1911, 2581, 1912, 1915, 
                 2582, 1916, 1919, 2583, 1920, 1923, 2584, 1924, 2585, 2288, 
                 2287, 2289, 2290, 2588, 2645, 2589, 1933, 1936, 2590, 1937, 
                 1940, 2591, 1941, 1944, 2592, 1945, 1948, 2593, 1949, 2594, 
                 2298, 2296, 2646}], 
                Line[{2636, 2191, 2193, 2635, 2189, 2190, 2634, 2187, 2188, 
                 2633, 2185, 2186, 2632, 2183, 2184, 2631, 2181, 2182, 2660, 
                 2361, 2178, 2180, 2363, 2357, 2358, 2507, 2629, 2174, 2175, 
                 2628, 2172, 2173, 2627, 2170, 2171, 2626, 2168, 2169, 2625, 
                 2166, 2167, 2624, 2164, 2165, 2653}]}, {
                
                Line[{259, 480, 1131, 260, 494, 288, 1236, 509, 303, 1240, 
                 524, 318, 1246, 539, 333, 1254, 554, 348, 1264, 569, 363, 
                 1276, 582, 1183, 376, 595, 1195, 391, 1291, 610, 406, 1295, 
                 625, 421, 1301, 640, 436, 1310, 655, 451, 1319, 670, 466}], 
                
                Line[{261, 481, 1132, 262, 495, 1144, 289, 510, 304, 1241, 
                 525, 319, 1247, 540, 334, 1255, 555, 349, 1265, 570, 364, 
                 1277, 583, 1184, 377, 596, 1196, 392, 611, 407, 1296, 626, 
                 422, 1302, 641, 437, 1311, 656, 452, 1320, 671, 467}], 
                
                Line[{263, 482, 1133, 264, 496, 1145, 290, 511, 1155, 305, 
                 526, 320, 1248, 541, 335, 1256, 556, 350, 1266, 571, 365, 
                 1278, 584, 1185, 378, 597, 1197, 393, 612, 1207, 408, 627, 
                 423, 1303, 642, 438, 1312, 657, 453, 1321, 672, 468}], 
                
                Line[{265, 483, 1134, 266, 497, 1146, 291, 512, 1156, 306, 
                 527, 1164, 321, 542, 336, 1257, 557, 351, 1267, 572, 366, 
                 1279, 585, 1186, 379, 598, 1198, 394, 613, 1208, 409, 628, 
                 1216, 424, 1304, 643, 439, 1313, 658, 454, 1322, 673, 469}], 
                
                
                Line[{267, 484, 1135, 268, 498, 1147, 292, 513, 1157, 307, 
                 528, 1165, 322, 543, 1172, 337, 558, 352, 1268, 573, 367, 
                 1280, 586, 1187, 380, 599, 1199, 395, 614, 1209, 410, 629, 
                 1217, 425, 644, 1223, 440, 659, 455, 1323, 674, 470}], 
                
                Line[{269, 485, 1136, 270, 499, 1148, 293, 514, 1158, 308, 
                 529, 1166, 323, 544, 1173, 338, 559, 1178, 353, 686, 687, 
                 703, 1334, 691, 692, 1188, 381, 600, 1200, 396, 615, 1210, 
                 411, 630, 1218, 426, 645, 1224, 441, 660, 1228, 456, 675, 
                 471}], 
                
                Line[{271, 486, 1137, 273, 500, 1149, 294, 515, 1159, 309, 
                 530, 1167, 324, 545, 1174, 339, 560, 1179, 354, 688, 1331, 
                 702, 690, 704, 693, 696, 1332, 695, 382, 601, 1201, 397, 616,
                  1211, 412, 631, 1219, 427, 646, 1225, 442, 661, 1229, 457, 
                 676, 1231, 472}], 
                
                Line[{275, 488, 1138, 276, 1234, 502, 296, 1238, 517, 311, 
                 1243, 532, 326, 1250, 547, 341, 1259, 562, 356, 1269, 575, 
                 369, 1282, 588, 1189, 384, 603, 399, 1293, 618, 414, 1298, 
                 633, 429, 1306, 648, 444, 1315, 663, 459, 1325, 678, 474}], 
                
                Line[{277, 489, 1139, 278, 503, 1150, 297, 518, 312, 1244, 
                 533, 327, 1251, 548, 342, 1260, 563, 357, 1270, 576, 370, 
                 1283, 589, 1190, 385, 604, 1202, 400, 619, 415, 1299, 634, 
                 430, 1307, 649, 445, 1316, 664, 460, 1326, 679, 475}], 
                
                Line[{279, 490, 1140, 280, 504, 1151, 298, 519, 1160, 313, 
                 534, 1168, 328, 1252, 549, 343, 1261, 564, 358, 1271, 577, 
                 371, 1284, 590, 1191, 386, 605, 1203, 401, 620, 1212, 416, 
                 635, 431, 1308, 650, 446, 1317, 665, 461, 1327, 680, 476}], 
                
                Line[{281, 491, 1141, 282, 505, 1152, 299, 520, 1161, 314, 
                 535, 1169, 329, 550, 1175, 344, 1262, 565, 359, 1272, 578, 
                 372, 1285, 591, 1192, 387, 606, 1204, 402, 621, 1213, 417, 
                 636, 1220, 432, 651, 447, 1318, 666, 462, 1328, 681, 477}], 
                
                Line[{283, 492, 1142, 284, 506, 1153, 300, 521, 1162, 315, 
                 536, 1170, 330, 551, 1176, 345, 566, 1180, 360, 1273, 579, 
                 373, 1286, 592, 1193, 388, 607, 1205, 403, 622, 1214, 418, 
                 637, 1221, 433, 652, 1226, 448, 667, 463, 1329, 682, 478}], 
                
                Line[{285, 684, 685, 1143, 286, 507, 1154, 301, 522, 1163, 
                 316, 537, 1171, 331, 552, 1177, 346, 567, 1181, 361, 1274, 
                 580, 374, 1287, 593, 1194, 389, 608, 1206, 404, 623, 1215, 
                 419, 638, 1222, 434, 653, 1227, 449, 668, 1230, 464, 698, 
                 699, 700}], 
                
                Line[{465, 669, 1333, 697, 450, 654, 1309, 435, 639, 1300, 
                 420, 624, 1294, 405, 609, 1290, 390, 594, 1288, 375, 1182, 
                 581, 1275, 362, 568, 1263, 347, 553, 1253, 332, 538, 1245, 
                 317, 523, 1239, 302, 508, 1235, 287, 493, 1232, 258, 479, 
                 683, 701}], 
                
                Line[{473, 677, 1324, 458, 662, 1314, 443, 647, 1305, 428, 
                 632, 1297, 413, 617, 1292, 398, 602, 1289, 383, 587, 694, 
                 1281, 368, 574, 1330, 689, 355, 561, 1258, 340, 546, 1249, 
                 325, 531, 1242, 310, 516, 1237, 295, 501, 1233, 274, 487, 
                 272}], 
                
                Line[{1340, 1338, 2011, 1382, 1381, 1426, 1427, 2062, 1471, 
                 1472, 2084, 1518, 1519, 2106, 1567, 1568, 2126, 1618, 1619, 
                 2146, 1673, 1674, 2655, 2167, 1725, 1723, 2196, 1768, 1769, 
                 2221, 1813, 1814, 2243, 1860, 1861, 2263, 1910, 1911, 2283, 
                 1961, 1962, 2302, 2304}], 
                
                Line[{1343, 1341, 2013, 1385, 1383, 2038, 1430, 1428, 1475, 
                 1476, 2085, 1522, 1523, 2107, 1571, 1572, 2127, 1622, 1623, 
                 2147, 1677, 1678, 2656, 2169, 1728, 1726, 2198, 1772, 1770, 
                 1817, 1818, 2244, 1864, 1865, 2264, 1914, 1915, 2284, 1965, 
                 1966, 2305, 2307}], 
                
                Line[{1346, 1344, 2015, 1388, 1386, 2040, 1433, 1431, 2064, 
                 1479, 1477, 1526, 1527, 2108, 1575, 1576, 2128, 1626, 1627, 
                 2148, 1681, 1682, 2657, 2171, 1731, 1729, 2200, 1775, 1773, 
                 2223, 1821, 1819, 1868, 1869, 2265, 1918, 1919, 2285, 1969, 
                 1970, 2308, 2310}], 
                
                Line[{1349, 1347, 2017, 1391, 1389, 2042, 1436, 1434, 2066, 
                 1482, 1480, 2087, 1530, 1528, 1579, 1580, 2129, 1630, 1631, 
                 2149, 1685, 1686, 2658, 2173, 1734, 1732, 2202, 1778, 1776, 
                 2225, 1824, 1822, 2246, 1872, 1873, 2266, 1922, 1923, 2286, 
                 1973, 1974, 2311, 2313}], 
                
                Line[{1352, 1350, 2019, 1394, 1392, 2044, 1439, 1437, 2068, 
                 1485, 1483, 2089, 1533, 1531, 2110, 1583, 1581, 1634, 1635, 
                 2150, 1689, 1690, 2659, 2175, 1737, 1735, 2204, 1781, 1779, 
                 2227, 1827, 1825, 2248, 1876, 1874, 2268, 1926, 1924, 1977, 
                 1978, 2314, 2316}], 
                
                Line[{1355, 1353, 2021, 1397, 1395, 2046, 1442, 1440, 2070, 
                 1488, 1486, 2091, 1536, 1534, 2112, 1586, 1584, 2133, 2132, 
                 2153, 2380, 2355, 2356, 2649, 2508, 2358, 1740, 1738, 2206, 
                 1784, 1782, 2229, 1830, 1828, 2250, 1879, 1877, 2270, 1929, 
                 1927, 2288, 1981, 1979, 2318}], 
                
                Line[{1358, 1356, 2023, 1400, 1398, 2048, 1445, 1443, 2072, 
                 1491, 1489, 2093, 1539, 1537, 2114, 1589, 1587, 2135, 2353, 
                 2352, 2379, 2154, 2156, 2360, 2359, 2651, 2180, 2179, 1743, 
                 1741, 2208, 1787, 1785, 2231, 1833, 1831, 2252, 1882, 1880, 
                 2272, 1932, 1930, 2290, 1984, 1982, 2320, 2667}], 
                
                Line[{1361, 1359, 2025, 1403, 1404, 2049, 1448, 1449, 2073, 
                 1494, 1495, 2094, 1542, 1543, 2115, 1592, 1593, 2136, 1645, 
                 1646, 2157, 1697, 1698, 2661, 2182, 1746, 1744, 1790, 1791, 
                 2232, 1836, 1837, 2253, 1885, 1886, 2273, 1935, 1936, 2291, 
                 1987, 1988, 2321, 2323}], 
                
                Line[{1364, 1362, 2027, 1407, 1405, 2051, 1452, 1450, 1498, 
                 1499, 2095, 1546, 1547, 2116, 1596, 1597, 2137, 1649, 1650, 
                 2158, 1701, 1702, 2662, 2184, 1749, 1747, 2210, 1794, 1792, 
                 1840, 1841, 2254, 1889, 1890, 2274, 1939, 1940, 2292, 1991, 
                 1992, 2324, 2326}], 
                
                Line[{1367, 1365, 2029, 1410, 1408, 2053, 1455, 1453, 2075, 
                 1502, 1500, 2097, 1550, 1551, 2117, 1600, 1601, 2138, 1653, 
                 1654, 2159, 1705, 1706, 2663, 2186, 1752, 1750, 2212, 1797, 
                 1795, 2234, 1844, 1842, 1893, 1894, 2275, 1943, 1944, 2293, 
                 1995, 1996, 2327, 2329}], 
                
                Line[{1370, 1368, 2031, 1413, 1411, 2055, 1458, 1456, 2077, 
                 1505, 1503, 2099, 1554, 1552, 2119, 1604, 1605, 2139, 1657, 
                 1658, 2160, 1709, 1710, 2664, 2188, 1755, 1753, 2214, 1800, 
                 1798, 2236, 1847, 1845, 2256, 1897, 1895, 1947, 1948, 2294, 
                 1999, 2000, 2330, 2332}], 
                
                Line[{1373, 1371, 2033, 1416, 1414, 2057, 1461, 1459, 2079, 
                 1508, 1506, 2101, 1557, 1555, 2121, 1608, 1606, 2141, 1661, 
                 1662, 2161, 1713, 1714, 2665, 2190, 1758, 1756, 2216, 1803, 
                 1801, 2238, 1850, 1848, 2258, 1900, 1898, 2277, 1951, 1949, 
                 2003, 2004, 2333, 2335}], 
                
                Line[{2345, 2343, 2408, 2348, 1419, 1417, 2060, 1464, 1462, 
                 2082, 1511, 1509, 2104, 1560, 1558, 2124, 1611, 1609, 2144, 
                 1665, 1666, 2162, 1717, 1718, 2666, 2193, 1761, 1759, 2219, 
                 1806, 1804, 2241, 1853, 1851, 2261, 1903, 1901, 2280, 1954, 
                 1952, 2298, 2297, 2337, 2373, 2372}], 
                
                Line[{2366, 1957, 1958, 2647, 2282, 2281, 1907, 1906, 2262, 
                 1857, 1856, 2242, 1810, 1809, 2220, 1765, 1764, 2194, 1722, 
                 1721, 2165, 2654, 1670, 1669, 2145, 1615, 1614, 2125, 1564, 
                 1563, 2105, 1515, 1514, 2083, 1468, 1467, 2061, 1423, 1422, 
                 2036, 1380, 1379, 1337, 2375, 2374}], 
                
                Line[{2602, 2600, 2648, 2587, 2586, 2645, 2571, 2570, 2643, 
                 2555, 2554, 2641, 2539, 2538, 2639, 2523, 2522, 2637, 2362, 
                 2361, 2382, 2383, 2354, 1641, 1642, 2620, 2481, 2480, 2618, 
                 2465, 2464, 2616, 2449, 2448, 2614, 2433, 2432, 2612, 2417, 
                 2416, 2610, 2402, 2401, 2609}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJyEfWV4FUm3dXB3S3AYHII7OV24u7u7uw06WAjuDJYQBgswSHByurDgrgEG
ZxgGGIIGCZCvZa1KTt97n29+3H6yb79FdZ2SXXuvtXae7kOa94rv5eU1MoWX
VwLj6R53ruLRUrOO8Oll/fdWHM6QKfGuiTnC9lU+kut7mTxhtCc4fWnZlTqr
woqtOhc0tlewspdzN+hSopyX+2fbbu0ydErppn1rKp/Cvydq4O5b/niw/8wu
yv5r6I9PvR5McK8t9e7U79V/V3bj/+x5vH2hu8vPtxvnFHfHtZv/+VU59v7J
skZnnO+7ip53e7zvPeXcX0b7roQr25yO2/6VAyferEzUwOXsT7nWiXIa/Xdd
yP+nR/+HZpn18XKdVX5dLro9vtf7wXqvnRNz+DnHZ8r9XTllqVlVnOPJ9ziu
tBeYMO7SnIf7wvikPX+RC3m/TCzjjirovTuqRwXVn7nfEv1+K/lK9/cCkTny
JA1W9uU5s344nPyZ+/rBD+WOJP+o7D4tcibu0y+T/kEvPzNVmpJ6nHF72zOs
kP74e9skDec1V/bvMeZ/C/yCfE63XvK8s27/Hcn3Nef73Q8ljOrdL5OW6bG3
R/u1SxQ9Y/TH5ezPqFPpKxr9d1UdEOrR/0cX/LZ9nljG9T++d8frlMa4+NVd
18FzfALzNI4uk8fPOZ6cl5yntLNdjivtWXuP75A1Yq+bT9pjkjb3PbXPR9+z
osrr1elyq+/qEt3wWNDgXnp770EnS/41TH+O8cnebXxU4N/Ldd8tj1xJA7fr
hd7Z9mSZYiZvHBGi/1jwV3Ad/yv60ac/LfvhZD+MZxrXxcAXw/vPvqfbf6v3
Nef7nU8/emK0ryVo2Myjfd/iU5Ya/dFKht0/Ebc/wwcfDA/f56Ot+ffDq7j9
b3q+6z2fiL2uEhmPe3yvd4Wtjz/1qODK2mKLx/iM+7nr6JhewX7O8eQ657pX
8wfzkvOUdo4jx5X2Wskzpnl+dZrOpx/6/7z6pHybZlzR82Z6Vss/yS01Pr6V
a6YO2xRPiiTDioRtSicTB4z/ado3d+0zvFbPjHLJBq81tXqWlb1T9Hhm2qcn
e34gJmay60ZMxzMzoqtK++9IsbVrn6HG+8L5fsj1+z+PbIon7gSd82i/e5rz
XkZ/tFZ1D3j0Z26ylkf/vjpNq5P8o0f/l/bwn218r1bSr1axuN9b5IrPpNxJ
g11tTjdfGXd8ioTV8UrfKaXLOZ7cp7iP0s51xXVPO+cl5ynnA8eR48r+F6/x
eWmRTnkln7dzj/5k2sv7jPtjzLoWMuHeUwGhgzrJ9plT54g27C3a/JLfK6S3
3HN4d6kpMVOk95dy7p2G/UKLGmsrxEjXiSEX8y9tMlfaf0eKROV/KWW8L35U
q2y9v+iD/X6D6Q8XGu2LU/vRvo/dfr7RRYYY/RBFSj9fZvbnFfozo06b/2Yl
uaUF/zzk0f+vs0JaG9+r3R5+0uN794mw6YeTf3T5Hgx9F3d8+l24l3fWzC4u
53jyHOK5RDv3Te6jtHOdc91zPXJecp5y/nAcOa4cz9k++bYeGbxA8hm+ZtDb
dD8jRa9jwRGzswbLpkeOPJ6ddY+Mye7/oP3zSFHnVZZTfU7HuNZkrhtaLLku
7b8jxVG/zTeM90Xi+G7r/V0dA6z3Y7w7BBjtitBDcrPZ/vLlQ6z2vVs0aWD0
RxTMa/fnbT67P7cq1Xx2ZFM6sTYoJI3Z/7Tof+M1yeYnCdyu1Vu640Pc7y1U
O+ZzyjQlNef4hBUftmRl9d9dzvGMc65b5zztcc4V61yinfsg91Huh1y3XPdc
v5yXnKecnxxHjivHs/b+V5/zDT0p+fyz2sQE/YpFitJFOl4986C4dnps3nWJ
712R9t9vRNqF4eZ74ujTtT/M99emq2G9Pyn6z8tG+6JZpbBbZvu/FdljtX/u
9IlURn/EuhL5rP6MLVzB6k/ghqD6Rv+FbzdrH5LlU9r9T7mgo8v4Xs35vR+X
lu7RYF5zzTk+w7q1qR5Q3O1yjqenn+TlR7vnub7Aj+e75zmUxsX15blvTnZx
//Rc59LF9e45L2NcnJ+e41hc43ja/aqqeT7filN53wQa74vGA3JY79vPN8K9
7fdVRvvirGuU0W4azX5GigIVC/67pMlc0fvP2kY/LrvsZ6T4fdXo6Ub/xU3/
12djYma5TqWw+3+zwm9n+82+pzm/d21gk1qLn3fW7HEJVOOTtm3KI0sbnXE5
xzOO32n5of/HfFbf5ZjPmnM+81zifOa+yX2U+yfXOdc91zvnJecp5yfH0XNc
34g57jHm++o573FS6/1Te3dY8/mT+8Bds/0rL3da7T+aFGPN57yZ8/ma/bme
x57P126NiDufBefz50cZ485n7X+Zzx/jjs/GpQFx57MaT/rx9Otpp99JP5R2
+kn0m7hf8VznOc/9mecQzyWeR9w3uY9y/+Q657rneue89JynkWocOa4cz+MP
Olrt8jm45zCr/ajeXeub+/O4Al8Xm/25VdDuT5Wgl0/N/bnOoDE/zP5zf670
5tg8c392fm+Hcdes/Xn+6wof4o4P92fneNLf4D3J6W/Qr6edfif9UJ6/9JPo
N3F98VznOc/znecQzyWeR9w3uY9y/+Q691z3kWpecp5yfnIcOa4cz0M/9ww2
+8Fngjx2f3I93mX5GznPJ44Xt/8Ju1yy/A0/sWhJ3O/Nuqm75W/cP3PyVNzx
WRuT+hfT33COJ++ZvHfSznsR70m004+nX087/U76ofQ/6SfRb1L7G851nvOc
PzyHeC5x/XLf5D7K/ZPrnOue73Necp6yfY4jx5X9ybfhojT7zafTf968fsCp
uN9L/znka7jH+HSM/BaTzvSfHePJezvv8bTzPsh7J+28F/GepOY5/Hj2i3b6
nfRDOR/oJ9Fvct4Hec4774Oe51LsfZD7qPM+yHXP9jkvOU/ZH46js/+9xm2x
vpNP2nkfvPnJ22N8Mqw8Z90HnePJ+AbjIrTz3s57PO28Z/LfoZ33Iv7OtNOP
p19PO/1O+qG049zV45wzXrHxjUA/z3Peim9Y55Dzfe6b3Edp5zrnuqed89LZ
f46j83s5Ls7xYXzDOZ6MKzHORDvjIPzf0c57O+/xtPOeyXsn7bwX8Z5EO/14
nhtxxtnyO+P4obSb//l5+k2x8bo457xX3Hids33um9xHVf+xzrnuaee85DxV
7WMcnePDcXSOZ95GeyuEr80XxiftSxc+Ldxp960jvw3850jf9DdVfK9bhXEd
Tq7N5+d8v8fHepk67r5Vxfl+SPE1Jac/Dpd8JhpTv2r8VJHiZHjXssbfYkL+
yZY9rHoey86/+f+nfWVYDetvPkel/iJMe/2c3rP3dhVaxld9Li7MeRZ/R6rv
Yn+d31V7eK+7fdLfrOL8Luf7fI/fRzu/k+0533faMU+8avU9vd/op6zwrlKA
2U/+zf8/7Z7fIzR+F/9dZ3/4t/O7Jt+4WW7uqHdHFuDpsFeZ/7/bj8DubKfK
Aoe999OdpYb3PnXkaP8BI0JWHVTttLT/rtIQ/3+H/QjsznaqoJ0qzverO9rh
+7Md/y77M/t/b6dKdce/277uwKU78oWGNZlYpPpM40n7/FUd/6riXhL24qSI
vBS0WtljfvX59rSOr7tTWPg/QxeWUvfQA91jIp/3+xi2IMmlhidvxlP2sPs7
CyauO98df9nINmLHcmVfcDZVrtdJ/dzBQafWHSzbVNnHNn6yOd35G27v0k+1
76ti4zlXS77svf1hP/fMdK/jje47Q9kLXV88/nDJBHqPMkdnV6uYTd2XW/4i
Mt0uPM19993iiSLtFvV+R315mBiUXS+SMn6x5Ss19f6nmMmfAorPc7+YH7k1
1xqp3v8SE9M04o/8+sSjtd+N9G6px+Ac2VFhewrjBb+KjjxFSq8pX412XKmP
H/dop9SOpum8vBb6rcW9/AfaSerl1cJoXxuB9n/CHv/t+RRG/10z9UCP/scE
TNtl9F9btfFV0bj9PzTyeX1jfFylH1SMH3d8utY/18cYH21g7yUe41Mg1R+P
XiX1c528ftpj/IeGvxpnjL/rl5aPPca/8+hRa43f16/Rxx8ev+/g4j47EtWd
76r5srDH75twfP4exvzxC15UzGP+rNnarbYxf1x393rOnzrfnzycOzyzX5Xe
Vf+QhbKq919/TfBqe75Qv1wd0nrMz00lJpdeN7asu0OLzx1TpIltp1b+hdPv
NNnprh1Td8bzRjuVvdrEvxI8KplWr7bveuo65TLGjtucA+8b+7XWC3y6tMHd
sbv+FeOf/FqaLFNnTNcrzfW5uKPaSr3BD9v+z7B7B5P3XqdPepn28MsaR/Q3
F237Vb+YSyXzb9bTZn3wfcCLq/rb/bb/lm77b+m9vNK6zjri/0/9Yq4Y72tJ
He9P1wqFGO1r5wveOxS3/YXrOsYz+qMtCFpxIW5/Vr/bcdzovzamg8uj/6Vb
dzz+sGRaLeus8R7f658o/smIJjtdvYbv9Rgfv2xvJ6wdW9aV//Ntj/FsnXVl
eMyCQPf3Eve8JydfpuwFOrx4P+gXb73mmQ1t2jTOoNq/KNf2Xho1Vs+QNIff
29dj9T3oz/Tqn1uWy3dM71ym0+gsm07pjcrb9v+ET7wHGyL1WrP+Cqjz6ode
od9B+15QpMipEkOSyAPdArpsvZJb1j+YItq0F1v+z4mw2+lk6aPLOqzLXF6u
blLjkWn/1H/4DTNudR1xrBmIX1VYXvCk8b4o7Hh/fae1h4z2ReXobR7tP9l4
+8H9DZHaxP86zInbn39SXypu9F8b07uCR//LbEyUwPhe7cLIMq6436sFz+ls
jI92Od7d1nHH50DJizt+Lgh05eqheYzn5TbjE3QNeOde+MuUY1UCHseux3Xa
9MY3+utZpu0X0Vm66u/QftUvIf/+1M/rNyscXVfu9El99XV7/lRJvS6id6oM
8r/xC063eZxetppT8od1/7qQ5UXfZdVkx3FbU956W1emnVUqi2kvoG///ChF
e5k0qm+VbUkHyv41o9O9M+xT/afeOn6jhzy/IXG5Gf1+k6n63fHZaNgnvjn4
lxkHPIq44EXEA7P2iffEeF8MzrqurPn+zl72++UmfH1jtC8STH5X2Wx/ZW27
/ZGrJ1w3+iOqXrlk9ecE+rPlbspdRv/FzjpTzpj974D+D9+5e5zxvVrwshSB
cb83TZHqDxvd6K+lPJGmatzxWXapU98uAe9cL2bXPhp3PGu6Jtx4la2YvqVi
gHced/rY/ObqovsaTd6ov2y2tvniUov0oM92O2W/bz7WrkpiOedcwt9OlI7S
x2/oZdm7FprVI7d/Yxkq//D7s2hN2aGJa/dPM94bU/fRtGIT5NfQSjE5/hgv
Y/ZVSBJszv9UJbr7RyyVhSeGbJ//fK3MVPlk9KVvxjqtmfr4552BsvG4ZmeH
/B4ql2X5MD3Rs0gREXTmixlXXYU4az3EV7OuSuc23hejfmluvZ+pxUfr/bdf
/mhptC8atS1gtX953imr/S9va0ujP2JAoeI/zf4c8a1o9efjx+25jP6L3V93
Wv3v3cLu/5mKL/oa3yuarjg6zfzeifjeXeUTlDLGR6t2cFrTuONz4d2sey+z
FdNWO8bzasrz3+b4NdUT5c6W++nG/Mo+bUfjrHtuntFXDq1S6dVfG/SNXex2
sqf49iDyz8JywasmDRNuTCZzpUplxWeS3GgavD14mKzX5dCjEo3ayEUZHwx9
ac5n3xWthRYkm055+uX9/vnSX6To9dH43urFa/XZeueALLGwdolLKXbL23sD
CmU/Fynk30vaVH11TPZ/mndooXyn5Ifq3mlWlo4U0UW+/mfFSxG3LoN4tV+5
Vu2M98WC5ulHme/7ZLmS2ny/bqKd7Yz2xfTNI0tZ7V/802rfu2L/GkZ/hHea
BFFmf1IVzmT1J+nG278a/Rd6ohCr/z362f2/E5BurPG9IvrV5Xrm9w7H995c
GTZ1980z2hzH+CRrlXOAMZ5aVC7P8Qzq1TC8VooOekLzz/hz/ehX6NMT/nr2
zxt64VLGOkmS1FWppb1eJoz+pde+HuVk8N0692OyjHQNutXnqWkP+Fgs+5gu
E+XlQw9G7I3Z5XpZcnaGc4b95Tb99JnvIXJPq/rf43d+6Yrutmvnmo+RYtvc
up+uHjkho1IWPeo7NJN2pHz3bmnWGfue/7FqZ5dcFgMHpBzydlAZLUnXZk0u
xY8UCVp8e228L3xlxb/dfbNpoQX3We+PnrBjm9G+ECtmGO1/c3lnPmO1H1Wn
zr3RXSaKMkXXZtkrj7pK5wqw+nOsU600Rv9FwbV/n4/JMsnV/Lbd/9ttQ6PP
/HlDc5nfmyapqzK+t0fHdzdrpuigvTWHxWuNGp8KKTzmp/Z/zE/NOT8X2b+X
4PwM6XBnvTk/j9ba+tr4fcXADPbvm853hjU/K6U9+9GYD+LILHt+pptfoL85
P0Wrg77G/BE5e8+w5k+tkSs6mvPz9d/jzfkpLtV5bs23XAMPW/MzHPH8Jojn
Hz/RtrM5P9O06m/OT/Ep2zrr/feuuR3N+ZmgxNPSZvu1ftlgtT/g0nBrfmY+
7/ph9uf3fRmt/jyOSjfBnJ+13299YfZ/cB+7/5dCI8bEmZ+C83NfhmaYn34e
47OhNefn6l/ijmevmDrWfjs/6Yjkxv6g7C2THN1r7rflvJ/XMPYTjftJ4fxZ
jpv7rVfPzYON/Ufjfpv65Fxrv+0ftaCQsV+J/E3t/apDR9dDc7+t3SL938b+
Jk6ntfe3ZQ/3dDX328pdUyww9kOxsOd5az+sO/iIuX/KQfGH7Df2T1F0Rd4Z
5v65dOXFh2Y8/zDi+ecQzx/fZPsZc799PHSQ9X6tp7ms94dX3dbG3G8b97bb
r3H/gtV+9Lq81n7rN6SP1R99it2fgMEHc5r7base64qY/S/a0u5/9YtjrP32
XY9/BprfOwnfe7jTxZLmfvu5598e49N7TiVrv617MyZJ3PGk/zBZ/LfaOO9U
nKTU0j7TTP9htG/6nMb5qPF8LFJ/mOU/aAnvDzPOU43n6cXlc+6Y/kP1jBuD
jPNX8PxdUcBl+Q/hrwvevvm2rgiZbZ/X8zLusPyHw2n+jAlJOlDoY+3zfbaI
b/kPrVfFS234A2LFlbuWPxD6azy3Gc/P64jn++eI/9D0H7zvlrPe/+Ws/f6d
ZPMs/2FpiYVW+6Hj7fYfF/pxw/QfJqTtfsvsT8cAuz9JSq7cafoPa8aXsPrf
Df3/nDXveNN/GFK3wPC433tdjrH8hzVBnXPEHZ/T/dJY/sPtjaGr4o7n6uUl
LH84XuP4JyclX6bshQ5OsPzheW0ikhn+nvpdwl/s7WP6wyeD0t2JfD1Wo39Y
9WelVqY/HNarfTbDn9ToT2rTayUw/eEELU5kMPxPrSL8z98/l7f84eCls7Mb
/qoYBH91zfLNx0x/+GmBvgkM/1YsaGr7twGHSkeY8fwVjnj+huWbLX9484eq
Hu8nWbTwoOkPz13azGp/MNr/sv/KX6Y/PPh1fY/+DF2RqITpDye9sNOj/6U2
dopv+sNjd/SPiPu99If3veycPO74vCxq+8PHsgZ6jOed4vb9burtlh+Tpyml
7L1Coq37Xb/Lz0/+3Winsp98Uda63+2dF7q4drmMqv3zawp8MO93+c5HlTbu
RxrvR1meJs1k3u9O/JWuonGf0nifqhdxbL95v/OpFZTeuH9pzvud1vDxfOO+
pjnvd1cd8Xze754tCfZ4n/e7FftcHu1XqVfBut9tDX1cIW5/aqw5ecy832UL
zlombv8PHbtg3e8KffX83i0Bg6z7nX/15uFxx+dmdvt+1/DXch7jWaFAcyv+
8yb76ZUzjHs27VNDnn414zzT8sVvaNzT1fvlh18uYMZz0h8fPl/bsVzZRzYe
vcmM29RMvcM/elVsXqzg9fZWfKZWi7CVVStmU/1kHGZjstI5lq3UlP1LTEwT
M97SqPxoMdK7pcZ4y4rWW5J6eQX5rUI8PzZ+MqWNGT+pifcZP+n6rp8VJ3k2
JK1H+8d2je1lxkNe5Brg0Z+gLwFjzbjHopEtPPr/6vgXK74Rc8zze1P+U9SK
Y4xxjA/jFY8d4zlr4OTN84ZnDlu6fFYvvVBWZWecbf78XesuBq1WdsbT8jy8
OOLEzXiqfcbNSiYacudA2abKzvhYpjSNf4zsO0PZGQdrnHd0Wy3tFmVnvKvR
nMuFcq6Rys64VipHPF/Ftdp+93ifcaozRxZ4tM941KfUzT36w7jT9AGzPPrP
+NLYROs8vpdxpCcfb3mMz58Zflvi139XGJ+0J6r64ulnP1931PpmRaMDYuMY
v//7y6fAVPPdnfvNKFUhIDZOdX317dPRyW+4NwzI+vZDHPxYp3aLJ2RL66X7
jN8ScDmLt/K3awq/1hVPJ9VL1y8+Peni0soeFTP580xjPHdPLnz+D58Syn56
SPv1eY3xLHHJM06YbIpXc3Pejk15oUtBV1P1fvoUb4dWzJBWW1Tyy/yi+WPx
P38XiZfhQMU7rvs7Tl0p1e5f1Y545h8T/6m/6/uEs91bJVwSGxcdkjPH2QJ5
XC9a3Ew+/Wt+ZV8ZU+i30HN/+JUuHNbl0ZEtaty+PCv7ZuyYsu5M+bsmr5w6
dtyGTPkxtnTNnW4+ab87ro7PoXRp9caz/H7kzxwbXwo+Ec+725BW+pMkoxMd
+6ubikdFnEq3qV2JqXrQmy33+oxfpv+L/e3WYP9VJ5YE6Htaxvuv+dJdet43
tv1kBa/mt819oE32WXVSbNf3f7DtBSoVnJ7ea6Ffl1yecdS1db2s/Xbu2dvx
KkRd0CPz23avFUHZl1dcpN3anuJU1zUb9bnwo35p3fOXY/U7aHda5VzxLkMf
/RPa6X3DnTNHhZSau+ue5h8Wx95nZ41O3Xp0/s2uknu6jSn0T0js+Pxzu+KY
MWVdeukJqcb0L6/s7oLtC76rt9dvd5B2J+JTbNxyxPaj87T5ge5vjR6mnpws
Nv6zPWPT2lOzeuuLt37K1bdubLzo71JjNvx1aqzO5170899xj6dUm3VU987V
fVxAslN6g+q2vdf2IpUnz3qpH7o45EGNGd/0NinOWnaxe22rqC0f9UKlthct
uyCj7BysWfn6XXXXtjLPtf/6rjnw9Uk6WSnZUdv+NPMvSYxzbe56z7jlsXXf
zPibqDSoXeDUv0vJJRncL037uJnT6sXb+U2bXWPSxI4/k8vHrXJY7yc5EBRz
7VC41rHC39lbVLyk79xon4PFM438e57vOG30iyfDfsoJ+kZ818EFh6pfyZld
W3o3oILv4RxqHCZdazAyy9PdrmVHWhc/lne3GrecJUYNevWirGvjmCv3UjWJ
nbeZvMc/7z/7nXtwQOOdA2bHxn+aZi9UZ9G5/vqaN5s2FcoQGy96GRH941XA
eb1g7xela245qW+/bffz2J8/0uTqnl7ymTJ7R8ufDDs+a0P8FS6ZrFzvv674
1pbxfzRsbNrXTUt67d7EOrLz6a6bh/brJusWbnPom2E/2mtKtzOGn3ZwXfV+
F7p3lUfXH79g4lJW3g28Hc9riqu4VyePuGXgmcwJww1/uOSi8ScyJZgkc872
XnDMjEdt61noVtrGophPxJQ5bdvI3G2iv38377lDVzU4WCOrmFuqx4XoxTlk
+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
f6iV387TX0fenvl65pWZZ2b/D04MtfCpp8s3sfCqxKlOa99ir4mnbNq+1hMT
X7kP+LEBA9YVTxPSWpapdr5QzTTDxbatzyw8XoIdNt4ieqONvyDu4gLwAT2B
F6D/nxT57H+R32Z/pmdobeE187YfY+E3idvMkCv9NROPuGVv40cmPpG4xEjg
DLYCd8B2jiMvPhB5ctqTj7DxiwEhNp6R+MPUyJefRv6c7zNf7jxPydtx5kmZ
/2Y+nHnwlchbZ0Aem/lr5q39HXlw5r+d+esNyFuHII/N/DX51eRbk2fNvD7z
z2ynEPLXlRx5auqtOP0r5q2d7TAPzbw089HMlzN/zrw5eTjk5bAd7xE2HvRY
Hxsfyt/lO/COVx18jU7g7ZDHw3YagX9yB3wU2nfmLGLOH1HkRfy6Js60GOZP
3wytLdxkkg7dLBwl8ZPk/9wAH4jtPAOP5Q/wWjif51SweRdirs3D4PwvtstV
xVgvYlKvKU2N9SLPN7LXS3r3oSATl9krtW/KHjWayXur7PU1ff5JC0fYsUBj
C1dIPGFW8I46g4fE/iyKtPkzv5+2+TRc7/Ffz7P4HoXP1rX4H+R9LBhyO91V
39ry577jL02+wtav9n6SrmPn2cb+I5Zk39rV2H+kGNLS2n9uriqZ3NivRK0n
i44a+5VMHG+ptV+VbRbqY+IaT00NLm/iHN3AN44pPNrC4T0qlNHC5RGPVwr8
qBrgS7H/Xn1snk/WuTbvh/tt19a5i5u8lEoX07Y1eSqdsD93vLr1jrGfywf1
Jh009nPZM6G9n29eOWqisf/L9uuSmvu/3HdztrX/b7hyoq1xXohF3npP47yQ
DR785WueFz0KXB5rnC+itd+GCON8kTVmJbTOl6onvcKN80jcjrk/zTiP5MoB
IdZ51OGid3kTRxi4fmY+E1f4o6d9fn2eO9XCvUW322nh4Ih/2wPe1yfwwPi9
o8Ns/lK3YjafiedsyRmBusm3GevjamnmBSriXC52c3qkcY7LtDUHzzDOcZl+
p32Oz1l5+xfj3Jc9vLe873m7h7wxa4h17q+Vq5LkbHVQTr572N/wE2TtbQss
P2HJX7fOGf6GSJZ+SmHD35B176yx/I3l83rnN/wTsX33su+GfyK3iq+Wf5Kr
55uIDAkmiVfrlp01/BnZbUJuy5+Z9n2ihefL5RNs5WXKAte3uLeNP7tRy8aj
0V8iXuqzAx9O/hv5cLSTx1UQvC7ep8g7yvC3zUNSOvbgydSMCrJ4M8w7kNcx
qUiYxfMgv4M8hOB+K7eZvATyEYj76eQ/7nbcOD9xt8+Chp2JG88nTjQsvY0b
ZdyeuEbiHBmfJw6PuDz2n7gx4sj4vQvB90sH/h/HJ4meaYnh94ppVdYHGH6v
SD+9heX3kgdIXiDfjwCfjfw2+tVtvh/61/DPhf/BdK9fl98qKtQYZPnn57rX
XmH482Jpz5W9DX9eRC9bb/nz5BNq4Bey/TDw4siTo30seFzkdfF+UeDs2a39
eyYUr9K0WGfcU0SFyamse0rHYVcuGvca8azf/gnGvUZcr9PPutcsL7XwholL
Lt1+wRETpzxjsX0PIo+RvEb+u+Tj+YOfp85r8MfIJ6N9APhO38B/4j2O/Jxz
DrzrSK90O0x8/+l2p9qZeP+vuA/q01olNfHo4bUv1TDx6cSlR8jcFn66Rdv8
Fp6aOOqKRW2879xJNv6X91PyMMnLZD/JJyS/kHby38iHo518LfK3aCe/KC/4
RryPf19l8xPKhtt8Bd7fB12x8fRXBtj4et73wy/Y+O9cwIMzPkC88t/ALzOe
QHxtDPC27A/5kORH0v4H+Hvk89E+FHyz6+Cf0T4P/Kgm4Eupcx98nqXg9yh/
BrwL8jC47sgTKAneAN8/AFx7N+Dc1fwHDrsRcNm0RwM3PAg4YtozA+eaErhX
2rvCD2viwFsSN/mzboSFT2Qek7jJUg7cI/exrAG/W+9zH4v/wCtyUHVfd5Gd
c5LtnxfLi0xcYeqx+WXnu/OUGv9p0fpYHvTl9Q9LpFx9w/2rV6mi30bH8qB7
tyz256qF8fW89/K4i6zMqvbz1xviX/561Ee/MyDZwkkr/GLrOOTKNrX1/Lz6
oCsHn+093Uzltfub2378uX5rHLi+pOcPpfWrmll7/yD067JW5WLrHVxtlKfT
rmjX00fS52mZWB7i6fMPqxdYetlVPt/90DllH6p+znB9Odm6jr+rU8j7R9+L
LVb2B/qiiGT9C7nGjWl3rWT9WP+zKcZfOMZ/c/5xfbJlT6t/fDW47czcsbzm
Pzd3TBRxs5U+fVJwS5k9Vmfva5mQ/bdLTNN/+swcWDT/Cn0e/LHbXX5m/LF7
pf57z/2jUu09oE+9a9uHzqniP3p+kF5ANrv0bdl5fZzLti+enDi/V9KkriMO
nF67sZdmnq88XGuR7+XoYQmn67Pw7zZ+tGFbkpx1tIA311yt3jVXupFBk76k
fLI4gZY1Imfzb/1j/a7mWsFrAf/94Rr4sWiLOf/9ocahYbrFl0rU93UtfV99
cPL+hWL5s6+fj5r051G91LOggztKntJbCbv9VW0DWkcsfq0Hz1rdutbjaH36
1uOWfW3oyrE3H3vJsMPzRtXwziZj1t39btr/anjn9fs5CeXAsXqn9Rl8ZY6N
Xd+b9jx+N76aeLlxDrxc3sTNJoyfskF7ePpZ0yxtt+qJ39r/bodeD/YPndxT
+2ORV/Jhk3vqH/C9i692DPvaP6l2quOSDsZ3x8Z5mqesaswD16mtmwq0qRMb
v3LVuztu8V5N1t3/tGHFI7Wlv9/fNcx2QitnqySmNZULMl15cudDT7nNv36G
L+Y9N3WzA9uDm8mTbxdO2zd6pPw07MiaZ4Y9YFfLUBOH9psDhxaN+FuMI/52
uvvwfzO33aq9WVBjm/F96rt+PXf6bMt3zbXO48c/NH5P9TumbPsoMKDsQ9ed
pxVmGfNd9T+q2qhn55fMkvubzFs/r/IyeWxqwXp7fkQKn0VR5Q9umSEbBNae
NavKBhnZINW8418jxdS5F7ol6PzS9diB48o/yT7nLjnichl9kn8fmnC69qZR
/7XGvFPzrXLOy0OelMmgtfDrpRnrMnZ9vboeveThZhlZ/fSxhGWPyARzvxfd
csbwz+dM+2rimjY7cE3lEK/b6IjXfUv22M9Y/1q9nxeyG/vB/5dX+ME/78Az
EWf0iUPXbb9unFdTcX+8dic83rtDheWr6ORjzq1IJn5/mNA6l+tt/Zn3mnuY
7LXxTKE++dqI9O00PzPvObZHlr3HVgbJeKF754+ON1/075Ju9xXjHpR20K3w
iHaH5IBqLW70vrFTZL3Wtu9lww8ci324imMffjtv94yjZY+IZ3ObXf54f7MY
PSry0aYzJs4wxfMgvw3iUt0MxR9tmSFWr8n65Jjxu2x9Mu/F4dEjxc0NGY/t
CG4mwqfssObV5sHBr4Iy+Apd094a60bMwHr5d/bAfMZ+od2a5xdg7B8a942P
n7vVMfZZLSZXtlnGvvv/5Q8uX/Am6ntwYnlxzTGf8KZR2q/hXS17yP0xSw/V
aCq/XtzWspx/TfFuU/r5pt/V9XjTcXv7T5VVm3WbPFhMEDvbvKn3m2Hv6f3s
05tp62XUrInfvaavF23rlqrY1/Anr+/fmmFkxE4Z+WRdz9wdDoniR8NrnDbG
7ef2V+9MfEV8B75Cz3PvxsAqy8Tafsl85iydJcocaZrNnM/Z3vZO9OBDT1H4
r11/VpvWVDT9rY61Hh/nyJDC2F/EH9mzDzf2G5Ep0N5nEk088TTl3gNa0NNi
KYx9V+N+6xd2d/HEFX5a1rulwo3zSo1PitlrKxwt6CPrLvkUPfZiJjH93jbr
3j0p4ai34z43lx+fl7xjPEXhXLNK/jC/N/Ts2fFigly390ajsP5TxT05yRqH
Xg36NGwXf75ccKpU6ZK/B4nAAwP7m/OnU6VJXgk6f3ONcOAcLrzWzX1HHEr6
bI2xD4kE2H9mLqv2T83H0dqrlO8rGvurNhP76sWMOR4Uyb9CcwWHbDDOGY3n
y/Wmra8WXplVi+kzcpVxPqvvKnjVr8C4i5lkgprPPsmCPiIA39Wg080A43eV
lUaH+hu/s6iB33d+ydr9++VrI3vs9g+97h4muo2tbK2LgAVTvU38wEcHfkD7
Ft7FOA+0+gUuNDPOB43nwsexo//Ws3fXrl1JcOv2zdi439uqj0Z9Hf3MFRpQ
N57hXyj/p/GvV4sb80+v16P+amM+ikmYh4/rhJjrVubpVHX120OFxWus35M7
Slz43/LsbUpf+mtG7oxau5MvChjnthqHpfcfFjP8G1fGzdXqGv5OLH5jxGpz
v9C7/jLq+umIM2rfWHktt3FN+5/55eNVHg3aN6+U68XqGlUMf0q1k+pWIi+v
eGv8ejryp/S36H/x/VIj7H2q5Vx73+K/+3/Fu3LDP0sCf43t0C/ZBD+F9ol1
9lj73Y0TA+Ob+x/3vfMZz1rrPH7SKGvdc71PgJ93BX4f25kJ/2YX/B3+jt+i
bT/gxA/bL+DvfmfsoNHG/BGy/uc7xvyRH3Lb8+fr3C+jzX2kbs3AP819xRVs
z7dnV9J/N9fb4QInrPU3A/OT/iX9TfbnYVbbr9pY1vazOP8TTT5g+R83Wm20
/BH6IQfiLZ9knusZi18+ZJ7znSrZ66tagG8DY52KKW8z1zbWqZw5uru1TqcX
6BNqrGuxyb27p7Gu5bk69rrOHO59xVz/XgXmfTX3A+4DbTbp1rqatySXtc64
viLgB7+EX8z+h4+w/b9K/W1/kPtSeN/lY0w/ac2aMeNMv+kn/KUjbauWNvY9
+flci53Gvicf9LT3PS2m+ytjn5R9X5TMbuyT8ltEQ2uffDXvVSpjvxVD/V6M
MvZb2aj1Umu/3f1oywtjfxbedw8kizd9vbyE/XnY3hHdjf1clN15Ypmxn8sT
l+39/GuauYPNfaH1Ov++5j4RFWL/XvdfVrfWZ9ME56z1ynVK/57+Pr83/jXb
r706z/ZzeU5tCW/R1fT/Omraf6Y/mA3n2i/fk2U6YvhV8evmO2icg7JcWvsc
zDn0/jfj3JTD7p/LZ5ybcuD41Na56eX9cqFxzsrduwudMM5ZGVr0mnXO+vSd
s9c4r8XS1CnuGue1XFwrwDqv7yYoE2Sc7yJt1sgFxvkuzwdms873uT4Lv181
9rt1vddnN/wBOXmX7Q8UGvH7KnPfafk9vrUPcf+Jn9veL4YOtfcPrt//Sw+B
95x+uPdwfzgM/34h/H36+WPgB3vDL6Y/TP/y0xjb36Sf+QT+3Iihhyz/jn7d
Jvhb44vN+RpXl9UPeYJT48/Ni6vLGg/ncbuvb9/F1WUdhXPLv5N9jjl1WZfi
fOC5cBz7cjj26RYOXdYV2F+duqwpsY9yfD7iHpgc90KO5/hMUUmWPtws2myZ
u9/wM0X5Rz7FTD/zGe6Hw3Ff5Pt9cV/qivsT/dhrw7Sqhp8sJt8aPdzwk8WT
AT6Wn9xrQuPHhl8t4i1PMsfwq8XgHkUtv5r3zJO4d7J9f9y7GuIeRr895zn7
3vIN9xj6+Wf7Vztq3CPEtuiMbYx7hJj+xL5HxDQfW9G4d4hj4VH7jHuHyLnJ
vnd8zhfZ0fQPJgenzGb6C8WFvY91xv12Fu677E9G3PfW4P5HO+9LHXF/4r0p
M+4hc7ra9xL28wLuA4UmecbBXI3uRJr+6Lw8qf41/dNZWL87yriGmX7YuyHJ
k5l+WWb4Y7vS3Lb8mF/W5bf8GvozgRltv2HME9uP4DkyHvfzh7ivs/9DcF9t
ifsr7bzvLcH9j/ZOuEeNx72Kv8s/uM/EeNv3G86HUXNsfzrlGNu/5n6l3bH9
yIhBtl/JfXvJetsPe5vB9st4Ht2A30M/iOdmW/glbeGnsJ8rcd9ujPs37Sdx
Xx2J+yvtV3EPTIh7Ie3tcR+rivsZ7Q1xj/qJexXtvCeoewP6Sf+4Cvxl9T78
S/qbtO+GP/cG/h3tWeBvLYf/RftL+E8n4E/RXhn3qLGOfGi8W2l+mnyNew6+
RtIUe+b9b3nPiojj1HPkN/m/n7yvqtXeIrQDPqwf+LB8X6I+tx+ftENn0I9P
2pHXdCHPye+SqNPEuuHqffAb/cATVXbkNV3QJ1TtoK6TH+pdq/fB3/MDD1K9
Dz1DF/KZyo46UC7Uc1Z28NNc4PkpO/QPNegf8neXqBvFuurqffCvXOCxKTv0
EjXoJap2UGfKhXq86n3wi1zgaSk79BVd0FdU7XihzhTqzar3wZ9xgYek7Mg/
hSEf5YrTjvlfGOqpKjt4DmEVHXboNOrQaXT2x416oep94PXd4D0oO/I3buRz
lB11styoh6nswKO7getXduhAupG3UXbU1XI7fy/grd3ArSs78itu5Fti549d
h8uNeobKDjxxGHDZyo58RhjyG2reom5XGOr1KTvwsmHAHSv7/1GPSaLeE+tz
KTvqV7Gel2qH65PrlXauT65X2rkvcJ+gHfc7F+53qh3oY7r4pB38cBf44soO
/UwN+plq/qBuvQt1C9X74D+7wIdWduhtatDb5LkjUZfdhTrt6n3we13g+yo7
9Dk16HMSRyRRd9yFuqCx88Tmr2rgs6r+Q89Tg54n8VQS9fs01NlW74NnqIGv
qezQ/9Sg/0l8mrm+rDq7qLur3gf/UAMfkeeahF5oGPLMvKdL1EUOQ51k1geU
4NeFgW8X+759T9dxT2c8jf3Rnf0B30kH/0nZ/692kK/VoUfKvK1EvVsd9W9V
O+D56OD9KDvysjr0S5Ud9Vzdzt8RPBY3eC3KDr1TN/Kryo56pW7UL1V28DTc
4G3Ergs7f+lGPlPZUY/T7Zzn4CG4wUtQduQLw5A/VOsR9RTDUH9S2YEjDwPu
XtmBI3LxvKWd5yvPW9qhf+GCHoZ6H/EZF+Izyg48kgY8khp/fifXN+3Qg3BB
H0LZEefREOdR7UAHVuMTukYya+/xZj1TF598HzoIGnQRVDvQj9WgH0v8noxJ
2tz31D4fbc+KKq/j1A+V4Plr4P2rfQZ6sxr0ZjXgjmSX6IZmvVStvfegk3Hq
k0rw2DXw2snDktCn1aBPK6BPK7N3Gx9l1j/13fLIrPPM+qcSPG0NvG3y5iT0
bDXo2Qro2UrWV0VdbtZXleDlauAlkxcpoX/rBg6FekoS9VvdqKOu7OBbus86
7MCb6cCbCeDN2B/d2R/wAHXwINV3IY6nI44nEMeT0NfVoa/L+5pE3Vgd9bHV
uIHvp4P/p8YfuA0derzEb0jUe9ZR/1n9juCz6eC3qfkAvIUO/IWaP6hnrKO+
sbKDr6WDv6XswDe4gXdQ8xn1et2o36vs4CO5wU9SduAJ3NAHjvWv7PqsbtSn
VXbwcNzg5Sg7/WngA5Wd/jT9a9qhj+OCXo6yI+7qQtxV2YEz1IAzVOPJ85vn
Od+HXowG/Rg1bojfaojfqnaAV9SAV1Trneuc657tQCdFg24KeWcScWANcWDe
36mPTL1kAZ1kWSt5RrNutcYn6j5L6INo0Ashf1BCV1lAV1lAV1k+rz7JrHOt
5c30zKw3rtYX9C806GGQryqhwyygwyygwyx9K9dMHbYpnhBJhpn14VkXnvoO
1Hsgv1hCt1lAt1lAt1lu7tpnuFkXe8kGrzVmXezeKay62NQvoJ4B+e8SOs9u
4NcEcGtyuvWc7L5h8+nFdNjBq3eDZ6/eB45UAkcqgCOVW7vadb2d/QFfWoI/
rb4L8XmJ+LxAfF4CjyqBR6W+pQy5fv/nkU3x5J2gcx7jBp6wDt6wGn/E+SXi
/AJxfgk9Rx36jtR1lKgfr6OevPp9wY/VwZdV8wT61Tr0q4njkqiPrqNeuppv
4H/q4IOq+Qy8lA78lJr/qJ+tox64soMfqIPvqOzQx3ZDH1utU9SHdqPetbKD
1+cGz0/ZgfvVgPtV7fP+xvs37dC3ckF/S9mRT9GQT1HtAD+sAT+s/Hz6hfT3
+T70pzToURHfJZGX0ZCXYRxMAoesAYes/AH6AfQLeI5Ad0mDDhN5rxL5HQ35
HQ35HQk8swCeWQDPLLkvcJ/g/IHeEPWHBHSHJPJEAnkigTwRdcapOy6gNy6L
1/i8tEinvILP27lHm3kB6uxQd0dAb0dCn1xAn1xAn1yW9xn3x5h1LUTCvacC
Qgd1Eu0zp85h7ifQkaGujICejISeuYCeuYCeuWzR5pf8XiG9xZ7Du0tNiZki
vL+Uc+803odOCnVTBPRSJPTP3cDJCuBjoYMu3Sccduh0uKHbIaDXIYEPl8CH
C+DDZaLyv5Qy+iN/VKts9WfRB7s/0GWQ0GmgPoNE3k0i7yaQd5PAmUvgzAVw
5rLB9IcLjXGTp/Zj3HzscYMegYQ+AXUJJPJ3Evk75vEl8OoSeHXqx8p8o4sM
MX5XWaT082Xm7/sKvy94+BK8fPLxJfKAEnlA5tkl8KM68KTKH5tRp81/s5Lc
0oN/HvKYn+Cf6+Cjq/kPfXgd+E3iNuXXWSGtjXWk3x5+0mMdgV+tg2+t1in0
5N3Qk4+Ne4gws5692/dg6Lu46x28Yjd4xsoOPL8GPL/aTxi/YzyPduj9adD/
U+8jT6ohTxobN7N5ARp4ASpuwHgB4wd8H/p3GvTwyO+WyLdqyLcybi/BLxDg
F2jgF0jeK3jPoJ8M3TfqwLEOnUTeViBvK5C3leApCPAUBHgKkn4G/Q6em9A7
o/6ZgO6ZRP5XIP8rkP+V4DsI8B0E+A6S+wj3Fe4n0Pmi7peA3pdEHlkgjyyQ
R6a+P/X+BXT+5WyffFuPDF4g+AxfM+htOuPfhb4V9a4EdK4k6gII1AUQqAsg
ex0LjpidNVg0PXLk8eyse0RMdv8H7Z9HUr+Jek4COk4SdQTcwO8L4PZlHesZ
414Dex3YoRPkhm6QgF6QBO9DgvchwPuQR/023zD6IxPHd1v92dUxwOoP9GIk
9GOoGyORT5fIpwvk0yX4IxL8EQH+iIzx7hBgjJcMPSQ3m+O2fPkQa9ygkyKh
m0K9FIm8vEReXiAvL8FDkeChCPBQpHeLJg2M310WzGv/7m/z2b879EEk9EKo
EyKR35fI7wvk9yX4LBJ8Fg18FnmrUs1nRzalk2uDQtKY8zYt5i10MSR0MjTo
Y0jgBCRwAhpwAhL1F3TUX1DxrsZrks1PErhdr7d0x4e46w56EDr0IdS6Rr0G
HfUa1D5QqHbM55RpSurO/QE6CPpqx/4Dno4Gno7ar+LkD6x8Au3QJ9UcdUIl
8A8a8A/KDr6PBr6PilvGiQ9a8Uu+D/1NzVFvVAJHoQFHwbykBG9IgDekgTck
GUdgnIPxBOhOUreSdUsl8BgCeAwBPIYE/0iAfyTAP1L3Ct57eL+APiP1GgV0
GiVwHQK4DgFchwSPSYDHJMBjkvRj6NfQn4EuIXUKBfQJJfAhAvgQAXyIBB9K
gA8lwIeS3He4D3H/gR4f9fkEdPkkcCYCOBMBnAn1jql/LMD3lKUtnH5x/bSN
3xf232+oz6tDd04gj8k6rxK6c6z3Kk/ZeH7Z2MLxF9ft5xvywyX44uSJS+RP
JfKnxKNK8L8k+F8C/C+ZdmH453xDT8qjT9f+MJ5ibboaCfoVi6QeloQ+FnWx
JHA1ErgaAVyNBI9MgkcmwCOTk6L/vGyMs2xWKeyWOc6/FdljjTN0oCR0oagH
JYHPkcDnCOBzJPhoEnw0AT6aPHf6RCpjnsh1JfJZ82Rs4QrWPIH+kYQeEnWQ
JHA+EjgfAZyPBK9NgtcmwGuTgRuC6hvzXPp2s+7TonxKe55D90c66uFK4IUk
8EICeCEJfpwOfhz1BGTKBR1dxjrVnesUejf6HOc+YOOOdOCOiFeU4Nnp4Nmp
/eTj0tI9Gsxrrjv3Gei/6NCDUXbgl/QoRzvMjzJfSrtnfjTWDr1mDfrNYcyb
AAelAQel7MzHgPen7J75mAVhzMtAv1iDnrEbuCkJPJUGPJWyM24L/qCb/rZn
3DaNskO3lzq+buCvJHBZArgsZWccBzxEN+MznnGcyW7Gc6BXS/1aN3BcEvgu
AXyXsvOeBj6jm/cyz3tarB06rdRtdQMPJoETE8CJKTv9KvAi3fSvPP2qGDf9
K+iTUq9UB65MAm8mgDdTdvDZdfDZiYtDnp1//0879BiVHfwmCX6TDn6ThE6j
hE6jsvN98DqVHbp+Ejp/OnBuEvg3CfybsoMHKsED1cEDlW7Yz1p/p9HPwg49
Owl9OzfwchI4OgkcnbKDTyrBJ3WDTyoLwG7/HWsH7k5C180N3J2yA4+n7OCl
SvBS3eClyt9hv+n/+mxcO3DVEnpmbuCrJXB9Erg+N3B9EvxWHfxWtY5uwu5c
X8AB6tDxcgMHqOzAByo7eLI6eLJqf1gLu70vBKr9AXhCHbpW6n3agTNUdvBt
NfBt1XyLg9uwcBy0Q3eefqB6H3hFDXhFZQf/QgP/grhupx+o3nf4gdRjl6j3
JFDvSWf+yOHv6U5/D7rj1BuXqA8lUB9Koj6U8usYP6ZfBx1t6mpTT1uinpRA
PSmJelIq7sM4EOM/0ImmbjT1oiXqTwnUn5KoP6XuY7yf8V4GHWTqIlMPWaJe
lUC9Kol6Vcq/ob9DP4f+Fv0v+l2ob6Vz/+C+QT/M0y97o/adcMf7qHelnqh7
Jee4x5j9Uc95j5Na/YGuqITOqIS+qESdLIk6WRJ1suSpvTss/+qT+8Bdc3yu
vNxpjQ90MyV0NCX0MyXqaknU1ZKoqyUfTYqx/Ki8mfP5mr/X9Ty2HwVdSAmd
SAl9SIk6XBJ1uCT4zvLarRFx/SVJfwm6h/SXJP0l1O3SUbeLemLy86OMcf0i
NZ+h66dD50+tC9T50sHfjV2Psf7Px7jrC3p2OvTtlJ24K+KwaCfuijgs2lFn
QkPdCdUOcMgacMjqffDxNeI7iOsgnoP4Dr6Pugsa6jCw/oIEnlkDnpm8PIk6
ZRrqlJHHJ5n3ZR6Y92vUG2D9AZ1xLdQ1E6hrRh0Sle9h/ofxK+jpU1+fuvoS
ddAE6qBJ1EFTcVvGcRm/hV489eOpGy9RN02gbppE3TQVT2F8hXEV6KFTH526
6BJ11gTqrEnUWVP3E95XeE+B3jf1v6n7LVGXTadfQH+AfoCnX2C8b+tB64cd
70NvQUJvQUJvQa1nrm+ua+gLS+gNS+gMS+DVJfDqEnh1iXpv6om6b/L4g47W
ePE5uOcwa9ygqyuhsyuhrytRJ06iTpxEnTgZ1btrfTPuNK7A18Xm73iroP07
QjdWQkdWQj9Woq6cRF05HXoIskrQy6dmfKnOoDE/zHnF+BJ0USV0UnXoo0rU
odNRh476hLLSm2PzzDiSc55D91OHDqhaR6hbp6NunVp3HcZds+JI819X+BB3
PULvUof+pbITZwl9DLXemacj7pJ25ulQl0bZwS9wgV+g7NDZ0Ijnop15OuK5
aEddFg11WqjrKMFT0MBTIL9YQq9DI+6DeA/iPIj7YH4B9Ug01CdhXRIJvoMG
vgN5zZL5XeZ7medlfpf5XnUvs+twsC4H63FI1PsTqPdHfSGVp2Hehvka1Jlg
3QnWm5CoDyhQH1CiPqCKnzKeyjgq6iiwrgLrKUjUExSoJyhRT1DFIxifYFwC
dQJYN4D1AiTqD7qze/j7kcrvL+CwQy/enddhh46KhI6KhI6KOtd5zvN8hy65
hE65hD65BA9FgociwUOR0GOR0GOR0GNR65/7AfcB6HFL6HNL6HJL8Fkk+CwS
fBaJ+ojqiTqJ8tDPPYPN35XPBHns3xc61BK61BJ61BJ1FXXUVaT+p8z1eJeV
d8t5PnG8uPMNOss6dJfVfEYdRh26JmodJexyycq7+YlFS+KuC+gI69AVVu+j
bqMbeiFqnWbd1N3Ku90/c/JU3PUL/Vw39HSVnThs4rJpJw6buGzaUdfKhTpX
yg7ekAu8IWUnvhP6OcpOfCfxnrSjzpOGuk9qXwL/SAP/SNmJAyMujHbiwIgL
ox31jTTUO2KdIwkekwYeE/UfJPR8NOj5UJdVEv9BPAhxIKjro6HOD+v7SPCh
NPCh1D7GPC7zuvSvmMdlXpfzCvVsNNS3YV0bCV6VBl6Vagf1NDXU05TMvzDv
wjwMz0fUcWFdF9Zzkai/KVB/U6L+popjMq5J/xx1Sli3hPVKVLyA8QPGBxgv
+N1hR10K9wqHHfpIEvpI6r7AewLvDewP6iJI1EmQqI8gwS+T4JdJ8MskdJZ0
6CxJ+hX0J+hfcNxQD0BHfQD1u4CnpoOnpoOnJqHXpEOvSe0n3Ee4r/B3hw6+
Dl18Na/Ad9PBdyNvWqIuqc4ncbz5NlyU5nzlk/MW+u869ODVukA9Ux16S7Hr
DvilzesHnIq7vohfgt65sqP+qRv1T9V6J34p5Gu4xz4AXW83dL6VnXwP8j9o
J9+D/A/aUW/Phfp7qh3wAV3gAyo7ceTEldNOfDVx5bSj/pwL9eiUHbxCF3iF
yk68KfGntBNvSvwp7ai7pqEOmxpP8BM18BOVnTgz4s7UPgycGX832lFvTEP9
MfLxJXiOGniOyq8jXgR6X9TflsSLED/C8wt1tjTU3WK9LQm+pAa+pLpvQmdZ
g+6yimsxj8u8Lv1w1JfSUG+KdaYk6thqqGNL/UCF02aexInTRj0l1lGSjD+e
94g7xuK0bzrsxGlfddihe6ZD90zFJRiPYHzCidNG/Rb1XeCN6uCNku8voZ+m
Qz9N3V94b+E9huOGOiU66pao3wX8Ux38U+ohSPor0GFTfgj9Ffov/N1Rn0NH
vQ41r8Bj1cFjVXbuL9BzU/OT+4tz3qIuhY46FcoOPqwOPmxs/NOuE+zmU63f
cVus9cYn7ajH4EZ9BmVHfWE36gsrO/HeNz95e+wPqEPgRl0CZSdvhDwS2skT
yx+Yp3F0mTzKDr1gP+jxKzt4qX7gpSo7eSzktdBOHgt5LbSjXqYL9TNVP8Ej
doFHrOzQ03MR/0478e4cD9pRJ9KFupGx+5vNR3aBj6zs0OVzQZdP2Ylz5blB
O+ojulAvUdnBa3aB16zs0PdzQd9P2YlXI36NdtQF1FAnUM0r8KNd4EcrO3QC
NegEKjtxJMSV0E6eGurjKTt41hp41sqO+tEa87S0eyEvGydOab9v14HTUBeO
unmS+Q/mQzz5a4FhnvkQ4/5r1/EKW+V4n3FS6BzG7Y8VJ3X2B3WndNShUnbw
xHXwxJUdeok69BKVnfEUxldoR70lHfWXlB18cx18c2XnPQq6i+p35z2K9yra
UWfIjbpDyg7euhu8dWWHfqMb+o3KTr/HOZ9RX8eNejvKDv67G/x3ZYcOpBs6
kLH7D/Yj53pEXRn3GMd6B4/eDR597PrFvgO9brVvcJ/yfrDea+fEHMqOuirU
/VZ26J+znojiwaFONPXPlR11WFyowxLLdwY/lnxZ2lGfxYX6LMoOXUoXdClj
eYV23RYX6rbE4t7Bn4FepbKjnouGei6xvEjg4ImLpx11XjTUeVF26Ftq0LdU
dtR/caH+i+KHEgdGXBjXL/EQxEfwfehhhq1x2FFHRkcdGfXvQidTh06msqO+
jBv1ZdQ4QD/TDf1M9T7qzrhRd0a9D11NN+ORah3Z9WjcqEej7NDbdENvU9lR
pyYMdWrUPIEOpxs6nOp96KCGQQdVvY+622Gou63sXzDPMmHe0Y56Nxrq3ajv
hZ6nRj4l7aiDo6EOjsJLQ+dTg86n4k+hPo6G+jjUv5XQ/9Sg/6l4EKibo6Fu
DnV0JXRBNeiCKnwy6uloqKdDPV4JvVANeqEKB0gcDHExxL1AR9R9xGH3sut2
6LccvGPU69FRr0fhzKE7qkN3lHopEnV8dNTxUeMJPVIdeqTUXZGo7+NGfZ/Y
eYU4EXRKVTuo++NG3R/1PvRL3dAvVXbUAwpDPSA1T8b93HV0TK/gMCefF3qn
buidqnZGYD/i/kQ75xPnF+2oN6Sh3hD1nCV0UzXopip+HOoQaahDJFCHSEJP
VYOequK5oD6RQH0igfpEEjqrAjqrAjqrEnWLNNQtEqhbJKG/KqC/KqC/Kolz
Iu6JuCbosrrHOezjZk4z67vos2tMMuu9CNR5kaiLpKMukuJhQcdVh44r9YUk
6iXpqJekxhP6rjrjfIzvoY6SG3WUYtc77tW8Z9OO+kpu1FeK5WGF1fFK3yml
28nThE6sGzqxyp4J5w3PH9q5X6zB/sF942WEPQ8K9rbnBecD6joJ1HUSqOsk
oUMroEMroEMrUe9JoN6TQL0nCX1aAX1aAX1aiTpQAnWgBOpASejWCujWCujW
SuLPiEcj3gx6tu7fHPay23oWMusfFPOJmGLWQ8jdxs6b9Bi6yqx/I+eW6mHW
w2EdHIn6U/pqB78Purh6jMOOulQ66lIp3jH0cnXo5ar5g3pVOupVxerJIA4C
HV21/6COlRt1rNTv2O/CvbyzZnZxO/l00N11Q3dX2T/8v+rOPVyrMe/jW2Xk
1GmKmCYhTJRLM0Un++7sUE5FJ3RF5VBSKSYzQq9TiRq2Q+eSQ3Zp5BRlP+vX
WUkaMzSVwZtCrphCeMXofdZa38+d527WG1683v7ZV9/r2fdez1rrPv3u3+/z
1XqC9QX6w5oPju2dzg/MCwd9Nijp59MvapL0e/r7yEOsYVn+PZh18Cv7fp1/
L0pHpe+DfLWcfLWcfLVMvF8n3q8T79fkt+Xkt+Xkt2XiADtxgJ04wEZeIHmC
5AGKD5zbEOibb/nNxJf+NdI+Xn5O9yp/G+1eGV4/OX+/ofiJfWP/j21HzG4e
+4GMS32O7PKWLvYTslfqTor9hfAVMvl/RZODeijxh6OXA12+YJF8wTwHQ1zi
SFxiPx/JLywnvzD/vMqOH1wyrvX4XFiXJI5xJI6x14/T+o/1IHrN5en8fX+j
dD5nHj+0b7NZ8bh87ZJfHxCP029qfN7U85Bma/P9tt7ojk1L8/34tpcuTvpv
y6G17j+88yTXYfDT53Z45g73+tgeST5P+7lb4vwkx88/txqe5AXJ78zJ78zJ
7wxfc3zOnfzNTRxmJw6zE4fZyNckf5P8TPGZoxmBXnbtwird5jxuXw675JCR
0x9xlzUqXzvOy+r72vp6PS6/1casrbX4wkevz89HW5K8r0oTGr90cZtz7Ncb
K5XE/jb7P5TmlTUrHhT7OdmzT50Z+zsVy9fJiBtOC+pBxIWOHg50+bhF8nHz
z2XwRV1b3358Lt7/FNRriCMdiSO9a52v9fo7Wr+z3r6uNF1vuQHp+ot112Ur
d86J59Fy884+Np5Xq2g+XdBy6rQN+XG2wcPjh/TOj7t1b942JR5vW/92/rZx
TUrdHR3fG/xYzwtcozXl39kv3x/fnHfeb94cHblGn274aFqriW7LhweuviP/
HAvrBI6PqBfgufKceb5dnp1RJ87v5+fQk+osjvP85cNUJl8mJz8mW7K0V6Ob
Nyy164664YT8T1fW+vCW5Q7cauTjkp/rx8/mj+y3qN8Cq7+6+JOFwx9ymwdN
3nfeM1tt/lvH3Luk3HRru/dNza49brTbXNK3Z+MdW+2fq84f3rryVdZyoL18
wMwurun6zbHPkb3atPStj1fXszq/vPyV2H9Jvl3WYEbivxWdOyjx48KHKzP/
vErqM6797a48c/n3Fcu/z1+/OOHFewe6fP2K5evn48zihxeLHw7P0+T35+T3
Z/L7M3HFnbji8HVNPoBOPoAmH0ATb9yJN27ijZv8AZ38AU3+gCYOuROH3MQh
N/kGOvkGmnwDTXxyJz65iU9uy/RefXnsF0l+ovwjTL4STr4SXpe/mMlfzOQv
ZktnXpR8LsyHFH8vEn/PxN8z+RWa/ApNfoUmLrqJi27iopt8DE0+hiYfQxMv
3cRLN/HSTf6GJn9Dk7+hiaNu4qibOOom30OT72Ek30MTX93EVzfx1U1+iJH8
EPFpMnHXI3HX4dmafBIj+ST6OMzD99z+zXHJ6+ItRuIv+veTfT77fnT5LRbL
b9Gfs2TlFcuH0cmHMWJ9Lt67E+89ghsjf0Ynf0aTP6OJA+/EgTdx4E2+jU6+
jSbfRhMf3okPb+LDm/wcnfwcTX6OJm68EzfexI03+Tw6+TyafB5NPHknnryJ
J+/z+MnrJ29fnPmoXKDLL9LkF2nyizTx5038eRN/3uQjafKRNPlImrj0Ji69
iUtv8pc0+UtG8pc08epNvHoTr97kOxnJdxIfNBPHPhLH3p8fyY8ykh/lrrio
1jlhnqq49xHxWnTiRMSN0Nn/Ew8gDiC/Sye/S2OdL36+Ez/fxM83+WA6+WCa
fDBNXH0nrj48bZM/ppM/pskf08Tbd+Ltm3j7Jt9MJ99Mk2+micPvxOE3cfh9
PQb1GdRfiM+fGxLob/9iRMxtsMqXVDxt6PUlVvriooTbIF9Oky+nyZfTxPM3
8fxNPH+TX2ckv85Ifp0mzn8kzr/PN5CPZyQfT3z9TPz/SPx/f94nf89I/p7+
+U7eWenIeF8T5h8STye+jl5XccCLFRdE/1rxHeI96Ldon/+E9v3s9+Ur6uQr
aqz/5Ufg5EcAL93kN+rkN2ryGzX5FDj5FJh8Ckw+pE4+pCYfUpN/gZN/gcm/
wNfJUB9DXYx8DXLbA/2Dm9y61/P9vOKJ+/zHoHy/b3dyygva75itI+PnPerE
WbPi5z9iZ/rc5X8ayf8U/0eTP0IkfwSf7yFf1Ei+qP5clXNW+SZ4XX6pOfml
+udywdYdO6vGcYwg70s+Czn5LHiduC1xXPQxise9p/gcOnEZ4jTo5bU/L9F+
nX06+7olQX6UfF2L5etqrP/l+1As3wejTlx+r05+r8a6UX4QTn4QRn0ldUrU
LVGvJJ+I3fQHN13cOR6XtzY+eF08TjM+37xxfdI/Vz5+UdJf6aePlqTP9Z57
0ufM85X/bCT/WX9/5EMRyYfC6/KlzcmX1t/nX457MYlPhvkw8q3IybfCf554
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
PXprwOtmPToy0McdMSqJO//yq1VJ3PqPAw5K4tWcR4b7EeKYxDXpd8TdGBcZ
D4kHER9iP0KcgrgF8Qr2z+yn2Uezr2Ofx/6umvYpO06eP+Ob+xTWhawTWR+y
XmH9wrqFeZR5lfmU8T38Xow7jEPcB/oJ7yP3Tf7yJn95k7+8cf4arsPlI2/y
kTf5yBvnrOG6Uf7vJv93k/+7cZ4arnPkt27yWzf5rRvnpuG8LB/zSD7mPk+V
89FwHjlF8eVuwTkU+ak+X1X3rZrev/v1PvIekl9Ovjl55jzvagX71K1+v1o9
0BkXwueSldfdu08aL75oUBo/Jm7cccCFp8RxzGerjYjzz62B4pmfbq7ycOvK
V7nTZvZ8/YCZXazH9Wm+etWVDR9bUm66q/Vq+6bXHjfaXpjZLclv7962R41F
/Ra4v1/a4bOFwx+yaqtbJ/nwnPNx7sd53/I202u9OTqyybOrV3+g1US7f+Lv
kjz/zhPuXDuuSan1/1PV/Wf3vMDshYOSuoD6Y/pftCG//uv/1V0f9cmvB1dc
9lFSR7Cgzm3nx+uSwx88e2a8Ttmu9cm6V9L5sv+AdP5k3mR8b6TxnnGeffiB
QT4D/w/36UUF/8L///z1mXe+M7vD0SXN0LuNu6P/19YpN2rWOw26HT3E6ytv
6bbXTmudqWe1s/qFPn9uPKyCPydrtObzpufeMiq38crcmsGnvus/37/pDU93
WjowU89qp+bYPg/9Y9MpXn9uU7UOO3fMzuVa3L1/z8kneP3zZq0e/PrDiZl6
VjtdZ3VeuPLjrl4/o8fokzfdszDXftb2CWXjO3m9yYDpNW8YNS9Tz2rntzNy
5a9t0sGf822Yv+PJt2ouy9WpMb5GXveff/Sz8e8OrpWtZ7WzpOlZ0/Pfy+tn
tpvyWdGXs3PLinqMy1+n1w99c/ygEfnrzNKz2olqzz//xGEVvH7ysLNqd8k/
lwon//Wg/H32+prhHXvv9c+JmXpWO/el79V8/16dWbaoaEGnXM8V1T4Ycuq7
Xl/f91dPd8m/J1l6VjtFBf929Yup6XvuP7+p17b6RQta57L0rHZ+Gn2by/jc
D6X/yN/ne1/X99aDccy9rOeYpWe1E4x7rqfeq5PS99DrT+o9zNKz2lmS9gv6
u2urfrG2RdKPvP6I+lGWntVOLu3XXm+nfn1fOg54/S9vpONAlp7VziXb+z73
jXHPVbyvRdXOdy3MFafjldf3q7DqiUGHLcvUs9o5LB23GTfcIo3b76fjvNeP
aZ6O81l6Vjsr0nnH6w007+w3MJmnGAfcvZqnsvSsdoJxyXXWvBmMM26D5tks
PaudooJ/P13/+mH1n2z8+X86Pv/Yf+dnO/7/n6+fA/3Huv8/1fvjv9dLzW+4
ZMq0d42fe9Kz2sn6u/p9l9H+bvoevtdu1xFcp9uTntVO1t8PrnOP+vf9Hv9e
/7H7yXf9Oz+7fuj1Zwe8PnfA67vy4tGfSfRzvrWe1U6szs0N2k0//e66p91d
a9S31rPaeTL+u1Mn7qZfEf/C+tnfWs9qZ138d2+bt5seyx9OWvit9ax2SvJf
96Gjlu2m3/0d9ax23sj4u1dm3IcsPaudpzLuW/uM55ilZ7Xz94zn/l3fz6x2
5ma8t4X/9qz/UO3sSb89jZP4dfLVPUa3i+Mkv0/jKl4fobhKlp7Vzrh0H+Hj
DA20j8jS+f2M6//B9ScK7/MP3s5bhe+J158ufK/2qGe1E4wzXu9Y2C/2qGe1
s7awn3q9X2G/3qOe1U4w/ng9GPf2qGe180bG3302o50sPauduRn3bWDGfcjS
s9pZl/Hc22c8xyw9q525Ge/t3Iz38H/W//f96EfSC9YV/24+Ra+exnv9OLbS
XfFhuSOXZerh3816D9H/GwwwiuU=
              "]], {
            Axes -> True, 
             AxesLabel -> {
              "x", "y", "|\[Psi](x,y)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {0, 0.41380285203892786`}}, 
             PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyVfXm8TlX0Pq4pXMlMpcGlkVCGFPtFMpYURaZIZcxUyUxKISVTEZkz55ou
CeeVIZKhMmSozLNkjJDvOXufZ9/v++x3fe/v1z/vx/PZ7bvPc/ZZe+21n7X2
Pa06Pf9ahnTp0j2VPV26BP+37Oxc227ezBPFb48TxUtnndtBRWvmvHtE0m0O
PmZLgf01R+Rw8LnZ8/TvuDezg3+v+0nv4PN1+8se44s1ftTB0+n/tq9gfJJp
rxifbvp38JVmPBHGZ5rxO/gI87wOvsrw4+DhvyU8Cl6ZZ8bBM+PgmXHwzDh4
Zhw8Mw6eGQfPjINnxsEz4+CZcfDMOHhmHDwLeBT8Mc+M49+Mg2fGwTPj4Jlx
8Mw4eGYcPDMOnhkHz4yDZ8bBM+PgmXHwLOBR8MQ8M47/n3H8m3HwzDh4Zhw8
Mw6eGQfPjINnxsEz4+CZcfDMOHhmHDwLeBR8MM+Mg2fG0S/jCy/MPjrF/zd+
f6rVN8PUJb3UpBkds33q81zt5shOa328sLrvznsqDlXPfl9/cLLP89TaX5w6
4uPPtZ9apF3dUarPhrK/ZFqVTt33dennsxRLH51f5b/jb18bpz6frturaWH7
Bd1M+zGmf4X+i4f9F7yoxxHBeP6qYcYDnnn84Jlx8Mw4eBbwKOYX88w4eGYc
PDOO5wSv4LP50Pfz/+L/G79NxjfI9fzOSeru38cNKbfvqJfQ+bes+fZd9n7+
tfPai7/PVquiZ08dKlxIjRzTcttLPr4tcUu9ZV0Xqub5vwzaq39rmPZVL5n2
T72q+1VNu5v+i/xs+h9xQ48nMm2uGU+h6mY84JnHD54ZB8+Mg2cBj+J7ZZ4Z
B8+Mg2fGMS8xTzE/wSN4BZ8n7+/RaIX/b/xmr/zMivU/LlEr9x9+suTxJHXX
r6e3Vfn9qFdp/eZF/YqvUr+nvBu0U+fMr9fxM9P+aifdv31vf4b9TzTjicwx
34H3Yzj/wTOPHzwzDp4ZB88CHoX9Y54ZB8+Mg2fG8Z3ju8f3jnmJeYr5CR7B
K/i8dLjQpc8rlbC/SU1uHih0Zq0q0VK3Vz3LnNTtu6Xbotu//abuXyUkDs56
2O9/YUbTfxEznsi0A7OPBePZdb8ZD3jm8YNnxsEz4+BZwKNYT5hnxsEz4+CZ
cdhN2FHYT3zn+O7xvWNeYp5ifoJH8Ao+0Q6/XTCfHzXzuYyZz2rsQ11i5jPG
s4XmM48fPDMOnhkHzwIexfrMPDMOnhkHz4zDPmNdwnoEuwk7CvuJ7xzfPb53
zEvMU8xP8AhewWf9AaZf/N6cZ/qvbMYTGTHFjKcY2WceP3hmHDwzDp4FPAp/
h3lmHDwzDp4Zx7qOdR7rO9YhrEtYj2A3Me9gP/Gd47vH9455ifaYn+ARvIJP
jAO/uZ6O9Td4/OCZcfDMOHgW8Cj+DvPMOHhmHDwzDv+GcazHjGP9YBz2jnF8
n4xjPjGO52cc/2YcPDMOnhkHzwIeRX/MM+PgmXHwzDh4Zhw8Mw6eGQfPjINn
xsEz4+CZcfDCOP7NOHhmHDwLeBT/H/PMOHhmHDwzDp4ZB8+Mg2fGwTPj4Jlx
8Mw4eGYcPDMOvhjHvxkHzwKOeJrDM+MUr3N4ZpzidQ7PjFO8zuGZcYrXOTwz
TvE6h2fGKV7n8Mw4xess3rPHrVdqjsgdxS/zz3j474jQ3sGpf+f9Mk79O7g0
fo5DUntnPBI//Hd/uy1X66RaeaL4JTwi4GjP/UQYx/ik/nn8aCeNX/i7Dj/U
3nnv0vj57/41KufOm/3cuG69mwWX3byZ6Pxd4E5cd3vetTdvZnXj6iEeP/6Z
IDxXgtP+Of13bzjxduDcvpxud8FpD5zbl9f4Iac98Pjx52Qnzv+oae/E89Ge
+0F7xh8z43T6Ac7tnzU8OO2Bx+8/wZmfwLn9avMenfbA448n0WkPnNuH89Bp
D1xo78S3MT+deHg4D+PHhxMcHPOKccwfxjFP4sfPk534Od4743i/jOM9xm+f
4MS98V7i95Po4OBZwJ34Nnh24uEhz/HjwwkODp4ZB8+Mg+f48fNkJ34OnhkH
z4yD5/jtE5y4N3iO30+ig4NnAXfi3uCZcfDMeO3e7R7Nmi5jdFfhNgPH+fj5
nI8+cizT26r04VFP3ZPuP6/TzGd6zvfxMsOrepP/eE9Ve6BK43vSXfTG1Urc
+pOPJydUHLHvs09UlS/GFyqT7rCXtWGlQid9fP3eEvc2uHe06rOhfEz8fF4Y
T7tesueuqukOq65Pbi8YtL+Yv9Xeen77ucV0/wr9/5HF9L/YjEdhPF98asbT
14w/gvH3CMcPnvl5wTPj4FnAnbg3eGYcPDP+5KJ+Vwr6PO+9d1H1vj4++fvs
U74vM0BVnn+6QWuf53JLP35kpo+3a70+7zmfh/tnZXy1tc/zlSW3bD/o481O
z3ujcqOp6vr29tPH+DzvfOhG2zv3XfaO3Vz15dUic9Wq6N8x8fMtYXyy4oHC
Ozb4PGfbOK5V0P7peRlbHvXbVxuh+1cXxpv+8xT+Rvdf5Cs9HrVroRnPhUFm
PK8t1OOPNCtmxn/HWjN+8MzPC54ZB88C7sS9wTPj4Jnx/UtXLXvA57lel8xZ
PvXxive3GdLu4Ieq5rTedWb4PE8cdPXHgz6+a8YXH93TfpLKcD7LCzN8nl/5
/dzNl/Yd9RK3nRn7R/b56r39vW6/5vN8R/ciZTb7+N4bK0c33pmiVr5yJCZ+
XjGM99a5rcHEZ9MfVu/keeCWoP3G72udquy3X3VI96/+jJr+B1ww/YfjUd++
ZcbTYa4Zz59m/JHrrcz433rYjB888/OCZ8bBs4A7cW/wzDh4ZvzrGxc6V/R5
zp3hiWVVon9XHp7vxw9P+d/pnxMeL3DS5znXvkZdHq+TqLadG/D11Ke+Vt1+
eargSZ/n5Ycf3dqn5p3q80uTrs1psUTl79qsY4v0h73HH8x+7PI/xVTz6rPa
PjTBU5dbF9Zx8wth/PzeMH7+dKUH8273eU5597M+l84XU1Un5qr+z3hP3fW1
7l81OzrzcNB/tn9M/zs/0eNRF26UHRWM5+RpM55pZvyRZvkWbQ7Gf/stZvzg
mZ8XPDMOngXciXuDZ8bBM+OYz8fNfFBvhvOh5mgzn4sN0fNHHVhh5s+ydWY+
/3BKzzf1zi1/6fk2o7eZz5cz6vms8lRfpedzz4Wx8fPOYfz8hXA+F82k57N6
akM4n1PMfD5u5rN6pqzpf8MwM58XmfmsXtwcO58x/ndpPvPzgmfGwbOAO3Fv
8Mw4eGYc9vlnY5/V16F9XjHD2OdiM7U9VJkHGHt43zhjnw9+ru2naljQ2M82
y4x93lZc22eV+TZP2+eMiUNi4ufJYfx88yZjnz9YqO2zqrrb2OcZk419bjfR
9J8tm+m/1xxjn2smm/Hc2dWM5wkz/ki9u8347yX7zM8LnhkHzwLuxL3BM+Pg
mXH4G1lu1+t1ZEC4Xuc+avyNRLO+R0aE63uX0N9oUFP7A5FDicYfePct429k
NP5GZMUh429MOzA3Jn6+I4yfpzxu/I2Oxt+InMtj/I0T9xh/Y7TxNyIdcpj+
fz1o/I154Xg2D4/1NzD+LORv8POCZ8bBs4A78W3w7MTDQ57jx4cTHBz+M+Pw
nxmH/xw/fp7sxM/hPzMO/5lx+M/x2yc4cW/wHL+fRAcHzwLuxLfBsxMPD3mO
Hx9OcHDwzDh4Zhw8x4+fJzvxc/DMOHhmHDzHb5/gxL3Bc/x+Eh0cPAu4E98G
z048POQ5fnw4wcHBM+PgmXHwHD9+nuzEz8Ez4+CZcfAcv32CE/cGz/H7SXRw
8CzgTpyQ4nIOz/HjigkOTvE0h2fGKT7m8Mw4xcEcnhmn+JXDM+MUj3J4luKc
+GU+7ziQ8+OOe914Zp0St1bdW47j5AlOXN3a4XW3fpNyJhUHn7soTgs+MzXP
VXjENDdO+JgQV+Txg08eP/jk8YNPHr+1wzR+8MnjxzjOv16wblKtRIdP/DKf
cz8vlLQ3JafD5y2lCg9P6Xirw+ejrRP/q5k7l8Nnq+TExSkdczl8Dr+e2C5p
Yy6HT0+Iu56j8YPPZ2n8Ni5E4wef2Wj84PMxGj/45PHDDvD4wXPWaXlO1xyR
xeH5tSfzNkqqldWNC4W/zPNdHfOV2ptyi8Nz70z5x6d0zObwvGdC/qwjkrI7
PJcvV+CtjnuzOzyPEuKcWWj84Lk1jR888/jB8900fvDch8YPnnn84JnHD56L
6O/Ijb/10t9LBodnc66S4MTf8Iv4263z69TN4fvDh99pWvivlIzRur3Ltlja
so+6NTKzdFbfHz62LPv4TR0zRfPv2Fx/bmI/9cfi4Z3/8Xlusrj0d5OSMkeH
H683ZfstPVW1+hnHfvTf/BWzoacI/26ub872qOj7w3nPttyf4o//UuXqO2aW
HaEqRBv6+4iL6kS3txe/6Y9/ZL5R9/QtN0h9vLp7cl7fH17cVe0v6Y//9y1P
/7J7wTuW53LhfGGeR1a97cm9/viZ57/33DYzxR8/8/xMt9x5RyS5cc439Hu/
4sSF7tXv96oTF9qr3+M1J/72/ZGl0xuPuG7jb+dev9i2os8zftsOW9669KXh
auLgC/7+4qLXduFbpx5686Z33/ES7+6Y9rmatyZ783v8fUflQhXm5XwzXbT7
1ELNnr0+Tg0O45zFwjjnsjDOOaZHhsLLfJ5r9j1Tabs//q2Df9p6rvQs1fmJ
16a+4POcef7wj55betVrfm5EvWkNvlLF2x0pVcfnudqGV777yR//TrXzYPWK
Q+2+I9p109fB+DnO+Xz4XTLPObSduenEhYw9SefwnKT5POHwPFZ/p6cdnk3/
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
fFTj0PLmHdNFK7Up1brjryNV4Ybb33nQtz8Hnn6/QWW//fBHC7696ekhqsSK
9/2/e8jr/eSfxSv6+IZ5d4w4f36oGryhQqBz9ZqcOnnmjuAewPlj+j+9faTq
s6GixpuF+A6LV4jBfw3xfa+vLFel41l15sEvK3fxn7v864tblbxvhJrVRY9H
7Q/H8+e9ZjwrSurnUniuhX+a50q/p9s963x886b7mg7x+ym1ffcj52t9qtr9
8kWDl5KuqSWP9leLfXzFANUsvc/PYsObAm99Qt6OF9L8K/C/v43h/6mGNxL8
96f2JRXIGLzHpHEHxq4o3E3l/e3gsUKBLv3jVd5JH3/9RPN8a4+95LUy7zWC
9xvZ11W/35O79PyJYP4c22XmD/D7mrwW2DkPuFA/3Nolnp/CvYrWzlC9cWuX
pPaCHeD65NYuSe0ZF3T71i7R/YPW/kg49yPo/61d4n6E+yI94fzUE/IIrF3i
foR7Jz3hHNbLn9xsUeBnlPm0pPY7Hh7+VvPA34Bd4n5KTp6s192BF7sub+rj
U5LPl9XreIX2Nf7w8VP1383ur8/e8KQJL13Z3kYtumuqtiNLy92m7Uq+hKSN
gT3B9wC7AnvSql7127/059/9r4zdVsbHJ21r2HTpuaFqxxMfNgu+t6L92iX5
35935be8/124PkK90KXee0P8f+N357tTa31+bqpK9/HkE1n9/x+/s9oNLpgw
cJx6as4dlb70273e8o6Hr+y57LU88/drt384Ub22bszcHr79OXm9zcrMHS95
s297f8I33eeomhWHvj1tz1GvyYxn/lnnt6+0pum2aK0Zqmu/Jf+2CezbqfvH
rPTx3Xflq7BsyEy1NnIu0N97P/Rf+8hAH39t/8J38sxKVqsi5zW+KcRbW/xc
DN4qxO/rsbBe889Oqy8WnM3U1h9v7dnVen3r/92D6fR4VOutZjx7JpvxFPte
P5dq39M817+fmed647nm/Xxe1DeV3g5+vVdzjdg9tvoUtS359V2vpVxV18ae
vT7Hx9v8t+K2xIc+V5kXa75UhkmGt6fSG976vqLfi/qwtXkv44aa9/JM3pyB
HVStJg4L7KL3ccucpQJ7+OyQ7U8UHZEh8kOV4/58ueCtO9f7wSYfdFLHR+r3
Hlnezrz3v34z7z1hip5XkfTnzbzKMd3MK+AfDe8c+H0WF/JWrL3ieSvcT+oJ
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
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.4], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJztfXlcVtX2vqaoKCA5T6EWDoWImlOiLTU1Z64IiiCTQ2hYXTVHcEIBAzQE
CUFUnF9UBBEQFV0OmUMOZIpKzpIT6uuMZOpvn3PWem+933tuP/rg9dV7+ud8
ejpt9rvP3muvvfazntVw2FfOI98qVapUt0qlSpUppfbPXdBwDddwDdfwNxsP
37H/ec2tQcjPivYhW/7xQg/5py4+m7YlCKe6f77HsWoCHkkfVG7h73potc2n
bZ/0INw95Nihob5rcV7OyZ31CvUw5dG1W7NSgmDbhPL6yCGp+GxWzSr6O3rY
ZDO8uXgfPCOV99vUzZXfv6W0D8bt33aAF6If8Gyb0p8NTZX+mNq4FRfn38nj
yr/3YdAN35PWCcjPcg1PVThdpIeuNz18KlokoFlE3nFP77W4LOtUk2EP9ZDi
N9nnfNkEKBpS5NrMLRVr2SVEtb0lxt/KY5R4H1qkdDsivf+JZZ78fvam7YNE
uxDezmWo1P6So3ly+7USAnaL/sBwv+RS00V/nh5V+mNq41ZcnOclz1OenzyO
PK48nosuLh7l67EW+XkpvIw8b7vYdp74uetaqLxhxwcjXFNRX9Amaf9VMc5r
dD7iPX5iQ/vK8vuVlfbBuP0RyrzndWCY/6Y2bsXFeZ3zuuf1zvOS5ynPTx5H
HlceT8t7lWd3GJBqeC7qPSJwzXk9PPrt+8bifbCs1kN+/wfzj+X3LyfaDxTt
Q60Zw2dK7d+6Ei+3719G7g/YrMkrGyT6k7aihtwfUxu34uJsN9mO8vzhdc7r
ntc7z0uepzw/eRx5XHk8jeaz4f196wMOSfP5Vk9faT7Dsdxz/24+w5syn9k+
877E9pntJttRtp+8znnd83rnecnzlOcnjyOPK4/n/IE23lK7/LziflpuP3Cs
3B+w9qv2VOrPm2KfeV/nfZ73d96HeF/i38t2k+cdzzde57zueb3zvDR+n8eR
x5Xb97ZX+sFPJ9s3w9/QcA3XcA3XcA3XcA3XcA3XcA3X8L+HN2i8ekXLreOQ
n1Zhe+1PiHNixu6sTzdmBeGpVsn6dr6R2Gd1gUXCcz0Mjh+44lRmELYbFNw4
xTsRo/sUZU16qofZg36rfrVyIE6q9uLpsXAdHsno22v443/Fz7OM4ufnXKb2
PbA5CMrmv5uUJt4/dNO1Tifxvp+DS6JoH84MV9rv7KW0/3h0mZ6iP/C8pdKf
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
              "]], {
            Axes -> True, 
             AxesLabel -> {
              "x", "y", "|\[Psi](x,y)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {0, 0.41380285203892786`}}, 
             PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyVnVGobdd1nqWsqJIjbVv2dZM0WI4d7mvB1K78Ysgm9EHGdlrSlz4Vqigu
FEQfWkqtxLTvbYhQReSE1qrACbbsuhtiXwI5jY4b2bQvwYaL4lp+qAkECteO
rkXbhEq9LWevb63M759/dXtfDudj3HHm+tdcY6895phjvv/xf/gLv/Qj99xz
z9948J57lv/786+/+PA379y5dsnP7/zh//zbf/xb/+JnLx97+/ueuf7O4L/+
hz/xXx975qHgX3rw2j9/8tW/FPw/Xvm5N/i/v7L/Hy+Zf+WK/0nwe67+3bww
/7dn+581/62z/+D/4Tyeo/nnz+MP/sz5eoP//lmf4OvvjV+iq3U2R2dzdDZH
Z3N0Nkdnc3Q2R2dzdDZHZ3N0Nkdnc3Q2R+fCL9HPOpvzuzk6m6OzOTqbo7M5
Opujszk6m6OzOTqbo7M5Opujc+GX6GSdzfn/5vxujs7m6GyOzubobI7O5uhs
js7m6GyOzubobI7OhV+ih3U2R2dz/Jrzuzk6m6OzOTqbo7M5Opujszk6m6Oz
OTqbo3Phl1y3dTZHZ3N0NufvmfO7OTqbo7M5Opujszk6m6OzOTqbo7M5Ohd+
yfVZZ3N0Nkdnc3Q2Zxzm/G6OzubobI7O5uhsjs7m6GyOzuboXPgl12GdzdHZ
HJ3N0dkcnc0Znzm/m6OzOTqbo7M5Opujszk6m6Nz4ZeM1zqbo7M5Opujszk6
m6OzOeM253dzdDZHZ3N0Nkdnc3Q2R+fCLxmXdTZHZ3N0Nkdnc3Q2R2dzdDbn
esz53RydzdHZHJ3N0dkcnQu/5O9bZ3N0Nkdnc3Q2R2dzdDZHZ3N0Nuc6zfnd
HJ3N0dkcnc3RufBL/o51Nkdnc3Q2R2dzdDZHZ3N0Nkdnc3Q25/rN+d0cnc3R
2RydC7/En3U2R2dzdDZHZ3N0Nkdnc3Q2R2dzdDZHZ3N0Med3c3Q2R+fCL/l/
1tkcnc3R2RydzdHZHJ3N0dkcnc3R2RydzdHZHL3M+d0cnQsnnxY6mytfFzqb
K18XOpsrXxc6mytfFzqbK18XOpsrXxc6mytft/GnPvWOP3vsmXdd8tP6m6+/
H4t9cPmP+2su/8Hb+J2HlH2Mp+njv/vtdz78xPWPXrvkp/ixcOzt52jO+Jp/
jx+7Nv7yd0Mf2cd9b+P33/3Bs29/5c4/y7zu37zzk797584h/i488ro33/3y
nTsPZF595fP851Kuawn7v3X1d9+MfDvc9o9e2b0e9nDbf/iK/3HYw+f551Pk
+T94to98Pvb2g735h87jDD9w2//8WYewh8/9LzE/4bb/2vk+hj18Pp5D2MNt
v87DsIcX+8hvMz8jH77Ow3l+eAnOvDJn/pgzT+b581Pkz7nv5txfc+7j3H6J
vDf3Ze7nEBydC4/8NjpHPnzVeZ4fXoKjszk6m6PzPH9+ivw5Opujszk6z+2X
yHuj89zPITg6Fx75bXSOfPiq8zw/vARHZ3N0Nkfnef78FPlzdDZHZ3N0ntsv
kfdG57mfQ3B0Ljzy2+gc+fBV53l+eAmOzubobI7O8/z5KfLn6GyOzuboPLdf
Iu+NznM/h+DoXHjkt9E58uGrzvP88BIcnc3R2Ryd5/nzU+TP0dkcnc3ReW6/
RN4bned+DsHRufDIb6Nz5MNXnef54SU4Opujszk6m6OzOTqbo7M5Os/tl8h7
o/PczyE4Ohce+W10jnz4qvM8P7wER2dzdDZH53n+/BT5c3Q2R2dzdJ7bL5H3
Rue5n0NwdC488tvoHPnwVed5fngJjs7m6GyOzvP8+Sny5+hsjs7m6Dy3XyLv
jc5zP4fg6Fx45LfROfLhq87z/PASHJ3N0dkcnef581Pkz9HZHJ3N0Xluv0Te
G53nfg7B0bnwyG+jc+TDV53n+eElODqbo7M5Os/z56fIn6OzOTqbo/Pcfom8
NzrP/RyCo3Phkd9G58iHrzrP88NLcHQ2R2dzdJ7nz0+RP0dnc3Q2R+e5/RJ5
b3Se+zkER+fCI7+NzpEPX3We54eX4Ohsjs7m6DzPn58if47O5uhsjs5z+yXy
3ug893MIjs6FR55QebnQeZ5XXIIrnxY6mys/FjqbKw8WOpsrfxU6mysfFTq3
PCc/red7vvf2f/nkq5nP/NhffcfPvfqo8+RL5NW3OPz1d3z5xvd3jp5/pDwt
et73dx/+qWc+l3nCD5W8osePnh4/enr86Onxb3FY40dPj59x/PCTP/nx6x89
hJ78tJ5feu6vXH/1xttDz7d94KeevvHkO0LPDz5x+N+Pvevh0PPx0+ErN558
OPR8+o3DP7j+nx8OPV8qedfbGj96/rzGv+WFNH70/DGNHz0/pPGjp8dPHPD4
0fmBz1279dgz94fOv/SRd/+d6x99IPNC60/r/NNP/uUPvHrjbaHzr9z34//6
xpM/Fjp/59/8+APPXH8wdP7woz/xj5989cHQ+dmS57xf40fnJzT+LS+k8aPz
+zR+dP60xo/OHj86e/zo/N6r5yjzb7989bz8SOh8XldZQmd+xvvDz73zI6/e
+NHQ+bXvvPPzN568L3T+xD9617ufuZ55zhdLnvMRjR+dn9L40dnjR+dHNX50
/lcaPzp7/Ojs8aPz37+6738WeaGfubq/fx55oVev7uP/irzQOV/9RuSF+Gmd
H7x6Tu9EXugXr57He0Lny5Ln/KTGj87v0/jR2eNH5+c0fnT+BY0fnR/S+NH5
cY0fna9fjee/hc6/cfV3b4XOZ/9/GjqfdbgdOp+fix+Gzlv8kM63r+bJf4/8
2xdLnvP9Gv+4PnIrdPb4x3zy7dD50xo/On9Y40fn1zR+dP7m1fhvhM4XV/wb
ofPXr8bzrdD5y1f2r4TOn7m63u+Gzufr+l7ozE/r/KWS5/xdjR+dTxo/Or+s
8aPz72j86Py8xo/OL2v86Pyoxo/OH1jHa51/7+wn8kK/dv67kRf67fM4Iy90
cb6ukn/7RuSFnjvrFnkhflrnD2r84/eOffzo/LTGj84vaPzo/FWNH51/U+NH
5xc0fnT+/nmeh85/bR2vdf7U+TkKnc/XdTt0fuD8nIbO5++bt0LnR85xIHT+
fMlz/kDjR+cPafzo7PGPeaHbofOPavzo/LTGj87v1fjR+e+d43Z8vzvrcyd0
ZrzW+fze9Ubo/F/Onzuh83k8fx46/+L5cy10/kLJcz6u8aPv2zR+xu3xj/mK
N0LnP9L40fkRjR+dn9D40fnj5/eQ0PlPz+8tmRc6v+fE92jGa53P3492js7r
e1d8jz5/X8s850slz/kJjR+dX9P4t7yQxs+4PX50fkXjR+dPafzo/IjGj86P
nt+rQ+fzPHwwdF6/d4TO6/eU0Hn9f6Hz+j0idF6/d4TOL5Y854c1/i1eaPzo
7PGj73s1fnT+msaPzh4/Onv86Lx+Twyd1++VofP6PTp0Xr93h87r99zQefte
5fe68/fo0PnZkuf0+NHZ40dnjx+dH9D40feLGj/j9vjR2eNH5/vP+ZnQ2fV1
6PyFc/4kdHZdIjp//JyfCZ3Pz1fmORnvPG5kntPjR2ePH509fuWLQuePafzo
+x6NX3rG90Tnwbb3beW78HNLOmBvfeQ/eMsTug6N+jPn37Azp47KnLofc+pU
zKmrMKcOwJx1a3PWWc1ZFzRnHcucdRdz1gnMyWubo6fzhOhpjp7m6Bn5xlVP
c/Q0R09z9DRHT3P0NEdPc/Q0R09z9Cy6Bd/2X0/zgdeCb/uyxbd92eLbvmzx
bV+2+LYvWxydzbd92eLbvmzxbV+2+LYvW3zbly2+7cue6xZ83NfgfOC14ON+
hyV0Nh/3Oyyhs/m432EJnc3H/Q5L6Gw+7ndYQmfzcb/DEjoX3YKjs/N76GyO
zubobI7O5uhsjs7m6GyOzubobI7O5uhsjs7m6Fx0C47OzuOhszk6m6OzOTqb
o7M5Opujszk6m6OzOTqbo7M5Opujc9EtODo7X4fO5uhsjs7m6GyOzuboPM8f
3rwwR2dzdDZHZ3N0Nkdnc3QuugUf+wmcos+A83Lob3u47ce+BKfoV2D7sV/B
KfoY2H7sY3CK/ga2H/sbnKLvge3Hvgen6Idge+aD7eG2H/sknKJ/gu3H/gmn
6Ktg+7Gvwin6Ldh+7Ldwij4Mth/7MJyiP4Ptx/4Mp+jbUOZb2MNtz7x1PpP5
ac48NGe+mTOvzJk/5swTc+aDOffdnPtrzn00536Zc1/M0b/oFhyd53nXa8HR
2RydzdHZHJ3N0dkcnc3R2RydzdHZHJ3N0dkcnYtuwcf5vOchx/m883E+73yc
zzsf5/POx/m883E+73yczzsf5/POx/m883E+73yczzsf5/POx/kcugVHZ+ch
0dkcnc3R2RydzdHZHJ3N0dkcnc3R2RydzdHZHJ3N0bnoFnyMG4fQ2XyMG4fQ
2XyMG4fQ2XyMG87TEjcOobP5GDcOobP5GDcOobP5GDdCt+DKy4We5sq/hZ7m
yr+FnvN87JZ/Cz3NlX8LPc2Vfws9zZV/Cz3Nqedzvo76M3Pqpcyp7zGnHsX8
22v9gfmtdR3XnHVTc9b5zFmXMmcdwpy8uTn1ds6zUR9m/v61Hsj8M2v9SuT3
1noLc9aDzVm/NGe9zZz1FXPWA+Z8ifzed9d6JnPqb8ypF4n827pOac66mjnr
QOasW8zzmW9EHox6JvN/t9avzPNRS+SjWKc0Z13N/JeHvhbmP4w80q+vdTOR
p1o/byKvta57mbPOZP61tf7GeQnirDnrUuY8J/6eQn2tOfWg5tQvmlNvZ059
mDn1TObUhZhTx2DOurs568TmxJO43jWemFNn7O8d1MWaU8dpTt3h/HvfreDU
dZlTt2FOnYE56+LmxBlz4sycL/E9iLpJc+KM+R+scSa+p6xxxpw4Y06cMSfO
zL/3vRHfF6g7ND+tccaceGJOPDFnXdb8V9Z44vfSz67xxJz1cnPWd83/YI0b
fh8jPpiz7lvWT+Nz9r7RfvPDenB5nwl+3/g5vnH2S/jzjjpCc+rezNlfEetl
6z4B819d6/nM/+laf2b+qaHfUXy+BKe+f76O80qs41CfZ049WazvrPtD/DnC
Pg1z9hXEOsVaRz5f7/hWrINQL2hOfZs59VhznusX7McwZ/+AOfXu5tSXmz+/
1l/O1xFuBac+z5x6MnPqh8x5jpwPZ5+JOfsizKnjN6du3pw6b3PqZc2p7zSn
ns+c+jlz6qViPGt9j/m2H0Sc/VfOx7KPyPzZkv9nn8Z83SHz+dTBz9cFMj9P
/as59Zrz8WeenHq4cl3BqTcyJ6768/2lNa6aEz8jX7rGT3Pquc2p3zVnn5s/
H9mvZc7+InPqred5vNvBqWeN/N4aP/15yj4xc/Y1mbMPx5x9I+bUhZtTx2z+
7TWumhNX5zzzWsRVc+KqOXHVnH0v5p9d46o5ddjxfrLGVXPiqjlxNfyv8dPv
FWueIfialwhO/DQnfpp/bo2f5j+9xk9z4qc59bvma56n5YWCU4fX9tVGndv6
fjN/D1yC8/kd+Zz1c85cdZIbJ061/bPmxJG5/RLXy/Mw93MI/oOiG/rM67uW
4Ohjjj7m6DOvcztFnRs6mKODOTrM/RyCo0O7Xr8Pqw48rtd862M2rTc7Rb3Z
tl9MfOs/Jr71HxPnutr4/V497rtfYvzzOq5T1HGN++Vz/6b5uF9+ifG3cfq9
mnHO66BOUQfFeMwZjznjaX93Xhd0irqgltca952ln/LeGHkq5nHUb1CHL46+
5tv+d3HGF/modXzzOo1T1GMQ9+b5qDfLPrUl8lfcx5LXCo7OTbeoQ1h1m6/X
L8HRzRzdzNFtXrdwiroF9DEf99e8HvrM/RyCo0+7Xr/fcr3m436NN+N65/UD
p6gf4LrMuS7zcZ/Fm3Fdbfx+Tx7v187H++V1+VOsy4/65/4m81H/HI/fexnP
fP36FOvX/F1z/m7zP1+3PcW67ahz2pf9EfFewfM5/9zPPBh+/Hm39S/1Os7q
f/75+3rwcV/GEv6jXnroh7PE351/br4efOxLE5+Pkb9iPGW9ptQtL5lPW8dp
zjjnn5tvFvvMg2379fR5x/ijXncd/7yudQnO3zPnusy5rvnn9ZvFfonPa56f
tj7lz3GuN+pm1+ud15cuwblec8Zhvu03FEcHc3SY2y+Rv0KHuZ+7z4Ohm/M8
Y3/Rv1CPuupmPvYX3fnYX3TnY3/RnY/9RXN/vTl6mqPn3J4+ojsf+4jazyE4
ehYe7y2Mv7wPxOc++se61epn/jn+evBxPPvn3fg+9hfWs4b3sZ2P49/5uO/e
n79vBmc8/hxkPFFvto5nXpe1BGe+mTP+yMut459/jr9Z7DM/Nt7HQ1xX1HcN
+/1dB7UEH98DD3Fd5uN8OMR1ze2XeK8Y3wPzuqLOasz/xHWZK/8T72Pm6pMW
12uuPE9cr7nyPPFe196vzL2f9CNf+U//5PeffyrOWYbLz8bdv85+WBe1vbn7
3cF9jrbtzd0fD+5zt21v7n56298d9sGlvbn778F9rrftzd2vD+5zwG1vPn5P
Md/PDbe9OfPZ993njNvenPnv++5zyW0/97/3FYT7HHPbm7sPIdznntt+Ps69
byHc56Tb3tznBI3z9lpcr89XgrveQH7q8964/bjvorn9uB+jn/dmb64+EvG8
N3tz93v0897szd0f0s97szd3P0k/783enOf3pSnfz6+3vbnrT/y8257nvXH7
4bn2fCAO2A/2c/97P0zHgWZv7v6ZjgPNfj7Ovd+m40CzL8/d0fOB+upmb+56
IccBnj8/743bj+uO/D5gPz4vydx+3F/UccN+fO6S4wD1So4bzd7c/UsdN5q9
ufudOm40e3P3R3XcaPbmxIFnp/zmRbM3d12Z44btiQ+N2w9xwJy4YT/Yz/3v
/V0dN5q9ufvBOm40+/k49/6xjhvNvjynR88H4kazN3cdoOMGz43jQ+P243pC
xw378flf5vbjukTHDfvxOWLmcx2W4Px/+8HO3H16HU+avbn7+jqeNHtz9wF2
PGn25sSHF6f85kWzN3e9qOOJ7YkbjduP604dT+xne28p3H7GvPHOiTPzcS7B
3Q/ZcabZz8e59092nGn25bk+ep4QZ5q9uet7HWd4DuI9pHD7cZ2w44z9+Pw7
c/txvbHjjP34HD1z+3HdsuOM/Wx1LIXbj/tXO/7Yj8/1czyhHtnxp9mbuz+2
40+zNx+/15jfvGj25q4Dd/yx/fbeUrj9uJ7c8cd+tvefwu3HdemOP/NxLpXb
j/uHOy7Zj89VdJx5SPNn65dV7Esc2PqTOy41e3PX7TsuMa8dfxq3H9f/Oy7Z
j8+LNLcf7yNwXLIfnztpbj/ej+C4ZD/En8btx/saHJfsx+dgmtuP+8Y7XtmP
z9N0/KF+1vGq2ZsTf7445Tcvmr2593c4XtmeuNS4/XifiOOV/RCXGrcf7zdx
vJqPc6ncfrxvxfHKfnw+qbn9jOvdr+u+PBR+sC9xY+v/7zjW7M29H8dxjHnq
eNW4/Xhfj+OY/fg8VnP78f4gxzH78bmu5vbjfUaOY/ZDvGrcfrxfyXHMfnzO
rLn9eN+T45j9+Lxa89Cf/JI4/99+fO6t49WXpvzmRbM3974txzfbE8catx/v
/3J8sx/iWOP2431kjm/zcS6V24/3ozm+2Y/PBTaP+aZ9bY5vcx0OlduP64Ic
90pcqtx+vM/O8ZD56Lj3/+a7H+/Xczy0H5+bPOe7H+/7czy0H5+/POe7H+8f
dDy0n7HOqnHrcG/wsd/g7sfnQc/57sf7GR0P7cfnSs+5dfiT4GM/w92Pz6ee
890Pv8/5zQv7Ge137n2ajpO2H+vWGt/9eL+n46T9jPVvjfs52veNOk7Ox7m8
BY95Hnzs07j78bnecx7PafCxr6N1OLwFjzgTfOwDGfHqLfjux/tqHSeZR46H
jduPz/dxnLQfn3vuOMZ+XMfDZm9OvCLf7LjX7M193pDjW7M39/lEjmPN3tzn
GTleNXtz5sfnp/zmRbM3H+sz9/uOXbM3J274vhN/mv3c/37ukuNMszf3OU2O
J81+Ps79XCfHjWZfnrvtHCjHh2Zv7v3yjgPo7ee9cfvxvnvHAfshDjRuPz7H
yvHBfrA353lnvcjxodmb+5wsx4dmb+5ztRwfmr25z+FyfGj25jzvX5jymxfN
3tx9FRwfbE98aNx+xnrjnfP/7Qe7uf/9HDHHjWZv7nPHHDea/Xyc+zlljhvN
vjyn27lmjhvN3tx9MBw30MnxoXH7cT8Nxw37IT40bj/uy+G4YT/EjcbnOizB
iSf2g725z4NzPGn25j4/zvGk2Zv7vDnHk2ZvTnx4acpvXjR7c/dLcTyxPXGj
cftx3xXHE/shnjRuP+M+30XXde9xPs4luM/dc5xp9vNx7uf0Oc40+/Jcb+f6
Oc40e3P3t3Gc4focTxq3H/fJcZyxH+JJ4/bjfjuOM/ZDPGncfty3x3HGfogz
jduP+/84/tjPts+icPvxeYuOS/aDvbnPZ3RcavbmxJkXp/zmRbM3dx8kxyXb
E38atx/3U3Jcsh/iT+P2475MjkvzcS6V24/Pr3S8sp9tH8d0/Pt5l45Xzb7E
h6PnD/Gq2Zu7b5XjFeNyXGrcftz/yvHKfohLjduP+2g5XtnPdr5t4fbjflyO
V/ZDXGrcftzXy/HKfrb6zMLtx+eWOl7Zz5jn2bnPOXW8avbmxJ9np/zmRbM3
d38zxyvbE5catx/3SXO8sh/iUuP2435rjlfzcS6V24/7tjle2Q/xqnH7Gfuc
7Jz/P9fhEJy45HlFHGv25j4HwZz9ao5X9KU2tx/3u7N/xut41bj9uG+e45j9
EK8atx/333Mcs58x/5zcftzHz3HMfohXjduP+wE6jtkPcaxx+/H5wo5v9oO9
+fg90fzmRbM3dz9DxzfbE8catx/3RXR8sx/iWOP24/6Kjm/zcS6V24/7NDq+
2Q9xrHH7cb9Hx7e5DofK7cd9ufXeFX58XgncfcX9/mbu801KXLqUzsHdxxLu
81BK3Ni4z0kpcWDjPj+lPNcb97kq5XnfOM/pnJ+C+3yW8txt3Oe2lOdo4z7P
pTwXuw4656XM8437/Jcyb/frXeefuc+59ucp8w7uc2Q8r8x9voznlbnPnfG8
Mvd5NJ5X5j6nxvPKnHk156fgei/dn0edg+P5Y+7zcTx/zH1ujuePuc/T8fwx
9zk7jm9tP6DtmVfEJ8cx5tf4d5ey7zi5z/fx/DH3uT+eP+Y+D8jzx5z5M+en
4MyfJ6SDzxvyfDD3OUSeD+Y+n8jzwdznFnk+tH1btmc+8Pnj+UD8cJxhXozv
2/t5Sb7v8/2ht4O7ny3c5yv5vptz3+f8FJz7/pSul/jg613//3HuJ7nPe/J8
KPtqg4/9Rnbu86E8H9p+GdszH3i/8Hz4mfXzwfOB83YcH5gX4zh/GPvU3B94
nFffDe6+wb7vc34Kzn1/n66L++7r4v4+p+vyuVq+v7HvT+dt+f6a+xwu39+2
j8D23F/eB31/f2P9PPf9JU77/vIc+3nnPm86XNl9L/bpuA+z7+Ocn4KP/Qdu
xX30+Mf9cbfjfn1a4+e+tH0i5j7vzPer1Tnbnvv1zfV93PfrYn2f8v36+vo5
6fv15TWO+n59Zn3O4vN3vW++L67H5r7M67Rf384N8315WePkvvyOxsl9eV7j
RP+XNc5Rz9gvc+Q6rDN94N6K+3w63xdzn1vn+2Xu8+x8H819zp3vr7nPv/N9
N/e5eH5+zdGXebHpqXP0PE/Mfb6e54+5z93zvIrx6zw+zzdzn9PneRj3Xef3
eR62+r02D7+/6qe/W+tyzX0+oOehuc8N9Dw093mCnofmPmfQ89Dc5w96Hpoz
D+f8FNznGHq+mft8Q883c5976Plm7vMQPd/MfU6i51ur+7I98428i+cV36fH
v7uU+tLkPp/R88Tc5zZ6npj7PEfPE3PmyZyfgqPX26SDz4v0fDD3OZKeD+Y+
X9LzwdznTno+tPoc2zMfyKt5PpAvcTxBj/F538+7nMcH17/dDu4+/2N8eCW4
+//P44P5KTj3/TVd77aOqev1uZzz533nPq9z/rzv3Od4+v62egbbb/0N1s9D
31/yW76/zF8/71y37y/fk7b5r/NGfX/NfQ6p768593fOT8G5v9/R9XJ/fb3o
+F5dr89F9X0093mpvo9tPdf23EfeU8zbuiqfM/FeusYb31/mqe8v32vHOLyf
9zqPw4e4X3N+Cs798vi390ONn/v1gMaPjl/U+NHLuvm8Wt8X249xdbenPyyf
27rv9EP28x6c+2g/6sMc9ubcdz434OrDHPbm6ueseH5vtTdnXpH/gKsPc9ib
E0+4b3D1YQ578zGveC3mc7P3+qPWxWI++z6qr3LYmzP/fR/VVzns5/63/swb
V1/lsDfn+fqY7qP6Kof9fJyH43t0H3nemr251t3iOTXXc7rlS58a+ismdz9n
7Epf6LBnHO4frusted2d3z+um0d+uPWhbfbmPl8b7vO4/Xk0jwNpD3dcVZ/t
eC+yf/XZjvte6p3Qv40/8uf3634xvjJPWv/w0EfzLd4TyudIXK/8xzwsvPYz
b37a55rHL31i/OZ8rnke8jkVdRfr5445nyPmfC6Y65yI4H6OyO/YnnhuTnw2
J96aEz9L/cDxtfnzG+v+jNscnc3ROeoQVp3N0dkcnc3R87bqH+Be7/6983tm
7XNujv7m6G+O/uboH3UOa5xqfftbn+3WHzv6da/6R5/tVX/zrX+j+NaP0evR
q873q04A7vXlX13P1279olufZ/Otn6H41odQfOsrKL71CZyvj9d+xebj+3P2
BzYf32+X0N98fP9cQudHtC6/nX+n9dyznq/U/rrm4/tk9rM1H9/3ltDffHw/
yb7TrY9r67/a+qa2fqfm6G+O/tFvdtX5k1oHh3u99azbt2p/0dYXtPXzNEf/
6Cu76m+O/q0fb+tX2fpMtv6Qra9j68dojv7m6Px+rVPDvX76/HldoPZLbH0O
W3/C1lfQHP3N0b/1HW199lp/vNbXrvWja33kWv83c3Rm3c/c66fPne1qP7fW
h631T2t9z1q/stZnrPVL9Lrk2Ner9eNqfbRa/6vWt6r1m9o5OnsdkN9bnxbb
j32iWn+n1pep9VNqfZBa/6Lsz+b1JvSfrw8+FBz9Yx1z1d8c/c3R33x7z9d6
K9zraC+t75+tH445/98c/c3R3xz9zdG/9X1qfVpaf5Xo97LqH31aVv3N0d8c
/WOda9X5ca0/wr1u9Wvr+2frN9L6hJjj1xz9zdHfHP1bv53W76L1qWj9Jebr
ZfcGH+f/zsf5v4TOn9B6H9zrSi+s75+tP0Prq9D6IZiP8999Gx4KPs7/7FvS
+gC0/ftt333bL2+O/ubob76d86v1OLjXg766vn+2feht/3jb9932a5szDnP0
b/0c2r7mth+57SNu+3/bvl3zMf4cQmevo8Gdh/zs+v7Z9tW2/bBtH2vbf9r2
jZqP8Sf1bPsZ2z7Etn+w7fsz3/IJyqPq3MmwN//c+p7Z9ve1fXltP13bB9f2
r7Xrcv4T3vZrtHxXq+dv+ZlW793yCa1+uH3/bfWr7ftaed+O93Ced7+vMj/N
mZ9RP7nOT3Pmpznzs9Urtvfn9h7e3qttz3wzZ76ZM9/Mea5bPWEbZ6sHa++9
rV6ovae1+pP2XtHqHNrnYOmz0dbfL2+V57StK7V6yw+I89ySb97m4fp88h46
+l8uf3t9P4LzvF2sn9vwsf/nN6Juje/Z8HH/8j4e7tPTGg/34wWNB92/qvGg
729qPOj4gsbD89DWcfy8+Fxpn3P9Vrz58X2xH59P3Xjz4/trPz63uvHmx/PE
fnyedePNj+eb/fic68abH89b+/H51403P2W+bX5Up1F58+Pny358XnbjzY+f
U/vxOdqNNz9+3u3H52s33vw4btiPz91uvPlx/LEfn8fdePPjuEQ8ww+cz9vG
mx9/vvB5Ij/b+dSNNz8l7h1LHKu8+Slx71jiWOXNT4l7xxLHKm9+Stw7ljhW
efNT4t6xxLHKm58S944ljlXe/JS4dCxxpvLmp8SlY4kzlTc/JS4dS5ypvPkp
celY4kzlzU+JS5sf17M13vw4blC34zhDPVHjzY/fAx2HXZ/WePPjuFri5LHE
1f/fOreIM+5/1XjzY93K58hl+dy56/o3163h5y3q2eK9sdWzuW4Ne9etNd78
iIfOrnNrvPnxfefve54w3sabn/J34zl6K978lL8b87z4r89Rqzst+oT+5s1P
ue+h81vx5gfu+tsyT0KHEveOLe6VedLq8+O6Wj0qfnj/sv9WP8Z7nO15z2q8
+THnPW5+35fKmx9z3uPsh/esxpsfc97j7If3rMabH3Pe4+yH96zGmx9z3uPs
h++pjTc/5nxPtZ9t/1PhzY8574n2w3tc482POe+J83EulTc/5rwn2g/vcY03
P+a8J851OFTe/DjP6fjjdZbGm5/Ct+e3rYPw/0u8Opa4d9d9ruAlXh1LPLzr
vkmb/TxebessjTc/5iVeHUs8vOs+MPASr44lHt513xJ4iVfHEg9bXdaxxKtj
iVfbekfjzY95iVfHEg/ven89vMSrY4mHd71fG17i1bHEw7veLwwv8epY4uFd
72MdrzfiXqzvEF/KfY91HK9HjHmSt16n8Hj8Oft/ANrBvcU=
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.4], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJzt1r1twkAYBuATKRmBKjvQgeQmE2SESEmbEdgE0dNRUSCxQOaIXNLTpAhx
YXMyEM4648eNpcf2d+/nn/M9v32+vo9CCC/jEJ5CbDsUnHPOOeecc84555xz
zofp6+N2MymnuzvVmafKyTnnnHPOOeecc84555xzzjnnnHPOOeecc84555xz
zjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjn/t+8555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oee8L74+bjeTcjrPJQ//9dNz2eWSh3POOeecc84555xzzjnnnHOeWw7O+XD8
UETOu5cn7ufmXJzzh/fO5p+ezs+px8l2/s/k/1t5qvvf1ftT9fU1W3wsV9/7
v32bx+rExj1dX0TqN7ylr0aOWs6izWN1YuPXcrb6rX2c99TfybXjZPcdcs57
69Xx1OvMTNZvnPMBeer12MV5fgBfXXnu
              "]], {
            Axes -> True, 
             AxesLabel -> {
              "x", "y", "|\[Psi](x,y)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {0, 0.41380285203892786`}}, 
             PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyNnW+srldZp4svpcW6S+GgMgSwkBO/TYZRbD9IcjY4k5SAOnG+oCaTEeuf
GDuTzBhCC6iT+WCcGWJzbGjBgdIZIPzpMG8GPKBu+260GPWDQXNSkWMyKlFD
ckAOjYqhnTO433Xdz6zrfn6+0y87++o6917P71nP/aznXve610vf8G+/70e+
7oYbbvhnt9xww+ZrP7/jQ7d9+vr1c6f8vPfz3/pPb370Jy+c3nXr7RfPP7fx
t//eN//JXRe/ofFHbzn3s/dceVbjv3Fm5xmN/8+z9n+zM//YGf+Lxm84++/y
ifl79u0vmL9vb7/xX9/359j8A/v+N35xf72NP7bXp/Hxe+Kn6GqdzdHZHJ3N
0dkcnc3R2RydzdHZHJ3N0dkcnc3R2RydzdE58FP0s87m/G6OzubobI7O5uhs
js7m6GyOzubobI7O5uhsjs7m6Bz4KTpZZ3P+vTm/m6OzOTqbo7M5Opujszk6
m6OzOTqbo7M5Opujc+Cn6GGdzdHZHLvm/M7P5/3H09995J+/v3Q2R2dzdDZH
Z3N0Nkdnc3R2/9HZHJ3N0TnwU67bOpujszk6m/P34NbZHJ3N0dkcnc3R2Ryd
zdHZ/Udnc3Q2R+fAT7k+62yOzubobI7OcOtszu/m6GyOzubobI7O5ujs/qOz
OTqbo3Pgp1yHdTZHZ3N0NkdnuHU2p3/m/G6OzubobI7O5ujs/qOzOTqbo3Pg
p/TXOpujszk6m6Mz3Dqbo7M5/Tbnd3N0Nkdnc3R2/9HZHJ3N0TnwU/plnc3R
2RydzdEZbp3N0dkcnc25HnN+N0dnc3R2/9HZHJ3N0TnwU/6+dTZHZ3N0Nkdn
uHU2R2dzdDZHZ3Ou05zfzdHZ/Udnc3Q2R+fAT/k71tkcnc3R2RydzdHZHJ3N
0dkcnc3R2ZzrN+d3c3Q2R2dzdA78FHvW2RydzdHZHJ3N0dkcnc3R2RydzdHZ
HJ3N0cWc383R2RydAz/l31lnc3Q2R2dzdDZHZ3N0Nkdnc3Q2R2dzdDZHZ3P0
Mud3c3QOnHha09lc8bqms7nidU1nc8Xrms7mitc1nc0Vr2s6myte13Q2V7yu
+H33Pucrd1183ik/rb/5+P04tG9c9tv9NZf9xlP/HYdU+9afpI//7meee9vd
519z7pSf4seB0952js3pX7Lv/tMu9T/83aaP2rf7nvrvv/vFB2594vrP9Lju
915/wSeuXz9qfxfe4rqXn//49es397j64Ovxz024rk1r/y/O/u7TLd4Od/s7
zto92drD3f7OM/651h6+Hn/etjj/t+/bt3g+7W2H9uav2Pez2YG7/ffsdWjt
4ev2N218wt3+k/v72NrD1/tz1NrD3X6Mw9YeHtq3+Dbjs8XDxzhcjw9vGmdc
mTN+zBkn6/HzbYufc9/Nub/m3Mf19psW9+a+rNs5ahydA2/xbXRu8fCh83p8
eNM4Opujszk6r8fPty1+js7m6GyOzuvtNy3ujc7rdo4aR+fAW9wbnVs8fOi8
Hh/eFP/4tT/47jfc9lDp7Hg1Opuj83r8fNvi5+hsjs7m6LzeflNx74dH/9HZ
14vO5ugceIt7o3OLhw+d1+PDm+LW2fFqdDZH5/X4+bbFz9HZHJ3N0Xm9/abi
3tbZ14vO5ugceIt7o3OLhw+d1+PDm+LW2fFqdDZH5/X4+bbFz9HZHJ3N0Xm9
/abi3tbZ14vO5ugceIt7o3OLhw+d1+PDm+LW2fFqdDZHZ3N0Nkdnc3Q2R+f1
9puKe1tnXy86m6Nz4C3ujc4tHj50Xo8Pb4pbZ8er0dkcndfj59sWP0dnc3Q2
R+f19puKe1tnXy86m6Nz4C3ujc4tHj50Xo8Pb4pbZ8er0dkcndfj59sWP0dn
c3Q2R+f19puKe1tnXy86m6Nz4C3ujc4tHj50Xo8Pb4pbZ8er0dkcndfj59sW
P0dnc3Q2R+f19puKe1tnXy86m6Nz4C2+jc4tHj50Xo8PbxpHZ3N0Nkfn9fj5
tsXP0dkcnc3Reb39psW90XndzlHj6Bx4i2+jc4uHD53X48ObxtHZHJ3N0Xk9
fr5t8XN0Nkdnc3Reb79pcW90Xrdz1Dg6B97i2+jc4uFD5/X48KZxdDZHZ3N0
Xo+fb1v8HJ3N0dkcndfbb1rcG53X7Rw1js6Btzih4nJN5/W44qZxxdOazuaK
jzWdzRUHazqbK37VdDZXPKrpnOKc/LSeL/rTW//LPVd6PPO1//g5r75yh+Pk
mxZXLz/8qed85NIXFo6ef6g4LXre+K9ue+HF9/Y44StCXNH9R0/3Hz3df/R0
/8sPq//o6f7Tjy//6Ated/41R01PflrPRx/8R+evXLq16fnsl7/w/kv3PKfp
+e13H/2fu553W9PzDdujj12657am5/1PHf3E+d+5rem5C3HXa+o/en6P+l9x
IfUfPb9e/UfPV6j/6On+4wfcf3S++b3nrt518aam84+88vmvP/+am3tcaPy0
zt9yzze+/MqlZzed33LjN/3XS/d8fdP5s+/6ppsvnr+l6XznHd/8U/dcuaXp
/ECIc96k/qPz3ep/xYXUf3S+Xf1H57eq/+js/qOz+4/OLzl7jnr87c1nz8vX
NZ336yqbpjM/PR+++OrnvvLKpWeevuMn//KrH7x2sXT+0mef+4FL99x4+uTv
/e2//Nz7/nPp/N3//nnPv3j+Wacff/z27b/78f9QOn9oxA+vSucXj/7/p7+f
3l7676XzfaP/X3368ps+/62PlM70/4k3PvbwC//Ju0rnO0b/rfMvjv5bZ/pv
nem/df6xs/v+lRYXetnZ/f27Fhe6cnYfv9riQvt49VMtLsRPf3fccvacXm9x
oR8+ex5vaHHO0xDn/NHRf3933D767+8O+u/vjgdH//3d8X2j/9b5G0b/rfMb
Rv+t8/mz/ny+6fyOs797tem8t/9XTee9Dteazvvn4stNZ35a52tn4+SvW/zt
wyHO+dLRf+v89tF/60z/1+PJ15rObx39t853jv5b5y+N/lvnT5/1/1LT+eSM
/1bT+VNn/fn9pvNHzto/0XR+6Ox6/7jpvL+uP20689M6PxrinJ8Y/bfO29F/
6/z46L91/ujov3V+ePTfOj8++m+d7xj9t84vH/21zr+2t9PiQr+w/7stLvT+
fT9bXOhkf10h/vZbLS704F63Fhfip3Xmp3V+bPTfOt8/+m+dHxn9t86/PPpv
nd85+m+dHxn9t85f2I/zpvO3jf5a53v3z1HTeX9d15rON++f06bz/nvzatP5
xXs/0HT+QIhzfnH03zrz0zrT//W40LWm8zNH/63z/aP/1vklo//W+Yf2frt9
3+31ud50rv5K5/2866mm8x/t3ztN531//q7p/MP791rT+YMhzjneOy3+9uzR
f+vMT+t8cfTfOv/h6L91fvHov3W+e/TfOr9uPw9pOv/Vft7S40L7eU77jqa/
nj/vv482x78y5lHoPOZdx18Y8y503n+vPeP4LWOeNn+nPOP4Fuk85lHHPz3m
geg85l3HvzrmjRUXGv1/y5hn0m9+WucnRv+t872j/9Z5zDPb9/Ud+3l103k/
Dm9pOo/vjqbz+E5pOo9/1+IV4zuixSvGd0eLV3woxDnvVP/R+bPqPzq7/+j7
EvUfnT+p/qOz+4/O7j86j+/EpvP4rmw6j+/opvP47m46j+/cpnONC+k8vqOb
zg+EOKf7j87uPzq7/+h8s/qPvh9W/+m3+4/O7j8637SPzzSdnV+Hzh/cx0+a
zs5LROfX7eMzTef989XjnPQ3xDeazu4/Orv/6Oz+K17UdH6t+o++L1L/pWf7
TnQcrObbindh56p0oL31kf3GU5zQeWjknzn+Rjtz8qjMyfsxJ0/FnLwKc/IA
zFm3Nmed1Zx1QXPWscxZdzFnncCcuLY5ejpOiJ7m6GmOni3eOPQ0R09z9DRH
T3P0NEdPc/Q0R09z9DRHz6Bb47X/ejUeeK7x2pctXvuyxWtftnjtyxavfdni
6Gxe+7LFa1+2eO3LFq992eK1L1u89mWv69b4vK/B8cBzjc/7HTZNZ/N5v8MS
V5z3Oyx83u+wcHQ2n/c7LHze77Dweb/Dwuf9Dpums/m836Hp1jg68/60zubo
bI7O5ujs+CE6m6OzOTqbo7M5Opujszk6u//obI7OQbfG0Zn5iHU2R2dzdDZH
Z8cJ0dkcnc3R2RydzdHZHJ3N0dn9R2dzdA66NY7OzO+sszk6m6OzOTo7HojO
5ui8Hj+8fGKOzubobI7O5ujs/qOzOToH3Rqf6wlsW50B5svW3+3hbj/XJdi2
egVuP9cr2LY6Bm4/1zFY4opwxxXn+gbbVvfA7ee6B9tWD8HtGQ9uD3f7uU7C
ttVPcPu5fsK21VVw+7muwrbVW3D7ud7Coj/c+s91GLatPoPbz/UZtq1uQxhv
rT3c7Rm3fM95fJozDs0Zb+aMK8dLGT/mjBNzxoM5992c+2vOfTTnfrn/3Bdz
9A+6NY7O63HXc42jszk6m6Oz46LobI7O5uhsjs7m6GyOzubo7P6jszk6B90a
n8fzEoecx/PC5/G88Hk8L3wez0v8cx7PC5/H88Ln8bzweTwvfB7PC5/H88Ln
8bz0fx7PC5/Hc9OtcXR2HBKdzdHZHJ3N0dkcnc3R2RydzdHZHJ3N0dkcnc3R
2Rydg26Nz37jqOlsPvuNo6az+ew3jprO5rPfcJwWv3HUdDaf/cZR09l89htH
TWfz2W803RpXXK7paa74W9PTXPG3pud6PLbib01Pc8Xfmp7mir81Pc0Vf2t6
mpPP53gd+Wfm5EuZk99jTj6K+WdG/oH51bGOa866qTnrfOasS5mzDmFO3Nyc
fDvH2cgPM3/pyAcyf2jkr7T43si3MGc92Jz1S3PW28xZXzFnPWCdb1p8749H
PpM5+Tfm5Iu0+NtYpzRnXc2cdSBz1i3W45lPVRzs0njPks8E/5XB/8fIX4F/
YvDxe4tHsU5pzrqa+ZunuhbmX25xpLePvBlz1kFbXGuse5mzzmT+yZF/47gH
ftbxCtalzHlO/J1Cfq05+aDm5C/CyWMk387fceSHmZPPZE5eiDl5DOasu8NZ
f2ed2P3Hn7TrHf7EnDxjf3eQF2tOHiecfE7yDv19RJ6cOXld5uRtmJNnAP/E
yDdgXdz9xM+Y42fW+aa+gy6PPAryJv09gp8x/83hZ8zxM7VuP/Ii8DP+HsHP
mONn1r/7nqrvhXcNv0HeYeVtDb4dfsbt8Seet+NPzFmXNX/L8Ceel757+BNz
1svNWd81/83hNzwfwz+Ys+4b1k/be/bGuX3ZYT04zGcav3F+jxdnv4Tfd+QR
mpP3Zs7+irZeNvYJmL9t5POZv2nkn5nfO9U7au+XxsnvN3/fyBf0e5D8PHPy
yfx+ZH+I3yPs0zBnX0Fbpxh55PB3jufx10f+ot935Auak99mTj4W/OPDn7CP
xe8v9mOYs3/AnHz3yt8f/pD8cr9PHx75l+bkO5qTn2dOPhn86vD/5A+5nzxH
joezz8ScfRHm5PHD2Y9A3rzj+eR5m5Mva05+pzn5fObkz8HJoyNfyv0nv8e8
9oOIs//K8Vj2EZk/EOL/7NOAs1+DfQWOV5MHb07etjn5r+bka5qTXwgnz5B8
uHBdjZNvZI5f9ft9N/yq5xX4zxYvHf7TnHxuv9/J3zVnn5vfj+zXMmd/kTn5
1lX/YIrjXbvg9zv5rC2+N/yn36fsEzNnX5M5+3DM2TdiTl64OXnM5p8ZftUc
v7rOe1wLv2qOXzXHr5qz78X83cOvmpOH3eYnw6+a41fN8avN/vCfnleMOEPj
Iy7ROP7THP9p/t7hP82/ZfhPc/ynOfm75iPOk+JCjZOHl/bVtjy3Mb9Znwdu
Guf93eI54z1nrjzJ4viptH/WHD+y3n7TrpfnYd3OUeNfDLqhz3p+16Zx9DFH
H3P0Wc9z27Y8N3QwRwdzdFi3c9Q4OqTr9XxYeeDtes2rjtlqvtm25ZvVfjHx
qj8mXvXHxLmu1H/Pt+d998t8e953v8Sj6L/5vF9+c/q/1H9/F8z75Tet/+b0
0/Nt+rmeB7VteVD0x98F9Mec/pjzd9fzgrYtLyjFteZ9ZwvHjuefKd7FOG75
G+Thi6Mv3Pt3HI+if+b0bz1PY9vyMfB75pVvv9p+U/Er7x8Jca3G0Tnp1vIQ
hm7r6/Wb4tbN80x0M0e39byFbctbQB/zeX/Nk00f9x99zNEnXS9/39free+8
X+Ppdr3r+QPblj/AdcF9XZ6fz/ssnm7XZT7fryUONt+vZV4936+l/Xy/Nsfv
XtW/728yn/VfOP3xvJf+rK9fb9v6NX/XnL+b7K+v227buu2sc28f9ke0eQXP
5/p7v8fBsOP3XdUv9TrOsL/+/n2y8XlfxqbZb/nSUz2cTfu7zlue69Is7+W5
Ls3yXqY/fh/Rn5ZXPPqznn+7KU5/6Kffm/TTnH6ut1/iYA+r/37f0f+Wrzv6
v57Xuiluv+T3L9dlznWtv6+fDu039b62X0rrU47zcL0tb3Zc73p+6WaJg+l6
PU+gH+a131AcHczRYb39puJX1sH9n+sbHI6DoZvjPHN90W2oL+o8xk3x9fqi
21BfdBvqi/b99eboaY6e6+2pI7oNdUS3oY7oNtQRbbzNZ+i/5xW093sT/du6
1bCz/h5/svG5P8v7bp6P/T95dNN8bOFz/5f42LzvfnmPz/OoJT5Gf/wepD8t
32z0Zz0va9M4482c/re43Oj/+nv86dC+x8fm+3jUrqvld037/Z0HtWl8ngce
tesyn8fDUbuu9fabNq+Y54H9ulqe1Rz/addlrvhPm4+Zq05au15zxXna9Zor
ztPmdWl+ZR72k9Y5EzrvYCc7xUP9ut28H+1ca28e6t3t5n1qvb15qI+3m/e1
9fbmoZ7ebt4H19ubh/p7O50T1Nqbh3p9O50r1Nqbz98p5u3c8Gpvznj2fQ/n
jO/m+e3CGf++7+Fc8t08H7b9VldwN+8T7O3NQx3C3byvsLdf72erW7ib9yH2
9ubhnKCqg+nrDecr7UK+QY2P9Lwnbjuh7mJx2wn1GOt5T+3NVUeiPe+pvXmo
91jPe2pvHupD1vOe2puHepL1vKf25jy/u1Xezq+v9uYh/6Sed7fneU/cdniu
PR7wA7ZD+3X7rR5m+YHU3jzUzyw/kNqv97PV2yw/kNqH5871OavucGpvHvKF
yg/o/J163hO3nZB3VOPSdsJ5SbsQtyk/YM6/t51w7lL5AdUjLb+R2puH+qXl
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
idtOqItY/s128GOJ206or1j+bb2fm8htJ9RpLP9mO/ixxG0n1Hss/7auw1Hk
thPqcte+2vXnrrcPdcVr/mYezjexXzqVzo2HOpa7cB6K/UbxcE6K/UDxcH6K
n+vi4VwVP+/FeU7XeaufuQvns/i5Kx7ObfFzVDyc5+LnYtFh/ZwXj/Pi4fwX
j9vlesf4Mw/nXJe+jDt4OEemxpV5OF+mxpV5OHemxpV5OI+mxpV5OKemxpU5
42qdt7qjnpcuz+P6OTg1fszD+Tg1fszDuTk1fszDeTo1fszDOTvl39J+QLdn
XOGf7McYX/PfbfVUl/0p4uF8nxo/5uHcnxo/5uE8oBo/5oyfdd7quNb4uVs6
hPOGajyYh3OIln0T4uF8omV/hHg4t6jGQ9q35faMB94/Hg/4D/sZxsU8317O
S3q91jXMfY4S++xczxbu85V+YHDXuYVz372vk/vu9tx3zsl5cKyb4B+43jeN
dZnx713nVvVJNqfH07y0nfekOiRtX23jc72RhYfzoWo8pP0ybs94YH7h8fCy
8X7weOC8HfsHxgX6+7wqr0OZ+xwrrzeZc9/X+bZx7jvnIHkdh+vyusyD47pY
lwnnatX9NQ/nbdX9NQ/ncNX9TfsI3J77y3zQ9/cd433u+4uf9v3lOfY6JvcZ
3XxemO+jOfdxnW8bn+sPXG33kf77PnLOktfX3jr67/uS9omYh/PO6n6lPGe3
5359eszHfb9OxnzK9+tT4z3p+/WR4Ud9vx4az5mfx98Y9833xfnw3Bdz7gvn
hvm+8D73ffno6Kfvy8Ojn9b/8dHPdT3bfpljrsM6q7505OF8urov5uHcurpf
5j7P7gfG+rvrfnMffc6d8wTMff6d77u5z8Xz82uOvowLuM/R8zgx9/l6Hj/m
Pnfv1p/e7wNiXMEZV+E8vvLb5uGcvhqH7b6vn99X4zDl76Vx+IWhn/5uzMs1
D+cDKr9l4T438KExL3IddcahzxP0ODT3OYMeh+Y+f9Dj0JxxuM63jfscw/W8
joX7fMOvfHS/f3bO93iyxls493CpWyUezkOs8WYezkms8Zbyvtye8UbcxeOK
72l/J6LTG+d5cnHGic9n9Dgx97mNHifmPs/R48SccbLOt42jF+MF7vMiXznq
PMzrTU/XeAjnSGr9aOHhfEmtKy08nDtZ4yHl57g944G4mscD8RL7E/TwdyJ6
XNA8xNznYH6XvhPNfT7mBX0nms/+YcnLmv3D5vhY34k890+N573WMcf1ct/D
uZx63hcezuvU877wcI5n3d+Uz+D2Vd9gvA99f4lv+f4yfj3P5LpD/Kd4OG+0
vgfMwzmkFf8x5/6u83bOQr0/Pqvr5f76etHxJbrecC5q3UfzcF5q3ce0nuv2
3EfmKeZpXZX3TJuXDn/j+8s49f3luxYeznvdzX74qN2vdd7Oraj75f7X/FD9
537drP6j44fVf/SybuG82rovbj/71aU99WF5b+u+Uw/Zz3vj3EfbUR3m1t6c
+857o+IVI56Y2purnvPSfsShUntzxhXxD7jqMLf25vgT7htcdZhbe/M5rniu
jefU3uuPWhdr49n3UXWVW3tzxr/vo+oqt/br9qs+c3HVVW7tzXm+Xqv7qLrK
rf16P4+OX6T7yPOW2ptr3a09p+Z6Titeet9UX7Fz13OmXagL3drTD9cP1/WG
uO7Cb5rXzVt8ONWhTe3Nw/nau3Aet+pJdr8X1vfb+0t1ttu8yPZVZ7vd95Dv
hP6p/y1+fpPuF/0L4yTVD2/6aLy1eUJ4j7Trlf02DgOP9cyTnfRec/+lT+u/
Oe81j0PeUy3vYrx3zHmPmPNeMNc5EY37OSK+4/b4c3P8szn+1hz/GfIHjr+0
/vy2dX/6bY7O5ujc8hCGzubobI7O5uh5TfkPcK93/9p+nhnrnJujvzn6m6O/
Ofq3PIfhp1Ld/lRnO9XHbvW6h/6tzvbQ37zqN4pXPUavRw+db1KeANzry28b
52unetGpzrN51TMUrzqE4lVXULzqBK6vj8d6xebz/HnT9Def57fLuvM8X134
PP9cODqzDkD8v86/G39n3vf6RKyva/vzfHLh8/xw4fN8b9P0N5/nJ73udKrj
muqvtvXTob85unidF/3N0d8cnVlXMXf9ur1uvx/ri6a6oObob47+ra7s0N8c
/VM93lSvMtWZNEd/c/RP9RjN0d8cnVmnMnd9rYf36wKxXmKqc2iO/ubo7+tF
f3P0T3VHU529VB/PHP3N0T/VkUv138zRmXU/c75r4Q/u28V6bqkOmzn6m6N/
qleW6oyleol8f1t/87ke18LnOloLn+tfpbpVqd7UwtHZ65v8nuq0uP1cJyrV
d1r4XJdpe2L9fb1zHaRUv6jXZ/N6E/qbo785+rd1zKG/1+nQ3xz9zWueP9Zb
zV0XYjfmn6kejjn/3hz9zdHf14v+5uif6j6lOi2pvkqr9zL0b3Vahv5eL0N/
c/Q3R2fW/829X/4Xxvwz1RtJdULMsWuO/r5e9DdH/1RvJ9W7SHUqUn0J83n8
L+tZ8/hf+Dz+F47O5FOQRwH3utIjY/6JnVdr/pnqKqR6CObz+F+udx7/C5/H
f69bkuoApP37ad992i9vjv7m6G9e5/xqPQ7u9aBfHvPPtA897R9P+77Tfm1z
+mGO/qmeQ9rXnPYjp33Eaf9v2rdrPvufo6az19HgjkO+e8w/077atB827WNN
+0/TvlHz2f90PdN+xrQPMe0fTPv+zCueoDiqzp1s7c3fO+aZaX9f2peX9tOl
fXBp/1q6Lsc/4Wm/Rop3pXz+FJ/xd/ocL9209v6upH07b2W093cQ7f1d43PJ
3T597zjPjfFpzvhs+ZNjfHrey/g0Z3ymfMU0f07z8DSvdnvGmznjzdfFeDPn
uU75hOY+H9z3xfNDnwPu9i0fabK/vPdn+5v2vKQ8h/QeDHU20vr76dXwnKZ1
pZRv+XJxnlvizTUOx/PJPHS2vzl9/5gfOe/6ZLy3nc/2nvE+cd4a39nOQ3ts
9Mf5iveP/ji/mvma86uZR9B/9H3n6I/0GXYuFed5SOs4/h4M50pfUP2BQ/zg
+dS2E86nTvzgudW2E86tTjzZSedTX1AexSF+8Jxr2wnnXCd+8Pxr2wnnXyd+
8Fxs21GexiF+8Lxs2wnnZSd+8Bxt2wnnaCd+8Hxt2wnnayd+8Nxt2wnnbid+
8Dxu2wnncScez+lWPgP+qt5fmucnHusMKJ/hVHZ8PnXisS5ByOOyHzvED+aD
2U7IB0v8YJ6Y7YQ8scQP5o/ZTsgfS/xgXpnthLyyxGO+Wcgrsx87xGN+Wsgf
s585xA/modlOyENL/GB+mu2E/LTED+at2U7IW0v8YD6b7YR8tsRjnht+Q3k7
5WeUb5Z4zFsL+Wbu5yEe89a4nuAnnfeS+KE8t+ZnQv2rxA/ms4X3iOMqicf8
t5C3diHwlLd2IfCUt3Yh5K0lHvPfQp7bhZDnlnjMl+N35aHVOFFeXOIxvy7k
0dV9/P/kh/LxnHenOM9Bfih/z3l67uchHvP9Ql6f+3mIx/zAkH/rcdJ0CH7P
3Hm5TYeQn9+uK+WjYkfxwAuBV3vlv1V7xQkTT3aKK79L931ziCc7S/7bXI+i
7CgOmXiyU1z1EMqO4paJJzvFtX+/7CjOmXiyo/yE2p9+YebbQzzZKa59x2VH
8cDEk53i2mdadhQ/TDzZKa59i+rn5hBPdoprfbPsKD6ZeLJTXOt30uHoEE92
0rqJ4xKHeFx/CesdF9I6CP8++CuvgySe7BQP/srrJoknO8WDv/I6S+LJTvHg
r7wuk3iyUzz4K6/jJJ7sFA/+yus+iSc7xYO/8npH4slO8eCvvD6SeLJTPPgr
r6cknuwUD/7K6y+JJzvFg7/yek3iyc5uvt7m99r6Dv4l3Pe2jhPWIy4ErnHY
3rNt/eL/AuYJBDk=
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.4], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJzt1rENgkAUANCLlk7hHBY0TuAIJto6gpsYN2EB57BmBBulAC+nxCMHPhqS
B9z/n3Cfv96fdodFCGG7CmEZYkdTcc4555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeec81l7zTnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzufopeTB
Of8fb6rIfb/yzPUMzotzPnsfrf9MtD/njlNs/y/k/9t6rvc/1vfT1nXbnI+X
671+nVMeWycW9/l8FVm/54m6enl08qxSHlsnFr+TZ9KH1vHec++Tb+MUtw85
55P19nruObOQ+Y1z/keeex77OJ8Hu5dm4g==
              "]], {
            Axes -> True, 
             AxesLabel -> {
              "x", "y", "|\[Psi](x,y)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {0, 0.41380285203892786`}}, 
             PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> False}], 
           Graphics3D[
            GraphicsComplex[CompressedData["
1:eJyNnV2sbVdVx1s2tcVySuGiIqEI5MY3IioWDZpz/XgoAdT4FZ9MxKoJsfog
UVtQ9NWI1kulSJRKrAZKxR0KVxIu7AOC0USxmpuKXE1Eo1FToB/xg9h61bPn
byznb6y/2/tycn6Zd5yx/2uusdYec8wxX/iaH/uOH3zKVVdd9S3XX3XV5r9/
fs19Nz545cqZE37e/k9f/pXX3f8jxye33PCC82ef2fhbPvElf3PL+ac3fv/1
Z372tstf0PhHT+1c3fjvno7/1535+075PzR+1em/SxfNf2M//tj8t/b2G//Q
3p9z5u/c+9/4+f3nbfzDe30aH78nfoKu1tkcnc3R2RydzdHZHJ3N0dkcnc3R
2RydzdHZHJ3N0dkcnQM/QT/rbM7v5uhsjs7m6GyOzubobI7O5uhsjs7m6GyO
zubobI7OgZ+gk3U25/+b87s5Opujszk6m6OzOTqbo7M5Opujszk6m6OzOToH
foIe1tkcnc2xa87v5uhsjs7m6GyOzubobI7O5uhsjs7m6GyOzoGf8Lmtszk6
m6OzOX/PnN/5+Z03vPi9v/653yudzdHZHJ3N0dkcne0POpujszk6m6Nz4Cd8
Putsjs7m6GyOzub4AbfO5uhsjs7m6GyOzvYHnc3R2RydzdE58BM+h3U2R2dz
dDZHZ3N0hltnc343R2dzdDZHZ/uDzubobI7O5ugc+An+WmdzdDZHZ3N0Nkdn
uHU2x29zfjdHZ3N0tj/obI7O5uhsjs6Bn+CXdTZHZ3N0Nkdnc3SGW2dzdDbn
85jzuzk62x90Nkdnc3Q2R+fAT/j71tkcnc3R2RydzdHZHJ3N0dkcnc35nOb8
bo7O5uhsjs7m6Bz4CX/HOpujszk6m6OzOTqbo7M5Opujszk6m/P5zfndHJ3N
0dkcnQM/wZ51Nkdnc3Q2R2dzdDZHZ3N0Nkdnc3Q2R2dzdDHnd3N0NkfnwE/4
f9bZHJ3N0dkcnc3R2RydzdHZHJ3N0dkcnc3R2Ry9zPndHJ0DJ5/WdDZXvq7p
bK58XdPZXPm6prO58nVNZ3Pl65rO5srXNZ3Nla8rfsftz/j3W84/64Sf1t98
/H4ujG9c9tv1NZf9xpP/zkNqfPMn6eO/+8ln3njr2VecOeGn+LnAGW8758zx
L9m3/4xL/oe/2/TR+Hbdk//+u5+964aHrryx53W/7cpzPnDlylH7u/CW1730
7I9duXJdz6sPvp7/3ITPtWnjv/307z7Z8u1wj7/5dNzjbTzc4192yv+ujYev
55+3Lc//1fvxLZ/PeNthvPlL9342O3CP/9a9Dm08fN3+ps1PuMd/ZH8d23j4
uj9HbTzc48c8bOPhYXzLbzM/Wz58zMP1/PCmceaVOfPHnHmynj/ftvw5192c
62vOdVwfv2l5b67Lup2jxtE58JbfRueWDx86r+eHN42jszk6m6Pzev582/Ln
6GyOzubovD5+0/Le6Lxu56hxdA685bfRueXDh87r+eFN4+hsjs7m6LyeP9+2
/Dk6m6OzOTqvj9+0vDc6r9s5ahydA2/5bXRu+fCh83p+eNM4OsM/+21vuvtH
n/WbpbPz2+i8nj/ftvw5Opujszk6w/9k+IPO9h+dzdHZHJ0Db/ltdG758KHz
en540zg6w62z89vovJ4/37b8OTqbo7M5OsOts/1HZ3N0NkfnwFt+G51bPnzo
vJ4f3jSOznDr7Pw2Opujszk6m6OzOTrDrbP9R2dzdDZH58BbfhudWz586Lye
H940js5w6+z8Njqv58+3LX+OzubobI7OcOts/9HZHJ3N0Tnwlt9G55YPHzqv
54c3jaMz3Do7v43O6/nzbcufo7M5OpujM9w62390Nkdnc3QOvOW30bnlw4fO
6/nhTePobI7O5ui8nj/ftvw5Opujszk6r4/ftLw3Oq/bOWocnQNv+W10bvnw
ofN6fnjTODqbo7M5Oq/nz7ctf47O5uhsjs7r4zct743O63aOGkfnwFt+G51b
PnzovJ4f3jSOzubobI7O6/nzbcufo7M5Opuj8/r4Tct7o/O6naPG0Tnwlt9G
55YPHzqv54c3jaOzOTqbo/N6/nzb8ufobI7O5ui8Pn7T8t7ovG7nqHF0Drzl
CZWXazqv5xU3jSuf1nQ2V36s6WyuPFjT2Vz5q6azufJRTeeU5+Sn9Xzep2/4
hdsu93zmK1/8jG+6fLPz5JuWV684/PFnvOfCZxaOnn+hPC16XvN9Nz73/L09
T/jSkFe0/+hp/9HT/qOn/a84LP/R0/7jx2M/9JxXnX3FUdOTn9bz/ru/9Ozl
Czc0PZ/2kufeeeG2ZzQ9v/rWo/+85Vk3Nj1fsz1634Xbbmx63vnE0WvP/tGN
Tc9dyLs+Kv/R81vlf+WF5D96fqH8R8+Xyn/0tP/EAfuPztfde+bhW85f23T+
wa9/9veefcV1PS80flrnL7vti15y+cLTms5vuOaLf+3CbV/YdP7Ur3/xdefP
Xt90ftnNX/K62y5f33S+K+Q5r5X/6Hyr/K+8kPxH5xfIf3T+afmPzvYfne0/
Oj//9D7q+bfXn94vT2k679dVNk1nfrb3h2965tdfvvDUpvMjn3rmOy/cdk3T
+dU//qxnnz/b85z3hTznTfIfne+Q/+hs/9H5ZvmPzm+W/+hs/9HZ/qPzD59e
939veaEXnV7fz7e80OXT6/gfLS+0z1c/0fJC/PT3u+tP79Mru+963x/+xIfv
eVvp/AOn9+NVJ7/5y595w/HX/KLWa64+ef0/zzr/0PD/jjc/56nfc8P7S+cX
DP/f9j/4xe8tne0/Ot8t/9H5O4b/1vnpw3/r/Jrhv3U+e+rPPzWdf/X07z7c
dN7b/1zTea/Do03n/X3xWNOZn/4e/ejpPPmXln97d8hzvnD47+/Rbxn++3s0
/vt79Eflf8WN4b91ftnw3zo/Mvy3zg+e+n+h6XzxlP9B0/njp/78WdP5Pafj
H2o6v/X08/5V03n/uT7ddOandb4/5Dk/MPy3ztvhv3X+2PDfOj8g/9H5nuG/
df7Y8N863zz8t84vGf5a5w/u7bS80C/t/27LC/323s+WF7q4/1wh//YHLS90
9163lhfip3Xmp3X+8PDfOt85/LfO75D/6Pz+4b91ftvw3zq/Y/hvnT+zn+dN
568a/lrn2/f3UdN5/7kebTpft79Pm87775sPN51v2seBpvM7Q57zs8N/68xP
64z/1vlD8h+dnzr8t853Dv+t8/OH/9b5+/dxu32/2+tzpelc/krn/XvXE03n
v9w/d4qj896fzx///HhO1XNw/1w7fu14rqHzu0b+8JXSeTx3zn35eG6i79OG
/2fGcxa/+Wmdz8t/dP4L+Y/ONw3/rfOtw3/r/Kr9e0jT+XP795aeF9q/57Tv
0fhrnfffjxaOzuO9q32P3n9f63nOXchzvlr+o/Mj8r/yQvIfv+0/Oj8k/9H5
dvmPzjfJf3S+ef9e3XTez8Prm87je0fTeXxPaTqP/9d0Ht8jms7je0fT+b6Q
53yZ/EfnT8l/dLb/6Pt8+Y/OH5H/6Gz/0dn+o/P4nth0Ht8rm87je3TTeXzv
bjqP77lN55oX0nl8j2463xXynPYfne0/Ott/dL5O/qPvu+U/ftt/dLb/6Hzt
Pj/TdHZ9HTq/a58/aTq7LhGdX7XPzzSd9/dXz3Pi73rc6HlO+4/O9h+d7b/y
RU3nV8p/9H2e/Jee7Xui82D1vq18F3Yelg6Mtz6y33jKE7oOjfoz598YZ04d
lTl1P+bUqZhXHYl41T2Is25tXuvK4rUOKs46ljnrLuasE5iT1zZHT+cJ0dMc
Pc3Rs+Ubh57m6GmOnuboaY6e5uhpjp7m6GmOnuboGXRrvPZfr+YDzzRe+7LF
a1+2eO3LFq992eK1L1scnc1rX7Z47csWr33Z4rUvW7z2ZYvXvux13Rqf9zU4
H3im8Xm/w6bpbD7vd9g0nc3n/Q6bprP5vN9h03Q2n/c7bJrO5vN+h03TOejW
ODrz/LTO5uhsjs7m6GyOzs4rorM5Opujszk6m6Oz/UFnc3Q2R+egW+PozPuI
dTZHZ3N0Nkdnc3R2/hCdzdHZHJ3N0dkcne0POpujszk6B90aR2fe76yzOTqb
o7M5Opujs/OE6LyeP7x00RydzdHZHJ3tDzqbo7M5OgfdGp/7CWxbnwHel62/
x8M9fu5LsG39Cjx+7lewbX0MPH7uY7Bt/Q08fu5vsOQh4c5Dzn0Ptq0fgscz
Hzwe7vFzn4Rt65/g8XP/hG3rq+Dxc1+FRR+49Zn7LWxbHwaPn/swbFt/Bo+f
+zNsW9+GMN/aeLjHM2/5Puf5ac48NGe+mTOvzJk/zqMyT8yZD+Zcd3OurznX
0f5wvcy5LuboH3RrHJ3X865nGkdnc3Q2R2dzdHa+FJ3N0dkcnc3R2Ryd7Q86
m6OzOToH3Rqf5/OSh5zn88Ln+bzweT4vfJ7PC5/n88Ln+bzweT4vfJ7PC5/n
88Ln+bzweT4vfJ7PC5/nc9OtcXR2HhKdzdHZHJ3N0dkcnc3R2RydzdHZHJ3N
0dkcnc3R2Rydg26Nz3HjqOlsPseNo6az+Rw3jprO5nPccJ6WuHHUdDaf48ZR
09l8jhtHTWfzOW403RpXXq7paa78W9PTXPm3pud6Prbyb01Pc+Xfmp7myr81
Pc2Vf2t6mlPP53wd9Wfm1EuZU99jTj2K+SdH/YH5w2Md15x1U3PW+cxZlzJn
HcKcvLk59XbOs1EfZv7CUQ9k/tZRv9Lye6Pewpz1YHPWL81ZbzNnfcWc9YB1
vmn5vb8a9Uzm1N+YUy/S8m9jndKcdTVz1oHMWbdYz2c+0fJg1DOZ/86oX1nP
R21aPop1SnPW1cxfP/W1MH+s5ZHeMupm4J8bnHXQltca617mrDOZf2TU3zgf
Qpx1voJ1KXPuE39Pob7WnHpQc+oXzam3g1N3R32Yvw9Sz2ROXYg5dQzwF416
Btbd7Q/rxObEk/Z5Rzwxp87Y3zuoizWnjtOcukM49YfUyfn7FHVd5tRtwKnf
oM7Af5d1cXPijDlxZp1v2vcg6ibNiTPwT4z74vdHnPH3GuKM7RBnzIkz5sSZ
9e99T7TvC9Qdmm9HnDEnnpgTT8xZlzV/w4gnfi99+4gn5qyXm7O+a/77I274
fYz4YM66b1g/bc/Za+bxZYf14PA+0/g183O8OPsl/LyjjtCcujdz9le09bKx
T8D8TaOez/ynRv2Z+e1Tv6P2fGmc+v71dZyH2joO9Xnm1JO19Z2xP8TPEfZp
mLOvoK1TjDpy8w+N+kU/B6kXNKe+zXaox1rnff2C/Rjm7B8wp97dnPpy+HeP
+HnPqL/0c5Z6R3Pq8+DU6VFP5r9L/ZA595Hz4ewzMWdfhDl1/ObUzcPvHc9N
6ryd/6de1pz6TnPq+eDUJVI/Z3+olzKnvse89oOIs//K+Vj2EZnfFfL/7NNY
X3dY8vnsL6AO3nlv6rbNqX81p14TTt0m9YXBz8bvCnlv6o3Miat+vu9GXPX7
BvGz5UtH/DSnnhv+4IgD1O/6uc8+Nz8f2a9lzv4ic+qt1/N4jzZOPWvL7434
6ecp+8TM2ddkzj4cc/aNmFMXbk4ds/knR1w1J66u857XIq6aE1fNiavm7Hsx
f/uIq+bUYbf3kxFXzYmr5sTVZn/ET79XjDxD4yMv0Tjx05z4aX7viJ/mXzbi
pznx05z6XfOR50l5ocapw0v7alud23i/WX8P3DRez3vnc8Zzzlx1ksWJU2n/
rDlxZH38pn1e7od1O0eNfzbohj7r9V2bxtHHHH3M0We9zm3b6tzQwRwdzNFh
3c5R4+iQPq/fh1UH3j6vefUxW60327Z6s9ovJl79x8Sr/5g4nyv57/fqed/9
pvm/Xse1bXVc8375vn/TfN4vv2n+Jz/9Ho6fzlPhp8fjj9/P8cccf8z5u+t1
QdtWF5TyWvO+s4Vjx++lKd/FPG71G9Thi6Ovee1/H9z7pJy/wr/1Oo1tq8cg
7plXvf3g3qdjP7mOIa/VODon3VodwtBtfb1+0zi6VVyXbn7/RLf1uoVtq1tA
H7j1sT/VB0AcfczRJ31evw/zec3n/RpLfozPu14/sG31A3wu2+dzmc/7LJ5s
nyv57/fk+XotfL5eXpfftnX5Wf++v8l81r/74/de/Flfv9629Wv+rjl/N9lf
X7fdtnXbWec+PuyPaO8V3J/rz/2eB8OOn3fVv9TrOMP++vP38cbnfRmbZr/V
S0/9cDbt764/Nx9vfO5L056PLX+FP62uePizXn+76fm04aefm/hpjp+2wzwO
z9OWv8L/Vq87/F+va900zt+r9/ThJ5/Lz2U+1/rz+snijkv+u9w/aX3KeR4+
b6ubHZ93vb500zift75/6Lnj94fabyiODuboALcO9gcdzOf+BofzYOjmPM/c
X3Qb+ou6jnHT+NxfdBv6i25Df9G+v94cPc3RE77eR3Qb+ohuQx/Rbegj2nh7
b8F/v28w3s9N9G/rVsMO/E8VN/x8n/1Znnfz+9j/Ws+a3scWPvu/8HnfvZ+/
TzaOP34O4k+rNxv+rNdlbRpnvpnjf8vLDf/Xn+NPhvE9PzZfx6P2uVp917Tf
33VQm8bn98Cj9rnM5/lw1D7X+vhNe6+Y3wP752p1VnP+p30uc+V/2vuYufqk
tc9rrjxP+7zmyvO097r0fmUe9pPWORM672AnO8VD/7rdvB/tTBtvHvrd7eZ9
an28eeiPt5v3tfXx5qGf3m7eB9fHm4f+ezudE9TGm4d+fTudK9TGm8/fU8zb
ueE13pz57Osezhnfze+3C2f++7qHc8l38/uw7be+grt5n2Afbx76EO7mfYV9
/LqfrW/hbt6H2Mebh3OCqg+mP284X2kX6g1qfqT7PXHbCX0Xi9tO6MdY93sa
b64+Eu1+T+PNQ7/Hut/TePPQH7Lu9zTePPSTrPs9jTfn/t2t8nZ+fY03D/Un
db97PPd74rbDfe35QBywHcav22/9MCsOpPHmoX9mxYE0ft3P1m+z4kAaH+47
9+esvsNpvHmoF6o4oPN36n5P3HZC3VHNS9sJ5yXtQt6m4oA5/992wrlLFQfU
j7TiRhpvHvqXVtxI481Dv9OKG2m8eeiPWnEjjTcnDty1yi/5PKkabx7qyipu
eDzxIXHbIQ6YEzdsh/Hr9lt/14obabx56AdbcSONX/ez9Y+tuJHGh/vU/WYr
bqTx5qEOsOKGzpOq+JC47YR6woobthPO/9qFfOwu1CXWvLedcI7YLuR19T1i
4fx/22GceejTW/EkjTcPfX0rnqTx5qEPcMWTNN6c+HDfKr/kc9NqvHmoF614
4vHEjcRtJ9SdVjyxnXpvCdx25rzxwokz6362c98qbqgfcsWZNH7dz9Y/ueJM
Gh/ua/dbrjiTxpuH+t6KMzpPbXkPCdx2Qp1wxRnbCeff7cI6yy7UG1ecsZ1w
jt4urNfsQt1y3W+2U3UsgduO+1f/9N8/+KLLn3/70mdJdsK5fhVPqEf+18//
zGsvvu7NS1+mMN7c/bE/8XX/U9D8xqWPUxhvPn+vufrkJ/9xjj9pvLnrwNGn
+kRpfL23BG47oZ684o/t1PtP4LYT6tIr/qz72c5DLG47oX94xSXbCecqVpxR
v/GKS2l8iAPuT15xKY03D3X7FZd0/mDFn8RtJ9T/V1yynXBe5C6sn+7CPoKK
S7YTzp3chXXYXdiPUHHJdog/iduO9zX824gnXCfb8TmY3F9eF4a7b/wH73nu
V/z12QsVr/gJ93macPeZhxOv0nhz4s+7V/mli2m8ufd3wIlXHk9cStx2vE/k
sXc9+uevfs229pXbDnEJ/vKhv9fZ4WG/ScUrX3fiUuK2E/atVLyynXA+6S6s
+1dcUj//imO2w/gQN9z/v+JYGm8e9uNUHNP5nhWvEredsK+n4pjthPNYd6Eu
Yhf2B1Ucs51wrusu1Ffswj6jimO2Q7xK3Ha8X+nB8T5DHLMdnzPrOIYduPc9
OY5hx3Escdvx+Q6Ob7bjc28dr+5f5ZcupvHm3rfl+ObxxLHEbcf7v/787Bf8
3K988wMV32yHOAZ3fMMOPOwjq/jm+UAcS9x2wn60im+2E84F3oV6nl3Y11bx
zXaIb4nbTqgLqrgX4lLkthP22VU8ZD467v3ffLET9utVPLSdcG7yLtQ77cK+
v4qHthPOX96Fuqld2D9Y8dB25jqrxK3Dsg+R72Vzv8HFjs+DdjzEDtz7GR0P
seO493/zxY73RToe2o7Pp17nix1+X+eXLtrOPH7h3qfpOOnxc91a4osd7/d8
YPC5j+JiZ65/u3TRcRI78LBvdDf3XVzmyVxHl3ib543PfRoXO+Fc712o09uF
fay7ua/jYmeu60u8xZnG5z6QLV4d4IudsK+24qTO0a54mLjthPN9Kk7aTjj3
fNlnNZ8HVPEwjTcnXun8oIp7aby5zxtyPi2Nh/v7Kd/nHMcY73hl7vOMHK/S
eHPmxztX+aWLabz5XJ/5+LHjUhpvXnWo47oTN4g/aTyc8cQHnbtUccbXi/Hm
4ZymiidpvDn3u851qriRxof7zudAVXxI483DfvmKAzrnve73xG0n7LuvOGA7
xIHEbSecY1XxwXYYb879rnOvKj6k8ebhnKx6/0nj4Y4P5GPIwxAfGO/4YO5z
uPi+Q3xI482533kveEDxIY03d1+Flyvf7vHEh8RtZ643frLFDdthHNxxQ+eI
VdzwdWS8eTh3rOJGGm9OHNA5ZRU30vhwn/pcs4obabx56INRcQOdHB8St53Q
T6Pihu0QHxK3ndCXo+KG7RA3El/XoZ3vVvHEdhhvHs6Dq3iSxpuH8+MqT53G
m4fz5ioflMabEx92q/zSxTTePPRLqfcbjyduJG47oe9KxUfbIZ4kbjvzPt+N
PtfV59b93DQezt2rOJPGr/vZzumrOJPGh/va5/pVnEnjzUN/m4ozfD7Hk8Rt
J/TJqThjO8STxG0n9NupOGM7xJPEbSf07ak4YzvEmcRtJ/T/qfhjO7XPInDb
CectVlyyHcabh/MZKy6l8ebEmftW+aWLabx56INUccnjiT+J207op1RxyXaI
P4nbTujLVHFp3c9N5LYTzq+s62E7tY9j1f923mXFqzQ+xAefj1nxKo03D32r
Kl7hl+NS4rYT+l9VvLId4lLithP6aFW8sp063zZw2wn9uCpe2Q5xKXHbCX29
Kl7ZTtVnBm474dzSile2M+d5Fh7OOa14lcabE3/uWuWXLqbx5qG/WcUrjycu
JW47oU9axSvbIS4lbjuh31rFq3U/N5HbTujbVvHKdohXidvO3Odk4fz/dR2O
GicueV4Rx9J483AOgveBtnil82G9z3SZb+v97so+/jpeJW47oW9exTHbIV4l
bjuh/17FMduZ88+d207o41dxzHaIV4nbTugHWHHMdohjidtOOF+44pvtMN58
/p5ofuliGm8e+hlWfPN44ljithP6IlZ8sx3iWOK2E/orVnxb93MTue2EPo0V
32yHOJa47YR+jxXf1nU4itx2Ql/u2le7ft/18aGveL2/mYfzTRyXTqRz46GP
5S6ch+K4UTyck+I4UDycn+L7ung4V8X3e3Hu03Xe+mfuwvksvu+Kh3NbfB8V
D+e5+L5YdFg/58XzvHg4/8Xzdvm8Y/6Zh3OuS1/mHTycI1PzyjycL1Pzyjyc
O1PzyjycR1PzyjycU1Pzypx5tc5b31G/ly734/o5ODV/zMP5ODV/zMO5OTV/
zMN5OjV/zMM5OxXf0n5Aj2deEZ8cx5hf899t/VSX/Sni4XyfZb+JeDj3Z9lX
Ih7OA1r2j4gzf9Z56+Na8+dW6RDOG1r2WYiHc4iWfRPi4XyiZX+EeDi3qOZD
2rfl8cwHnj+eD8QPxxnmxfy+3c5LUn8V7w9t5yipj8rCw/lK6peyadd9nbf+
t3Xd79DnJT74847/7z636k/S9rE2Hvrr7sI5UOo3svBwPlTNh7RfxuOZD7xf
eD68aDwfPB84b8fxgXkx+/lY26fm/sBwn2P1xsHdNxjOdbcdrrs5151zkJ5y
3379nevuz8X1vVufK5yrVde37ftbP2+rrq95OIerrm/aR+DxXF/eB319f3U8
z319idO+vtzHvt+5zujs88Jch2DOdVzn28bn/gMPt7pu/Pe6/0flf/UBGP77
uqR9IubhvLO6XqnO2eO5Xg+O93Ffr4vjfcrX6+PjOenr9Z4RR3293jruM9+P
Hx3XzdfF9fZcF3OuC+eG+brwPPd1eUB+cl3uGX5a/48NP9f1bPtlzvE5rLP6
S0cezqer62Iezq2r62UezrOr62juc+7+dtT/uB8419fn37m+yNzn4vn+NUdf
5gXc5+h5npj7fL0//tr9vhvmD5z5E87dq7htHs7jq/lmHs7pq3nYrvv6+X01
D1P9XpqHnxn66e/GulzzcD6g6lsWHs4NVN3Lwn2eIM9T91efn+/LOYOeh+Y+
f9Dz0Jx5uM63jfscw/eP/apzXcfjNd/C+Yaq91h4OPdw6VslHs5DrPlmHs5J
rPmW6r48nvlG3sXziu/T/p64Xl/aeTifUetxC/e5jd+g55S5z3N8ud4bzZkn
63zbOHoxX5gn4bxIrTctPJwjqfWjhYfzJbWutPBw7mTNh1Sf4/HMB/Jqng/k
SxxP0MPfE10HFfr578I5mLs5Piw8nI+5m+PDwuf4YN7OBaj48og+b61j6vOG
czl1vy88nNep+33h4RzPur6pnsHjq7/BeB76+pLf8vVl/vp+53P7+vI9qeb/
+nmjdX3NwzmkdX3Nub7rvJ2zUNf3U/q8XF9/XnR8vj5vOBe1rqN5OC+1rmNa
z/V4riPvKeZpXZXnTHsvHfHG15d56uvL91p4OO91N8fho3a91nk7t6Kul/2v
90P5z/W6Tv6j47vlP3pZt3BebV0Xj5/j6jKe/rA8t3Xd6Yfs+71xrqPtqA9z
G2/Odee5AVcf5jbeXP2cFc+vjuPNmVfkP+Dqw9zGmxNPuG5w9WFu483nvOKZ
Np/TeK8/al2szWdfR/VVbuPNmf++juqr3Mav26/+zMXVV7mNN+f+eqWuo/oq
t/Hrfh6de56uI/dbGm+udbd2n5rrPq186R1Tf8XO3c+ZcaEvdBuPH+4frs8b
8roLv3ZeN2/54dSHNo03D+dr78J53Oon2eNeWN9vzy/12W7vRbavPtvtuod6
J/RP/rf8+bW6XvgX5knqH9700Xxr7wnhOdI+r+y3eRh47Gee7KTnmv2XPs1/
c55rnoc8p1rdxXjumPMcMee5YK5zIhr3fUR+x+OJ5+bEZ3PirTnxM9QPnHtk
/f5t6/74bY7O5ujc6hCGzubobI7O5uj5qOof4F7v/uD+PTP2OTdHf3P0N0d/
c/RvdQ4jTqW+/anPduqP3fp1D/1bn+2hv3n1bxSvfoxejx46X6s6AbjXl980
ztdO/aJTn2fz6mcoXn0IxauvoHj1CVxfH4/9is3n9+feH9h8fr/dNP3N5/fP
TdP5Jq3L1/l3Ws/d6/lQ7K9rPr9P9n625vP73qbpbz6/n/S+06mPa+q/mvqm
mqOLOfp7/Rf9zdGZdRXWU+Duj7fX7c9if1Fz9DdHf/uP/q2v7NDfHP1TP97U
rzL1mUz9Ic3R3xy9vG6L/ubozDqVuft33bNfF4j9Es3R3xz9U19Bc/Q3R//U
dzT12Uv98VJfO3P0N0f/1P/NHJ1Z9zPney387v242M/NHP3N0T/1PUv9ylKf
sdQvke/f1t987seV+mgtfO5/tfC5b1XqN7VwdPZ6KL+nPi0eP/eJWuzP/Z0W
PvdlSv2UUh+k1L+o92fzehP6m6O/Ofq3dcyhvzn6e70P/c3rPX+st5q7v8Ru
vH+mfjjm/H9z9Lf/6G+O/ubon/o+pT4tqb9K6/cy9G99Wob+5ujvdTT0N0dn
1v8vjXV/uNetfmm8f2LnG/X8TX1CzLFr/9HfHP3N0T/120n9LlKfitRfYn29
7OrG5/m/8Hn+LxydX631PrjXld4x3j9Tf4bUVyH1QzCf57/7Njy98Xn+974l
qQ9A2r+f9t2n/fLm6G+O/uZ1zq/W4+BeD3r/eP9M+9DT/vG07zvt1zbHD3P0
T/0c0r7mtB857SNO+3/Tvl3zOf4cNZ29jgZ3HvLt4/0z7atN+2HTPta0/zTt
GzWf40/XM+1nTPsQ0/7BtO/PvPIJyqPq3Mk23vze8Z6Z9velfXlpP13aB5f2
r6XP5fwnPO3XSPmuVM+f8jOp3jvlE/x9k/HtvJUx3t+PGO/vNT6X3OPT9x3X
uTE/zZmfrX5yzE9z5qffh5mfqV4xvT+n9/D0Xu3xzDf7yXwzZ76Zc1+nekJz
nw/u6+L3Q58Dfqx50uqRJvu9/iS9V6Q6h/QcDH020vr7ycPhPk3rSqne8iXi
3Lfkm2sejvuT99DZ/ubkt8f7EZz77eJ4brvu+jfG88T1jXzPdt3sh4c/rq++
c/jj+up3yB905z0Cjr5vG/5In2HnQnHuh7SO4++D4VzpY/UfOMQPnk9tO+F8
6sQPnlttO+Hc6sSTnXQ+9bHqKA7xg+dc20445zrxg+df2044/zrxg+di247q
NA7xg+dl2044Lzvxg+do2044Rzvxg+dr2044Xzvxg+du2044dzvxg+dx2044
jzvxeE636hmIV/W803t+4rHPgOoZTmTH51MnHvsShDoux7FD/GA9mO2EerDE
D9aJ2U6oE0v8YP2Y7YT6scQP1pXZTqgrSzzWm4W6MsexQzzWp4X6MceZQ/xg
HZrthDq0xA/Wp9lOqE9L/GDdmu2EurXED9az2U6oZ0s81rkRN1S3U3FG9WaJ
x7q1UG9mPw/xWLfG5wlx0nUviR+qc2txJvS/SvxgPVt4jjivknisfwt1a8eB
p7q148BT3dpxqFtLPNa/hTq341Dnlnisl+N31aHVPFFdXOKxvi7U0dV1/H/y
Q/V4rrsrP4P9eB+lutOgT9M/8FjvF+r67OchHusDQ/2t50nTIcQ9c9flNh1C
fX77XKkeFTvKBx4HXuNV/1bjlSdMPNkprvouXffNIZ7sLPVvc/1S2VEeMvFk
p7j6IZQd5S0TT3aKa/9+2VGeM/FkR/UJtT/9eObbQzzZKa59x2VH+cDEk53i
2mdadpQ/TDzZKa71X/m5OcSTneJa3yw7yk8mnuwU1/qddDg6xJOdtG7ivMQh
HtdfwnrHcVoH4f+HeOV1kMSTneIhXnndJPFkp3iIV15nSTzZKR7ilddlEk92
iod45XWcxJOd4iFeed0n8WSneIhXXu9IPNkpHuKV10cST3aKh3jl9ZTEk53i
IV55/SXxZKd4iFder0k82dnNn7fFvba+Q3wJ172t44T1iOPANQ/bc7atX/wX
zZiKKw==
             "], {{{
                EdgeForm[], 
                GrayLevel[1], 
                Thickness[0.007], 
                Opacity[0.4], 
                GraphicsGroup[{
                  Polygon[CompressedData["
1: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
1YK/B7er9sXvL+UjsK9Ez03V0uaCOerLaB2O/MnCaI3NJnB5dD29dcGanr80
3kDP6Hy9cvgb4BvBw6onRmtglP/PpbGUB5dF1+hbFFy7eg+8W7DW53fwG7g0
WlfQEEyK1gZ01LtGaz809qRTCdrEpnH9TXrH74quTau+IX3D0/yeD0bTNib6
mqdG6xAWgXHRugvNI+ktWqZ3lA6jaXrOyrL1S7rOyGjfsQaMiNZmrAKbo/2g
NABnRGtOfsxbk6Qav8bMrtixHPuW9tOidRHLwAnR+o2XwHfR+plTitas7Mz9
m4AfojUGY8CmaL3NvUVrbjaoXlmybuC46PueEq2v+CRv7dStnDsd1CpZY6Ca
0rBoncZr4B/4FvlNUDdaM6D8/ODoOo36NytZz6Ca2xHRdeTr8/adV6S6Z780
l1XL+ytap6H7HhVdO74XDIrWYj2Yt0btvDTmj47Wa83NW2d2qWqeRWvRRqV3
l85mRpoL0qWdqj4pWsfWK/lY6S36Rn9PadqOp+3EojVzQ7DHFa1dOyl9Z2nm
pqV1Qb6wb1oLDk1jW3Wo7tE18bPy1tt153hPzVn4Vo7NhveIrqefB1ZE6+ik
l5DmZi1YU7KGZh34qmT/u0u0P16gOjP24KI1ba3U/0WvN1p36qX1oEX0+iCd
XM20Pkpvtye2fdFzvW7y59LJ7Y7do+g5qHWkmNbPDunZNKbuS+N2bbQ+UO/1
dbSm7hiwT3RdTXUc6YqeS2tf52htgNYvaUEOjB4P0hLdncantDAvFe3z10Tr
ErWO/x2tA7wLfBOtXVS/fBut91N/SXv0iPq26Hrz52C15nm0Zkn93jJ9wxrp
+6wGzdPvmtHHpTX8Hnyn4/z+XP1UtO7qbq53lJJkZWsOH07fXPVGrfnSGH0D
vi65DxQf6HgoW9/437OVHIPo3tK9zUjvlUs+r3F6nlrpmbQGrij5m0g3ubXg
WGhJtLZzl6L1mptTDFM7WoMkX7csWnupPl0ardvUOFlQdK1NfrZ6dFy0I1ge
reFsn9agyrTuaA1Yp9gH/Byt9dI3kT7jI/kMUINjPUHvgnUhZ6exLT1ZN9oO
LVgXckOa79J/XFO05kGx06qia9PShw3Qdy447qiVvofG1Plpfine0Tdclfqv
RerPadF6uWMK1niNwo4pWCt2JvacgrV009KaKF3gWMU+inPK1nOOA9uU7Xu1
DmhMTkr+Slqv14rWYsl/z0pz4ZZobd4pYHvpF+XvojV8U2i7rmBt3/XYqaC9
/HnR9XdpTRoVrZuSP2mQ5mOVsjUwjUrWjvyib1+wprNdwfGS9GrHY08sWMfZ
tuDY5qRoTcvfeevbhtB2HDi85GfrW/DzXQ8mw2uWrSNVPD8qrVmKdXcsWzuq
OG1P2j8tWg+wn75/0dqDdlofi9YP3BitXewP9oIvLlpLoL5dnvpXmr9BqY/2
Tf2qPj0A/mXRuov94WuK1mzULltbq33H8Ggt0Fbap0ZrJjVOdi3br2pduhYc
lsbhzdF6S32fhmXrYxU/1Cpbm6q9gzRPLYrWs0mveWvB+5Q6Zef+FQP3Lfma
ip22K1tb213+Jlono5hQuqhZaT2SxvRc2i4oWPc5AXsxuLRkvY3m0bwUiygO
kT7yYOwhBWsW90sxjNbK/ml9kT7ylxSfS+PYieOdC9Z6boetVrAWanzReiHp
uo4sWi8kDWWR4+WC5/7rRe81pMdqWrTGT9rKSo4XCtZfVsFuCx6K1mgpvtV6
07VoPeHT0ZooxbQ3RetdNcYalK0T1l5yp7L1z9pjap1fkOL2emVrmLUXkMZ6
cYptpBX7NMVa0tpewvHLdA7nX8I9LpJPLVtvrL2P1tG5RWssFXesTrGWNNzL
U6ylfrs89Z3W54dSfPJUtL5Lc0rauM5F6+WejNZNbaD94WhNlNYRaeY6Fa2B
lNbtvhSTSBv3coqL5kRrzBS3K7Y+u2gd19xoHZr2EVpDxxYdn9warQEeCWqU
rZ3W3vn2aJ2z/JL8dK+0nk6I9rOam6dH6+XqFPxdLo6ed+dHa27Vd7uUHecr
1r4yWu8tH3VutD5Wfb07/P2itTqa92vTNzwvWk+rMXNBtDZYY+yaaC20/Pmd
0bpr9ZH07t+Ar8Ed0Rpsjfnp0Tpt+d4Z0VprzQvFtd8rhgX3RWu/5Rs/5lk+
LFprtEf0vlcxw+Ro/bbGvObl3Wlu7gTqg3q6R7QeOCtYy65ilXzFkdE6Sa1T
V0VrgNsXHN9o76q197doLbRiyN+T35fPl7ZvY8HjQfHSD2nOtig7BlOMMDFa
z6zYezf4u0XrnaSb/1fxsmKAkvX/0mV1Klljf3jB/5dgU96+uiN/u65oTdqF
qa/lx2RrpX6PZWsgq4ADS54X+gbfKg4rWts2JVpzLn/SO/r/EUhDdVu0pl1r
Ys2SNZD6/lnZ/7dCeYkvivbt0kO9iX2jaA1Oa/72raK1W/dEa/K1drxD29tF
62hOjtZh6n2XFb3GSYf1TXo26cJ2jT5fmrQVaV3okuZpn/S+1cv+fwraYy4p
eh2RXuyrotcI6drWF/2tpC9bWPSzSTf0v6LXKWl/1ha9jkh31ir6XaTvalZ2
fkm5otYl/38NjZ+P0tiThuje6P+DoLW7Sdl7Ye2Dj43Wl2qcf1D03JGe6Jho
H6S5o/87UbfguSk96zo9O5gZPXa1F69W9v8r0b57SLS2XOcsKno9lcZN6/QR
BY+T94oeV9Ix/R8rMPDl
                   "]], 
                  Polygon[CompressedData["
1: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
JtQ2a6ONDf7x+a3E6MbmY6vxdtNvd0cn9uSNbvrV7uykP25zn69949g71Es6
ic++LvXBFzl+fI67nseW87NwT80F5gbzgDe76fe7q5P+vJe0j2xv6KR/z37N
F7RnvK9ZSmxljGWsasxq7GgMaSy9VSu23Rr7t8XGa6u12daSJ6pjm7XR47E/
fp1aszXnFc0RwbhFo1GbWa5Ord6aq7VWa/bWbq3hWsudvU5sZYxlrXaWOr5P
H6i2NEOd3MMcRF96qNcg55jBmI3H/gE/dtPf+kon/XuzdXJOz+VrGCvbM2Ys
bcy8b/m9h7USY/v7G/MY6+zfSiy/WPk+/H4u6yUGN/a+vJdeY3uOL+O1Lm+n
t+xKHr+mlx4zY2Fj4ld47VfN01vJaVYp9slY3pxg6xLT61uHlvvxxOKL1ynX
oz752lZiQGO/64vv1gc+Uny4saI56nXl+jVXsSd5ULk+5+jkO/e7nrOTWMGc
e0SJGYzNjdGtRbxRRxtVIzVXeLuONqpGau35PbCzvqGX2PtxsCN8YC+x7iPq
L/Bxeon1rwWbwMftRWu9AWwAH7uXXOEq4//iE/WFTbAZ6+P1osXeDNYzz+3F
Vl5ex5Yac3tvaFO9V8xpvqpzz+hrzRH0zfrc3bT7vcTqT9XJXf4qsb45jLmI
OYna0ovqJa1orMOLfVQLVhO2Nv5hnVzBmru1dnOGu+poPGo7n9eJDcwBtPXG
CMYC5gz6fmMCYzE1AGMtYzJnE8YsvYnOKBzMOQ8DR4JDwG/d9IO/z3k+6KQX
e0GOW2hAerJn6eSe8V7xHlq2Hfu/fDv2Ykgn96z3qvfw7930h3+k7+ikVrEw
51pkQGoW7pvjmdv52F/d9C9/7XWvD+qm3/wL9r8Ef3TTn/4p+59pt7qJp57v
pN/5q276h5/rpD99et8r+ILP/mUrucqiJTcwZ/mim/jrmU7613/qpl/91U76
d7/spr/42U764X/ppn/99U764X/upn/9tU76q3+AT6s966Yf2NzHHMncyBzo
LHAuuACcDY4o5/Rc9tg7m+KMyhts3+qk1/I4jjuxl57L/dkeBA4FB/hZBqQn
017MxcB1PLYH2Nt7wNiine/U7/J7fSmPHQWO9bXBPmAYOBDs6/VpTgP2A3uB
47UZ4FRwQi+5ljmdudzKJRbeoMS+xsTDwZngHHB6L7mYOZO5kjmZsbI5oLmf
MbO5njmcuZs5n7mdOaC5nzneyeA0cAY4pRdtwxjc2FuNQ182fi+1E32aWtB8
xb4e1Io9nKfYY+3vl15L4Fj2j2sl1jHm8bezZ9tYx5jH394ebWOlqvwe/j7G
SsZM/l721KsNqhGqHe6kHe1F01HLuRo0eex+jnugnd/zoXb8+chZgG60OjU7
aw1z1Zl9cgbKXsCF6sQXK/O8VYq/U4s9tvi7pepo2Wra1kqmrKNlH1b8m/eo
2umhxb9NU0f7VQO2VjJfHe1WDVetcrE62uLAUgtRY7yol55ze80v7iU2NUbV
99nz7rX+Q4nt32M7ChgdLN1KDH1TLzmkuePNvdxb3mPGis6EGNu/UGL9+0vs
P6LYt+uL7dCGeO85YzJaeQ3PPVc3Wrf28G6OP7/YBm2E974zLNoObYi2wZkV
fbk+3Xvzu27uP+83Z8GOaqe/aoxu4nfjeO+fH/Sxxf86+zS8xKPGm4eX+/fI
dmZatJXzllxEm2n8Zr6g1jJxsW1/FX/ujIa2Vpur7XEGx1mqwUXbdabK2TBn
xJbuJP5dvsSbK5Z4Zxg4pxttfj/wP3B2N1r83mAPcFY3s3S7+3sPyMyWs1pL
gGN57KJutPpjvHbAlrzWESWePQdc1s2s19ngDHBpN7NTp4ODwLkl/j0QXAAW
6GWW7Xz2dwFndlNr2LlOLWTx8trWRKy16A/1t+Yo1t6swakdN+v0xtojq/Y9
oI7/0/+qJd5T/PldJZ4w/nmp+PdXin+daUBqMNZeZgbP8dgdxf8+Wyc3NUc1
t3xO36fP7GY275Q68eWwEo/q03bwO+hGW9++Ti3owm5qK9aErH1YA1HbX73O
rJ8zf9Yu1q8zi+dMnrWntcF5nrucw3NZi7AmYa1io25m1ZxZM7/ZuE7twBqC
tdJBdWqn1lCtZXzbSu3UGqra/o+t1E6Nb82vfm2lNmGNwnxh9Dq1TeNn42vz
hxP9HbqZFTyhTu3BGoS1iDdLvmE8rlbyYSvavzUAayWvtlJrsuZkreSAbmoH
5icfsH23Fa3d+HRYiX/HZH9s471O7rkHe5kBc/brIX1cJzGRsZB6yLBOYkRj
Q2OknTqJEY0Njbl26CRGNDY0ZtzO/MHz1okZD2L/YHB7nfxn3U5iPmM9Y8T1
O4kZjRWNKTfuJKY0ljRG9Lmew/fyifdbJzGtsawx7IwDcs15rc0yIL359uhv
WvKh8fRX4E74XeA64z2wuHkt2KOTGNFr12t4305iZGNjY+K9Oon5vda95nfp
JOY01tyV7YadxMTGwsbAm3YS4xrb6iO3YX9b4/I6+rHasBqb2poasdqXGpha
2eetaMHrld/P31utbf3y+39S8oV1y/Xh76sWqSZp/nBTK9qu+c51JZ9QS9us
XJ9ej2qZappqbXe0ogWqCarl3dpKfGy+MqLkH9aWrDFZy3rRHFK72Ikt0Cao
namhqf2M3c697j1/PI/9W6fWNW6ZzbXmZS+FPRVqoU+00utgPG6+82grvRD2
RKgVPtdKbd4avdro061oXWpexr7OyKltO6PobKIat7GxGslKJUZWu1PDq0v+
8WWdHl3zC/MJtTY1N/ML4/uK12t0cq3c3YpWp2Zn/vKf9pb9CXq5lu+so93N
WK49NTy1PjU/P/tfYJJ2eijU2tTcfK7nOLzY/VY7PcFqTWpO5vLPg41ayelX
6SQe0T9Y/7a2ao1VLXjlbmJtY+5JWBsIFmZ/oRK/rFondzaHVht0RvTgEkOr
JTkDOnHRFAaynagdLUJNQu1xPDCinXjK2bDB3WgTsxatUo1CrU/NT+1jfWMt
XnsE2IP9PdvRLtQw1E6dWVSrUrNyNsmZuR878fffgfl70TPUL6wNOYeq1qnm
OXK2rh0tTE1saDszjM7SOFOjdr2wfqHE6Mbmx/SixajJqLU6Q/gyr/NSiS+u
asc2aCPMVb5qJTcxR1G7USM2FzEnUXtx5lGtR81HLdcZS3MfcyC1WGcozY3M
kdTi1Jx3bEdPcHZ5Z7BqOzNyzsat1o6WOmfRetRUtZ2T9GIrtKHGs8bDaofO
6k3Xz3XQl54le5esNT5YbLc1R2ufap5qndZArSVYE7UWak3hxl5iRGPDW3qZ
OfAyf6eRWQRnIHjZvncbmY04r5eZQGcBz++ldmpN01qmNVR76O3tHrNKb709
kPb2D63SG2luYg52dslR7KF09mT1Kr2V9lg6e7JGld5LeyqdHVizSq+ltVtr
rtZareE6k8HX1vdeI7Ma9sTYG7NqlV5Qe0KdNVitSq+oud955b2bAzoDwcN9
bzcyG+GMhWWitxqZvbBfZNK+zHjYa3JvJ/N0/nb+ho92Mt9o7Dry/ww66Y/y
t/Q3tWfS3skxqswW2HNtCPxRI73YN3fSH7VmO/OSj3cyP3msdsacsR3NVa1V
zfT+TubvdmvnnrKWrIatdm1N+e1WfL6+QJ9grcyZZmeZrZl5b3mPXdHONW8u
6j3ivWFOemOpNb7ZyKyM96738GLt+Eh9pT5zzHZsvLnh8JJrmiOeVHJGc0Vz
VnNnc1hzV3PoyzuZd/Be9563J39ZXm9wlV79JTrRlI3tjfGdAVqO9cmrzAbZ
g7kMfFCVWSZ77J0tGKtK7/2VncxDLNTOfOJSnWjYxu5LF1uoTZy4jo20h99e
+bGr9N/0OvE5+poBnfSI2z8zbZVZp2/b0bTVstXA7fm3X2eiKv009kjauzl7
ld7JqzuZ31i0fH/2bNobPk6VXs4FOtFUzS210fYSXFRyPXsKrE2oSapFWqOw
x9Bew02r9OLbo2/v9w5VevftcbcXeYsqve/27NvbvF2VXn57Bu0d3LZKb7pa
5lUlV1bTfLidGovapRqmtRI1DbUMaybmfuaAau+jsv26nRqD2pkamj359u5v
X6VXv9OJz9ZX68Ptmbd3erMqvfT2+B8G36BK73/dSUxgLKCPt6f9cHtTqvS6
28N9CHy9Kr3d9vjbm715ld5/ezTt1Vy3Sq+4Pd2HWouv0us9MpfXh5bv+9ZO
+hHX4TPc1slMynQcX1WZVXHmw9mIHxuZBdFX6DN2L/efPbD2wv7QyKzGC51o
xpeX++vpdmpe1rqscTkTYC/rFFVmBax5W/vetSrzslVmbX5qZNbj+RID+N8L
c7Yy8+Is2jeNzMK82YlmpbahxmHP9iKGKaWX25mOAfZKNTLr4QzPKPbiNDLb
40yes25fNzKr5wyCvb5TVplNcKbE2bZfGpk1cSbFWZKfG5lVsZ/E/0Jpl74S
e9idpZi0Sm/7s+3U+KztGcPYM24vcF2ll9yeoCXho1bpFbInZDP49FV6Rcbq
JOY11jUmfrOdGo+1HWtA9iwPsl+vkV7mJ9upCVoLtMZoD/TmrM9QeqMfb6em
aC3RmqEzFvYeT11l9sIeanunB5beantK7FWZpEqviTMe9h5PVWX2Q2exMZsh
VWZFnCHZAj5jldkS7ZW915NV6SW353kr+MxVeqHtyd4SPlOVXm17/u3tblWZ
BfisnRqZtTE1M/3J0qyPXqU3/8V2ajzWLqxhTN+f3mV7jO01VltWc1RrVGNe
oI7GpbalBjVBifmM9YzxXm6nRmRtyBrhPHU0K7UqNTJn3JzF6lXpT3SGwFmC
bpVZMGfCnK0aUGVWzJkvZ5maVWbBnOGaEv5XI7NdzmBNBf+7kdksZ66mgP/Z
yCyWM0zONvVXmW1yRmEp+GhVZhfUTtVk1WLVUNVO1VTVUtVQ7XEyXPqwkdlL
Z3qcrRm/yqyPMwuTw/9oZHbt9XZqkNYerSE6c+Nsz3hVZnE+aqdGZW3KmqI9
7c7ujFul1/2DdjRQtU9rWM5cjcr6p43MYql9qoFuWO6HT9qpUVqbtAbqjMa0
HN+oMgunlqwmrBaspvxeOzm8ubsaq71An3P8F+D6Kr1CH7L/JbjBa7Cdmq+1
Xmuq9nTZ63VRlV4vtWxrENYe1LSdEXb29KtGZoedIXZW9MtGZoudeXD24YtG
ZlvH6CRHNTc1J3WmZTHWJ6zSb7pIHY1TbVNNddc6mphamJqUtteecGMfbfCk
RWNRW1HTXbednMJcYj2wZtFw1G7UeBbqT2+0Pc32Ni/Vn15re7DtxTa2eqXE
18ZYzixdwvp+VWaZ/O8E/4OiV/5DwRkEZ0PnrDKb4IyBs59zVJk9cCbCXvMF
qsxKOKNgL/rcVWYXjN0+LXqmMZz/bXFjia39jwtnEuz1nqvKrIJ9qfbnO4Pp
LKa9GQ+X/NAejaF1NC21LDWdmTjm9L70WNtrvUR/etPtabe3fdM6Gqnxk5qV
M5/Ods5XZRZ0nHZyOnM5Nd9t62hqamnb+Vv1p3fHnnd73+01cabWXhF7Ttat
o6mppamhLdmfXnp73O11d6bFWYb5q8y6LNKf3nF7yu0tt6fK3qqDq8yeLdyf
XnR7zO0137CO5qbWpma3aH960e0xt9fcGTRnCQ+pMpvmTIy97gtWmZVxxtBZ
v92rzB46g2Pv+8JVZnN+bkWTU/tQA7G3466iB5hvqweaj5vLq2fb63F3ycft
+bDXwxldez/s+TAWf6fkc8bk9qBdxOvtU2XWrFtHQ1U7tT93zDqan1qfGqAz
BA9y/FlVZt+eLxqL2soLrWhFE/eiragZjVpHQ1Q7VJNVe1G/VH8fqce2ogmq
BarRfN+KJqkWqUb5eiuaolqimmGjjuar1luBVp15Dv+rRw3YXOftkr+a85jr
mK+qt5vzOEPk7MBCVWaLnGFyFmGRKrNNf9TRQNQ+/qyT/5oPWw+4uOS/Hxf9
Qf3eGVJnN3erMlv6adFk1GKsSThz4OzByVVmG5fvz+yGMzfO3jgz4ezE0VVm
E50xvBi+b5XZQ2cQnV08psps4p51NHu1ejX6fepo+mr5avhb1qkBbF3ykf3r
aO5q7Wr+X7eiAav9qhk7o+Ss12xVZpd2rKPBq72rWT/aTk+SvUj2NE3WH3vj
DIizIJP35351JsjZoIH9ySecQXcWfXB/7I0zP87+nFRHM1crVzM213Bm3NzH
nGNQf+yNMzPOzkzaH3vmDLyz8ObLxgurVJktmRhs25eZNWfX1KteKvqZ+oq5
7ctFbzHHtRfMmXd70ewJm6I/978zOc7mnFunJmEtwhqG+taTRf9Rv5mkP9+X
M2/Ovl1YpyZhLeIicGadGoi1D2se5o5PFf3HHNJc7+miH5nzTdpJj469OfYw
TdJJj5O9TfbsTNSJBur9rybf34nmqNaoBnlwnRqMtRdrKjP3Z5bFnlV7Vwd1
0iOlKDKY7Yz9mRV1xstZrx/b6XGyt8keIv/Twv+ymLXKf13M0p/eV3ta7W21
N2zGXj6rn/moOjUha0HWNKbtpCfHXhzzVf+TyP8mMseZwXmgdnqW7FX6he1x
dWoI1g6sKRlvOms3S5X/3jitTg3J2pE1lnE60ZzVmtW8/mlHA1b7VROesj/+
zpkiZ4umrlPTtJZpzfM/jlVDVjtWIx3SH3vrTJKzSWqnaqjHlPh1qv7Ya2eO
nD2y9/Chojeqhzpz5/e9URU9a5r+zPI78+T1OXV/7I0zTc42NdrRdNVy1WSf
r1ODUr+3xqS++2DRL41x7U30PxDs1bNH0Z51f7+1q/Sy/9WOhq52rgY+UX9m
OZ3R1J454+js62+NzD7OUaeGbO14TvB0Hb3b2tYzYJk6NUNrhdaM/2hHk1eL
V6Nfok5N2VqyNWBnJp39/bWRWcq+8h9PdfnPh8nr1JytNVuDmq5OzdlaszVm
Zyactfi3kVkKZ4Kd7f2vkVlhe9yHwL9rpPf9n7pvpICmlq1GbT47DQ9938is
5/8BwbzXVw==
                   "]], 
                  Polygon[CompressedData["
1:eJwt2Xm8V9P3x/Hbvbfb594kIfPQHA2E4ttcGhCV0kAjDYY0aUSSJM0JpQzJ
VJlDGgwZm1CZKiRClIoiRQP1e67f7o/3Y+31Omvtfc75nLP32udTulu/1n2z
s7KyHiiUlVWY3ZWTlbVV+0Q6k/+egy9huWx5rCq2Ufu83KyswexD2HT6j/+H
uJ3a+VRAb2FX0FPiPuQvpZMMsiCTlVWhAGcrFtEvVZJ7NpUR30z8fex8x9fn
i3W8HJWhd8U0cvxXx8/ULkWvilsnrqzjpelMKsE/hiobZ5Xjx2tXEVuZysq9
XB9T2D38/5zXGXG99C72nfyNdKGcfCqgF8RlyykrprJ7sEH7Bf2+RMeKPYaO
puf4q8UX1y5GRWkutgo7SruAMnSxcR7Ux+v6W0BHuy8vGiMHK8evYoxvtTfI
reQaPmInyhtPJ/C78y9g78zLynpM38/J/Vfe6VRB7jq5zYwxi/0U+wobLeYy
7HFsDbYeuwe7FJuJrcbWYaOwW/RfSv916Alj1GKbipshbqW4T8XdKW6ouOeN
/6KY5+lZaizuIXHLxa0Wd0dOeg6exr7EvqA3+JfQY9gq/lpxd4u7HHsC+wz7
GrsXa4JNx1Zga7Dh8Qxg07Bl2CpsGHYBdiv2LDYP64KNdn6vO7+lzusDeo/O
Fne1uLHixtCj/LPoSuwu/li5/5PbT+6ZrnuO/Mfk1dSuHuNQRfEtxU9lz+ef
RxW0W2APstdm0u8Uv81wuedrTxGzQf8H9a+ZNV9sNY1zqbyc5vwH2HFyF8r7
WN5KWk5TsLewb7W/oa/oHHlVqVy8Z3LvZ0eJmy/ufcffpSU0BluArdBeRh/S
BKyMcxrAfsL/iO7X17fxLjs3XWW9HueDbcQOZ6X5YQE2WM5z8czJmUuzqb6E
yY69I3a5uMHyGmD3Ye9iK7AhWG1sDLYIewfrg9XERmen9yDeh/n8WnQvtpC/
RFxvcR2Me5xzftjYtxjzXO2G4qaIe0/cSnFDxdXFJmJvx5yDDcKqyy0mvjSb
JfeQi6knbpK4JeKWwQPFTXV8if5/FLOJvqOr4x2XOwPvE/c93gu5Y+UujjlD
bl+5lbCuMXfFnIhdgg2T+6K81+S9Qi9TdXHDY16Nd19cT3HNsWewtdi32Dis
BTYbW4dtxMZjV2Jzsa+w77GJWCvsWexrbBM2CWuJzcHWY99hE7Aa2J3Yy9hC
rEdOmoemZqe5OeboRfyL6C7sFf5icTeIuxAbgc2LGOx67DbX9oJrm+eaXqIX
aHjMidgC7fn0Kv1P7ki5r8Z7L/dGuSPEjaTFji+k1+MdETdU3FxxL4vrHO8G
1g+bhc3F2mLnYLFoPY7Nwdphc2g//xQqi30ROdhv/Fw6AVuGzcB+5heno7C3
sUewLfzjYh7G3sGmY5v5xago9hb2MPYLv0RwbAk2G9sb/ccagq3GnsH28I+P
+RhbFesk9lP0FWsj9ib2BPY7Py/WW2w59iT2Z5xHXAv2EfYUtpt/DJ2KfYw9
jf3FP5ZOwz6JtQQ7jq2O1cF2aDd2j+/1e5zv/laLZ5dmitsuJivOkfkwfhvs
mFjXsZrYr9qvYSXY87Fa2LaYD/T3tv6+189G2hBzvriDcR5UXtzauF5xM+hn
x3+iH+hxcTvEZFNJcUvjGcOKslWwGtjP8YxhBWxlrDq2WfsxbBv/EP84+iCe
YyyfrYRfgP2k3dSYxd3gGrE+GvO8eA7FHevYBeJqi9sezxh2IO4nlcO+xJ7H
CrFlsErYN9pvYdXYVtg1WIa/hBpiWzyHJ2ufEvOw9o3xfImbJa4F1sc5nOFc
ZrtfM+I90K4i7obsVDNF7TQ73j+x32vnkOU9a1GsIdh3/EKF/n+6ylqITcM2
RZ1GMY0txnponKTf69nRMbdod4p6h33EuIPjd9fuhp3IzsRG5qXaoXKsU1EH
6W+G/prGtWL949nEnsXaY13klhT/qNzb4p4WpPpviLg5cQ30Ev/tWAex1vwO
cvP5N8s9XfwzcqfKvUj7BuzUqP+wiVgN7YpYH/5W8/IvtJkWxr3VX239Ndbf
X9pni6tM2x3/lbbQOzGPObbVOZyufQbVEVOPTtP/KXQS3RS+sZ42zhT+hdoL
xJ4st5YxGhljd6xNUVeyDbHLsH0xz2Ol2YuxZtj+eC/0N0Rfh53Df3SQqmGD
sX+1D9A+eiPqWvGN5F4u94D2m1HvRo2GXYVl82fKXSZ3j3PbTX/Qf3hJcU3E
NRf3W8xr4paL+8fxvfQXbaH3sZJRH9IjYk6hHthK57CcltJpWE/sE+2PaAVt
NcYD+p1vjLeNcTv/sD4KRc3p+HgaG78LPj7q3lijxd0S8yZNwF6MtRsbwM+T
1zZqJjmP0Ax6hV/a/Z7FvuFcF9F+WsE/O+p/ekbee/yHY52PWl/7Hcrltwmu
n+k0jTbG+2XcyfEeGbdN1C7UG5uETcOu4i/PSbXRH7mpzop66/2oKbHtWNmo
n+gTao0NlHuH3FqxL3AOzY07znhjaDTtxy7HRmmPpBH0gdimcnfor3zUgZEb
tZu4quLPodlRQ1BnbFHsgWh+/AY5qY78S26NWGfp+Kgd6U3HF8d7QMfwO8l9
Xfu1uJ/x2+WkmvHP3FR/Rh26LCftbXblptowasSVOaku3Z2bateoYQv0l+/3
2OvcntDX41RI+yNjnMeeT3PEZKgdNsvxmfQoPezYPuxnx36lLTQvnhf97dHe
R3/H3G+cUbEexvzgnt7M/zFqopjPsWewbrHO0t2xpmEvYr34P9Dt2KPY09h1
0Zcx9hh3MfsGfW2Mn/A7xM2MeUhcd/6quOex5sX7SOfE74T9FfePXUBfyb2f
nUST6Sf+D/H8yW+sv23uVel4b2ma4/9ETej4L7SZfsRqY+303YZax/3B9scc
5vgO2kaf8V9mGzv2qfYaGqa9m32FfZXWO/4kewDbrr2Tfou9L1Yda6jv+lSX
vsZqYI21L6YGMQ86x0dirYoazj0YGe+vmN36qO03ORTzEZ0k9wu2WTzD9Irj
m8QOirVF7uNyO8W6QwNiDcIewzrwp8R+Wl8j2Fae7ZZR78Vihf2H7dXXX7Hu
YJ/zm7KX0Dzse/kDY6+kv5lSOvKX5qR9/s7ctCePvflm8XXkXuOa2lPbmHOw
ulgn7Q50NVWJ3x7ryl4bz4IxqrHfYN3ZHvQm9j/2W+xmtje9Hb+H816MHWIP
032xN4/5CDvAHqTJ2F38o11bP/Z07NS8tJb3z6R94MN5aV0/K54ltiPbiRY7
fj27HXuEfTR+9yP7yIGZtI+emZf2lP3jmwC/K7vDdW2jJ2NPxV/NrqFBcprr
YzN2FzuSlmG92B3Y4+ws+iyT5ti74xmVNy+eO7osnm32DnY4LXW8qjGvyaR9
TC+x0/NTbdAzk+qHu/NSnXCy9o2ZtD6Pw57MT+t2r0xaOyflpTU81ve+mVTf
TMtLa311Y21gb2BvpLeO7KE6ZtK+rW9e2k9FXXFdJu2Pb89LNUYT8T+yt7K3
0YdH9n2dM6mWGZCX9oA/0AexBovZFDVpfqp7umZSjTIkL9VA18Y3HH5L9q1Y
j2lN3LN4l7QvoPOoG3+bmIfY6bRGP0PZP+P7BvsSrcO2Rhx1ldOZOtJXnt8e
nufRnvHJnvErolYTU0vuVY63opa0oUj6vhTflJrwG9E3YnvJnSD3Qbmt+Kup
Tey1sTuxOvyvqSd2L3Yf1py/nrpj92CTsMv5H9Il2G/erYraZ9E66oaNEjdR
XDP+x9QKG4ANw2ryN0TNhk3EpmKtYz6lq7BB2HCsNv8P5782vv24ll3aO+lT
vJ24oeLuElcv9gWOX+HYva7zHrqbdmNNsQHa/akv7cGK+I2K4QP5t8T7jm3N
T9/u4hveJ/QH1oTfz/E+dDPtxBpjvbV70Y3x+xq7rXMZ4lxGOJe6UceK+1Xc
A+yDtFp/n+Mdxd0h7h5xF/M/ow7YMGwU1pD/m/hGcm/S9w3Uk9ZGn+JGxHck
cU34X1AnbDg2GmvE/5I6Y3di92KN+Y8ae6n+/vSM7qLf89K+M/afz0eNFXW0
3++LWIvF1TZeTbooajj5p4Zy0z5kDJsT30O1WxqjnT7+1t4b6wD/XLoQW5+d
9iqxZzktN9XMY9lTqIF2f3FDxZ3o+ElYPawvNhgrGXlYfawfNgQ74UitEzVP
6dz0zE068k31kJhzqCr1w0pSbcdv5g+Qe6yYE7A6WG9sYOzrsBOxulgfbBB2
PNbA9ed5NqrFu+z6u9DfeGFxNcTVFfd91EHxXPJLUUVsRXaq93tn0r7j/rxU
+x+KsWOvKK6FuJ3ah2Ns9hKsJbZLu1DsJ9jmWBtsj/Z+cUdlp+uK61uam/Yb
se84PTd9mx7HZgfXbiGmrdy92mfE2hA1gPNfRR8XTt/MdxVK357jG3RPef9E
DS3+Qn49ud9pl5Jb1DUUZT+VtzreI3F/i6kQ5yLu06gjsX/i+uN3x9Zkp/o2
6txSualOnZib6pqob87MTbXwhNz0LT2+qZ+Rm2qg8ey7xnufGnkOG1J9WsL/
znU00K4Xa3Z86476Wk5X414fn9j0UzzqTaw7dnOUCtjR8b0U64b1wopiRaNW
xTpjPeLbY076JnhPdtpbxh6zsOv93Lhfxv7KeAPpliJpP319dvqOG99z98V3
XOeWca/qs5PkTYh1VV45bGLUp56Dv+O7atSuYq7WTztqQyuxs8QtZK/hty+S
PoaeZowrYv8W8zH/WLoQu57fV8jRzvkYrHrsybHe2FFYJuZgrD3WFTusnR81
D9sx9skxx/CPi+9u2A3xvogrnpO+U7fHbsVuo7384+PbKNaLf1PMJ/wSsXfA
evL7yC0mtwhWAWuHdcEOaefF/oRti3XG/tM+CjuH7RLPHlY43iusHNYG64Qd
1C7AqrCdsO5YTk46l5rZ6RriWjbxc2NPhV0VTNy/2v9GLNsYuwL7PTv9RtmZ
tB7HutyC9sV5O3aRuPriNsUaFmuBY2f6vUpR1ajhYg6OfH4OlcX2YAOxivyz
4ttw7G/Y27C6bL34fo8VZm/FasZ/GvFNBivG3h51NntxcOxr/d0UdQO/KJXH
Nsb6EnUhvzhVwFrHd3NsfHxTp1bY2liDYs7iF6Fy2KXsRGwEexe1yKT6r0om
1ZdRZ/alEtrDojZgm1LtTKq9r2THRr2qPZn+MMYAtmz0H9/1juw1yhekfXPs
n0vQIsrBDjh+iP6Ne47lRt2uXUjsYXY+lo39o32Q9tPHWFXHzzVWVapMK+Od
i/PWrkRnxb7R+EOxGvFNJb7xxPcJcZVjb+94RSpPO3LS9/j4Lv9i/LY5qYar
WJD2RrFHujhq1PgewK8gpxyVKZy+C5QtSHVt1Leb81INcnZBqv2iBhxUJO17
qhSkmiRqk2dpLV3Ar6efOlSL2sl/IO5l3FNq7Zy7sdOibo86lNrGviz2Itjn
7BdULPaIUSvG2h1zMJ2cSe90pew0P8Q8sTb+i3LsUnFz2Lm0z3k8x16DfRO1
IBWXe1ms69hgdgh9H3sV9jrs96hv6CRxB2L+NEY9/TdxH3+J7x9RW4pbwr5D
OZlU756YSXuK2Ft0yU/rVjHxdeXWiXXe+R2MORqrz2+qvy0x38YeS/w6dj0d
rZ8G7sV4bGi8O3RFJs2Jp2anvqLPT/iDxF8i7in2afon1gbx46Kmi70MXX5k
b1U/k/aRsZ+8M377eH/YYewd1NzxLuzUqMdjj0JtsA7sg1HDhaWrMqk+2F4k
zfUx59ejMo7dzbZnr6aG4iqx98S+kb2WGmHXyWmI3cdOiWdUP2c4NjLq9hiT
GsS+iB0Te0m2N12GVWBHxd6P7RRzR+yB2LFRn7L9qVms+exDsVdjZ1E77P8A
pRPj6w==
                   "]]}]}, {}, {}, {}, {}}, {{
                GrayLevel[0], 
                Line[CompressedData["
1:eJwt0rsrRnEYwPHjfr8lpYj8AWxkYJSBSTKwkYGBkoHRIDYbfwEriV2xufO6
35Pktrhf4/Mrw/f9PPX+Ouc5nVPW3tvUExdF0bBeFeZHXWo2PopyucBSrrOC
p6zlAxv5zTZmJERRN4tYrEFzNUdZzwm2cIqdnGc/l8K1eM13betZ91q2UIwr
3OEqd7nGvbAT97nBA27ykFvc1pE5xmPu8IS7POUez7jPc057jht+6EIvYS+N
2W2LQ1xkH+fYwUk2c5x1HGEVKzVgLmQX09jKT/do4B1reMzy8Fws4a1zV3xT
jp7CWRXYMZv5zGIeM8MZZjCL6eEdMI2pTFGqOSnMTGByeMdM4q8S9RP+05es
Ec34uf3/Hv4AxpdK8A==
                 "]], 
                Line[CompressedData["
1:eJwl0lFEngEUBuAvRVORxqIo/tgoFhuNovKXolgsiqIoisXKoiiKoiiKoiiK
oiiKIimKYqMoikmSYmNRNIpFYz108TjOe/GemxOqbylvjgiCoI+8mCDIpYAw
xRRRSgllfKScT1RSQXxsEFSbVdRSQz11NNJAE5+ZZ45NNthnjxMWWeClvgQS
eUUySaSSQhoh3vCaQjJIJ5O3vOcdH8gih2xyaXbjC7vscMwRZ6wxzRSTTDDO
GKOMMMwQcbpiCTNoH6CfPnrpoZsuOumgnTaWWWKbLQ454JRVVnihN5ooIgn4
L//HIw/8JV9+b97xh1tuuOaK3/ziJ5dccE4rX5llhu984wfrMc//8ATBb0iP

                 "]], 
                Line[CompressedData["
1:eJwl0mFE3gEQB+B/sehNicWiqBTFYqNRNO3Vomg0K4pGs6IoFUWxKFaKjaIo
ikXRWBQlURSLomg0SSYaRaNYLIqmhz48zt3xuy+X9r7lTXNEEAR9hENB8IJl
9tlik2mmaKeNI35zzCkn/OGMC8655C9X/CMcEwQ36jX/uSXSLIIoHhAimkW7
BQ75wS7rrDHPHJ100MUHeuiml48M0M9nPlEoN45YhvSDjDDMGKNMMM4kX1ji
Fz/ZY4PvtNJCgazn5JNHLs/I4SlPyOYxRWSRSQbppJJCMkkk8ogEHjLrxjcO
2GGbVVb4ygxNNNJAPXXU8o4a3lJNvLwqtZIKynlNGa8opYRiingZuv+HO8bs
SI4=
                 "]], 
                Line[CompressedData["
1:eJwl0ksrRFEAwPFDDTMmySNJHjOMGURE4xER0ZSljYWdjYWilHwC2cjW3sY3
YEsWsrCwslNEI/JYmIjIb7L49T+3c+45t9NNLq3Nr5aEELZoj4SQIk2GLrrp
oZc++hlgkCxDRCpCGNFRxhhngkmmmGaGWSpiIcRppokOUuTMVWkl5fYrlIcQ
03gUTWqlZrVKc1qtCzquCdaN23RHU7qvaT3UTj3Xbj229wlJZyXoopN6GgiU
8GP9L19888En7xT4seaXMXu+en7jmRceeSLPA3fcc8Mtu86v8W4rLWRIc22u
VuvIs2jdVfEb9Uy/ykI40gs90H3tdf6e8YrxtmZ1U0t1WS/d7UJxreZ0Q4d1
Tk/tGy3eOe20EaEx9v8//AFKBTnn
                 "]]}, {
                
                Line[{690, 1001, 473, 689, 1107, 912, 691, 1108, 913, 692, 
                 1109, 914, 693, 1110, 915, 694, 1111, 916, 695, 1112, 917, 
                 696, 1113, 481, 697, 1114, 918, 698, 1115, 919, 699, 1116, 
                 920, 700, 1117, 921, 701, 1118, 922, 702, 1106, 1119, 923, 
                 1002}], 
                
                Line[{704, 1007, 1210, 703, 488, 705, 1120, 924, 706, 1121, 
                 925, 707, 1122, 926, 708, 1123, 927, 709, 1124, 928, 710, 
                 1125, 1008, 1211, 711, 1009, 1212, 712, 1126, 929, 713, 1127,
                  930, 714, 1128, 931, 715, 1129, 932, 716, 1130, 933, 717}], 
                
                
                Line[{719, 1010, 1213, 718, 1011, 1214, 720, 504, 721, 1131, 
                 934, 722, 1132, 935, 723, 1133, 936, 724, 1134, 937, 725, 
                 1135, 1012, 1215, 726, 1013, 1216, 727, 512, 728, 1136, 938, 
                 729, 1137, 939, 730, 1138, 940, 731, 1139, 941, 732}], 
                
                Line[{734, 1014, 1217, 733, 1015, 1218, 735, 1016, 1219, 736, 
                 520, 737, 1140, 942, 738, 1141, 943, 739, 1142, 944, 740, 
                 1143, 1017, 1220, 741, 1018, 1221, 742, 1019, 1222, 743, 
                 1144, 945, 744, 1145, 946, 745, 1146, 947, 746, 1147, 948, 
                 747}], 
                
                Line[{749, 1020, 1223, 748, 1021, 1224, 750, 1022, 1225, 751, 
                 1023, 1226, 752, 536, 753, 1148, 949, 754, 1149, 950, 755, 
                 1150, 1024, 1227, 756, 1025, 1228, 757, 1026, 1229, 758, 
                 1027, 1230, 759, 1151, 951, 760, 1152, 952, 761, 1153, 953, 
                 762}], 
                
                Line[{764, 1028, 1231, 763, 1029, 1232, 765, 1030, 1233, 766, 
                 1031, 1234, 767, 1032, 1235, 768, 552, 769, 1154, 954, 770, 
                 1155, 1033, 1236, 771, 1034, 1237, 772, 1035, 1238, 773, 
                 1036, 1239, 774, 1037, 1240, 775, 1156, 955, 776, 1157, 956, 
                 777}], 
                
                Line[{779, 1038, 1241, 778, 1039, 1242, 780, 1040, 1243, 781, 
                 1041, 1244, 782, 1042, 1245, 783, 1043, 1246, 784, 568, 785, 
                 1158, 1044, 1247, 786, 1045, 1248, 787, 1046, 1249, 788, 
                 1047, 1250, 789, 1048, 1251, 790, 1049, 1252, 791, 1050, 
                 1253, 792}], 
                
                Line[{796, 1159, 957, 794, 1160, 958, 798, 1161, 959, 800, 
                 1162, 960, 802, 1163, 961, 804, 1164, 962, 806, 1165, 963, 
                 808, 1166, 585, 810, 1167, 964, 812, 1168, 965, 814, 1169, 
                 966, 816, 1170, 967, 818, 1171, 968, 820, 1172, 969, 822}], 
                
                Line[{821, 1267, 1063, 819, 1266, 1062, 817, 1265, 1061, 815, 
                 1264, 1060, 813, 1263, 1059, 811, 1262, 1058, 809, 1261, 584,
                  807, 1260, 1057, 805, 1259, 1056, 803, 1258, 1055, 801, 
                 1257, 1054, 799, 1256, 1053, 797, 1255, 1052, 793, 1254, 
                 1051, 795}], 
                
                Line[{824, 1064, 1268, 823, 1173, 970, 825, 1174, 971, 826, 
                 1175, 972, 827, 1176, 973, 828, 1177, 974, 829, 1178, 975, 
                 830, 1179, 1065, 1269, 831, 601, 832, 1180, 976, 833, 1181, 
                 977, 834, 1182, 978, 835, 1183, 979, 836, 1184, 980, 837}], 
                
                Line[{839, 1066, 1270, 838, 1067, 1271, 840, 609, 841, 1185, 
                 981, 842, 1186, 982, 843, 1187, 983, 844, 1188, 984, 845, 
                 1189, 1068, 1272, 846, 1069, 1273, 847, 617, 848, 1190, 985, 
                 849, 1191, 986, 850, 1192, 987, 851, 1193, 988, 852}], 
                
                Line[{854, 1070, 1274, 853, 1071, 1275, 855, 1072, 1276, 856, 
                 625, 857, 1194, 989, 858, 1195, 990, 859, 1196, 991, 860, 
                 1197, 1073, 1277, 861, 1074, 1278, 862, 1075, 1279, 863, 633,
                  864, 1198, 992, 865, 1199, 993, 866, 1200, 994, 867}], 
                
                Line[{869, 1076, 1280, 868, 1077, 1281, 870, 1078, 1282, 871, 
                 1079, 1283, 872, 1080, 1284, 873, 1201, 995, 874, 1202, 996, 
                 875, 1203, 1081, 1285, 876, 1082, 1286, 877, 1083, 1287, 878,
                  1084, 1288, 879, 649, 880, 1204, 997, 881, 1205, 998, 882}], 
                
                Line[{884, 1085, 1289, 883, 1086, 1290, 885, 1087, 1291, 886, 
                 1088, 1292, 887, 1089, 1293, 888, 657, 889, 1206, 999, 890, 
                 1207, 1090, 1294, 891, 1091, 1295, 892, 1092, 1296, 893, 
                 1093, 1297, 894, 1094, 1298, 895, 665, 896, 1208, 1000, 
                 897}], 
                
                Line[{911, 1006, 685, 910, 1309, 1105, 909, 1308, 1104, 908, 
                 1307, 1103, 907, 1306, 1102, 906, 1305, 1101, 905, 1304, 
                 1100, 1209, 904, 673, 903, 1303, 1099, 902, 1302, 1098, 901, 
                 1301, 1097, 900, 1300, 1096, 899, 1299, 1095, 898, 1310, 
                 1004, 1003, 1005}], 
                
                Line[{1985, 1983, 2307, 2306, 1982, 1979, 2564, 1978, 1975, 
                 2563, 1974, 1971, 2562, 1970, 1967, 2561, 1966, 1963, 2560, 
                 2604, 2559, 2290, 2289, 1957, 2555, 1956, 1953, 2554, 1952, 
                 1949, 2553, 1948, 1945, 2552, 1944, 1941, 2551, 1940, 1937, 
                 1933, 1936, 2320, 2321, 2323}], 
                
                Line[{1987, 1986, 1313, 1311, 1989, 1988, 2346, 1991, 1990, 
                 2347, 1993, 1992, 2348, 1995, 1994, 2349, 1997, 1996, 2350, 
                 1999, 1998, 2000, 2001, 2351, 2353, 2003, 2002, 2354, 2005, 
                 2004, 2355, 2007, 2006, 2356, 2009, 2008, 2357, 2011, 2010, 
                 2013, 2012, 2318, 2316, 2319}], 
                
                Line[{2359, 1353, 1356, 2360, 1357, 2361, 2016, 2015, 2362, 
                 2018, 2017, 2363, 2020, 2019, 2364, 2022, 2021, 2365, 2024, 
                 2023, 2025, 2026, 2368, 2566, 2369, 1377, 1380, 2370, 2029, 
                 2028, 2371, 2031, 2030, 2372, 2033, 2032, 2373, 2035, 2034, 
                 2374, 2038, 2036, 2567}], 
                
                Line[{2375, 1396, 1399, 2376, 1400, 1403, 2377, 1404, 2378, 
                 2042, 2041, 2379, 2044, 2043, 2380, 2046, 2045, 2381, 2048, 
                 2047, 2049, 2050, 2384, 2568, 2385, 1422, 1425, 2386, 1426, 
                 2387, 2053, 2052, 2388, 2055, 2054, 2389, 2057, 2056, 2390, 
                 2060, 2058, 2569}], 
                
                Line[{2391, 1441, 1444, 2392, 1445, 1448, 2393, 1449, 1452, 
                 2394, 1453, 2395, 2065, 2064, 2396, 2067, 2066, 2397, 2069, 
                 2068, 2070, 2071, 2400, 2570, 2401, 1468, 1471, 2402, 1472, 
                 1475, 2403, 2075, 2074, 2404, 2077, 2076, 2405, 2079, 2078, 
                 2406, 2082, 2080, 2571}], 
                
                Line[{2407, 1488, 1491, 2408, 1492, 1495, 2409, 1496, 1499, 
                 2410, 1500, 1503, 2411, 1504, 2412, 2088, 2087, 2413, 2090, 
                 2089, 2091, 2092, 2416, 2572, 2417, 1516, 1519, 2418, 1520, 
                 1523, 2419, 1524, 1527, 2420, 2097, 2096, 2421, 2099, 2098, 
                 2422, 2102, 2100, 2573}], 
                
                Line[{2423, 1537, 1540, 2424, 1541, 1544, 2425, 1545, 1548, 
                 2426, 1549, 1552, 2427, 1553, 1556, 2428, 1557, 2429, 2109, 
                 2108, 2110, 2111, 2432, 2574, 2433, 1566, 1569, 2434, 1570, 
                 1573, 2435, 1574, 1577, 2436, 1578, 1581, 2437, 2117, 2116, 
                 2438, 2120, 2118, 2575}], 
                
                Line[{2439, 1588, 1591, 2440, 1592, 1595, 2441, 1596, 1599, 
                 2442, 1600, 1603, 2443, 1604, 1607, 2444, 1608, 1611, 2445, 
                 1612, 2127, 2128, 2448, 2576, 2449, 1618, 1621, 2450, 1622, 
                 1625, 2451, 1626, 1629, 2452, 1630, 1633, 2453, 1634, 1637, 
                 2454, 1638, 1641, 2577}], 
                
                Line[{2455, 1642, 1645, 2456, 1646, 1649, 2457, 1650, 1653, 
                 2458, 1654, 1657, 2459, 1658, 1661, 2460, 1662, 1665, 2461, 
                 1666, 1669, 2150, 1670, 2586, 2465, 1673, 1676, 2466, 1677, 
                 1680, 2467, 1681, 1684, 2468, 1685, 1688, 2469, 1689, 1692, 
                 2470, 1693, 1696, 2620}], 
                
                Line[{2471, 1697, 1700, 2472, 2166, 2165, 2473, 2168, 2167, 
                 2474, 2170, 2169, 2475, 2172, 2171, 2476, 2174, 2173, 2477, 
                 2176, 2175, 2177, 2178, 2480, 2593, 2481, 1722, 2482, 2180, 
                 2179, 2483, 2182, 2181, 2484, 2184, 2183, 2485, 2186, 2185, 
                 2486, 2189, 2187, 2594}], 
                
                Line[{2487, 1740, 1743, 2488, 1744, 1747, 2489, 1748, 2490, 
                 2193, 2192, 2491, 2195, 2194, 2492, 2197, 2196, 2493, 2199, 
                 2198, 2200, 2201, 2496, 2595, 2497, 1766, 1769, 2498, 1770, 
                 2499, 2204, 2203, 2500, 2206, 2205, 2501, 2208, 2207, 2502, 
                 2211, 2209, 2596}], 
                
                Line[{2503, 1785, 1788, 2504, 1789, 1792, 2505, 1793, 1796, 
                 2506, 1797, 2507, 2216, 2215, 2508, 2218, 2217, 2509, 2220, 
                 2219, 2221, 2222, 2512, 2597, 2513, 1812, 1815, 2514, 1816, 
                 1819, 2515, 1820, 2516, 2226, 2225, 2517, 2228, 2227, 2518, 
                 2231, 2229, 2598}], 
                
                Line[{2519, 1832, 1835, 2520, 1836, 1839, 2521, 1840, 1843, 
                 2522, 1844, 1847, 2523, 1848, 1851, 2524, 2238, 2237, 2525, 
                 2240, 2239, 2241, 2242, 2528, 2599, 2529, 1861, 1864, 2530, 
                 1865, 1868, 2531, 1869, 1872, 2532, 1873, 2533, 2247, 2246, 
                 2534, 2250, 2248, 2600}], 
                
                Line[{2535, 1882, 1885, 2536, 1886, 1889, 2537, 1890, 1893, 
                 2538, 1894, 1897, 2539, 1898, 1901, 2540, 1902, 2541, 2258, 
                 2257, 2259, 2260, 2544, 2601, 2545, 1911, 1914, 2546, 1915, 
                 1918, 2547, 1919, 1922, 2548, 1923, 1926, 2549, 1927, 2550, 
                 2268, 2266, 2602}], 
                
                Line[{2592, 2161, 2163, 2591, 2159, 2160, 2590, 2157, 2158, 
                 2589, 2155, 2156, 2588, 2153, 2154, 2587, 2151, 2152, 2585, 
                 2462, 2464, 2584, 2148, 2149, 2583, 2146, 2147, 2582, 2144, 
                 2145, 2581, 2142, 2143, 2580, 2140, 2141, 2579, 2138, 2139, 
                 2578, 2136, 2137, 2605}]}, {
                
                Line[{251, 474, 1107, 252, 488, 280, 1214, 503, 295, 1218, 
                 518, 310, 1224, 533, 325, 1232, 548, 340, 1242, 563, 355, 
                 1255, 578, 1160, 370, 593, 1173, 385, 1271, 608, 400, 1275, 
                 623, 415, 1281, 638, 430, 1290, 653, 445, 1299, 668, 460}], 
                
                Line[{253, 475, 1108, 254, 489, 1120, 281, 504, 296, 1219, 
                 519, 311, 1225, 534, 326, 1233, 549, 341, 1243, 564, 356, 
                 1256, 579, 1161, 371, 594, 1174, 386, 609, 401, 1276, 624, 
                 416, 1282, 639, 431, 1291, 654, 446, 1300, 669, 461}], 
                
                Line[{255, 476, 1109, 256, 490, 1121, 282, 505, 1131, 297, 
                 520, 312, 1226, 535, 327, 1234, 550, 342, 1244, 565, 357, 
                 1257, 580, 1162, 372, 595, 1175, 387, 610, 1185, 402, 625, 
                 417, 1283, 640, 432, 1292, 655, 447, 1301, 670, 462}], 
                
                Line[{257, 477, 1110, 258, 491, 1122, 283, 506, 1132, 298, 
                 521, 1140, 313, 536, 328, 1235, 551, 343, 1245, 566, 358, 
                 1258, 581, 1163, 373, 596, 1176, 388, 611, 1186, 403, 626, 
                 1194, 418, 1284, 641, 433, 1293, 656, 448, 1302, 671, 463}], 
                
                
                Line[{259, 478, 1111, 260, 492, 1123, 284, 507, 1133, 299, 
                 522, 1141, 314, 537, 1148, 329, 552, 344, 1246, 567, 359, 
                 1259, 582, 1164, 374, 597, 1177, 389, 612, 1187, 404, 627, 
                 1195, 419, 642, 1201, 434, 657, 449, 1303, 672, 464}], 
                
                Line[{261, 479, 1112, 262, 493, 1124, 285, 508, 1134, 300, 
                 523, 1142, 315, 538, 1149, 330, 553, 1154, 345, 568, 360, 
                 1260, 583, 1165, 375, 598, 1178, 390, 613, 1188, 405, 628, 
                 1196, 420, 643, 1202, 435, 658, 1206, 450, 673, 465}], 
                
                Line[{263, 480, 1113, 265, 494, 1125, 286, 509, 1135, 301, 
                 524, 1143, 316, 539, 1150, 331, 554, 1155, 346, 569, 1158, 
                 361, 584, 1166, 376, 599, 1179, 391, 614, 1189, 406, 629, 
                 1197, 421, 644, 1203, 436, 659, 1207, 451, 674, 1209, 466}], 
                
                
                Line[{267, 482, 1114, 268, 1212, 496, 288, 1216, 511, 303, 
                 1221, 526, 318, 1228, 541, 333, 1237, 556, 348, 1248, 571, 
                 363, 1262, 586, 1167, 378, 601, 393, 1273, 616, 408, 1278, 
                 631, 423, 1286, 646, 438, 1295, 661, 453, 1305, 676, 468}], 
                
                Line[{269, 483, 1115, 270, 497, 1126, 289, 512, 304, 1222, 
                 527, 319, 1229, 542, 334, 1238, 557, 349, 1249, 572, 364, 
                 1263, 587, 1168, 379, 602, 1180, 394, 617, 409, 1279, 632, 
                 424, 1287, 647, 439, 1296, 662, 454, 1306, 677, 469}], 
                
                Line[{271, 484, 1116, 272, 498, 1127, 290, 513, 1136, 305, 
                 528, 1144, 320, 1230, 543, 335, 1239, 558, 350, 1250, 573, 
                 365, 1264, 588, 1169, 380, 603, 1181, 395, 618, 1190, 410, 
                 633, 425, 1288, 648, 440, 1297, 663, 455, 1307, 678, 470}], 
                
                Line[{273, 485, 1117, 274, 499, 1128, 291, 514, 1137, 306, 
                 529, 1145, 321, 544, 1151, 336, 1240, 559, 351, 1251, 574, 
                 366, 1265, 589, 1170, 381, 604, 1182, 396, 619, 1191, 411, 
                 634, 1198, 426, 649, 441, 1298, 664, 456, 1308, 679, 471}], 
                
                Line[{275, 486, 1118, 276, 500, 1129, 292, 515, 1138, 307, 
                 530, 1146, 322, 545, 1152, 337, 560, 1156, 352, 1252, 575, 
                 367, 1266, 590, 1171, 382, 605, 1183, 397, 620, 1192, 412, 
                 635, 1199, 427, 650, 1204, 442, 665, 457, 1309, 680, 472}], 
                
                Line[{277, 682, 683, 1119, 278, 501, 1130, 293, 516, 1139, 
                 308, 531, 1147, 323, 546, 1153, 338, 561, 1157, 353, 1253, 
                 576, 368, 1267, 591, 1172, 383, 606, 1184, 398, 621, 1193, 
                 413, 636, 1200, 428, 651, 1205, 443, 666, 1208, 458, 685, 
                 686, 687}], 
                
                Line[{459, 667, 1310, 684, 444, 652, 1289, 429, 637, 1280, 
                 414, 622, 1274, 399, 607, 1270, 384, 592, 1268, 369, 1159, 
                 577, 1254, 354, 562, 1241, 339, 547, 1231, 324, 532, 1223, 
                 309, 517, 1217, 294, 502, 1213, 279, 487, 1210, 250, 473, 
                 681, 688}], 
                
                Line[{467, 675, 1304, 452, 660, 1294, 437, 645, 1285, 422, 
                 630, 1277, 407, 615, 1272, 392, 600, 1269, 377, 585, 1261, 
                 362, 570, 1247, 347, 555, 1236, 332, 540, 1227, 317, 525, 
                 1220, 302, 510, 1215, 287, 495, 1211, 266, 481, 264}], 
                
                Line[{1316, 1314, 1989, 1358, 1357, 1402, 1403, 2040, 1447, 
                 1448, 2062, 1494, 1495, 2084, 1543, 1544, 2104, 1594, 1595, 
                 2122, 1648, 1649, 2607, 2139, 1703, 1701, 2166, 1746, 1747, 
                 2191, 1791, 1792, 2213, 1838, 1839, 2233, 1888, 1889, 2253, 
                 1939, 1940, 2272, 2274}], 
                
                Line[{1319, 1317, 1991, 1361, 1359, 2016, 1406, 1404, 1451, 
                 1452, 2063, 1498, 1499, 2085, 1547, 1548, 2105, 1598, 1599, 
                 2123, 1652, 1653, 2608, 2141, 1706, 1704, 2168, 1750, 1748, 
                 1795, 1796, 2214, 1842, 1843, 2234, 1892, 1893, 2254, 1943, 
                 1944, 2275, 2277}], 
                
                Line[{1322, 1320, 1993, 1364, 1362, 2018, 1409, 1407, 2042, 
                 1455, 1453, 1502, 1503, 2086, 1551, 1552, 2106, 1602, 1603, 
                 2124, 1656, 1657, 2609, 2143, 1709, 1707, 2170, 1753, 1751, 
                 2193, 1799, 1797, 1846, 1847, 2235, 1896, 1897, 2255, 1947, 
                 1948, 2278, 2280}], 
                
                Line[{1325, 1323, 1995, 1367, 1365, 2020, 1412, 1410, 2044, 
                 1458, 1456, 2065, 1506, 1504, 1555, 1556, 2107, 1606, 1607, 
                 2125, 1660, 1661, 2610, 2145, 1712, 1710, 2172, 1756, 1754, 
                 2195, 1802, 1800, 2216, 1850, 1851, 2236, 1900, 1901, 2256, 
                 1951, 1952, 2281, 2283}], 
                
                Line[{1328, 1326, 1997, 1370, 1368, 2022, 1415, 1413, 2046, 
                 1461, 1459, 2067, 1509, 1507, 2088, 1559, 1557, 1610, 1611, 
                 2126, 1664, 1665, 2611, 2147, 1715, 1713, 2174, 1759, 1757, 
                 2197, 1805, 1803, 2218, 1854, 1852, 2238, 1904, 1902, 1955, 
                 1956, 2284, 2286}], 
                
                Line[{1331, 1329, 1999, 1373, 1371, 2024, 1418, 1416, 2048, 
                 1464, 1462, 2069, 1512, 1510, 2090, 1562, 1560, 2109, 1614, 
                 1612, 1668, 1669, 2612, 2149, 1718, 1716, 2176, 1762, 1760, 
                 2199, 1808, 1806, 2220, 1857, 1855, 2240, 1907, 1905, 2258, 
                 1959, 1957, 2288}], 
                
                Line[{1334, 1332, 2001, 1376, 1374, 2026, 1421, 1419, 2050, 
                 1467, 1465, 2071, 1515, 1513, 2092, 1565, 1563, 2111, 1617, 
                 1615, 2128, 1672, 1670, 2464, 1721, 1719, 2178, 1765, 1763, 
                 2201, 1811, 1809, 2222, 1860, 1858, 2242, 1910, 1908, 2260, 
                 1962, 1960, 2290, 2619}], 
                
                Line[{1337, 1335, 2003, 1379, 1380, 2027, 1424, 1425, 2051, 
                 1470, 1471, 2072, 1518, 1519, 2093, 1568, 1569, 2112, 1620, 
                 1621, 2129, 1675, 1676, 2613, 2152, 1724, 1722, 1768, 1769, 
                 2202, 1814, 1815, 2223, 1863, 1864, 2243, 1913, 1914, 2261, 
                 1965, 1966, 2291, 2293}], 
                
                Line[{1340, 1338, 2005, 1383, 1381, 2029, 1428, 1426, 1474, 
                 1475, 2073, 1522, 1523, 2094, 1572, 1573, 2113, 1624, 1625, 
                 2130, 1679, 1680, 2614, 2154, 1727, 1725, 2180, 1772, 1770, 
                 1818, 1819, 2224, 1867, 1868, 2244, 1917, 1918, 2262, 1969, 
                 1970, 2294, 2296}], 
                
                Line[{1343, 1341, 2007, 1386, 1384, 2031, 1431, 1429, 2053, 
                 1478, 1476, 2075, 1526, 1527, 2095, 1576, 1577, 2114, 1628, 
                 1629, 2131, 1683, 1684, 2615, 2156, 1730, 1728, 2182, 1775, 
                 1773, 2204, 1822, 1820, 1871, 1872, 2245, 1921, 1922, 2263, 
                 1973, 1974, 2297, 2299}], 
                
                Line[{1346, 1344, 2009, 1389, 1387, 2033, 1434, 1432, 2055, 
                 1481, 1479, 2077, 1530, 1528, 2097, 1580, 1581, 2115, 1632, 
                 1633, 2132, 1687, 1688, 2616, 2158, 1733, 1731, 2184, 1778, 
                 1776, 2206, 1825, 1823, 2226, 1875, 1873, 1925, 1926, 2264, 
                 1977, 1978, 2300, 2302}], 
                
                Line[{1349, 1347, 2011, 1392, 1390, 2035, 1437, 1435, 2057, 
                 1484, 1482, 2079, 1533, 1531, 2099, 1584, 1582, 2117, 1636, 
                 1637, 2133, 1691, 1692, 2617, 2160, 1736, 1734, 2186, 1781, 
                 1779, 2208, 1828, 1826, 2228, 1878, 1876, 2247, 1929, 1927, 
                 1981, 1982, 2303, 2305}], 
                Line[{2315, 2313, 2358, 2318, 1395, 1393, 2038, 1440, 1438, 
                 2060, 1487, 1485, 2082, 1536, 1534, 2102, 1587, 1585, 2120, 
                 1640, 1641, 2134, 1695, 1696, 2618, 2163, 1739, 1737, 2189, 
                 1784, 1782, 2211, 1831, 1829, 2231, 1881, 1879, 2250, 1932, 
                 1930, 2268, 2267, 2307, 2329, 2328}], 
                
                Line[{2322, 1935, 1936, 2603, 2252, 2251, 1885, 1884, 2232, 
                 1835, 1834, 2212, 1788, 1787, 2190, 1743, 1742, 2164, 1700, 
                 1699, 2137, 2606, 1645, 1644, 2121, 1591, 1590, 2103, 1540, 
                 1539, 2083, 1491, 1490, 2061, 1444, 1443, 2039, 1399, 1398, 
                 2014, 1356, 1355, 1313, 2331, 2330}], 
                
                Line[{2558, 2556, 2604, 2543, 2542, 2601, 2527, 2526, 2599, 
                 2511, 2510, 2597, 2495, 2494, 2595, 2479, 2478, 2593, 2463, 
                 2462, 2586, 2447, 2446, 2576, 2431, 2430, 2574, 2415, 2414, 
                 2572, 2399, 2398, 2570, 2383, 2382, 2568, 2367, 2366, 2566, 
                 2352, 2351, 2565}]}, {}, {}}}, 
             VertexNormals -> CompressedData["
1:eJzt1rENgkAUANCLlk7hHBY0TuAIJto6gpsYN2EB57BmBBulAC+nxCMHPhqS
B9z/n3Cfv96fdodFCGG7CmEZYkdTcc4555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnn
nHPOOeec81l7zTnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPO
Oeecc84555xzzjnnnHPOOeecc84555xzzjnnnHPOOeecc84555xzzufopeTB
Of8fb6rIfb/yzPUMzotzPnsfrf9MtD/njlNs/y/k/9t6rvc/1vfT1nXbnI+X
671+nVMeWycW9/l8FVm/54m6enl08qxSHlsnFr+TZ9KH1vHec++Tb+MUtw85
55P19nruObOQ+Y1z/keeex77OJ8Hu5dm4g==
              "]], {
            Axes -> True, 
             AxesLabel -> {
              "x", "y", "|\[Psi](x,y)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             BoxRatios -> {1, 1, 0.4}, LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             Method -> {"RotationControl" -> "Globe"}, 
             PlotRange -> {{-5, 5}, {-5, 5}, {0, 0.41380285203892786`}}, 
             PlotRangePadding -> {
               Scaled[0.02], 
               Scaled[0.02], Automatic}, Ticks -> 
             False}]}, $CellContext`Measurements = CompressedData["
1:eJyNnU2OG8kRhUm7DTTQgNBo6AI+w3hPnsFHMGB56at4a1+GtR3AnkvoAr3S
SguPBEYm4nv5dVLAoMAqVmVm/Lz3IrLY8+e//fOvf//j6XT60+///et8Ov3h
9+N//v3j36+3Op5+/nu/1Oe//PLj39c6Pz7jvss/vvz4923cX8f79+vzbpzx
/Xoujjd+5n3nPs+LzJvj6Low3zhf65b5XjDejXap8zzCnjeu1/x0lnnW8X//
/fHv+xj/Ps6wE9dDf2DcC/2/sc9t5x+OV/Pj+OJP9dv5sXiL8eW5EY81Du1j
98P+9C/9FH6h/xknktdc37CL2YFxwbjFdbVvrYfxKX6PPKG95TzzJ64zrpjX
9lz6Sfw7xqV9aGfa0eJD/Eo7RlxYPgjO2THu2z1393zGreGM+R34Yf6I50j+
G07qPAzndjzD/LH50Y7GO2UHi1/EYZxnfhgOM/5of+CV5ke32/kQfFBcNrtv
+DbiQfJG9ccmD8PuwpcDzzlP4nzlB46Bu6bLjL9EVxlvhH7b6CfTbRbHsR7j
NdpR7gv+sPg2XKfO4Lhit/j+g3ok5iX2ifUxr8lLdp1xsOHhLU7L9Zi/xO2I
e4lf4o3lb8SBzZfP2R13/jU/7/KQcQbci7hiXPB+8prx205vWP4JL0WeE785
f4tD+n/Hv1zHZv2P6vvQ7+L/G/mT62J9s9EzqkP4fMMPy2upA01/Rv3G++HH
wAvDYcNj8V/kC3Ff4naHY4qjoi+U5x5d/xn2Io9QD/C68JHhXKzf4nfHTzse
l/kZnjBuIy4f1PFxnUfmIfGV9+/qCJs/5wXc0DyQ64bTj+rv+/OHnlb7Uhds
5qH+sDqG8Vvxx+cy7jf6MuZnuGTxZHoR84vxrb7e9PvG+ti/688/Xzd63vhu
xx/m97B/jWPztD7ipg5Q/Of6Kh7X/H2+PooD9L/omJgfcdl4ZtMnis/C/8Fz
6IcRJ5TnrH/K9TG+CyeM18SuwcfCc8rfgqORd7UO2Dv8QF40PYN4V51BfEZc
oq8x7Wf8x/wH/xg/q31qHKxj5PVvP88/HRI/N+IA45TnZV5j/Lou81RcYrzR
TpLnI77qSD5HPRn1PPOj/Mh4qu+xT03/Ef8ZB9R9FpfMY9Mvpjcf1V/WH+D3
pY4a54mP8H/oG9QhEY9Wn5CfJE91/4v5VM8zHWi6y+xFPHjQH8GvzJ/zx+u6
MK6Fp0zvRH5+jNPnK+1PfGR9ys+0N/sDtj9j+5N1P3FQ7tvxr+Lc5rPq6Hq+
8ddunfzM9Um9Krgx9GXYfVeXiI6IvBb8vtFPXc/NuGKcSl9L9ZXlj+lUxi/q
kMBb2r/uZ9244U/dvyNvCZ/YPk3gLsbReGP+yP5v5NGmPtzpvIf7iIZPoq/H
usnbmzoweHXTx7PnsJ4NO1sdJroq4tP8QHzd4ZvEh8XZpfJ1t2+11g+zvqUd
xF6hrzl/qx+F95T/LJ7BW8H3wPfAR9PntK/tN3Fc0f3DvtSP/f6Js32cYd+I
Q6mPFE+IY6YrDR839ZrpReqLiCOe5/cZVxbfoo94PvonHBe8Eflc16U+sv08
9pfj/Rzyz1r/nq/CN5En4Bndp+XzDa9sP4D2Je5K/cc4HvO095vudfPoM6GO
Dj8z/jY4Gvxl/mHe0e6mE6RuiP4Fr9NvkldhP+Jz10ejnjZ9FnUj+EX5mfks
+BH9HfMbcZX+kvfUtu9ZfHxMXlv3O2a+rPX3+YD/tG8g/ZTI09261rww+aXy
ZqMfh3/Wdf+so+u5H+PF7A9z/ps4IS9oP5H68IR5W5+J/R/OV/ongaPWdxY9
Yfvsu75OxJnVN+s4OtPviJ/p100dEfhk/Umx04gv5vWa37MOpU61/Vvur+/6
k+T9NQ+cD+I75hd9SPIf6n/ize79p8Ah4rrEbfiPOhf4oPZj/4K67tH4pf2I
D3We+y+Wl6zPBCfDr8bP9XzxY/ibfSXDZ5mv9amkfnm68/HrPR5LD83+zc9p
fPl0dJ3x+cDx+vPxv7wc5I9u/6f7cz5V/N/n+zLG6Xj8dv/+27Xn+Vt8r9vz
pdZzrfnVOmvePT6fr7SP5Pew6329w061Dsblfdxxvfv5+ah1n+6f+Xzi2/37
1zX+fSo/1HhHH/e1/HvU97o+eqW9I+/LfvU9+H3kbdfXE1fq/H29wz91lHyo
dde4R9mv1k1d2a8n39e8yv+dP550v77f9z7sVnFe/uk8Wnj/irhNu9c4X/q6
RpzX/PD9gW91/dTW9TbitOKR+pN1KPDh2vPsZcRP+QX+uXa8GPaFfd5wnOd7
Hj5ff2vreh9xVHFT9yOuYt+v/Mb5l/1qfnU0nIadjnX8RR2C+16PXpdOHu/4
Unzzhnj4xvEvtH/Pj1nvln9rfPqn/F72J350HfaM/H05Ov98vq7xeeJ/j8+R
fwPvCx95vZ4PvrrCXpwH6tg34MDEGfqLeVvjSr15oV/KrqelXUvfTh4s/xTO
1n1lR86z23fmbY+XV8TBiHvq94G79byed89Ht8vEPeLzGpcHbxffHR1fP0ed
uNZjs05m3vf4nfOm38jP3Y+Dr45dnLIO4f5Z5+Wyx2fi+K38/Ev7/su1r/8l
+leFj3V/zZs4THzq9c/bwfM1D8Yv9WLXpy/jOaxDKk+hRwav9Pz4jjgc+Tj6
4uX/jpvDTwfjpdcbr4MHul3ejo6fr1eZX/S3ut58H/qs/MP6k/jf9es78xC4
Rf8MPTjygvUo4xQ8MdbJ/iJxk+ukfuj5O/AAdp55xj5Rf+7TwP/CobJLzb/i
CjyM+vcT8u8Zfov6D3j/K743dTznj/PFQ+WXyLfiiY6vtY/xfPT8+gr/fRv9
uV2frtclXy/dvq8jD9d9oakj1zz5dJV5od58jfqz1g29EHqX+Ebc5P31ve6H
wV/QOXOfAOuNuF/zD+f/9dZ11rhf9k1fjo95bOIQ62J8pt4IXjVdx7qE9Qzx
ivHY+fVt5EHnrcHzUfdRb5X9OA54Afr1O/ib9fKw14X81evdGWfAxegfsL5g
Hd3Hm32tjmPfRhzz+51XPx2I26PjCXXtqAPHdfAgeeWCdR99XjNPOv9EnwH1
yeyTn9o4uW8DXB+42fuwsz6EvrxiPQP/2Q8g7rPfzef3Pt7Ap+ifWX+24gO4
MI41Ttmv90lmXwPzvnB+1OXsj7H+B+5f6F/2N3vdMtZ/wK7xvhvxHDx77f79
POJkreMKZ6aeRB6Cn6iPno/ux3zPjvnD+qvj0OQ14A76ty/kCerO4WfM70Yc
RzyK3p3vQRdOSj1LHpa+xyt0wNRfrEugw4f963zZb92/fR75T/4u+9b5isuO
I6MvGjqs+232z+o66l7wz+ijwe+TXyp+axzmN/Frrb/S7zXPem7vc8/5k4fv
8R79YeuPgleu/f6voQd7PEwdQftCB0AXPVH/jjxEX5n9Uvwu4jnmU/Fh+ywY
L96n4j6B9IljX5n7bXwu67Ju/9kH5/pZ32CesX/F+VT+IL6ph/g+Ave72afh
+w3gz3gfhe8HRJ9uXYfk789Ez0l/m/V3/H0Iez8wnsN9D9gbeTLjq98/ecvG
L/vWUfoP8R4I7Bb7iIgL9gv0vQMbt/dn38Oe1C2nPh+uT9974/N5H57L+OJ7
AsGb6z7C9NN6P+d7+Bvvn0U8wl7xvgfxg/mCfl28R7Xu92QeUa8xjtZ902nH
in/qKOIFn499CPo96gbyD/U277N8wv544BDzdWf/Wj/jr/P79/gdH/Gi5on7
4v2Bdd8t603ijOUJ8w34NnCj4/g5dCj9wOda/vD9kV38sE9NvqMdzc7MW+Fp
w9cRT4w7zpP6gOthf486gHGKuAsdB97le+UHdAX7FeTVeA9C6ovoS5JPOA/y
E/0B/I33JgV/DLcu9DNxnXkkOutKv9t7D1hHvNdj/EU8XuNY5h/ziOOduj0P
2kX8Q/yLvGR/wHQ07Ux9Cx0Q/uU8BO9CZ9BuxEXGA947IG8aHgceMH93/Mdx
WIcjj+S9zdmXBg/J79rzdzwyb7zHk+tlfSE6PPq6p76ewF1cD525zof0K3Uf
dRLzVOqEyF/Rawf5CfHP+Ve8Bb9IPocu7fv077f1urNeIo5xPVa3sN4UvCWO
hA4kX7C+Yr3O/XXqZ+o44zfiCeMM+8wRn5wH+Z+8bbgMewr/DFwKfUXc5ro3
+jjyYe0n9l3zd+oyL9uvjPcS1vk5cWDz/KgbJd7G+NQ/jDvrM6zrpfgdlOJY
4SPthj5T+Jd5QhyCXo/rwufEO9k/93wWvWj6MfiPuom4Sf8I30T+Gh+bXvgY
H86ik2c+MN7Mf8ZL5HfwOHg+fvdNfw079fvPUW8LD5t/Ih9o/51erHVRxxHH
6nvkTcYtcIPvJQVvW33M/JG+HftV+v4958m+BP1X9qOOWeu8aVfah3jC+BWe
Rp8q9Iv0P6f+WPsp9cC6ns7+RN1P/UrcZv1FP1l8WX1HnkZc636n+Y+6Uvo7
EY/2mfdxHPLsuv+gf/cw9AnjFvwU+Mn4J64Al0IXSZ7sdLnlBesP4lb0t3A+
7MQ6ZK2D8+9j8DrzCzgaffGP+2PB86GP4PeoI7ku2s36bFZf0C/Ib7OL6Y+o
I62/weczntAXi/080Su236e8XH7c1fd8jtQBUr+l/pF8D33L/iTjn/OxfYZ1
vyd/t8/xEefxfMb/xzotf4dP/9q8iM+GS5af7C/XdX7P6kNZV+y/0T+WP8RB
6lDGx7p/4X/f0frhwMdd3Gm9L/HFcWJ8xiPntblf8Yf2Yn6KneL50kcMfS91
oe6fML5Er3K82P/d2Zf7FOu+UP5emfljOtjsJPWu/U6Z+8Lsn8c8GR+cj+BQ
6Cn6kbxMHVPzo10FN3R/G7i0rX8lr4I/1vVj/h0pxhd1xSYeQl8IjkXcEHc5
vuxHmT9i35n6ETox4pr62/xkuCvr4n6G8jt5z/wq+1yR/4zznT4mvrM+FZ1J
fwY+cp0f13UP//+6Ql/QTg/GZxwZp+u+ZOBwnLf6UOqdsAPjwvKYdb3wn+pv
2pF9F8sPxjHnz/yt51h9Qf9afvP51F92NPxhnFp9tu4Dpp+IH8x/4yWLCx5P
63ko/lCnMX+oY5CXob9Zf9NP0v81Xg18oI6yuOc6BD+jf8H6kf6TOiLwWXRd
vD/HdZr9hWdDd5R95D296I/zfqur4X/dr7D8Y51r68G+X+zPSf5t41f6FTv9
bfmmdmP8iM6P+s30PfvixEezP/KPcWD8G/Og34Rvo/61/X3qN4lvrY8kD6PO
pv+E/xRfyMsWH7JvZbhjepr8Y3VbvH9BHcbr1ImnPl6sU+Zh/Ymob1nfW95Q
Zxi+SN0ddZz0Mbf61/QT43+nE40/JM+D70SXxnppf+IA817GsbpX3+/hOJu+
Z/D0Zr9N3hOIuAte+z8hlE+1
          "], $CellContext`width = 
         0.4, $CellContext`xmax = 5, $CellContext`ymax = 
         5, $CellContext`\[Psi]Range = {0.5641895835477563, 
          0.5641895835477563, 0.5641895835477563, 0.5641895835477563, 
          0.5641895835477563}, $CellContext`xmin = -5, $CellContext`ymin = \
-5, $CellContext`$GridOptions = {Background -> GrayLevel[0]}}; 
       Typeset`initDone$$ = True),
      SynchronousInitialization->True,
      UnsavedVariables:>{Typeset`initDone$$},
      UntrackedVariables:>{Typeset`size$$}], "Manipulate",
     Deployed->True,
     StripOnInput->False],
    Manipulate`InterpretManipulate[1]],
   Background->GrayLevel[1],
   FrameMargins->10],
  FrameStyle->Directive[
    AbsoluteThickness[2], 
    RGBColor[0.6666666666666666, 0.6666666666666666, 0.6666666666666666]],
  RoundingRadius->10,
  StripOnInput->False]], "PluginEmbeddedContent"]
},
WindowSize->{1348, 822},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (July 22, \
2012)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[1235, 30, 995603, 16463, 822, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature RxDF0G2BbHnQ#B1uefJZyelD *)
