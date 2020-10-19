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
NotebookDataLength[      6937,        164]
NotebookOptionsPosition[      7240,        156]
NotebookOutlinePosition[      7703,        176]
CellTagsIndexPosition[      7660,        173]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`k$$ = 1, $CellContext`t$$ = -2.49, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`k$$], 1, "Fourier Mode"}, {
        1 -> "n = 1", 3 -> "n = 3", 5 -> "n = 5", 7 -> "n = 7", 9 -> 
         "n = 9"}}, {
        Hold[$CellContext`t$$], -2.49}, {{
         Hold[$CellContext`t$$], -2.49, 
         Style["Add this mode to the sum", FontSize -> 15]}, -2.49, 2.5}}, 
      Typeset`size$$ = {642., {400., 403.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`k$141336$$ = False, $CellContext`t$141337$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`k$$ = 1, $CellContext`t$$ = -2.49}, 
        "ControllerVariables" :> {
          Hold[$CellContext`k$$, $CellContext`k$141336$$, False], 
          Hold[$CellContext`t$$, $CellContext`t$141337$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`k$$ != $CellContext`lastMode, $CellContext`t$$ = \
$CellContext`tmin; $CellContext`lastMode = $CellContext`k$$]; Show[{
            GraphicsColumn[{
              Show[{
                (
                Plot[$CellContext`fAmp[$CellContext`k$$] 
                 Cos[Pi $CellContext`k$$ ($CellContext`x/$CellContext`L)], \
{$CellContext`x, $CellContext`xmin, $CellContext`xmax}, 
                 PlotRange -> {-3, 3}, #]& )[
                 Sequence[$CellContext`$PlotOptions]], 
                Graphics[{Thick, 
                  
                  Line[{{$CellContext`t$$, 
                    0}, {$CellContext`t$$, $CellContext`fAmp[$CellContext`k$$]
                     Cos[
                    Pi $CellContext`k$$ \
($CellContext`t$$/$CellContext`L)]}}]}], 
                Graphics[{
                  PointSize[Large], 
                  
                  Point[{$CellContext`t$$, $CellContext`fAmp[$CellContext`k$$]
                     Cos[Pi $CellContext`k$$ \
($CellContext`t$$/$CellContext`L)]}]}]}, ImageSize -> 600], 
              Show[{
                (Plot[
                 $CellContext`partialSum[$CellContext`k$$ - 
                  1, $CellContext`x], {$CellContext`x, $CellContext`xmin, \
$CellContext`xmax}, PlotRange -> {-3, 3}, #]& )[
                 Sequence[$CellContext`$PlotOptions]], 
                (Plot[
                 $CellContext`partialSum[$CellContext`k$$, $CellContext`x], \
{$CellContext`x, $CellContext`xmin, $CellContext`t$$}, 
                 PlotRange -> {-3, 3}, #]& )[
                 Sequence[$CellContext`$PlotOptions]], 
                Graphics[{Thick, 
                  Line[{{$CellContext`t$$, 
                    $CellContext`partialSum[$CellContext`k$$ - 
                    1, $CellContext`t$$]}, {$CellContext`t$$, 
                    $CellContext`partialSum[$CellContext`k$$, \
$CellContext`t$$]}}]}], 
                Graphics[{
                  PointSize[Large], 
                  Point[{$CellContext`t$$, 
                    $CellContext`partialSum[$CellContext`k$$, \
$CellContext`t$$]}]}]}, ImageSize -> 600]}]}]), 
        "Specifications" :> {{{$CellContext`k$$, 1, "Fourier Mode"}, {
           1 -> "n = 1", 3 -> "n = 3", 5 -> "n = 5", 7 -> "n = 7", 9 -> 
            "n = 9"}}, 
          Delimiter, {$CellContext`t$$, -2.49, ControlType -> 
           None}, {{$CellContext`t$$, -2.49, 
            Style["Add this mode to the sum", FontSize -> 15]}, -2.49, 2.5, 
           AnimationRate -> 0.25, ControlType -> Trigger, 
           AppearanceElements -> {"PlayPauseButton", "ResetButton"}}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{662., {476., 485.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`lastMode = 
         1, $CellContext`tmin = -2.49, $CellContext`fAmp[
           Pattern[$CellContext`n, 
            Blank[]]] := ((2 $CellContext`A)/(Pi $CellContext`n)) 
          Sin[(Pi $CellContext`n)/2], $CellContext`A = 3, $CellContext`L = 
         2, $CellContext`xmin = -2.5, $CellContext`xmax = 
         2.5, $CellContext`$PlotOptions = {PlotStyle -> {
             GrayLevel[1]}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> 
             "Helvetica"}}, $CellContext`partialSum[
           Pattern[$CellContext`i$, 
            Blank[]], 
           Pattern[$CellContext`x$, 
            Blank[]]] := 
         Sum[$CellContext`fAmp[FE`k$$222] 
           Cos[Pi FE`k$$222 ($CellContext`x$/$CellContext`L)], {
           FE`k$$222, 1, $CellContext`i$}], 
         Attributes[$CellContext`i$] = {Temporary}, 
         Attributes[$CellContext`x$] = {Temporary}, FE`k$$222 = 1}; 
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
WindowSize->{704, 1001},
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
Cell[1235, 30, 6001, 124, 1001, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature tv0uRdaAIqvKkA12sF0pKaVj *)
