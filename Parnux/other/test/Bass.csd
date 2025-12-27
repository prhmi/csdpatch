<Cabbage>
form caption("Bass") size(300, 280), pluginId("bass") style("legacy")
rslider  bounds(10, 10, 60, 60),  text("Attack"),  channel("atc"),  range(0.3, 2, 0.9, 1, 0.01),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 10, 60, 60),  text("Amp"),     channel("amp"),  range(0.1, 0.8, 0.3, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(10, 70, 60, 60),  text("rng"),     channel("rng"),  range(3, 20, 5, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 70, 60, 60),  text("Speed"),     channel("spd"),  range(0.3, 17, 12, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)

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

instr Bass

ifrq cpsmidi
iAtt chnget "atc"
iamp chnget "amp"
kspeed chnget "spd"
krng chnget "rng"
iRel = 3
 aEnv	transegr	0,iAtt,6, iamp,p3,4,0, iRel,-6,0
kamp randi krng, kspeed/2, 2
kfrq randi krng/3, kspeed/5, 2
kAF randi krng, kspeed, 2
aFm poscil 50+kamp, 2+kfrq
aAm poscil 1, ifrq+kAF
aBass poscil aEnv*aAm, 10+aFm
aout = aBass 
out aout,aout
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>

