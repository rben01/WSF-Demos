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
NotebookDataLength[      7017,        167]
NotebookOptionsPosition[      7312,        158]
NotebookOutlinePosition[      7784,        179]
CellTagsIndexPosition[      7741,        176]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  TagBox[
   StyleBox[
    DynamicModuleBox[{$CellContext`k$$ = 1, $CellContext`t$$ = 160, 
     Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
     Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
     1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
        Hold[$CellContext`k$$], 1, 
        Style["Fourier Mode", {10, FontFamily -> "Helvetica", 
          GrayLevel[1]}]}, {
       1 -> "n = 1", 3 -> "n = 3", 5 -> "n = 5", 7 -> "n = 7", 9 -> 
        "n = 9"}}, {
       Hold[$CellContext`t$$], -2.49}, {{
        Hold[$CellContext`t$$], -2.49, 
        Style["Add this mode to the sum", {10, FontFamily -> "Helvetica", 
          GrayLevel[1]}]}, -2.49, 2.5}}, Typeset`size$$ = {
     607.701171875, {594., 196.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
     Typeset`skipInitDone$$ = False, $CellContext`k$45348$$ = 
     False, $CellContext`t$45349$$ = 0}, 
     DynamicBox[Manipulate`ManipulateBoxes[
      1, StandardForm, 
       "Variables" :> {$CellContext`k$$ = 1, $CellContext`t$$ = -2.49}, 
       "ControllerVariables" :> {
         Hold[$CellContext`k$$, $CellContext`k$45348$$, False], 
         Hold[$CellContext`t$$, $CellContext`t$45349$$, 0]}, 
       "OtherVariables" :> {
        Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
         Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
         Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
         Typeset`initDone$$, Typeset`skipInitDone$$}, 
       "Body" :> (
        If[$CellContext`k$$ != $CellContext`lastMode, $CellContext`t$$ = \
$CellContext`tmin; $CellContext`lastMode = $CellContext`k$$]; (Row[{
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
                  Cos[Pi $CellContext`k$$ \
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
$CellContext`t$$]}]}]}, ImageSize -> 600]}, #]& )[
          Apply[Sequence, $CellContext`$GridOptions]]), 
       "Specifications" :> {{{$CellContext`k$$, 1, 
           Style["Fourier Mode", {10, FontFamily -> "Helvetica", 
             GrayLevel[1]}]}, {
          1 -> "n = 1", 3 -> "n = 3", 5 -> "n = 5", 7 -> "n = 7", 9 -> 
           "n = 9"}}, 
         Delimiter, {$CellContext`t$$, -2.49, ControlType -> 
          None}, {{$CellContext`t$$, -2.49, 
           Style["Add this mode to the sum", {10, FontFamily -> "Helvetica", 
             GrayLevel[1]}]}, -2.49, 2.5, AnimationRate -> 0.25, ControlType -> 
          Trigger, AppearanceElements -> {"PlayPauseButton", "ResetButton"}}},
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
      ImageSizeCache->{628., {447., 452.}},
      SingleEvaluation->True],
     Deinitialization:>None,
     DynamicModuleValues:>{},
     Initialization:>({$CellContext`lastMode = 1, $CellContext`t$$ = 
        160, $CellContext`tmin = -2.49, $CellContext`fAmp[
          Pattern[$CellContext`n, 
           Blank[]]] := ((2 $CellContext`A)/(Pi $CellContext`n)) 
         Sin[(Pi $CellContext`n)/2], $CellContext`A = 3, $CellContext`L = 
        2, $CellContext`xmin = -2.5, $CellContext`xmax = 
        2.5, $CellContext`$PlotOptions = {PlotStyle -> {{
             GrayLevel[1], 
             Thickness[0.007], 
             Opacity[0.7]}}, Background -> GrayLevel[0], 
          TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
            FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
            GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
          BaseStyle -> {
            GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
          FillingStyle -> Directive[
            Opacity[0.5], 
            GrayLevel[1]]}, $CellContext`partialSum[
          Pattern[$CellContext`i$, 
           Blank[]], 
          Pattern[$CellContext`x$, 
           Blank[]]] := 
        Sum[$CellContext`fAmp[FE`k$$131] 
          Cos[Pi FE`k$$131 ($CellContext`x$/$CellContext`L)], {
          FE`k$$131, 1, $CellContext`i$}], 
        Attributes[$CellContext`x$] = {Temporary}, FE`k$$131 = 
        1, $CellContext`$GridOptions = {Background -> GrayLevel[0]}}; 
      Typeset`initDone$$ = True),
     SynchronousInitialization->True,
     UnsavedVariables:>{Typeset`initDone$$},
     UntrackedVariables:>{Typeset`size$$}], "Manipulate",
    Deployed->True,
    StripOnInput->False],
   Manipulate`InterpretManipulate[1]],
  Background->GrayLevel[0],
  StripOnInput->False]], "PluginEmbeddedContent"]
},
WindowSize->{642, 911},
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
Cell[1235, 30, 6073, 126, 911, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature RxTwvSfM6oMP3DKoB4Na7BNA *)
