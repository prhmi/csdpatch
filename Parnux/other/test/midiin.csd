<Cabbage>
form caption("In") size(400, 300), guiMode("queue"), pluginId("def2")
keyboard bounds(8, 158, 381, 95)
csoundoutput bounds(0, 0, 400, 154) channel("csoundoutput10001")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128   -+rtmidi=null -ma -M0 -N -Q0 -+raw_controller_mode=1 temp.orc temp.sco
;-n -+rtmidi=NULL -M0 -Q0 -m0d  
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
;f0 z
;i 2 0 1
</CsScore>
</CsoundSynthesizer>
