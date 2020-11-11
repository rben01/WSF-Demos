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
NotebookDataLength[     22645,        436]
NotebookOptionsPosition[     22948,        428]
NotebookOutlinePosition[     23411,        448]
CellTagsIndexPosition[     23368,        445]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`t$$ = 0, $CellContext`v1$$ = 
      0.5, $CellContext`v2$$ = 0.5, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`v1$$], 0.5, "Velocity of the red rocket"}, 0, 1, 
        0.01}, {{
         Hold[$CellContext`v2$$], 0.5, "Velocity of the purple rocket"}, 0, 1,
         0.01}, {{
         Hold[$CellContext`t$$], 0, "Time"}, 0, 350}}, Typeset`size$$ = {
      1162., {234., 237.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`v1$1777$$ = 
      0, $CellContext`v2$1778$$ = 0, $CellContext`t$1779$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`t$$ = 0, $CellContext`v1$$ = 
          0.5, $CellContext`v2$$ = 0.5}, "ControllerVariables" :> {
          Hold[$CellContext`v1$$, $CellContext`v1$1777$$, 0], 
          Hold[$CellContext`v2$$, $CellContext`v2$1778$$, 0], 
          Hold[$CellContext`t$$, $CellContext`t$1779$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> 
        GraphicsGrid[{{
            Show[
             Graphics[{
               Text[
                Style[
                "Ground Frame", 26, Black, Bold, FontFamily -> "Calibri"], {
                200, 45}]}], 
             Graphics[{
               Text[
                Style[
                 
                 Row[{"\!\(\*SubscriptBox[\(v\), \(1\)]\) = ", \
$CellContext`v1$$, " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                25 + $CellContext`v1$$ $CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket1, {
                25 + $CellContext`v1$$ $CellContext`t$$, 25}, {
                Center, Center}, {35, Automatic}]}], 
             Graphics[{
               Text[
                Style[
                 
                 Row[{"\!\(\*SubscriptBox[\(v\), \(2\)]\) = ", \
$CellContext`v2$$, " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                375 - $CellContext`v2$$ $CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket2, {
                375 - $CellContext`v2$$ $CellContext`t$$, 25}, {
                Center, Center}, {35, Automatic}]}], 
             PlotRange -> {{0, 400}, {0, 50}}, ImageSize -> 1000]}, {
            Show[
             Graphics[{
               Text[
                Style[
                "Red Rocket Frame", 26, Black, Bold, FontFamily -> 
                 "Calibri"], {200, 45}]}], 
             Graphics[{
               Text[
                Style["", 22, Black, Bold], {25, 10}], 
               
               Inset[$CellContext`rocket1, {25, 25}, {Center, Center}, {
                35, Automatic}]}], 
             Graphics[{
               Text[
                Style[
                 Row[{"\!\(\*SubscriptBox[\(v\), \(rel\)]\) = ", 
                   NumberForm[
                    $CellContext`vSTR[$CellContext`v1$$, $CellContext`v2$$], 
                    3], " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                375 - $CellContext`vSTR[$CellContext`v1$$, $CellContext`v2$$] \
$CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket2, {
                375 - $CellContext`vSTR[$CellContext`v1$$, $CellContext`v2$$] \
$CellContext`t$$, 25}, {Center, Center}, {35, Automatic}]}], 
             PlotRange -> {{0, 400}, {0, 50}}, ImageSize -> 1000]}, {
            Show[
             Graphics[{
               Text[
                Style[
                 Row[{"\!\(\*SubscriptBox[\(v\), \(Galileo\)]\) = ", 
                   NumberForm[
                    $CellContext`vGalileo[$CellContext`v1$$, \
$CellContext`v2$$], 3], " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                375 - $CellContext`vGalileo[$CellContext`v1$$, \
$CellContext`v2$$] $CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket3, {
                375 - $CellContext`vGalileo[$CellContext`v1$$, \
$CellContext`v2$$] $CellContext`t$$, 25}, {Center, Center}, {
                35, Automatic}]}], PlotRange -> {{0, 400}, {0, 50}}, 
             ImageSize -> 1000]}}, 
          Dividers -> {{False, False}, {False, True, False}}, Spacings -> 
          Scaled[0.3]], 
        "Specifications" :> {{{$CellContext`v1$$, 0.5, 
            "Velocity of the red rocket"}, 0, 1, 
           0.01}, {{$CellContext`v2$$, 0.5, "Velocity of the purple rocket"}, 
           0, 1, 0.01}, Delimiter, {{$CellContext`t$$, 0, "Time"}, 0, 350}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{1182., {303., 310.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`rocket1 = Image[
           RawArray["Byte", CompressedData["
1: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
lHwTOTl48CAZPHiw9r6s26j/B5LNJhQ=
            "]], "Byte", ColorSpace -> "RGB", Interleaving -> 
           True], $CellContext`rocket2 = Image[
           RawArray["Byte", CompressedData["
1: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
k6LYUQ==
            "]], "Byte", ColorSpace -> "RGB", Interleaving -> 
           True], $CellContext`vSTR[
           Pattern[$CellContext`v1, 
            Blank[]], 
           Pattern[$CellContext`v2, 
            Blank[]]] := ($CellContext`v1 + $CellContext`v2)/(
          1 + $CellContext`v1 $CellContext`v2), $CellContext`vGalileo[
           Pattern[$CellContext`v1, 
            Blank[]], 
           Pattern[$CellContext`v2, 
            
            Blank[]]] := $CellContext`v1 + $CellContext`v2, \
$CellContext`rocket3 = Image[
           RawArray["Byte", CompressedData["
1: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
Cg==
            "]], "Byte", ColorSpace -> "RGB", Interleaving -> False]}; 
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
WindowSize->{1224, 653},
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
Cell[1235, 30, 21709, 396, 653, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature yu0ku1D5GeQdYBg6xdpSkfYG *)
