<Cabbage>
form caption("MorseCode") size(430, 150)  guiMode("queue")  colour(10,30,40) style("legacy") pluginId("mrse")
checkbox bounds(20, 14, 30, 30) channel("start") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
texteditor bounds(18, 94, 388, 25) channel("text") colour(180, 140, 250, 200) colour:0(180, 140, 250, 200)fontSize(20) text("some one")

nslider bounds(134, 48, 64, 29) channel("bpm") range(30, 200, 83, 1, 1)
nslider bounds(206, 48, 64, 29) channel("frq") range(200, 2000, 1200, 1, 1)
label bounds(51, 22, 51, 16) channel("label10004") text("start")
label bounds(139, 22, 51, 16) channel("label10005") text("BPM")
label bounds(212, 22, 51, 16) channel("label10006") text("Frq")
rslider bounds(332, 14, 70, 70) channel("amp") range(0, 0.8, 0.3, 1, 0.001) valueTextBox(1) trackerColour(184, 126, 209, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n  -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1





instr 1
giIndx init 0
;schedule 2, 0, 1
index = 0
;Stype = "some one is calling"
;Stype = "a g"
Stype cabbageGet "text"
puts Stype,1
;iString strchar Stype
iLen       strlen     Stype 
giLen = iLen

giTypeArr[] init iLen	
while index < iLen do
ichr       strchar    Stype, index
giTypeArr[index]  = ichr
index += 1
od
;printarray iTypeArr, "%.f"

endin


instr 2
iChar = giTypeArr[giIndx]
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
giMorseArr[] = iMorseArr_A
elseif iChar == 98 then
giMorseArr[] = iMorseArr_B
elseif iChar == 99 then
giMorseArr[] = iMorseArr_C
elseif iChar == 100 then
giMorseArr[] = iMorseArr_D
elseif iChar == 101 then
giMorseArr[] = iMorseArr_E
elseif iChar == 102 then
giMorseArr[] = iMorseArr_F
elseif iChar == 103 then
giMorseArr[] = iMorseArr_G
elseif iChar == 104 then
giMorseArr[] = iMorseArr_H
elseif iChar == 105 then
giMorseArr[] = iMorseArr_I
elseif iChar == 106 then
giMorseArr[] = iMorseArr_J
elseif iChar == 107 then
giMorseArr[] = iMorseArr_K
elseif iChar == 108 then
giMorseArr[] = iMorseArr_L
elseif iChar == 109 then
giMorseArr[] = iMorseArr_M
elseif iChar == 110 then
giMorseArr[] = iMorseArr_N
elseif iChar == 111 then
giMorseArr[] = iMorseArr_O
elseif iChar == 112 then
giMorseArr[] = iMorseArr_P
elseif iChar == 113 then
giMorseArr[] = iMorseArr_Q
elseif iChar == 114 then
giMorseArr[] = iMorseArr_R
elseif iChar == 115 then
giMorseArr[] = iMorseArr_S
elseif iChar == 116 then
giMorseArr[] = iMorseArr_T
elseif iChar == 117 then
giMorseArr[] = iMorseArr_U
elseif iChar == 118 then
giMorseArr[] = iMorseArr_V
elseif iChar == 119 then
giMorseArr[] = iMorseArr_W
elseif iChar == 120 then
giMorseArr[] = iMorseArr_X
elseif iChar == 121 then
giMorseArr[] = iMorseArr_Y
elseif iChar == 122 then
giMorseArr[] = iMorseArr_Z
elseif iChar == 32 then
giMorseArr[] fillarray 5
endif


schedule 3,0.3,999,iChar

printarray giMorseArr, "%.f"
endin

instr 3
iBPM cabbageGetValue "bpm" ; 120
iTempo = iBPM/60
kTime init iTempo
kMorseIndx init 0
if metro(1/kTime) == 1 then
kTime = (giMorseArr[kMorseIndx])/(iTempo*4)
schedulek 4, 0, kTime*0.5,p4

kMorseIndx += 1
endif

if kMorseIndx == lenarray(giMorseArr) && changed(kMorseIndx) == 1 then

giIndx += 1
	if giIndx >= giLen then
	turnoff
	endif
schedulek 2,0,1
turnoff
endif

endin



instr 4
iFrq cabbageGetValue "frq"
iNoiseGain = 0;random 0.0, 0.3
iSineGain = 1;random  0.3, 0.8

iAmp cabbageGetValue "amp"
if p4 == 32 then
iGain = 0
else
iGain = 1
endif
iAtt = 0.01
iTest = (p3-iAtt)-(iAtt*2)
aEnv linseg 0,iAtt,iAmp,(p3-iAtt)-(iAtt*2),iAmp,iAtt,0
aSound poscil aEnv, iFrq
aNoise noise aEnv, 0.9
aNoise tone  aNoise, 2000
aNoise atone aNoise, 1000
aOut = ((aSound*iSineGain)+(aNoise*iNoiseGain))*iGain
out aOut,aOut
iMidi ftom iFrq
midion 1, iMidi, iGain*120
endin

instr 99
kStart cabbageGet "start"
    if changed(kStart) == 1 && kStart == 1 then
    schedulek 1,0,9999
    schedulek 2,0,1
    elseif kStart == 0 then
    turnoff2 1,0,0
    turnoff2 2,0,0
    turnoff2 3,0,0
;    turnoff2 4,0,0
    endif
endin

schedule 99, 0, -1

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>

