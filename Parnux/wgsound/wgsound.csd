/*
parnux VSTi package v6.0
written by parham izadyar | 2020-2025 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
;form caption("mags") size(350, 135), pluginId("mags") style("legacy") colour(50,0,0)
form caption("wg sounds") size(400,200), pluginId("wgsn") colour( 30, 30, 30) guiMode("queue")
;image bounds(0, 0, 350, 200)  file("mags.jpg")
rslider  bounds(8, 76, 60, 60)    text("slider1")  channel("slider1") range(0, 1, 0.2, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(72, 76, 60, 60)   text("slider2")  channel("slider2") range(0, 1, 0.1, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(138, 76, 60, 60)  text("slider3")  channel("slider3") range(0, 1, 0.7, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(204, 76, 60, 60)  text("slider4")  channel("slider4") range(0, 1, 0.1, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(268, 76, 60, 60)  text("slider5")  channel("slider5") range(0, 1, 0.1, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
rslider  bounds(334, 76, 60, 60)  text("Gain")     channel("slider6") range(0, 1, 0.3, 1, 0.01) colour(192, 192, 192, 255), trackerColour(164, 164, 164, 255) trackerInsideRadius(0.72) textColour(173, 173, 173, 255) outlineColour(0, 0, 0, 255)
label bounds(12, 12, 116, 30) channel("data") fontColour(178, 178, 178, 255) colour(58, 58, 58, 255) text("")
hmeter bounds(10, 50, 168, 15) channel("meter")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(164, 164, 164, 255)

keyboard , bounds(2, 150, 398, 50)
;keyboard pos(10, 135), size(340, 50)
label bounds(144, 20, 247, 15) channel("label10008") align("left") text("brass-1 | bow-3 | woodwinds-5")
combobox bounds(292, 42, 97, 23) channel("modulmod") colour(142, 142, 142, 255) value(2) text("modul off", "modul on") fontColour(26, 26, 26, 255)
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
massign 0,0
massign 1,1
massign 3,2
massign 5,3
;massign 3,3
;massign 4,4

opcode swip, i,iii
iValue, iMin, iMax xin
iOut = (iMax - (iValue+iMin))+ iMin
xout iOut
endop
opcode scalei, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut limit (iValue*iDiff)+iMin, iMin, iMax
xout iOut
endop 

opcode jspstep, k, kkk
kAmp, kSpdMin, kSpdMax xin
kTimeRnd = (kSpdMin+kSpdMax)/2
kTime randomh kSpdMin,kSpdMax,kTimeRnd
kOut randomh -kAmp, kAmp, kTime
xout kOut
endop
giSine ftgen 0, 0, 1024, 10, 1

instr 1
Scolor = "colour(204, 198, 173, 255), trackerColour(255, 231, 0, 255) trackerInsideRadius(0.72) textColour(207, 199, 153, 255) outlineColour(0, 0, 0, 255)"
Sdata     sprintf "fontColour(255, 231, 0, 255) text(%s)", "Brass"
cabbageSet  "data",Sdata
cabbageSet 1,"slider1",Scolor
cabbageSet 1,"slider2",Scolor
cabbageSet 1,"slider3",Scolor
cabbageSet 1,"slider4",Scolor
cabbageSet 1,"slider5",Scolor
cabbageSet 1,"slider6",Scolor
Sname1     sprintf "text(%s)", "vibf"
Sname2     sprintf "text(%s)", "viba"
Sname3     sprintf "text(%s)", "tense"
Sname4     sprintf "text(%s)", "pressure"
Sname5     sprintf "text(%s)", "speed"
cabbageSet  "slider1",Sname1
cabbageSet  "slider2",Sname2
cabbageSet  "slider3",Sname3
cabbageSet  "slider4",Sname4
cabbageSet  "slider5",Sname5



 iVibF   cabbageGetValue "slider1"
 iVibA   cabbageGetValue "slider2"
 iTens   cabbageGetValue "slider3"
 iPres   cabbageGetValue "slider4"
 iSpeed  cabbageGetValue "slider5"
 iGain   cabbageGetValue "slider6"
 iMod    cabbageGetValue "modulmod"
 iVibF   scalei iVibF, 0, 30
 iVibA   scalei iVibA, 0.01, 1
 iTens   scalei iTens, 0.01, 1
 iPres   scalei iPres, 0.1, 0.5
 iSpeed  scalei iSpeed, 0, 12
 iGain   scalei iGain, 0, 3


 iMidi		notnum
 iWave     ftgenonce 1,0,2048,10  ,  1, .4,0,0,10
kFrq init 80
ktens init 0.2
kvibf init 0.6
kvamp init 0.8

 iFrq mtof iMidi ;2000 ;300- 1600
kFrq = iFrq
 iAtt = 0.1
 iRel = 0.1
 aEnv linsegr 0, iAtt,1,iRel, 0
 kPrs = jspline:k(iPres,iSpeed,iSpeed*1.6)
ktens = iTens+(kPrs*(iMod-1))
iatt = 0.01
kvibf = rspline:k(0,iVibF,iSpeed,iSpeed*1.1)*(iMod-1)
kvamp = iVibA

 aSound wgbrass 0.4, kFrq, ktens, iatt, kvibf, kvamp, iWave
 aFilt clfilt aSound, 300, 1, 10
 aOut dcblock2 aFilt*aEnv*iGain
 outall aOut
  kMax max_k aOut, metro(20), 1
 cabbageSetValue "meter", kMax, metro(20)
endin



instr 2
Scolor = "colour(204, 187, 173, 255), trackerColour(255, 115, 0, 255) trackerInsideRadius(0.72) textColour(207, 184, 153, 255) outlineColour(0, 0, 0, 255)"
Sdata     sprintf "fontColour(255, 115, 0, 255) text(%s)", "Bow"
cabbageSet  "data",Sdata
cabbageSet 1,"slider1",Scolor
cabbageSet 1,"slider2",Scolor
cabbageSet 1,"slider3",Scolor
cabbageSet 1,"slider4",Scolor
cabbageSet 1,"slider5",Scolor
cabbageSet 1,"slider6",Scolor
Sname1     sprintf "text(%s)", "env"
Sname2     sprintf "text(%s)", "vibr"
Sname3     sprintf "text(%s)", "position"
Sname4     sprintf "text(%s)", "pressure"
Sname5     sprintf "text(%s)", "speed"
cabbageSet  "slider1",Sname1
cabbageSet  "slider2",Sname2
cabbageSet  "slider3",Sname3
cabbageSet  "slider4",Sname4
cabbageSet  "slider5",Sname5

 iEnv    cabbageGetValue "slider1"
 iVibA   cabbageGetValue "slider2"
 iPos    cabbageGetValue "slider3"
 iPres   cabbageGetValue "slider4"
 iSpeed  cabbageGetValue "slider5"
 iGain   cabbageGetValue "slider6"
 iMod    cabbageGetValue "modulmod"
 iEnv    scalei iEnv, 0.1, 2
 iVibA   scalei iVibA, 0.01, 1
 iPos    scalei iPos, 0.01, 1
 iPres   scalei iPres, 0.1, 1
 iSpeed  scalei iSpeed, 0, 12
 iGain   scalei iGain, 0, 3
 aEnv linsegr 0, iEnv,1,iEnv, 0
 kbowpres init 0.44
 kPrs rspline 0.01, iPres, iSpeed, iSpeed*1.6
kpos rspline 0, iPos,iSpeed, iSpeed*1.6; 0.7
if iMod == 1 then
kbowpres = iPres
kbowpos = iPos
elseif iMod == 2 then
kbowpres = kPrs
kbowpos = kPrs
endif
iMidi notnum
iFrq mtof iMidi

aBow  wgbowedbar  0.01, iFrq, kbowpos, kbowpres, 0.95, 0.97, 0, 0, 20
aOut = aBow*aEnv*iGain*0.05
outall aOut
  kMax max_k aOut, metro(20), 1
 cabbageSetValue "meter", kMax, metro(20)
endin


instr 3
Scolor = "colour(172, 188, 165, 255), trackerColour(5, 255, 0, 255) trackerInsideRadius(0.72) textColour(166, 212, 171, 255) outlineColour(0, 0, 0, 255)"
Sdata     sprintf "fontColour(5, 255, 0, 255) text(%s)", "w-wind"
cabbageSet  "data",Sdata
cabbageSet 1,"slider1",Scolor
cabbageSet 1,"slider2",Scolor
cabbageSet 1,"slider3",Scolor
cabbageSet 1,"slider4",Scolor
cabbageSet 1,"slider5",Scolor
cabbageSet 1,"slider6",Scolor
Sname1     sprintf "text(%s)", "F/C"
Sname2     sprintf "text(%s)", "vibr"
Sname3     sprintf "text(%s)", "Jet"
Sname4     sprintf "text(%s)", "stf"
Sname5     sprintf "text(%s)", "speed"
cabbageSet  "slider1",Sname1
cabbageSet  "slider2",Sname2
cabbageSet  "slider3",Sname3
cabbageSet  "slider4",Sname4
cabbageSet  "slider5",Sname5


 iMix    cabbageGetValue "slider1"
 iVib    cabbageGetValue "slider2"
 iJet    cabbageGetValue "slider3"
 iStf    cabbageGetValue "slider4"
 iSpeed  cabbageGetValue "slider5"
 iGain   cabbageGetValue "slider6"
 iMod    cabbageGetValue "modulmod"
 iVib    scalei iVib, 0, 20
 iJet    scalei iJet, 0.01, 1
 iStf    scalei iStf, -1, 1
 iSpeed  scalei iSpeed, 0, 12
 iGain   scalei iGain, 0, 3

kFrq init 400
kJet init 0.1
iWave     ftgenonce 1,0,2048,10  ,  1, .4,0,0,10
iMidi notnum
iFrq mtof iMidi
kLFOfrq jspline iVib, iSpeed, iSpeed*1.6
kJetLFO jspstep  0.1,0.6, iSpeed
kJet = iJet+(kJetLFO*(iMod-1))
iAir  scalei iJet, 2, 0.1
kAir = jspline:k(iAir, iSpeed*1.3, iSpeed*2)*(iMod-1)
kFrq = iFrq+(kLFOfrq*(iMod-1))
iatt = 0.1
idetk = 0.1
iEnv = 0.5
 aEnv linsegr 0, iEnv,1,iEnv, 0
aFlt wgflute 0.5, kFrq, kJet, iatt, idetk, 0, 0, 0, iWave, 40 ;giMyset1
aClr wgclar 0.5, kFrq*0.9, iStf, iatt, idetk, kAir, 0, 0, iWave, 40
aSound ntrpol aFlt,aClr,iMix
aOut = aSound*aEnv*iGain
outall aOut
  kMax max_k aOut, metro(20), 1
 cabbageSetValue "meter", kMax, metro(20)
endin


</CsInstruments>
<CsScore>

;i1 0 999
;i "widget" 0 2
</CsScore>
</CsoundSynthesizer>
