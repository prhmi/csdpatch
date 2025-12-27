
<Cabbage>
form caption("FluxRad")    size(1200, 700)   guiMode("queue") colour(20,20,40) pluginId("flrd") ; style("legacy")
label bounds(934, 62, 239, 66) channel("sec") fontColour(169, 196, 219, 255) text("00 : 04")
button bounds(1062, 24, 110, 35) channel("start") colour:0(102, 102, 113, 255) colour:1(5, 86, 128, 255) text("S  T  A  R  T", "S  T  O  P") value(1)
label bounds(882, 176, 298, 31) channel("data1") fontColour(219, 169, 206, 255) colour(37, 56, 75, 255) align("left")  text("")
label bounds(882, 212, 298, 31) channel("data2") fontColour(219, 169, 206, 255) colour(37, 56, 75, 255) align("left")  text("")
label bounds(882, 290, 90, 40) channel("data3") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255) text("")  
label bounds(978, 290, 90, 40) channel("data4") fontColour(163, 209, 250) colour(37, 56, 75, 255) text("") 
label bounds(1074, 290, 90, 40) channel("data5") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255) fontSize(30), text("") 
label bounds(882, 336, 90, 40) channel("data6") fontColour(163, 209, 250) colour(37, 56, 75, 255) text("") 
label bounds(978, 336, 90, 40) channel("data7") fontColour(163, 209, 250) colour(37, 56, 75, 255) text("") 
label bounds(1074, 336, 90, 40) channel("data8") fontColour(163, 209, 250) colour(37, 56, 75, 255) fontSize(30), text("") 
nslider bounds(88, 228, 45, 45) channel("prgoct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("Prgm")
nslider bounds(144, 228, 45, 45) channel("noteoct") range(-7, 7, 0, 1, 1) colour(37, 56, 75, 255) text("Note")
nslider bounds(30, 228, 45, 45) channel("ccoct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("CC")
nslider bounds(200, 228, 45, 45) channel("knoboct") range(1, 7, 1, 1, 1) colour(37, 56, 75, 255) text("knob")
vslider bounds(904, 530, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(946, 530, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(986, 530, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(1028, 530, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(16, 54, 50, 150) channel("out5") range(0, 80, 50, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(140, 58, 30, 150) channel("out6") range(0, 80, 30, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(174, 58, 30, 150) channel("out7") range(0, 80, 60, 1, 1) trackerColour(55, 113, 152, 255)
vslider bounds(210, 58, 30, 150) channel("out8") range(0, 80, 40, 1, 1) trackerColour(55, 113, 152, 255)
nslider bounds(910, 496, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(37, 56, 75, 255)
nslider bounds(950, 496, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(37, 56, 75, 255)
nslider bounds(990, 496, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(37, 56, 75, 255)
nslider bounds(1030, 496, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(37, 56, 75, 255)
nslider bounds(16, 20, 40, 35) channel("outn5") range(-90, 50, -10, 1, 1) colour(37, 56, 75, 255)
nslider bounds(138, 24, 35, 30) channel("outn6") range(-90, 50, -30, 1, 1) colour(37, 56, 75, 255)
nslider bounds(172, 24, 35, 30) channel("outn7") range(-90, 50, 0, 1, 1) colour(37, 56, 75, 255)
nslider bounds(206, 24, 35, 30) channel("outn8") range(-90, 50, -20, 1, 1) colour(37, 56, 75, 255)
nslider bounds(1084, 460, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(37, 56, 75, 255) text("Master Gain (dB)")
nslider bounds(1106, 416, 49, 38) channel("chnls") range(1, 8, 2, 1, 1) colour(37, 56, 75, 255) text("chns")
image bounds(1088, 514, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(1112, 514, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1136, 514, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1160, 514, 15, 15) channel("clip4") colour(0, 0, 0, 255)
image bounds(66, 50, 15, 15) channel("clip5") colour(0, 0, 0, 255) visible(0)
vmeter bounds(1088, 528, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) \
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1112, 528, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)\
    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1136, 528, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) \
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1160, 528, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) \
   outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(66, 64, 15, 137) channel("meter5")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)   \
 outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
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


giTableSize = 15;sec
giTable ftgen 0, 0, giTableSize*sr, 2, 0
giTableLen = ftlen(giTable) / sr


giTabRec1 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec2 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec3 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec4 ftgen 0, 0, giTableSize*sr, 2, 0

seed 0
massign 0, 0

opcode FrzMono,a,ak
 aIn,kTrig xin
 iFFTsize = 1024
 ioverlap = iFFTsize/4
 iwinsize = iFFTsize
 iwintype = 1 
 f_anal  	pvsanal	aIn, iFFTsize, ioverlap, iwinsize, iwintype
 f_freeze	pvsfreeze f_anal, kTrig, kTrig
 aFrz	    pvsynth f_freeze
 aOut = aFrz
 xout aOut
endop


gkCCArr[] init 6
gkCCIndx init 0
opcode setcc, kk, kk
kNum, kData xin
kCCnum = kNum
if kData == 0 goto skip
kIndx = gkCCIndx
kTurnOff = 0
	kndx = 0
	while kndx < lenarray(gkCCArr) do
		if gkCCArr[kndx] == kCCnum then
		gkCCArr[kndx] = 0
		kCConOff = 0
		gkCCIndx = kndx
		kTurnOff = 1
		endif 
	kndx += 1
	od
if kTurnOff == 0 then
		kndx = 0 
		kSkip = 1
		while kndx < lenarray(gkCCArr) do
			if gkCCArr[kndx] == 0 then
			kSkip = 0
			endif
		kndx += 1
		od
	if kSkip == 0 then
		while gkCCArr[kIndx] != 0 do
		kIndx = (kIndx+1) % lenarray(gkCCArr)
		od
	gkCCArr[kIndx] = kCCnum
	kCConOff = 1
	gkCCIndx = (gkCCIndx+1) % lenarray(gkCCArr)
	endif
endif
skip:
if kNum >= 81 && kNum <= 88 then
kCConOff = kData
	if kData != 0 then
	kCConOff = 1
	endif
endif
	xout kCCnum, kCConOff
endop
gkPrgRepArr[] init 2
gkPrgmIndx init 0
opcode setprgm, kk, kki
kPrgNum,kTime,iDur xin
if kTime >= iDur then
kTime = 0
gkPrgmIndx = 0
gkPrgRepArr[0] = 0
gkPrgRepArr[1] = 0
endif
gkPrgRepArr[gkPrgmIndx] = kPrgNum
if gkPrgmIndx == 0 then
kTime = 0
endif
kPrgNumOut = kPrgNum
if gkPrgmIndx == 0 then
gkPrgRepArr[1] = 0
endif
if gkPrgmIndx == 1 && kTime < iDur then
	if gkPrgRepArr[0] != gkPrgRepArr[1] then
	kPrgNumOut = (gkPrgRepArr[0]*100)+gkPrgRepArr[1]
	endif
endif
gkPrgmIndx = (gkPrgmIndx+1) % 2
xout kPrgNumOut, kTime
endop

gkUpDownPrg1 init 1
gkUpDownPrg2 init 1
gkUpDownPrg3 init 0
gkUpDownPrg4 init 1
gkOctArr[] init 2
gkOctIndx init -1
opcode setoct, kkkk, kk
kPrgNum,kTime xin
iDurReset = 0.1
if changed(kPrgNum) == 1 then
gkOctIndx = (gkOctIndx+1) % 2
endif
gkOctArr[gkOctIndx] = kTime
kMidiTime abs gkOctArr[1]-gkOctArr[0]
if kPrgNum == 29 then
gkUpDownPrg1 -= 1
	if gkUpDownPrg1 <= 1 then
	gkUpDownPrg1 = 1
	endif
elseif kPrgNum == 25 then
gkUpDownPrg1 += 1
	if gkUpDownPrg1 >= 7 then
	gkUpDownPrg1 = 7
	endif
endif
if (kPrgNum == 25 || kPrgNum == 29) && kMidiTime < iDurReset then
gkUpDownPrg1 = 1
endif
if kPrgNum == 30 then
gkUpDownPrg2 -= 1
	if gkUpDownPrg2 <= 1 then
	gkUpDownPrg2 = 1
	endif
elseif kPrgNum == 26 then
gkUpDownPrg2 += 1
	if gkUpDownPrg2 >= 7 then
	gkUpDownPrg2 = 7
	endif
endif
if (kPrgNum == 26 || kPrgNum == 30) && kMidiTime < iDurReset then
gkUpDownPrg2 = 1
endif
if kPrgNum == 31 then
gkUpDownPrg3 -= 1
	if gkUpDownPrg3 <= -7 then
	gkUpDownPrg3 = -7
	endif
elseif kPrgNum == 27 then
gkUpDownPrg3 += 1
	if gkUpDownPrg3 >= 7 then
	gkUpDownPrg3 = 7
	endif
endif
if (kPrgNum == 31 || kPrgNum == 27) && kMidiTime < iDurReset then
gkUpDownPrg3 = 0
endif
if kPrgNum == 32 then
gkUpDownPrg4 -= 1
	if gkUpDownPrg4 <= 1 then
	gkUpDownPrg4 = 1
	endif
elseif kPrgNum == 28 then
gkUpDownPrg4 += 1
	if gkUpDownPrg4 >= 7 then
	gkUpDownPrg4 = 7
	endif
endif
if (kPrgNum == 32 || kPrgNum == 28) && kMidiTime < iDurReset then
gkUpDownPrg4 = 1
endif
xout gkUpDownPrg1, gkUpDownPrg2, gkUpDownPrg3, gkUpDownPrg4
endop


opcode  switchColor, S, k
kTrig xin
kIndx init 0
if kTrig == 1 then
kIndx = (kIndx+1)%2
endif
if kIndx == 0 then
kColor = 70
elseif kIndx == 1 then
kColor = 200
endif
Sout sprintfk "colour(%d,70,70)",kColor
xout Sout
endop

opcode  switchColork, k, k
kTrig xin
kIndx init 0
if kTrig == 1 then
kIndx = (kIndx+1)%2
endif
kOut = kIndx
xout kOut
endop

opcode rateCCk, k, kii
 kValue, iMin, iMax xin
 iDiff = iMax-iMin
 kOut = (kValue*iDiff)+iMin
 xout kOut
endop 



instr radioNoise
 aNoiseW noise 0.5, 0.5
 iTime = 1
 kGauss init 0.5
 aGauss gaussi 0.5, kGauss, 1000
 aNoise = aNoiseW+(aGauss)
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

instr noiseFb
if cabbageGet:k("prgmledh1") == 1 then
kMessIn cabbageGet "slider2"
kRngIn cabbageGet "slider3"
kFrqIn cabbageGet "slider4"
 kMess rateCCk kMessIn, 5, 70
 kRng rateCCk kRngIn, 10, 150
 kFrq rateCCk kFrqIn, 20, 100
 Sdata1 sprintfk "text(%d)", kMess
 Sdata2 sprintfk "text(%d)", kRng
 Sdata3 sprintfk "text(%d)", kFrq
 cabbageSet 1,"data3", Sdata1
 cabbageSet 1,"data4", Sdata2
 cabbageSet 1,"data6", Sdata3
 endif
    if cabbageGet:k("prgmledh2") == 1 then
    kRngMin rspline 1, 20, 1, 3
    kRngMax rspline 50, 100, 10, 20
    kRng = randomh:k(0,100,1) > 30 ? kRngMin : kRngMax
    kFrq rspline 20, 50, 1, 5
    kMess rspline 10, 50, 3, 7
    endif

 aGauss1 gausstrig 10, kRng, 0.8
 aGauss2 gaussi kRng/10, 0.2, kFrq
 aNoise = (aGauss1+aGauss2)*kMess
 aFb init 1
 aNoise = (aNoise*20)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, 0.2
    aOut dcblock2 aFb
;outall aOut*0.2
chnmix aOut, "out"
endin


instr mtrx
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


instr radioRecMachine
 kTime init 0
    if metro(1/1.25) == 1 then
    schedulek "mtrx", 0, 0.8, kTime+1, 2
    kTime = (kTime+1) % (giTableSize*0.8)
    endif
    if metro(1/giTableSize) == 1 then
    schedulek "radioRec", 0, giTableSize
    endif
endin

instr radioRec
 gkTableTime line 0, 1, 1
 ;aIn inch 1
 iStart random 0, 40
 aIn diskin "radio.wav", 1, iStart, 1
 aRadio linen aIn, 0.01, p3, 0.01
 aSound clip aRadio, 1, ampdb(-0.3)
 kMax max_k aSound, metro(50), 1
 cabbageSetValue "meter5", kMax, metro(50)
 chnmix aSound, "snd"
 aLine linseg 0, giTableLen, giTableLen*sr
 tablew aSound, aLine, giTable
endin


instr rvsMachine
 kTimeIn cabbageGet "slider5"
 kTime rateCCk kTimeIn, 1, 5
 if metro(1/kTime) == 1 then
 schedulek "radioRvrs", 0, kTime
 endif
 kTimeLED init 0
 kSpeed = (giTableSize*0.8)/kTime
 if metro(kSpeed) == 1 then
 kDur = (1/kSpeed) < 0.2 ? 0.2 : (1/kSpeed)
 schedulek "mtrx", 0, kDur, kTimeLED+1+16, 3
 kTimeLED = (kTimeLED+1) % (giTableSize*0.8)
endif
endin

instr radioRvrs
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aSound poscil 1, (1/giTableLen),  giTable,iPhase
 aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
 kMix = 1
 aMix ntrpol aSound,aRvrs, kMix
 aOut linen aMix, 0.05, p3, 0.05
 ;outall aOut
 chnmix aOut, "rvrs"
 chnmix aOut, "out"
endin




instr frzMachine
 kTimeIn cabbageGet "slider6"
 kTime rateCCk kTimeIn, 2, 8
    if metro(1/kTime) == 1 then
    printk -1, kTime
    schedulek "radioFrz", 0, kTime
    endif
 kTimeLED init 0
 kSpeed = (giTableSize*0.8)/kTime
    if metro(kSpeed) == 1 then
    kDur = (1/kSpeed) < 0.2 ? 0.2 : (1/kSpeed)
    schedulek "mtrx", 0, kDur, kTimeLED+1+(16*2), 4
    kTimeLED = (kTimeLED+1) % (giTableSize*0.8)
    endif
endin

instr radioFrz
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn poscil 1, (-1/giTableLen),  giTable,iPhase
 kTrig = randomh:k(0,100,p3/4) < 10 ? 0 : 1
 aFrz FrzMono aIn,kTrig
 aOut linen aFrz, 0.05, p3, 0.05
 chnmix aOut, "out"
endin


instr loopMachine
 kTimeIn cabbageGet "slider7"
 kTime rateCCk kTimeIn, 2, 10
 kRepIn cabbageGet "slider8"
 kRep = int(rateCCk:k(kRepIn, 2, 8))
    if metro(1/kTime) == 1 then
    printk -1, kTime
    kStart random i(gkTableTime), i(gkTableTime)+4
        kndx = 0
        while kndx < kRep do
        schedulek "loopRadio", (kTime/kRep)*kndx, kTime/kRep, kStart
        kndx += 1
        od
    endif
 kTimeLED init 0
 kSpeed = (giTableSize*0.8)/kTime
    if metro(kSpeed) == 1 then
    kDur = (1/kSpeed) < 0.2 ? 0.2 : (1/kSpeed)
    schedulek "mtrx", 0, kDur, kTimeLED+1+(16*3), 4
    kTimeLED = (kTimeLED+1) % (giTableSize*0.8)
    endif
endin

instr loopRadio
if cabbageGet:k("mpad7") == 0 then
turnoff
endif
iStart = p4
iPhase = iStart/giTableLen
aSound poscil 1, (1/giTableLen),  giTable,iPhase
aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
aMix ntrpol aSound,aRvrs, 1
aOut linen aMix, 0.05, p3, 0.05
;outall aOut
chnmix aOut, "out"
endin


instr tunerRadio
 aIn chnget "snd"
 kfr, kamp 	ptrack 		aIn, 1024,10
 kFrq = kfr
 
 kFrqFltrUp = 400
 kFrqFltrDown = 300
 kFrqPort = 20
 if cabbageGet:k("prgmledh2") == 1 then
 kFrqFltrUpIn   cabbageGet "slider4"
 kFrqFltrDownIn cabbageGet "slider3"
 kFrqPortIn cabbageGet "slider8"
 kFrqFltrUp     rateCCk kFrqFltrUpIn, 400, 999
 kFrqFltrDown   rateCCk kFrqFltrDownIn, 200, 900
 kFrqPort     rateCCk kFrqPortIn, 10, 200
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
 aSine poscil ampdb(kamp), kFrq
 aOut linen aSine, 0.01, p3, 0.01
; outall aSine*0.5
Schn sprintf "out%d", 1
chnmix aOut, "out"
 chnclear "snd"
endin



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
 kSpeedIn1 cabbageGet "slider17"
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
 schedulek "mtrx", 0, kDur, kTimeLED+1+(16*(p4-73)), 3
 kTimeLED = (kTimeLED+1) % (giTableSize*0.8)
endif
 aPlay  poscil 1, (kSpeed/giTableLen), iTabRec
 chnmix aPlay, "out"
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
 while indx < 24 do
 SmPad    sprintf "bounds(%d, %d, 50, 50),\
 channel(\"mpad%d\") colour:0(70, 70, 70) colour:1(120,180,250) text()", \
 iX+30, iY+290, indx+1
 cabbageCreate "button", SmPad 
 iX = (iX+55)
 indx += 1
    if (indx%4) == 0 then
    iY += 55
    iX = 0
    endif
    if (indx%8) == 0 then
    iY += 20
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < 24 do
 SKnob    sprintf "bounds(%d, %d, 70, 70),valueTextBox(0)\
 channel(\"slider%d\") range(0, 1, 0.5, 1, 0.001), text(%d)\
 colour(115, 135, 152, 255) markerColour(255, 255, 255, 255)\
 trackerColour(147, 180, 221, 255) fontColour(255, 255, 255, 255)",\
 iX+275+ispcx, iY+280, indx+1, indx+1
 cabbageCreate "rslider", SKnob 
 iX = (iX+70)
 indx += 1
    if (indx%4) == 0 then
    ispcx += 25
    endif
    if (indx%8) == 0 then
    iY += 130
    iX = 0
    ispcx = 0
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 24 do
 SLED    sprintf "bounds(%d, %d, 27, 27),\
 channel(\"prgmled%d\") colour:0(70, 70, 70) colour:1(120,180,250) text() visible(1)", \
 295+iX+ispcx, iY+30+ispcy, indx+1
 cabbageCreate "button", SLED 
 SLEDh    sprintf "bounds(%d, %d, 27, 27),\
 channel(\"prgmledh%d\") colour:0(70, 70, 70) colour:1(120,180,250) text() visible(0)", \
 295+iX+ispcx, iY+30+ispcy, indx+1
 cabbageCreate "button", SLEDh
  iX += 31
  indx += 1
    if (indx%4) == 0 then
    ispcx += 5
    endif
    if (indx%4) == 0 then
    iY += 31
    iX = 0
    ispcx = 0
    endif
    if (indx%8) == 0 then
    ispcy += 5
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 128 do
 Smtrx    sprintf "bounds(%d, %d, 20, 20),\
 channel(\"mtrx%d\") colour(70, 70, 70)", \
 435+iX+ispcx, iY+30+ispcy, indx+1
 cabbageCreate "image", Smtrx 
  iX += 24
  indx += 1
    if (indx%4) == 0 then
    ispcx += 5
    endif
    if (indx%16) == 0 then
    iY += 24
    iX = 0
    ispcx = 0
    endif
    if (indx%64) == 0 then
    ispcy += 5
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 96 do
 SLEDknob    sprintf "bounds(%d, %d, 15, 15),\
 channel(\"ledknob%d\") colour(70, 70, 70)", \
 292+iX+ispcx, iY+360+ispcy, indx+1
 cabbageCreate "image", SLEDknob 
  iX += 20
  indx += 1
    if (indx%16) == 0 then
    iX = 0
    iY += 20
    ispcx = -55
    endif
    if (indx%2) == 0 then
    ispcx += 30
    endif
    if (indx%8) == 0 then
    ispcx += 25
    endif
    if (indx%32) == 0 then
    ispcy += 92
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

