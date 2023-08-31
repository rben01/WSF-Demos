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
NotebookDataLength[     12726,        280]
NotebookOptionsPosition[     13020,        271]
NotebookOutlinePosition[     13492,        292]
CellTagsIndexPosition[     13449,        289]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`k$$ = 0, $CellContext`L$$ = 2, 
      Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`L$$], 2, "Width of Well, L"}, 2, 4}, {{
         Hold[$CellContext`k$$], 0, 
         "Wavenumber, k = \!\(\*FractionBox[\(2  \[Pi]\), \(\[Lambda]\)]\)"}, 
        0, 
        Dynamic[Pi (($CellContext`NWavefunctions + 0.5)/$CellContext`L$$)]}}, 
      Typeset`size$$ = {600., {174., 182.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`L$130651$$ = 0, $CellContext`k$130652$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`k$$ = 0, $CellContext`L$$ = 2}, 
        "ControllerVariables" :> {
          Hold[$CellContext`L$$, $CellContext`L$130651$$, 0], 
          Hold[$CellContext`k$$, $CellContext`k$130652$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`L$$ != $CellContext`LLast, $CellContext`k$$ = 
            0; $CellContext`LLast = $CellContext`L$$; Null]; 
         If[$CellContext`k$$ != $CellContext`kLast, 
           For[$CellContext`i = 
             1, $CellContext`i <= $CellContext`NWavefunctions, 
             Part[$CellContext`$PlotOptionsForThisDemo, $CellContext`i, \
$CellContext`plotStyleLocation, 2, 1, $CellContext`opacityLocation] = 
              Opacity[0.2 + 
                0.8 N[E^((-20) ($CellContext`k$$ - 
                    Pi ($CellContext`i/$CellContext`L$$))^2)]]; 
             Increment[$CellContext`i]]; $CellContext`kLast = \
$CellContext`k$$; Null]; Show[{
            (Plot[
             $CellContext`V[$CellContext`x, $CellContext`L$$], \
{$CellContext`x, $CellContext`xmin, $CellContext`xmax}, Filling -> Axis, 
             Exclusions -> None, 
             PlotRange -> {-(2/$CellContext`L$$)^Rational[1, 2] - 
               1.5, (2/$CellContext`L$$)^Rational[1, 2] + 1.5}, 
             Ticks -> {{{$CellContext`L$$, 
                 "L"}}, {{-(2/$CellContext`L$$)^Rational[1, 2], 
                 "-\!\(\*SqrtBox[FractionBox[\(2\), \(L\)]]\)"}, {(
                  2/$CellContext`L$$)^Rational[1, 2], 
                 "\!\(\*SqrtBox[FractionBox[\(2\), \(L\)]]\)"}}}, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            Table[
             (Plot[
              $CellContext`\[Psi][$CellContext`x, $CellContext`n, \
$CellContext`L$$], {$CellContext`x, $CellContext`xmin, $CellContext`L$$}, 
              PlotRange -> {-(2/$CellContext`L$$)^Rational[1, 2] - 
                1.5, (2/$CellContext`L$$)^Rational[1, 2] + 1.5}, 
              Ticks -> {{{$CellContext`L$$, 
                  "L"}}, {{-(2/$CellContext`L$$)^Rational[1, 2], 
                  "-\!\(\*SqrtBox[FractionBox[\(2\), \(L\)]]\)"}, {(
                   2/$CellContext`L$$)^Rational[1, 2], 
                  "\!\(\*SqrtBox[FractionBox[\(2\), \(L\)]]\)"}}}, #]& )[
              Sequence[
               
               Part[$CellContext`$PlotOptionsForThisDemo, $CellContext`n]]], \
{$CellContext`n, 1, 5}], 
            (
            Plot[(2/$CellContext`L$$)^Rational[1, 2] 
             Sin[$CellContext`k$$ $CellContext`x], {$CellContext`x, \
$CellContext`xmin, $CellContext`xmax}, #]& )[
             Sequence[$CellContext`$PlotOptions]], 
            Table[
             Graphics[{
               Opacity[
                N[
                E^((-20) ($CellContext`k$$ - 
                    Pi ($CellContext`n/$CellContext`L$$))^2)]], 
               Text[
                
                Part[$CellContext`EnergyLabelText, $CellContext`n], \
{$CellContext`L$$/2, 1.5}]}], {$CellContext`n, 
              1 $CellContext`NWavefunctions}], 
            Graphics[{Blue, 
              Opacity[
               N[
               UnitStep[$CellContext`k$$ - 0.8] 
                E^((-20) (0.5 - Abs[
                    0.5 - FractionalPart[$CellContext`k$$ ($CellContext`L$$/
                    Pi)]])^2)]], 
              Disk[{0, 0}, {0.05, 0.05 1.9}]}], 
            Graphics[{Blue, 
              Opacity[
               N[
               UnitStep[$CellContext`k$$ - 0.8] 
                E^((-20) (0.5 - Abs[
                    0.5 - FractionalPart[$CellContext`k$$ ($CellContext`L$$/
                    Pi)]])^2)]], 
              Disk[{$CellContext`L$$, 0}, {0.05, 0.05 1.9}]}]}, ImageSize -> 
           600]), "Specifications" :> {{{$CellContext`L$$, 2, 
            "Width of Well, L"}, 2, 
           4}, {{$CellContext`k$$, 0, 
            "Wavenumber, k = \!\(\*FractionBox[\(2  \[Pi]\), \
\(\[Lambda]\)]\)"}, 0, 
           Dynamic[
           Pi (($CellContext`NWavefunctions + 0.5)/$CellContext`L$$)]}, 
          Delimiter}, "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{620., {223., 229.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`LLast = 2, $CellContext`kLast = 
         6.479534848028948, $CellContext`i = 6, $CellContext`NWavefunctions = 
         5, $CellContext`$PlotOptionsForThisDemo = {{PlotStyle -> {{
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.2]}}, Background -> GrayLevel[0], 
            TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
              FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
              GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
            BaseStyle -> {
              GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
            FillingStyle -> Directive[
              Opacity[0.5], 
              GrayLevel[1]]}, {PlotStyle -> {{
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.2]}}, Background -> GrayLevel[0], 
            TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
              FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
              GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
            BaseStyle -> {
              GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
            FillingStyle -> Directive[
              Opacity[0.5], 
              GrayLevel[1]]}, {PlotStyle -> {{
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.2]}}, Background -> GrayLevel[0], 
            TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
              FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
              GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
            BaseStyle -> {
              GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
            FillingStyle -> Directive[
              Opacity[0.5], 
              GrayLevel[1]]}, {PlotStyle -> {{
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.5700169753213815]}}, Background -> GrayLevel[0], 
            TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
              FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
              GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
            BaseStyle -> {
              GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
            FillingStyle -> Directive[
              Opacity[0.5], 
              GrayLevel[1]]}, {PlotStyle -> {{
               GrayLevel[1], 
               Thickness[0.007], 
               Opacity[0.20000000000000004`]}}, Background -> GrayLevel[0], 
            TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
              FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
              GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
            BaseStyle -> {
              GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
            FillingStyle -> Directive[
              Opacity[0.5], 
              GrayLevel[1]]}}, $CellContext`plotStyleLocation = 
         1, $CellContext`opacityLocation = 3, $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]]] = 
         10 UnitStep[-1 + $CellContext`x] + 
          10 UnitStep[-$CellContext`x], $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]]] = 
         10 UnitStep[-$CellContext`x] + 
          10 UnitStep[-$CellContext`L + $CellContext`x], $CellContext`xmin = 
         0, $CellContext`xmax = 4, $CellContext`$PlotOptions = {PlotStyle -> {{
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
           Pattern[$CellContext`n, 
            Blank[]]] = 
         Sqrt[2] Sin[$CellContext`n Pi $CellContext`x], $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`n, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]]] = 
         Sqrt[2] Sqrt[$CellContext`L^(-1)] 
          Sin[($CellContext`n 
             Pi $CellContext`x)/$CellContext`L], $CellContext`EnergyLabelText = \
{"Energy = \!\(\*SubscriptBox[\(E\), \(1\)]\) = \
\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \*SuperscriptBox[\(\
\[Pi]\), \(2\)]\), \(2\\ m\\ \*SuperscriptBox[\(L\), \(2\)]\)]\)", 
           "Energy = \!\(\*SubscriptBox[\(E\), \(2\)]\) = 4\!\(\*FractionBox[\
\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \*SuperscriptBox[\(\[Pi]\), \(2\)]\), \
\(2\\ m\\ \*SuperscriptBox[\(L\), \(2\)]\)]\) = 4 \!\(\*SubscriptBox[\(E\), \
\(1\)]\)", 
           "Energy = \!\(\*SubscriptBox[\(E\), \(3\)]\) = 9\!\(\*FractionBox[\
\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \*SuperscriptBox[\(\[Pi]\), \(2\)]\), \
\(2\\ m\\ \*SuperscriptBox[\(L\), \(2\)]\)]\) = 9 \!\(\*SubscriptBox[\(E\), \
\(1\)]\)", 
           "Energy = \!\(\*SubscriptBox[\(E\), \(4\)]\) = \
16\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[\(\[Pi]\), \(2\)]\), \(2\\ m\\ \*SuperscriptBox[\(L\), \
\(2\)]\)]\) = 16 \!\(\*SubscriptBox[\(E\), \(1\)]\)", 
           "Energy = \!\(\*SubscriptBox[\(E\), \(5\)]\) = \
25\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)] \
\*SuperscriptBox[\(\[Pi]\), \(2\)]\), \(2\\ m\\ \*SuperscriptBox[\(L\), \
\(2\)]\)]\) = 25 \!\(\*SubscriptBox[\(E\), \(1\)]\)"}}; 
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
WindowSize->{656, 486},
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
Cell[1235, 30, 11781, 239, 486, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature XwDtmITi1bxmoBwsOIGeiq9Y *)
