<Cabbage>
form caption("parnux gui") size(400, 230), typeface("parnux.ttf") colour(16, 20, 25), guiMode("queue") pluginId("min6")
rslider bounds(238, 102, 60, 60) channel("r1") range(2, 200, 70, 1, 1)  popupText("0"), alpha(0)
hslider bounds(88, 46, 152, 16)  channel("h1") range(0, 100, 50, 1, 0.1) popupText("0"), alpha(0)
;rslider bounds(88, 46, 152, 16)  channel("h1") range(0, 100, 50, 1, 0.1) popupText("0"), alpha(0)
hslider bounds(92, 114, 126, 19)  channel("h2") range(0, 100, 50, 1, 0.001) popupText("0"), alpha(0)
vslider bounds(332, 40, 15, 123)  channel("v1") range(0, 100, 65, 1, 0.1)  popupText("0"), alpha(0)
;rslider bounds(332, 40, 15, 123) channel("v1") range(2, 200, 70, 1, 1)  popupText("0"), alpha(0)
nslider bounds(142, 172, 70, 28) channel("n1") range(0, 100, 40, 1, 0.01) colour(57, 64, 67, 255) fontColour(235, 235, 240, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d
</CsOptions>
<CsInstruments>
ksmps = 64
nchnls = 2
0dbfs = 1

#include "svg.udo"



instr 1
Scolor = "50 212 255"
Stitle = "title"
iMod = 1
   kR   rSlider   "r1", Stitle,  Scolor, 1,4
   kV   vSlider   "v1", Stitle,  Scolor, iMod
   kH   hSlider   "h1", Stitle,  Scolor, 1, iMod
   kHN  hnSlider  "h2", Stitle,  Scolor, iMod
   kN   nSlider   "n1", Stitle, iMod
endin

</CsInstruments>
<CsScore>
f0 z
i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
