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
NotebookDataLength[      7244,        175]
NotebookOptionsPosition[      7539,        166]
NotebookOutlinePosition[      8011,        187]
CellTagsIndexPosition[      7968,        184]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`n$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[
         Button[
          Dynamic[
           
           If[$CellContext`trigger == 0, "Play", 
            "Pause"]], $CellContext`trigger = 1 - $CellContext`trigger]], 
        Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Button["Reset", $CellContext`trigger = 0; $CellContext`t = 0; Null]],
         Manipulate`Dump`ThisIsNotAControl}, {
        Hold[$CellContext`n$$], {1, 2, 3, 4}}}, Typeset`size$$ = {
      807., {213.90625, 219.09375}}, Typeset`update$$ = 0, Typeset`initDone$$,
       Typeset`skipInitDone$$ = False, $CellContext`n$36447$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`n$$ = 1}, 
        "ControllerVariables" :> {
          Hold[$CellContext`n$$, $CellContext`n$36447$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`n$$ != $CellContext`nLast, $CellContext`nLast = \
$CellContext`n$$; $CellContext`trigger = 0; $CellContext`t = 0; Null]; 
         If[$CellContext`trigger == 
           1, $CellContext`t = $CellContext`t + $CellContext`dt; 
           Pause[$CellContext`dt]]; Grid[{{
             Text[
              Style[
              "\[Psi](x,t) = c(t) \!\(\*SubscriptBox[\(\[Psi]\), \(n\)]\)(x) \
with c(t) = \!\(\*SuperscriptBox[\(\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \
\*SubscriptBox[\(E\), \(n\)] t/\[HBar]\)]\)\n", FontSize -> 20, FontFamily -> 
               "Helvetica"]], SpanFromLeft}, {
             Show[{
               (Plot[
                $CellContext`V[$CellContext`x], {$CellContext`x, \
$CellContext`xmin, $CellContext`xmax}, 
                PlotRange -> {-(2/$CellContext`L)^Rational[1, 2] - 
                  0.2, (2/$CellContext`L)^Rational[1, 2] + 0.2}, Filling -> 
                Axis, Exclusions -> None, #]& )[
                Sequence[$CellContext`$PlotOptions]], 
               (Plot[
                $CellContext`\[Psi][$CellContext`x, $CellContext`t, \
$CellContext`n$$], {$CellContext`x, 0, $CellContext`L}, 
                PlotRange -> {-(2/$CellContext`L)^Rational[1, 2], (
                   2/$CellContext`L)^Rational[1, 2]}, 
                AxesLabel -> {"x", "|\[Psi](x,t)|"}, PlotLabel -> 
                "\[Psi](x,t)\n", PlotStyle -> {
                  Thickness[0.01]}, ColorFunctionScaling -> False, 
                ColorFunction -> {
                  Function[{$CellContext`x$, $CellContext`y$}, 
                   ColorData["Rainbow"][
                   Mod[(-$CellContext`Energy[$CellContext`n$$]) \
($CellContext`t/$CellContext`\[HBar]), 2 Pi]/(2 Pi)]]}, #]& )[
                Sequence[$CellContext`$PlotOptions]]}, ImageSize -> 400], 
             Show[{
               (Plot[
               Null, {$CellContext`x, -1, 1}, PlotRange -> {-1, 1}, 
                AxesLabel -> {"Re(c)", "Im(c)"}, #]& )[
                Sequence[$CellContext`$PlotOptions]], 
               Graphics[{
                 Arrow[{{0, 0}, {
                    
                    Cos[(-$CellContext`Energy[$CellContext`n$$]) \
($CellContext`t/$CellContext`\[HBar])], 
                    
                    Sin[(-$CellContext`Energy[$CellContext`n$$]) \
($CellContext`t/$CellContext`\[HBar])]}}]}, PlotRange -> {{-1, 1}, {-1, 1}}]},
               ImageSize -> 400, AspectRatio -> 1]}}]), "Specifications" :> {
          Button[
           Dynamic[
            
            If[$CellContext`trigger == 0, "Play", 
             "Pause"]], $CellContext`trigger = 1 - $CellContext`trigger], 
          Button[
          "Reset", $CellContext`trigger = 0; $CellContext`t = 0; 
           Null], {$CellContext`n$$, {1, 2, 3, 4}}}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{827., {278., 283.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`nLast = 2, $CellContext`trigger = 
         0, $CellContext`t = 0, $CellContext`dt = 0.01, $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]]] = 
         10 UnitStep[-1 + $CellContext`x] + 
          10 UnitStep[-$CellContext`x], $CellContext`xmin = -0.2, \
$CellContext`xmax = 1.2, $CellContext`L = 
         1, $CellContext`$PlotOptions = {PlotStyle -> {{
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
             GrayLevel[1]]}, $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`n, 
            Blank[]]] = 
         Sqrt[2] Sin[$CellContext`n Pi $CellContext`x], $CellContext`Energy[
           Pattern[$CellContext`n, 
            Blank[]]] = ($CellContext`n^2 Pi^2)/2, $CellContext`\[HBar] = 1}; 
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
WindowSize->{863, 595},
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
Cell[1235, 30, 6300, 134, 595, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature XwDVQmzsVAp#WDwErzgIZl4b *)
