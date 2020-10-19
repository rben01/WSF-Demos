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
NotebookDataLength[      8560,        187]
NotebookOptionsPosition[      8864,        179]
NotebookOutlinePosition[      9327,        199]
CellTagsIndexPosition[      9284,        196]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`c$$ = 0, $CellContext`d1$$ = 
      1, $CellContext`d2$$ = 1, $CellContext`m1$$ = 0, $CellContext`m2$$ = 0, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`c$$], 0, "Correlation of Particles"}, -1.5, 1.5, 
        0.1}, {{
         Hold[$CellContext`d1$$], 1, "Spread of Particle 1"}, 1, 3, 0.1}, {{
         Hold[$CellContext`d2$$], 1, "Spread of Particle 2"}, 1, 3, 0.1}, {{
         Hold[$CellContext`m1$$], 0, "Mean Position of Particle 1"}, -2, 2, 
        0.1}, {{
         Hold[$CellContext`m2$$], 0, "Mean Position of Particle 2"}, -2, 2, 
        0.1}}, Typeset`size$$ = {1000., {256., 261.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`c$25241$$ = 0, $CellContext`d1$25242$$ = 
      0, $CellContext`d2$25243$$ = 0, $CellContext`m1$25244$$ = 
      0, $CellContext`m2$25245$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`c$$ = 0, $CellContext`d1$$ = 
          1, $CellContext`d2$$ = 1, $CellContext`m1$$ = 0, $CellContext`m2$$ = 
          0}, "ControllerVariables" :> {
          Hold[$CellContext`c$$, $CellContext`c$25241$$, 0], 
          Hold[$CellContext`d1$$, $CellContext`d1$25242$$, 0], 
          Hold[$CellContext`d2$$, $CellContext`d2$25243$$, 0], 
          Hold[$CellContext`m1$$, $CellContext`m1$25244$$, 0], 
          Hold[$CellContext`m2$$, $CellContext`m2$25245$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> GraphicsRow[{
           Show[{
             (Plot3D[{
               PDF[
                $CellContext`TwoPartGauss[$CellContext`m1$$, \
$CellContext`m2$$, $CellContext`d1$$, $CellContext`d2$$, $CellContext`c$$], \
{$CellContext`x, $CellContext`y}]}, {$CellContext`x, -10, 
               10}, {$CellContext`y, -10, 10}, 
              PlotRange -> {{-10, 10}, {-10, 10}, {0, 0.5}}, ImageSize -> 
              600, #]& )[
              Sequence[$CellContext`$Plot3DOptions]], 
             ParametricPlot3D[{$CellContext`u, 10, 
               PDF[
                MarginalDistribution[
                 $CellContext`TwoPartGauss[$CellContext`m1$$, \
$CellContext`m2$$, $CellContext`d1$$, $CellContext`d2$$, $CellContext`c$$], 
                 1], $CellContext`u]}, {$CellContext`u, -10, 10}, PlotRange -> 
              Full, PlotStyle -> Directive[White, Thickness -> 0.005]], 
             ParametricPlot3D[{10, $CellContext`u, 
               PDF[
                MarginalDistribution[
                 $CellContext`TwoPartGauss[$CellContext`m1$$, \
$CellContext`m2$$, $CellContext`d1$$, $CellContext`d2$$, $CellContext`c$$], 
                 2], $CellContext`u]}, {$CellContext`u, -10, 10}, PlotRange -> 
              Full, PlotStyle -> Directive[White, Thickness -> 0.005]]}], 
           Show[{
             
             ParametricPlot[{$CellContext`u, ((-$CellContext`c$$) \
$CellContext`m1$$ + 
                2 $CellContext`d1$$^2 $CellContext`m2$$ + $CellContext`c$$ \
$CellContext`u + ((-$CellContext`c$$^2) $CellContext`d1$$^2 + 
                  4 $CellContext`d1$$^4 $CellContext`d2$$^2 + \
$CellContext`c$$^2 $CellContext`m1$$^2 - 
                  4 $CellContext`d1$$^2 $CellContext`d2$$^2 \
$CellContext`m1$$^2 - 2 $CellContext`c$$^2 $CellContext`m1$$ $CellContext`u + 
                  8 $CellContext`d1$$^2 $CellContext`d2$$^2 $CellContext`m1$$ \
$CellContext`u + $CellContext`c$$^2 $CellContext`u^2 - 
                  4 $CellContext`d1$$^2 $CellContext`d2$$^2 $CellContext`u^2)^
                 Rational[1, 2])/(
               2 $CellContext`d1$$^2)}, {$CellContext`u, -10, 10}, PlotStyle -> 
              Directive[Black, Thickness -> 0.005, Dashed], 
              PlotRange -> {{-6, 6}, {-6, 6}}, ImageSize -> 600], 
             (
             ParametricPlot[{$CellContext`u, ((-$CellContext`c$$) \
$CellContext`m1$$ + 
                2 $CellContext`d1$$^2 $CellContext`m2$$ + $CellContext`c$$ \
$CellContext`u - ((-$CellContext`c$$^2) $CellContext`d1$$^2 + 
                 4 $CellContext`d1$$^4 $CellContext`d2$$^2 + \
$CellContext`c$$^2 $CellContext`m1$$^2 - 
                 4 $CellContext`d1$$^2 $CellContext`d2$$^2 \
$CellContext`m1$$^2 - 2 $CellContext`c$$^2 $CellContext`m1$$ $CellContext`u + 
                 8 $CellContext`d1$$^2 $CellContext`d2$$^2 $CellContext`m1$$ \
$CellContext`u + $CellContext`c$$^2 $CellContext`u^2 - 
                 4 $CellContext`d1$$^2 $CellContext`d2$$^2 $CellContext`u^2)^
                Rational[1, 2])/(
               2 $CellContext`d1$$^2)}, {$CellContext`u, -10, 10}, PlotRange -> 
              Full, PlotStyle -> 
              Directive[Black, Thickness -> 0.005, Dashed], #]& )[
              Sequence[$CellContext`$PlotParametricOptions]]}]}, ImageSize -> 
          1000], "Specifications" :> {{{$CellContext`c$$, 0, 
            "Correlation of Particles"}, -1.5, 1.5, 0.1, ContinuousAction -> 
           False}, {{$CellContext`d1$$, 1, "Spread of Particle 1"}, 1, 3, 0.1,
            ContinuousAction -> 
           False}, {{$CellContext`d2$$, 1, "Spread of Particle 2"}, 1, 3, 0.1,
            ContinuousAction -> 
           False}, {{$CellContext`m1$$, 0, "Mean Position of Particle 1"}, -2,
            2, 0.1, ContinuousAction -> 
           False}, {{$CellContext`m2$$, 0, "Mean Position of Particle 2"}, -2,
            2, 0.1, ContinuousAction -> False}}, 
        "Options" :> {ControlPlacement -> Top, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1020., {344., 351.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`TwoPartGauss[
           Pattern[$CellContext`m1, 
            Blank[]], 
           Pattern[$CellContext`m2, 
            Blank[]], 
           Pattern[$CellContext`dev1, 
            Blank[]], 
           Pattern[$CellContext`dev2, 
            Blank[]], 
           Pattern[$CellContext`corr, 
            Blank[]]] := 
         MultinormalDistribution[{$CellContext`m1, $CellContext`m2}, \
{{$CellContext`dev1^2, $CellContext`corr/2}, {$CellContext`corr/
             2, $CellContext`dev2^2}}], $CellContext`$Plot3DOptions = {
          PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> 
           GrayLevel[1]}, $CellContext`$PlotParametricOptions = {}}; 
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
WindowSize->{1062, 735},
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
Cell[1235, 30, 7625, 147, 735, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Iv07QiRZyRh@SDwzXwj9AEzO *)
