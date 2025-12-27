<Cabbage>
form caption("Kick") size(300, 280), pluginId("kick") style("legacy")
rslider  bounds(10, 10, 60, 60),  text("Attack"),  channel("atc"),  range(0.01, 1, 0.01, 1, 0.01),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 10, 60, 60),  text("Amp"),     channel("amp"),  range(0.1, 0.8, 0.3, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(130, 10, 60, 60),  text("Duration"),     channel("dur"),  range(0.5, 3, 1, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)

keyboard pos(10, 220), size(280, 50)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

seed 0


instr trig
iFilter cpsmidi
idur chnget "dur"
schedule "kick", 0, idur,iFilter
endin

instr kick
iAtt chnget "atc"
iAmp chnget "amp"
;kFilter chnget "fltr";linseg 500, p3-iAtt, 500
iFilter = p4
aEnv1 transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, 0
kfrqRnd = randi:k(10,13,2)
a1 poscil 20, 10+kfrqRnd
a2 poscil 1, 20
asub poscil aEnv1, 50+a1
akcik noise aEnv1, -0.2
akcik  clip akcik, 2, .7
akcik clfilt akcik, iFilter, 0, 10
aout = akcik+asub
out aout,aout
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
