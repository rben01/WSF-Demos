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
NotebookDataLength[      9740,        202]
NotebookOptionsPosition[     10034,        193]
NotebookOutlinePosition[     10507,        214]
CellTagsIndexPosition[     10464,        211]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`a0$$ = 0, $CellContext`a1$$ = 
      0, $CellContext`a2$$ = 0, $CellContext`a3$$ = 0, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`a0$$], 0, "Constant"}, -1, 1}, {{
         Hold[$CellContext`a1$$], 0, "\.08\.08Linear"}, -1, 1}, {{
         Hold[$CellContext`a2$$], 0, "Quadratic"}, -0.3, 0.3}, {{
         Hold[$CellContext`a3$$], 0, "Cubic"}, -0.1, 0.1}}, Typeset`size$$ = {
      1229., {400.90625, 406.09375}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`a0$217964$$ = 0, $CellContext`a1$217965$$ = 
      0, $CellContext`a2$217966$$ = 0, $CellContext`a3$217967$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`a0$$ = 0, $CellContext`a1$$ = 
          0, $CellContext`a2$$ = 0, $CellContext`a3$$ = 0}, 
        "ControllerVariables" :> {
          Hold[$CellContext`a0$$, $CellContext`a0$217964$$, 0], 
          Hold[$CellContext`a1$$, $CellContext`a1$217965$$, 0], 
          Hold[$CellContext`a2$$, $CellContext`a2$217966$$, 0], 
          Hold[$CellContext`a3$$, $CellContext`a3$217967$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> Grid[{{
            (
            Plot[{$CellContext`a0$$ 
               Part[$CellContext`functions, 1] + $CellContext`a1$$ 
               Part[$CellContext`functions, 2] + $CellContext`a2$$ 
               Part[$CellContext`functions, 3] + $CellContext`a3$$ 
               Part[$CellContext`functions, 4], 
              
              If[-$CellContext`L <= $CellContext`x <= $CellContext`L, 
               0]}, {$CellContext`x, $CellContext`xmin, $CellContext`xmax}, 
             Filling -> {1 -> {2}}, FillingStyle -> {
               Opacity[0.3, White]}, 
             PlotRange -> {$CellContext`plotMin, $CellContext`plotMax}, 
             PlotLabel -> "Original Function", ImageSize -> 300, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            (Plot[
             Evaluate[
              
              ReplaceAll[{$CellContext`a0$$ 
                 Part[$CellContext`functions, 1] + $CellContext`a1$$ 
                 Part[$CellContext`functions, 2] + $CellContext`a2$$ 
                 Part[$CellContext`functions, 3] + $CellContext`a3$$ 
                 Part[$CellContext`functions, 
                   4]}, {$CellContext`x -> $CellContext`x - 
                 Floor[($CellContext`x + $CellContext`L)/(2 $CellContext`L)] (
                  2 $CellContext`L)}]], {$CellContext`x, $CellContext`xmin, \
$CellContext`xmax}, PlotRange -> {$CellContext`plotMin, $CellContext`plotMax},
              Exclusions -> None, PlotLabel -> "Periodic Version", ImageSize -> 
             300, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            (
            ListPlot[$CellContext`a0$$ 
              Part[$CellContext`cosCoefficients, 1] + $CellContext`a1$$ 
              Part[$CellContext`cosCoefficients, 2] + $CellContext`a2$$ 
              Part[$CellContext`cosCoefficients, 3] + $CellContext`a3$$ 
              Part[$CellContext`cosCoefficients, 4], 
             PlotRange -> {$CellContext`fourierModePlotMin, \
$CellContext`fourierModePlotMax}, Filling -> Axis, Ticks -> {
               
               Table[{$CellContext`i, ""}, {$CellContext`i, 
                 1, $CellContext`numTerms}], {}}, PlotLabel -> 
             "Cosine Amplitudes", ImageSize -> 300, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            (
            ListPlot[$CellContext`a0$$ 
              Part[$CellContext`sinCoefficients, 1] + $CellContext`a1$$ 
              Part[$CellContext`sinCoefficients, 2] + $CellContext`a2$$ 
              Part[$CellContext`sinCoefficients, 3] + $CellContext`a3$$ 
              Part[$CellContext`sinCoefficients, 4], 
             PlotRange -> {$CellContext`fourierModePlotMin, \
$CellContext`fourierModePlotMax}, Filling -> Axis, Ticks -> {
               Table[{$CellContext`i, ""}, {$CellContext`i, 
                 2, $CellContext`numTerms}], {}}, PlotLabel -> 
             "Sine Amplitudes", ImageSize -> 300, #]& )[
             Sequence[$CellContext`$PlotOptions]]}, {
            (Plot[
             
             Sum[($CellContext`a0$$ 
                 Part[$CellContext`cosCoefficients, 
                   1, $CellContext`i] + $CellContext`a1$$ 
                 Part[$CellContext`cosCoefficients, 
                   2, $CellContext`i] + $CellContext`a2$$ 
                 Part[$CellContext`cosCoefficients, 
                   3, $CellContext`i] + $CellContext`a3$$ 
                 Part[$CellContext`cosCoefficients, 4, $CellContext`i]) 
               Cos[($CellContext`i - 1) $CellContext`x] + ($CellContext`a0$$ 
                 Part[$CellContext`sinCoefficients, 
                   1, $CellContext`i] + $CellContext`a1$$ 
                 Part[$CellContext`sinCoefficients, 
                   2, $CellContext`i] + $CellContext`a2$$ 
                 Part[$CellContext`sinCoefficients, 
                   3, $CellContext`i] + $CellContext`a3$$ 
                 Part[$CellContext`sinCoefficients, 4, $CellContext`i]) 
               Sin[($CellContext`i - 1) $CellContext`x], {$CellContext`i, 
               1, $CellContext`numTerms}], {$CellContext`x, \
$CellContext`xmin, $CellContext`xmax}, 
             PlotRange -> {$CellContext`plotMin, $CellContext`plotMax}, 
             PlotLabel -> "\nFirst 10 Terms in Fourier Series\n", ImageSize -> 
             800, #]& )[
             Sequence[$CellContext`$PlotOptions]], SpanFromLeft, SpanFromLeft,
             SpanFromLeft}}, Dividers -> {False, Center}, Frame -> All, 
          ItemSize -> {{35, 35, 35, 35}}], 
        "Specifications" :> {{{$CellContext`a0$$, 0, "Constant"}, -1, 
           1}, {{$CellContext`a1$$, 0, "\.08\.08Linear"}, -1, 
           1}, {{$CellContext`a2$$, 0, "Quadratic"}, -0.3, 
           0.3}, {{$CellContext`a3$$, 0, "Cubic"}, -0.1, 0.1}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1249., {477., 483.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`functions = {
          1, $CellContext`x, $CellContext`x^2, $CellContext`x^3}, \
$CellContext`L = Pi, $CellContext`xmin = (-2) Pi, $CellContext`xmax = 
         2 Pi, $CellContext`plotMin = -10, $CellContext`plotMax = 
         10, $CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`cosCoefficients = {{1, 
           0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {
           Pi^2/3, -4, 1, (-4)/9, 1/4, (-4)/25, 1/9, (-4)/49, 1/16, (-4)/81, 
            1/25}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
           0}}, $CellContext`fourierModePlotMin = -3, \
$CellContext`fourierModePlotMax = 3, $CellContext`numTerms = 
         10, $CellContext`sinCoefficients = {{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
           0}, {0, 2, -1, 2/3, (-1)/2, 2/5, (-1)/3, 2/7, (-1)/4, 2/9, (-1)/
            5}, {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}, {
           0, 2 (-6 + Pi^2), (6 - 4 Pi^2)/4, (2 (-6 + 9 Pi^2))/
            27, (6 - 16 Pi^2)/32, (2 (-6 + 25 Pi^2))/125, (6 - 36 Pi^2)/
            108, (2 (-6 + 49 Pi^2))/343, (6 - 64 Pi^2)/
            256, (2 (-6 + 81 Pi^2))/729, (6 - 100 Pi^2)/500}}}; 
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
WindowSize->{1285, 994},
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
Cell[1235, 30, 8795, 161, 994, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 8vpjI45D5gLF3DwI96XdJTaH *)
