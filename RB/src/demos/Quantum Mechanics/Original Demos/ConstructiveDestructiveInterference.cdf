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
NotebookDataLength[     10400,        236]
NotebookOptionsPosition[     10694,        227]
NotebookOutlinePosition[     11167,        248]
CellTagsIndexPosition[     11124,        245]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`d$$ = Rational[
      11, 2], $CellContext`\[Theta]$$ = 0, $CellContext`\[Lambda]$$ = 3, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`\[Theta]$$], 0, "Angle (\[Theta])"}, 
        Rational[-1, 4] Pi, Rational[1, 4] Pi}, {{
         Hold[$CellContext`\[Lambda]$$], 3, "Wavelength (\[Lambda])"}, 1, 
        5}, {{
         Hold[$CellContext`d$$], 
         Rational[11, 2], "Slit Separation (d)"}, 1, 10}, {
        Hold[
         Button[
          Dynamic[
           
           Part[$CellContext`playButtonLabels, $CellContext`trigger + 
            1]], $CellContext`trigger = 1 - $CellContext`trigger, ImageSize -> 
          70]], Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      1000., {212., 216.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`\[Theta]$10430$$ = 
      0, $CellContext`\[Lambda]$10431$$ = 0, $CellContext`d$10432$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`d$$ = 
          Rational[11, 2], $CellContext`\[Theta]$$ = 
          0, $CellContext`\[Lambda]$$ = 3}, "ControllerVariables" :> {
          Hold[$CellContext`\[Theta]$$, $CellContext`\[Theta]$10430$$, 0], 
          Hold[$CellContext`\[Lambda]$$, $CellContext`\[Lambda]$10431$$, 0], 
          Hold[$CellContext`d$$, $CellContext`d$10432$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`trigger == 
           1, $CellContext`t = $CellContext`t + $CellContext`dt; 
           Pause[$CellContext`dt]]; Show[{
            ParametricPlot3D[{$CellContext`d$$/
               2 + $CellContext`s ($CellContext`L 
                 Tan[$CellContext`\[Theta]$$] - $CellContext`d$$/
                2), $CellContext`s $CellContext`L, 
              Cos[
              2 Pi ((($CellContext`s ($CellContext`L 
                    Tan[$CellContext`\[Theta]$$] - $CellContext`d$$/
                    2))^2 + ($CellContext`s $CellContext`L)^2)^
                  Rational[
                   1, 2]/$CellContext`\[Lambda]$$ - $CellContext`t)]}, \
{$CellContext`s, 0, 1}, PlotStyle -> {Thick, Blue}], 
            
            ParametricPlot3D[{-($CellContext`d$$/
                2) + $CellContext`s ($CellContext`L 
                 Tan[$CellContext`\[Theta]$$] + $CellContext`d$$/
                 2), $CellContext`s $CellContext`L, 
              Cos[
              2 Pi ((($CellContext`s ($CellContext`L 
                    Tan[$CellContext`\[Theta]$$] + $CellContext`d$$/
                    2))^2 + ($CellContext`s $CellContext`L)^2)^
                  Rational[
                   1, 2]/$CellContext`\[Lambda]$$ - $CellContext`t)]}, \
{$CellContext`s, 0, 1}, PlotStyle -> {Thick, Red}], 
            Graphics3D[{
              Opacity[0.1], 
              
              Polygon[{{$CellContext`xmin, $CellContext`ymax, \
$CellContext`zmin}, {$CellContext`xmin, $CellContext`ymax, \
$CellContext`zmax}, {$CellContext`xmax, $CellContext`ymax, \
$CellContext`zmax}, {$CellContext`xmax, $CellContext`ymax, \
$CellContext`zmin}}]}], 
            Graphics3D[{
              Opacity[0.1], 
              
              Polygon[{{$CellContext`xmin, $CellContext`ymin, \
$CellContext`zmin}, {$CellContext`xmin, $CellContext`ymin, \
$CellContext`zmax}, {(-$CellContext`d$$)/2 - $CellContext`w/
                 2, $CellContext`ymin, $CellContext`zmax}, \
{(-$CellContext`d$$)/2 - $CellContext`w/
                 2, $CellContext`ymin, $CellContext`zmin}}]}], 
            Graphics3D[{
              Opacity[0.1], 
              
              Polygon[{{(-$CellContext`d$$)/2 + $CellContext`w/
                  2, $CellContext`ymin, $CellContext`zmin}, \
{(-$CellContext`d$$)/2 + $CellContext`w/
                  2, $CellContext`ymin, $CellContext`zmax}, {$CellContext`d$$/
                  2 - $CellContext`w/
                 2, $CellContext`ymin, $CellContext`zmax}, {$CellContext`d$$/
                  2 - $CellContext`w/
                 2, $CellContext`ymin, $CellContext`zmin}}]}], 
            Graphics3D[{
              Opacity[0.1], 
              
              Polygon[{{$CellContext`d$$/2 + $CellContext`w/
                  2, $CellContext`ymin, $CellContext`zmin}, {$CellContext`d$$/
                  2 + $CellContext`w/
                  2, $CellContext`ymin, $CellContext`zmax}, \
{$CellContext`xmax, $CellContext`ymin, $CellContext`zmax}, \
{$CellContext`xmax, $CellContext`ymin, $CellContext`zmin}}]}], 
            Graphics3D[{
              PointSize[Large], 
              
              Point[{$CellContext`L 
                Tan[$CellContext`\[Theta]$$], $CellContext`L, 
                Cos[2 Pi ((($CellContext`L 
                    Tan[$CellContext`\[Theta]$$] - $CellContext`d$$/
                    2)^2 + $CellContext`L^2)^
                    Rational[
                    1, 2]/$CellContext`\[Lambda]$$ - $CellContext`t)] + 
                Cos[2 Pi ((($CellContext`L 
                    Tan[$CellContext`\[Theta]$$] + $CellContext`d$$/
                    2)^2 + $CellContext`L^2)^
                    Rational[
                    1, 2]/$CellContext`\[Lambda]$$ - $CellContext`t)]}]}], 
            
            ParametricPlot3D[{{$CellContext`L 
               Tan[$CellContext`s], $CellContext`ymax, 
               2 $CellContext`Intensity[$CellContext`s, \
$CellContext`\[Lambda]$$, $CellContext`d$$]}, {$CellContext`L 
               Tan[$CellContext`s], $CellContext`ymax, (-2) \
$CellContext`Intensity[$CellContext`s, $CellContext`\[Lambda]$$, \
$CellContext`d$$]}}, {$CellContext`s, $CellContext`\[Theta]min, $CellContext`\
\[Theta]max}, PlotStyle -> {{Dashed, Black}, {Dashed, Black}}], 
            Graphics3D[{Thick, 
              
              Line[{{$CellContext`L 
                 Tan[$CellContext`\[Theta]$$], $CellContext`ymax, \
$CellContext`zmin}, {$CellContext`L 
                 Tan[$CellContext`\[Theta]$$], $CellContext`ymax, \
$CellContext`zmax}}]}], 
            Graphics3D[{Arrowheads -> Small, 
              
              Arrow[{{0, $CellContext`ymin, $CellContext`zmax + 
                 0.5}, {$CellContext`d$$/
                 2, $CellContext`ymin, $CellContext`zmax + 0.5}}], 
              
              Arrow[{{0, $CellContext`ymin, $CellContext`zmax + 
                 0.5}, {(-$CellContext`d$$)/
                 2, $CellContext`ymin, $CellContext`zmax + 0.5}}]}], 
            Graphics3D[
             Text[
              Style["d", FontSize -> 15, FontFamily -> "Helvetica"], {
              0, $CellContext`ymin, $CellContext`zmax + 0.9}]]}, 
           PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, \
{$CellContext`ymin, $CellContext`ymax}, {$CellContext`zmin, $CellContext`zmax + 
              1}}, Boxed -> False, Axes -> False, ImageSize -> 1000, 
           ViewPoint -> {$CellContext`xmax, $CellContext`ymax 
             2, $CellContext`zmax 10}]), 
        "Specifications" :> {{{$CellContext`\[Theta]$$, 0, 
            "Angle (\[Theta])"}, Rational[-1, 4] Pi, Rational[1, 4] 
           Pi}, {{$CellContext`\[Lambda]$$, 3, "Wavelength (\[Lambda])"}, 1, 
           5}, {{$CellContext`d$$, 
            Rational[11, 2], "Slit Separation (d)"}, 1, 10}, 
          Button[
           Dynamic[
            
            Part[$CellContext`playButtonLabels, $CellContext`trigger + 
             1]], $CellContext`trigger = 1 - $CellContext`trigger, ImageSize -> 
           70]}, "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1020., {289., 294.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`trigger = 0, $CellContext`t = 
         8.649999999999988, $CellContext`dt = 0.05, $CellContext`L = 
         20, $CellContext`xmin = -20, $CellContext`ymax = 
         20, $CellContext`zmin = -2, $CellContext`zmax = 2, $CellContext`xmax = 
         20, $CellContext`ymin = 0, $CellContext`w = 1, $CellContext`Intensity[
           Pattern[$CellContext`\[Theta], 
            Blank[]], 
           Pattern[$CellContext`\[Lambda], 
            Blank[]], 
           Pattern[$CellContext`d, 
            Blank[]]] = 
         Cos[($CellContext`d Pi 
             Sin[$CellContext`\[Theta]])/$CellContext`\[Lambda]]^2, \
$CellContext`\[Theta]min = -Pi/4, $CellContext`\[Theta]max = 
         Pi/4, $CellContext`playButtonLabels = {"Play", "Pause"}}; 
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
WindowSize->{1056, 617},
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
Cell[1235, 30, 9455, 195, 617, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature VuD21gRrEic1vDKHxgNYi7vp *)
