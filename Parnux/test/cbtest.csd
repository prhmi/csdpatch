<Cabbage>
form caption("Texteditor Example") size(380, 300), guiMode("queue"), colour(2, 145, 209) pluginId("def1")

texteditor bounds(18, 161, 109, 36) fontSize(25), channel("orcText"), scrollBars(1), wrap(1),  fontColour(124, 210, 0), colour(0, 0, 0, 100)

texteditor bounds(96, 85, 234, 30)   channel("orcText2") fontSize(20) ;text("2 3")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n -d -+rtmidi=NULL -M0 -m0d --midi-key=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 16
nchnls = 2
0dbfs = 1


; Rory Walsh 2021 
;
; License: CC0 1.0 Universal
; You can copy, modify, and distribute this file, 
; even for commercial purposes, all without asking permission. 

instr 1
    SText  = "20 40"
    cabbageSet "orcText2", "text",  SText
endin


</CsInstruments>
<CsScore>
i1 0 0.1
</CsScore>
</CsoundSynthesizer>