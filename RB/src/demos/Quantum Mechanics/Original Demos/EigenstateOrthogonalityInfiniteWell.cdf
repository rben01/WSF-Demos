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
NotebookDataLength[      9454,        216]
NotebookOptionsPosition[      9758,        208]
NotebookOutlinePosition[     10221,        228]
CellTagsIndexPosition[     10178,        225]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`m$$ = 1, $CellContext`n$$ = 1, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{
        Hold[$CellContext`m$$], 1, 10, 1}, {
        Hold[$CellContext`n$$], 1, 10, 1}}, Typeset`size$$ = {
      1292., {287., 291.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`m$118233$$ = 
      0, $CellContext`n$118234$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`m$$ = 1, $CellContext`n$$ = 1}, 
        "ControllerVariables" :> {
          Hold[$CellContext`m$$, $CellContext`m$118233$$, 0], 
          Hold[$CellContext`n$$, $CellContext`n$118234$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> 
        GraphicsGrid[{{
            GraphicsColumn[{
              Show[{
                (
                Plot[{(2/$CellContext`L)^Rational[1, 2] 
                  Sin[Pi $CellContext`n$$ ($CellContext`x/$CellContext`L)]}, \
{$CellContext`x, 0, $CellContext`L}, ImageSize -> 400, 
                 PlotRange -> {(-(2/$CellContext`L)^Rational[1, 2]) 
                   1.5, (2/$CellContext`L)^Rational[1, 2] 1.5}, PlotLabel -> 
                 Subscript["\[Psi]", 
                   ToString[$CellContext`n$$]], #]& )[
                 
                 Sequence[$CellContext`$PlotOptions]], \
$CellContext`PotentialPlot, 
                Graphics[
                 Text[
                  Style[
                   StringJoin["n = ", 
                    ToString[$CellContext`n$$]], FontSize -> 
                   20], {$CellContext`L/2, (-2.5)/$CellContext`L}]]}], 
              Show[{
                (
                Plot[{(2/$CellContext`L)^Rational[1, 2] 
                  Sin[Pi $CellContext`m$$ ($CellContext`x/$CellContext`L)]}, \
{$CellContext`x, -0.001, $CellContext`L}, ImageSize -> 400, 
                 PlotRange -> {(-(2/$CellContext`L)^Rational[1, 2]) 
                   1.5, (2/$CellContext`L)^Rational[1, 2] 1.5}, PlotLabel -> 
                 Subscript["\[Psi]", 
                   ToString[$CellContext`m$$]], #]& )[
                 
                 Sequence[$CellContext`$PlotOptions]], \
$CellContext`PotentialPlot, 
                Graphics[
                 Text[
                  Style[
                   StringJoin["m = ", 
                    ToString[$CellContext`m$$]], FontSize -> 
                   20], {$CellContext`L/2, (-2.5)/$CellContext`L}]]}]}], 
            Show[{
              (
              Plot[{(2/$CellContext`L)^Rational[1, 2] 
                Sin[Pi $CellContext`n$$ ($CellContext`x/$CellContext`L)] (
                  2/$CellContext`L)^Rational[1, 2] 
                Sin[Pi $CellContext`m$$ ($CellContext`x/$CellContext`L)]}, \
{$CellContext`x, 0, $CellContext`L}, ImageSize -> 400, 
               PlotRange -> {(-(2/$CellContext`L)) 1.5, (2/$CellContext`L) 
                 1.5}, Filling -> Axis, ColorFunctionScaling -> False, 
               ColorFunction -> Function[{$CellContext`x, $CellContext`y}, 
                 RGBColor[1, 
                  UnitStep[$CellContext`y], 1 - 
                  UnitStep[$CellContext`y]]], #]& )[
               
               Sequence[$CellContext`$PlotOptions]], \
$CellContext`PotentialPlot, 
              Graphics[
               Text[
                Style[
                 StringJoin["Integral = ", 
                  ToString[
                   If[$CellContext`n$$ == $CellContext`m$$, 1, 0]]], FontSize -> 
                 20], {$CellContext`L/2, (-2.5)/$CellContext`L}]]}, PlotLabel -> 
             "Product of the two wave functions", ImageSize -> 600]}}], 
        "Specifications" :> {{$CellContext`m$$, 1, 10, 1}, {$CellContext`n$$, 
           1, 10, 1}}, "Options" :> {Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1312., {349., 358.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`L = 3, 
         Attributes[Subscript] = {NHoldRest}, $CellContext`$PlotOptions = {
          PlotStyle -> {
             RGBColor[0, 0, 1]}, 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, 
           LabelStyle -> {FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
            FontSize -> 18, FontFamily -> 
             "Helvetica"}}, $CellContext`PotentialPlot = Graphics[
           GraphicsComplex[CompressedData["
1:eJx11Q1Qk3UcB/CHDWbopMQEN8K1sXRizMNIXoKaL3NCp6Q5QqYHm7xKrQ4l
jZN0lAwOW42NBsgEC9oN6fQIhOIlJJUXxRbKIbtpFG86BLkhbKCwrLPfL+f1
3D23+9z39/ye5/+y52FKPtyZQCIIIu3x+ffvpDaww26//zPxz8HmVVGuKkmm
e+Blau+O+IN3wdviPH/I3TIMjlicqqjgDIDHmqznNih+Bw/dTqlserMPHBoe
JbMldYNDzPfSN0rawAcySpLC6mqx/s7t4pCrBW8RTw5PWweD/2szeE5DWfBn
zxWwxlD0xw79DbCyNzbG74ER/HVnzyx7oB98qp35XmjoILhXfolQikbAcayq
N7KbzWD6p+Zf6kfGwPnG2nF+5QS45ngHqSbaApYuyW3imSfBhoXmFq12Cnxl
cHo/LcAKjr8WVVLUagOXvxLtYU6bBWfudQncTXkEtpN2lRU2zIFX1E99ZUq2
g83fMdWlRwjevy7i0Jx/FDqBC4oT28Qvk8Cx6r3XqCPouc0VM6XNZPCdoY2H
W+XOYF2Yv1eX2AVcfTx9SZIfBXxCuO9t8hQ6xHRaL+9aAA54d73opOa5J2bz
SDIvf02aK7h0fWVEQfhCcI5JUcdyXwTmB1/cWjiK3p4d6ac9TwWvFH0uLM9c
DO4edv1GJXQDd0qGNrgzngdnjmyz2O3od7plfk7ScdiPP6luqSdWXADHtwy2
cDeXgZf28QZWM6th/gcKszL4Yhxvnef7Wcp1OF4vM2cLzQXHy66g0XO/xPtX
GN3ad/V9D/1ZKltukFoH/YOsFgl7DfbfzaCPbiJj/+X+PV38w+lwvSLEPT9R
g/Ufv/6b1CMB68vINaO+Yaehv2Tlmt6lL2A9LfUGo3MYLU8szQiczIf+9SkR
lKgjmN/MCaZG0rD/9MmUVaulx3C/LzJ6H6rG+uZDPsFbfUogt4YJlHkkzCt9
GgY5RvR2WWJLlxSdc3nWEM2IgetnWNO94+X/yavHYlIn0YHnVdxIsgLfJ2ud
9l+wFoJbw4XStoe4fy1HuYKb1/H65V8c1Lomo/eIquhHT8TCfFzkOtf6nsLc
4CZuoo+hPfTzvo1BcpzvNkHWJ/2Yn/HWC14VHICcF5Vha5jB/CXqR6R5sQZy
XaRpT4INn9eDm2w7a8D6+fyHebp49H3BMXWC6AN4Xn1A3rftxZg/aCyWWu6i
s1kB+rTrn8H9stNlr+24hfkyJidn3Uwyrq9zjV41/cz64PcmbhV10wTmuv6h
Fxsf/f9+dswd19ux/9PfN8fcsf/j9+tT/3+C+Av9SLrE
            "], {{{}, {
               EdgeForm[], 
               Directive[{
                 Opacity[0.2], 
                 Hue[0.67, 0.6, 0.6]}], 
               GraphicsGroup[{
                 
                 Polygon[{{62, 113, 114, 50, 58, 49, 48, 47, 46, 45, 44, 43, 
                  42, 57, 41, 65, 56, 71}}], 
                 
                 Polygon[{{1, 111, 112, 104, 86, 97, 63, 69, 53, 59, 10, 52, 
                  9, 8, 7, 6, 5, 4, 3, 2, 51}}]}]}, {}, {}}, {{}, {}, {
               Hue[0.67, 0.6, 0.6], 
               
               Line[{1, 51, 2, 3, 4, 5, 6, 7, 8, 9, 52, 10, 59, 53, 69, 63, 
                97, 86, 104}], 
               
               Line[{78, 102, 91, 72, 100, 89, 81, 11, 93, 82, 74, 66, 60, 54,
                 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 
                27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 94, 83, 
                75, 67, 61, 55, 96, 85, 77, 70, 64, 98, 87, 79, 73, 40, 95, 
                84, 76, 101, 90, 68, 99, 88, 105, 80, 103, 92, 106}], 
               
               Line[{62, 71, 56, 65, 41, 57, 42, 43, 44, 45, 46, 47, 48, 49, 
                58, 50}]}, {
               Directive[{
                 Opacity[0.2], 
                 Hue[0.67, 0.6, 0.6]}], 
               Line[{108, 107}], 
               Line[{110, 109}]}}, {{}, {}, {}}}], {
           AspectRatio -> GoldenRatio^(-1), Axes -> True, 
            AxesOrigin -> {0, 0}, Method -> {"AxesInFront" -> True}, 
            PlotRange -> {{-1, 4}, {0., 10.}}, PlotRangeClipping -> True, 
            PlotRangePadding -> {
              Scaled[0.02], 
              Scaled[0.02]}, Ticks -> False}], $CellContext`m$$ = 1}; 
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
WindowSize->{1354, 747},
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
Cell[1235, 30, 8519, 176, 747, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Sw0HWBgCV@a7wDgROKn#UfbU *)
