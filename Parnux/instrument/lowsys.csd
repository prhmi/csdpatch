/*
Deep-listening pad synthesizer after Pauline Oliveros.
Two waveguide physical-modeling voices.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2026
parhamizadyar.net
*/
<Cabbage>
form caption("LowSYS") size(550, 300), guiMode("queue") pluginId("lows") colour(10,20,35)
button bounds(14, 12, 30, 20) channel("kick") text("k", "k") colour:0(48, 66, 77, 255) colour:1(70, 90, 177, 255)
nslider bounds(28, 32, 79, 38) channel("metro1") range(1, 50, 3, 1, 0.1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("metro sec")
nslider bounds(114, 32, 79, 38) channel("frq1") range(1, 99, 50, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("Freq Hz")
nslider bounds(200, 32, 79, 38) channel("dur1") range(0.1, 5, 1.3, 1, 0.1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("dur")
nslider bounds(286, 32, 79, 38) channel("att1") range(0.01, 2, 0.1, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("att")
nslider bounds(372, 32, 79, 38) channel("ratio1") range(1, 8, 4, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("ratio")
nslider bounds(458, 32, 79, 38) channel("amp1") range(-90, 12, -12, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("ampd dB")

button bounds(14, 92, 30, 20) channel("bass") text("b", "b") colour:0(48, 66, 77, 255) colour:1(70, 90, 177, 255)
nslider bounds(28, 112, 79, 38) channel("metro2") range(1, 50, 3, 1, 0.1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("metro sec")
nslider bounds(114, 112, 79, 38) channel("frq2") range(1, 99, 50, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("Freq Hz")
nslider bounds(200, 112, 79, 38) channel("dur2") range(0.1, 5, 1.3, 1, 0.1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("dur")
nslider bounds(286, 112, 79, 38) channel("att2") range(0.1, 2, 0.5, 1, 0.1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("fade")
nslider bounds(372, 112, 79, 38) channel("lfo") range(0.01, 10, 10, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("lfo")
nslider bounds(458, 112, 79, 38) channel("amp2") range(-90, 12, -12, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("ampd dB")


image bounds(24, 172, 17, 17) channel("led") colour(60, 150, 200, 255)
image bounds(512, 172, 17, 17) channel("ledp") colour(80, 80, 90, 255)
signaldisplay bounds(22, 192, 232, 83), channel("display1") colour("white") displayType("waveform"), backgroundColour(30,40,50), zoom(-2), signalVariable("aShow1")
signaldisplay bounds(298, 192, 232, 83), channel("display2") colour("white") displayType("waveform"), backgroundColour(30,40,50), zoom(-2), signalVariable("aShow2")

button bounds(146, 168, 30, 20) channel("dc1") text("DC", "DC") colour:0(48, 66, 77, 255) colour:1(70, 90, 177, 255)
button bounds(378, 168, 30, 20) channel("dc2") text("DC", "DC") colour:0(48, 66, 77, 255) colour:1(70, 90, 177, 255)



vslider bounds(250, 179, 50, 98) channel("mastergain") range(1, 20, 1, 1, 1) popupText("0") valueTextBox(1)
combobox bounds(182, 166, 72, 23) channel("table1") colour(48, 52, 63, 255) text("shape", "sine", "tri", "saw", "square", "custom1", "custom2") value(1)
combobox bounds(298, 166, 72, 23) channel("table2") colour(48, 52, 63, 255) text("shape", "sine", "tri", "saw", "square", "custom1", "custom2") value(1)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
;nchnls = 2
0dbfs = 1

seed 0

giSine     ftgen   0, 0, 1024, 10, 1
giTri      ftgen   0, 0, 1024, 7, 0, 512, 1, 512, 0
giSaw      ftgen   0, 0, 1024, 7, 1, 512, 0, 0, 1, 512, 0
giSquare   ftgen   0, 0, 1024, 7, 1, 512, 1, 0, 0, 512, 0
;giSeq     ftgen   0, 0, 50, 7, 1, 10, 1, 0, 0.4, 10, 0.4, 0, 0.75, 10, 0.75, 0, 0, 10, 0, 0, 0.3, 10, 0.3

giSeq1    ftgen    0, 0,   2^4, -2, 1, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 1, 1, 1
giSeq2    ftgen    0, 0,   2^4, -2, 1, 0,0.2, 0.4, 0.1, 0.8, 0.1, 0.8, 0.1, 0.2, 0.1, 1


massign 0,0
massign 1,1


instr kickMachine
kTime cabbageGet "metro1"
kDur  cabbageGet "dur1"
if metro(1/kTime) == 1 then
   if active:k("bassSound") == 0 then
   schedulek "kickSound", 0, kDur
   endif
endif
endin



instr kickSound
iAtt cabbageGetValue "att1"
iAmp cabbageGetValue "amp1"
iRatio cabbageGetValue "ratio1"
iFrq cabbageGetValue "frq1"
iShape cabbageGetValue "table1"
aEnv transeg 0, iAtt, iRatio, ampdb(iAmp), p3-iAtt, iRatio*(-1), 0
 aEnvRnd randi 2, 5, 2
 kPchRnd randi 1/10, 4, 2
 kFrq = mtof(kPchRnd+ftom(iFrq))
 if iShape == 2 then
 iTable = giSine
 elseif iShape == 3 then
 iTable = giTri
 elseif iShape == 4 then
 iTable = giSaw
 elseif iShape == 5 then
 iTable = giSquare
  elseif iShape == 6 then
 iTable = giSeq1
  elseif iShape == 7 then
 iTable = giSeq2
 else
 iTable = giSine
 endif
aSound poscil aEnv*ampdb(aEnvRnd), kFrq,iTable
aOut clfilt aSound, 120, 0, 50
aRel linsegr 1, 0.1, 0
chnmix aOut*aRel, "snd1"
endin

instr bassMachine
kTime cabbageGet "metro2"
kDur  cabbageGet "dur2"
if metro(1/kTime) == 1 then
  if active:k("kickSound") == 0 then
  schedulek "bassSound", 0, kDur
  endif
endif
endin

instr bassSound
iAtt cabbageGetValue "att2"
iAmp cabbageGetValue "amp2"
iLFO cabbageGetValue "lfo"
iFrq cabbageGetValue "frq2"
iShape cabbageGetValue "table2"
;aEnv madsr iAtt, 0, 1, iAtt
 aEnvRnd randi 20/iLFO, 5, 2
 kPchRnd randi 1/iLFO, 4, 2
 kFrq = mtof(kPchRnd+ftom(iFrq))
 if iShape == 2 then
 iTable = giSine
 elseif iShape == 3 then
 iTable = giTri
 elseif iShape == 4 then
 iTable = giSaw
 elseif iShape == 5 then
 iTable = giSquare
  elseif iShape == 6 then
 iTable = giSeq1
  elseif iShape == 7 then
 iTable = giSeq2
 else
 iTable = giSine
 endif
aSound poscil ampdb(iAmp+aEnvRnd), kFrq,iTable
aClip clip aSound, 0, ampdb(iAmp)
aFilt clfilt aClip, 100, 0, 50
aOut linen aFilt, iAtt, p3, iAtt
aRel linsegr 1, 0.1, 0
chnmix aOut*aRel, "snd2"
endin

instr output
aIn1 chnget "snd1"
aIn2 chnget "snd2"
kDC1 cabbageGet "dc1"
kDC2 cabbageGet "dc2"
kGain cabbageGet "mastergain"
aGain interp kGain
akick clip aIn1*aGain, 0, 0.9
aBass clip aIn2*aGain, 0, 0.9
aDc1 dcblock2 akick
aDc2 dcblock2 aBass

if kDC1 == 0 then
aSound1 = akick
elseif kDC1 == 1 then
aSound1 = aDc1
endif

if kDC2 == 0 then
aSound2 = aBass
elseif kDC2 == 1 then
aSound2 = aDc2
endif

aOut = aSound1+aSound2
 aShow1 = aSound1
 display aShow1, 1/1000, 50
cabbageSet "display1", "skew", 2

 aShow2 = aSound2
 display aShow2, 1/100, 20
cabbageSet "display2", "skew", 2

out aOut,aOut
chnclear "snd1", "snd2"
endin


instr widget
kStartK cabbageGet "kick"
kStartB cabbageGet "bass"
if kStartK == 1 && changed(kStartK) == 1 then
schedulek "kickMachine", 0, 99999
elseif kStartK == 0 && changed(kStartK) == 1 then
turnoff2 "kickMachine", 0, 1
turnoff2 "kickSound", 0, 1
endif

if kStartB == 1 && changed(kStartB) == 1 then
schedulek "bassMachine", 0, 99999
elseif kStartB == 0 && changed(kStartB) == 1 then
turnoff2 "bassMachine", 0, 1
turnoff2 "bassSound", 0, 1
endif



endin


</CsInstruments>
<CsScore>
i "widget" 0 99999
i "output" 0 99999
</CsScore>
</CsoundSynthesizer>








