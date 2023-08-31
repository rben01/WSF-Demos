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
NotebookDataLength[     75251,       1335]
NotebookOptionsPosition[     75543,       1326]
NotebookOutlinePosition[     76016,       1347]
CellTagsIndexPosition[     75973,       1344]
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
      1292., {198., 203.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`dist$224962$$ = 
      False, $CellContext`NumMeasurements$224963$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`dist$$ = 
          1, $CellContext`NumMeasurements$$ = 100}, 
        "ControllerVariables" :> {
          Hold[$CellContext`dist$$, $CellContext`dist$224962$$, False], 
          
          Hold[$CellContext`NumMeasurements$$, \
$CellContext`NumMeasurements$224963$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> (If[
           
           And[$CellContext`expRunning == 
            1, $CellContext`t < $CellContext`NumMeasurements$$], \
$CellContext`t = $CellContext`t + 1, 
           
           If[$CellContext`expRunning == 1, $CellContext`expRunning = 0; 
            Null]]; If[
           
           Or[$CellContext`lastDist != $CellContext`dist$$, \
$CellContext`lastNum != $CellContext`NumMeasurements$$], $CellContext`t = 
            0; $CellContext`expRunning = 
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
                Histogram[
                 Sort[
                  Take[
                   
                   Part[$CellContext`Measurements, $CellContext`dist$$], \
$CellContext`t]], {$CellContext`width}, 
                 
                 Function[{$CellContext`bins$, $CellContext`counts$}, \
$CellContext`counts$/($CellContext`NumMeasurements$$ $CellContext`width)]], 
                Graphics[{
                  Opacity[0.7], Blue, 
                  Disk[{
                    
                    Part[$CellContext`Measurements, $CellContext`dist$$, \
$CellContext`t], 0.02}, {($CellContext`xmax - $CellContext`xmin) 
                    0.01, (1.3 
                    Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2 + 
                    0.1) 0.018}]}], 
                Graphics[
                 Text[
                  Style[
                   StringJoin["Measurement ", 
                    ToString[$CellContext`t]], FontSize -> 
                   15], {$CellContext`xmax/2, (-0.25) 
                   Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}]]}, 
               PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, {(-0.5) 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2, 1.3 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}}, 
               ImageSize -> 600]}}, #]& )[
            Apply[Sequence, $CellContext`$GridOptions]], 
           (GraphicsGrid[{{
              GraphicsColumn[{
                Part[$CellContext`\[Psi]Plots, $CellContext`dist$$], 
                Part[$CellContext`ProbPlots, $CellContext`dist$$]}], 
              Show[{
                Part[$CellContext`ProbPlots, $CellContext`dist$$], 
                Histogram[
                 Sort[
                  Take[
                   
                   Part[$CellContext`Measurements, $CellContext`dist$$], \
$CellContext`t]], {$CellContext`width}, 
                 
                 Function[{$CellContext`bins$, $CellContext`counts$}, \
$CellContext`counts$/($CellContext`NumMeasurements$$ $CellContext`width)]], 
                Graphics[
                 Text[
                  Style[
                   StringJoin["Measurement ", 
                    ToString[$CellContext`t]], FontSize -> 
                   15], {$CellContext`xmax/2, (-0.25) 
                   Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}]]}, 
               PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, {(-0.5) 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2, 1.3 
                  Part[$CellContext`\[Psi]Range, $CellContext`dist$$]^2}}, 
               ImageSize -> 600]}}, #]& )[
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
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1312., {271., 276.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`expRunning = 0, $CellContext`t = 
         0, $CellContext`lastDist = 1, $CellContext`lastNum = 
         100, $CellContext`\[Psi]Plots = {
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1: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
+87/A8kQOqo=
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {"x", "\[Psi](x)"}, AxesOrigin -> {0, 0}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {-0.9764632078044253, 
               0.9764632078044253}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1: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
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {"x", "\[Psi](x)"}, AxesOrigin -> {0, 0}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {-0.9764632078044253, 
               0.9764632078044253}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxTTMoPSmViYGAwAWIQXfvc99P//8IH+D09koRtr9hPKUnwbpiN4K9mLF7C
YI7gs6a6G0nGCsH5wjeO5iyaKAjnBx2elax5SgDOr35vmzPhMT+cv6N8VtZ6
fz44329SqMK/mTxwvvvcvX4eb7jg/GXHK68VR3PC+XEtU0TPr2CH8+sSmNdx
C7PB+Qy68vudW1ng/FvdM9tXX2WC82W4MlZ+cWKE87NNtVhvy/zfD+Mnm99b
cfjwbzhfq8Lqf96SH3D+wrvBRyodv8L5zxtFbdwlPsH5u6ZquL4IewvnG7y8
+UV/7jM432XXbc6/YQ/g/IKV638ICl+G88PSlBdeqtkJ5x8/c7PLOHiHPYxv
pXtwU8D0y3A+U5nonRTJB3A+O09AY9K7Z3B+84NrzkWL38L5G2a3BdR9+gjn
5y9KEXgS9hXOj8uaJdve+APO7wwsszSe8xvOZxGZ+qz+1z84//rp1g8t/IwO
MH5odZLZrMNMcH4O92ulc1EscL786mPT2F6xwvnVO5yD+Wezw/kFy3K2melz
wvk8TOZJek+54HzX3JCpWpN54HyJnbL5rip8cP6koo6JBtf54fygNn/dudsE
4Hyt6JbQJbWCcP61Z5yLJocKwfnnkp46CskLw/lqSyWlOvsRfGh+gfMB0u0/
xQ==
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {"x", "\[Psi](x)"}, AxesOrigin -> {0, 0}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {-0.9764632078044253, 
               0.9764632078044253}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxN1X0wG3YYB/AkBCHzWq14KVUNtYUW47wNI+KqyBhWRTVelymKFaMqrZfq
XFUU85I5L828nLJeKW4rrddj0456TbdGtYmXab1lgpJtd/V7+tw999zn7vnj
+8dz9xxhxHqH4zAYDOu//n9eFnqsSSRq3Zj3JUg9KOK9A3sqv9h8sAXWs47b
jV0HP77BluMLwHImk4e7fwffTgxxzygHN2ITajFWYHw4zYwUpIqsNtUXXV2g
guzdUxZ6fEgZOfWtffStOSXk9qQyZrOXIuRl++rtlRKRaZxfPd3+lkfmDqRM
JJwlIAdn3lZ/UieLnB4idVdBTQa55Qnt5jMi+OVneTEcGbCrjrqp6TYeWXGG
3OI9C/7R59S90mZwl2tBm+Fp8FrrePEKFWxwTDOpwwF8XarGyt0cTO++3x6j
CeZbT3W2zksjYyi6Xc5Z4LSDTsFZ6eBNCWO3Pwn8ZpRre4oJ5iWbtNO9wH4M
uj/bDTzqHv/PmBN48HCbhb8F2EVuauwHCrhrdSt+hgxu67X/OYgENrt7jl6p
Cm4qYb3lK4CNWDU39fHgWmYfJWxPqnt6uavvWOVzh3J7QrRwBcxW9mhgzoEz
2p6RLw6CLwQG1iQ1gQ02visqcALPfF+a0ziOQ94ZytCgE8Ha8lH1G59jkb/5
1BjP05Z07TvU6q+6np4dZONkG0lMrRi56k+f3hQnEbKQpW5H01hD7iwyos77
LSOfWJjeMOUIkF06eYRdPz5yXH2zWEVtDNkv4mjVaFoH8sBv0zfMfdod9m1D
eXSPXjKGjLuk/jyMxEeWJdJZjDcC5Gv8Cef4mmXklvJsevraKnJsdZjyKz8R
cjCzTCeHJUbO/eKStXnFDrL0gSLBle095MnhrJVMJazjvouPJhbmL4B9UxmW
ZT045IDKzJORx6WQQ3q4n1jkg0PHrRo0H4MjhIOGWBGYS0jdDNoBCz+mDHRi
pR3RvXm+KD4kB46KK4hIVATXsZ0t/zgAnr8vwptogb/eOnNHaAhu0CJ+62IC
XrR/6FJlAWZe1X8V4ASOVljSHwkAL6V0Siuc/2B/PldAiwRH9hk1PEoAM65E
nGzNA59Zn3WoeAh25U0FMvXxyLqN/cUyi+DUdmcfpXJZ5DhudJulKQGZiLNi
mLyWR6Ze+LLIuJCIrNGhE0s1UERmx18vODGphOyd7UXhtCkjG5/N9K29rII8
ISBUF/qqIo8wXjup6qohz0r/JC7SB29wo5pJZDBpaUn7CAUclrC2aWoL3r4m
afLwB5PvkDRz88HWNN5TYiH49EJFzq1i8EWKnqiEA/6llfyU2wj27jfP7h0A
h0eJ7NyGwcnyD9aHR8AcT5vzY+Pg+QlHu5dzH+RNxq2HC8EfafXWLyyCzc7R
Dq2ugqlYwkiiCPxVzVCmWAxmUvNs096B3/9/5H8BWfmVNg==
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {"x", "\[Psi](x)"}, AxesOrigin -> {0, 0}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {-0.9764632078044253, 
               0.9764632078044253}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxN1X0wGwYUAPAIKSETZFrpmI91Dl1Qivk6OiW2thjFNqOtok4zUtS0lClC
dVsRHxPS87XUxzrmzudV1RinOrqaqJrWx8RX6YS0EV/b7uq9vrt3735/vHvv
7v3x9IOjvEOJBAIh5b/8v16ZPSHe2aHdI7wOUcJeydgm2kPt2avmdbSeLXsr
ahX9a1au0oQIrWQ68u6939F5saePfVOMrpWLqSTYoEmhTAt6oAaY9vg3VnmO
Oti7i3fW+L4aOOGFIyt7mgpu+ZoXUeepivvm+uptF1HATH67h/tzZbCg95Iw
JoAMDkrL0xysUgQnnZb/WYW2B0xg6Ha4pCuAn1wvyqgdJoK1lcOr1z6SA5+3
MiGNae907Dqa1Horjoq+PMz8RIOIzroYeuPj2W1wTWMpveUX9LzVPtN8N/Q5
awV/T/YWOHIPd30hGB0n1C/h+KI5cU6T7XZoQdPl8x+Q0DPWK8lk3ib4rM3T
qq6uDXBYlY2fWzM6gp4j31eDZm+4BA3koBM7qmmjp9DJ5vKdAT7oq2VfRj51
Q2emUvumGeg85sWk5Q0ZuLBl4OCFF2iesdHo6hSaz0vhxAnRpSpjlut96IrE
w5MJ7WjB0nffb9eja4Jm7VMqZR3RadLYFc6k0+1B53n5H9BtXMFN1TB0jz/l
JP0wWnquwvgoax1sEm+3E1kpBYtMes+siV+Cy8Z9ui8dkYBnUzQdmFpinJdv
5DrntwQ2nx9dM+OLwEfbxshbfhNgdnWdVJ02BPYLe6/sUWIruPfBaJalT4vT
ru0YnQ1ehUNgYpzmXyH0CbAixSsleFkETp0QukRXLIHrizleSeIVcFR5iNrf
fhJwGGenwOr5S3BQBE8nI0UKNg7JOWDhvg5eC8w8OK4qw35tt6UMZ/ToE/k6
i2i0RtsUVek6+nhRJ3u8Aj2ndEjfvV7mtHvf9PjSPxruoA3mqFd1+tB3/ZMt
MofRAb3LU+JJtNQ6iBu4jD6013HNQnEDXPmnrHH8Q/S1T+NsLUvQuQ9MWD9V
o0uYz26+34yud3RX0HqEfmy8f3BTcRNsRLwb0hOD7mkgZX9+bAus8Ha+KFm2
DR7pT/8njSrnvGvfhGBrXhcRzFJZNBj4QgGsW9tTsGeBBE5ocfGhFiuC2QJW
k7UZGUwh2gSbziiDXb86mW/CpYC1WnWiXA+ognOjM3PMR6hgb44ng9+kBjYJ
SPOtvKIOForI5VxfDfBA8MwRDV0aeFLhljTfAL0mCK+jG6Lpi4va+gx0SIz4
lZk9Wpa6c/uEP9rwR/r+azfQtsyxhxQu+vh8SUZ2AfoCQ09SyEffaTR8KKhF
e/dYcrp70aHhEgf3fnS8cvNq/wCa72F3ZmgYPSd0dpiafmPfeOJq6Cz6rXe6
q+cX0BanmPtWVtCucuSBWAn6s4r7aVIpOsL1W/vETfTr/w/+Fw8cnOA=
                
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {"x", "\[Psi](x)"}, AxesOrigin -> {0, 0}, 
             Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {-0.9764632078044253, 
               0.9764632078044253}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> 
                "Helvetica"}}}]}, $CellContext`ProbPlots = {
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1: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
1CdQujgvZDgUM/bO/ygjaoLX8W+LnTwoupjM+nU3NoKqcd3h9i8oLukKn7Sp
NcLGptO67gcpflS+eOqqdwPsUFFI9vJb2Z0zL6Rq9eBZ8ti235+iZ4PrWcNQ
PgS6JM9+FUxx31hlcMTTOriYoXI4KIKi8zb5JGEJD/K2CnTGoyg+FNYYpxny
4O6fqe3hsSv+ipQSCrfUQq8etY09RVFxVmZ/vvkDMM7X1klOXfnH6XGcT6yB
Txx721TSKfZ13ov/sLQa9gxfPXsxk2JrdaeR1/MqCDPbOJN1jeLhXvf5Fpe7
kNA6UKSbS/G5n5nlzfRKyAzL873BpRjYerwhR1QBv1Uat90qorjMsRxgnyyH
Vo+hxA9KKfK3NFsfeVYGgwuFUFJGsXck46iadRkoMmZFlTUU6y5deN6x5ldw
fWSZ2PCY4mjAmXJ+bTH4+c/Y7GymmBYRLD5R9wtEK1dNNQsojly64ZLaXATX
nK0PdTyl+NhiSHJ5rhDuTCxqefRQvMb4zClrFwI/7YHgmYhiLXe66Q+7Ahjq
QpvBvyjSEyIn54Jb8Dp69ZTfK4rb6h+GZr/MB1XdhsLhEYpuxwr0nEzywcLb
UUsqpThpPG2tV58HO2SUBMdmKN4b8+0Xrs8Dz7wnCfPzFPdEaR3YdOwmBO5I
2R63RPG75YhN/3Tmwn89Gvy/R/MvhB1STQ==
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {
              "x", "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             AxesOrigin -> {0, 0}, Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {0, 0.7334464586120832}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1: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
BW0RKyu43fTuHAr+jvvf/wHH/wPQHasL
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {
              "x", "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             AxesOrigin -> {0, 0}, Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {0, 0.7334464586120832}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxTTMoPSmViYGAwAWIQXfvc99P//8IHZs0EgZ32U0oSvBtmI/irGYuXMJgj
+Kyp7kaSsUJwvvCNozmLJgrC+UGHZyVrnhKA86vf2+ZMeMwP5+8on5W13p8P
zvebFKrwbyYPnO8+d6+fxxsuOH/Z8cprxdGccH5cyxTR8yvY4fy6BOZ13MJs
cD6Drvx+51YWOP9W98z21VeZ4HwZroyVX5wY4fxsUy3W2zL/98P4yeb3Vhw+
/BvO16qw+p+35Aecv/Bu8JFKx69w/vNGURt3iU9w/q6pGq4vwt7C+QYvb37R
n/sMznfZdZvzb9gDOL9g5fofgsKX4fywNOWFl2p2wvnHz9zsMg7eYQ/jW+ke
3BQw/TKcz1QmeidF8gGcz84T0Jj07hmc3/zgmnPR4rdw/obZbQF1nz7C+fmL
UgSehH2F8+OyZsm2N/6A8zsDyyyN5/yG81lEpj6r//UPzr9+uvVDCz+jA4wf
Wp1kNuswE5yfw/1a6VwUC5wvv/rYNLZXrHB+9Q7nYP7Z7HB+wbKcbWb6nHA+
D5N5kt5TLjjfNTdkqtZkHjhfYqdsvqsKH5w/qahjosF1fjg/qM1fd+42AThf
K7oldEmtIJx/7RnnosmhQnD+uaSnjkLywnC+2lJJqc5+BB+aX+B8AL6DsE0=

                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {
              "x", "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             AxesOrigin -> {0, 0}, Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {0, 0.7334464586120832}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxN1X0wG3YYB/AkBCHzWq14KVULtYUW47yNjIirImNYFdV4XaYoVjqq0nqp
zlVFMS9Zz0szL6esVyluK63XsWlHvVS2NapNvKytt0xQsper39Pv3XPPfe6e
P54/nrvnADPBLwqHwWDY/9Z//bzYe0Um0+rGvI0ofa9E8Abso/50/e4G2Mg+
cTthFfzgCkdJKAIrWUzu7/4VfD0l3CurEtyETa7D2IHxUXQrUqgmstZUX1xN
kQayX09FxKEhdeT0185x12bVkNtTK1gtvqqwLyfAaKeciEzn/uTj+ZcyMm/g
3ETyCQJyWPZ17Yf1isiZ4XK3VLQUkFsf0q8+JoKffVwQz1UAexhoW1pu4pFV
p8mtfjPg7/yP3i5vAXd5FPFNj4FX2sZLl2hgk/d1UztcwJflau28rMGM7jvt
8bpgof1UZ9ucPDKGYtjllgPO2EsNy8kEr8uY2/2p4FejPMejLLAgzaKd4QsO
ZDKCOJ7gUa+kv8eo4MH9fJsgG7C70tTYtxRw1/JG0jQZzO91/iGUBLa6dZJx
QxPcXMZ+LVQBm7FrrxrjwXWsPkrkjlx3+f/52aXSmRAnXgJz1L0bWbPgLP5j
8plB8OmQkNrUZrDJ2tclRVTw9DfleU3jOOStoSwdBhGsrxzbsPYJFvnLj8zx
An1Z164j7P6s7+nZQjZPc5DF10mRq//w7z1HlSCL2dpOdJ0V5M4SM9pc4Evk
w/NP1iy5ImT3TgFhO1CInNjQItXQGkMOjD5YPZrRgTzwy5Mr1v7tLrt2oNy/
zSgbQ8ad1f49kiREViQy2MxXIuRLwgm3pNqXyK2VuYzMlWXkhJpI9eeBEuQw
VoVBHluKnP/pWXvrqi1k+T0logubO8iTwzlL2WpY112XHkwpLpwHB6QzbSt6
cMjBN7KPxBySQw7v4X1oUwiOGLdr1H0AjhYPmmIlYB4hfT10Cyz+gDLQiZV3
Rffm87R0nxI4NrEoOkUVXM9xs/1tD3jujgRvoQf+YuP4TbEpuFGP+JW7BXjB
+Z57tQ2YddH4eTAVHKeyaDwSDF481ymvcuqd+bl8ET0GHNNn1ng/Gcy8EH2k
rQB8fHXGpeoe2EMwFcIyxiMbNvWXKiyA09vd/NUqFZETeXF8W0sCMhFnx7R4
oYxMO/1ZiXkxEVmnwyCBZqKKzEm6XHR4Ug3ZL9eXwuWrI5ufyA6oO6+BPCEi
1BQHaCKPMF9QNQ21kGfkv5eWGIPXeLEtJDKYtLiof4ACjkxeWbd0BG9ekjV7
B4HJN0m6+YVge7rgEbEYfGy+Ku9aKfgMxUhSxgX/2EZ+xGsC+/Vb5/YOgKNi
JU6ew+A05burwyNgro/DqbFx8NyEq9Oz2Xf2TcOtRonB7+n1NswvgK1O0vct
L4NpWMJIigT8ee1QtlQKZtEKHDPegN/+f+R/AI/qgR8=
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {
              "x", "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             AxesOrigin -> {0, 0}, Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {0, 0.7334464586120832}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> "Helvetica"}}}], 
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.7], 
               Line[CompressedData["
1:eJxN1WkwHAYUAOC1dt212EpsSh1NDVJHVlDXkAqrTYIStFWSbBAjipBsJYQK
lkjbYB21bMbVjaMpNeOciChlRLrSqBVRiaPWFVLHJmsd22Ym3uubefPm+/Hm
vZn34xkyY3zDiAQCIfW/fF2vzB5flcmo9whvQpS4Rzy2hfbSePaqZQNtYB+7
HbOG/jU7T2lChFayGHn33u/o/Aunjn5Tgq6Ti68i2KHJYQw6LVgLTH38W1RF
ribYt5t7xvS+BjjxhXNUzjQF3Po1N7LeWx33zfM32ClWAzN4HV6ez1XA/L5L
wvggZXBIer72YLUiOPmU/M+qVAUwwVy/0y2DBH5yvTizbpgI1lWJqFn/SA58
zsaMPKYr69x1HLntFouCvjzM+ESLiM6+GHbj49kdcG1TGa31F/S8zV6LAg/0
WVtSoHfsNjhagbOxwESzhIalbH80m+Uy2eGA5jdfPvcBGT1ju5KizN0Cn7F7
Wt3dvQkOr7YL8GhBR9Jy5ftr0bGbbiGCXHRSZw119CQ6xUq+K8gPfbX8y+in
HuisNEr/tDk6n3ExeXlTCi5qFRw4/wLNNTUZXZtC87ipbJYQXaY6Zr3Rj65M
OjSZ2IHmL333/U4DujZk1jG1StpJt34dQy63B13n5X9At3P4N9XD0b2Baido
h9CSs5WmR6I2wGYJDrLoKglYZNZ3en31Jbh83K/n0mExeDZV24mhs4rzCkzc
5wKWwFbzo+uWPBH4SPuY8nbABDi2pl6iSR0CB4S/V/4oqQ3c92A029qv1WXX
DuZdjT5FQ2AiS/uvUNoEWFHNJ5W5LAKnTQjd4iqXwA0lbJ/k1RVwTEWoxt8B
YnA4W1Zo8/wlOCSSq5eZKgGbhubup3tugNeDsw6Mq0uxX9djKdMVPfpEvp4e
h9Zqn6IoXUcfK+6KHa9EzykdNPRskLrs3jcjoeyPxjtooznKVb1+9N3AFHrW
MDqob3lqdRItsQ3hBC+jD+5xXqcrboKr/pQ2jX+IvvYpy966FJ33wCzqpxp0
KePZzfdb0A3OniSdR+jHpvsGtxS3wCbEu6G98ejeRnLO50e3waS3C0Qp0h3w
yEDGP+kUOddd+ycybbndRHCU6qKR4AsSWL+ut1BhgQxObHXzo5QogmP5Uc22
lspgNaId02JGBez+1YkCM44aWKdNL8Z9vzo4Ly4r12qEAvZle5vzmjXAZkHp
/lVXNMFCkXIFx18LLGDOHNbSp4InSbckBUbodX5EPc0YTVtc1DU0R4fGr76y
dERL02S3jweijX+k7bt2A23PGHuoxkEfmy/NzClEnzc3EBfx0HeajB/y69C+
vdbsnj50WITYyXMAnaDSsjYgQPO8HE4PDaPnhK5OU9P/2zeBuBY2i37rnZ6a
+QU0/SRj78oK2l1OWXBBjP6s8n66RIKOdP/WMWkL/eb/g/8FFddOQg==
                
                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesLabel -> {
              "x", "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
             AxesOrigin -> {0, 0}, Background -> GrayLevel[0], BaseStyle -> {
               GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
             LabelStyle -> {
               GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
             PlotRange -> {{-5, 5}, {0, 0.7334464586120832}}, 
             PlotRangeClipping -> True, PlotRangePadding -> {
               Scaled[0.02], Automatic}, Ticks -> False, 
             TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
               FontSize -> 12, FontFamily -> 
                "Helvetica"}}}]}, $CellContext`Measurements = CompressedData["

1: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
          "], $CellContext`width = 
         0.4, $CellContext`xmax = 
         5, $CellContext`xmin = -5, $CellContext`\[Psi]Range = {
          0.7511255444649425, 0.7511255444649425, 0.7511255444649425, 
          0.7511255444649425, 
          0.7511255444649425}, $CellContext`$GridOptions = {
          Background -> GrayLevel[0]}}; Typeset`initDone$$ = True),
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
WindowSize->{1348, 581},
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
Cell[1235, 30, 74304, 1294, 581, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature PxDI6XBYP@dKKB1t7hkfG8oo *)
