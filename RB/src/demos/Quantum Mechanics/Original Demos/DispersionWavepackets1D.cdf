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
NotebookDataLength[      7369,        172]
NotebookOptionsPosition[      7673,        164]
NotebookOutlinePosition[      8136,        184]
CellTagsIndexPosition[      8093,        181]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`b$$ = 0, $CellContext`d$$ = 
      0.7, $CellContext`m$$ = 1, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`m$$], 1, "Mass of the particle"}, 0.1, 1.7}, {{
         Hold[$CellContext`d$$], 0.7, "Size of the wavepacket"}, 0.57, 1}, {{
         Hold[$CellContext`b$$], 0, "Momentum"}, -5, 5}, {
        Hold[
         Row[{
           Button[
            Dynamic[$CellContext`starttext], {If[
               
               Or[$CellContext`status == "begin", $CellContext`status == 
                "pause"], $CellContext`status = 
                "normal"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = "Pause"; 
               Null, $CellContext`status = "pause"; $CellContext`sliderstatus = 
                False; $CellContext`starttext = "Resume"; Null]; Null}, 
            ImageSize -> 100], 
           Button[
           "Reset", {$CellContext`status = "begin"; $CellContext`sliderstatus = 
              True; $CellContext`starttext = "Start"; $CellContext`t = 
              0; $CellContext`b$$ = 0; $CellContext`m$$ = 1; $CellContext`d$$ = 
              0.7; Null}, ImageSize -> 100]}]], 
        Manipulate`Dump`ThisIsNotAControl}}, Typeset`size$$ = {
      700., {230., 238.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`m$631$$ = 
      0, $CellContext`d$632$$ = 0, $CellContext`b$633$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`b$$ = 0, $CellContext`d$$ = 
          0.7, $CellContext`m$$ = 1}, "ControllerVariables" :> {
          Hold[$CellContext`m$$, $CellContext`m$631$$, 0], 
          Hold[$CellContext`d$$, $CellContext`d$632$$, 0], 
          Hold[$CellContext`b$$, $CellContext`b$633$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`status == 
           "normal", $CellContext`t = $CellContext`t + $CellContext`timestep; 
           Pause[0.02]; Null]; (Plot[
           $CellContext`prob[$CellContext`d$$, 
            0, -$CellContext`b$$, $CellContext`m$$, $CellContext`x, \
$CellContext`t], {$CellContext`x, -6, 6}, PlotRange -> {0, 0.99}, ImageSize -> 
           700, PlotStyle -> {Thick}, AxesOrigin -> {0, 0}, 
           AxesLabel -> {
            "x", "|\[Psi](x,t)\!\(\*SuperscriptBox[\(|\), \(2\)]\)"}, #]& )[
           Sequence[$CellContext`$PlotOptions]]), 
        "Specifications" :> {{{$CellContext`m$$, 1, "Mass of the particle"}, 
           0.1, 1.7, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`d$$, 0.7, 
            "Size of the wavepacket"}, 0.57, 1, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, {{$CellContext`b$$, 0, 
            "Momentum"}, -5, 5, Enabled -> 
           Dynamic[$CellContext`sliderstatus]}, Delimiter, 
          Row[{
            Button[
             Dynamic[$CellContext`starttext], {If[
                
                Or[$CellContext`status == "begin", $CellContext`status == 
                 "pause"], $CellContext`status = 
                 "normal"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = "Pause"; 
                Null, $CellContext`status = 
                 "pause"; $CellContext`sliderstatus = 
                 False; $CellContext`starttext = "Resume"; Null]; Null}, 
             ImageSize -> 100], 
            Button[
            "Reset", {$CellContext`status = 
               "begin"; $CellContext`sliderstatus = 
               True; $CellContext`starttext = "Start"; $CellContext`t = 
               0; $CellContext`b$$ = 0; $CellContext`m$$ = 
               1; $CellContext`d$$ = 0.7; Null}, ImageSize -> 100]}], 
          Delimiter}, 
        "Options" :> {
         SynchronousUpdating -> True, ControlPlacement -> Left, Paneled -> 
          False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1064., {249., 256.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`status = "begin", $CellContext`t = 
         0, $CellContext`timestep = 0.02, $CellContext`prob[
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
            Blank[]]] := 
         1/(E^((-$CellContext`a + ($CellContext`b \
$CellContext`t)/$CellContext`m + $CellContext`x)^2/($CellContext`d^2 (
             1 + $CellContext`t^2/($CellContext`d^4 $CellContext`m^2)))) \
($CellContext`d Sqrt[Pi] 
           Sqrt[1 + $CellContext`t^2/($CellContext`d^4 $CellContext`m^2)])), \
$CellContext`$PlotOptions = {PlotStyle -> {{
              GrayLevel[1], 
              Thickness[0.007], 
              Opacity[0.7]}}, Background -> GrayLevel[0], 
           TicksStyle -> {{FontSize -> 12, FontFamily -> "Helvetica"}, {
             FontSize -> 12, FontFamily -> "Helvetica"}}, LabelStyle -> {
             GrayLevel[1], FontSize -> 15, FontFamily -> "Helvetica"}, 
           BaseStyle -> {
             GrayLevel[1], FontSize -> 18, FontFamily -> "Helvetica"}, 
           FillingStyle -> GrayLevel[1]}, $CellContext`sliderstatus = 
         True, $CellContext`starttext = "Start"}; Typeset`initDone$$ = True),
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
WindowSize->{1106, 545},
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
Cell[1235, 30, 6434, 132, 545, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature dv0xvFMgEeoMLBgrErnxy9HR *)
