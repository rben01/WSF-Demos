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
NotebookDataLength[     11481,        265]
NotebookOptionsPosition[     11785,        257]
NotebookOutlinePosition[     12247,        277]
CellTagsIndexPosition[     12204,        274]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`p0$$ = 0, $CellContext`x0$$ = 
      0, $CellContext`\[Sigma]p$$ = 0.8, $CellContext`\[Sigma]x$$ = 1.25, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{
        Hold[
         Text[
          Style[
          "Modify the properties of the Gaussian in position space", 
           FontFamily -> "Helvetica"]]], Manipulate`Dump`ThisIsNotAControl}, {{
         Hold[$CellContext`x0$$], 0, 
         Style[
         "Mean of Gaussian in x - space", {10, FontFamily -> "Helvetica", 
           RGBColor[0, 0, 
            Rational[2, 3]]}]}, -3, 3}, {{
         Hold[$CellContext`\[Sigma]x$$], 1.25, 
         Style[
         "Width of Gaussian in x - space", {10, FontFamily -> "Helvetica", 
           RGBColor[0, 0, 
            Rational[2, 3]]}]}, 0.5, 2.}, {
        Hold[
         Text[
          Style[
          "Modify the properties of the Gaussian in momentum space", 
           FontFamily -> "Helvetica"]]], Manipulate`Dump`ThisIsNotAControl}, {{
         Hold[$CellContext`p0$$], 0, 
         Style[
         "Mean of Gaussian in p - space", {10, FontFamily -> "Helvetica", 
           RGBColor[0, 0, 
            Rational[2, 3]]}]}, -3, 3}, {{
         Hold[$CellContext`\[Sigma]p$$], 0.8, 
         Style[
         "Width of Gaussian in p - space", {10, FontFamily -> "Helvetica", 
           RGBColor[0, 0, 
            Rational[2, 3]]}]}, 0.5, 2.}}, Typeset`size$$ = Automatic, 
      Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`x0$100769$$ = 0, $CellContext`\[Sigma]x$100770$$ = 
      0, $CellContext`p0$100771$$ = 0, $CellContext`\[Sigma]p$100772$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`p0$$ = 0, $CellContext`x0$$ = 
          0, $CellContext`\[Sigma]p$$ = 0.8, $CellContext`\[Sigma]x$$ = 1.25},
         "ControllerVariables" :> {
          Hold[$CellContext`x0$$, $CellContext`x0$100769$$, 0], 
          Hold[$CellContext`\[Sigma]x$$, $CellContext`\[Sigma]x$100770$$, 0], 
          Hold[$CellContext`p0$$, $CellContext`p0$100771$$, 0], 
          Hold[$CellContext`\[Sigma]p$$, $CellContext`\[Sigma]p$100772$$, 0]},
         "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> (If[
           
           Or[$CellContext`p0$$ != $CellContext`lastp0, \
$CellContext`\[Sigma]p$$ != $CellContext`last\[Sigma]p], $CellContext`x0$$ = \
$CellContext`\[Theta]p; $CellContext`\[Sigma]x$$ = 
            1/$CellContext`\[Sigma]p$$; $CellContext`\[Theta]x = \
-$CellContext`p0$$; $CellContext`phasex = $CellContext`phasep + \
$CellContext`p0$$ $CellContext`\[Theta]p; $CellContext`lastx0 = \
$CellContext`x0$$; $CellContext`last\[Sigma]x = $CellContext`\[Sigma]x$$; \
$CellContext`lastp0 = $CellContext`p0$$; $CellContext`last\[Sigma]p = \
$CellContext`\[Sigma]p$$; Null]; If[
           
           Or[$CellContext`x0$$ != $CellContext`lastx0, \
$CellContext`\[Sigma]x$$ != $CellContext`last\[Sigma]x], $CellContext`p0$$ = \
-$CellContext`\[Theta]x; $CellContext`\[Sigma]p$$ = 
            1/$CellContext`\[Sigma]x$$; $CellContext`\[Theta]p = \
$CellContext`x0$$; $CellContext`phasep = $CellContext`phasex + \
$CellContext`x0$$ $CellContext`\[Theta]x; $CellContext`lastx0 = \
$CellContext`x0$$; $CellContext`last\[Sigma]x = $CellContext`\[Sigma]x$$; \
$CellContext`lastp0 = $CellContext`p0$$; $CellContext`last\[Sigma]p = \
$CellContext`\[Sigma]p$$; Null]; Show[{
            GraphicsRow[{
              (
              Plot[$CellContext`Ax $CellContext`\[Psi][$CellContext`x, \
$CellContext`x0$$, $CellContext`\[Sigma]x$$], {$CellContext`x, \
$CellContext`xmin, $CellContext`xmax}, PlotRange -> {0, 1}, 
               ColorFunctionScaling -> False, ColorFunction -> {
                 Function[{$CellContext`x$, $CellContext`y$}, 
                  ColorData["Rainbow"][
                  Mod[$CellContext`p0$$ ($CellContext`\[Theta]x - \
$CellContext`x$) + $CellContext`phasep, 2 Pi]/(2 Pi)]]}, 
               Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                  2, $CellContext`xmax/2, $CellContext`xmax}, {0.5, 1}}, 
               ImageSize -> 600, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              (
              Plot[$CellContext`Ap $CellContext`\[Phi][$CellContext`p, \
$CellContext`p0$$, $CellContext`\[Sigma]p$$], {$CellContext`p, \
$CellContext`pmin, $CellContext`pmax}, PlotRange -> {0, 1}, 
               ColorFunctionScaling -> False, ColorFunction -> {
                 Function[{$CellContext`p$, $CellContext`y$}, 
                  ColorData["Rainbow"][
                  Mod[$CellContext`x0$$ ($CellContext`\[Theta]x + \
$CellContext`p$) + $CellContext`phasex, 2 Pi]/(2 Pi)]]}, 
               Ticks -> {{$CellContext`pmin, $CellContext`pmin/
                  2, $CellContext`pmax/2, $CellContext`pmax}, {0.5, 1}}, 
               ImageSize -> 600, #]& )[
               Sequence[$CellContext`$PlotOptions]]}]}]), "Specifications" :> {
          Text[
           Style[
           "Modify the properties of the Gaussian in position space", 
            FontFamily -> "Helvetica"]], {{$CellContext`x0$$, 0, 
            Style[
            "Mean of Gaussian in x - space", {10, FontFamily -> "Helvetica", 
              RGBColor[0, 0, 
               Rational[2, 3]]}]}, -3, 3}, {{$CellContext`\[Sigma]x$$, 1.25, 
            Style[
            "Width of Gaussian in x - space", {10, FontFamily -> "Helvetica", 
              RGBColor[0, 0, 
               Rational[2, 3]]}]}, 0.5, 2.}, Delimiter, 
          Text[
           Style[
           "Modify the properties of the Gaussian in momentum space", 
            FontFamily -> "Helvetica"]], {{$CellContext`p0$$, 0, 
            Style[
            "Mean of Gaussian in p - space", {10, FontFamily -> "Helvetica", 
              RGBColor[0, 0, 
               Rational[2, 3]]}]}, -3, 3}, {{$CellContext`\[Sigma]p$$, 0.8, 
            Style[
            "Width of Gaussian in p - space", {10, FontFamily -> "Helvetica", 
              RGBColor[0, 0, 
               Rational[2, 3]]}]}, 0.5, 2.}}, "Options" :> {Paneled -> False},
         "DefaultOptions" :> {}],
       ImageSizeCache->{374., {180., 189.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`lastp0 = 0, $CellContext`last\[Sigma]p = 
         0.8, $CellContext`\[Theta]p = 0, $CellContext`\[Theta]x = 
         0, $CellContext`phasex = 0, $CellContext`phasep = 
         0, $CellContext`lastx0 = 0, $CellContext`last\[Sigma]x = 
         1.25, $CellContext`Ax = 1, $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`x0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]x, 
            Blank[]], 
           Pattern[$CellContext`\[Theta]x, 
            Blank[]], 
           Pattern[$CellContext`Ax, 
            Blank[]]] = 
         E^(-($CellContext`x - $CellContext`x0)^2/(
           2 $CellContext`\[Sigma]x^2)), $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`x0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]x, 
            Blank[]], 
           Pattern[$CellContext`Ax, 
            Blank[]]] = 
         1.3335000000000001`/
          E^(($CellContext`x - $CellContext`x0)^2/(
           2 $CellContext`\[Sigma]x^2)), $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`x0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]x, 
            Blank[]]] = 
         1/(E^(($CellContext`x - $CellContext`x0)^2/(
            2 $CellContext`\[Sigma]x^2)) 
          Sqrt[2 Pi] $CellContext`\[Sigma]x), $CellContext`xmin = -6, \
$CellContext`xmax = 6, $CellContext`$PlotOptions = {PlotStyle -> {
             GrayLevel[1], 
             Thickness[0.007], 
             Opacity[0.7]}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> 
             "Helvetica"}}, $CellContext`Ap = 1, $CellContext`\[Phi][
           Pattern[$CellContext`p, 
            Blank[]], 
           Pattern[$CellContext`p0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]p, 
            Blank[]], 
           Pattern[$CellContext`\[Theta]p, 
            Blank[]], 
           Pattern[$CellContext`Ap, 
            Blank[]]] = (1. Hold[1. $CellContext`Ap])/
          E^(($CellContext`p - $CellContext`p0)^2/(
           2 $CellContext`\[Sigma]p^2)), $CellContext`\[Phi][
           Pattern[$CellContext`p, 
            Blank[]], 
           Pattern[$CellContext`p0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]p, 
            Blank[]], 
           Pattern[$CellContext`Ap, 
            Blank[]]] = 
         2.3336250000000005`/
          E^(($CellContext`p - $CellContext`p0)^2/(
           2 $CellContext`\[Sigma]p^2)), $CellContext`\[Phi][
           Pattern[$CellContext`p, 
            Blank[]], 
           Pattern[$CellContext`p0, 
            Blank[]], 
           Pattern[$CellContext`\[Sigma]p, 
            Blank[]]] = 
         1/(E^(($CellContext`p - $CellContext`p0)^2/(
            2 $CellContext`\[Sigma]p^2)) 
          Sqrt[2 Pi] $CellContext`\[Sigma]p), $CellContext`pmin = -6, \
$CellContext`pmax = 6}; Typeset`initDone$$ = True),
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
WindowSize->{416, 409},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"8.0 for Microsoft Windows (64-bit) (October 6, 2011)",
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
Cell[1235, 30, 10546, 225, 409, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature oxTPvfVYKGr2oB14mC3qvJtS *)
