 bounds(0, 0, 0, 0)
<Cabbage>
form caption("FluxRad")    size(1000, 650)   guiMode("queue") colour(20,20,40) pluginId("flrd") ; style("legacy")
label bounds(732, 64, 239, 66) channel("sec") fontColour(169, 196, 219, 255) text("00 : 04")s
button bounds(860, 22, 110, 35) channel("start") colour:0(102, 102, 113, 255) colour:1(50, 80, 150) text("S  T  A  R  T", "S  T  O  P") value(1)
;;radio input
image bounds(24, 36, 302, 208) channel("cover1") colour(30,30,50)
button bounds(220, 50, 90, 35) channel("radio") colour:0(70, 70, 80) colour:1(50, 80, 150) text("Radio", "running") 
vslider bounds(32, 76, 50, 160) channel("amp1") range(0, 80, 50, 1, 1) trackerColour(55, 113, 152, 255)
label bounds(32, 48, 55, 26) channel("data1") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255)   fontSize(25) , text("-60")
vmeter bounds(80, 84, 15, 143) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)      value(0.39405)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
button bounds(238, 92, 71, 35) channel("rnoise") colour:0(70, 70, 80) colour:1(50, 80, 150) text("noise", "running") 
rslider bounds(116, 144, 60, 60) channel("radio1") range(0, 1, 0.5, 1, 0.001) text("tuning") trackerColour(111, 157, 217, 255)
rslider bounds(180, 144, 60, 60) channel("radio2") range(0, 1, 0.5, 1, 0.001) text("tuning") trackerColour(111, 157, 217, 255)
rslider bounds(244, 144, 60, 60) channel("radio3") range(0, 1, 0.5, 1, 0.001) text("tuning") trackerColour(111, 157, 217, 255)
hmeter bounds(118, 218, 187, 16) channel("rline") outlineColour(0, 0, 0, 255) overlayColour(50, 50, 80, 255)    value(0.331562) corners(0) meterColour:0(120, 182, 207, 255)
;freeze
image bounds(336, 36, 272, 90) channel("cover2") colour(30, 30, 50, 255)
button bounds(508, 48, 90, 35) channel("frz") colour:0(70, 70, 80) colour:1(50, 80, 150) text("freeze", "running") value(0)
rslider bounds(348, 52, 60, 60) channel("rndfrz") range(0.2, 7, 0.5, 1, 0.1) text("frz time") trackerColour(111, 157, 217, 255)
rslider bounds(412, 52, 60, 60) channel("rndamp") range(1, 12, 4, 1, 0.1) text("amp time") trackerColour(111, 157, 217, 255)
image bounds(570, 94, 20, 20) channel("frzshow") colour(30, 30, 30, 255)
;loop
image bounds(337, 134, 272, 130) channel("cover3") colour(30, 30, 50, 255)
button bounds(508, 146, 90, 35) channel("loop") colour:0(70, 70, 80) colour:1(50, 80, 150) text("loop", "running") value(0)
rslider bounds(348, 194, 60, 60) channel("lptime") range(0.1, 5, 0.5, 1, 0.01) text("time") trackerColour(111, 157, 217, 255)
rslider bounds(412, 194, 60, 60) channel("lprep") range(2, 8, 3, 1, 1) text("rep") trackerColour(111, 157, 217, 255)
rslider bounds(476, 194, 60, 60) channel("lpmix") range(0, 1, 0.5, 1, 0.001) text("rvrs mix") trackerColour(111, 157, 217, 255)
hmeter bounds(346, 152, 150, 16) channel("lpline") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
image bounds(564, 200, 20, 20) channel("lpshow") colour(30, 30, 30)
;tuner
image bounds(337, 274, 272, 138) channel("cover4") colour(30, 30, 50, 255)
button bounds(508, 286, 90, 35) channel("tuner") colour:0(70, 70, 80) colour:1(50, 80, 150) text("tuner", "running") value(0)
rslider bounds(348, 338, 60, 60) channel("tnmin") range(200, 900, 300, 1, 1) text("min") trackerColour(111, 157, 217, 255)
rslider bounds(412, 338, 60, 60) channel("tnmax") range(400, 1200, 500, 1, 1) text("max") trackerColour(111, 157, 217, 255)
rslider bounds(476, 338, 60, 60) channel("tnstep") range(20, 200, 30, 1, 1) text("step") trackerColour(111, 157, 217, 255)
hmeter bounds(346, 292, 150, 16) channel("trline") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
;tapeRecord
image bounds(28, 354, 300, 263) channel("cover5") colour(30, 30, 50, 255)
label bounds(38, 362, 92, 16) channel("label10048") text("tape record")
rslider bounds(44, 544, 60, 60) channel("tpr1") range(0, 1, 0.5, 1, 0.001) text("tp1") trackerColour(111, 157, 217, 255)
rslider bounds(112, 544, 60, 60) channel("tpr2") range(0, 1, 0.5, 1, 0.001) text("tp2") trackerColour(111, 157, 217, 255)
rslider bounds(180, 544, 60, 60) channel("tpr3") range(0, 1, 0.5, 1, 0.001) text("tp3") trackerColour(111, 157, 217, 255)
rslider bounds(250, 544, 60, 60) channel("tpr4") range(0, 1, 0.5, 1, 0.001) text("tp4") trackerColour(111, 157, 217, 255)
label bounds(258, 376, 15, 15) channel("label10052") text("R")
button bounds(254, 396, 25, 25) channel("rrec1") colour:0(70, 70, 80) colour:1(180, 50, 50) text("")
button bounds(254, 430, 25, 25) channel("rrec2") colour:0(70, 70, 80) colour:1(180, 50, 50) text("")
button bounds(254, 464, 25, 25) channel("rrec3") colour:0(70, 70, 80) colour:1(180, 50, 50) text("")
button bounds(254, 498, 25, 25) channel("rrec4") colour:0(70, 70, 80) colour:1(180, 50, 50) text("")
label bounds(292, 376, 15, 15) channel("label10053") text("P")
button bounds(288, 396, 25, 25) channel("rplay1") colour:0(70, 70, 80) colour:1(50, 80, 180) text("")
button bounds(288, 430, 25, 25) channel("rplay2") colour:0(70, 70, 80) colour:1(50, 80, 180) text("")
button bounds(288, 464, 25, 25) channel("rplay3") colour:0(70, 70, 80) colour:1(50, 80, 180) text("")
button bounds(288, 498, 25, 25) channel("rplay4") colour:0(70, 70, 80) colour:1(50, 80, 180) text("")
hmeter bounds(36, 402, 200, 16) channel("trline1") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
hmeter bounds(36, 434, 200, 16) channel("trline2") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
hmeter bounds(36, 468, 200, 16) channel("trline3") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
hmeter bounds(36, 504, 200, 16) channel("trline4") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)

;midi
image bounds(24, 258, 303, 80) channel("cover6") colour(30, 30, 50, 255)
nslider bounds(98, 274, 45, 45) channel("prgoct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("Prgm")
nslider bounds(154, 274, 45, 45) channel("noteoct") range(-7, 7, 0, 1, 1) colour(37, 56, 75, 255) text("Note")
nslider bounds(40, 274, 45, 45) channel("ccoct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("CC")
nslider bounds(210, 274, 45, 45) channel("knoboct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("knob")
label bounds(268, 274, 45, 45) channel("prgdata") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255)  text("12") fontSize(30)
;matrix
image bounds(338, 422, 272, 196) channel("cover7") colour(30, 30, 50, 255)
label bounds(344, 430, 64, 16) channel("label10047") text("matrix")
;output
image bounds(639, 245, 338, 372) channel("cover8") colour(30, 30, 50, 255)
label bounds(648, 252, 80, 16) channel("label10029") text("output")
nslider bounds(672, 414, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(37, 56, 75, 255)
nslider bounds(712, 414, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(37, 56, 75, 255)
nslider bounds(752, 414, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(37, 56, 75, 255)
nslider bounds(792, 414, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(37, 56, 75, 255)
vslider bounds(666, 448, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(708, 448, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(748, 448, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(790, 448, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(55, 113, 152, 255)
nslider bounds(862, 378, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(37, 56, 75, 255) text("Master Gain (dB)")
nslider bounds(786, 370, 49, 38) channel("chnls") range(1, 8, 2, 1, 1) colour(37, 56, 75, 255) text("chns")
vmeter bounds(866, 446, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255) outlineThickness(0)
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(890, 446, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)\
    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(914, 446, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255) outlineThickness(0)
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(938, 446, 15, 150) channel("meter5")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255) outlineThickness(0)
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
signaldisplay bounds(652, 280, 150, 80), channel("display1") colour("white") displayType("waveform"), backgroundColour(40,40,60), zoom(-1), signalVariable("aShow1")
signaldisplay bounds(808, 280, 150, 80), channel("display2") colour("white") displayType("waveform"), backgroundColour(40,40,60), zoom(-1), signalVariable("aShow2")



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


#include "fluxrad.udo"


instr radioNoise
 aNoise noise 0.5, 0.5
 aGauss gaussi 0.5, 0.5, 1000
 aNoise = aNoise+aGauss
 kTuneIn cabbageGet "slider1"
 kTune   rateCCk kTuneIn, 0, 10
    if changed(int(kTune)) == 1 then
    schedulek "mtrx", 0, 0.1, 1, 1
    kGauss random 0.1*(kTune), 1*(kTune/5)
    kFrq1   random 60, 1000
    kFrq2   random 500, 1000
    kFrq3   random 1000, 2000
    kFrq4   random 500, 5000*(kTune/5)
    kQ1     random 0.1, 0.5
    kQ2     random 0.1, 0.5
    endif
 aFilt1 pareq aNoise, kFrq1, 0.001, 0.5, 1
 aFilt2 pareq aFilt1, kFrq2, 0.001, kQ1
 aFilt3 pareq aFilt2, kFrq3, 0.001, kQ2
 aFilt4 pareq aFilt3, kFrq4, 0.001, 0.5, 2
 chnmix aFilt4*3, "out"
endin



instr radioRecMachine
kRadioLine phasor 1/giTableSize
cabbageSetValue "rline", kRadioLine
    if metro(1/giTableSize) == 1 then
    schedulek "radioTab", 0, giTableSize
    endif
endin

instr radioTab
 gkTableTime line 0, 1, 1
 ;aIn inch 1
 iStart random 0, 40
 aIn diskin "radio.wav", 1, iStart, 1
 aRadio linen aIn, 0.01, p3, 0.01
 aSound clip aRadio, 1, ampdb(-0.3)
 kMax max_k aSound, metro(50), 1
 cabbageSetValue "meter1", kMax, metro(50)
 chnmix aSound, "snd"
 aLine linseg 0, giTableLen, giTableLen*sr
 tablew aSound, aLine, giTable
endin



instr radioFrz
 kTime cabbageGet "rndfrz"
 kTimeAmp cabbageGet "rndamp"
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn poscil 1, (-1/giTableLen),  giTable,iPhase
 kTrig = int(randomh:k(0,2,kTime))
Scolor sprintfk "colour(%d, %d,%d)", (80*kTrig)+30,(80*kTrig)+30,(150*kTrig)+30
 cabbageSet 1, "frzshow", Scolor
 aFrz FrzMono aIn,kTrig
 aEnv linen aFrz*0.1, 0.05, p3, 0.05
 kLFOfrq rspline 1, kTimeAmp, 2, 5
 if kTrig == 1 && kTimeAmp > 1 then
 aLFO lfo 1, kLFOfrq, 3
 else
 aLFO = 1
 endif
 aOut = aEnv*aLFO
 chnmix aOut, "out"
endin

;schedule "radioFrz", 0, 999

instr loopMachine
 kTime cabbageGet "lptime"
 kRep cabbageGet "lprep"
    if metro(1/kTime) == 1 then
    kStart random i(gkTableTime), i(gkTableTime)+4
        kndx = 0
        while kndx < kRep do
        schedulek "loopRadio", (kTime/kRep)*kndx, kTime/kRep, kStart
        kndx += 1
        od
    endif
kLoopLine phasor 1/kTime
cabbageSetValue "lpline", kLoopLine

kLoopLED = phasor:k((1/kTime)*kRep) > 0.5 ? 0 : 1
 Scolor sprintfk "colour(%d, %d,%d)", (80*kLoopLED)+30,(80*kLoopLED)+30,(150*kLoopLED)+30
 cabbageSet 1, "lpshow", Scolor
endin

;schedule "loopMachine", 2, 999

instr loopRadio
kLoopMix cabbageGet "lpmix"
iStart = p4
iPhase = iStart/giTableLen
aSound poscil 1, (1/giTableLen),  giTable,iPhase
aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
aMix ntrpol aSound,aRvrs, kLoopMix
aOut linen aMix, p3/10, p3, p3/10
;outall aOut
chnmix aOut*0.2, "out"
endin


instr tunerRadio
 aIn chnget "snd"
 kfr, kamp 	ptrack 		aIn, 1024,10
 kFrq = kfr
 
 kFrqFltrUp = 700
 kFrqFltrDown = 300
 kFrqPort = 80
 if cabbageGet:k("prgmledh2") == 0 then
 kFrqFltrUp   cabbageGet "tnmin"
 kFrqFltrDown cabbageGet "tnmax"
 kFrqPort cabbageGet "tnstep"
 kFrqPort = int(kFrqPort/10)*10
 Sdata1 sprintfk "text(%d)", kFrqFltrDown
 Sdata2 sprintfk "text(%d)", kFrqFltrUp
 Sdata3 sprintfk "text(%d)", kFrqPort
 cabbageSet 1,"data3", Sdata1
 cabbageSet 1,"data4", Sdata2
 cabbageSet 1,"data5", Sdata3
 endif
 until kFrq < kFrqFltrUp do
 kFrq = kFrq/2
 od
 until kFrq > kFrqFltrDown do
 kFrq = kFrq*2
 od
 kPortTime linseg 0, 0.01, 0.05
 kFrq portk kFrq, kPortTime
 kFrq = int(kFrq/kFrqPort)*kFrqPort
; printk2 kFrq
 kamp portk kamp, kPortTime*2
 aSine1 poscil ampdb(kamp), kFrq
 aSine2 poscil ampdb(kamp)/2, kFrq*1.5
 aOut linen aSine1+aSine2, 0.01, p3, 0.01
; outall aSine*0.5
Schn sprintf "out%d", 1
chnmix aOut*0.08, "out"
 chnclear "snd"
endin

;schedule "tunerRadio", 0, 999

instr tabWrite
 kTrig metro 8
 Sprgnum sprintf "mtrx%d", p4
Scolor switchColor kTrig
 cabbageSet kTrig, Sprgnum, Scolor
 if release() == 1 then
 cabbageSet 1, Sprgnum, "colour(220,70,70)"
 endif
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn poscil 1, (1/giTableLen),  giTable,iPhase
 aSound linen aIn, 0.01, p3, 0.01
 aLine linseg 0, giTableLen, giTableLen*sr
 if p4 == 77 then
 iTabRec = giTabRec1
 elseif p4 == 78 then
 iTabRec = giTabRec2
 elseif p4 == 79 then
 iTabRec = giTabRec3
 elseif p4 == 80 then
 iTabRec = giTabRec4
 endif 
  tablew aSound, aLine, iTabRec
endin

instr tabRead
 kSpeedIn1 = 1 ;cabbageGet "slider17"
 kSpeedIn2 cabbageGet "slider18"
 kSpeedIn3 cabbageGet "slider19"
 kSpeedIn4 cabbageGet "slider20"
 
   if p4 == 77 then
 iTabRec = giTabRec1
 kSpeedIn = kSpeedIn1
 elseif p4 == 78 then
 iTabRec = giTabRec2
 kSpeedIn = kSpeedIn2
 elseif p4 == 79 then
 iTabRec = giTabRec3
 kSpeedIn = kSpeedIn3
 elseif p4 == 80 then
 iTabRec = giTabRec4
 kSpeedIn = kSpeedIn4
 endif 
 kCent rateCCk kSpeedIn, -2400, 1200
 kCent = int(kCent/200)*200
 Sdata1 sprintfk "text(%d)", kCent
 if changed(Sdata1) == 1 then
 cabbageSet 1,"data5", Sdata1
 endif
 kMetro = cent:k(kCent)
kSpeed = kMetro*-1
 kTimeLED init 0
 if metro(kMetro*1.25) == 1 then
 kDur = (1/kMetro*1.25)
 schedulek "mtrxLED", 0, kDur, kTimeLED+1+(16*(p4-73)), 3
 kTimeLED = (kTimeLED+1) % (giTableSize*0.8)
endif
 aPlay  poscil 1, (kSpeed/giTableLen), iTabRec
 chnmix aPlay, "out"
endin

;schedule "tabWrite", 0, 5, 77
;schedule "tabRead", 6, 5, 77

instr mtrxLED
 if p5 == 1 then
    Scolor = "colour:1(120,180,250)"
    elseif p5 == 2 then
    Scolor = "colour(200, 100, 100)"
    elseif p5 == 3 then
    Scolor = "colour(120,180,250)"
    elseif p5 == 4 then
    Scolor = "colour(150, 180, 100)"
 endif
 Smtrx sprintf "mtrx%d",p4
 cabbageSet Smtrx, Scolor
    if release() == 1 then
    cabbageSet metro(50), Smtrx,"colour(70,70,70)"
    endif
endin

instr prgmLED
 iPrgNum = p4
 iDelay = p5
schedule "prgmLEDh", 0, 0.1, iPrgNum,0
    indx = 0
    while indx < 32 do
    Sprgnum sprintf "prgmled%d",indx
    cabbageSet Sprgnum,"value(0)"
    cabbageSetValue Sprgnum,0
    cabbageSet Sprgnum, "colour:0(70,70,70)"
    cabbageSet Sprgnum, "colour:1(120,180,250)"
    indx += 1
    od
    if active("prgmLED") == 2 then
    turnoff2 "prgmLED", 0, 1
    endif
    if iDelay == 0  then
    Scolor = "colour:1(120,180,250)"
    elseif iDelay > 0 && iDelay <= 0.4 then
    Scolor = "colour:1(100,200,150)"
    elseif iDelay > 0.4 && iDelay <= p3 then
    Scolor = "colour:1(200,200,100)"
    endif
 kOnOff init 0
 kTrig metro 8
 Sprgnum sprintf "prgmled%d",iPrgNum
 cabbageSetValue Sprgnum, switchColork(kTrig), kTrig
    if release() == 1 then
    schedulek "prgmLEDh", 0, 0.1, iPrgNum,1
    cabbageSet Sprgnum, "colour:1(200,70,70)"
    cabbageSet 1, Sprgnum, "value(1)"
    cabbageSet 1,Sprgnum,Scolor
    endif
endin


instr prgmLEDh
    indx = 0
    while indx < 32 do
    Sprgnum sprintf "prgmledh%d",indx
    cabbageSetValue Sprgnum,0
    cabbageSet Sprgnum, "colour:0(70,70,70)"
    cabbageSet Sprgnum, "colour:1(120,180,250)"
    indx += 1
    od
Sprgnum sprintf "prgmledh%d",p4
cabbageSetValue Sprgnum, p5
endin
;schedule "prgmLED", 0, 10


instr widgetWrite
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 40 do
 Smtrx    sprintf "bounds(%d, %d, 20, 20),\
 channel(\"mtrx%d\") colour(70, 70, 70)", \
 350+iX, iY+500, indx+1
 cabbageCreate "image", Smtrx 
  iX += 24
  indx += 1
    if (indx%5) == 0 then
    iX += 2
    endif
    if (indx%10) == 0 then
    iY += 24
    iX = 0
    endif
 od
endin



instr speakers
 aIn chnget "out"
 
  kMax max_k aIn, metro(50), 1
 cabbageSetValue "meter1", kMax, metro(50)
 outall aIn
 chnclear "out"
endin

instr time
 kTimer line 0, 1, 1
 kSec = int(kTimer)
 kMin init 0
 kSec = kSec % 60
    if kSec == 0 && changed(kSec) == 1 then
    kMin += 1
    endif
 STimer sprintfk "%02d : %02d", kMin, kSec
 cabbageSet 1, "sec", "text", STimer
endin

instr widgets
 iDurMaster = 99999
 schedule "widgetWrite", 0, 1
 kStart cabbageGet "start"
    if kStart == 1 && changed(kStart) == 1 then
    schedulek "time", 0, iDurMaster
    schedulek "speakers", 0, iDurMaster
    schedulek "radioRecMachine", 0, iDurMaster
    elseif kStart == 0 && changed(kStart) == 1 then
        kIndx = 1
        while kIndx < 20 do
        turnoff2 kIndx, 0, 0
        kIndx += 1
        od
    endif
kTime init 0
if metro(100) == 1 then
kTime += 0.01
endif
kType, kChn, kNum, kData midiin
kDataOut init -1
if kType == 176 && kNum > 50 then ;;cc
kNumCC, kDataCC setcc kNum,kData
	if changed(kNumCC,kDataCC) == 1 then
	printks  "num=%d, value=%d\\n", -1, kNumCC,kDataCC
	SCCnum sprintfk "mpad%d",kNumCC-50
	cabbageSetValue SCCnum, kDataCC
	endif
elseif kType == 176 && kNum <= 34 then
SsliderNum sprintfk "slider%d",kNum-10
cabbageSetValue SsliderNum , kData/127
elseif kType == 192 then ;;prg
	if kNum >= 25 then
	kccOct, kPrgOct, kNoteOct, kKnobOct setoct kNum,kTime
	printks  "cc=%d,	prg=%d,	note=%d,	knob=%d\\n", -1,\
	 kccOct, kPrgOct, kNoteOct, kKnobOct
	    if changed(kccOct) == 1 then
	    cabbageSetValue "ccoct", kccOct
	    endif
	    if changed(kPrgOct) == 1 then
	    cabbageSetValue "prgoct", kPrgOct
	    endif
		if changed(kNoteOct) == 1 then
	    cabbageSetValue "noteoct", kNoteOct
	    endif
	    if changed(kKnobOct) == 1 then
	    cabbageSetValue "knoboct", kKnobOct
	    endif
	else
	iDurPrg = 1.3
	kPrgNum, kTime setprgm kNum, kTime, iDurPrg
	printks  "prgnum=%d,	value=%.2f\\n", -1, kPrgNum,kTime
	schedulek "prgmLED", 0, iDurPrg, kPrgNum, kTime
	endif
 elseif kType == 160 then ;;press
 kPrs = kData
 printks  "num=%d,	value=%.2f\\n", -1, kNum,kPrs
endif 


kPrgmClickArr[] init 2
kArrIndx init 0
if metro(5) == 1 then
    kndx = 0
    kPrgChng init 0
    while kndx < 24 do
    Sprgnum sprintfk "prgmled%d",kndx
    kPrgChng cabbageGet Sprgnum
    if kPrgChng == 1 then
    kPrgIndx = kndx
        if changed(kPrgIndx) == 1 then
        kPrgmClickArr[kArrIndx] = kPrgIndx
        kArrIndx = (kArrIndx+1)%2
        kndx = kPrgmClickArr[kArrIndx]
        Sprgnum sprintfk "prgmled%d",kndx
        cabbageSetValue Sprgnum, k(0)
        endif
    endif
    kndx += 1
    od
endif
  if kStart == 1 then
    if cabbageGet:k("mpad1") == 1 && changed(cabbageGet:k("mpad1")) == 1 then
    schedulek "radioNoise", 0, iDurMaster
    elseif cabbageGet:k("mpad1") == 0 && changed(cabbageGet:k("mpad1")) == 1 then
    turnoff2 "radioNoise", 0, 0
    endif
    if cabbageGet:k("mpad2") == 1 && changed(cabbageGet:k("mpad2")) == 1 then
    schedulek "noiseFb", 0, iDurMaster
    elseif cabbageGet:k("mpad2") == 0 && changed(cabbageGet:k("mpad2")) == 1 then
    turnoff2 "noiseFb", 0, 0
    endif
    if cabbageGet:k("mpad5") == 1 && changed(cabbageGet:k("mpad5")) == 1 then
    schedulek "rvsMachine", 0.1, iDurMaster, 2
    elseif cabbageGet:k("mpad5") == 0 && changed(cabbageGet:k("mpad5")) == 1 then
    turnoff2 "rvsMachine", 0, 0
    turnoff2 "radioRvrs", 0, 0
    endif
    if cabbageGet:k("mpad6") == 1 && changed(cabbageGet:k("mpad6")) == 1 then
    schedulek "frzMachine", 0.1, iDurMaster, 2
    elseif cabbageGet:k("mpad6") == 0 && changed(cabbageGet:k("mpad6")) == 1 then
    turnoff2 "frzMachine", 0, 0
    turnoff2 "radioFrz", 0, 0
    endif
    if cabbageGet:k("mpad7") == 1 && changed(cabbageGet:k("mpad7")) == 1 then
    schedulek "loopMachine", 0.1, iDurMaster
    elseif cabbageGet:k("mpad7") == 0 && changed(cabbageGet:k("mpad7")) == 1 then
    turnoff2 "loopMachine", 0, 0
    turnoff2 "loopRadio", 0, 0
    endif
    if cabbageGet:k("mpad8") == 1 && changed(cabbageGet:k("mpad8")) == 1 then
    schedulek "tunerRadio", 0.1, iDurMaster
    elseif cabbageGet:k("mpad8") == 0 && changed(cabbageGet:k("mpad8")) == 1 then
    turnoff2 "tunerRadio", 0, 0
    endif
    iTurnOff = 4
    iInstrW nstrnum "tabWrite"
    if changed(cabbageGet:k("mpad17")) == 1 then
    turnoff2 iInstrW+0.1,iTurnOff,1
    schedulek iInstrW+0.1, 0.1, giTableSize ,77
    endif
    if changed(cabbageGet:k("mpad18")) == 1 then
    turnoff2 iInstrW+0.2,iTurnOff,1
    schedulek iInstrW+0.2, 0.1, giTableSize ,78
    endif
    if changed(cabbageGet:k("mpad19")) == 1 then
    turnoff2 iInstrW+0.3,iTurnOff,1
    schedulek iInstrW+0.3, 0.1, giTableSize ,79
    endif
    if changed(cabbageGet:k("mpad20")) == 1 then
    turnoff2 iInstrW+0.4,iTurnOff,1
    schedulek iInstrW+0.4, 0.1, giTableSize ,80
    endif
    iInstrR nstrnum "tabRead"
    if cabbageGet:k("mpad21") == 1 && changed(cabbageGet:k("mpad21")) == 1 then
    schedulek iInstrR+0.1, 0.1, iDurMaster,77
    elseif cabbageGet:k("mpad21") == 0 && changed(cabbageGet:k("mpad21")) == 1 then
    turnoff2 iInstrR+0.1,iTurnOff,0
    endif
    if cabbageGet:k("mpad22") == 1 && changed(cabbageGet:k("mpad22")) == 1 then
    schedulek iInstrR+0.2, 0.1, iDurMaster,78
    elseif cabbageGet:k("mpad22") == 0 && changed(cabbageGet:k("mpad22")) == 1 then
    turnoff2 iInstrR+0.2, iTurnOff, 0
    endif
    if cabbageGet:k("mpad23") == 1 && changed(cabbageGet:k("mpad23")) == 1 then
    schedulek iInstrR+0.3, 0.1, iDurMaster,79
    elseif cabbageGet:k("mpad23") == 0 && changed(cabbageGet:k("mpad23")) == 1 then
    turnoff2 iInstrR+0.3, iTurnOff, 0
    endif
    if cabbageGet:k("mpad24") == 1 && changed(cabbageGet:k("mpad24")) == 1 then
    schedulek iInstrR+0.4, 0.1, iDurMaster,80
    elseif cabbageGet:k("mpad24") == 0 && changed(cabbageGet:k("mpad24")) == 1 then
    turnoff2 iInstrR+0.4, iTurnOff, 0
    endif
 endif
endin

</CsInstruments>
<CsScore>
i "widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

