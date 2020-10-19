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
NotebookDataLength[     30560,        647]
NotebookOptionsPosition[     30863,        639]
NotebookOutlinePosition[     31326,        659]
CellTagsIndexPosition[     31283,        656]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`a$$ = 2.5, $CellContext`b$$ = 
      0, $CellContext`d$$ = 0.4, $CellContext`L$$ = 5, $CellContext`m$$ = 
      0.1, $CellContext`n$$ = 1, $CellContext`timestep$$ = 0.006, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`L$$], 5, "Size of the box"}, 5, 10}, {{
         Hold[$CellContext`m$$], 0.1, "Mass of the particle"}, 0.1, 1}, {{
         Hold[$CellContext`d$$], 0.4, "Wavepacket initial size"}, 0.1, 
        Dynamic[($CellContext`L$$/2)/Log[200]^Rational[1, 2]]}, {{
         Hold[$CellContext`a$$], Rational[1, 2] $CellContext`L$$, 
         "Wavepacket initial position"}, 
        Dynamic[$CellContext`d$$ Log[200]^Rational[1, 2]], 
        Dynamic[$CellContext`L$$ - $CellContext`d$$ 
         Log[200]^Rational[1, 2]]}, {{
         Hold[$CellContext`b$$], 0, "Wavepacket initial momentum"}, 0, 5}, {{
         Hold[$CellContext`n$$], 1, "Number of modes"}, 1, 20, 1}, {{
         Hold[$CellContext`timestep$$], 0.006, 
         Tooltip["Time x", "How fast the time should flow"]}, 0.002, 0.03}, {
        Hold[
         Row[{
           Button[
            Style[
            "Start time", Bold, FontSize -> 
             15], {$CellContext`trigger = 1; $CellContext`cont = 
              0; $CellContext`sliderstatus = False; Null}, ImageSize -> 200], 
           Button[
            Style[
            "Stop & Reset", Bold, FontSize -> 
             15], {$CellContext`trigger = 0; $CellContext`t = 
              0; $CellContext`cont = 1; $CellContext`sliderstatus = 
              True; $CellContext`L$$ = 5; $CellContext`m$$ = 
              0.1; $CellContext`d$$ = 
              0.4; $CellContext`a$$ = $CellContext`L$$/2; $CellContext`b$$ = 
              0; $CellContext`n$$ = 1; Null}, ImageSize -> 200]}]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      800., {251., 260.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`L$5518$$ = 
      0, $CellContext`m$5519$$ = 0, $CellContext`d$5520$$ = 
      0, $CellContext`a$5521$$ = 0, $CellContext`b$5522$$ = 
      0, $CellContext`n$5523$$ = 0, $CellContext`timestep$5524$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`a$$ = 
          Rational[1, 2] $CellContext`L$$, $CellContext`b$$ = 
          0, $CellContext`d$$ = 0.4, $CellContext`L$$ = 5, $CellContext`m$$ = 
          0.1, $CellContext`n$$ = 1, $CellContext`timestep$$ = 0.006}, 
        "ControllerVariables" :> {
          Hold[$CellContext`L$$, $CellContext`L$5518$$, 0], 
          Hold[$CellContext`m$$, $CellContext`m$5519$$, 0], 
          Hold[$CellContext`d$$, $CellContext`d$5520$$, 0], 
          Hold[$CellContext`a$$, $CellContext`a$5521$$, 0], 
          Hold[$CellContext`b$$, $CellContext`b$5522$$, 0], 
          Hold[$CellContext`n$$, $CellContext`n$5523$$, 0], 
          Hold[$CellContext`timestep$$, $CellContext`timestep$5524$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`trigger == 
           1, {$CellContext`t = $CellContext`t + $CellContext`timestep$$; 
            Pause[0.04]; Null}]; 
         If[$CellContext`trigger == 0, $CellContext`\[Psi]ev[
              Pattern[$CellContext`x$, 
               Blank[]], 
              Pattern[$CellContext`t$, 
               Blank[]]] := Evaluate[
              $CellContext`\[Psi][$CellContext`d$$, $CellContext`a$$, \
$CellContext`b$$, $CellContext`x$, $CellContext`t$, $CellContext`n$$, \
$CellContext`L$$, $CellContext`m$$]]; $CellContext`yrange = Abs[
                $CellContext`\[Psi]0[$CellContext`d$$, $CellContext`a$$, \
$CellContext`b$$, $CellContext`a$$]]^2 1.1; Null]; Show[
           (Plot[{
             Tooltip[Abs[
                $CellContext`\[Psi]ev[$CellContext`x, $CellContext`t]]^2, 
              "Approximate wavefunction built from mode expansion"], 
             Tooltip[$CellContext`cont Abs[
                 $CellContext`\[Psi]0[$CellContext`d$$, $CellContext`a$$, \
$CellContext`b$$, $CellContext`x]]^2, "Initial wavepacket"]}, {$CellContext`x,
              0, $CellContext`L$$}, PlotStyle -> {Thick, Dashed}, 
            PlotRange -> {{-1, $CellContext`L$$ + 1}, {
              0, $CellContext`yrange}}, Ticks -> {
              $CellContext`ticks[-1, $CellContext`L$$ + 1, 0.2, 5], 
              $CellContext`ticks[0, $CellContext`yrange, 0.05, 4]}, 
            AxesOrigin -> {$CellContext`L$$/2, 0}, ImageSize -> 800, #]& )[
            Sequence[$CellContext`$PlotOptions]], 
           
           Plot[$CellContext`yrange, {$CellContext`x, -1, 0}, Filling -> 
            Bottom], 
           
           Plot[$CellContext`yrange, {$CellContext`x, $CellContext`L$$, \
$CellContext`L$$ + 1}, Filling -> Bottom], 
           Graphics[
            Line[{{0, $CellContext`yrange}, {0, 0}}]], 
           Graphics[
            
            Line[{{$CellContext`L$$, $CellContext`yrange}, {$CellContext`L$$, 
               0}}]]]), 
        "Specifications" :> {{{$CellContext`L$$, 5, "Size of the box"}, 5, 10,
            Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`m$$, 0.1, 
            "Mass of the particle"}, 0.1, 1, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, 
          Delimiter, {{$CellContext`d$$, 0.4, "Wavepacket initial size"}, 0.1, 
           Dynamic[($CellContext`L$$/2)/Log[200]^Rational[1, 2]], Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`a$$, 
            Rational[1, 2] $CellContext`L$$, "Wavepacket initial position"}, 
           Dynamic[$CellContext`d$$ Log[200]^Rational[1, 2]], 
           
           Dynamic[$CellContext`L$$ - $CellContext`d$$ 
            Log[200]^Rational[1, 2]], Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`b$$, 0, 
            "Wavepacket initial momentum"}, 0, 5, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, 
          Delimiter, {{$CellContext`n$$, 1, "Number of modes"}, 1, 20, 1, 
           Enabled -> Dynamic[$CellContext`sliderstatus]}, 
          Delimiter, {{$CellContext`timestep$$, 0.006, 
            Tooltip["Time x", "How fast the time should flow"]}, 0.002, 0.03}, 
          Row[{
            Button[
             Style[
             "Start time", Bold, FontSize -> 
              15], {$CellContext`trigger = 1; $CellContext`cont = 
               0; $CellContext`sliderstatus = False; Null}, ImageSize -> 200], 
            Button[
             Style[
             "Stop & Reset", Bold, FontSize -> 
              15], {$CellContext`trigger = 0; $CellContext`t = 
               0; $CellContext`cont = 1; $CellContext`sliderstatus = 
               True; $CellContext`L$$ = 5; $CellContext`m$$ = 
               0.1; $CellContext`d$$ = 
               0.4; $CellContext`a$$ = $CellContext`L$$/2; $CellContext`b$$ = 
               0; $CellContext`n$$ = 1; Null}, ImageSize -> 200]}]}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1227., {270., 277.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`trigger = 0, $CellContext`t = 
         0, $CellContext`\[Psi]ev[
           Pattern[$CellContext`x$, 
            Blank[]], 
           Pattern[$CellContext`t$, 
            Blank[]]] := ((0.4615048249629886 - 1.1929619937928677`*^-26 I) 
           Sin[(Pi $CellContext`x$)/5])/
          E^((0. + 1.9739208802178716` I) $CellContext`t$), 
         Attributes[$CellContext`x$] = {Temporary}, 
         Attributes[$CellContext`t$] = {Temporary}, $CellContext`\[Psi][
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`n, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]]] := 
         Sum[($CellContext`coeff[$CellContext`d, $CellContext`a, \
$CellContext`b, $CellContext`i, $CellContext`L] \
$CellContext`u[$CellContext`i, $CellContext`x, $CellContext`L]) 
           Exp[((-I) $CellContext`t) $CellContext`En[$CellContext`i, \
$CellContext`m, $CellContext`L]], {$CellContext`i, 
            1, $CellContext`n}], $CellContext`\[Psi][
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
$CellContext`x]], $CellContext`a$$ = 2.5, $CellContext`coeff[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`n, 
            Blank[]], 
           Pattern[$CellContext`L, 
            
            Blank[]]] := (((((-(1/(2 Sqrt[$CellContext`d $CellContext`L]))) 
              I) $CellContext`d) Pi^(1/4)) (-2 + 
            E^((((2 (
                   I $CellContext`a + $CellContext`b $CellContext`d^2)) \
$CellContext`n) Pi)/$CellContext`L) (
              Erf[((-$CellContext`a) $CellContext`L + ((
                    I $CellContext`b) $CellContext`d^2) $CellContext`L + \
$CellContext`L^2 - ((I $CellContext`d^2) $CellContext`n) Pi)/((
                 Sqrt[2] $CellContext`d) $CellContext`L)] + 
              Erf[($CellContext`a $CellContext`L - (
                  I $CellContext`d^2) ($CellContext`b $CellContext`L - \
$CellContext`n Pi))/((Sqrt[2] $CellContext`d) $CellContext`L)]) + 
            Erfc[((-$CellContext`a) $CellContext`L + ((
                  I $CellContext`b) $CellContext`d^2) $CellContext`L + \
$CellContext`L^2 + ((I $CellContext`d^2) $CellContext`n) Pi)/((
               Sqrt[2] $CellContext`d) $CellContext`L)] + 
            Erfc[($CellContext`a - ((
                 I $CellContext`d^2) ($CellContext`b $CellContext`L + \
$CellContext`n Pi))/$CellContext`L)/(Sqrt[2] $CellContext`d)]))/
          E^((((((2 I) $CellContext`a) $CellContext`L) $CellContext`n) 
             Pi + $CellContext`d^2 ($CellContext`b $CellContext`L + \
$CellContext`n Pi)^2)/(2 $CellContext`L^2)), $CellContext`u[
           Pattern[$CellContext`n, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]]] := 
         Sqrt[2/$CellContext`L] 
          Sin[(($CellContext`n 
              Pi) $CellContext`x)/$CellContext`L], $CellContext`En[
           Pattern[$CellContext`n, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]]] := ($CellContext`n^2 Pi^2)/((
           2 $CellContext`m) $CellContext`L^2), $CellContext`k[
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
($CellContext`k^2 + $CellContext`\[Chi]^2)^2), $CellContext`yrange = 
         1.5515213547563296`, $CellContext`\[Psi]0[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]]] := (1/(Pi^(1/4) Sqrt[$CellContext`d])) 
          Exp[((-
               I) $CellContext`b) ($CellContext`x - $CellContext`a) - \
($CellContext`x - $CellContext`a)^2/(2 $CellContext`d^2)], $CellContext`cont = 
         1, $CellContext`ticks[
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
            FontSize -> 18, FontFamily -> 
             "Helvetica"}}, $CellContext`sliderstatus = True}; 
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
WindowSize->{1269, 587},
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
Cell[1235, 30, 29624, 607, 587, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature mvTxIlGhRLbNKAKQDwJUxvp5 *)
