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
NotebookDataLength[     12959,        292]
NotebookOptionsPosition[     13262,        284]
NotebookOutlinePosition[     13725,        304]
CellTagsIndexPosition[     13682,        301]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`deltap$$ = 2.5, $CellContext`deltax$$ = 
      0.2, $CellContext`m$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`m$$], 1, "Mass of the particle"}, 0.1, 1.7}, {{
         Hold[$CellContext`deltax$$], 0.2, "x-measurement precision"}, 0.1, 
        1}, {{
         Hold[$CellContext`deltap$$], 2.5, "p-measurement precision"}, 0.5, 
        5.}, {
        Hold[
         Row[{
           Button[
            Dynamic[$CellContext`starttext], {If[
               
               Or[$CellContext`status == "begin", $CellContext`status == 
                "pause"], $CellContext`status = 
                "normal"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = 
                "Pause"; $CellContext`measurestatus = True; 
               Null, $CellContext`status = "pause"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = 
                "Resume"; $CellContext`measurestatus = False; Null]; Null}, 
            ImageSize -> 100], 
           Button[
           "Reset", {$CellContext`status = "begin"; $CellContext`sliderstatus = 
              True; $CellContext`starttext = 
              "Start"; $CellContext`measurestatus = False; $CellContext`t = 
              0.04; $CellContext`a = 0; $CellContext`b = 0; $CellContext`d = 
              0.17; $CellContext`xrange = 10; $CellContext`krange = 10; Null},
             ImageSize -> 100]}]], Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Row[{
           Button[
            Style[
            "Measure x", Bold, FontSize -> 
             15], {$CellContext`a = RandomVariate[
                $CellContext`distribx[$CellContext`d, $CellContext`a, \
$CellContext`b, $CellContext`m$$, $CellContext`t]]; $CellContext`b = 
              0; $CellContext`d = 
              2^Rational[
                 1, 2] $CellContext`deltax$$; $CellContext`t = \
-$CellContext`timestep; 
             If[Abs[$CellContext`a] > $CellContext`xrange, \
$CellContext`xrange = Abs[$CellContext`a] 1.2; Null]; Null}, ImageSize -> 120,
             Enabled -> Dynamic[$CellContext`measurestatus]], 
           Button[
            Style[
            "Measure p", Bold, FontSize -> 
             15], {$CellContext`a = 0; $CellContext`b = RandomVariate[
                $CellContext`distribk[$CellContext`d, $CellContext`b]]; \
$CellContext`d = 
              1/(2^Rational[
                 1, 2] $CellContext`deltap$$); $CellContext`t = \
-$CellContext`timestep; 
             If[Abs[$CellContext`b] > $CellContext`krange, \
$CellContext`krange = Abs[$CellContext`b] 1.2; Null]; Null}, ImageSize -> 120,
             Enabled -> Dynamic[$CellContext`measurestatus]]}]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      1079., {166., 170.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`m$736$$ = 
      0, $CellContext`deltax$737$$ = 0, $CellContext`deltap$738$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`deltap$$ = 2.5, $CellContext`deltax$$ = 
          0.2, $CellContext`m$$ = 1}, "ControllerVariables" :> {
          Hold[$CellContext`m$$, $CellContext`m$736$$, 0], 
          Hold[$CellContext`deltax$$, $CellContext`deltax$737$$, 0], 
          Hold[$CellContext`deltap$$, $CellContext`deltap$738$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`status == 
           "normal", $CellContext`t = $CellContext`t + $CellContext`timestep; 
           Pause[0.02]; Null]; GraphicsGrid[{{
             (Plot[
              $CellContext`probx[$CellContext`d, $CellContext`a, \
$CellContext`b, $CellContext`m$$, $CellContext`x, $CellContext`t], \
{$CellContext`x, -$CellContext`xrange, $CellContext`xrange}, 
              PlotRange -> {{-$CellContext`xrange, $CellContext`xrange}, {
                0, 1.99}}, PlotStyle -> {Thick}, ImageSize -> 500, 
              AxesLabel -> {
               "x", "|\[Psi](x,t)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
              Ticks -> {
                $CellContext`ticks[-$CellContext`xrange, $CellContext`xrange, 
                 1, 5], 
                $CellContext`ticks[0, 2, 0.1, 4]}, AxesOrigin -> {0, 0}, #]& )[
              Sequence[$CellContext`$PlotOptions]], 
             (Plot[
              $CellContext`probk[$CellContext`d, $CellContext`b, \
$CellContext`k], {$CellContext`k, -$CellContext`krange, $CellContext`krange}, 
              PlotRange -> {{-$CellContext`krange, $CellContext`krange}, {
                0, 1.99}}, PlotStyle -> {Thick}, ImageSize -> 500, 
              AxesLabel -> {
               "p", "|\[Phi](p,t)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, 
              Ticks -> {
                $CellContext`ticks[-$CellContext`krange, $CellContext`krange, 
                 1, 5], 
                $CellContext`ticks[0, 2, 0.1, 4]}, AxesOrigin -> {0, 0}, #]& )[
              Sequence[$CellContext`$PlotOptions]]}}]), 
        "Specifications" :> {{{$CellContext`m$$, 1, "Mass of the particle"}, 
           0.1, 1.7, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`deltax$$, 0.2, 
            "x-measurement precision"}, 0.1, 
           1}, {{$CellContext`deltap$$, 2.5, "p-measurement precision"}, 0.5, 
           5.}, Delimiter, 
          Row[{
            Button[
             Dynamic[$CellContext`starttext], {If[
                
                Or[$CellContext`status == "begin", $CellContext`status == 
                 "pause"], $CellContext`status = 
                 "normal"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = 
                 "Pause"; $CellContext`measurestatus = True; 
                Null, $CellContext`status = 
                 "pause"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = 
                 "Resume"; $CellContext`measurestatus = False; Null]; Null}, 
             ImageSize -> 100], 
            Button[
            "Reset", {$CellContext`status = 
               "begin"; $CellContext`sliderstatus = 
               True; $CellContext`starttext = 
               "Start"; $CellContext`measurestatus = False; $CellContext`t = 
               0.04; $CellContext`a = 0; $CellContext`b = 0; $CellContext`d = 
               0.17; $CellContext`xrange = 10; $CellContext`krange = 10; 
              Null}, ImageSize -> 100]}], Delimiter, 
          Row[{
            Button[
             Style[
             "Measure x", Bold, FontSize -> 
              15], {$CellContext`a = RandomVariate[
                 $CellContext`distribx[$CellContext`d, $CellContext`a, \
$CellContext`b, $CellContext`m$$, $CellContext`t]]; $CellContext`b = 
               0; $CellContext`d = 
               2^Rational[
                  1, 2] $CellContext`deltax$$; $CellContext`t = \
-$CellContext`timestep; 
              If[Abs[$CellContext`a] > $CellContext`xrange, \
$CellContext`xrange = Abs[$CellContext`a] 1.2; Null]; Null}, ImageSize -> 120,
              Enabled -> Dynamic[$CellContext`measurestatus]], 
            Button[
             Style[
             "Measure p", Bold, FontSize -> 
              15], {$CellContext`a = 0; $CellContext`b = RandomVariate[
                 $CellContext`distribk[$CellContext`d, $CellContext`b]]; \
$CellContext`d = 
               1/(2^Rational[
                  1, 2] $CellContext`deltap$$); $CellContext`t = \
-$CellContext`timestep; 
              If[Abs[$CellContext`b] > $CellContext`krange, \
$CellContext`krange = Abs[$CellContext`b] 1.2; Null]; Null}, ImageSize -> 120,
              Enabled -> Dynamic[$CellContext`measurestatus]]}]}, 
        "Options" :> {SynchronousUpdating -> True, Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1099., {276., 283.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`status = "begin", $CellContext`t = 
         0.04, $CellContext`timestep = 0.01, $CellContext`probx[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]]] := PDF[
           $CellContext`distribx[$CellContext`d, $CellContext`a, \
$CellContext`b, $CellContext`m, $CellContext`t], $CellContext`x], \
$CellContext`d = 0.17, $CellContext`a = 0, $CellContext`b = 
         0, $CellContext`distribx[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]]] := 
         NormalDistribution[$CellContext`a - ($CellContext`b \
$CellContext`t)/$CellContext`m, ($CellContext`d/Sqrt[2]) 
           Sqrt[1 + ($CellContext`t/($CellContext`m $CellContext`d^2))^2]], \
$CellContext`xrange = 10, $CellContext`ticks[
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
$CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`probk[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]], 
           Pattern[$CellContext`k, 
            Blank[]]] := PDF[
           $CellContext`distribk[$CellContext`d, $CellContext`b], \
$CellContext`k], $CellContext`distribk[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`b, 
            Blank[]]] := 
         NormalDistribution[$CellContext`b, 1/($CellContext`d 
           Sqrt[2])], $CellContext`krange = 10, $CellContext`sliderstatus = 
         True, $CellContext`starttext = "Start", $CellContext`measurestatus = 
         False}; Typeset`initDone$$ = True),
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
WindowSize->{1141, 599},
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
Cell[1235, 30, 12023, 252, 599, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature jxp98dOZhhJFhDgpN1Y0gPTs *)
