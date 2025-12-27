/*
Ramkal VSTe package v6.0
written by parham izadyar | 2020-2025 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
form caption("Loop") size(350,400), pluginId("Loop") guiMode("queue") colour(30,30,50)
;image  bounds(0, 0, 350, 200), outlineThickness(6), , colour(45, 61, 87, 255) file("back.jpg") channel("image2")
checkbox  bounds(44, 24, 68, 21), text("Loop") , channel("loop"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(44, 124, 77, 21), text("Machine") , channel("machine"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(244, 124, 57, 21), text("Rnd") , channel("machrnd"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(126, 304, 75, 75), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(36, 304, 75, 75), channel("maingain"), text("Gain"), range(0.1, 10, 1, 1, 0.1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
nslider bounds(132, 120, 40, 30), channel("stepsmin"), text("rep min"), range(1, 50, 12, 1, 1), colour(56, 63, 79, 255) valueTextBox(1) 
nslider bounds(172, 120, 40, 30), channel("stepsmax"), text("rep max"), range(1, 50, 12, 1, 1), colour(56, 63, 79, 255) valueTextBox(1) 
checkbox  bounds(44, 234, 84, 21), text("Rnd Pitch") , channel("rndptch"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) 
nslider bounds(230, 342, 55, 30) range(0, 1, 0, 1, 0.001)  channel("swft") text("SWIFT") colour(56, 63, 79, 255)
nslider bounds(146, 230, 75, 30), channel("pitchmin"), text("PitchMin"), range(-700, 700, -100, 1, 50), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 
nslider bounds(222, 230, 75, 30), channel("pitchmax"), text("PitchMax"), range(-700, 700, 100, 1, 50), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 
combobox   bounds(216, 302, 83, 24), text("line", "adsr", "Rnd"), channel("envmod"), value(3),  colour(56, 63, 79, 255)
image bounds(18, 101, 300, 4) channel("image10013") colour(140, 182, 195, 255)
image bounds(18, 213, 300, 4) channel("image10014") colour(140, 182, 195, 255)
image bounds(18, 283, 300, 4) channel("image10015") colour(140, 182, 195, 255)
hslider bounds(42, 58, 260, 25) channel("loopdur") range(0.01, 3, 0.5, 1, 0.01) text("loop dur") trackerColour(198, 231, 231, 255) valueTextBox(1)
hslider bounds(42, 170, 260, 25) channel("metrotime") range(1, 10, 2, 1, 0.01) text("Time") trackerColour(198, 231, 231, 255) valueTextBox(1)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 48000
ksmps = 64
;nchnls = 2
0dbfs = 1

seed 0

giTableL ftgen 0, 0, 20*sr, 2, 0
giTableR ftgen 0, 0, 20*sr, 2, 0
giTableLength = ftlen(giTableL) / sr

gaRcrdL init 0
gaRcrdR init 0

instr loopMe
kStepMin cabbageGet "stepsmin"
kStepMax cabbageGet "stepsmax"
kMix     cabbageGet "mix"
kGain    cabbageGet "maingain"
kTimeIn  cabbageGet "metrotime"
kMachRnd cabbageGet "machrnd"
kMachine cabbageGet "machine"
kLoop    cabbageGet "loop"
kLoopDur cabbageGet "loopdur"

iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
 aInL, aInR ins 
endif
;aInL,aInR diskin2 "test.wav",1,2,1

 gaRcrdL = aInL
 gaRcrdR = aInR
 chnmix	aInR,"snd2"
  
 if kMachine == 1 && kLoop == 0 then
 kMetro init 1
    if metro(kMetro) == 1 then
        if     kMachRnd == 0 then
        kTime = kTimeIn
        elseif kMachRnd == 1 then
        kTime random kTimeIn-1, kTimeIn+1
        endif
    kMetro = 1/kTime
    kDur = kTime*3
    kStep = int(random:k(kStepMin, kStepMax))
    schedulek "loopModul", 0, kDur,kStep
    endif
 elseif kMachine == 0 && kLoop == 1 then
 printk2 kLoop
    if changed(kLoop) == 1 then
    schedulek "Record", 0, 9999
    endif
    if metro(1/kLoopDur) == 1 then
    schedulek "Play", 0, kLoopDur
    endif
 elseif kMachine == 0 && kLoop == 0 && changed(kLoop) == 1 then
 turnoff2 "Record", 0, 0
 turnoff2 "Play", 0, 0
 endif
 
 
 aLoopL  chnget "loop1"
 aLoopR  chnget "loop2"
 aOutL ntrpol aInL, aLoopL*kGain, kMix
 aOutR ntrpol aInR, aLoopR*kGain, kMix
  out aOutL, aOutR
  chnclear "loop1", "loop2"
endin




instr loopModul
 schedule "Record", 0, p3
 iSwift cabbageGetValue "swft"
 iStep = p4
 iTime = p3/iStep
 iDur = iTime*1.5
    if metro(1/iTime) == 1 then
    kStart random 0, iSwift
    schedulek "Play", kStart+0.1, iDur
    endif  
endin


instr Record
aEnv transegr 0,0.01,6,1,0.01, -6, 0
 aPointer linseg 0, giTableLength, giTableLength*sr
 tablew gaRcrdL*aEnv, aPointer, giTableL
 tablew gaRcrdR*aEnv, aPointer, giTableR
endin


instr Play
 iRndPch cabbageGetValue "rndptch"
 iPitchMin cabbageGetValue "pitchmin"
 iPitchMax cabbageGetValue "pitchmax"
 if iRndPch == 1 then
iPitch random iPitchMin,iPitchMax
elseif iRndPch == 0 then
iPitch = 0
endif
 iSpeed = cent(iPitch)/giTableLength
 
 iModEnv cabbageGetValue "envmod"
 if iModEnv == 1 || iModEnv == 2 then
 iModEnv2 = iModEnv
 elseif iModEnv == 3 then
 iModEnv2 = int(random:i(1, 3))
 endif
 
 
 if iModEnv2 == 1 then
 iAtt = 0.005
 aEnv	transeg	0,iAtt,4, 1,p3-iAtt,-6,0
 elseif iModEnv2 == 2 then
 iAtt = p3/10
 aEnv	transegr	0,iAtt,6,1, iAtt,-6,0
 endif
 aLoopL poscil3 1, iSpeed, giTableL,0
 aLoopR poscil3 1, iSpeed, giTableR,0
 aOutL = aLoopL*aEnv
 aOutR = aLoopR*aEnv
 chnmix	aOutL,"loop1"
 chnmix	aOutR,"loop2"

endin


</CsInstruments>
<CsScore>
i "loopMe" 0 [6^6]
</CsScore>

</CsoundSynthesizer>


