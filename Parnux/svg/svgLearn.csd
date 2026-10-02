<Cabbage>
form caption("parnux gui") size(400, 230), typeface("parnux.ttf") colour(16, 20, 25), guiMode("queue") pluginId("min6")
rslider bounds(238, 102, 60, 60) channel("r1") range(2, 200, 70, 1, 1)  popupText("0"), alpha(0)
hslider bounds(88, 46, 152, 16)  channel("h1") range(0, 100, 50, 1, 0.1) popupText("0"), alpha(0)
hslider bounds(88, 78, 152, 16)  channel("h3") range(0, 100, 50, 1, 0.1) popupText("0"), alpha(0)

hslider bounds(92, 114, 126, 19)  channel("h2") range(0, 100, 50, 1, 0.001) popupText("0"), alpha(0)
vslider bounds(332, 40, 15, 123)  channel("v1") range(0, 100, 65, 1, 0.1)  popupText("0"), alpha(0)
nslider bounds(142, 172, 70, 28) channel("n1") range(0, 100, 40, 1, 0.01) colour(57, 64, 67, 255) fontColour(235, 235, 240, 255)

; the ONLY visible MIDI learn control: one global on/off button
button bounds(10, 10, 74, 20) channel("mlearn") text("MIDI Learn", "Learning...") latched(1) fontSize(10) colour:0(60, 60, 70, 255) colour:1(229, 106, 106, 255) corners(2)
; Clear (removes the mapping of the selected slider); only shown while learn mode is on
button bounds(90, 10, 46, 20) channel("mclear") text("Clear", "Clear") latched(0) visible(0) fontSize(10) colour:0(60, 60, 70, 255) colour:1(229, 106, 106, 255) corners(2)
; Reset all (removes every MIDI mapping); only shown while learn mode is on
button bounds(142, 10, 62, 20) channel("mreset") text("Reset all", "Reset all") latched(0) visible(0) fontSize(10) colour:0(60, 60, 70, 255) colour:1(229, 106, 106, 255) corners(2)

; hidden CC stores, one per mapped slider, named "<channel>_cc".
; Normal widgets, so the DAW saves and restores the learned CC numbers.
;nslider bounds(0, 0, 1, 1) channel("r1_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;nslider bounds(0, 0, 1, 1) channel("h1_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;nslider bounds(0, 0, 1, 1) channel("h2_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;nslider bounds(0, 0, 1, 1) channel("v1_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;nslider bounds(0, 0, 1, 1) channel("n1_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;nslider bounds(0, 0, 1, 1) channel("h3_cc") range(-1, 127, -1, 1, 1) alpha(0) mouseInteraction(0)
;
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d
</CsOptions>
<CsInstruments>
ksmps = 64
nchnls = 2
0dbfs = 1

#include "svgLearn.udo"

instr 1
   midiLearnMaster      ; once, before the sliders
Scolor = "50 212 255"
Stitle = "title"
iMod = 0
   kR   rSlider   "r1", Stitle,  Scolor, 1,6
   kV   vSlider   "v1", Stitle,  Scolor, 1
   kH   hSlider   "h1", Stitle,  Scolor, 1, iMod
   kH2   hSlider   "h3", Stitle,  Scolor, 1, iMod
   kHN  hnSlider  "h2", Stitle,  Scolor, iMod
   kN   nSlider   "n1", "master dB", 1

   ; original test line; it overwrites r1 every k-cycle and would fight the
   ; MIDI mapping, so it is disabled
   ;kOut randomh 20, 200, 5
   ;cabbageSetValue "r1", kOut

endin

</CsInstruments>
<CsScore>
f0 z
i1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
