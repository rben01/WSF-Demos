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
NotebookDataLength[     26269,        552]
NotebookOptionsPosition[     26573,        544]
NotebookOutlinePosition[     27035,        564]
CellTagsIndexPosition[     26992,        561]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`a$$ = 1, $CellContext`enn$$ = 
      1, $CellContext`m$$ = 0.1, $CellContext`V$$ = 5, $CellContext`wall$$ = 
      1, Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`wall$$], 1, "Barrier width"}, 1, 10}, {{
         Hold[$CellContext`a$$], 1, "Spacing between the barriers"}, 1, 10}, {{
         Hold[$CellContext`V$$], 5, "Height of the barriers"}, 5, 100, 1}, {{
         Hold[$CellContext`m$$], 0.1, "Mass of the particle"}, 0.1, 0.5}, {{
         Hold[$CellContext`enn$$], 1, "Energy of the particle"}, 1, 
        Dynamic[$CellContext`V$$ - 2]}}, Typeset`size$$ = {
      800., {256., 264.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`wall$3107$$ = 
      0, $CellContext`a$3108$$ = 0, $CellContext`V$3109$$ = 
      0, $CellContext`m$3110$$ = 0, $CellContext`enn$3111$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`a$$ = 1, $CellContext`enn$$ = 
          1, $CellContext`m$$ = 0.1, $CellContext`V$$ = 
          5, $CellContext`wall$$ = 1}, "ControllerVariables" :> {
          Hold[$CellContext`wall$$, $CellContext`wall$3107$$, 0], 
          Hold[$CellContext`a$$, $CellContext`a$3108$$, 0], 
          Hold[$CellContext`V$$, $CellContext`V$3109$$, 0], 
          Hold[$CellContext`m$$, $CellContext`m$3110$$, 0], 
          Hold[$CellContext`enn$$, $CellContext`enn$3111$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> ($CellContext`solold1 = 0; $CellContext`solold2 = 
          0; $CellContext`count = 0; $CellContext`list = {}; 
         Do[$CellContext`sol1 = Quiet[
              Part[
               
               FindRoot[$CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$] Tan[
                   $CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$]] == $CellContext`circle[$CellContext`m$$, $CellContext`en, \
$CellContext`a$$, $CellContext`V$$], {$CellContext`en, $CellContext`ck, 
                 0, $CellContext`V$$}], 1, 2]]; $CellContext`sol2 = Quiet[
              Part[
               
               FindRoot[(-$CellContext`\[Xi][$CellContext`m$$, \
$CellContext`en, $CellContext`a$$]) Cot[
                   $CellContext`\[Xi][$CellContext`m$$, $CellContext`en, \
$CellContext`a$$]] == $CellContext`circle[$CellContext`m$$, $CellContext`en, \
$CellContext`a$$, $CellContext`V$$], {$CellContext`en, $CellContext`ck, 
                 0, $CellContext`V$$}], 1, 2]]; If[
             And[
             Abs[$CellContext`sol1 - $CellContext`solold1] > 
              0.01, $CellContext`sol1 != $CellContext`V$$], $CellContext`list = 
              Append[$CellContext`list, $CellContext`sol1]; \
$CellContext`solold1 = $CellContext`sol1; Increment[$CellContext`count]; 
             Null]; If[
             And[
             Abs[$CellContext`sol2 - $CellContext`solold2] > 
              0.01, $CellContext`sol2 != $CellContext`V$$], $CellContext`list = 
              Append[$CellContext`list, $CellContext`sol2]; \
$CellContext`solold2 = $CellContext`sol2; Increment[$CellContext`count]; 
             Null]; Null, {$CellContext`ck, $CellContext`V$$ - 1, 1, -1}]; 
         Show[
           (
           Plot[$CellContext`V$$, {$CellContext`x, -$CellContext`a$$ - \
$CellContext`wall$$, -$CellContext`a$$}, AxesOrigin -> {0, 0}, 
            PlotRange -> {{-$CellContext`a$$ - $CellContext`wall$$ - 
               10, $CellContext`a$$ + $CellContext`wall$$ + 10}, {
              0, $CellContext`V$$ + 5}}, ImageSize -> 800, Filling -> 
            Bottom, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           (
           Plot[$CellContext`V$$, {$CellContext`x, $CellContext`a$$, \
$CellContext`a$$ + $CellContext`wall$$}, AxesOrigin -> {0, 0}, 
            PlotRange -> {{-$CellContext`a$$ - $CellContext`wall$$ - 
               10, $CellContext`a$$ + $CellContext`wall$$ + 10}, {
              0, $CellContext`V$$ + 5}}, Filling -> Bottom, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           Graphics[
            
            Line[{{-$CellContext`a$$, $CellContext`V$$}, {-$CellContext`a$$, 
               0}}]], 
           Graphics[
            
            Line[{{-$CellContext`a$$ - $CellContext`wall$$, \
$CellContext`V$$}, {-$CellContext`a$$ - $CellContext`wall$$, 0}}]], 
           Graphics[
            
            Line[{{$CellContext`a$$, $CellContext`V$$}, {$CellContext`a$$, 
               0}}]], 
           Graphics[
            
            Line[{{$CellContext`a$$ + $CellContext`wall$$, $CellContext`V$$}, \
{$CellContext`a$$ + $CellContext`wall$$, 0}}]], 
           Table[
            (Plot[
             
             Part[$CellContext`list, $CellContext`i], {$CellContext`x, \
-$CellContext`a$$, 
              Plus[$CellContext`a$$]}, AxesOrigin -> {0, 0}, 
             PlotRange -> {{-$CellContext`a$$ - $CellContext`wall$$ - 
                10, $CellContext`a$$ + $CellContext`wall$$ + 10}, {
               0, $CellContext`V$$ + 5}}, PlotStyle -> {Dashed}, #]& )[
             Sequence[$CellContext`$PlotOptions]], {$CellContext`i, 
             1, $CellContext`count}], 
           (Plot[Abs[
               $CellContext`\[Psi][$CellContext`m$$, $CellContext`enn$$, \
$CellContext`V$$, $CellContext`a$$, $CellContext`a$$ + $CellContext`wall$$, \
$CellContext`x]]^2 + $CellContext`enn$$, {$CellContext`x, -$CellContext`a$$ - \
$CellContext`wall$$ - 10, $CellContext`a$$ + $CellContext`wall$$ + 10}, 
            PlotRange -> All, ImageSize -> 800, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           (
           Plot[$CellContext`enn$$, {$CellContext`x, -$CellContext`a$$ - \
$CellContext`wall$$ - 10, $CellContext`a$$ + $CellContext`wall$$ + 10}, 
            PlotStyle -> {Dashed, Red, Thick}, #]& )[
            Sequence[$CellContext`$PlotOptions]]]), 
        "Specifications" :> {{{$CellContext`wall$$, 1, "Barrier width"}, 1, 
           10, ContinuousAction -> 
           False}, {{$CellContext`a$$, 1, "Spacing between the barriers"}, 1, 
           10, ContinuousAction -> 
           False}, {{$CellContext`V$$, 5, "Height of the barriers"}, 5, 100, 
           1, ContinuousAction -> 
           False}, {{$CellContext`m$$, 0.1, "Mass of the particle"}, 0.1, 0.5,
            ContinuousAction -> False}, 
          Delimiter, {{$CellContext`enn$$, 1, "Energy of the particle"}, 1, 
           Dynamic[$CellContext`V$$ - 2]}}, "Options" :> {Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{820., {354., 361.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`solold1 = 
         2.7312341706983587`, $CellContext`solold2 = 0, $CellContext`count = 
         1, $CellContext`list = {2.7312341706983587`}, $CellContext`sol1 = 
         2.7312341706983587`, $CellContext`\[Xi][
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]]] := 
         Sqrt[((2 $CellContext`m) $CellContext`en) $CellContext`a^2], \
$CellContext`a$$ = 1, $CellContext`circle[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`V, 
            Blank[]]] := 
         Sqrt[((2 $CellContext`m) $CellContext`V) $CellContext`a^2 - \
$CellContext`\[Xi][$CellContext`m, $CellContext`en, $CellContext`a]^2], \
$CellContext`sol2 = 5., $CellContext`$PlotOptions = {PlotStyle -> {
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
$CellContext`x]], $CellContext`k[
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`en, 
            Blank[]]] := 
         Sqrt[(2 $CellContext`m) $CellContext`en], $CellContext`a2[
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
         Sqrt[(2 $CellContext`m) ($CellContext`V - $CellContext`en)], \
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
             E^((
                2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
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
            E^((
               2 ($CellContext`a + $CellContext`b)) $CellContext`\[Chi])) \
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
WindowSize->{862, 755},
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
Cell[1235, 30, 25334, 512, 755, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 3x0x6hNEEbKcvBKh5Un4P4eh *)
