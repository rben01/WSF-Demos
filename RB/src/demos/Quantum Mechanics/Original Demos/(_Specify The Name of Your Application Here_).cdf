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
NotebookDataLength[      3400,         96]
NotebookOptionsPosition[      3694,         87]
NotebookOutlinePosition[      4168,        108]
CellTagsIndexPosition[      4125,        105]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`k$$ = 0, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`k$$], 0, "Wavenumber"}, -5, 5}}, Typeset`size$$ = {
      259., {197., 202.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`k$745$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`k$$ = 0}, 
        "ControllerVariables" :> {
          Hold[$CellContext`k$$, $CellContext`k$745$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> 
        GraphicsColumn[{
           Show[
            Plot[
             $CellContext`Energy[$CellContext`k$$], {$CellContext`k$$, \
$CellContext`kmin, $CellContext`kmax}]], 
           Show[{
             Plot[
              $CellContext`Momentum[$CellContext`k$$], {$CellContext`k$$, \
$CellContext`kmin, $CellContext`kmax}], Graphics}]}], 
        "Specifications" :> {{{$CellContext`k$$, 0, "Wavenumber"}, -5, 5}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{279., {231., 236.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`Energy[
           Pattern[$CellContext`k, 
            Blank[]]] = $CellContext`k^2/
          2, $CellContext`kmin = -5, $CellContext`kmax = 
         5, $CellContext`Momentum[
           Pattern[$CellContext`k, 
            Blank[]]] = $CellContext`k}; Typeset`initDone$$ = True),
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
WindowSize->{315, 501},
ScrollingOptions->{"HorizontalScrollRange"->Fit,
"VerticalScrollRange"->Fit},
ShowCellBracket->False,
Deployed->True,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"8.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (October 5, \
2011)",
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
Cell[1235, 30, 2455, 55, 501, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature LupNRmMZNRVpYC1x3RtjHdye *)
