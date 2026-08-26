<Cabbage>
form caption("EMC") size(400, 670), guiMode("queue"), pluginId("emcc") colour(10,30,30)
label bounds(100, 330, 55, 55) channel("char1") text("E") visible(0) fontColour(118, 217, 127, 255)
label bounds(268, 330, 55, 55) channel("char2") text("M") visible(0) fontColour(118, 217, 127, 255)
label bounds(184, 330, 55, 55) channel("char3") text("C") visible(0) fontColour(118, 217, 127, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1

seed 3419

instr 1
schedule 12, 0, 1
schedule 2, 0, 3
schedule 3, 2, 3
schedule 8, 2, 3
schedule 4, 3.35, 3
schedule 5, 3.35, 1
endin

instr 2

iChr = p1-1
Schr sprintf "char%d", iChr
kY expseg 1, 1, 220, 1, 220
;kY2 transeg 0, 1, 1, 0, 0.5, -6, -100
kY2 transeg 0, 1, 1, 0, 0.25, -8, -50, 0.2, 4, 0, 0.15, -4, -20, 0.2, 6, 0, 0.1, -2, -5, 0.1, 6, 0
kVis linseg 0, 0.5, 1
SPos sprintfk "bounds(20, %d, 55,55) visible(1) alpha(%f)",kY+kY2,kVis
cabbageSet 1,Schr,SPos
endin

instr 3
iChr = p1-1
Schr sprintf "char%d", iChr
kY expseg 1, 1, 270, 0.1, 270, 0.5, 280, 0.1, 280;, 0.5, 350
kY2 transeg 0, 1, 1, 0, 0.5, -6, -60;, 0.4, 8, -50
kVis linseg 0, 0.5, 1
SPos sprintfk "bounds(85, %d, 55,55) visible(1) alpha(%f)",kY+kY2,kVis
cabbageSet 1,Schr,SPos
schedule 13, 1.55, 0.8
kVis transeg 0,1.3,1,0, 1, 12, 0.4
SRot sprintfk "rotate(%f,-2,0)",kVis
cabbageSet 1,Schr,SRot
;endif
endin

instr 4
iChr = p1-1
Schr sprintf "char%d", iChr
kY expseg 1, 1, 250, 0.7, 250;, 0.5, 200;, 0.5, 300, 0.5, 350
kY2 transeg 0, 1, 0, 0, 0.25, -6, -70, 0.25, 6, 0, 0.15, -4, -35, 0.2, 6, 0, 0.12, -4, -10, 0.08, 2, 0
kVis linseg 0, 0.5, 1
SPos sprintfk "bounds(120, %d, 55,55) visible(1) alpha(%f)",kY+kY2,kVis
cabbageSet 1,Schr,SPos
endin


instr 5
iFrq random 500, 560
schedule 6, 1, 1.5, 0, 6, iFrq
schedule 6, 1.5, 0.5, -7, 5 , iFrq
schedule 6, 1.84, 0.5, -8, 5, iFrq
schedule 6, 2, 0.4, -10, 4, iFrq
iAtt = 0.1
aEnv linseg 0, iAtt, 1, p3-iAtt-0.05, 1, 0.05, 0
iNoiseRnd random 0.2, 0.5
aNoise noise 0.2, iNoiseRnd
aEnvF transeg 0, 1,4, 1
aSound vco2 0.1, 900, 2, 0.5
aSound = aSound*aEnvF
iFiltRnd random 250, 500
kFrq expseg iFiltRnd, 0.8, iFiltRnd+2000
;kFrq transeg iFiltRnd, 0.1, 1,  iFiltRnd, 1, -6, iFiltRnd+700
aFilt clfilt aNoise, kFrq, 0, 10
aSoundF clfilt aSound, kFrq/4, 0, 10
aOut = (aFilt+aSoundF)*aEnv
out aOut, aOut
endin

instr 6
aSound mpulse 60, 100
aFilt clfilt aSound, 200, 0, 20
out aFilt,aFilt
iAmp = p4
indx = 0
iFrq = p6
while indx < p5 do
schedule 7, 0, p3, iFrq, iAmp
iFrq *= 1.72
indx += 1
od
endin

instr 7
iAtt = 0.001
iAmp ampdb p5-20
aEnv transeg 0, iAtt, 6, iAmp*0.3, p3-iAtt, -6, 0
aSound poscil aEnv, p4
out aSound, aSound
endin

instr 8
iFrq random 400, 450
schedule 6, 1, 1, 0, 6, iFrq
aEnv linseg 0, 0.2, 1, 1-0.2, 1, 0.05, 0
aNoise noise 0.2, 0.5
aEnvF transeg 0, 1,4, 1
aSound vco2 0.1, 900, 2, 0.5
aSound = aSound*aEnvF
iFiltRnd random 1200, 2900
kFrq linseg iFiltRnd, 0.1, iFiltRnd, 1, iFiltRnd*1.5
aFilt clfilt aNoise, kFrq, 0, 50
aSoundF clfilt aSound, kFrq/2, 0, 10
aOut = (aFilt+aSoundF)*aEnv
out aOut, aOut
endin

instr 9
iX = 0
 iY = 0
 indx = 0
 while indx < 600 do
 iColourR random 100, 200
 iColourG random 100, 200
 iColourB random 100, 200
 iRnd random 10, 100
 SSteps    sprintf "bounds(%d, %d, 15, 15),text(\"%d\"), visible(1) alpha(0.4)\
 channel(\"symb%d\"),colour(%d, %d, %d,%d)", \
 iX+230, iY,int(rnd(9)),indx, iColourR, iColourG, iColourB, iRnd
 cabbageCreate "image", SSteps 
 iX += 25
 indx += 1
    if (indx%9) == 0 then
    iY += 20
    iX = 0
    endif
 od
endin

instr 10
iColourR random 100, 200
iColourG random 100, 200
iColourB random 100, 200
iChar = int(random:i( 0, 650))
Schr sprintf "symb%d",iChar
iRnd random 10, 100
SColor sprintf "colour(%d, %d, %d, %d)",iColourR,iColourG, iColourB, iRnd
cabbageSet 1,Schr,SColor
endin

instr 11
if metro(300) == 1 then
schedulek 10, 0, 0.03
endif
endin

instr 12
iFrq random 450, 500
schedule 6, 0.97, 1.5, 0, 6, iFrq
schedule 6, 1.44, 0.5, -7, 5 , iFrq
schedule 6, 1.75, 0.5, -8, 5, iFrq
schedule 6, 1.83, 0.4, -10, 4, iFrq
iAtt = 0.1
aEnv linseg 0, iAtt, 1, p3-iAtt-0.05, 1, 0.05, 0
iNoiseRnd random 0.2, 0.5
aNoise noise 0.2, iNoiseRnd
aEnvF transeg 0, 1,4, 1
aSound vco2 0.1, 900, 2, 0.5
aSound = aSound*aEnvF
iFiltRnd random 250, 500
kFrq expseg iFiltRnd, 0.8, iFiltRnd+2000
;kFrq transeg iFiltRnd, 0.1, 1,  iFiltRnd, 1, -6, iFiltRnd+700
aFilt clfilt aNoise, kFrq, 0, 10
aSoundF clfilt aSound, kFrq/4, 0, 10
aOut = (aFilt+aSoundF)*aEnv
out aOut, aOut
endin

instr 13
kFrq transeg 2, 0.8, 4, 5
aSound vco2 0.4, kFrq, 2, 0.5
kFilt randomh 500, 2200, 80
aFilt clfilt aSound, kFilt, 1, 50
chnmix aFilt, "snd"
endin

instr 14
aIn, aIn monitor
aPuls chnget "snd"
aOut reverb aIn, 1.2
out (aOut*0.3)+aPuls, (aOut*0.3)+aPuls
chnclear "snd"
endin

</CsInstruments>
<CsScore>
i1 1 12
i11 0 12
i9 0 1
i14 0 10
</CsScore>
</CsoundSynthesizer>
