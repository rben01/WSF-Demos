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
NotebookDataLength[      5644,        143]
NotebookOptionsPosition[      5949,        135]
NotebookOutlinePosition[      6411,        155]
CellTagsIndexPosition[      6368,        152]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  TagBox[
   StyleBox[
    DynamicModuleBox[{$CellContext`vprojectile$$ = 0, $CellContext`vrocket$$ =
      0, Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
     Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
     1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
        Hold[$CellContext`vrocket$$], 0, 
        Style["Rocket velocity", {14, FontFamily -> "Helvetica", 
          GrayLevel[1]}]}, 0, 0.99, 0.01}, {{
        Hold[$CellContext`vprojectile$$], 0, 
        Style["Projectile velocity", {14, FontFamily -> "Helvetica", 
          GrayLevel[1]}]}, 0, 0.99, 0.01}}, Typeset`size$$ = {
     564., {60.5, 65.5}}, Typeset`update$$ = 0, Typeset`initDone$$, 
     Typeset`skipInitDone$$ = False, $CellContext`vrocket$615$$ = 
     0, $CellContext`vprojectile$616$$ = 0}, 
     DynamicBox[Manipulate`ManipulateBoxes[
      1, StandardForm, 
       "Variables" :> {$CellContext`vprojectile$$ = 0, $CellContext`vrocket$$ = 
         0}, "ControllerVariables" :> {
         Hold[$CellContext`vrocket$$, $CellContext`vrocket$615$$, 0], 
         Hold[$CellContext`vprojectile$$, $CellContext`vprojectile$616$$, 0]},
        "OtherVariables" :> {
        Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
         Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
         Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
         Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> (Grid[{{
           Column[{
             Text[
              Style["Rocket Frame", $CellContext`$TitleStyle, Bold]], 
             Text[
              Style[
              "\!\(\*SubscriptBox[\(v\), \(rocket\)]\)' = 0.00 c", \
$CellContext`$TitleStyle]], 
             Text[
              Style[
               StringJoin["\!\(\*SubscriptBox[\(v\), \(projectile\)]\)' = ", 
                ToString[
                 NumberForm[$CellContext`vprojectile$$, {3, 2}]], 
                " c"], $CellContext`$TitleStyle]]}], 
           Column[{
             Text[
              Style["Ground Frame", $CellContext`$TitleStyle, Bold]], 
             Text[
              Style[
               StringJoin["\!\(\*SubscriptBox[\(v\), \(rocket\)]\) = ", 
                ToString[
                 NumberForm[$CellContext`vrocket$$, {3, 2}]], 
                " c"], $CellContext`$TitleStyle]], 
             Text[
              Style[
               StringJoin["\!\(\*SubscriptBox[\(v\), \(projectile\)]\) = ", 
                ToString[
                 NumberForm[
                  $CellContext`vSTR[$CellContext`vrocket$$, \
$CellContext`vprojectile$$], {5, 4}]], " c"], $CellContext`$TitleStyle]], 
             Text[
              Style[
               StringJoin[
               "\!\(\*SubsuperscriptBox[\(v\), \(projectile\), \(Galileo\)]\) \
= ", 
                ToString[
                 NumberForm[
                  $CellContext`vGalileo[$CellContext`vrocket$$, \
$CellContext`vprojectile$$], {3, 2}]], " c"], $CellContext`$TitleStyle, 
               Gray]]}]}}, Frame -> True, FrameStyle -> White, Spacings -> 10, 
         SlotSequence[1]]& )[
         Apply[Sequence, $CellContext`$GridOptions]], 
       "Specifications" :> {{{$CellContext`vrocket$$, 0, 
           Style["Rocket velocity", {14, FontFamily -> "Helvetica", 
             GrayLevel[1]}]}, 0, 0.99, 0.01}, {{$CellContext`vprojectile$$, 0, 
           Style["Projectile velocity", {14, FontFamily -> "Helvetica", 
             GrayLevel[1]}]}, 0, 0.99, 0.01}}, 
       "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
       "DefaultOptions" :> {}],
      ImageSizeCache->{584., {110., 115.}},
      SingleEvaluation->True],
     Deinitialization:>None,
     DynamicModuleValues:>{},
     Initialization:>({$CellContext`$TitleStyle = {
         20, FontFamily -> "Helvetica", 
          GrayLevel[1]}, $CellContext`vSTR[
          Pattern[$CellContext`v1, 
           Blank[]], 
          Pattern[$CellContext`v2, 
           Blank[]]] := ($CellContext`v1 + $CellContext`v2)/(
         1 + $CellContext`v1 $CellContext`v2), $CellContext`vGalileo[
          Pattern[$CellContext`v1, 
           Blank[]], 
          Pattern[$CellContext`v2, 
           
           Blank[]]] := $CellContext`v1 + $CellContext`v2, \
$CellContext`$GridOptions = {Background -> GrayLevel[0]}}; 
      Typeset`initDone$$ = True),
     SynchronousInitialization->True,
     UnsavedVariables:>{Typeset`initDone$$},
     UntrackedVariables:>{Typeset`size$$}], "Manipulate",
    Deployed->True,
    StripOnInput->False],
   Manipulate`InterpretManipulate[1]],
  Alignment->{Automatic, Center},
  Background->GrayLevel[0],
  StripOnInput->False]], "PluginEmbeddedContent"]
},
WindowSize->{598, 237},
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
Cell[1235, 30, 4710, 103, 237, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature VvT2u0geaqXaTBgwBLQJTOoz *)
