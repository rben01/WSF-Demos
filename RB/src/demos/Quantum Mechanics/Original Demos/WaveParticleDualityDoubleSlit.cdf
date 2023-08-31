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
NotebookDataLength[      5600,        135]
NotebookOptionsPosition[      5896,        126]
NotebookOutlinePosition[      6368,        147]
CellTagsIndexPosition[      6325,        144]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{
Cell[BoxData[
 FrameBox[
  PanelBox[
   TagBox[
    StyleBox[
     DynamicModuleBox[{$CellContext`d$$ = 20, $CellContext`numTrials$$ = 
      1000, $CellContext`\[Lambda]$$ = 550, Typeset`show$$ = True, 
      Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
      Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
      "\"untitled\"", Typeset`specs$$ = {{{
         Hold[$CellContext`\[Lambda]$$], 550, "Wavelength of Light (nm)"}, 
        400, 700}, {{
         Hold[$CellContext`d$$], 20, "Slit Seperation (\[Mu]m)"}, 20, 40}, {{
         Hold[$CellContext`numTrials$$], 1000, "Number of Photons"}, 500, 
        5000}}, Typeset`size$$ = {600., {128., 133.}}, Typeset`update$$ = 0, 
      Typeset`initDone$$, Typeset`skipInitDone$$ = 
      False, $CellContext`\[Lambda]$8396$$ = 0, $CellContext`d$8397$$ = 
      0, $CellContext`numTrials$8398$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`d$$ = 20, $CellContext`numTrials$$ = 
          1000, $CellContext`\[Lambda]$$ = 550}, "ControllerVariables" :> {
          Hold[$CellContext`\[Lambda]$$, $CellContext`\[Lambda]$8396$$, 0], 
          Hold[$CellContext`d$$, $CellContext`d$8397$$, 0], 
          Hold[$CellContext`numTrials$$, $CellContext`numTrials$8398$$, 0]}, 
        "OtherVariables" :> {
         Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
          Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
          Typeset`specs$$, Typeset`size$$, Typeset`update$$, 
          Typeset`initDone$$, Typeset`skipInitDone$$}, "Body" :> Show[{
           Graphics[{Transparent, 
             EdgeForm[Thick], 
             
             Rectangle[{$CellContext`xmin - 0.1, $CellContext`ymin - 
               0.1}, {$CellContext`xmax + 0.1, $CellContext`ymax + 0.1}]}], 
           Graphics[{
             ColorData["VisibleSpectrum"][$CellContext`\[Lambda]$$], 
             Point[
              
              Map[{Re[#] 
                Boole[$CellContext`Intensity[$CellContext`\[Lambda]$$, 
                    5, $CellContext`d$$, Re[#]/$CellContext`L] >= 
                  Im[#]], ((
                   Im[#]/$CellContext`Intensity[$CellContext`\[Lambda]$$, 
                    5, $CellContext`d$$, 
                    Re[#]/$CellContext`L]) ($CellContext`ymax - \
$CellContext`ymin) + $CellContext`ymin) 
                Boole[$CellContext`Intensity[$CellContext`\[Lambda]$$, 
                    5, $CellContext`d$$, Re[#]/$CellContext`L] >= Im[#]]}& , 
               
               RandomComplex[{$CellContext`xmin, $CellContext`xmax + 
                 I}, $CellContext`numTrials$$]]]}, 
            PlotRange -> {{$CellContext`xmin, $CellContext`xmax}, \
{$CellContext`ymin, $CellContext`ymax}}]}, ImageSize -> 600], 
        "Specifications" :> {{{$CellContext`\[Lambda]$$, 550, 
            "Wavelength of Light (nm)"}, 400, 700, Appearance -> 
           "Labeled"}, {{$CellContext`d$$, 20, "Slit Seperation (\[Mu]m)"}, 
           20, 40, Appearance -> "Labeled"}, 
          Delimiter, {{$CellContext`numTrials$$, 1000, "Number of Photons"}, 
           500, 5000, Appearance -> "Labeled"}}, 
        "Options" :> {Paneled -> False}, "DefaultOptions" :> {}],
       ImageSizeCache->{620., {197., 202.}},
       SingleEvaluation->True],
      Deinitialization:>None,
      DynamicModuleValues:>{},
      Initialization:>({$CellContext`xmin = -5, $CellContext`ymin = -2, \
$CellContext`xmax = 5, $CellContext`ymax = 2, $CellContext`Intensity[
           Pattern[$CellContext`\[Lambda], 
            Blank[]], 
           Pattern[$CellContext`w, 
            Blank[]], 
           Pattern[$CellContext`d, 
            Blank[]], 
           Pattern[$CellContext`sin\[Theta], 
            Blank[]]] = ($CellContext`\[Lambda]^2 
           Cos[(1000 $CellContext`d 
               Pi $CellContext`sin\[Theta])/$CellContext`\[Lambda]]^2 
           Sin[(1000 
               Pi $CellContext`sin\[Theta] $CellContext`w)/$CellContext`\
\[Lambda]]^2)/(1000000 
          Pi^2 $CellContext`sin\[Theta]^2 $CellContext`w^2), $CellContext`L = 
         100}; Typeset`initDone$$ = True),
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
WindowSize->{656, 433},
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
Cell[1235, 30, 4657, 94, 433, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature 1xT33C73Ytm06CwmIwkRIcqP *)
