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
NotebookDataLength[      7645,        181]
NotebookOptionsPosition[      7949,        173]
NotebookOutlinePosition[      8412,        193]
CellTagsIndexPosition[      8369,        190]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`P$$ = 0, $CellContext`t$$ = 
      0, $CellContext`\[CapitalDelta]$$ = 2, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[
         Button["Ready", $CellContext`s = 1; Null]], 
        Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Row[{
           Button["Evolve forward in time", $CellContext`s2 = 1; Null], 
           Button["Stop evolution", $CellContext`s2 = 0; Null], 
           Button[
           "Reset", $CellContext`t$$ = 0; $CellContext`s2 = 
             0; $CellContext`s3 = 0; Null]}]], 
        Manipulate`Dump`ThisIsNotAControl}, {{
         Hold[$CellContext`P$$], 0, "Initial momentum"}, 2, -2, 0.5}, {{
         Hold[$CellContext`\[CapitalDelta]$$], 2, 
         "Uncertainty in momentum measurement"}, 2, 0.5}, {{
         Hold[$CellContext`t$$], 0, "Time"}, 0, 20}}, Typeset`size$$ = {
      1173., {121., 125.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`P$12983$$ = 
      0, $CellContext`\[CapitalDelta]$12984$$ = 0, $CellContext`t$12985$$ = 
      0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`P$$ = 0, $CellContext`t$$ = 
          0, $CellContext`\[CapitalDelta]$$ = 2}, "ControllerVariables" :> {
          Hold[$CellContext`P$$, $CellContext`P$12983$$, 0], 
          
          Hold[$CellContext`\[CapitalDelta]$$, \
$CellContext`\[CapitalDelta]$12984$$, 0], 
          Hold[$CellContext`t$$, $CellContext`t$12985$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`s2 == 1, $CellContext`t$$ = $CellContext`t$$ + 0.5; 
           Null]; GraphicsRow[{
            (Plot[
             $CellContext`PProbDens[$CellContext`p, $CellContext`P$$, \
$CellContext`\[CapitalDelta]$$], {$CellContext`p, -10, 10}, 
             PlotRange -> {{-5, 5}, {0, 1}}, ImageSize -> Medium, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            (
            Plot[$CellContext`s $CellContext`XProbDens[$CellContext`x, \
$CellContext`t$$, $CellContext`P$$, $CellContext`\[CapitalDelta]$$], \
{$CellContext`x, -15, 15}, PlotRange -> {{-15, 15}, {0, 1}}, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            Show[
             (Plot[
              $CellContext`Uncnrty[$CellContext`tt, $CellContext`\
\[CapitalDelta]$$], {$CellContext`tt, 0, 20}, PlotRange -> {{0, 20}, {0, 10}},
               Ticks -> {{}, {{
                 1/2, "\!\(\*FractionBox[\(\[HBar]\), \(2\)]\)"}}}, #]& )[
              Sequence[$CellContext`$PlotOptions]], 
             Graphics[{
               PointSize[Large], 
               Point[{$CellContext`t$$, 
                 $CellContext`Uncnrty[$CellContext`t$$, $CellContext`\
\[CapitalDelta]$$]}]}]]}]), "Specifications" :> {
          Button["Ready", $CellContext`s = 1; Null], Delimiter, 
          Row[{
            Button["Evolve forward in time", $CellContext`s2 = 1; Null], 
            Button["Stop evolution", $CellContext`s2 = 0; Null], 
            Button[
            "Reset", $CellContext`t$$ = 0; $CellContext`s2 = 
              0; $CellContext`s3 = 0; Null]}], {{$CellContext`P$$, 0, 
            "Initial momentum"}, 2, -2, 
           0.5}, {{$CellContext`\[CapitalDelta]$$, 2, 
            "Uncertainty in momentum measurement"}, 2, 
           0.5}, {{$CellContext`t$$, 0, "Time"}, 0, 20}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1193., {219., 226.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`s2 = 0, $CellContext`PProbDens[
           Pattern[$CellContext`p, 
            Blank[]], 
           Pattern[$CellContext`P, 
            Blank[]], 
           Pattern[$CellContext`\[CapitalDelta], 
            Blank[]]] := 
         Abs[(Sqrt[
              1/$CellContext`\[CapitalDelta]^2] \
($CellContext`\[CapitalDelta]^2)^(3/4))/(
            E^(($CellContext`\[CapitalDelta]^2 ($CellContext`P + \
$CellContext`p $CellContext`\[HBar])^2)/(2 $CellContext`\[HBar]^2)) 
            Pi^(1/4))]^2, $CellContext`p = 0, $CellContext`\[HBar] = 
         1, $CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`s = 
         0, $CellContext`XProbDens[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`P, 
            Blank[]], 
           Pattern[$CellContext`\[CapitalDelta], 
            Blank[]]] := (1/Sqrt[
           Pi ($CellContext`\[CapitalDelta]^2 + ($CellContext`\[HBar]^2 \
$CellContext`t^2)/($CellContext`m^2 $CellContext`\[CapitalDelta]^2))]) 
          Exp[-(($CellContext`x - ($CellContext`P/$CellContext`m) \
$CellContext`t)^2/($CellContext`\[CapitalDelta]^2 + ($CellContext`\[HBar]^2 \
$CellContext`t^2)/($CellContext`m^2 $CellContext`\[CapitalDelta]^2)))], \
$CellContext`m = 1, $CellContext`Uncnrty[
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`\[CapitalDelta], 
            Blank[]]] := (1/2) 
          Sqrt[1 + ($CellContext`\[HBar]^2 \
$CellContext`t^2)/($CellContext`m^2 $CellContext`\[CapitalDelta]^4)], \
$CellContext`s3 = 0}; Typeset`initDone$$ = True),
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
WindowSize->{1235, 485},
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
Cell[1235, 30, 6710, 141, 485, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 7uppzataUPcDuBgsKeRbZEFR *)
