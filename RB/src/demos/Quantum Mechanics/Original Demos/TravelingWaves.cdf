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
NotebookDataLength[      5229,        131]
NotebookOptionsPosition[      5535,        123]
NotebookOutlinePosition[      5997,        143]
CellTagsIndexPosition[      5954,        140]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`f$$ = Sin[#]& , $CellContext`t$$ = 
      0, $CellContext`v$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`f$$], Sin[#]& , "Type of wave"}, {(Sin[#]& ) -> 
         "Sine wave", (SquareWave[#]& ) -> "Square Wave", (TriangleWave[#]& ) -> 
         "Triangle wave"}}, {{
         Hold[$CellContext`t$$], 0, "time"}, 0, 10}, {{
         Hold[$CellContext`v$$], 1, "velocity"}, 1, 10, 2}, {{
         Hold[$CellContext`t$$], 0, 
         Style["Begin wave propagation", FontSize -> 15]}, 0, 10}}, 
      Typeset`size$$ = {360., {104., 112.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`f$915$$ = False, $CellContext`t$916$$ = 
      0, $CellContext`v$917$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`f$$ = Sin[#]& , $CellContext`t$$ = 
          0, $CellContext`v$$ = 1}, "ControllerVariables" :> {
          Hold[$CellContext`f$$, $CellContext`f$915$$, False], 
          Hold[$CellContext`t$$, $CellContext`t$916$$, 0], 
          Hold[$CellContext`v$$, $CellContext`v$917$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> $CellContext`Waves[$CellContext`f$$, $CellContext`t$$, \
$CellContext`v$$], 
        "Specifications" :> {{{$CellContext`f$$, Sin[#]& , 
            "Type of wave"}, {(Sin[#]& ) -> "Sine wave", (SquareWave[#]& ) -> 
            "Square Wave", (TriangleWave[#]& ) -> 
            "Triangle wave"}}, {{$CellContext`t$$, 0, "time"}, 0, 
           10}, {{$CellContext`v$$, 1, "velocity"}, 1, 10, 2}, 
          Delimiter, {{$CellContext`t$$, 0, 
            Style["Begin wave propagation", FontSize -> 15]}, 0, 10, 
           ControlType -> Trigger, 
           AppearanceElements -> {"PlayPauseButton", "ResetButton"}}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{383., {187., 194.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`Waves[
           Pattern[$CellContext`f, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`v, 
            Blank[]]] := (Plot[
           Evaluate[
            $CellContext`f[
             $CellContext`d[$CellContext`x, $CellContext`t, \
$CellContext`v]]], {$CellContext`x, 0, 10}, ExclusionsStyle -> Blue, 
           PlotRange -> {{0, 10}, {-1, 1}}, #]& )[
           Sequence[$CellContext`$PlotOptions]], $CellContext`d[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`v, 
            
            Blank[]]] = -($CellContext`t $CellContext`v) + $CellContext`x, \
$CellContext`$PlotOptions = {PlotStyle -> {
             GrayLevel[1], 
             Thickness[0.007], 
             Opacity[0.7]}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}}}; 
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
WindowSize->{425, 421},
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
Cell[1235, 30, 4296, 91, 421, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Yu0MYXITnzPqBB1VPZjHs#wl *)
