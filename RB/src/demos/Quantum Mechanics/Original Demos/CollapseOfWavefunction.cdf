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
NotebookDataLength[     10493,        244]
NotebookOptionsPosition[     10798,        236]
NotebookOutlinePosition[     11260,        256]
CellTagsIndexPosition[     11217,        253]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`m$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`m$$], 1, "Mass of the particle"}, 0.1, 1.7}, {
        Hold[
         Row[{
           Button[
            Dynamic[$CellContext`starttext], {If[
               
               Or[$CellContext`status == "begin", $CellContext`status == 
                "outside", $CellContext`status == 
                "pause"], $CellContext`status = 
                "normal"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = 
                "Pause"; $CellContext`measurestatus = True; $CellContext`text = 
                ""; Null, $CellContext`status = 
                "pause"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = 
                "Resume"; $CellContext`measurestatus = 
                False; $CellContext`text = ""; Null]; Null}, ImageSize -> 
            100], 
           Button[
           "Reset", {$CellContext`status = "begin"; $CellContext`sliderstatus = 
              True; $CellContext`starttext = 
              "Start"; $CellContext`measurestatus = False; $CellContext`text = 
              ""; $CellContext`t = 0.02; $CellContext`a = 
              0; $CellContext`xrange = 10; Null}, ImageSize -> 100]}]], 
        Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Button[
          Style[
          "Measure", Bold, FontSize -> 15], {$CellContext`a = RandomVariate[
              $CellContext`gaussian[
              0.04, $CellContext`t, $CellContext`m$$, $CellContext`a]]; \
$CellContext`t = -$CellContext`timestep; Null}, ImageSize -> 200, Enabled -> 
          Dynamic[$CellContext`measurestatus]]], 
        Manipulate`Dump`ThisIsNotAControl}, {
        Hold[
         Style[
          Dynamic[$CellContext`text], 12, Bold]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      500., {158., 165.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`m$705$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, "Variables" :> {$CellContext`m$$ = 1}, 
        "ControllerVariables" :> {
          Hold[$CellContext`m$$, $CellContext`m$705$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[Abs[$CellContext`a] > $CellContext`xrange, $CellContext`xrange = 
            Abs[$CellContext`a] 1.2; $CellContext`status = 
            "outside"; $CellContext`sliderstatus = 
            False; $CellContext`starttext = 
            "Resume"; $CellContext`measurestatus = False; $CellContext`text = 
            "Particle measured outside of the bounds; \n time paused. Press \
'Resume' to continue."; Null]; 
         If[$CellContext`status == 
           "normal", $CellContext`t = $CellContext`t + $CellContext`timestep; 
           Pause[0.02]; Null]; (Plot[
           $CellContext`scaled[
           0.04, $CellContext`t, $CellContext`m$$, $CellContext`a, \
$CellContext`x], {$CellContext`x, -$CellContext`xrange, $CellContext`xrange}, 
           PlotRange -> {{-$CellContext`xrange, $CellContext`xrange}, {0, 2}},
            ImageSize -> 500, PlotStyle -> {Thick}, Ticks -> {
             $CellContext`ticks[-$CellContext`xrange, $CellContext`xrange, 1, 
              5], 
             $CellContext`ticks[0, 2, 0.1, 4]}, AxesOrigin -> {0, 0}, #]& )[
           Sequence[$CellContext`$PlotOptions]]), 
        "Specifications" :> {{{$CellContext`m$$, 1, "Mass of the particle"}, 
           0.1, 1.7, Enabled -> Dynamic[$CellContext`sliderstatus]}, 
          Delimiter, 
          Row[{
            Button[
             Dynamic[$CellContext`starttext], {If[
                
                Or[$CellContext`status == "begin", $CellContext`status == 
                 "outside", $CellContext`status == 
                 "pause"], $CellContext`status = 
                 "normal"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = 
                 "Pause"; $CellContext`measurestatus = 
                 True; $CellContext`text = ""; 
                Null, $CellContext`status = 
                 "pause"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = 
                 "Resume"; $CellContext`measurestatus = 
                 False; $CellContext`text = ""; Null]; Null}, ImageSize -> 
             100], 
            Button[
            "Reset", {$CellContext`status = 
               "begin"; $CellContext`sliderstatus = 
               True; $CellContext`starttext = 
               "Start"; $CellContext`measurestatus = False; $CellContext`text = 
               ""; $CellContext`t = 0.02; $CellContext`a = 
               0; $CellContext`xrange = 10; Null}, ImageSize -> 100]}], 
          Delimiter, 
          Button[
           Style[
           "Measure", Bold, FontSize -> 15], {$CellContext`a = RandomVariate[
               $CellContext`gaussian[
               0.04, $CellContext`t, $CellContext`m$$, $CellContext`a]]; \
$CellContext`t = -$CellContext`timestep; Null}, ImageSize -> 200, Enabled -> 
           Dynamic[$CellContext`measurestatus]], 
          Style[
           Dynamic[$CellContext`text], 12, Bold]}, 
        "Options" :> {
         SynchronousUpdating -> True, ControlPlacement -> Left, Paneled -> 
          False}, "DefaultOptions" :> {}],
       ImageSizeCache->{848., {176., 183.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`a = 0, $CellContext`xrange = 
         10, $CellContext`status = "begin", $CellContext`sliderstatus = 
         True, $CellContext`starttext = "Start", $CellContext`measurestatus = 
         False, $CellContext`text = "", $CellContext`t = 
         0.02, $CellContext`timestep = 0.006, $CellContext`scaled[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]]] := 
         If[$CellContext`prob[$CellContext`d, $CellContext`t, $CellContext`m, \
$CellContext`a, $CellContext`a] > 2, 
           2 ($CellContext`prob[$CellContext`d, $CellContext`t, \
$CellContext`m, $CellContext`a, \
$CellContext`x]/$CellContext`prob[$CellContext`d, $CellContext`t, \
$CellContext`m, $CellContext`a, $CellContext`a]), 
           $CellContext`prob[$CellContext`d, $CellContext`t, $CellContext`m, \
$CellContext`a, $CellContext`x]], $CellContext`prob[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]], 
           Pattern[$CellContext`x, 
            Blank[]]] := PDF[
           $CellContext`gaussian[$CellContext`d, $CellContext`t, \
$CellContext`m, $CellContext`a], $CellContext`x], $CellContext`gaussian[
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`t, 
            Blank[]], 
           Pattern[$CellContext`m, 
            Blank[]], 
           Pattern[$CellContext`a, 
            Blank[]]] := 
         NormalDistribution[$CellContext`a, ($CellContext`d/Sqrt[2]) 
           Sqrt[1 + ($CellContext`t/($CellContext`m $CellContext`d^2))^2]], \
$CellContext`ticks[
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
           FillingStyle -> GrayLevel[1]}}; Typeset`initDone$$ = True),
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
WindowSize->{890, 399},
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
Cell[1235, 30, 9559, 204, 399, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature zxpP@GoyCYOEXBw@VguDo0nt *)
