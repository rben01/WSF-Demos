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
NotebookDataLength[      7459,        170]
NotebookOptionsPosition[      7753,        161]
NotebookOutlinePosition[      8226,        182]
CellTagsIndexPosition[      8183,        179]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`dispersion$$ = 1, $CellContext`k$$ = 
      0, $CellContext`\[Omega]$$ = 0, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[$CellContext`dispersion$$], {
        1 -> "Nonrelativistic: |\[Omega]| = \[HBar] \
\!\(\*SuperscriptBox[\(k\), \(2\)]\)/2m", 2 -> 
         "Relativistic: |\[Omega]| = c k", 3 -> 
         "Choose your own \[Omega] freely"}}, {{
         Hold[$CellContext`k$$], 0, "Wavenumber"}, -2, 2}, {{
         Hold[$CellContext`\[Omega]$$], 0, "Angular Frequency"}, 0, 2}, {
        Hold[
         Row[{
           Button["Play", $CellContext`moving = 1; Null, ImageSize -> 100], 
           Button[
           "Stop and Reset", $CellContext`moving = 0; $CellContext`t = 0; 
            Null, ImageSize -> 150]}]], Manipulate`Dump`ThisIsNotAControl}}, 
      Typeset`size$$ = {1302., {134., 138.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`dispersion$618270$$ = 
      False, $CellContext`k$618271$$ = 0, $CellContext`\[Omega]$618272$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`dispersion$$ = 
          1 -> "Nonrelativistic: |\[Omega]| = \[HBar] \
\!\(\*SuperscriptBox[\(k\), \(2\)]\)/2m", $CellContext`k$$ = 
          0, $CellContext`\[Omega]$$ = 0}, "ControllerVariables" :> {
          
          Hold[$CellContext`dispersion$$, $CellContext`dispersion$618270$$, 
           False], 
          Hold[$CellContext`k$$, $CellContext`k$618271$$, 0], 
          Hold[$CellContext`\[Omega]$$, $CellContext`\[Omega]$618272$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`dispersion$$ == 
           1, $CellContext`\[Omega]$$ = $CellContext`\[HBar] \
($CellContext`k$$^2/(2 $CellContext`m))]; 
         If[$CellContext`dispersion$$ == 
           2, $CellContext`\[Omega]$$ = $CellContext`c Abs[$CellContext`k$$]]; 
         If[$CellContext`moving == 
           1, $CellContext`t = $CellContext`t + $CellContext`dt; Null]; 
         GraphicsGrid[{{
             (Plot[
              
              Cos[$CellContext`k$$ $CellContext`x - $CellContext`\[Omega]$$ \
($CellContext`t/$CellContext`\[HBar])], {$CellContext`x, $CellContext`xmin, \
$CellContext`xmax}, PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
              Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                 2, $CellContext`xmax/2, $CellContext`xmax}, {-1, 1}}, 
              PlotLabel -> "Re(\[Psi](x,t))", #]& )[
              Sequence[$CellContext`$PlotOptions]], 
             (Plot[
              
              Sin[$CellContext`k$$ $CellContext`x - $CellContext`\[Omega]$$ \
($CellContext`t/$CellContext`\[HBar])], {$CellContext`x, $CellContext`xmin, \
$CellContext`xmax}, PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
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
$CellContext`\[Omega]$$ ($CellContext`t/$CellContext`\[HBar]), 2 Pi]/(2 
                  Pi)]]}, ImageSize -> 400, 
              Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                 2, $CellContext`xmax/2, $CellContext`xmax}, {1}}, PlotLabel -> 
              "\[Psi](x,t)", #]& )[
              Sequence[$CellContext`$PlotOptions]]}}]), 
        "Specifications" :> {{$CellContext`dispersion$$, {
           1 -> "Nonrelativistic: |\[Omega]| = \[HBar] \
\!\(\*SuperscriptBox[\(k\), \(2\)]\)/2m", 2 -> 
            "Relativistic: |\[Omega]| = c k", 3 -> 
            "Choose your own \[Omega] freely"}}, {{$CellContext`k$$, 0, 
            "Wavenumber"}, -2, 
           2}, {{$CellContext`\[Omega]$$, 0, "Angular Frequency"}, 0, 2}, 
          Delimiter, 
          Row[{
            Button["Play", $CellContext`moving = 1; Null, ImageSize -> 100], 
            Button[
            "Stop and Reset", $CellContext`moving = 0; $CellContext`t = 0; 
             Null, ImageSize -> 150]}]}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1322., {217., 223.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`dispersion$$ = 1, $CellContext`\[HBar] = 
         1, $CellContext`m = 1, $CellContext`c = 1, $CellContext`moving = 
         0, $CellContext`t = 0, $CellContext`dt = 
         0.2, $CellContext`xmin = -10, $CellContext`xmax = 
         10, $CellContext`$PlotOptions = {PlotStyle -> {{
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
WindowSize->{1358, 474},
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
Cell[1235, 30, 6514, 129, 474, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature txDL0x0wtXRF1B1WYaV16@4B *)
