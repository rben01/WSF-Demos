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
NotebookDataLength[      6746,        165]
NotebookOptionsPosition[      7050,        157]
NotebookOutlinePosition[      7513,        177]
CellTagsIndexPosition[      7470,        174]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`\[Alpha]$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[$CellContext`\[Alpha]$$], 1, 10}, {
        Hold[
         Button["Grab Data", 
          
          AppendTo[$CellContext`listData, {$CellContext`\[Alpha]$$, (
             Pi/$CellContext`\[Alpha]$$)^Rational[1, 2]}]]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      1158., {181., 184.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`\[Alpha]$122512$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`\[Alpha]$$ = 1}, 
        "ControllerVariables" :> {
          Hold[$CellContext`\[Alpha]$$, $CellContext`\[Alpha]$122512$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> ($CellContext`verticalLine = Graphics[
            
            Line[{{$CellContext`\[Alpha]$$, 0}, {$CellContext`\[Alpha]$$, 
               2}}]]; GraphicsGrid[{{
             If[Length[$CellContext`listData] > 0, 
              GraphicsColumn[{
                Show[{
                  (
                  Plot[(Pi/$CellContext`x)^
                   Rational[1, 2], {$CellContext`x, 0, 10}, ImageSize -> 500, 
                   PlotRange -> {0, 2}, PlotStyle -> {Black, Dashed}, #]& )[
                   Sequence[$CellContext`$PlotOptions]], 
                  (
                  ListPlot[$CellContext`listData, ImageSize -> 500, Filling -> 
                   Axis, DataRange -> {0, 10}, PlotRange -> {0, 2}, 
                   PlotMarkers -> {
                    Graphics[
                    Disk[]], 0.05}, #]& )[
                   Sequence[$CellContext`$PlotOptions]], 
                  Graphics[
                   Text[
                    Style[
                    "The dashed curve is the function y = \
\!\(\*SqrtBox[FractionBox[\(\[Pi]\), \(\[Alpha]\)]]\)", 
                    FontSize -> $CellContext`fs], {
                    5, 1.5}]], $CellContext`verticalLine}]}], 
              GraphicsColumn[{
                Show[{
                  (
                  Plot[(Pi/$CellContext`x)^
                   Rational[1, 2], {$CellContext`x, 0, 10}, ImageSize -> 500, 
                   PlotRange -> {0, 2}, PlotStyle -> {Black, Dashed}, #]& )[
                   Sequence[$CellContext`$PlotOptions]], 
                  Graphics[
                   Text[
                    Style[
                    "The dashed curve is the function y = \
\!\(\*SqrtBox[FractionBox[\(\[Pi]\), \(\[Alpha]\)]]\)", 
                    FontSize -> $CellContext`fs], {
                    5, 1.5}]], $CellContext`verticalLine}]}]], 
             GraphicsColumn[{
               Show[{
                 (Plot[
                 E^((-$CellContext`\[Alpha]$$) $CellContext`x^2), \
{$CellContext`x, -5, 5}, Filling -> Axis, PlotRange -> {0, 1}, ImageSize -> 
                  500, #]& )[
                  Sequence[$CellContext`$PlotOptions]], 
                 Graphics[
                  Text[
                   Style[
                    StringJoin["Area Under Curve = ", 
                    ToString[
                    NumberForm[
                    N[(Pi/$CellContext`\[Alpha]$$)^Rational[1, 2]], {3, 2}]]],
                     FontSize -> $CellContext`fs], {3, 0.5}]], 
                 Graphics[
                  Text[
                   Style[
                    StringJoin[
                    "Plotting y = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \
\(\(-\[Alpha]\)\\ \*SuperscriptBox[\(x\), \(2\)]\)]\)  for \[Alpha] = ", 
                    ToString[
                    NumberForm[
                    N[$CellContext`\[Alpha]$$], {3, 2}]]], 
                    FontSize -> $CellContext`fs], {3, 0.8}]]}]}]}}]), 
        "Specifications" :> {{$CellContext`\[Alpha]$$, 1, 10}, Delimiter, 
          Button["Grab Data", 
           
           AppendTo[$CellContext`listData, {$CellContext`\[Alpha]$$, (
              Pi/$CellContext`\[Alpha]$$)^Rational[1, 2]}]]}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1178., {259., 268.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`verticalLine = Graphics[
           Line[{{5.64, 0}, {5.64, 2}}]], $CellContext`listData = {{3.27, 
          0.9801692192399751}, {5.64, 
          0.7463377077709148}}, $CellContext`$PlotOptions = {PlotStyle -> {
             RGBColor[0, 0, 1]}, 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, 
           LabelStyle -> {FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
            FontSize -> 18, FontFamily -> "Helvetica"}}, $CellContext`fs = 
         15}; Typeset`initDone$$ = True),
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
WindowSize->{1220, 567},
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
Cell[1235, 30, 5811, 125, 567, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature mv0WIpU6bZI14CwRhMdl8TES *)
