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
NotebookDataLength[      9647,        205]
NotebookOptionsPosition[      9952,        197]
NotebookOutlinePosition[     10414,        217]
CellTagsIndexPosition[     10371,        214]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`f$$ = 1, $CellContext`tt$$ = 0, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`f$$], 1}, {
        1 -> "Wavefunction 1", 2 -> "Wavefunction 2", 3 -> 
         "Wavefunction 3"}}, {{
         Hold[$CellContext`tt$$], 0, "time"}, 0, 0.1, 0.02}}, 
      Typeset`size$$ = {360., {210., 214.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`f$815729$$ = False, $CellContext`tt$815730$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`f$$ = 1, $CellContext`tt$$ = 0}, 
        "ControllerVariables" :> {
          Hold[$CellContext`f$$, $CellContext`f$815729$$, False], 
          Hold[$CellContext`tt$$, $CellContext`tt$815730$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> 
        GraphicsColumn[{
           (Plot[{
             ReplaceAll[
              
              Part[$CellContext`wfL, $CellContext`f$$], {$CellContext`t -> \
$CellContext`tt$$}], 
             ReplaceAll[
              
              Part[$CellContext`wfL, $CellContext`f$$], {$CellContext`t -> \
$CellContext`tt$$ + 0.02}]}, {$CellContext`x, 0, 1}, 
            PlotRange -> {{0, 1}, {0, 7}}, PlotStyle -> {
              Directive[Thick, White, 
               Thickness[0.007], 
               Opacity[0.7]], 
              Directive[Dashed, White, 
               Thickness[0.005], 
               Opacity[0.5]]}, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           RectangleChart[
            Table[{0.05, 
              
              Part[$CellContext`ProbabilityChanges, $CellContext`f$$, \
($CellContext`tt$$ + 0.02) 50, $CellContext`i]}, {$CellContext`i, 1, 20}], 
            BarSpacing -> None, ColorFunction -> 
            Function[{$CellContext`w, $CellContext`h}, 
              Which[$CellContext`h < 0, Blue, $CellContext`h > 0, Red]], 
            ColorFunctionScaling -> False, 
            PlotRange -> {{0, 1}, {-0.25, 0.25}}]}], 
        "Specifications" :> {{{$CellContext`f$$, 1}, {
           1 -> "Wavefunction 1", 2 -> "Wavefunction 2", 3 -> 
            "Wavefunction 3"}}, {{$CellContext`tt$$, 0, "time"}, 0, 0.1, 
           0.02}, Delimiter}, "Options" :> {Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{380., {255., 262.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`wfL = {
          Abs[Sqrt[2] E^((2 I) Pi^2 $CellContext`t) Sin[2 Pi $CellContext`x] + 
              Sqrt[2] E^(((9 I)/2) Pi^2 $CellContext`t) 
               Sin[3 Pi $CellContext`x] + 
              Sqrt[2] E^((8 I) Pi^2 $CellContext`t) 
               Sin[4 Pi $CellContext`x]]^2/3, 
           Abs[Sqrt[2] E^((2 I) Pi^2 $CellContext`t) Sin[2 Pi $CellContext`x] + 
              Sqrt[2] E^(((9 I)/2) Pi^2 $CellContext`t) 
               Sin[3 Pi $CellContext`x] + 
              Sqrt[2] E^(((25 I)/2) Pi^2 $CellContext`t) 
               Sin[5 Pi $CellContext`x]]^2/2, 
           Abs[Sqrt[2] E^((I/2) Pi^2 $CellContext`t) Sin[2 Pi $CellContext`x] + 
              Sqrt[2] E^((8 I) Pi^2 $CellContext`t) Sin[4 Pi $CellContext`x] + 
              Sqrt[2] E^(((25 I)/2) Pi^2 $CellContext`t) 
               Sin[5 Pi $CellContext`x]]^2/2}, $CellContext`$PlotOptions = {
          PlotStyle -> {
             GrayLevel[1], 
             Thickness[0.007], 
             Opacity[0.7]}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> 
             "Helvetica"}}, $CellContext`ProbabilityChanges = CompressedData["
1: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
          "]}; Typeset`initDone$$ = True),
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
WindowSize->{422, 557},
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
Cell[1235, 30, 8713, 165, 557, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature ewDDv07zUmSopA1hR#lKXiMF *)
