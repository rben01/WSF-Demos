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
NotebookDataLength[     17412,        352]
NotebookOptionsPosition[     17715,        344]
NotebookOutlinePosition[     18178,        364]
CellTagsIndexPosition[     18135,        361]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  TagBox[
   StyleBox[
    DynamicModuleBox[{$CellContext`c$$ = 1, $CellContext`t$$ = 0, 
     Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
     Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ = 
     1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
        Hold[$CellContext`c$$], 1, "Active clock"}, {1, 2, 3, 4, 5, 6, 7, 8, 
       9, 10, 11}}, {{
        Hold[$CellContext`t$$], 0, "Set the clock"}, 0, 30, 1}, {
       Hold[
        Row[{
          Button[
           Style[
           "Start time", Bold, FontSize -> 
            15], {$CellContext`tt = 0; $CellContext`gostatus = 
             True; $CellContext`sliderstatus = 
             False; $CellContext`startbuttonstatus = 
             False; $CellContext`stopbuttonstatus = True; Null}, ImageSize -> 
           100, Enabled -> Dynamic[$CellContext`startbuttonstatus]], 
          Button[
           Style[
           "Reset", Bold, FontSize -> 
            15], {$CellContext`gostatus = False; $CellContext`sliderstatus = 
             True; $CellContext`startbuttonstatus = 
             True; $CellContext`stopbuttonstatus = False; $CellContext`tc = 
             Table[0, {$CellContext`i, 1, 11}]; $CellContext`t$$ = 
             0; $CellContext`c$$ = 1; Null}, ImageSize -> 100]}]], 
       Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
     1500., {146., 150.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
     Typeset`skipInitDone$$ = False, $CellContext`c$2647$$ = 
     0, $CellContext`t$2648$$ = 0}, 
     DynamicBox[Manipulate`ManipulateBoxes[
      1, StandardForm, 
       "Variables" :> {$CellContext`c$$ = 1, $CellContext`t$$ = 0}, 
       "ControllerVariables" :> {
         Hold[$CellContext`c$$, $CellContext`c$2647$$, 0], 
         Hold[$CellContext`t$$, $CellContext`t$2648$$, 0]}, 
       "OtherVariables" :> {
        Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
         Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
         Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
         Typeset`initDone$$, Typeset`skipInitDone$$}, 
       "Body" :> (If[$CellContext`gostatus == True, {Do[
             If[$CellContext`tt >= Abs[
                Part[$CellContext`xc, $CellContext`i]], 
              Part[$CellContext`tc, $CellContext`i] = 
              Part[$CellContext`tc, $CellContext`i] + 1], {$CellContext`i, 1, 
              11}]; $CellContext`tt = $CellContext`tt + 1; Pause[0.2]; 
           Null}, {If[$CellContext`k != $CellContext`c$$, $CellContext`t$$ = 
             Part[$CellContext`tc, $CellContext`c$$], 
             Part[$CellContext`tc, $CellContext`c$$] = $CellContext`t$$]; \
$CellContext`k = $CellContext`c$$; Null}]; Show[
          Table[
           $CellContext`clock[
            Part[$CellContext`xc, $CellContext`i], $CellContext`yc, 
            Part[$CellContext`tc, $CellContext`i]], {$CellContext`i, 1, 11}], 
          Graphics[{
            Text[
             Style[
              Row[{""}]], {0, 0}], 
            Inset[
             
             If[$CellContext`gostatus == 
              False, $CellContext`LightbulbOff, $CellContext`LightbulbOn], {
             0, -2}, {Center, Center}, {2, 2}]}], 
          If[$CellContext`gostatus == False, 
           Graphics[{Red, 
             Arrowheads[0.03], 
             Arrow[{{
                Part[$CellContext`xc, $CellContext`c$$], 3}, {
                Part[$CellContext`xc, $CellContext`c$$], 2}}]}], 
           Graphics[{}]], 
          If[$CellContext`gostatus == True, 
           Graphics[{
             Thickness[0.005], Blue, 
             Arrowheads[0.018], 
             Arrow[{{Dynamic[$CellContext`tt] - 1.5, -1.8}, {
                Dynamic[$CellContext`tt], -1.8}}]}], 
           Graphics[{}]], 
          If[$CellContext`gostatus == True, 
           Graphics[{
             Thickness[0.005], Blue, 
             Arrowheads[0.018], 
             
             Arrow[{{-Dynamic[$CellContext`tt] + 1.5, -1.8}, {-
                Dynamic[$CellContext`tt], -1.8}}]}], 
           Graphics[{}]], Ticks -> {
            $CellContext`ticks[-20, 20, 1, 5], {}}, Axes -> {True, False}, 
          PlotRange -> {{-20, 20}, {-4, 4}}, ImageSize -> 1500, LabelStyle -> {
            Directive[Black, 17], FontFamily -> "Calibri"}]), 
       "Specifications" :> {{{$CellContext`c$$, 1, "Active clock"}, {1, 2, 3, 
          4, 5, 6, 7, 8, 9, 10, 11}, ControlType -> RadioButtonBar, Enabled -> 
          Dynamic[$CellContext`sliderstatus]}, {{$CellContext`t$$, 0, 
           "Set the clock"}, 0, 30, 1, Enabled -> 
          Dynamic[$CellContext`sliderstatus]}, Delimiter, 
         Row[{
           Button[
            Style[
            "Start time", Bold, FontSize -> 
             15], {$CellContext`tt = 0; $CellContext`gostatus = 
              True; $CellContext`sliderstatus = 
              False; $CellContext`startbuttonstatus = 
              False; $CellContext`stopbuttonstatus = True; Null}, ImageSize -> 
            100, Enabled -> Dynamic[$CellContext`startbuttonstatus]], 
           Button[
            Style[
            "Reset", Bold, FontSize -> 
             15], {$CellContext`gostatus = False; $CellContext`sliderstatus = 
              True; $CellContext`startbuttonstatus = 
              True; $CellContext`stopbuttonstatus = False; $CellContext`tc = 
              Table[0, {$CellContext`i, 1, 11}]; $CellContext`t$$ = 
              0; $CellContext`c$$ = 1; Null}, ImageSize -> 100]}]}, 
       "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
       "DefaultOptions" :> {}],
      ImageSizeCache->{1520., {215., 220.}},
      SingleEvaluation->True],
     Deinitialization:>None,
     DynamicModuleValues:>{},
     Initialization:>({$CellContext`gostatus = False, $CellContext`tt = 
        16, $CellContext`xc = {-19, -14, -12, -10, -6, 0, 2, 5, 7, 12, 
         18}, $CellContext`tc = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
         0}, $CellContext`k = 1, $CellContext`clock[
          Pattern[$CellContext`x, 
           Blank[]], 
          Pattern[$CellContext`y, 
           Blank[]], 
          Pattern[$CellContext`t, 
           Blank[]]] := Graphics[{
           EdgeForm[
            Thickness[0.003]], Brown, 
           Rectangle[{$CellContext`x - 0.85, $CellContext`y - 
             0.35}, {$CellContext`x + 0.85, $CellContext`y + 0.45}], Black, 
           Thickness[0.003], 
           
           Line[{{$CellContext`x, $CellContext`y - 
              0.4}, {$CellContext`x, $CellContext`y - 1.15}}], 
           Text[
            Style[
             DateString[{0, 0, 0, 
               Floor[$CellContext`t/60], 
               Floor[
                Mod[$CellContext`t, 60]], 0}, {"Hour24", ":", "Minute"}], 
             FontFamily -> "Stencil", Green, 
             20], {$CellContext`x, $CellContext`y}]}], $CellContext`yc = 
        1.2, $CellContext`LightbulbOff = Image[
          RawArray["Byte", CompressedData["
1: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
XqqD2N6elPahO3fuXEa9c1NT02L8pr09Gd/7a6tcIyMjZ3C5TpgwIZniCrN7
tWOhMamnQ300+JgMNu9d1K/9xXJqK3E9DA0NjeRYJk+eHMvsSO0+jMcC5BZ8
vsZly5b5qoKBrY+gj7Tv4+LiEs+xJCYmvi+eV50Y4FOGk1+ieSZOnPiZWDdU
1FfB7pHfS955553DpK+kt5WVlXQmQ6oOW2FyldXW1srMzMwKyLegxjt5+/Zt
krna9ut5XZWfn98bOIRzMnFxcTPUtVZcZ9atW+fB4wRqOo3sFfMzIM7OzmlU
cw0aNGgvu6fyPDznnjZt2h9JFsgFs6gPrYk8gp8n+eKLL4Rcslu3bufhh3WY
Xqgqd0HeDg4OR8m2582bF6cU1RTqJB5Tjh079i7lw1TTHz9+vI/43mvKWViD
S5cuGerr69eQPDZu3KixXJvP9+OPP5rwvHPTpk2/meu0Qs485g7le5cnTpyw
ZnOqPXfgOCoqKnQNDQ1/oTl37Nih8rpxP5GUlDSN9Z/Kb968yftPmoi1HA/V
KGfYfuIcMS+q4AgODl5CY8LG/0ZzKDW0L8b3fMmP9OnTJ5/lnyGq4uC1s4+P
zzcsX9hCODTV5+A4KL9Cznic5pw7d+7vVMHBxqTzupRPpbPeQYyqa9OKOWWE
A7I/RnMGBgaGqwGHQPb29qdoTORTH7UXDmtr68M0J/x8hCo9eu47ULd2gu+o
pDFTUlI0fkaHnU2UjB8/fhvr2X2lVOHcADujTbWGGca7T7EDtdMwTePg/AYF
BQl5NXK6M1Sj4ZqirX1UkuOTJ0860Xf479E8dpSUlPRiGDVWd/K4ffDgwYHs
rBbVBzPYfSnrw7wSD+vny/k+S15enoWRkVExO5d6/O7duzJNn5niew/Uh0AM
OcbO1j5FnbiW4qNY/4hXws1Izn436R/Z2ZdffvkB7OIyr5kQC900rVPNdWvO
nDmrWD9YyfLGovj4eL/r16/rvOr9mpoa+datW92cnJwO0nu0FnK5XMnyg2HM
b7QnDuFcCnTiPK8TJf89k35u6tSpnwOT96FDh4ZQbY1P5w0bNsycMmVKIp2N
589STUZnJlGX1VDumZWV1V+sv+2BY/bs2dHEi7e3dyz4Xiz533l0MT3nNaqY
mD5S3//Xr7/+2hn+j85SKXft2qVxXyXCIcyB9Z7E9n7ueHh4LEc+3wvY1hgY
GFxkef1L/7uCZ34JCwtbVlxcrBMbG0v9mDpge75///6hbI52kwd0eSqLhQuH
DRv2Fzs7u6zTp093u3PnjiQ7O9uOzqIvWrRoBerHZBcXlyTkgZ+tWbPmo9zc
XBt6Bvm/8YgRI3ZYWVllDhgw4M80VmpqqlN7yyMtLW0CrTvs4SpsoEt0dPQC
2Ot5Ly+v9QUFBXYtvXvt2jVD1CwfAFsq/ENxZGRkOHSpp4WFRQWdrSgsLOzX
XvbB4xN0ohf5XNRwpEenUfuY1tbWKhAjV8KX5gNfQa9evTLfe++9fZaWlpnm
5uYnoU+nsfYZkEsQagzhP0rQp5/wPv2/6FF5ebkpm0Pje5N8jitXrhiCh3rk
jDng3Rt2cgkyCeLPIZ68hRrPGT52EtZ8dFlZmSXFDLbe1NuLwxqUuLu7z4Zs
rkO/frh3755E0zFQTLxnNn369DWk1/CnK44cOdIXa70PsiiEzazIyclxRCzp
BhlJsPY6qL+toIuTXF1dk4C5yNPTc+Phw4dNR40atYfGSE5OHt9etsGJ9WFl
dI52+PDh3xEfsNn9sG/Tffv2DQwJCVmBWiuLemm4V2hsbHzS1tY2d/DgwTtj
YmKCEU/eAgZbdl85duzYdZR/iv9f1F7E9EsK36MQ7bMo58+f/znJpqqqSqiB
ofOy6upqGfRQDhvqlpCQ8D7sPJ0/HxAQEIX1kHTkfwL4vKTvyJXcoeM5nD89
Pb1fHR0ds9zc3PY4ODj8oKurWy2KIS9Gjhy5E3YzmI3V4WdUWX4r6AP5oG3b
trkgxm+AH60Q8V0P3foXeN8VERERhDhjKXpfLT3D/wCUja3o
           "]], "Byte", ColorSpace -> "RGB", Interleaving -> 
          True], $CellContext`LightbulbOn = Image[
          RawArray["Byte", CompressedData["
1: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
           "]], "Byte", ColorSpace -> "RGB", Interleaving -> 
          True], $CellContext`ticks[
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
$CellContext`sliderstatus = True, $CellContext`startbuttonstatus = 
        True, $CellContext`stopbuttonstatus = False}; 
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
WindowSize->{1534, 447},
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
Cell[1235, 30, 16476, 312, 447, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature SvDIYCtuKfz7HCgUuLPbr6ML *)
