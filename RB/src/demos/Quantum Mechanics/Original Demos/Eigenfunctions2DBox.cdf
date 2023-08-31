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
NotebookDataLength[      9306,        210]
NotebookOptionsPosition[      9601,        201]
NotebookOutlinePosition[     10073,        222]
CellTagsIndexPosition[     10030,        219]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`Lx$$ = 2, $CellContext`Ly$$ = 
      2, $CellContext`nx$$ = 1, $CellContext`ny$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`nx$$], 1, "\!\(\*SubscriptBox[\(n\), \(x\)]\)"}, {
        1, 2, 3, 4, 5}}, {{
         Hold[$CellContext`ny$$], 1, "\!\(\*SubscriptBox[\(n\), \(y\)]\)"}, {
        1, 2, 3, 4, 5}}, {{
         Hold[$CellContext`Lx$$], 2, "\!\(\*SubscriptBox[\(L\), \(x\)]\)"}, 2,
         5}, {{
         Hold[$CellContext`Ly$$], 2, "\!\(\*SubscriptBox[\(L\), \(y\)]\)"}, 2,
         5}}, Typeset`size$$ = {600., {242.90625, 248.09375}}, 
      Typeset`update$$ = 0, Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`nx$20332$$ = 0, $CellContext`ny$20333$$ = 
      0, $CellContext`Lx$20334$$ = 0, $CellContext`Ly$20335$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`Lx$$ = 2, $CellContext`Ly$$ = 
          2, $CellContext`nx$$ = 1, $CellContext`ny$$ = 1}, 
        "ControllerVariables" :> {
          Hold[$CellContext`nx$$, $CellContext`nx$20332$$, 0], 
          Hold[$CellContext`ny$$, $CellContext`ny$20333$$, 0], 
          Hold[$CellContext`Lx$$, $CellContext`Lx$20334$$, 0], 
          Hold[$CellContext`Ly$$, $CellContext`Ly$20335$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> Column[{
           Show[{
             Graphics[
              Text[
               Style[
               "\[Psi](x,y) = \!\(\*SqrtBox[FractionBox[\(2\), \
SubscriptBox[\(L\), \(x\)]]]\)\!\(\*SqrtBox[FractionBox[\(2\), \
SubscriptBox[\(L\), \(y\)]]]\) sin(\[Pi] \!\(\*SubscriptBox[\(n\), \(x\)]\) x \
/ \!\(\*SubscriptBox[\(L\), \(x\)]\)) sin(\[Pi] \!\(\*SubscriptBox[\(n\), \(y\
\)]\) y / \!\(\*SubscriptBox[\(L\), \(y\)]\))            Energy = \
\!\(\*FractionBox[\(\*SuperscriptBox[\(\[HBar]\), \(2\)]\\ \
\*SuperscriptBox[SubscriptBox[\(n\), \(x\)], \(2\)]\), \(2\\ m\\ \
\*SuperscriptBox[SubscriptBox[\(L\), \(x\)], \(2\)]\)]\) + \!\(\*FractionBox[\
\(\*SuperscriptBox[\(\[HBar]\), \(2\)]\\ \*SuperscriptBox[SubscriptBox[\(n\), \
\(y\)], \(2\)]\), \(2\\ m\\ \*SuperscriptBox[SubscriptBox[\(L\), \(y\)], \
\(2\)]\)]\)", FontSize -> 16, FontFamily -> "Helvetica"], {0, 0}]]}, 
            PlotRange -> {{-10, 10}, {-1, 1}}, ImageSize -> 600], 
           Show[{
             (Plot3D[
              $CellContext`\[Psi][$CellContext`x, $CellContext`y, \
$CellContext`nx$$, $CellContext`ny$$, $CellContext`Lx$$, $CellContext`Ly$$], \
{$CellContext`x, $CellContext`xmin, $CellContext`xmax}, {$CellContext`y, \
$CellContext`ymin, $CellContext`ymax}, ViewPoint -> {-1, -1, 1}, 
              Ticks -> {{{$CellContext`Lx$$, 
                  "\!\(\*SubscriptBox[\(L\), \(x\)]\)"}}, {{$CellContext`Ly$$,
                   "\!\(\*SubscriptBox[\(L\), \(y\)]\)"}}, {{(
                    2/$CellContext`Lx$$)^Rational[1, 2] (2/$CellContext`Ly$$)^
                   Rational[1, 2], 
                  "\!\(\*SqrtBox[FractionBox[\(2\), SubscriptBox[\(L\), \
\(x\)]]]\)\!\(\*SqrtBox[FractionBox[\(2\), SubscriptBox[\(L\), \(y\)]]]\)\n\
"}, {(-(2/$CellContext`Lx$$)^Rational[1, 2]) (2/$CellContext`Ly$$)^
                   Rational[1, 2], 
                  "\n-\!\(\*SqrtBox[FractionBox[\(2\), SubscriptBox[\(L\), \
\(x\)]]]\)\!\(\*SqrtBox[FractionBox[\(2\), SubscriptBox[\(L\), \(y\)]]]\)"}}},
               PlotRange -> {-(2/$CellContext`Lmin) - 0.5, 
                2/$CellContext`Lmin + 0.5}, #]& )[
              Sequence[$CellContext`$Plot3DOptions]], 
             (Plot3D[
              $CellContext`V[$CellContext`x, $CellContext`y, \
$CellContext`Lx$$, $CellContext`Ly$$], {$CellContext`x, $CellContext`xmin, \
$CellContext`xmax}, {$CellContext`y, $CellContext`ymin, $CellContext`ymax}, 
              Filling -> None, 
              PlotRange -> {-(2/$CellContext`Lmin) - 0.5, 2/$CellContext`Lmin + 
                0.5}, Exclusions -> None, #]& )[
              Sequence[$CellContext`$Plot3DOptions]]}, 
            PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, \
{$CellContext`ymin, $CellContext`ymax}, {-(2/$CellContext`Lmin) - 0.5, 
               2/$CellContext`Lmin + 0.5}}, ImageSize -> 600]}], 
        "Specifications" :> {{{$CellContext`nx$$, 1, 
            "\!\(\*SubscriptBox[\(n\), \(x\)]\)"}, {1, 2, 3, 4, 
           5}}, {{$CellContext`ny$$, 1, 
            "\!\(\*SubscriptBox[\(n\), \(y\)]\)"}, {1, 2, 3, 4, 
           5}}, {{$CellContext`Lx$$, 2, "\!\(\*SubscriptBox[\(L\), \(x\)]\)"},
            2, 5}, {{$CellContext`Ly$$, 2, 
            "\!\(\*SubscriptBox[\(L\), \(y\)]\)"}, 2, 5}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{620., {316., 322.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`\[Psi][
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
         Sqrt[2/3] 
          Sin[($CellContext`n Pi $CellContext`x)/3], $CellContext`\[Psi][
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`y, 
            Blank[]], 
           Pattern[$CellContext`nx, 
            Blank[]], 
           Pattern[$CellContext`ny, 
            Blank[]], 
           Pattern[$CellContext`Lx, 
            Blank[]], 
           Pattern[$CellContext`Ly, 
            Blank[]]] = 
         2 Sqrt[$CellContext`Lx^(-1)] Sqrt[$CellContext`Ly^(-1)] 
          Sin[($CellContext`nx Pi $CellContext`x)/$CellContext`Lx] 
          Sin[($CellContext`ny Pi $CellContext`y)/$CellContext`Ly] 
          UnitStep[($CellContext`Lx - $CellContext`x) $CellContext`x] 
          UnitStep[($CellContext`Ly - $CellContext`y) $CellContext`y], \
$CellContext`L = 3, $CellContext`xmin = 0, $CellContext`xmax = 
         5, $CellContext`ymin = 0, $CellContext`ymax = 5, $CellContext`Lmin = 
         2, $CellContext`$Plot3DOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]]] = 
         10 UnitStep[-1 + $CellContext`x] + 
          10 UnitStep[-$CellContext`x], $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`L, 
            Blank[]]] = 
         10 UnitStep[-3 + $CellContext`x] + 
          10 UnitStep[-$CellContext`x], $CellContext`V[
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`y, 
            Blank[]], 
           Pattern[$CellContext`Lx, 
            Blank[]], 
           Pattern[$CellContext`Ly, 
            Blank[]]] = 
         10 (0.5 - UnitBox[(-1)/2 + 
            Round[$CellContext`x/$CellContext`Lx, 0.001], (-1)/2 + 
            Round[$CellContext`y/$CellContext`Ly, 0.001]])}; 
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
WindowSize->{656, 672},
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
Cell[1235, 30, 8362, 169, 672, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature wvpJ16rPOyX8GCgqzb6UVz8M *)
