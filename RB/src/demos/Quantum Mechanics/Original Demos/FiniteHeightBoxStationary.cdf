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
NotebookDataLength[     18406,        385]
NotebookOptionsPosition[     18709,        377]
NotebookOutlinePosition[     19172,        397]
CellTagsIndexPosition[     19129,        394]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`m$$ = 
      0.1, $CellContext`V$$ = 5, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`a$$], 1, "Width of the box"}, 1, 10}, {{
         Hold[$CellContext`V$$], 5, "Height of the box"}, 5, 60, 1}, {{
         Hold[$CellContext`m$$], 0.1, "Mass of the particle"}, 0.1, 0.4}}, 
      Typeset`size$$ = {800., {259., 267.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`a$6604$$ = 0, $CellContext`V$6605$$ = 
      0, $CellContext`m$6606$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`a$$ = 1, $CellContext`m$$ = 
          0.1, $CellContext`V$$ = 5}, "ControllerVariables" :> {
          Hold[$CellContext`a$$, $CellContext`a$6604$$, 0], 
          Hold[$CellContext`V$$, $CellContext`V$6605$$, 0], 
          Hold[$CellContext`m$$, $CellContext`m$6606$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> ($CellContext`solold1 = 0; $CellContext`solold2 = 
          0; $CellContext`count = 
          0; $CellContext`list = {}; $CellContext`plots = {}; 
         Do[$CellContext`sol1 = Quiet[
              Part[
               
               FindRoot[$CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$] Tan[
                   $CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$]] == $CellContext`circle[$CellContext`m$$, $CellContext`en, \
$CellContext`a$$, $CellContext`V$$], {$CellContext`en, $CellContext`ck, 
                 0, $CellContext`V$$}], 1, 2]]; $CellContext`sol2 = Quiet[
              Part[
               
               FindRoot[(-$CellContext`\[Xi][$CellContext`m$$, \
$CellContext`en, $CellContext`a$$]) Cot[
                   $CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$]] == $CellContext`circle[$CellContext`m$$, $CellContext`en, \
$CellContext`a$$, $CellContext`V$$], {$CellContext`en, $CellContext`ck, 
                 0, $CellContext`V$$}], 1, 2]]; If[
             And[
             Abs[$CellContext`sol1 - $CellContext`solold1] > 
              0.01, $CellContext`sol1 != $CellContext`V$$], $CellContext`list = 
              Append[$CellContext`list, $CellContext`sol1]; \
$CellContext`solold1 = $CellContext`sol1; 
             Increment[$CellContext`count]; $CellContext`plots = 
              Append[$CellContext`plots, 
                
                Plot[$CellContext`\[Psi]A[$CellContext`m$$, \
$CellContext`sol1, $CellContext`V$$, $CellContext`a$$, $CellContext`x, 
                   0.1 $CellContext`V$$] + $CellContext`sol1, \
{$CellContext`x, (-3) $CellContext`a$$, 3 $CellContext`a$$}, 
                 PlotRange -> {{(-3) $CellContext`a$$, 3 $CellContext`a$$}, {
                   0, $CellContext`V$$ 1.2}}, ImageSize -> 800]]; Null]; If[
             And[
             Abs[$CellContext`sol2 - $CellContext`solold2] > 
              0.01, $CellContext`sol2 != $CellContext`V$$], $CellContext`list = 
              Append[$CellContext`list, $CellContext`sol2]; \
$CellContext`solold2 = $CellContext`sol2; 
             Increment[$CellContext`count]; $CellContext`plots = 
              Append[$CellContext`plots, 
                
                Plot[$CellContext`\[Psi]B[$CellContext`m$$, \
$CellContext`sol2, $CellContext`V$$, $CellContext`a$$, $CellContext`x, 
                   0.1 $CellContext`V$$] + $CellContext`sol2, \
{$CellContext`x, (-3) $CellContext`a$$, 3 $CellContext`a$$}, 
                 PlotRange -> {{(-3) $CellContext`a$$, 3 $CellContext`a$$}, {
                   0, $CellContext`V$$ 1.2}}, ImageSize -> 800]]; Null]; 
           Null, {$CellContext`ck, $CellContext`V$$ - 1, 1, -1}]; Show[
           Table[
            (Plot[
             
             Part[$CellContext`list, $CellContext`i], {$CellContext`x, \
-$CellContext`a$$, 
              Plus[$CellContext`a$$]}, AxesOrigin -> {0, 0}, 
             PlotRange -> {{(-3) $CellContext`a$$, 3 $CellContext`a$$}, {
               0, $CellContext`V$$ 1.2}}, PlotStyle -> {Dashed}, ImageSize -> 
             800, AxesLabel -> {"x", "\[Psi](x),V(x)"}, Ticks -> {
               $CellContext`ticks[(-3) $CellContext`a$$, 3 $CellContext`a$$, 
                0.5, 100], 
               $CellContext`ticks[0, $CellContext`V$$ 1.2, 1, 200]}, #]& )[
             Sequence[$CellContext`$PlotOptions]], {$CellContext`i, 
             1, $CellContext`count}], 
           (
           Plot[$CellContext`V$$, {$CellContext`x, (-3) $CellContext`a$$, \
-$CellContext`a$$}, AxesOrigin -> {0, 0}, 
            PlotRange -> {{(-3) $CellContext`a$$, 3 $CellContext`a$$}, {
              0, $CellContext`V$$ + 5}}, ImageSize -> 800, Filling -> 
            Bottom, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           (
           Plot[$CellContext`V$$, {$CellContext`x, $CellContext`a$$, 
             3 $CellContext`a$$}, AxesOrigin -> {0, 0}, 
            PlotRange -> {{(-3) $CellContext`a$$, 3 $CellContext`a$$}, {
              0, $CellContext`V$$ + 5}}, ImageSize -> 800, Filling -> 
            Bottom, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           Graphics[
            
            Line[{{-$CellContext`a$$, $CellContext`V$$}, {-$CellContext`a$$, 
               0}}]], 
           Graphics[
            
            Line[{{$CellContext`a$$, $CellContext`V$$}, {$CellContext`a$$, 
               0}}]], $CellContext`plots]), 
        "Specifications" :> {{{$CellContext`a$$, 1, "Width of the box"}, 1, 
           10, ContinuousAction -> 
           False}, {{$CellContext`V$$, 5, "Height of the box"}, 5, 60, 1, 
           ContinuousAction -> 
           False}, {{$CellContext`m$$, 0.1, "Mass of the particle"}, 0.1, 0.4,
            ContinuousAction -> False}}, 
        "Options" :> {ControlPlacement -> Left, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1148., {278., 285.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`solold1 = 
         2.7312341706983587`, $CellContext`solold2 = 0, $CellContext`count = 
         1, $CellContext`list = {2.7312341706983587`}, $CellContext`plots = {
           Graphics[{{{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               Line[CompressedData["
1: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

                "]]}}}, {
            AspectRatio -> GoldenRatio^(-1), Axes -> True, 
             AxesOrigin -> {0, 0}, ImageSize -> 800, 
             PlotRange -> {{-3, 3}, {0, 6.}}, PlotRangeClipping -> True, 
             PlotRangePadding -> {Automatic, Automatic}}]}, $CellContext`sol1 = 
         2.7312341706983587`, $CellContext`\[Xi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]]] := 
         Sqrt[((2 $CellContext`m) $CellContext`en) $CellContext`a^2], \
$CellContext`a$$ = 1, $CellContext`circle[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]]] := 
         Sqrt[((2 $CellContext`m) $CellContext`V) $CellContext`a^2 - \
$CellContext`\[Xi][$CellContext`m, $CellContext`en, $CellContext`a]^2], \
$CellContext`sol2 = 5., $CellContext`\[Psi]A[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`B, 
            Blank[]]] := 
         Which[$CellContext`x <= -$CellContext`a, (($CellContext`B 
             Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`a]) 
            Cos[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`a]) 
           Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`x], -$CellContext`a <= $CellContext`x <= \
$CellContext`a, $CellContext`B 
           Cos[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`x], $CellContext`a <= $CellContext`x, (($CellContext`B 
             Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`a]) 
            Cos[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`a]) 
           
           Exp[(-$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V]) $CellContext`x]], $CellContext`\[Chi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]]] := 
         Sqrt[(2 $CellContext`m) ($CellContext`V - $CellContext`en)], \
$CellContext`k[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]]] := 
         Sqrt[(2 $CellContext`m) $CellContext`en], $CellContext`\[Psi]B[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`A, 
            Blank[]]] := 
         Which[$CellContext`x <= -$CellContext`a, (((-$CellContext`A) 
             Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`a]) 
            Sin[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`a]) 
           Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`x], -$CellContext`a <= $CellContext`x <= \
$CellContext`a, $CellContext`A 
           Sin[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`x], $CellContext`a <= $CellContext`x, (($CellContext`A 
             Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`a]) 
            Sin[$CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`a]) 
           Exp[(-$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V]) $CellContext`x]], $CellContext`ticks[
           Pattern[$CellContext`rangeminus, 
            Blank[]], 
           Pattern[$CellContext`rangeplus, 
            Blank[]], 
           Pattern[$CellContext`spacing, 
            Blank[]], 
           Pattern[$CellContext`tix, 
            Blank[]]] := Table[{$CellContext`i $CellContext`spacing, 
            If[
            Mod[$CellContext`i, $CellContext`tix] == 
             0, $CellContext`i $CellContext`spacing, ""]}, {$CellContext`i, 
            Round[$CellContext`rangeminus/$CellContext`spacing], 
            
            Round[$CellContext`rangeplus/$CellContext`spacing]}], \
$CellContext`$PlotOptions = {PlotStyle -> {
             RGBColor[0, 0, 1]}, 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, 
           LabelStyle -> {FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {FontSize -> 18, FontFamily -> "Helvetica"}}}; 
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
WindowSize->{1190, 603},
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
Cell[1235, 30, 17470, 345, 603, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 8vTpagKuZl6uFDw1FKuHpuPe *)
