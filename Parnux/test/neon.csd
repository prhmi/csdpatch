<Cabbage>
form caption("Neon") size(300, 280), pluginId("neon") style("legacy")
rslider  bounds(10, 10, 60, 60),  text("rng1"),  channel("rng1"),  range(0.5, 5, 1, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 10, 60, 60),  text("spd1"),  channel("spd1"),  range(0.5, 13, 3, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(10, 70, 60, 60),  text("rng2"),  channel("rng2"),  range(3, 15, 7, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 70, 60, 60),  text("spd2"),  channel("spd2"),  range(0.5, 13, 4, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(10, 130, 60, 60), text("rng3"),  channel("rng3"),  range(2, 20, 3, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 130, 60, 60), text("spd3"),  channel("spd3"),  range(0.5, 13, 3, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(130, 130, 60, 60), text("lfo"),  channel("lfo"),  range(20, 150, 70, 1, 0.1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)

keyboard pos(10, 220), size(280, 50)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs  = 1


seed 0 

instr 1
krng1 chnget "rng1"
kspeed1 chnget "spd1"
krng2 chnget "rng2"
kspeed2 chnget "spd2"
krng3 chnget "rng3"
kspeed3 chnget "spd3"
klfo chnget "lfo"
ifrq		cpsmidi
iAtt = 1
iRel = 3
 aEnv	transegr	0,iAtt,6, 1,p3,4,0, iRel,-6,0

;ifrq mtof icps
print ifrq
kv1 = randi:k(krng1, kspeed1, 2) + 24
kv2 = randi:k(klfo, kspeed3, 2) + 2
kv3 = randi:k(krng2, kspeed2, 2) + krng2
kv6 = randi:k(krng3, kspeed3, 2) + krng3+5	



istiff = 2
iapert = 26
iblow = 11
inoise = 4
ilfo = 29
ilfodepth = 1
ibreath = 128
asig	STKSaxofony ifrq, 1, istiff, kv1, inoise, 100, iapert, 70, iblow, kv3, ilfodepth, kv6, ilfo, kv2
asig	=	asig * aEnv				;too loud
	outs asig, asig
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
