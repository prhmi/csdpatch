<Cabbage>
form caption("Untitled") size(400, 300), guiMode("queue"), pluginId("def1")
keyboard bounds(8, 158, 381, 95)
csoundoutput bounds(0, 0, 400, 154) channel("csoundoutput10001")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

;instrument will be triggered by keyboard widget
instr 1
kEnv madsr .1, .2, .6, .4
iNote notnum
print iNote
iFrq mtof iNote
aOut poscil 0.5, iFrq
outs aOut*kEnv, aOut*kEnv
endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>
