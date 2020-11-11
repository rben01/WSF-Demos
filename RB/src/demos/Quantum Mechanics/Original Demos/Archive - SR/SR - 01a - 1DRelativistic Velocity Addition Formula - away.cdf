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
NotebookDataLength[     22789,        438]
NotebookOptionsPosition[     23092,        430]
NotebookOutlinePosition[     23555,        450]
CellTagsIndexPosition[     23512,        447]
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
         Hold[$CellContext`v1$$], 0.5, "Velocity of the red rocket"}, 0, 0.99,
         0.01}, {{
         Hold[$CellContext`v2$$], 0.5, "Velocity of the purple rocket"}, 0, 
        0.99, 0.01}, {{
         Hold[$CellContext`t$$], 0, "Time"}, 0, 175}}, Typeset`size$$ = {
      1162., {234., 237.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
      Typeset`skipInitDone$$ = False, $CellContext`v1$4154$$ = 
      0, $CellContext`v2$4155$$ = 0, $CellContext`t$4156$$ = 0}, 
      DynamicBox[Manipulate`ManipulateBoxes[
       1, StandardForm, 
        "Variables" :> {$CellContext`t$$ = 0, $CellContext`v1$$ = 
          0.5, $CellContext`v2$$ = 0.5}, "ControllerVariables" :> {
          Hold[$CellContext`v1$$, $CellContext`v1$4154$$, 0], 
          Hold[$CellContext`v2$$, $CellContext`v2$4155$$, 0], 
          Hold[$CellContext`t$$, $CellContext`t$4156$$, 0]}, 
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
                200 + $CellContext`v2$$ $CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket2, {
                200 + $CellContext`v2$$ $CellContext`t$$, 25}, {
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
                    $CellContext`vSTR[$CellContext`v2$$, $CellContext`v1$$], 
                    3], " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                200 + $CellContext`vSTR[$CellContext`v2$$, $CellContext`v1$$] \
$CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket2, {
                200 + $CellContext`vSTR[$CellContext`v2$$, $CellContext`v1$$] \
$CellContext`t$$, 25}, {Center, Center}, {35, Automatic}]}], 
             PlotRange -> {{0, 400}, {0, 50}}, ImageSize -> 1000]}, {
            Show[
             Graphics[{
               Text[
                Style[
                 Row[{"\!\(\*SubscriptBox[\(v\), \(Galileo\)]\) = ", 
                   NumberForm[
                    $CellContext`vGalileo[$CellContext`v2$$, \
$CellContext`v1$$], 3], " c"}], 22, Black, Bold, FontFamily -> "Calibri"], {
                200 + $CellContext`vGalileo[$CellContext`v2$$, \
$CellContext`v1$$] $CellContext`t$$, 10}], 
               
               Inset[$CellContext`rocket3, {
                200 + $CellContext`vGalileo[$CellContext`v2$$, \
$CellContext`v1$$] $CellContext`t$$, 25}, {Center, Center}, {
                35, Automatic}]}], PlotRange -> {{0, 400}, {0, 50}}, 
             ImageSize -> 1000]}}, 
          Dividers -> {{False, False}, {False, True, False}}, Spacings -> 
          Scaled[0.3]], 
        "Specifications" :> {{{$CellContext`v1$$, 0.5, 
            "Velocity of the red rocket"}, 0, 0.99, 
           0.01}, {{$CellContext`v2$$, 0.5, "Velocity of the purple rocket"}, 
           0, 0.99, 0.01}, 
          Delimiter, {{$CellContext`t$$, 0, "Time"}, 0, 175}}, 
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
dWXU4xLVQ+aDklNVqx56XRJvJk7ImhrB2OzBHKMuc/5xvqmNSu2zb26gset1
12U61MP3kWuvtfUzV1d2a3j4E8qz1qnfcZHqITU9qSNVsx5q16YmO3707taX
dsdSmhPVoddQQ246ZbJSk8yYOlja7/HHdhkzlywpWAdw9Vc8Att7Vg6oHheo
HlJnfeut6tZD83K5b3ZudPXLfC0NzU+i4fm9qS4/JLLrVVcV+0Dy+WOPgSZP
jurNbW7skOdSu+/tbFTO+VWT6tGnj82ZqlkPoc5fZc47fXpx/tGnT4auuKLY
9loPk8cyr1q9Oq7pJ/L1Cz07lStXVz3OUz169QK9+mrhb65W6vXJ39/fkaFz
lmV5Dpylq67MmJw9eYyvi9QcpS6N4rzjTcT1rHKvyasey1QPqbtJ7ro16NHZ
Nfp1Nn3tiSdARxxRsB7m5+V/ZA53NqlEXVH1OFP1EN+VGKD3UzXHLKVf5xRK
vSdZV3z0UdDRR4NqaqLxWtatdN1H5rOnenapVI1X9ThD9ejWDdF8xL8H0+rp
/rpFJbWQ60hbE5G89qabQAceWLAeZdZBEI8T0ps20tmhUnVdRa27hpNUD1lL
u/lm0Isv2jykq7ZO08yvDf8vuvlrU/53pMWqjz+264VLl4KGDy9aj2r3dLmf
OcezRSV7jpNrYRcj7j8x1ytxS9Zix40DzZ5t1wWXLwddfTXo9tvt2reMmZ2t
U5XSzl/zK8Wu1PklNj39NOj660HHHFOkgVnjSKzX3s+c34Etyonkd8v9Ibmn
uX67j0D725Nrt8Vzyu7dbc1C+goOOAB03HF2DV00k94D6UGQfgVZ4/7oIzu/
3Bz/kLFA1oVlXJO1+Q0b7NqSrJdLvcnrWzB+ILlcop9Beu+lBrWv99t1/0sl
kFyjnca8HZqLFu7lsPR6eTKul8f2PmV4TpKl4rX29DUIuTclp5E+A1nPnjQJ
NGsW6KCDpBZu5zpyX4uWMt4edZR97dBDQXPngvbYAyRrZOKrMrZ55y7o+ZEx
IaGBvC659VmI50yCSuqQ/G7ZMyN7msy8wvWVtLrHprdtPI6h0TiEGjCLBmGi
6bWWnsM8uhfbPNF/JfaoYb1SeqG0Lqf7SZRtnVCPS+2LS+mJe5d5D/NMxPuD
FMl7spJohO0flT4kvZ+jsaI/dqGpWGx6EW0faLPXk2jrptNwttlfMB7fo0bM
ox0xgwZgHPXFjtQddZRDbap/sK3atedTbKf9ij793kW1s0+1eaLPTvbPSe/O
b5nnwe4t2j7lt1e6X1SgPaPS+3UZbPz0/diu42AUTcLxpo9XanBpewq0x1r7
Rwv1WmvqqFLf3gtn0hScRBOwyPTW2e+Ienj/ylwH248nfQP3wfYO/g22v+Nf
zOeY/2T+g/kU8+/Mh2H72H7B/CFs7JE9WHvC9sOm3e/a815pDXzodUoNJh7n
XN+b9H1OxolRLXSG6VFP66nuuL861muVOWZ/XEFjcThlkddYKJQegREdXKvY
TfbqSq9LV/ZYp/3WzflcOaF53gbE/ZJRj3tPDHT7b06L9n7I/T/zS+47iPcf
rDD+Ir2+iPXXevUR7lok10nuqekM/v6dUvtytgbotUo/kfi8H3ejPYKyP032
AY7BAtoby0zc0jFD99vEe3OKqe/NwSWm313O58YmXcdZ666no7WcTAl+lSFj
ncy/P4Ubz91+v6ifugY9eFwfSzvjYPab042/2HGi2Y0vq81rSutXa817jfiW
N2eOtPil++5qjiPlRtIO4i+y7+h5eLmH63OPtJH4Lz3ugzGV9Zlv9u9IbJM5
1nSca3xJ1uMkPtVhJy9GZTRG3QE7JmxNMaWc0HirkH1Eh8H6zPuIfcbf9xzp
A6NRzuQg3dDL+JLsvUGsg3+s5Dfahxq06BhpOZHMG2V/nuylehuR30T6qL2L
9yzxfDYT54hyjL+mFrToOkr97xLJp6TWJrnCn2HzXW8ukFob+Rg2p5jmnTto
sflQbdLyJ9FH9q8vhK1ByP5X0Ur2v0puJv/zpME7vlrqEV8VqDZ5fLl7vJI1
668TfH1K/c+EoENAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA
QEBAh/gvvinYqw==
            "]], "Byte", ColorSpace -> "RGB", Interleaving -> 
           True], $CellContext`vSTR[
           Pattern[$CellContext`v1, 
            Blank[]], 
           Pattern[$CellContext`v2, 
            Blank[]]] := ($CellContext`v1 - $CellContext`v2)/(
          1 - $CellContext`v1 $CellContext`v2), $CellContext`vGalileo[
           Pattern[$CellContext`v1, 
            Blank[]], 
           Pattern[$CellContext`v2, 
            
            Blank[]]] := $CellContext`v1 - $CellContext`v2, \
$CellContext`rocket3 = Image[
           RawArray["Byte", CompressedData["
1:eJztnGtsU9cdwK8fgEo7aZuo1KVfRpHGprVi0iS0VeqkiUr7MK1IFVon9cOk
Ck3aqwiBNq332PEjjp2H7bh5ODh+hCwkJBCSkIYtCX7EDjSlr01jUFrYWOjY
VGBpgJQkftydc31t3xDuK76nUtv/TyRxru3/7557Xv/jHO7Wl/Y9/5KJYRgz
/torfLEAAAAAAAAAANAFFaEYX/SYnqC2ztPs8zW5EAUJiYjqfB1d0RghGqzT
W0LC1fk7o7FoJBLmiUY8ektqm4JYgGNHBMKRWKOuEkegKxqNlOMLZdFX4myP
RoUihPmyRHGtRMOddtFrUJn1WhyBSCzCRycV3hVs9XnqanE4HNJCEAfmj2hX
4Tc4WsK4xkPBVq/HaUVCLFEgi73OVV/vcthEKm0eclr2JrfDWnq7cLy2saN3
NPHWxavXb975ZGlp6d7djz+6dvHcRH+bs/hCTRpUOnfhV3dwMPHXuY9znASL
V2d6PevQ8N8tDaGhzHs3lqWCi1i+/JqPvEOLpTY8evaDW1kV0QkF8i3//qBd
gwWxLSqjr2Z+yo0tah1+LaEXJjsD3ef4wiwmXCoHasT6CuoVV+r5N4Xv8b/d
PolUXTDENqt3zDvZulfbfTa2Tzgwd0hNURDblFftGGNduM92t1vZD0uHkhZl
CWIbJXvDGgKoLUbGTTfKlI/9y6coQaxnRa0i18AGo+FIONaETleOFg4pSRDr
VtPxirSjQDceQ6NO9p3KwbfrlYZKxLqWVDsSrKMTj9DNyHG3dCg/plzriK37
RLVjqQWPl17cLWZLR653qGi9iHUuqnZw813kPc6zpd9TNjV9HbGVcqvh/cmx
2QXh8eWguo6OWPttLY4K/xlQOywi1javMTg/Lvz7uJVVO/Ui1qrpWvHkzvcg
1aMucVguLKjvIURwddzLapyjWNbmbo0NTb156fqC0kxVuPHuEC/QOqVXXm5r
aDs8nHjz4rWbi/fblufn/jLV6+MzZK2pSenn6nzK4vT42iM9fQNDw8cHB/q6
O/1uq/CMRgExIE9bS7Onzl6qQGSxSoRB60riMPXBGJ8khkPBNn+z22kruvj0
0yJi/dmoi095i4l7tOg61NFmV36jSvBA1RGLitYFgqs7oOe60E7WN5GwaHWA
TbFW/QQ8yBUIkWVUuLxGiLVSWKxZ61s6I7gioqRKYlE/hUUn36ccDS3tnaGu
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
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
Cell[1235, 30, 21853, 398, 653, InheritFromParent]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature ovDvpX#uwq4joBgr9fpCVcqX *)
