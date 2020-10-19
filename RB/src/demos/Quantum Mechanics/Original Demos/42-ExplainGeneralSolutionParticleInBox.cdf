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
NotebookDataLength[     15185,        337]
NotebookOptionsPosition[     15478,        328]
NotebookOutlinePosition[     15951,        349]
CellTagsIndexPosition[     15908,        346]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`funcChoice$$ = 1, $CellContext`nChoice$$ =
       1, Typeset`show$$ = True, Typeset`bookmarkList$$ = {}, 
      Typeset`bookmarkMode$$ = "Menu", Typeset`animator$$, Typeset`animvar$$ =
       1, Typeset`name$$ = "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`funcChoice$$], 1, "Function Choice"}, {
        1 -> "First Function", 2 -> "Second Function", 3 -> 
         "Third Function"}}, {{
         Hold[$CellContext`nChoice$$], 1, "Number of Terms"}, {1, 2, 3, 4, 
        5}}, {
        Hold[
         Row[{
           Button[
            Dynamic[
             
             Part[$CellContext`playButtonLabel, $CellContext`trigger + 
              1]], $CellContext`trigger = 1 - $CellContext`trigger; Null, 
            ImageSize -> 70], 
           Button[
           "Stop and Reset", $CellContext`trigger = 0; $CellContext`t = 0; 
            Null, ImageSize -> 120]}]], Manipulate`Dump`ThisIsNotAControl}}, 
      Typeset`size$$ = {1074., {231., 236.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`funcChoice$270818$$ = 
      False, $CellContext`nChoice$270819$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`funcChoice$$ = 1, $CellContext`nChoice$$ = 
          1}, "ControllerVariables" :> {
          
          Hold[$CellContext`funcChoice$$, $CellContext`funcChoice$270818$$, 
           False], 
          Hold[$CellContext`nChoice$$, $CellContext`nChoice$270819$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, 
        "Body" :> (
         If[$CellContext`trigger == 
           1, $CellContext`t = $CellContext`t + $CellContext`dt; 
           Pause[$CellContext`dt]]; $CellContext`phases = 
          Table[E^((-I) 
             Part[$CellContext`EnergyList, $CellContext`i] \
($CellContext`t/$CellContext`\[HBar])), {$CellContext`i, 1, 
             5}]; $CellContext`phasesRe = 
          Re[$CellContext`phases]; $CellContext`phasesIm = 
          Im[$CellContext`phases]; $CellContext`phasesString = Table[
            StringJoin[
             ToString[
              NumberForm[
               Part[$CellContext`phasesRe, $CellContext`i], {2, 3}, 
               NumberSigns -> {"-", "+"}]], 
             ToString[
              NumberForm[
               Part[$CellContext`phasesIm, $CellContext`i], {2, 3}, 
               NumberSigns -> {"-", "+"}]], "\[ImaginaryI]"], {$CellContext`i,
              1, 5}]; Show[{
            (GraphicsColumn[{
              (GraphicsRow[{
                GraphicsColumn[{
                  Graphics[
                   Text[
                    (Style[
                    "   \[Psi](x,t) = \!\(\*SubscriptBox[\(c\), \
\(1\)]\)\!\(\*SubscriptBox[\(\[Psi]\), \(1\)]\)(x)\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \*SubscriptBox[\(E\), \(1\)] t/\
\[HBar]\)]\)", FontSize -> 12, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]], 
                  Graphics[
                   Text[
                    (Style[
                    StringJoin["= (", 
                    ToString[
                    
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, 
                    1]], ") \!\(\*SubscriptBox[\(\[Psi]\), \(1\)]\)(x) ( ", 
                    ToString[
                    Part[$CellContext`phasesString, 1]], " )"], FontSize -> 
                    11, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]]}, AspectRatio -> 
                 Full], 
                If[$CellContext`nChoice$$ >= 2, 
                 GraphicsColumn[{
                   Graphics[
                    Text[
                    (Style[
                    "+     \!\(\*SubscriptBox[\(c\), \
\(2\)]\)\!\(\*SubscriptBox[\(\[Psi]\), \(2\)]\)(x)\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \*SubscriptBox[\(E\), \(2\)] t/\
\[HBar]\)]\)", FontSize -> 12, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]], 
                   Graphics[
                    Text[
                    (Style[
                    StringJoin["+ (", 
                    ToString[
                    
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, 
                    2]], ") \!\(\*SubscriptBox[\(\[Psi]\), \(2\)]\)(x) ( ", 
                    ToString[
                    Part[$CellContext`phasesString, 2]], " ) +"], FontSize -> 
                    11, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]]}, AspectRatio -> 
                  Full]], 
                If[$CellContext`nChoice$$ >= 3, 
                 GraphicsColumn[{
                   Graphics[
                    Text[
                    (Style[
                    "+     \!\(\*SubscriptBox[\(c\), \
\(3\)]\)\!\(\*SubscriptBox[\(\[Psi]\), \(3\)]\)(x)\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \*SubscriptBox[\(E\), \(3\)] t/\
\[HBar]\)]\)", FontSize -> 12, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]], 
                   Graphics[
                    Text[
                    (Style[
                    StringJoin["+ (", 
                    ToString[
                    
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, 
                    3]], ") \!\(\*SubscriptBox[\(\[Psi]\), \(2\)]\)(x) ( ", 
                    ToString[
                    Part[$CellContext`phasesString, 3]], " )"], FontSize -> 
                    11, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]]}, AspectRatio -> 
                  Full]], 
                If[$CellContext`nChoice$$ >= 4, 
                 GraphicsColumn[{
                   Graphics[
                    Text[
                    (Style[
                    "+     \!\(\*SubscriptBox[\(c\), \
\(4\)]\)\!\(\*SubscriptBox[\(\[Psi]\), \(4\)]\)(x)\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \*SubscriptBox[\(E\), \(4\)] t/\
\[HBar]\)]\)", FontSize -> 12, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]], 
                   Graphics[
                    Text[
                    (Style[
                    StringJoin["+ (", 
                    ToString[
                    
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, 
                    4]], ") \!\(\*SubscriptBox[\(\[Psi]\), \(2\)]\)(x) ( ", 
                    ToString[
                    Part[$CellContext`phasesString, 4]], " )"], FontSize -> 
                    11, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]]}, AspectRatio -> 
                  Full]], 
                If[$CellContext`nChoice$$ >= 5, 
                 GraphicsColumn[{
                   Graphics[
                    Text[
                    (Style[
                    "+     \!\(\*SubscriptBox[\(c\), \
\(5\)]\)\!\(\*SubscriptBox[\(\[Psi]\), \(5\)]\)(x)\!\(\*SuperscriptBox[\(\
\[ExponentialE]\), \(\(-\[ImaginaryI]\)\\ \*SubscriptBox[\(E\), \(5\)] t/\
\[HBar]\)]\)", FontSize -> 12, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]], 
                   Graphics[
                    Text[
                    (Style[
                    StringJoin["+ (", 
                    ToString[
                    
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, 
                    5]], ") \!\(\*SubscriptBox[\(\[Psi]\), \(2\)]\)(x) ( ", 
                    ToString[
                    Part[$CellContext`phasesString, 5]], " )"], FontSize -> 
                    11, FontFamily -> "Helvetica", #]& )[
                    Sequence[$CellContext`$FontOptions]]]]}, AspectRatio -> 
                  Full]]}, Frame -> True, AspectRatio -> Full, 
               SlotSequence[1]]& )[
               Apply[Sequence, $CellContext`$GridOptions]], 
              GraphicsRow[{
                (Plot[Abs[
                   Sum[
                   Part[$CellContext`\[Psi]EigenstateList, $CellContext`i] 
                    Part[$CellContext`coeffList, $CellContext`funcChoice$$, \
$CellContext`i] E^((-I) 
                    Part[$CellContext`EnergyList, $CellContext`i] \
($CellContext`t/$CellContext`\[HBar])), {$CellContext`i, 
                    1, $CellContext`nChoice$$}]]^2, {$CellContext`x, 
                  0, $CellContext`L}, 
                 PlotRange -> {
                  0, Part[$CellContext`plotRangeMax, \
$CellContext`funcChoice$$]^2}, PlotLabel -> 
                 "|\[Psi](x)\!\(\*SuperscriptBox[\(|\), \(2\)]\)", ImageSize -> 
                 310, #]& )[
                 Sequence[$CellContext`$PlotOptions]], 
                (Plot[
                 Re[
                  Sum[
                  Part[$CellContext`\[Psi]EigenstateList, $CellContext`i] 
                   Part[$CellContext`coeffList, $CellContext`funcChoice$$, \
$CellContext`i] E^((-I) 
                    Part[$CellContext`EnergyList, $CellContext`i] \
($CellContext`t/$CellContext`\[HBar])), {$CellContext`i, 
                    1, $CellContext`nChoice$$}]], {$CellContext`x, 
                  0, $CellContext`L}, PlotRange -> {
                   Part[$CellContext`plotRangeMin, $CellContext`funcChoice$$], 
                   
                   Part[$CellContext`plotRangeMax, \
$CellContext`funcChoice$$]}, PlotLabel -> "Re[\[Psi](x)]", ImageSize -> 
                 310, #]& )[
                 Sequence[$CellContext`$PlotOptions]], 
                (Plot[
                 Im[
                  Sum[
                  Part[$CellContext`\[Psi]EigenstateList, $CellContext`i] 
                   Part[$CellContext`coeffList, $CellContext`funcChoice$$, \
$CellContext`i] E^((-I) 
                    Part[$CellContext`EnergyList, $CellContext`i] \
($CellContext`t/$CellContext`\[HBar])), {$CellContext`i, 
                    1, $CellContext`nChoice$$}]], {$CellContext`x, 
                  0, $CellContext`L}, PlotRange -> {
                   Part[$CellContext`plotRangeMin, $CellContext`funcChoice$$], 
                   
                   Part[$CellContext`plotRangeMax, \
$CellContext`funcChoice$$]}, PlotLabel -> "Im [\[Psi](x)]", ImageSize -> 
                 310, #]& )[
                 Sequence[$CellContext`$PlotOptions]]}]}, #]& )[
             Apply[Sequence, $CellContext`$GridOptions]]}]), 
        "Specifications" :> {{{$CellContext`funcChoice$$, 1, 
            "Function Choice"}, {
           1 -> "First Function", 2 -> "Second Function", 3 -> 
            "Third Function"}}, {{$CellContext`nChoice$$, 1, 
            "Number of Terms"}, {1, 2, 3, 4, 5}}, Delimiter, 
          Row[{
            Button[
             Dynamic[
              
              Part[$CellContext`playButtonLabel, $CellContext`trigger + 
               1]], $CellContext`trigger = 1 - $CellContext`trigger; Null, 
             ImageSize -> 70], 
            Button[
            "Stop and Reset", $CellContext`trigger = 0; $CellContext`t = 0; 
             Null, ImageSize -> 120]}]}, "Options" :> {Paneled -> False}, 
        "DefaultOptions" :> {}],
       ImageSizeCache->{1094., {298., 304.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`trigger = 0, $CellContext`t = 
         0, $CellContext`dt = 
         0.02, $CellContext`phases = {1, 1, 1, 1, 
          1}, $CellContext`EnergyList = {
          Pi^2/2, 2 Pi^2, (9 Pi^2)/2, 8 Pi^2, (25 Pi^2)/
           2}, $CellContext`\[HBar] = 
         1, $CellContext`phasesRe = {1, 1, 1, 1, 1}, $CellContext`phasesIm = {
          0, 0, 0, 0, 0}, $CellContext`phasesString = {
          "+1.000+0.000\[ImaginaryI]", "+1.000+0.000\[ImaginaryI]", 
           "+1.000+0.000\[ImaginaryI]", "+1.000+0.000\[ImaginaryI]", 
           "+1.000+0.000\[ImaginaryI]"}, $CellContext`$FontOptions = {
           GrayLevel[1]}, $CellContext`coeffList = {{0.6, 0., -0.12, 
          0., -0.02}, {0.18, 0., 0.01, 0., 0.}, {0.04, 0., -0.01, 0., 
          0.}}, $CellContext`$GridOptions = {
          Background -> GrayLevel[0], FrameStyle -> 
           GrayLevel[1]}, $CellContext`\[Psi]EigenstateList = {
          Sqrt[2] Sin[Pi $CellContext`x], Sqrt[2] Sin[2 Pi $CellContext`x], 
           Sqrt[2] Sin[3 Pi $CellContext`x], Sqrt[2] Sin[4 Pi $CellContext`x],
            Sqrt[2] Sin[5 Pi $CellContext`x]}, $CellContext`L = 
         1, $CellContext`plotRangeMax = {1.4, 0.35, 
          0.0875}, $CellContext`$PlotOptions = {PlotStyle -> {{
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
             GrayLevel[
             1]]}, $CellContext`plotRangeMin = {-1.4, -0.35, -0.0875}, \
$CellContext`playButtonLabel = {"Play", "Pause"}}; Typeset`initDone$$ = True),
      
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
WindowSize->{1130, 636},
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
Cell[1235, 30, 14239, 296, 636, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature #v0AjIe@TQ8RUDw5qWcs0GRu *)
