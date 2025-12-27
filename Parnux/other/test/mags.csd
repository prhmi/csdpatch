<Cabbage>
form caption("mags") size(350, 135), pluginId("mags") style("legacy")
image bounds(0, 0, 350, 200)  file("mags.jpg")
rslider  bounds(10, 10, 60, 60),  text("FrqRng"),  channel("frng"),  range(1, 30, 2, 1, 1),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(70, 10, 60, 60),  text("Vibrato"),  channel("vibr"),  range(.3, 10, 3, 1, 0.5),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(150, 10, 60, 60),  text("TnsRng"),  channel("trng"),  range(.01, .2, .15, 1, 0.001),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(210, 10, 60, 60),  text("Position"),  channel("pos"),  range(0.1, 0.5, 0.2, 1, 0.001),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(270, 10, 60, 60),  text("Speed"),  channel("spd"),  range(1, 32, 23, 1, 0.5),colour(245, 181, 115, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(236, 255, 0, 255) outlineColour(0, 0, 0, 255)

keyboard , bounds(1, 85, 349, 50)
;keyboard pos(10, 135), size(340, 50)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
nchnls = 2
0dbfs  = 1

seed 0

opcode swip, i,iii
iValue, iMin, iMax xin
iOut = (iMax - (iValue+iMin))+ iMin
xout iOut
endop

instr 1
 iMidi		cpsmidi
 ivelin veloc 0, 127
 iRng chnget "frng"
 iWave     ftgenonce 1,0,2048,10  ,  1, .4,0,0,10
 iAtt = 0.5
 iRel = 3
 iAmp = .3
 iSpeed chnget "spd"
 aEnv	transegr	0,iAtt,4, iAmp,p3,4,iAmp,p3,4,iAmp, iRel,-6,0
 iFrq = iMidi ;2000 ;300- 1600
 ivel = (swip:i( ivelin, 0, 1)/127)+1
 kfrq = jspline:k(iRng, 1,iSpeed)+iFrq
 iTens chnget "trng"
 iPos chnget "pos"
 ktens = jspline:k( iTens, .9, iSpeed) +iTens+iPos
 iatt = 3
 iVib chnget "vibr"
 kvibf = jspline:k(iVib, 3,12)+iVib+0.01
 iVamp = (iFrq-300)/(1300*ivel)/5
 if iVamp < 0.01 then
 iVamp = 0.01
 endif
 if iVamp > 2 then
 iVamp = 2
 endif
  kVamp = jspline:k( iVamp, .8, iSpeed*0.7) +iVamp+(iPos-0.15)


 print iVamp
 print iFrq
 ;printk2 kVamp
 aSound wgbrass iAmp, kfrq, ktens, iatt, kvibf, kVamp , iWave
 aSound = aSound*aEnv
 aRvrbL, aRvrbR reverbsc aSound, aSound, 0.56, 600
 aoutL clfilt aRvrbL, 200, 1,10
 aoutR clfilt aRvrbR, 200, 1,10 
 outs aoutL,aoutR
endin


</CsInstruments>
<CsScore>

;i1 0 999

</CsScore>
</CsoundSynthesizer>
