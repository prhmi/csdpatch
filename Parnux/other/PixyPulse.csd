<Cabbage>
form caption("PixyCoreLa")    size(1075, 600)   guiMode("queue") colour(45,20,45) pluginId("pxcr") ; style("legacy")
vslider bounds(786, 432, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(245,230,245)
vslider bounds(828, 432, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(245,230,245)
vslider bounds(868, 432, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(245,230,245)
vslider bounds(910, 432, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(245,230,245)
nslider bounds(792, 398, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(70, 50, 70)
nslider bounds(832, 398, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(70, 50, 70)
nslider bounds(872, 398, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(70, 50, 70)
nslider bounds(912, 398, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(70, 50, 70)
nslider bounds(960, 364, 93, 44) channel("gain") range(-90, 50, 0, 1, 1)    colour(70, 50, 70) text("Master Gain (dB)")
label bounds(802, 50, 239, 66) channel("sec") text("00 : 03") fontColour(245, 220, 245)
button bounds(922, 18, 116, 27) channel("start") value(1) text("S  T  A  R  T", "S  T  O  P")  colour:0(171, 81, 152, 255) colour:1(99, 85, 85, 255)
image bounds(1024, 258, 20, 20) channel("morseplight") corners(2) colour(10, 10, 10)
vslider bounds(442, 412, 50, 150)   channel("amp1") range(0, 30, 20, 1, 1) trackerColour(245, 230, 245, 255) text("nAmp")
vslider bounds(496, 412, 50, 150)   channel("amp2") range(0, 20, 10, 1, 1) trackerColour(245, 230, 245, 255) text("wgAmp")
vslider bounds(550, 412, 50, 150)   channel("amp3") range(0, 20, 10, 1, 1) trackerColour(245, 230, 245, 255) text("wgAmp")
vslider bounds(602, 412, 50, 150)   channel("amp4") range(0, 20, 10, 1, 1) trackerColour(245, 230, 245, 255) text("wgAmp")
label bounds(456, 214, 90, 40) channel("data1") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
label bounds(552, 214, 90, 40) channel("data2") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
label bounds(456, 274, 90, 40) channel("data3") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
label bounds(552, 274, 90, 40) channel("data4") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
label bounds(456, 334, 90, 40) channel("data5") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
label bounds(552, 334, 90, 40) channel("data6") fontColour(245, 220, 245) colour(70, 50, 70) text("")  
nslider bounds(904, 354, 49, 38) channel("chnls") range(1, 8, 2, 1, 1) colour(70, 50, 70) text("chns")
texteditor bounds(680, 214, 364, 40) channel("morsetxt") colour(200, 170, 200, 200) colour:0(200, 170, 200, 200)fontSize(26) text("some one")
nslider bounds(686, 262, 70, 44) channel("morsebpm") range(30, 200, 124, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("Tempo")
nslider bounds(758, 262, 68, 43) channel("morsefrq") range(200, 2000, 1200, 1, 1) colour(70, 50, 70, 255) fontColour(241, 178, 178, 255) text("Frq")
nslider bounds(830, 262, 68, 43) channel("morseamp") range(-90, -15, -22, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("Amp")
nslider bounds(900, 262, 68, 43) channel("morsefilt") range(500, 9000, 5000, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("lopF")




vmeter bounds(964, 432, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(988, 432, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1012, 432, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1036, 432, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(964, 418, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(988, 418, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1012, 418, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1036, 418, 15, 15) channel("clip4") colour(0, 0, 0, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-m128 -+rtmidi=null -M0	-M999; -dm0  -n    ;-d  -m0d -Q0 --midi-key=4
-dm0 -n --midi-key=4 --midi-velocity=5 -+rtmidi=null -M0 -Q0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0

massign 1, 2
pgmassign 0, 0
ctrlinit 1,58,64
;massign 1, 1
;massign 8, 8

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
if kNum >= 75 && kNum <= 82 then
kCConOff = kData
	if kData != 0 then
	kCConOff = 1
	endif
endif
	xout kCCnum, kCConOff
endop
gkPrgRepArr[] init 2
gkPrgmIndx init 0
opcode setprgm, k, k
kPrgNum xin
gkPrgRepArr[0] = 0
gkPrgRepArr[1] = 0
gkPrgRepArr[gkPrgmIndx] = kPrgNum

kPrgNumOut = kPrgNum
if gkPrgmIndx == 0 then
gkPrgRepArr[1] = 0
endif
gkPrgmIndx = (gkPrgmIndx+1) % 2
xout kPrgNumOut
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



opcode morseLetter, i[],i
iChar xin
 iMorseArr_A[] fillarray 1,2
 iMorseArr_B[] fillarray 2,1,1,1
 iMorseArr_C[] fillarray 2,1,2,1
 iMorseArr_D[] fillarray 2,1,1
 iMorseArr_E[] fillarray 1
 iMorseArr_F[] fillarray 1,1,2,1
 iMorseArr_G[] fillarray 2,2,1
 iMorseArr_H[] fillarray 1,1,1,1
 iMorseArr_I[] fillarray 1,1
 iMorseArr_J[] fillarray 1,2,2,2
 iMorseArr_K[] fillarray 2,1,2
 iMorseArr_L[] fillarray 1,2,1,1
 iMorseArr_M[] fillarray 2,2
 iMorseArr_N[] fillarray 2,1
 iMorseArr_O[] fillarray 2,2,2
 iMorseArr_P[] fillarray 1,2,2,1
 iMorseArr_Q[] fillarray 2,2,1,2
 iMorseArr_R[] fillarray 1,2,1
 iMorseArr_S[] fillarray 1,1,1
 iMorseArr_T[] fillarray 2
 iMorseArr_U[] fillarray 1,1,2
 iMorseArr_V[] fillarray 1,1,1,2
 iMorseArr_W[] fillarray 1,2,2
 iMorseArr_X[] fillarray 2,1,1,2
 iMorseArr_Y[] fillarray 2,1,2,2
 iMorseArr_Z[] fillarray 2,2,1,1
    if iChar == 97 then
    iMorseArr[] = iMorseArr_A
    elseif iChar == 98 then
    iMorseArr[] = iMorseArr_B
    elseif iChar == 99 then
    iMorseArr[] = iMorseArr_C
    elseif iChar == 100 then
    iMorseArr[] = iMorseArr_D
    elseif iChar == 101 then
    iMorseArr[] = iMorseArr_E
    elseif iChar == 102 then
    iMorseArr[] = iMorseArr_F
    elseif iChar == 103 then
    iMorseArr[] = iMorseArr_G
    elseif iChar == 104 then
    iMorseArr[] = iMorseArr_H
    elseif iChar == 105 then
    iMorseArr[] = iMorseArr_I
    elseif iChar == 106 then
    iMorseArr[] = iMorseArr_J
    elseif iChar == 107 then
    iMorseArr[] = iMorseArr_K
    elseif iChar == 108 then
    iMorseArr[] = iMorseArr_L
    elseif iChar == 109 then
    iMorseArr[] = iMorseArr_M
    elseif iChar == 110 then
    iMorseArr[] = iMorseArr_N
    elseif iChar == 111 then
    iMorseArr[] = iMorseArr_O
    elseif iChar == 112 then
    iMorseArr[] = iMorseArr_P
    elseif iChar == 113 then
    iMorseArr[] = iMorseArr_Q
    elseif iChar == 114 then
    iMorseArr[] = iMorseArr_R
    elseif iChar == 115 then
    iMorseArr[] = iMorseArr_S
    elseif iChar == 116 then
    iMorseArr[] = iMorseArr_T
    elseif iChar == 117 then
    iMorseArr[] = iMorseArr_U
    elseif iChar == 118 then
    iMorseArr[] = iMorseArr_V
    elseif iChar == 119 then
    iMorseArr[] = iMorseArr_W
    elseif iChar == 120 then
    iMorseArr[] = iMorseArr_X
    elseif iChar == 121 then
    iMorseArr[] = iMorseArr_Y
    elseif iChar == 122 then
    iMorseArr[] = iMorseArr_Z
    elseif iChar == 32 then
    iMorseArr[] fillarray 5
    else
    iMorseArr[] fillarray 1
    endif
  xout iMorseArr  
 endop

opcode rateCCk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = (kValue*iDiff)+iMin
xout kOut
endop 


opcode rateSliderk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = ((kValue-iMin)/iDiff)
if kOut >= 1 then
kOut = 1
endif
if kOut <= 0 then
kOut = 0
endif
xout kOut
endop 


opcode rateSlideri, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut = ((iValue-iMin)/iDiff)
if iOut >= 1 then
iOut = 1
endif
if iOut <= 0 then
iOut = 0
endif
xout iOut
endop 


opcode rateCCi, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut = (iValue*iDiff)+iMin
xout iOut
endop 







 giSine ftgen 0, 0, 2^12, 10, 1 

opcode buzzSound, a, i
 iAmpdb xin 
 iAmp ampdb iAmpdb
 iFrq random 5, 80
kfreq rspline iFrq, iFrq+5, 5, 7
kMul rspline 0.3, 0.7, 7, 12
aSound gbuzz .1, kfreq, 1, 20, kMul, giSine
 aEnv linen aSound*iAmp, p3/10, p3, p3/10
 aOut clfilt aEnv, 100, 1, 10
xout aOut
endop



opcode barSound, a, i
 iAmpdb xin 
 iAmp ampdb iAmpdb
  p3 random 2, 5
 iMod = int(random:i(1, 6))
 iFrq random 10, 200
    if iMod == 1 then
    iDur1 = 0.077
    iscan  = 0.175
    iDur2 = 20
    aRing poscil 1, iFrq
    elseif iMod == 2 then
    iDur1 = 0.4
    iscan  = 70
    iDur2 =  1
    aRing init 1
    elseif iMod == 3 then
    iDur1 random 0.1, 0.7
    iscan  random 50, 70
    iDur2 random 1, 10
    aRing poscil 1, iFrq
    elseif iMod == 4 then
    iDur1 = 1
    iscan = 0.008
    iDur2 random 0.1, 1
    aRing init 1
    elseif iMod == 5 then
    iDur1 = 0.077
    iscan  random 30, 50
    iDur2 random 0.1, 20
    aRing init 1
    endif
 iK = 125
 ipos =  0.837 
 ivel = 18000
 iwid = 0.016
 aSound 	barmodel 	1, 1, iK, iDur1, iscan,   iDur2, ipos, ivel, iwid
 aOut = aSound*aRing*iAmp
xout aOut
endop

opcode bamSound, a, i
 iAmpdb xin 
 iAmp ampdb iAmpdb
 iFrq random 400, 500
 iFilter random 3000, 4000
 iAtt random 1/1000, 1/10
 aEnv transeg 0, iAtt, 6, 1, p3-iAtt, -6, 0
 iNumber random 0.4, 5
 iDamp random 1/500, 1/100
 iDecay random 1/500, 1/100
 aSound  bamboo 1000, iDecay, iNumber, iDamp, 1, iFrq, 20
 aFilt clfilt aSound, iFilter, 1, 10
 aOut = aFilt*aEnv*iAmp
xout aOut
endop

opcode shakeSound, a, i
 iAmpdb xin 
 iAmp ampdb iAmpdb
 iRel random 0.1, 1
 aEnv linsegr 1, iRel, 0
 knum  rspline 2, 15, 2, 7
 kFrq rspline 700, 3000, 2, 15
 asig shaker .05, kFrq, 8, 0.9, knum
 iFilter random 300, 1200
 aFilt clfilt asig*aEnv, iFilter, 1, 10	
 aOut = aFilt*iAmp	
xout aOut
endop

opcode pluckSound, a, i
 iAmpdb xin 
 iAmp ampdb iAmpdb
 iAtt random 0.008, 0.01
 iRel random 0.1, 1
 SOut = "sndseq"
 iResample random 20, 1500
    if p4 == 0 then
    iFrq random 30, 1500
    elseif p4 == 1 then
    iFrq random 30, 1500
    elseif p4 == 2 then
    kPluck ctrl7 10, 63, 0, 1
        if kPluck == 0 then
        turnoff
        endif
    iFrq random 1000, 3000
    iResample random 800, 1000
    iAmp ampdb 5
    SOut = "snddust"
    endif  
   aEnv linsegr 0, iAtt, 1, iRel, 0
 iMeth = random:i(0, 100) < 50 ? 1 : 6
 aSound  pluck iAmp, iFrq, iResample, 0, iMeth;, 2, 1
 iFilter random 300, 1500
 aFilt clfilt aSound*aEnv, iFilter, 0, 10	
 aFilt clfilt aSound*aEnv, 200, 1, 10
 aOut = aFilt*iAmp
xout aOut
endop
;;drum
opcode kick, a,i
iAmpIn xin
p3 = 0.15
iAmp ampdb iAmpIn
aEnv linseg 1,p3,0.001 
iFrq random 90, 100
kFrq expon iFrq,p3,72
aSound poscil aEnv*iAmp,kFrq 
xout aSound
endop

opcode bass, a,ii
iAmpIn,iClip xin
p3 = 1
iAmp ampdb iAmpIn
iFrqRnd random 60, 90
kFrq expon iFrqRnd,p3,60
aSound poscil iAmp,kFrq 
iRndLFO random 3, 6
kLFOFrq rspline 2, 4, 1, 7
aLFO lfo 1, kLFOFrq, 1
aOut linen aSound*aLFO, p3/5, p3, p3/5
aClip clip aOut, 1, iClip
xout aClip
endop


opcode snare, a,i
iAmpIn xin
p3 random 0.3, 0.7
iAmp ampdb iAmpIn
aEnv expon 1, p3, 0.001
aNse noise 1, 0
iFilt random 100, 8000
aNse tone aNse, iFilt
iFrq random 100, 150
iHigh random 0, 300
kFrq expon iFrq, p3, iFrq+iHigh
aJit randomi 0.2, 1.3, 50000
aSound poscil aEnv, kFrq*aJit
iNoise random 0.01, 0.1
aSum sum aNse*iNoise, aSound
aRes comb aSum, 0.01, 0.003
aOut = aRes*iAmp*aEnv
xout aOut
endop

opcode hihat, a,i
iAmpIn xin
iAmp ampdb iAmpIn
p3 random 0.1, 0.3
aEnv expon 1,p3,0.001
aNse noise aEnv, 0
iFilt random 6000, 12000
aFilt buthp aNse*iAmp*0.5, iFilt
aSound buthp aFilt, iFilt 
xout aSound
endop



;#include "pixy.udo"


instr noiseRnd
 kAmpdB ampdb 0
 iAtt random 0.2, 0.5
 iRel random 0.2, 0.5
 aEnv linsegr 0, iAtt, 1, iRel, 0
 kSpeedMin = 2; cabbageGet "spdstrngmin"
 kSpeedMax = 5 ;cabbageGet "spdstrngmax"
 iDelayTime  random 0.1, 0.25
 kFb = 50 ;cabbageGet "noisepress"
 aNoise noise 1, 0.5
 aNoise = aNoise*5
 aFb init 1
 aNoise = (aNoise*kFb)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, iDelayTime
 iMidi random 40, 90
 iFrq mtof iMidi
 kRngIn = 10; cabbageGet "noiserng"
 kRng = cent(kRngIn)-1
 kFilterMin = (iFrq*(1-kRng))*2
    if kFilterMin <= 200 then
    kFilterMin = 200
    endif
 kFilterMax = (iFrq*(1+kRng))*2
    if kFilterMax >= 12000 then
    kFilterMax = 12000
    endif
 kFilt cabbageGet "slider1"
 kFilt rateCCk kFilt, 500, 5000
 aFilt clfilt aFb, kFilterMax+kFilt, 0, 10
 aFilt  clfilt aFilt, kFilterMin, 1, 10
 aOut = aFilt*kAmpdB*aEnv
 outall aOut
endin



instr noiseMidi
iMidi notnum
iFilterCopy cabbageGetValue "slider1"
iNum notnum
iFilter rateSlideri iNum, 36, 43
cabbageSetValue "slider1", iFilter
    if release() == 1 then
    cabbageSetValue "slider1", k(iFilterCopy)
    endif
endin



instr noisePlay

if cabbageGet:k("mtrx33") == 1 then
 kMessIn   cabbageGet "slider1"
 kRngIn    cabbageGet "slider2"
 kFrqIn    cabbageGet "slider3"
 kFilMinIn cabbageGet "slider5"
 kFilMaxIn  cabbageGet "slider6"
 kMess     rateCCk kMessIn, 5, 200
 kRng      rateCCk kRngIn, 5, 200
 kFrq      rateCCk kFrqIn, 30, 120
 kFilterMin rateCCk kFilMinIn, 200, 3000
 kFilterMax rateCCk kFilMaxIn, 600, 8000
elseif cabbageGet:k("mtrx34") == 1 then
    kMess rspline 10, 50, 3, 7
    kRngMin rspline 1, 20, 1, 3
    kRngMax rspline 50, 100, 10, 20
    kRng = randomh:k(0,100,1) > 30 ? kRngMin : kRngMax
    kFrq rspline 20, 50, 1, 5
    kFilterMin rspline 100, 500, 2, 7
    kFilterMax rspline 700, 1200, 2, 7
else
turnoff
endif
 aGauss1 gausstrig 5, kRng, 0.8
 aGauss2 gaussi kRng/10, 0.2, kFrq
 aNoise = (aGauss1+aGauss2)*20
 aFb init 1
 aNoise = (aNoise*kMess)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, 0.2
    aDc dcblock2 aFb
;    kFilterMax = 8000
;    kFilterMin = 500
 aFilt clfilt aDc, kFilterMax, 0, 10
 aOut  clfilt aFilt, kFilterMin, 1, 10
chnmix aOut*0.3, "out"
endin


;schedule "noisePlay", 0, 9999



instr pulseMachine
if metro(1) == 1 then
schedulek "pulseSound", 0, 1
endif
endin


;schedule "pulseMachine", 0, 9999


instr pulseSound
iFrq = p4
kPulseMinIn     cabbageGet "slider1"
kPulseMaxIn     cabbageGet "slider2"
kFrqIn          cabbageGet "slider3"
kDurIn          cabbageGet "slider4"
kSpdMinIn       cabbageGet "slider5"
kSpdMaxIn       cabbageGet "slider6"
kDelGain        cabbageGet "mpad5"
kRvrbGain       cabbageGet "mpad6"
kPulseMin       rateCCk kPulseMinIn, 1, 1/50
kPulseMax       rateCCk kPulseMaxIn, 1/50, 1/700
kFrq            rateCCk kFrqIn, 200, 1200
kDur            rateCCk kDurIn, 1, 10
kSpdMin         rateCCk kSpdMinIn, 1,7
kSpdMax         rateCCk kSpdMaxIn, 2, 15



kFrq = int(kFrq*1000)/1000
if kDur <= p3-0.01 then
;kDur = p3-0.01
endif
kRndPulse rspline kPulseMin, kPulseMax, kSpdMin, kSpdMax
kRndPulse = int(kRndPulse*1000)/1000
;printk2 kRndPulse
if kPulseMax < 1/200 then
kRndPulse rspline kPulseMax*3, kPulseMax*2.4, kSpdMin, kSpdMax
kRndPulse = int(kRndPulse*1000)/1000
endif
if kRndPulse <= 1/700 then
kRndPulse = 1/700
endif
	aPulse mpulse 0.7, kRndPulse
 iFeedback init 0.5
 kDelayTime rspline 0.2, 1, 0.7, 3
 aTim	interp	kDelayTime
 abuf	delayr	2
 aDelay	deltapi	aTim	
 delayw	aPulse + (aDelay*iFeedback)
aRvrb nreverb aPulse, 1, 0.4
aSum = aPulse+(aDelay*kDelGain)+(aRvrb*kRvrbGain*0.5)
	aFilt mode aSum, kFrq, kDur
;	aClip clip aFilt, 0.5, 0.5
	outall aFilt
endin

;schedule "pulseSound", 0, 9999

instr jikjikMachine
kMoses cabbageGet "slider5"
kActive active "jikjikSound"
kTime init 1
if metro(kTime) == 1 || changed(kMoses) == 1 && kActive == 0 then
kTimeMin random 3, 12
kTimeMax random 1/10, 1/7
kTime = random:k(0,100) < kMoses*100 ? kTimeMin : kTimeMax
kDur = (1/kTime)*0.7
  if kDur >= 0.5 then
  kDur random 0.1, 0.3
  endif
  schedulek "jikjikSound", 0, kDur
endif
aIn chnget "jik"
kRvrbSize = 0.7
kRvrbRoom = 15000
 aRvrb,aRvrb  reverbsc aIn,aIn, kRvrbSize, kRvrbRoom, sr, 0.7, 1
 aMix ntrpol aIn, aRvrb, 0.3
outall aMix
chnclear "jik"
endin

;schedule "jikjikMachine", 0, 9999


instr jikjikSound
iAmp random 0.4, 0.7
iAtt = 0.01
if p3 <= iAtt*2 then
print p3
endif
aEnv transeg 0, iAtt, 4, iAmp, p3-(iAtt*2), 1, iAmp, iAtt, -4, 0
iFrqInMin random 2000, 3000
iFrqInMax random 3000, 4000
iFrqIn = random:i(0,100) < 10 ? iFrqInMin : iFrqInMax
iFrqRnd = int(iFrqIn/100)*100
iFrq = random:i(0, 100) < 30 ? iFrqRnd : 2856
iRndGlissMin random 50, 200
iRndGlissMin = int(iRndGlissMin/10)*10
iRndGlissMax random 200, 800
iRndGlissMax = int(iRndGlissMax/100)*100
iRvrs = random:i(0,100) > 50 ? -1 : 1
iGlissRnd = random:i(0,100) > 30 ? iRndGlissMin : iRndGlissMax
iGliss = random:i(0,100) < 10 ? iGlissRnd : 300
if iRvrs == -1 && iGliss > 200 then
iGliss = 200
endif
iRate random 1, 6
kFrq transeg iFrq, p3,iRate*iRvrs, iFrq+(iGliss*iRvrs)
aSound poscil aEnv,kFrq
kRmIn cabbageGet "slider7"
kDelayIn cabbageGet "slider8"
kRm rateCCk kRmIn, 0, 0.01
kDelay rateCCk kDelayIn, 0, 1
aRm lfo iAmp, iFrq*kRm, 3
aOut = aSound*aRm*aEnv

 iFeedback init 0.7
 kDelayTime rspline 0.01, 0.05, 12, 20
 aTim	interp	kDelayTime
 abuf	delayr	2
 aDelay	deltapi	aTim	
 delayw	aOut + (aDelay*iFeedback)
chnmix aOut+(aDelay*aEnv*kDelay), "jik"
;outall aOut
endin



instr seqMachine

kTimeMinIn    cabbageGet "slider1"
kTimeMaxIn    cabbageGet "slider2"
kDelIn      cabbageGet "slider3"
kDelDiff    cabbageGet "slider4"
kDelGain    cabbageGet "mpad5"

kDelIn      rateCCk kDelIn, 0.01, 0.7
kDelDiff    rateCCk kDelDiff, 0, 0.2
kTimeMin    rateCCk kTimeMinIn, 1, 8
kTimeMax    rateCCk kTimeMaxIn, 1, 12
kSpdMin    rateCCk kTimeMinIn, 2, 7
kSpdMax    rateCCk kTimeMaxIn, 5, 12

kTime init 1
if metro(kTime) == 1 then
kTime random kTimeMin, kTimeMax
    if kTimeMax < kTimeMin then
    kTime = kTimeMin
    endif
kDur random 0.2, 2
schedulek "seqSound", 0, kDur
endif




aIn chnget "seqsnd"
 iFeedback init 0.4
 kDelayTime rspline kDelIn, kDelIn+kDelDiff, kSpdMin, kSpdMax
 aTim	interp	kDelayTime
 abuf	delayr	5
 aDelay	deltapi	aTim	
 delayw	aIn + (aDelay*iFeedback)
aDelMix ntrpol aIn, aDelay, kDelGain

kRvrbSize = 0.7
kRvrbRoom = 15000
 aRvrb,aRvrb  reverbsc aIn,aIn, kRvrbSize, kRvrbRoom, sr, 0.7, 1
 aMix ntrpol aDelMix, aRvrb, 0.3
outall aMix
chnclear "seqsnd"
endin

;schedule "seqMachine", 0, 9999


instr seqSound
iSound = int(random:i( 1, 6))
if iSound == 1 then
aSound buzzSound    -15
elseif iSound == 2 then
aSound barSound     -7
elseif iSound == 3 then
aSound bamSound     -15
elseif iSound == 4 then
aSound shakeSound    0
elseif iSound == 5 then
aSound pluckSound   -10
endif
chnmix aSound, "seqsnd"
endin




instr fbSound
aAmp init 1
kSpdMin     cabbageGet "slider1"
kSpdMax     cabbageGet "slider2"
kRng1       cabbageGet "slider3"
kRng2       cabbageGet "slider4"
kRsMin      cabbageGet "slider5"
kRsMax      cabbageGet "slider6"
kFiltMin    cabbageGet "slider7"
kFiltMax    cabbageGet "slider8"
kSeqFB      cabbageGet "mpad6"
kSpdMin     rateCCk kSpdMin, 0.2, 3
kSpdMax     rateCCk kSpdMax, 0.4, 8
kRng1       rateCCk kRng1, 0.1, 1
kRng2       rateCCk kRng2, 0.1, 1
kRsMin      rateCCk kRsMin, 400, 4000
kRsMax      rateCCk kRsMax, 4000, 7000
kFiltMin    rateCCk kFiltMin, 300, 800
kFiltMax    rateCCk kFiltMax, 800, 3000

if kSeqFB == 0 then
aSound      rand 1/100
elseif kSeqFB == 1 then
aSoundIn chnget "seqsnd"
aSound = aSoundIn/1000
endif
  adRnd1     rspline 0.08, kRng1, kSpdMin, kSpdMax
 adRnd2     rspline 0.01, kRng2, kSpdMin, kSpdMax
 aBuffer    delayr    5
 ad1        deltapi   adRnd1
 ad2        deltapi   adRnd2
 a3 init 0
 krms      rms       a3
           delayw    aSound+(exp(-krms)*a3)
 a3        reson     (ad1+ad2)*-1, kRsMin, kRsMax, 1
 aFilt clfilt a3, kFiltMax, 0, 10
 aFilt clfilt aFilt, kFiltMin, 1, 10
 aOut = aFilt*aAmp
 outall aOut
;chnmix aOut, "sndwg"
;chnclear "seqsnd"
endin

;schedule "fbSound", 0, 999



instr drumMachine
kTimeMinIn    cabbageGet "slider1"
kTimeMaxIn    cabbageGet "slider2"
kTimeMin    rateCCk kTimeMinIn, 3, 17
kTimeMax    rateCCk kTimeMaxIn, 3, 17
kTime init 1
kCount init 0
if metro(kTime) == 1 then
kTime random kTimeMin, kTimeMax
    if kTimeMax < kTimeMin then
    kTime = kTimeMin
    endif
schedulek "drumSound", 0, 0.1, kCount
endif
kCount += 1
endin

;schedule "drumMachine", 0, 999

instr drumSound
iMosesIn    cabbageGetValue "slider3"
iMoses    rateCCi iMosesIn, 40, 80
iRnd = int(random:i( 1, 5))
iSound = random:i(0,100) > iMoses ? 1 : iRnd
if iSound == 1 then
aSound hihat        -7
elseif iSound == 2 then
aSound snare        0
elseif iSound == 3 then
aSound kick         0
elseif iSound == 4 && (p4%12) == 0 then
iClip random 0.1, 1
aSound bass        -7, iClip
endif

outall aSound
endin




instr morseRead
 Stype = p4
 puts Stype, 1
 iLenLetter       strlen     Stype 
 iTypeArr[] init iLenLetter
 indx = 0	
 while indx < iLenLetter do
 ichr       strchar    Stype, indx
 iTypeArr[indx]  = ichr
 indx += 1
 od
 iLetterIndx = p5
 iChr = iTypeArr[iLetterIndx]
 iMorseArr[] morseLetter iChr
    kMorseIndx init 0
    kTime init 1
    iBPM cabbageGetValue "morsebpm" ; 120
    iTempo = iBPM/60
    if metro(1/kTime) == 1 then
    kTime = (iMorseArr[kMorseIndx])/(iTempo*4)
    schedulek "morseSound", 0, kTime*0.5, iChr
    kMorseIndx += 1
    endif
    if kMorseIndx == lenarray(iMorseArr) && changed(kMorseIndx) == 1 then  
        if iLetterIndx < iLenLetter-1 then
        schedulek "morseRead", 0.5, 9999, Stype, iLetterIndx+1 
        endif
        if iLetterIndx >= iLenLetter-1 then
        schedulek "morseSound", 0.1, 0.1, 200
        endif
    turnoff    
    endif
endin






instr morseSound
 iFrq cabbageGetValue "morsefrq"
 iMorseNoise cabbageGetValue "morsenoise"
 iMorseSine cabbageGetValue "morsesine"
 iNoiseGain = iMorseNoise
 iSineGain = iMorseSine
 iAmpIn cabbageGetValue "morseamp"
 iAmp ampdb iAmpIn
    if p4 == 32 then
    iGain = 0
    elseif p4 == 200 then
    iGain = 0
    cabbageSet 1,"morseplight","colour(10, 10, 10)"
    else
     cabbageSet "morseplight","colour(245, 150, 245)"
    iGain = 1
    endif
 iAtt = 0.01
 iTest = (p3-iAtt)-(iAtt*2)
 aEnv linseg 0,iAtt,iAmp,(p3-iAtt)-(iAtt*2),iAmp,iAtt,0
 aSound poscil aEnv, iFrq
 aNoise noise aEnv, 0.9
 iFilter cabbageGetValue "morsefilt"
 aNoiseF clfilt  aNoise, iFilter, 0, 10
 aNoiseOut clfilt aNoiseF, iFilter*0.9, 1, 10
 aOut = ((aSound*0.7)+(aNoiseOut*0.5))*iGain
 chnmix aOut, "out"
 ;outall aOut

if release() == 1 && p4 != 200 then
cabbageSet 1,"morseplight","colour(120, 100, 120)"
endif
endin


instr prgmLED
 iPrgNum = p4
    indx = 32
    while indx < 48 do
    Sprgnum sprintf "mtrx%d",indx
    cabbageSet Sprgnum, "colour(70,70,70)"
    cabbageSetValue Sprgnum, 0
    indx += 1
    od
    Sprgnum sprintf "mtrx%d",iPrgNum
    cabbageSet Sprgnum, "colour(180,120,180)"
    cabbageSetValue Sprgnum, 1
endin


instr widgetWrite
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < 16 do
 SKnob    sprintf "bounds(%d, %d, 70, 70),valueTextBox(0)\
 channel(\"slider%d\") range(0, 1, 0, 1, 0.01), text(%d)\
 markerColour(255, 255, 255, 255) trackerColour(245,230,245) colour(150, 120, 150)",\
 iX+50+ispcx, iY+30, indx+1, indx+1
 cabbageCreate "rslider", SKnob 
 iX = (iX+100)
 indx += 1
    if (indx%8) == 0 then
    iY += 220
    iX = 0
    ispcx = 0
    endif
    if (indx%4) == 0 then
    iY += 80
    iX = 0
    ispcx = 0
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 while indx < 32 do
 SmPad    sprintf "bounds(%d, %d, 40, 40),\
 channel(\"mpad%d\") colour:0(70, 70, 70) colour:1(180,100,180) text()", \
 iX+42, iY+200, indx+1
 cabbageCreate "button", SmPad 
 iX = (iX+45)
 indx += 1
    if (indx%2) == 0 then
    iX += 10
    endif
    if (indx%16) == 0 then
    iY += 10
    endif
    if (indx%8) == 0 then
    iY += 30
    iX = 0
    endif
    if (indx%8) == 0 then
    iY += 15
    endif
 od
  iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 48 do
 Smtrx    sprintf "bounds(%d, %d, 20, 20),\
 channel(\"mtrx%d\") colour(70, 70, 70)", \
 453+iX+ispcx, iY+35+ispcy, indx+1
 cabbageCreate "image", Smtrx 
  iX += 24
  indx += 1
    if (indx%4) == 0 then
    ispcx += 5
    endif
    if (indx%8) == 0 then
    iY += 24
    iX = 0
    ispcx = 0
    endif
    if (indx%16) == 0 then
    ispcy += 5
    endif
 od
 
endin
schedule "widgetWrite", 0, 1


instr speaker
aIn chnget "out"
outall aIn
chnclear "out"
endin

instr record
SFilenames[] directory "./record", ".wav"
iLen lenarray SFilenames
print iLen
SrecordFile sprintf "record/record%d.wav", iLen
aInArr[] monitor
aIn = aInArr[0]
fout SrecordFile, 8, aIn
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

instr Widgets
 iDurMaster = 9^9
 kStart cabbageGet "start"
    if kStart == 1 && changed(kStart) == 1  then
    schedulek "time", 0, iDurMaster
    schedulek "speaker", 0, iDurMaster
    elseif kStart == 0 && changed(kStart) == 1 then
    turnoff2 "time", 0, 0
    endif
  Stype cabbageGet "morsetxt"
  
  
  kType, kChn, kNum, kData midiin
if kType == 176 && kNum > 50 then ;;cc
kNumCC, kDataCC setcc kNum,kData
	if changed(kNumCC,kDataCC) == 1 then
	printks  "num=%d, value=%d\\n", -1, kNumCC,kDataCC
	SCCnum sprintfk "mpad%d",(kNumCC-50)
	cabbageSetValue SCCnum, kDataCC
	endif
elseif kType == 176 && kNum <= 34 then
SsliderNum sprintfk "slider%d",kNum-10
cabbageSetValue SsliderNum , kData/127
elseif kType == 192 then ;;prg
	kPrgNum setprgm kNum+32
	schedulek "prgmLED", 0, 0.1, kPrgNum
endif


  
  
 if kStart == 1 then
    if changed(cabbageGet:S("morsetxt")) == 1  then
    turnoff2 "morseRead", 0, 0
    turnoff2 "morseSound", 0, 0
    schedulek "morseRead", 0, 9999, Stype, 0
    endif 
    if      cabbageGet:k("mpad1") == 1 && changed(cabbageGet:k("mpad1")) == 1 then
        kIndx = 0
        kRndNumber random 3, 10
        while kIndx < kRndNumber do
        schedulek "noiseRnd", 0, 999
        kIndx += 1
        od
    elseif  cabbageGet:k("mpad1") == 0 && changed(cabbageGet:k("mpad1")) == 1 then
    turnoff2 "noiseRnd", 0, 0
    endif
    if      cabbageGet:k("mpad2") == 1 && changed(cabbageGet:k("mpad2")) == 1 then
    schedulek "noisePlay", 0, iDurMaster
    elseif  cabbageGet:k("mpad2") == 0 && changed(cabbageGet:k("mpad2")) == 1 then
    turnoff2 "noisePlay", 0, 0
    endif
    if      cabbageGet:k("mpad3") == 1 && changed(cabbageGet:k("mpad3")) == 1 then
    schedulek "pulseMachine", 0, iDurMaster
    elseif  cabbageGet:k("mpad3") == 0 && changed(cabbageGet:k("mpad3")) == 1 then
    turnoff2 "pulseMachine", 0, 0
    turnoff2 "pulseSound", 0, 0
    endif
    if      cabbageGet:k("mpad4") == 1 && changed(cabbageGet:k("mpad4")) == 1 then
    schedulek "jikjikMachine", 0, iDurMaster
    elseif  cabbageGet:k("mpad4") == 0 && changed(cabbageGet:k("mpad4")) == 1 then
    turnoff2 "jikjikMachine", 0, 0
    turnoff2 "jikjikSound", 0, 0
    endif
    if      cabbageGet:k("mpad5") == 1 && changed(cabbageGet:k("mpad5")) == 1 then
    schedulek "seqMachine", 0, iDurMaster
    elseif  cabbageGet:k("mpad5") == 0 && changed(cabbageGet:k("mpad5")) == 1 then
    turnoff2 "seqMachine", 0, 0
    turnoff2 "seqSound", 0, 0
    endif
    if      cabbageGet:k("mpad6") == 1 && changed(cabbageGet:k("mpad6")) == 1 then
    schedulek "fbSound", 0, iDurMaster
    elseif  cabbageGet:k("mpad6") == 0 && changed(cabbageGet:k("mpad6")) == 1 then
    turnoff2 "fbSound", 0, 0
    endif
    if      cabbageGet:k("mpad7") == 1 && changed(cabbageGet:k("mpad7")) == 1 then
    schedulek "drumMachine", 0, iDurMaster
    elseif  cabbageGet:k("mpad7") == 0 && changed(cabbageGet:k("mpad7")) == 1 then
    turnoff2 "drumMachine", 0, 0
    turnoff2 "drumSound", 0, 0
    endif
 endif  
endin



</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

