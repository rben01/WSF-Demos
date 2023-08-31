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
NotebookDataLength[     23249,        502]
NotebookOptionsPosition[     23552,        494]
NotebookOutlinePosition[     24015,        514]
CellTagsIndexPosition[     23972,        511]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`enn$$ = 1, $CellContext`m$$ = 
      0.1, $CellContext`V$$ = 5, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`V$$], 5, "Height of the barrier"}, 5, 100, 1}, {{
         Hold[$CellContext`m$$], 0.1, "Mass of the particle"}, 0.1, 0.5}, {{
         Hold[$CellContext`enn$$], 1, "Energy of the particle"}, 1, 
        Dynamic[2 $CellContext`V$$]}}, Typeset`size$$ = {800., {247., 254.}}, 
      Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`V$871$$ = 0, $CellContext`m$872$$ = 
      0, $CellContext`enn$873$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`enn$$ = 1, $CellContext`m$$ = 
          0.1, $CellContext`V$$ = 5}, "ControllerVariables" :> {
          Hold[$CellContext`V$$, $CellContext`V$871$$, 0], 
          Hold[$CellContext`m$$, $CellContext`m$872$$, 0], 
          Hold[$CellContext`enn$$, $CellContext`enn$873$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> Show[
          (
          Plot[$CellContext`V$$, {$CellContext`x, 0, 10}, 
           AxesOrigin -> {0, 0}, 
           PlotRange -> {{-10, 10}, {0, 2 $CellContext`V$$ 1.13}}, 
           PlotStyle -> {Black}, ImageSize -> 800, Ticks -> {Automatic, 
             $CellContext`ticks[
             0, 2 $CellContext`V$$ 1.13, 
              0.5, (Quotient[$CellContext`V$$, 25] + 1) 4]}, Filling -> 
           Bottom, #]& )[
           Sequence[$CellContext`$PlotOptions]], 
          Graphics[
           Line[{{0, 0}, {0, $CellContext`V$$}}]], 
          (Plot[(2 $CellContext`V$$ (0.1/1.4)) Abs[
               $CellContext`\[Psi][$CellContext`m$$, $CellContext`enn$$, \
$CellContext`V$$, $CellContext`x]]^2 + $CellContext`enn$$, {$CellContext`x, \
-10, 10}, PlotRange -> All, ImageSize -> 800, #]& )[
           Sequence[$CellContext`$PlotOptions]], 
          (
          Plot[$CellContext`enn$$, {$CellContext`x, -10, 10}, 
           PlotStyle -> {Dashed, Red, Thick}, #]& )[
           Sequence[$CellContext`$PlotOptions]]], 
        "Specifications" :> {{{$CellContext`V$$, 5, "Height of the barrier"}, 
           5, 100, 1}, {{$CellContext`m$$, 0.1, "Mass of the particle"}, 0.1, 
           0.5}, Delimiter, {{$CellContext`enn$$, 1, 
            "Energy of the particle"}, 1, 
           Dynamic[2 $CellContext`V$$]}}, 
        "Options" :> {ControlPlacement -> Left, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1157., {265., 272.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`ticks[
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
           BaseStyle -> {
            FontSize -> 18, FontFamily -> "Helvetica"}}, $CellContext`\[Psi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]]] := 
         Which[$CellContext`x <= -$CellContext`b, 
           Exp[(I $CellContext`k[$CellContext`m, $CellContext`en]) \
$CellContext`x] + $CellContext`a2[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[((-I) $CellContext`k[$CellContext`m, $CellContext`en]) \
$CellContext`x], -$CellContext`b <= $CellContext`x <= -$CellContext`a, \
$CellContext`a3[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`x] + $CellContext`a4[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[(-$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V]) $CellContext`x], -$CellContext`a <= $CellContext`x <= \
$CellContext`a, $CellContext`a5[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[(I $CellContext`k[$CellContext`m, $CellContext`en]) \
$CellContext`x] + $CellContext`a6[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[((-I) $CellContext`k[$CellContext`m, $CellContext`en]) \
$CellContext`x], $CellContext`a <= $CellContext`x <= $CellContext`b, \
$CellContext`a7[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`x] + $CellContext`a8[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en], \
$CellContext`a, $CellContext`b] 
            Exp[(-$CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V]) $CellContext`x], $CellContext`b <= $CellContext`x, \
$CellContext`a9[
             $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
             $CellContext`k[$CellContext`m, $CellContext`en], $CellContext`a, \
$CellContext`b] 
           Exp[(I $CellContext`k[$CellContext`m, $CellContext`en]) \
$CellContext`x]], $CellContext`\[Psi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]]] := 
         Which[$CellContext`x <= 0, 
           Exp[I $CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`x] + $CellContext`a2[
              $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
              $CellContext`k[$CellContext`m, $CellContext`en]] 
            Exp[(-I) $CellContext`k[$CellContext`m, $CellContext`en] \
$CellContext`x], $CellContext`x > 0, $CellContext`a3[
             $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V], 
             $CellContext`k[$CellContext`m, $CellContext`en]] 
           Exp[I $CellContext`\[Chi][$CellContext`m, $CellContext`en, \
$CellContext`V] $CellContext`x]], $CellContext`k[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]]] := 
         Sqrt[(2 $CellContext`m) $CellContext`en], $CellContext`a2[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]]] := -1 + (
            2 $CellContext`k)/($CellContext`k + $CellContext`\[Chi]), \
$CellContext`a2[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := -((((E^((2 $CellContext`a) $CellContext`\[Chi]) - 
              E^((2 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)) (
             E^(((4 I) $CellContext`a) $CellContext`k + (
                  2 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k - 
                I $CellContext`\[Chi])^2 - 
             E^((2 $CellContext`a) ((2 
                  I) $CellContext`k + $CellContext`\[Chi])) ($CellContext`k + 
               I $CellContext`\[Chi])^2 + 
             E^((2 $CellContext`b) $CellContext`\[Chi]) ((-
                  I) $CellContext`k + $CellContext`\[Chi])^2 - 
             E^((2 $CellContext`a) $CellContext`\[Chi]) (
               I $CellContext`k + $CellContext`\[Chi])^2))/(
           E^(((2 I) $CellContext`b) $CellContext`k) ((-
              E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
               I $CellContext`\[Chi])^4 - 
            E^((4 $CellContext`a) $CellContext`\[Chi]) (
              I $CellContext`k + $CellContext`\[Chi])^4 + (2 
              E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
            E^((4 $CellContext`a) (
                I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
            E^(((4 I) $CellContext`a) $CellContext`k + (
                 4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
             E^(((4 I) $CellContext`a) $CellContext`k + (
                 
                 2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2))), $CellContext`\[Chi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]]] := 
         Sqrt[(2 $CellContext`m) ($CellContext`en - $CellContext`V)], \
$CellContext`a3[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]]] := (
           2 $CellContext`k)/($CellContext`k + $CellContext`\[Chi]), \
$CellContext`a3[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := ((((2 
              E^(((-I) $CellContext`b) $CellContext`k + (
                  2 $CellContext`a) $CellContext`\[Chi] + $CellContext`b \
$CellContext`\[Chi])) $CellContext`k) ($CellContext`k - 
             I $CellContext`\[Chi])) (
            E^((2 $CellContext`a) ((2 
                  I) $CellContext`k + $CellContext`\[Chi])) ($CellContext`k + 
               I $CellContext`\[Chi])^2 - 
            E^(((4 I) $CellContext`a) $CellContext`k + (
                2 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k + 
              I $CellContext`\[Chi])^2 - 
            E^((2 $CellContext`b) $CellContext`\[Chi]) ((-
                I) $CellContext`k + $CellContext`\[Chi])^2 + 
            E^((2 $CellContext`a) $CellContext`\[Chi]) (
               I $CellContext`k + $CellContext`\[Chi])^2))/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`a4[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := -(((((2 
               E^($CellContext`b ((-
                    I) $CellContext`k + $CellContext`\[Chi]))) \
$CellContext`k) ($CellContext`k + I $CellContext`\[Chi])) (
             E^((2 $CellContext`b) $CellContext`\[Chi]) ((-
                 E^(((4 I) $CellContext`a) $CellContext`k)) ($CellContext`k - 
                  I $CellContext`\[Chi])^2 + ($CellContext`k + 
                 I $CellContext`\[Chi])^2) - (
              E^((2 $CellContext`a) $CellContext`\[Chi]) (-1 + 
               E^(((4 I) $CellContext`a) $CellContext`k))) (
               I $CellContext`k + $CellContext`\[Chi])^2))/((-
             E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
              I $CellContext`\[Chi])^4 - 
           E^((4 $CellContext`a) $CellContext`\[Chi]) (
             I $CellContext`k + $CellContext`\[Chi])^4 + (2 
             E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
           E^((4 $CellContext`a) (
               I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
           E^(((4 I) $CellContext`a) $CellContext`k + (
                4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
            E^(((4 I) $CellContext`a) $CellContext`k + (
                2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2)), $CellContext`a5[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := (((((4 I) 
              E^((I ($CellContext`a - $CellContext`b)) $CellContext`k + \
($CellContext`a + $CellContext`b) $CellContext`\[Chi])) $CellContext`k) \
$CellContext`\[Chi]) (
            E^((2 $CellContext`b) $CellContext`\[Chi]) ((-
                 I) $CellContext`k + $CellContext`\[Chi])^2 - 
            E^((2 $CellContext`a) $CellContext`\[Chi]) (
              I $CellContext`k + $CellContext`\[Chi])^2))/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`a6[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := ((((((4 
                E^((I (3 $CellContext`a - $CellContext`b)) $CellContext`k + \
($CellContext`a + $CellContext`b) $CellContext`\[Chi])) (-
                 E^((2 $CellContext`a) $CellContext`\[Chi]) + 
                E^((2 $CellContext`b) $CellContext`\[Chi]))) $CellContext`k) \
($CellContext`k - I $CellContext`\[Chi])) $CellContext`\[Chi]) ((-
              I) $CellContext`k + $CellContext`\[Chi]))/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`a7[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := ((((8 
              E^(((-I) ((-2) $CellContext`a + $CellContext`b)) $CellContext`k + \
(2 $CellContext`a + $CellContext`b) $CellContext`\[Chi])) $CellContext`k^2) \
$CellContext`\[Chi]) (I $CellContext`k + $CellContext`\[Chi]))/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`a8[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := ((((8 
              E^(((2 I) $CellContext`a) $CellContext`k - (
                 I $CellContext`b) $CellContext`k + (
                  2 $CellContext`a) $CellContext`\[Chi] + (
                  3 $CellContext`b) $CellContext`\[Chi])) $CellContext`k^2) \
$CellContext`\[Chi]) ((-I) $CellContext`k + $CellContext`\[Chi]))/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`a9[
           Pattern[$CellContext`\[Chi], 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            
            Blank[]]] := (((16 
             E^(((2 I) ($CellContext`a - $CellContext`b)) $CellContext`k + (
                 2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
$CellContext`k^2) $CellContext`\[Chi]^2)/((-
            E^((4 $CellContext`b) $CellContext`\[Chi])) ($CellContext`k + 
             I $CellContext`\[Chi])^4 - 
          E^((4 $CellContext`a) $CellContext`\[Chi]) (
            I $CellContext`k + $CellContext`\[Chi])^4 + (2 
            E^((2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2 + 
          E^((4 $CellContext`a) (
              I $CellContext`k + $CellContext`\[Chi])) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 + 
          E^(((4 I) $CellContext`a) $CellContext`k + (
               4 $CellContext`b) $CellContext`\[Chi]) ($CellContext`k^2 + \
$CellContext`\[Chi]^2)^2 - (2 
           E^(((4 I) $CellContext`a) $CellContext`k + (
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
($CellContext`k^2 + $CellContext`\[Chi]^2)^2)}; Typeset`initDone$$ = True),
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
WindowSize->{1199, 577},
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
Cell[1235, 30, 22313, 462, 577, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature gvTBfPrnPovamAwaN#ahZSx8 *)
