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
NotebookDataLength[      8785,        188]
NotebookOptionsPosition[      9080,        179]
NotebookOutlinePosition[      9552,        200]
CellTagsIndexPosition[      9509,        197]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`dispersion$$ = 1, $CellContext`k1$$ = 
      0, $CellContext`k2$$ = 0, $CellContext`t$$ = 
      0, $CellContext`\[Omega]$$ = 0, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{
        Hold[$CellContext`dispersion$$], {
        1 -> "Nonrelativistic: \[Omega] = \[HBar] \
\!\(\*SuperscriptBox[OverscriptBox[\(k\), \(\[RightVector]\)], \(2\)]\)/2m", 
         2 -> "Relativistic: \[Omega] = c |\!\(\*OverscriptBox[\(k\), \(\
\[RightVector]\)]\)|", 3 -> "Choose your own \[Omega] freely"}}, {{
         Hold[$CellContext`k1$$], 0, 
         "Wavenumber in x direction, \!\(\*SubscriptBox[\(k\), \(x\)]\)"}, -1,
         1}, {{
         Hold[$CellContext`k2$$], 0, 
         "Wavenumber in y direction, \!\(\*SubscriptBox[\(k\), \(y\)]\)"}, -1,
         1}, {{
         Hold[$CellContext`\[Omega]$$], 0, "Angular Frequency, \[Omega]"}, 0, 
        1}, {{
         Hold[$CellContext`t$$], 0, 
         Style["Watch the Wave Move", FontSize -> 15]}, 0, 
        DirectedInfinity[1], 0.1}}, Typeset`size$$ = {800., {135., 139.}}, 
      Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`dispersion$676329$$ = 
      False, $CellContext`k1$676330$$ = 0, $CellContext`k2$676331$$ = 
      0, $CellContext`\[Omega]$676332$$ = 0, $CellContext`t$676333$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`dispersion$$ = 
          1 -> "Nonrelativistic: \[Omega] = \[HBar] \
\!\(\*SuperscriptBox[OverscriptBox[\(k\), \(\[RightVector]\)], \(2\)]\)/2m", \
$CellContext`k1$$ = 0, $CellContext`k2$$ = 0, $CellContext`t$$ = 
          0, $CellContext`\[Omega]$$ = 0}, "ControllerVariables" :> {
          
          Hold[$CellContext`dispersion$$, $CellContext`dispersion$676329$$, 
           False], 
          Hold[$CellContext`k1$$, $CellContext`k1$676330$$, 0], 
          Hold[$CellContext`k2$$, $CellContext`k2$676331$$, 0], 
          Hold[$CellContext`\[Omega]$$, $CellContext`\[Omega]$676332$$, 0], 
          Hold[$CellContext`t$$, $CellContext`t$676333$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`dispersion$$ == 
           1, $CellContext`\[Omega]$$ = $CellContext`\[HBar] \
(($CellContext`k1$$^2 + $CellContext`k2$$^2)/(2 $CellContext`m))]; 
         If[$CellContext`dispersion$$ == 
           2, $CellContext`\[Omega]$$ = $CellContext`c ($CellContext`k1$$^2 + \
$CellContext`k2$$^2)^Rational[1, 2]]; GraphicsGrid[{{
             (Plot3D[
              
              Cos[$CellContext`k1$$ $CellContext`x + $CellContext`k2$$ \
$CellContext`y - $CellContext`\[Omega]$$ ($CellContext`t$$/$CellContext`\
\[HBar])], {$CellContext`x, $CellContext`xmin, $CellContext`xmax}, \
{$CellContext`y, $CellContext`ymin, $CellContext`ymax}, 
              PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
              Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                 2, $CellContext`xmax/
                 2, $CellContext`xmax}, {$CellContext`ymin, $CellContext`ymin/
                 2, $CellContext`ymax/2, $CellContext`ymax}, {-1, 1}}, 
              PlotLabel -> "Re(\[Psi](x,t))", PerformanceGoal -> 
              "Quality", #]& )[
              Sequence[$CellContext`$Plot3DOptions]], 
             (Plot3D[
              
              Sin[$CellContext`k1$$ $CellContext`x + $CellContext`k2$$ \
$CellContext`y - $CellContext`\[Omega]$$ ($CellContext`t$$/$CellContext`\
\[HBar])], {$CellContext`x, $CellContext`xmin, $CellContext`xmax}, \
{$CellContext`y, $CellContext`ymin, $CellContext`ymax}, 
              PlotRange -> {-1.1, 1.1}, ImageSize -> 400, 
              Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                 2, $CellContext`xmax/
                 2, $CellContext`xmax}, {$CellContext`ymin, $CellContext`ymin/
                 2, $CellContext`ymax/2, $CellContext`ymax}, {-1, 1}}, 
              PlotLabel -> "Im(\[Psi](x,t))", PerformanceGoal -> 
              "Quality", #]& )[
              Sequence[$CellContext`$Plot3DOptions]], 
             (Plot3D[
             1, {$CellContext`x, $CellContext`xmin, $CellContext`xmax}, \
{$CellContext`y, $CellContext`ymin, $CellContext`ymax}, PlotRange -> {0, 1.1},
               PlotStyle -> {
                Thickness[0.01]}, ColorFunctionScaling -> False, 
              ColorFunction -> {
                Function[{$CellContext`x$, $CellContext`y$}, 
                 ColorData["Rainbow"][
                 Mod[$CellContext`k1$$ $CellContext`x$ + $CellContext`k2$$ \
$CellContext`y$ - $CellContext`\[Omega]$$ ($CellContext`t$$/$CellContext`\
\[HBar]), 2 Pi]/(2 Pi)]]}, ImageSize -> 400, 
              Ticks -> {{$CellContext`xmin, $CellContext`xmin/
                 2, $CellContext`xmax/
                 2, $CellContext`xmax}, {$CellContext`ymin, $CellContext`ymin/
                 2, $CellContext`ymax/2, $CellContext`ymax}, {1}}, PlotLabel -> 
              "\[Psi](x,t)", #]& )[
              Sequence[$CellContext`$Plot3DOptions]]}}, ImageSize -> 800]), 
        "Specifications" :> {{$CellContext`dispersion$$, {
           1 -> "Nonrelativistic: \[Omega] = \[HBar] \
\!\(\*SuperscriptBox[OverscriptBox[\(k\), \(\[RightVector]\)], \(2\)]\)/2m", 
            2 -> "Relativistic: \[Omega] = c |\!\(\*OverscriptBox[\(k\), \(\
\[RightVector]\)]\)|", 3 -> 
            "Choose your own \[Omega] freely"}}, {{$CellContext`k1$$, 0, 
            "Wavenumber in x direction, \!\(\*SubscriptBox[\(k\), \(x\)]\)"}, \
-1, 1}, {{$CellContext`k2$$, 0, 
            "Wavenumber in y direction, \!\(\*SubscriptBox[\(k\), \(y\)]\)"}, \
-1, 1}, {{$CellContext`\[Omega]$$, 0, "Angular Frequency, \[Omega]"}, 0, 1}, 
          Delimiter, {{$CellContext`t$$, 0, 
            Style["Watch the Wave Move", FontSize -> 15]}, 0, 
           DirectedInfinity[1], 0.1, ControlType -> Trigger, 
           AppearanceElements -> {"PlayPauseButton"}}}, 
        "Options" :> {
         SynchronousUpdating -> True, ContinuousAction -> False, Paneled -> 
          False}, "DefaultOptions" :> {}],
       ImageSizeCache->{820., {229., 234.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`dispersion$$ = 1, $CellContext`\[HBar] = 
         1, $CellContext`m = 1, $CellContext`c = 1, $CellContext`t$$ = 
         0, $CellContext`xmin = -10, $CellContext`xmax = 
         10, $CellContext`ymin = -10, $CellContext`ymax = 
         10, $CellContext`$Plot3DOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], LabelStyle -> {
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
WindowSize->{856, 497},
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
Cell[1235, 30, 7841, 147, 497, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 1uDfhkIIkG5fYAK0aCzOqGdV *)
