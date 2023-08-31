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
NotebookDataLength[     11854,        269]
NotebookOptionsPosition[     12146,        260]
NotebookOutlinePosition[     12619,        281]
CellTagsIndexPosition[     12576,        278]
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
         Hold[$CellContext`k$$], 0, "Wavenumber"}, -4, 4}, {
        Hold[
         Button[
          Dynamic[
           If[$CellContext`moving == 0, "Play", "Stop"]], $CellContext`moving = 
           1 - $CellContext`moving; $CellContext`t = $CellContext`t \
$CellContext`moving, ImageSize -> 70]], Manipulate`Dump`ThisIsNotAControl}}, 
      Typeset`size$$ = {934., {429., 433.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`k$97573$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`k$$ = 0}, 
        "ControllerVariables" :> {
          Hold[$CellContext`k$$, $CellContext`k$97573$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`moving == 
           1, $CellContext`t = $CellContext`t + $CellContext`dt; Null]; 
         GraphicsGrid[{{
             GraphicsColumn[{
               Show[{
                 (Plot[
                  $CellContext`Energy[$CellContext`kk], {$CellContext`kk, \
$CellContext`kmin, $CellContext`kmax}, AxesLabel -> {" k", "Energy"}, 
                  Ticks -> {{{$CellContext`kmin, 
                    "-4\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmin/2, 
                    "-2\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmax/2, 
                    "2\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmax, "4\!\(\*SubscriptBox[\(k\), \(1\)]\)"}}, {{
                    $CellContext`Energy[$CellContext`kmin/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[2 $CellContext`Energy[$CellContext`kmin/2]]]], 
                    "\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[SubscriptBox[\(k\), \(1\)], \(2\)]\), \(2\\ m\)]\)"]}, {
                    2 $CellContext`Energy[$CellContext`kmin/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[4 $CellContext`Energy[$CellContext`kmin/2]]]], 
                    "\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[SubscriptBox[\(k\), \(1\)], \(2\)]\), \(2\\ m\)]\)"]}, {
                    3 $CellContext`Energy[$CellContext`kmin/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[6 $CellContext`Energy[$CellContext`kmin/2]]]], 
                    "\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[SubscriptBox[\(k\), \(1\)], \(2\)]\), \(2\\ m\)]\)"]}, {
                    4 $CellContext`Energy[$CellContext`kmin/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[8 $CellContext`Energy[$CellContext`kmin/2]]]], 
                    "\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[SubscriptBox[\(k\), \(1\)], \(2\)]\), \(2\\ m\)]\)"]}}}, #]& \
)[
                  Sequence[$CellContext`$PlotOptions]], 
                 Graphics[
                  Text[
                   Style[
                    StringJoin["E = ", 
                    ToString[
                    NumberForm[
                    2 $CellContext`Energy[$CellContext`k$$], {3, 2}]], 
                    "\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[SubscriptBox[\(k\), \(1\)], \(2\)]\), \(2\\ m\)]\)"], 
                    FontSize -> 12], {$CellContext`kmin (3/4), 
                    $CellContext`Energy[$CellContext`kmin/3]}]], 
                 Graphics[{
                   PointSize[Large], 
                   Point[{$CellContext`k$$, 
                    $CellContext`Energy[$CellContext`k$$]}]}]}], 
               Show[{
                 (Plot[
                  $CellContext`Momentum[$CellContext`kk], {$CellContext`kk, \
$CellContext`kmin, $CellContext`kmax}, AxesLabel -> {" k", "Momentum"}, 
                  Ticks -> {{{$CellContext`kmin, 
                    "-4\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmin/2, 
                    "-2\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmax/2, 
                    "2\!\(\*SubscriptBox[\(k\), \(1\)]\)"}, \
{$CellContext`kmax, "4\!\(\*SubscriptBox[\(k\), \(1\)]\)"}}, {{
                    $CellContext`Momentum[$CellContext`kmin], 
                    StringJoin[
                    ToString[
                    Round[
                    N[
                    $CellContext`Momentum[$CellContext`kmin]]]], 
                    " \!\(\*SubscriptBox[\(\[HBar]k\), \(\(\\ \
\)\(1\)\)]\)"]}, {
                    $CellContext`Momentum[$CellContext`kmin/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[
                    $CellContext`Momentum[$CellContext`kmin/2]]]], 
                    " \!\(\*SubscriptBox[\(\[HBar]k\), \(\(\\ \)\(1\)\(\\ \
\)\)]\)"]}, {
                    $CellContext`Momentum[$CellContext`kmax/2], 
                    StringJoin[
                    ToString[
                    Round[
                    N[
                    $CellContext`Momentum[$CellContext`kmax/2]]]], 
                    " \[HBar]k\!\(\*SubscriptBox[\(\\ \), \(1\)]\)"]}, {
                    $CellContext`Momentum[$CellContext`kmax], 
                    StringJoin[
                    ToString[
                    Round[
                    N[
                    $CellContext`Momentum[$CellContext`kmax]]]], 
                    " \!\(\*SubscriptBox[\(\[HBar]k\), \(\(\\ \
\)\(1\)\)]\)"]}}}, #]& )[
                  Sequence[$CellContext`$PlotOptions]], 
                 Graphics[
                  Text[
                   Style[
                    StringJoin["p = ", 
                    ToString[
                    NumberForm[
                    $CellContext`Momentum[$CellContext`k$$], {3, 2}]], 
                    " \!\(\*SubscriptBox[\(\[HBar]k\), \(\(\\ \)\(1\)\)]\)"], 
                    FontSize -> 
                    12], {$CellContext`kmin (3/
                    4), -$CellContext`Momentum[$CellContext`kmin/4]}]], 
                 Graphics[{
                   PointSize[Large], 
                   Point[{$CellContext`k$$, 
                    $CellContext`Momentum[$CellContext`k$$]}]}]}]}], 
             GraphicsColumn[{
               (Plot[
                
                Cos[$CellContext`k$$ $CellContext`x - $CellContext`t \
($CellContext`Energy[$CellContext`k$$]/$CellContext`\[HBar])], \
{$CellContext`x, $CellContext`xmin, $CellContext`xmax}, 
                PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
                Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                   2, $CellContext`xmax/2, $CellContext`xmax}, {-1, 1}}, 
                PlotLabel -> "Re(\[Psi](x,t))", #]& )[
                Sequence[$CellContext`$PlotOptions]], 
               (Plot[
                
                Sin[$CellContext`k$$ $CellContext`x - $CellContext`t \
($CellContext`Energy[$CellContext`k$$]/$CellContext`\[HBar])], \
{$CellContext`x, $CellContext`xmin, $CellContext`xmax}, 
                PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
                Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                   2, $CellContext`xmax/2, $CellContext`xmax}, {-1, 1}}, 
                PlotLabel -> "Im(\[Psi](x,t))", #]& )[
                Sequence[$CellContext`$PlotOptions]], 
               (Plot[
               1, {$CellContext`x, $CellContext`xmin, $CellContext`xmax}, 
                PlotRange -> {0, 1.1}, PlotStyle -> {
                  Thickness[0.01]}, ColorFunctionScaling -> False, 
                ColorFunction -> {
                  Function[{$CellContext`x$, $CellContext`y$}, 
                   ColorData["Rainbow"][
                   Mod[$CellContext`k$$ $CellContext`x$ - \
$CellContext`Energy[$CellContext`k$$] ($CellContext`t/$CellContext`\[HBar]), 
                    2 Pi]/(2 Pi)]]}, ImageSize -> 400, 
                Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                   2, $CellContext`xmax/2, $CellContext`xmax}, {1}}, 
                PlotLabel -> "\[Psi](x,t)", #]& )[
                Sequence[$CellContext`$PlotOptions]]}]}}]), 
        "Specifications" :> {{{$CellContext`k$$, 0, "Wavenumber"}, -4, 4}, 
          Delimiter, 
          Button[
           Dynamic[
            
            If[$CellContext`moving == 0, "Play", 
             "Stop"]], $CellContext`moving = 
            1 - $CellContext`moving; $CellContext`t = $CellContext`t \
$CellContext`moving, ImageSize -> 70]}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{954., {485., 490.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`moving = 0, $CellContext`t = 
         0., $CellContext`dt = 0.2, $CellContext`Energy[
           Pattern[$CellContext`k, 
            Blank[]]] = $CellContext`k^2/
          2, $CellContext`kmin = -4, $CellContext`kmax = 
         4, $CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`Momentum[
           Pattern[$CellContext`k, 
            Blank[]]] = $CellContext`k, $CellContext`\[HBar] = 
         1, $CellContext`xmin = -10, $CellContext`xmax = 10}; 
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
WindowSize->{990, 1009},
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
Cell[1235, 30, 10907, 228, 1009, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Ox02fXEnunibhBgHFx55C39N *)
