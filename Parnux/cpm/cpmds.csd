
<Cabbage>
form caption("CPM-DS2")    size(965, 520)   guiMode("queue")  colour(20, 20, 20) pluginId("cpmd") ; style("legacy")
;;LFO
image bounds(30, 25, 215, 469) channel("lfoback") colour(20, 20, 20, 255) outlineColour(200, 200, 200, 255) outlineThickness(2) corners(5)
label bounds(84, 30, 98, 16) channel("label10002") text("ULTRA LFO")
label bounds(43, 151, 81, 14) channel("lfolabel1") text("WAVE I")
label bounds(147, 151, 81, 14) channel("lfolabel2") text("WAVE II")
label bounds(43, 95, 81, 12) channel("lfolabel3") text("In Rate I")
label bounds(147, 95, 81, 12) channel("lfolabel4") text("In Rate II")
combobox bounds(50, 124, 69, 23) channel("lfoshape1") colour(70, 69, 69, 255) text("off", "sine", "triangle", "square", "saw", "wave", "random", "seq") value(1)
combobox bounds(154, 124, 69, 23) channel("lfoshape2") colour(70, 69, 69, 255) text("off", "sine", "triangle", "square", "saw", "wave", "random", "seq") value(1)
combobox bounds(48, 68, 75, 23) channel("inlfo1") colour(70, 69, 69, 255) text("off", "drone I", "drone II", "MIDI-CC", "notnum", "wave I", "wave II", "aux") value(1)
combobox bounds(150, 68, 75, 23) channel("inlfo2") colour(70, 69, 69, 255) text("off", "drone I", "drone II", "MIDI-CC", "notnum", "wave I", "wave II", "aux") value(1)
image bounds(102, 212, 75, 3) channel("lfoimg1") colour(166, 166, 166, 255)
image bounds(72, 206, 15, 15) channel("rateled1") colour(50, 50, 50)
image bounds(188, 206, 15, 15) channel("rateled2")  colour(50, 50, 50)
rslider bounds(46, 242, 70, 70) channel("lforate1") range(0.05, 20, 1, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("RATE I (hz)")
rslider bounds(156, 242, 70, 70) channel("lforate2") range(0.05, 20, 1, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("RATE II (hz)")
image bounds(43, 337, 190, 3) channel("image10020") colour(166, 166, 166, 255)
label bounds(92, 348, 93, 14) channel("label10021") text("destination")
combobox bounds(52, 394, 69, 23)  channel("lfo1dst1") colour(70, 69, 69, 255) text("OSC I", "OSC II") value(1)
combobox bounds(52, 442, 69, 23)  channel("lfo1dst2") colour(70, 69, 69, 255) text("FILT I", "FILT II") value(1)
combobox bounds(154, 394, 69, 23) channel("lfo2dst1") colour(70, 69, 69, 255) text("OSC I", "OSC II") value(2)
combobox bounds(154, 442, 69, 23) channel("lfo2dst2") colour(70, 69, 69, 255) text("FILT I", "FILT II") value(2)
;;drone
image bounds(262, 25, 215, 469) channel("dron1back") colour(20, 20, 20, 255) outlineColour(200, 200, 200, 255) outlineThickness(2) corners(5)
checkbox bounds(448, 32, 20, 20) channel("droneonoff1") colour:0(108, 106, 106, 255)
combobox bounds(274, 68, 60, 23) channel("inpch1") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
combobox bounds(340, 68, 60, 23) channel("inpwm1") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
combobox bounds(406, 68, 60, 23) channel("incut1") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
label bounds(267, 95, 68, 12) channel("drn1inlabel1") text("In Pitch")
label bounds(335, 95, 68, 12) channel("drn1inlabel2") text("In PWM")
label bounds(399, 95, 68, 12) channel("drn1inlabel3") text("In cutoff")
label bounds(318, 30, 98, 16) channel("dron1kabel1") text("DRONE I")
label bounds(294, 126, 155, 16) channel("dron1kabel2") text("3340 OSCILATOR I")
combobox bounds(346, 154, 48, 20) channel("drn1sub") colour(70, 69, 69, 255) text("0", "-1", "-2") value(1)
label bounds(351, 181, 39, 14) channel("dron1label4") text("SUB")
rslider bounds(410, 152, 55, 55) channel("sub1mix") range(0, 1, 0.5, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("sub mix")
rslider bounds(284, 242, 70, 70) channel("dron1wave") range(0, 1, 0.15, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("x-wave")
combobox bounds(340, 204, 60, 20) channel("drn1b1") colour(70, 69, 69, 255) text("shape", "pitch") value(2)
rslider bounds(276, 152, 55, 55) channel("dronlfo1") range(0, 150, 0, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("lfo depth")
rslider bounds(388, 242, 70, 70) channel("dronepitch1") range(0.05, 20, 10, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("PITCH")
image bounds(275, 337, 190, 3) channel("imgdrone1_1") colour(166, 166, 166, 255)
label bounds(324, 348, 93, 14) channel("dron1label5") text("3320 FILTER")
combobox bounds(342, 368, 56, 27) channel("filtmod1") colour(70, 69, 69, 255) text("LP", "HP") value(1)
rslider bounds(278, 370, 50, 50) channel("res1") range(1, 100, 5, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("RES")
rslider bounds(414, 370, 50, 50) channel("dronlfof1") range(0, 400, 2, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("LFO dep")
rslider bounds(294, 426, 60, 60) channel("cut1") range(200, 4000, 800, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("CUT OFF")
rslider bounds(382, 426, 60, 60) channel("gain1") range(-50, 12, -25, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("VOLUME")
;;dron2
image bounds(494, 25, 215, 469) channel("dron2back") colour(20, 20, 20, 255) outlineColour(200, 200, 200, 255) outlineThickness(2) corners(5)
checkbox bounds(680, 32, 20, 20) channel("droneonoff2") colour:0(108, 106, 106, 255)
combobox bounds(506, 68, 60, 23) channel("inpch2") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
combobox bounds(572, 68, 60, 23) channel("inpwm2") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
combobox bounds(638, 68, 60, 23) channel("incut2") colour(70, 69, 69, 255) text("off", "drnI", "drnII", "M-CC", "Note", "wI", "wII", "aux") value(1)
label bounds(499, 95, 68, 12) channel("drn2inlabel1") text("In Pitch")
label bounds(567, 95, 68, 12) channel("drn2inlabel2") text("In PWM")
label bounds(631, 95, 68, 12) channel("drn2inlabel3") text("In cutoff")
label bounds(550, 30, 98, 16) channel("dron2kabel1") text("DRONE II")
label bounds(526, 126, 155, 16) channel("dron2kabel2") text("3340 OSCILATOR II")
combobox bounds(578, 154, 48, 20) channel("drn2sub") colour(70, 69, 69, 255) text("0", "-1", "-2") value(1)
label bounds(583, 181, 39, 14) channel("dron2label4") text("SUB")
rslider bounds(642, 152, 55, 55) channel("sub2mix") range(0, 1, 0.5, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("sub mix")
rslider bounds(516, 242, 70, 70) channel("dron2wave") range(0, 1, 0.15, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("x-wave")
combobox bounds(572, 204, 60, 20) channel("drn2b1") colour(70, 69, 69, 255) text("shape", "pitch") value(1)
rslider bounds(508, 152, 55, 55) channel("dronlfo2") range(0, 150, 2, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("lfo depth")
rslider bounds(620, 242, 70, 70) channel("dronepitch2") range(0.05, 20, 10, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("PITCH")
image bounds(507, 337, 190, 3) channel("imgdrone2_1") colour(166, 166, 166, 255)
label bounds(556, 348, 93, 14) channel("dron2label5") text("3320 FILTER")
combobox bounds(574, 368, 56, 27) channel("filtmod2") colour(70, 69, 69, 255) text("LP", "HP") value(1)
rslider bounds(510, 370, 50, 50) channel("res2") range(1, 100, 5, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("RES")
rslider bounds(646, 370, 50, 50) channel("dronlfof2") range(0, 400, 2, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("LFO dep")
rslider bounds(526, 426, 60, 60) channel("cut2") range(200, 4000, 800, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("CUT OFF")
rslider bounds(614, 426, 60, 60) channel("gain2") range(-50, 12, -25, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("VOLUME")
;;mixer
label bounds(720, 20, 232, 50) channel("mixerlabel1") text("CPM DS-2")
image bounds(743, 83, 190, 3) channel("mixerimg1") colour(166, 166, 166, 255)
label bounds(730, 98, 68, 18) channel("label10043") text("mixer")
combobox bounds(878, 198, 72, 23) channel("mixdep") colour(70, 69, 69, 255) text("wave I", "wave II") value(1)
combobox bounds(878, 94, 72, 23) channel("fbmod") colour(70, 69, 69, 255) text("off", "in/out", "DroneI", "DroneII") value(1)
rslider bounds(728, 124, 50, 50) channel("mainfb") range(0, 1, 0.1, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("FB")
rslider bounds(814, 124, 50, 50) channel("fbmix") range(0, 1, 0.5, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("mix")
rslider bounds(896, 124, 50, 50) channel("maingain") range(-20, 20, 0, 1, 1) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("master")
rslider bounds(720, 230, 50, 50) channel("dlyt")  range(0.1, 4, 0.7, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("time")
rslider bounds(782, 230, 50, 50) channel("fb")    range(0, 0.95, 0.3, 1, 0.01) outlineColour(60, 60, 60, 255) text("rep") trackerColour(243, 243, 243, 255)
rslider bounds(840, 230, 50, 50) channel("dldep") range(0, 0.3, 0, 1, 0.001) outlineColour(60, 60, 60, 255) text("lfo dep") trackerColour(243, 243, 243, 255)
rslider bounds(900, 230, 50, 50) channel("dlmix") range(0, 1, 0, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("D mix")
rslider bounds(728, 340, 50, 50) channel("rsize") range(0.1, 0.9, 0.3, 1, 0.01) outlineColour(60, 60, 60, 255) text("size") trackerColour(243, 243, 243, 255)
combobox bounds(804, 350, 64, 23) channel("mixmons") colour(70, 69, 69, 255) text("mono", "stereo") value(1)
rslider bounds(896, 340, 50, 50) channel("rmix")  range(0, 1, 0, 1, 0.01) trackerColour(243, 243, 243, 255) outlineColour(60, 60, 60, 255) text("R mix")
image bounds(743, 297, 190, 3) channel("mixerimg2") colour(166, 166, 166, 255)
label bounds(730, 192, 68, 18) channel("mixerlabel2") text("Delay")
label bounds(730, 306, 68, 18) channel("mixerlabel3") text("Reverb")
image bounds(743, 183, 190, 3) channel("mixerimg3") colour(166, 166, 166, 255)
signaldisplay bounds(736, 400, 211, 104), channel("display") colour("white") displayType("waveform"), backgroundColour(30,30,30), zoom(-2), signalVariable("aShow")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


seed 0
massign 0, 0
gkLFO1  init 0
gkLFO2  init 0
gaLFO1  init 0
gaLFO2  init 0
gaDrone1 init 0
gaDrone2 init 0
giSeq      ftgen   0, 0, 50, 7, 1, 10, 1, 0, -0.4, 10, -0.4, 0, 0.5, 10, 0.5, 0, -1, 10, -1, 0, -0.3, 10, -0.3
giSquare   ftgen   0, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1
giSaw      ftgen   0, 0, 1024, 7, 1, 512, -1, 0, 1, 512, -1
giTriangle ftgen   0, 0, 1024, 7, -1, 512, 1, 512, -1
giSine     ftgen   0, 0, 1024, 10, 1

opcode myDelay, a, akkk
aIn, kTime, kFb, kMix xin
 abuf     delayr   5
 aTime    interp   kTime
 aDelay   deltapi  aTime
 delayw    aIn + (aDelay*kFb)
 aOut   ntrpol  aIn,aDelay,  kMix
xout aOut
endop

opcode myRvrb, aa, akk
aIn, kSize, kMix xin
 aRvrbL,aRvrbR   reverbsc aIn,aIn, kSize, 8000, sr, 0.5, 1
 aOutL  ntrpol aIn,aRvrbL, kMix
 aOutR  ntrpol aIn,aRvrbR, kMix
 xout aOutL, aOutR
endop

opcode myFbk, k, a
aIn xin
  adRnd1     rspline 0.08, 0.1, 2, 4
 adRnd2     rspline 0.01, 0.5, 2, 4
 aBuffer    delayr    5
 ad1        deltapi   adRnd1
 ad2        deltapi   adRnd2
 a3 init 0
 krms      rms       a3
           delayw    aIn+(exp(-krms)*a3)
 a3        reson     (ad1+ad2)*-1, 200, 400, 1
kOut abs k(a3)
 xout kOut
endop

opcode myFba, a, akk
aIn, kFb, kMix xin
kSpeedMin scale kFb, 0.02, 2, 0, 1
kSpeedMax scale kFb, 0.04, 3, 0, 1
kRngMin scale kFb, 300, 3000, 0, 1
kRngMax scale kFb, 400, 7000, 0, 1
adRnd1     rspline 0.01, 0.2, kSpeedMin, kSpeedMax
adRnd2     rspline 0.02, 0.08, kSpeedMin, kSpeedMax
 aBuffer    delayr    5
 ad1        deltapi   adRnd1
 ad2        deltapi   adRnd2
 a3 init 0
 krms      rms       a3
           delayw    (aIn/50)+(exp(-krms)*a3)
 a3        reson     -(ad1+ad2), kRngMin, kRngMax, 1
    aDC dcblock2 a3
    aLimit clip aDC, 1, 0.8
    aFilter clfilt aLimit, 90, 1, 10
    aFilter clfilt aFilter, 7000, 0, 10
    aOut ntrpol aIn, aFilter, kMix
 xout aOut
endop

opcode myWave, k, a
aIn xin
kFrq, k1 ptrack aIn, 2048, 10
if kFrq <= 40 then
kFrq = 40
elseif kFrq >= 350 then
kFrq = 350
endif
kScale scale kFrq, 100,1, 350 , 30
kOut = kScale/10
 xout kOut
endop


instr lfo1
kRateIn  cabbageGet "lforate1"
kInLFO   cabbageGet "inlfo1"
aDrone1 chnget "drn1"
aDrone2 chnget "drn2"
kActiveDron1 active "drone1"
kActiveDron2 active "drone2"
aAUX inch 1
;aAUX diskin "fox.wav", 1, 0, 1
  kCC init 1
  kNote init 1
kstatus, kchan, kdata1, kdata2 midiin 
  if kstatus == 176 && kchan == 1 then
  kCC scale kdata2, 10, 0.1, 127, 0
  elseif kstatus == 144 && kchan == 1  then
  kNote scale kdata1, 4, 0.1, 72, 48
  endif
  if     kInLFO == 1 then
  kInput = 1
  elseif kInLFO == 2 && kActiveDron1 != 0 then
  kInput myWave aDrone1
  elseif kInLFO == 3 && kActiveDron2 != 0then
  kInput myWave aDrone2
  elseif kInLFO == 4 then
  kInput = kCC
  elseif kInLFO == 5 then
  kInput = kNote
  elseif kInLFO == 6 then
  kInput myFbk gaLFO1
  elseif kInLFO == 7 then
  kInput myFbk gaLFO2
  elseif kInLFO == 8 then
  kInput myWave aAUX
  else
  kInput = 1
  endif
kRate = kRateIn*kInput
;  printk 1/5, kRate
iShapeIn = p4-2
  if iShapeIn < 3 then
  iShape = iShapeIn
  kLFO lfo 1, kRate, iShape
  aLFO lfo 1, kRate, iShape
  elseif iShapeIn == 3 then
  kLFO1 lfo 1, kRate, 5
  kLFO = (kLFO1*2)-1
  aLFO1 lfo 1, kRate, 5
  aLFO = (aLFO1*2)-1
  elseif iShapeIn == 4 then
  kLFO randi 1,kRate
  aLFO randi 1,kRate
  elseif iShapeIn == 5 then
  kLFO randomh -1,1,kRate, 2
  aLFO randomh -1,1,kRate, 2
  elseif iShapeIn == 6 then
  kLFO poscil 1,kRate, giSeq
  aLFO poscil 1,kRate, giSeq
  endif
kEnv linsegr 0, 0.1, 1, 0.1, 0
aEnv linsegr 0, 0.1, 1, 0.1, 0
gkLFO1 = kLFO*kEnv
gaLFO1 = aLFO*aEnv
kColor = (kLFO+1)/2
Scolor sprintfk "colour(%d, %d, %d)", (kColor*200)+50, (kColor+50), (kColor+50)
cabbageSet 1,"rateled1",Scolor
chnclear "drn1", "drn2"
  if release() == 1 then
  cabbageSet 1, "rateled1","colour(50, 50, 50)"
  endif
endin


instr lfo2
kRateIn  cabbageGet "lforate2"
kInLFO   cabbageGet "inlfo2"
aDrone1 chnget "drn1"
aDrone2 chnget "drn2"
kActiveDron1 active "drone1"
kActiveDron2 active "drone2"
aAUX inch 1
;aAUX diskin "fox.wav", 1, 0, 1
  kCC init 1
  kNote init 1
kstatus, kchan, kdata1, kdata2 midiin 
  if kstatus == 176 && kchan == 2 then
  kCC scale kdata2, 10, 0.1, 127, 0
  elseif kstatus == 144 && kchan == 2 then
  kNote scale kdata1, 4, 0.1, 72, 48
  endif
  if     kInLFO == 1 then
  kInput = 1
  elseif kInLFO == 2 && kActiveDron1 != 0 then
  kInput myWave aDrone1
  elseif kInLFO == 3 && kActiveDron2 != 0then
  kInput myWave aDrone2
  elseif kInLFO == 4 then
  kInput = kCC
  elseif kInLFO == 5 then
  kInput = kNote
  elseif kInLFO == 6 then
  kInput myFbk gaLFO1
  elseif kInLFO == 7 then
  kInput myFbk gaLFO2
  elseif kInLFO == 8 then
  kInput myWave aAUX
  else
  kInput = 1
  endif
kRate = kRateIn*kInput
iShapeIn = p4-2
  if iShapeIn < 2 then
  iShape = iShapeIn
  kLFO lfo 1, kRate, iShape
  aLFO lfo 1, kRate, iShape
  elseif iShapeIn == 2 then
  kLFO lfo 1, kRate, 2
  aLFO lfo 1, kRate, 2
  elseif iShapeIn == 3 then
  kLFO1 lfo 1, kRate, 5
  aLFO1 lfo 1, kRate, 5
  kLFO = (kLFO1*2)-1
  aLFO = (kLFO1*2)-1
  elseif iShapeIn == 4 then
  kLFO randi 1,kRate
  aLFO randi 1,kRate
  elseif iShapeIn == 5 then
  kLFO randomh -1,1,kRate, 2
  aLFO randomh -1,1,kRate, 2
  elseif iShapeIn == 6 then
  kLFO poscil 1,kRate, giSeq
  aLFO poscil 1,kRate, giSeq
  endif
kEnv linsegr 0, 0.1, 1, 0.1, 0
aEnv linsegr 0, 0.1, 1, 0.1, 0
 gkLFO2 = kLFO*kEnv
 gaLFO2 = aLFO*aEnv
kColor = (kLFO+1)/2
Scolor sprintfk "colour(%d, %d, %d)", (kColor*200)+50, (kColor+50), (kColor+50)
cabbageSet 1,"rateled2",Scolor
  if release() == 1 then
  cabbageSet 1, "rateled2","colour(50, 50, 50)"
  endif
endin

instr drone1
iAmp = 0.9
kFrqIn     cabbageGet "dronepitch1" ;100
kShapeIn   cabbageGet "dron1mix"
kLFOdep    cabbageGet "dronlfo1"
kLFOmod    cabbageGet "drn1b1"
kMix       cabbageGet "dron1wave"
kLFOFltdep cabbageGet "dronlfof1"
kFiltIn    cabbageGet "cut1"
kSub       cabbageGet "drn1sub"
kSubMix    cabbageGet "sub1mix"
kFiltMod   cabbageGet "filtmod1"
kRes       cabbageGet "res1"
kMod       cabbageGet "filtmod1"
kGaindB    cabbageGet "gain1"
kLFO1OSC   cabbageGet "lfo1dst1"
kLFO1Flt   cabbageGet "lfo1dst2"
kLFO2OSC   cabbageGet "lfo2dst1"
kLFO2Flt   cabbageGet "lfo2dst2"
kLFO1OnOff cabbageGet "lfoshape1"
kLFO2OnOff cabbageGet "lfoshape2"
kPchIn     cabbageGet "inpch1"
kPWMIn     cabbageGet "inpwm1"
kCutIn     cabbageGet "incut1"
kActiveDrone2 active "drone2"
  if     kLFO1OSC == 1 && kLFO2OSC == 1 then
      if     kLFO1OnOff == 1 then
      kLFOin    = gkLFO2
      aLFOin    = gaLFO2
      elseif kLFO2OnOff == 1 then
      kLFOin    = gkLFO1
      aLFOin    = gaLFO1
      else
      kLFOin    = gkLFO1*gkLFO2
      aLFOin    = gaLFO1*gaLFO2
      endif
  elseif kLFO1OSC == 1 && kLFO2OSC == 2 then
  kLFOin    = gkLFO1
  aLFOin    = gaLFO1
  elseif kLFO1OSC == 2 && kLFO2OSC == 1 then
  kLFOin    = gkLFO2
  aLFOin    = gaLFO2
  elseif kLFO1OSC == 2 && kLFO2OSC == 2 then
  kLFOin  = 0
  aLFOin  interp k(0)
  else
  kLFOin  = 0
  aLFOin  interp k(0)
  endif
  if kLFOmod == 1 && kLFOin != 0 then
  kLFOshape = (kLFOin+1)/2*(kLFOdep/150)
  aLFOFrq   interp k(0)
  elseif kLFOmod == 2 && kLFOin != 0 then
  kLFOshape = 0
  aLFOFrq   = aLFOin*kLFOdep
  endif
  if     kLFO1Flt == 1 && kLFO2Flt == 1 then
      if     kLFO1OnOff == 1 then
      kLFOFilt    = gkLFO2
      elseif kLFO2OnOff == 1 then
      kLFOFilt    = gkLFO1
      else
      kLFOFilt    = gkLFO1*gkLFO2
      endif
  elseif kLFO1Flt == 1 && kLFO2Flt == 2 then
  kLFOFilt    = gkLFO1
  elseif kLFO1Flt == 2 && kLFO2Flt == 1 then
  kLFOFilt    = gkLFO2
  elseif kLFO1Flt == 2 && kLFO2Flt == 2 then
  kLFOFilt    = 0
  else
  kLFOFilt    = 0
  endif
kFilt = kFiltIn+(kLFOFilt*kLFOFltdep)
aFilt init 0
aEnv linsegr 0, 0.2, 1, 0.2, 0
aDrone2 = gaDrone2*aEnv
aAUX inch 1
;aAUX diskin "fox.wav", 1, 0, 1
  kCC init 1
  kNote init 1000
kstatus, kchan, kdata1, kdata2 midiin 
  if kstatus == 176 && kchan == 1 then
  kCC scale kdata2, 10, 0.1, 127, 0
  elseif kstatus == 144 && kchan == 1 then
  kNote = kdata1
  endif
  ;printk2 kdata1
if kPchIn == 1 then
kFrq = kFrqIn*10
elseif kPchIn == 2 then
kInput myWave aFilt
kFrq = kFrqIn*kInput
elseif kPchIn == 3 && kActiveDrone2 == 1 then
kInput myWave aDrone2
kFrq = kFrqIn*kInput*10
elseif kPchIn == 4 && kdata1 == 21 then
kFrq = kFrqIn*10*kCC
elseif kPchIn == 5 then
kFrq = (kFrqIn*10)+(mtof:k(kNote))
elseif kPchIn == 6 then
kInput myFbk gaLFO1
kFrq = (kFrqIn*10)+(gkLFO1*25)
elseif kPchIn == 7 then
kInput myFbk gaLFO2
kFrq = (kFrqIn*10)+(gkLFO2*25)
elseif kPchIn == 8 then
kInput myWave aAUX
kFrq = kFrqIn*kInput*10
endif
  if kFrq <= 2 then
  kFrq = 2
  endif
  if kFrq >= 8000 then
  kFrq = 8000
  endif
if kPWMIn != 1 then
  if     kPWMIn == 2 then 
  kInput myWave aFilt
  kInput scale abs(kInput), 100, 1000, 0,10
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 3 && kActiveDrone2 == 1 then 
  kInput myWave aDrone2
  kInput scale abs(kInput), 100, 1000, 2,10
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 4 && kdata1 == 22 then 
  kInput scale kCC, 100, 1000, 0.1, 10
  kInputS = int(kInput/50)*50
  elseif kPWMIn == 5 then 
  kInput scale kNote, 100, 1000, 48, 72
  kInputS = int(kInput/50)*50
  elseif kPWMIn == 6 then 
  kInput scale gkLFO1, 100, 1000, -1, 1
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 7 then 
  kInput scale gkLFO2, 100, 1000, -1, 1
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 8 then 
  kInput myWave aAUX
  kInputS scale kInput, 100, 1000, 2, 10
  else
  kPWchng = 0
  endif
  if changed(kInputS) == 1 then 
  reinit    UPDATE
  endif
UPDATE:
     iPW = i(kInputS)
     ;print iPW 
     iSquare   ftgen   0, 0, 1024, 7, 1, iPW, 1, 0, -1, iPW, -1
     aSquare   poscil iAmp, kFrq+aLFOFrq, iSquare
    rireturn
else
aSquare   poscil iAmp, kFrq+aLFOFrq, giSquare 
endif
aTriangle poscil iAmp, kFrq+aLFOFrq, giTriangle
aSaw      poscil iAmp, kFrq+aLFOFrq, giSaw
kPortTime linseg 0, 0.001, 0.05
kMix = kMix+kLFOshape
  if kMix >= 1 then
  kMix = 1
  elseif kMix <= 0 then
  kMix = 0
  endif
kMix portk kMix, kPortTime
kMix1 = (kMix*2) >= 1 ? 1 : kMix*2
kMix2 = (kMix*2) <= 1 ? 0 : (kMix*2)-1
aShape1 ntrpol aSquare, aTriangle, kMix1
aShape2 ntrpol aTriangle, aSaw, kMix2
aDrone  ntrpol aShape1, aShape2, kMix
kSub = (kSub-1)*2
  if kSub == 0 then
  aSub = aDrone
  elseif kSub != 0 then
  aSquareSub   poscil iAmp, (kFrq/kSub), giSquare
  aTriangleSub poscil iAmp, (kFrq/kSub), giTriangle
  aSawSub      poscil iAmp, (kFrq/kSub), giSaw
  aShapeSub1 ntrpol aSquareSub, aTriangleSub, kMix1
  aShapeSub2 ntrpol aTriangleSub, aSawSub, kMix2
  aSub       ntrpol aShapeSub1, aShapeSub2, kMix
  endif
aSound ntrpol aDrone, aSub, kSubMix
 if changed(kMod) == 1 then
 reinit    UPDATE
 endif
     UPDATE:
     iMod = i(kMod)-1
    rireturn 
    
      
  if     kCutIn == 1 then
  kFilter = kFilt
  elseif kCutIn == 2 then
  kFilter myWave aSound
  kFilter scale abs(kFilter), 200, 4000, 0,10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 3 && kActiveDrone2 == 1 then
  kFilter myWave aDrone2
  kFilter scale abs(kFilter), 200, 4000, 0,10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 4 && kdata1 == 23 then 
  kFilter scale kCC, 200, 4000, 0.1, 10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 5 then 
  kFilter scale kNote, 200, 4000, 48, 72
  kFilter = kFilt+(int(kFilter/10)*10)
    if kFilter <= 50 then
    kFilter = 50
    endif
    if kFilter >= 8000 then
    kFilter = 8000
    endif
  elseif kCutIn == 6 then
  kFilter scale gkLFO1, 200, 4000, -1, 1
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 7 then
  kFilter scale gkLFO2, 200, 4000, -1, 1
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 8 then 
  kFilter myWave aAUX
  kFilter scale kFilter, 200, 4000, 2, 10
  kFilter = kFilt+(int(kFilter/10)*10)
  endif
aFilt bqrez aSound, kFilter, kRes, iMod
kGain ampdb kGaindB
kGain portk kGain, kPortTime
aGain interp kGain
aOut clip aFilt*aGain*aEnv, 1, 0.9
chnmix aOut, "snd1"
chnmix aFilt, "drn1"
gaDrone1 = aSound*aEnv
endin

instr drone2
iAmp = 0.9
kFrqIn     cabbageGet "dronepitch2" ;100
kShapeIn   cabbageGet "dron2mix"
kLFOdep    cabbageGet "dronlfo2"
kLFOmod    cabbageGet "drn2b1"
kMix       cabbageGet "dron2wave"
kLFOFltdep cabbageGet "dronlfof2"
kFiltIn    cabbageGet "cut2"
kSub       cabbageGet "drn2sub"
kSubMix    cabbageGet "sub2mix"
kFiltMod   cabbageGet "filtmod2"
kRes       cabbageGet "res2"
kMod       cabbageGet "filtmod2"
kGaindB    cabbageGet "gain2"
kLFO1OSC   cabbageGet "lfo1dst1"
kLFO1Flt   cabbageGet "lfo1dst2"
kLFO2OSC   cabbageGet "lfo2dst1"
kLFO2Flt   cabbageGet "lfo2dst2"
kLFO1OnOff cabbageGet "lfoshape1"
kLFO2OnOff cabbageGet "lfoshape2"
kPchIn     cabbageGet "inpch2"
kPWMIn     cabbageGet "inpwm2"
kCutIn     cabbageGet "incut2"
kActiveDrone1 active "drone1"
  if     kLFO1OSC == 1 && kLFO2OSC == 1 then
  kLFOin  = 0
  aLFOin  interp k(0)
  elseif kLFO1OSC == 1 && kLFO2OSC == 2 then
  kLFOin    = gkLFO2
  aLFOin    = gaLFO2
  elseif kLFO1OSC == 2 && kLFO2OSC == 1 then
  kLFOin    = gkLFO1
  aLFOin    = gaLFO1
  elseif kLFO1OSC == 2 && kLFO2OSC == 2 then
      if     kLFO1OnOff == 1 then
      kLFOin    = gkLFO2
      aLFOin    = gaLFO2
      elseif kLFO2OnOff == 1 then
      kLFOin    = gkLFO1
      aLFOin    = gaLFO1
      else
      kLFOin    = gkLFO1*gkLFO2
      aLFOin    = gaLFO1*gaLFO2
      endif
  else
  kLFOin  = 0
  aLFOin  interp k(0)
  endif
  if kLFOmod == 1 && kLFOin != 0 then
  kLFOshape = (kLFOin+1)/2*(kLFOdep/150)
  aLFOFrq   interp k(0)
  elseif kLFOmod == 2 && kLFOin != 0 then
  kLFOshape = 0
  aLFOFrq   = aLFOin*kLFOdep
  endif
  if     kLFO1Flt == 1 && kLFO2Flt == 1 then
  kLFOFilt    = 0
  elseif kLFO1Flt == 1 && kLFO2Flt == 2 then
  kLFOFilt    = gkLFO2
  elseif kLFO1Flt == 2 && kLFO2Flt == 1 then
  kLFOFilt    = gkLFO1
  elseif kLFO1Flt == 2 && kLFO2Flt == 2 then
      if     kLFO1OnOff == 1 then
      kLFOFilt    = gkLFO2
      elseif kLFO2OnOff == 1 then
      kLFOFilt    = gkLFO1
      else
      kLFOFilt    = gkLFO1*gkLFO2
      endif
  else
  kLFOFilt    = 0
  endif
kFilt = kFiltIn+(kLFOFilt*kLFOFltdep)
aFilt init 0
aEnv linsegr 0, 0.2, 1, 0.2, 0
aDrone1 = gaDrone1*aEnv
aAUX inch 1
;aAUX diskin "fox.wav", 1, 0, 1
  kCC init 1
  kNote init 1000
kstatus, kchan, kdata1, kdata2 midiin 
  if kstatus == 176 && kchan == 1 then
  kCC scale kdata2, 10, 0.1, 127, 0
  elseif kstatus == 144 && kchan == 2 then
  kNote = kdata1
  endif
  ;printk2 kdata1
if kPchIn == 1 then
kFrq = kFrqIn*10
elseif kPchIn == 2 && kActiveDrone1 == 1 then
kInput myWave aDrone1
kFrq = kFrqIn*kInput*10
elseif kPchIn == 3 then
kInput myWave aFilt
kFrq = kFrqIn*kInput
elseif kPchIn == 4 && kdata1 == 21 then
kFrq = kFrqIn*10*kCC
elseif kPchIn == 5 then
kFrq = (kFrqIn*10)+(mtof:k(kNote))
elseif kPchIn == 6 then
kInput myFbk gaLFO1
kFrq = (kFrqIn*10)+(gkLFO1*25)
elseif kPchIn == 7 then
kInput myFbk gaLFO2
kFrq = (kFrqIn*10)+(gkLFO2*25)
elseif kPchIn == 8 then
kInput myWave aAUX
kFrq = kFrqIn*kInput*10
endif
  if kFrq <= 2 then
  kFrq = 2
  endif
  if kFrq >= 8000 then
  kFrq = 8000
  endif
if kPWMIn != 1 then
  if kPWMIn == 2 && kActiveDrone1 == 1 then 
  kInput myWave aDrone1
  kInput scale abs(kInput), 100, 1000, 2,10
  kInputS = int(kInput/100)*100
  elseif     kPWMIn == 3 then 
  kInput myWave aFilt
  kInput scale abs(kInput), 100, 1000, 0,10
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 4 && kdata1 == 22 then 
  kInput scale kCC, 100, 1000, 0.1, 10
  kInputS = int(kInput/50)*50
  elseif kPWMIn == 5 then 
  kInput scale kNote, 100, 1000, 48, 72
  kInputS = int(kInput/50)*50
  elseif kPWMIn == 6 then 
  kInput scale gkLFO1, 100, 1000, -1, 1
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 7 then 
  kInput scale gkLFO2, 100, 1000, -1, 1
  kInputS = int(kInput/100)*100
  elseif kPWMIn == 8 then 
  kInput myWave aAUX
  kInputS scale kInput, 100, 1000, 2, 10
  else
  kPWchng = 0
  endif
  if changed(kInputS) == 1 then 
  reinit    UPDATE
  endif
UPDATE:
     iPW = i(kInputS)
     ;print iPW 
     iSquare   ftgen   0, 0, 1024, 7, 1, iPW, 1, 0, -1, iPW, -1
     aSquare   poscil iAmp, kFrq+aLFOFrq, iSquare
    rireturn
else
aSquare   poscil iAmp, kFrq+aLFOFrq, giSquare 
endif
aTriangle poscil iAmp, kFrq+aLFOFrq, giTriangle
aSaw      poscil iAmp, kFrq+aLFOFrq, giSaw
kPortTime linseg 0, 0.001, 0.05
kMix = kMix+kLFOshape
  if kMix >= 1 then
  kMix = 1
  elseif kMix <= 0 then
  kMix = 0
  endif
kMix portk kMix, kPortTime
kMix1 = (kMix*2) >= 1 ? 1 : kMix*2
kMix2 = (kMix*2) <= 1 ? 0 : (kMix*2)-1
aShape1 ntrpol aSquare, aTriangle, kMix1
aShape2 ntrpol aTriangle, aSaw, kMix2
aDrone  ntrpol aShape1, aShape2, kMix
kSub = (kSub-1)*2
  if kSub == 0 then
  aSub = aDrone
  elseif kSub != 0 then
  aSquareSub   poscil iAmp, (kFrq/kSub), giSquare
  aTriangleSub poscil iAmp, (kFrq/kSub), giTriangle
  aSawSub      poscil iAmp, (kFrq/kSub), giSaw
  aShapeSub1 ntrpol aSquareSub, aTriangleSub, kMix1
  aShapeSub2 ntrpol aTriangleSub, aSawSub, kMix2
  aSub       ntrpol aShapeSub1, aShapeSub2, kMix
  endif
aSound ntrpol aDrone, aSub, kSubMix
 if changed(kMod) == 1 then
 reinit    UPDATE
 endif
     UPDATE:
     iMod = i(kMod)-1
    rireturn 
    
      
  if     kCutIn == 1 then
  kFilter = kFilt
  elseif kCutIn == 2 && kActiveDrone1 == 1 then
  kFilter myWave aDrone1
  kFilter scale abs(kFilter), 200, 4000, 0,10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 3 then
  kFilter myWave aSound
  kFilter scale abs(kFilter), 200, 4000, 0,10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 4 && kdata1 == 23 then 
  kFilter scale kCC, 200, 4000, 0.1, 10
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 5 then 
  kFilter scale kNote, 200, 4000, 48, 72
  kFilter = kFilt+(int(kFilter/10)*10)
    if kFilter <= 50 then
    kFilter = 50
    endif
    if kFilter >= 8000 then
    kFilter = 8000
    endif
  elseif kCutIn == 6 then
  kFilter scale gkLFO1, 200, 4000, -1, 1
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 7 then
  kFilter scale gkLFO2, 200, 4000, -1, 1
  kFilter = kFilt+(int(kFilter/10)*10)
  elseif kCutIn == 8 then 
  kFilter myWave aAUX
  kFilter scale kFilter, 200, 4000, 2, 10
  kFilter = kFilt+(int(kFilter/10)*10)
  endif
aFilt bqrez aSound, kFilter, kRes, iMod
kGain ampdb kGaindB
kGain portk kGain, kPortTime
aGain interp kGain
aOut clip aFilt*aGain*aEnv, 1, 0.9
chnmix aOut, "snd2"
chnmix aFilt, "drn2"
gaDrone2 = aSound*aEnv
endin



instr mixerFX
aIn1 chnget "snd1"
aIn2 chnget "snd2"
aIn sum aIn1, aIn2
kMixFb  cabbageGet "fbmix"
kFb     cabbageGet "mainfb"
kFbMod  cabbageGet "fbmod"
kMonos cabbageGet "mixmons"

if     kFbMod == 1 then
aSound = aIn
elseif kFbMod == 2 then
aSound myFba aIn, kFb, kMixFb
elseif kFbMod == 3 then
aFb myFba aIn1, kFb, kMixFb
aSound = aFb+aIn2
elseif kFbMod == 4 then
aFb myFba aIn2, kFb, kMixFb
aSound = aFb+aIn1
endif



kDlyTimeIn cabbageGet "dlyt"
kFb        cabbageGet "fb"
kDlyDep    cabbageGet "dldep"
kLFOmod    cabbageGet "mixdep"
kDlyMix    cabbageGet "dlmix"
kRvrbSize  cabbageGet "rsize"
kRvrbRoom  cabbageGet "rroom"
kRvrbMix   cabbageGet "rmix"

kMainGaindB   cabbageGet "maingain"
kMainGain ampdb kMainGaindB
kPortTime linseg 0, 0.1, 0.1
if kLFOmod == 1 then
kLFO = gkLFO1
elseif kLFOmod == 2 then
kLFO = gkLFO2
endif
kDlyTime = kDlyTimeIn+(kDlyDep*kLFO)

kDlyTime portk kDlyTime, kPortTime
 aDelay  myDelay aSound, kDlyTime,kFb, kDlyMix
 aRvrbL,aRvrbR   myRvrb  aDelay, kRvrbSize, kRvrbMix
 

aOutL = aRvrbL*kMainGain
aOutR = aRvrbR*kMainGain
aMono = (aOutL+aOutR)/2

if kMonos == 1 then
out aOutL, aOutR
elseif kMonos == 2 then
out aMono, aMono
endif
aShow = aMono
display aShow, 1/100, 4
cabbageSet "display", "skew", 2
chnclear "snd1", "snd2"
endin

instr widgets
kDrone1 cabbageGet "droneonoff1"
kDrone2 cabbageGet "droneonoff2"
kLFO1   cabbageGet "lfoshape1"
kLFO2   cabbageGet "lfoshape2"
  if kDrone1 == 1 && changed(kDrone1) == 1 then
    schedulek "drone1", 0, 999999
  elseif kDrone1 == 0 && changed(kDrone1) == 1 then
    turnoff2 "drone1", 0, 1
  endif
  if kDrone2 == 1 && changed(kDrone2) == 1 then
    schedulek "drone2", 0, 999999
  elseif kDrone2 == 0 && changed(kDrone2) == 1 then
    turnoff2 "drone2", 0, 1
  endif
  if kLFO1 > 1 && changed(kLFO1) == 1 then
    turnoff2 "lfo1", 0, 1
    schedulek "lfo1", 0.11, 999999, kLFO1
  elseif kLFO1 == 1 && changed(kLFO1) == 1 then
    turnoff2 "lfo1", 0, 1
  endif
  if kLFO2 > 1 && changed(kLFO2) == 1 then
    turnoff2 "lfo2", 0, 1
    schedulek "lfo2", 0.11, 999999, kLFO2
  elseif kLFO2 == 1 && changed(kLFO2) == 1 then
    turnoff2 "lfo2", 0, 1
  endif
endin

</CsInstruments>
<CsScore>
i "widgets" 0 [9^9]
i "mixerFX" 0 [9^9]
</CsScore>
</CsoundSynthesizer>