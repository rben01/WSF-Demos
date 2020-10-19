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
NotebookDataLength[     13982,        315]
NotebookOptionsPosition[     14285,        307]
NotebookOutlinePosition[     14748,        327]
CellTagsIndexPosition[     14705,        324]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`h$$ = 1, $CellContext`k$$ = 
      0.5, $CellContext`w$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`k$$], 0.5, "Wavenumber of Particle"}, 0.1, 2}, {{
         Hold[$CellContext`w$$], 1, "Width of Barrier"}, 0, 2}, {{
         Hold[$CellContext`h$$], 1, "Height of Barrier"}, 0, 2}}, 
      Typeset`size$$ = {1276., {126.5, 135.5}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`k$10720$$ = 0, $CellContext`w$10721$$ = 
      0, $CellContext`h$10722$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`h$$ = 1, $CellContext`k$$ = 
          0.5, $CellContext`w$$ = 1}, "ControllerVariables" :> {
          Hold[$CellContext`k$$, $CellContext`k$10720$$, 0], 
          Hold[$CellContext`w$$, $CellContext`w$10721$$, 0], 
          Hold[$CellContext`h$$, $CellContext`h$10722$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> Grid[{{
            Show[{
              (Plot[
               $CellContext`V[$CellContext`x, $CellContext`w$$, \
$CellContext`h$$], {$CellContext`x, -3, 3}, Exclusions -> None, Filling -> 
               Axis, FillingStyle -> Opacity[0.3], PlotRange -> {-2, 2}, 
               ImageSize -> 400, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              (Plot[
               Re[
                $CellContext`\[Psi]E[$CellContext`x, $CellContext`k$$, \
$CellContext`w$$, $CellContext`h$$]], {$CellContext`x, -3, 3}, Exclusions -> 
               None, PlotRange -> {-2, 2}, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              Graphics[
               
               Line[{{-3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}, {
                 3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}}]], 
              Graphics[
               Text[
                Style[
                "Energy of Particle", FontSize -> 12, FontFamily -> 
                 "Helvetica"], {-1, 
                 
                 Min[$CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                    2 $CellContext`m)) + 0.2, 1.8]}]]}], 
            Show[{
              (Plot[
               $CellContext`V[$CellContext`x, $CellContext`w$$, \
$CellContext`h$$], {$CellContext`x, -3, 3}, Exclusions -> None, Filling -> 
               Axis, FillingStyle -> Opacity[0.3], PlotRange -> {-2, 2}, 
               ImageSize -> 400, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              (Plot[
               Im[
                $CellContext`\[Psi]E[$CellContext`x, $CellContext`k$$, \
$CellContext`w$$, $CellContext`h$$]], {$CellContext`x, -3, 3}, Exclusions -> 
               None, PlotRange -> {-2, 2}, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              Graphics[
               
               Line[{{-3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}, {
                 3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}}]], 
              Graphics[
               Text[
                Style[
                "Energy of Particle", FontSize -> 12, FontFamily -> 
                 "Helvetica"], {-1, 
                 
                 Min[$CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                    2 $CellContext`m)) + 0.2, 1.8]}]]}], 
            Show[{
              (Plot[
               $CellContext`V[$CellContext`x, $CellContext`w$$, \
$CellContext`h$$], {$CellContext`x, -3, 3}, Exclusions -> None, Filling -> 
               Axis, FillingStyle -> Opacity[0.3], PlotRange -> {-2, 2}, 
               ImageSize -> 400, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              (Plot[
               Abs[
                $CellContext`\[Psi]E[$CellContext`x, $CellContext`k$$, \
$CellContext`w$$, $CellContext`h$$]], {$CellContext`x, -3, 3}, Exclusions -> 
               None, PlotRange -> {-2, 2}, ColorFunctionScaling -> False, 
               ColorFunction -> {
                 Function[{$CellContext`x$, $CellContext`y$}, 
                  ColorData["Rainbow"][Mod[
                    Arg[
                    $CellContext`\[Psi]E[$CellContext`x$, $CellContext`k$$, \
$CellContext`w$$, $CellContext`h$$]], 2 Pi]/(2 Pi)]]}, #]& )[
               Sequence[$CellContext`$PlotOptions]], 
              Graphics[
               
               Line[{{-3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}, {
                 3, $CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                   2 $CellContext`m))}}]], 
              Graphics[
               Text[
                Style[
                "Energy of Particle", FontSize -> 12, FontFamily -> 
                 "Helvetica"], {-1, 
                 
                 Min[$CellContext`\[HBar]^2 ($CellContext`k$$^2/(
                    2 $CellContext`m)) + 0.2, 1.8]}]]}]}}, Spacings -> 2], 
        "Specifications" :> {{{$CellContext`k$$, 0.5, 
            "Wavenumber of Particle"}, 0.1, 
           2}, {{$CellContext`w$$, 1, "Width of Barrier"}, 0, 
           2}, {{$CellContext`h$$, 1, "Height of Barrier"}, 0, 2}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1296., {210., 219.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`w, 
            Blank[]], 
           Pattern[$CellContext`V0, 
            Blank[]]] = $CellContext`V0 (UnitStep[$CellContext`x] - 
           UnitStep[-$CellContext`w + $CellContext`x]), \
$CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`\[Psi]E[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`w, 
            Blank[]], 
           Pattern[$CellContext`h, 
            Blank[]]] = 
         Piecewise[{{
            E^(I $CellContext`k $CellContext`x) + ((-1 + 
                E^((2 I) (1/1000 + 
                   Sqrt[2] 
                    Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w)) ($CellContext`k^2 - (1/1000 + 
                 Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2))/(
              E^(I $CellContext`k $CellContext`x) (-$CellContext`k^2 + 
               E^((2 I) (1/1000 + 
                   Sqrt[2] 
                    Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k^2 - 
               2 $CellContext`k (1/1000 + 
                Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - 2 
               E^((2 I) (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k (1/1000 + 
                Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - (1/1000 + 
                Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2 + 
               E^((2 I) (1/1000 + 
                   Sqrt[2] 
                    Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/
                    2])^2)), $CellContext`x < 
             0}, {(2 E^((2 I) (1/1000 + 
                   Sqrt[2] 
                    Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w - 
                 I (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`x) $CellContext`k ((-1)/
                 1000 + $CellContext`k - Sqrt[2] 
                Sqrt[-$CellContext`h + $CellContext`k^2/
                   2]))/(-$CellContext`k^2 + 
              E^((2 I) (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k^2 - 
              2 $CellContext`k (1/1000 + 
               Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - 2 
              E^((2 I) (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k (1/1000 + 
               Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - (1/1000 + 
               Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2 + 
              E^((2 I) (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) (1/1000 + 
                 Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2) - (2 
              E^(I (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`x) $CellContext`k (
               1/1000 + $CellContext`k + 
               Sqrt[2] 
                Sqrt[-$CellContext`h + $CellContext`k^2/
                   2]))/(-$CellContext`k^2 + 
             E^((2 I) (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k^2 - 
             2 $CellContext`k (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - 2 
             E^((2 I) (1/1000 + 
                Sqrt[2] 
                 Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2 + 
             E^((2 I) (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) (1/1000 + 
                Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2), 
             
             And[$CellContext`x > 
              0, $CellContext`x < $CellContext`w]}, {((-4) 
              E^((-I) $CellContext`k $CellContext`w + 
                I (1/1000 + 
                  Sqrt[2] 
                   Sqrt[-$CellContext`h + $CellContext`k^2/2]) $CellContext`w + 
                I $CellContext`k $CellContext`x) $CellContext`k (1/1000 + 
               Sqrt[2] 
                Sqrt[-$CellContext`h + $CellContext`k^2/
                   2]))/(-$CellContext`k^2 + 
             E^((2 I) (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k^2 - 
             2 $CellContext`k (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - 2 
             E^((2 I) (1/1000 + 
                Sqrt[2] 
                 Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) $CellContext`k (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2]) - (1/1000 + 
              Sqrt[2] Sqrt[-$CellContext`h + $CellContext`k^2/2])^2 + 
             E^((2 I) (1/1000 + 
                 Sqrt[2] 
                  Sqrt[-$CellContext`h + $CellContext`k^2/
                    2]) $CellContext`w) (1/1000 + 
                Sqrt[2] 
                 Sqrt[-$CellContext`h + $CellContext`k^2/
                    2])^2), $CellContext`x > $CellContext`w}}, 
           0], $CellContext`\[HBar] = 1, $CellContext`m = 1}; 
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
WindowSize->{1338, 469},
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
Cell[1235, 30, 13046, 275, 469, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature XuDDdNGiEzL32AgguiCvSZro *)
