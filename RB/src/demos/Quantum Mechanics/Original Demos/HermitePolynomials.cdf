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
NotebookDataLength[      4276,        113]
NotebookOptionsPosition[      4582,        105]
NotebookOutlinePosition[      5044,        125]
CellTagsIndexPosition[      5001,        122]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`n$$ = 0, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[
         Button[
         "Next Hermite polynomial", $CellContext`n$$ = $CellContext`n$$ + 1; 
          Null]], Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Button["Reset", $CellContext`n$$ = 0; Null]], 
        Manipulate`Dump`ThisIsNotAControl}, {{
         Hold[$CellContext`n$$], 0, "n"}, 0, 7, 1}}, Typeset`size$$ = {
      360., {57., 62.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`n$92396$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`n$$ = 0}, 
        "ControllerVariables" :> {
          Hold[$CellContext`n$$, $CellContext`n$92396$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (If[$CellContext`n$$ == 8, $CellContext`n$$ = 0; Null]; 
         GraphicsRow[{
            (Plot[
             
             HermiteH[$CellContext`n$$, $CellContext`x], {$CellContext`x, -2, 
              2}, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            (Plot[
             
             HermiteH[$CellContext`n$$, $CellContext`x], {$CellContext`x, -5, 
              5}, PlotRange -> {{-5, 5}, {-1000, 1000}}, #]& )[
             Sequence[$CellContext`$PlotOptions]]}]), 
        "Specifications" :> {Delimiter, 
          Button[
          "Next Hermite polynomial", $CellContext`n$$ = $CellContext`n$$ + 1; 
           Null], 
          Button[
          "Reset", $CellContext`n$$ = 0; Null], {{$CellContext`n$$, 0, "n"}, 
           0, 7, 1}}, "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{380., {120., 127.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}}; Typeset`initDone$$ = True),
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
WindowSize->{422, 287},
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
Cell[1235, 30, 3343, 73, 287, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 2w0Ku03#A@XCqAwQGiOn#Ary *)
