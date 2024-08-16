; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0 bounds(0, 0, 0, 0)
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Loop") size(500,250), pluginId("Loop") guiMode("queue") colour(30,30,50)
;image  bounds(0, 0, 350, 200), outlineThickness(6), , colour(45, 61, 87, 255) file("back.jpg") channel("image2")
checkbox  bounds(28, 32, 68, 21), text("Loop") , channel("loop"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(392, 36, 77, 21), text("Metro") , channel("metro"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(396, 130, 75, 75), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(30, 132, 75, 75), channel("gain"), text("Gain"), range(0.1, 10, 1, 1, 0.1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 

nslider bounds(270, 174, 45, 30) range(10, 100, 10, 1, 1)  channel("fde") text("Fade") colour(56, 63, 79, 255)
combobox   bounds(212, 30, 57, 20), text("Ord", "Up", "Down", "Rnd"), channel("mod"), value(4),  colour(56, 63, 79, 255)

nslider bounds(390, 74, 40, 30), channel("stepsmin"), text("rep min"), range(1, 15, 2, 1, 1), colour(56, 63, 79, 255) valueTextBox(1) 
nslider bounds(430, 74, 40, 30), channel("stepsmax"), text("rep max"), range(1, 20, 5, 1, 1), colour(56, 63, 79, 255) valueTextBox(1) 

nslider bounds(116, 174, 75, 30), channel("pitchmin"), text("PitchMin"), range(-700, 700, -100, 1, 50), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 
nslider bounds(192, 174, 75, 30), channel("pitchmax"), text("PitchMax"), range(-700, 700, 100, 1, 50), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 

checkbox  bounds(28, 56, 84, 21), text("Rnd Pitch") , channel("rndptch"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) 
nslider bounds(318, 174, 55, 30) range(0, 1, 0.1, 1, 0.001)  channel("swft") text("SWIFT") colour(56, 63, 79, 255)
hslider bounds(116, 58, 260, 25) channel("loopdur") range(0.05, 3, 0.5, 1, 0.01)  trackerColour(198, 231, 231, 255) valueTextBox(1) text("loop dur")

hslider bounds(116, 84, 260, 25) channel("strt") range(0.3, 2, 0.7, 1, 0.01)  trackerColour(198, 231, 231, 255) valueTextBox(1) text("start Time")
hslider bounds(116, 110, 260, 25) channel("end") range(1, 15, 5, 1, 0.01)  trackerColour(198, 231, 231, 255) valueTextBox(1) text("end Time")
hslider bounds(116, 138, 260, 25) channel("linetime") range(1, 15, 5, 1, 0.01)  trackerColour(198, 231, 231, 255) valueTextBox(1) text("line Time")



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1

seed 0
giTableL ftgen 0, 0, 10*sr, 2, 0
giTableR ftgen 0, 0, 10*sr, 2, 0
giTableLength = ftlen(giTableL) / sr



instr Start
;aInL,aInR diskin2 "../harf4.wav",1,0,1
 aInL,aInR ins
 kTimeLoop cabbageGet "loopdur"
 kMetro cabbageGet "metro"
 kLoop cabbageGet "loop"
 kMix cabbageGet "mix"
 kGain cabbageGet "gain"

 
 if kMetro == 1 then
   kActive active 4
cabbageSetValue "loop",kActive
 endif
 if kMetro == 1  && changed(kMetro) == 1 then
 schedulek "startmachine", 0, 99999
 elseif kMetro == 0  && changed(kMetro) == 1 then
 turnoff2 "startmachine", 0, 0
 turnoff2 "machine", 0, 0
 turnoff2 "loopme", 0, 0
 kActive2 active 5
 cabbageSetValue "loop",kActive2
 endif
 

	
	if kLoop == 1 && changed(kLoop) == 1 && kMetro == 0 then
	schedulek "Record", 0 ,99999
    schedulek "loopme", 0,99999
    elseif kLoop == 0 && changed(kLoop) == 1 && kMetro == 0 then
    turnoff2 "Record",0,1
    turnoff2 "loopme",0,1
	endif
	


 chnmix	aInL,"audioL"
 chnmix	aInR,"audioR"
 
 aLoopL chnget "LoopL"
 aLoopR chnget "LoopR"
  
  aMixL ntrpol aInL,aLoopL,kMix
  aMixR ntrpol aInR,aLoopR,kMix
  
if kLoop == 0  then
kIn = 1
kOut = 0
elseif kLoop == 1  then
kIn = 0
kOut = 1
endif
aIn interp kIn
aOut interp kOut


aoutL sum (aMixL*aOut),(aInL*aIn)
aoutR sum (aMixR*aOut),(aInR*aIn)


  out aoutL*kGain,aoutR*kGain
;  out aMixL, aMixR
 chnclear	"LoopL"
 chnclear	"LoopR"
endin


instr Record
 aInL chnget "audioL"
 aInR chnget "audioR"
 ;ain inch 1
 aPointer linseg 0, giTableLength, giTableLength*sr
 tablew aInL, aPointer, giTableL
 tablew aInR, aPointer, giTableR
 chnclear	"audioL"
 chnclear	"audioR"
endin


instr startmachine
 kStepMin  cabbageGet "stepsmin"
 kStepMax  cabbageGet "stepsmax"
 kTimeLoop cabbageGet "loopdur"
 iMod cabbageGetValue "mod"
 kStep init 2
 kDurLoop = kStep*kTimeLoop
 kSilence = kDurLoop/kStep
 kTimeMetro = kDurLoop;+kSilence
 if metro(1/kTimeMetro) == 1 then
 schedulek "machine", 0, kDurLoop,kStep
 if iMod == 4 then
 schedulek "loopme", 0, kDurLoop
 endif
 kStep = int(random:k( kStepMin,kStepMax))
 kDurLoop = kStep*kTimeLoop
 kSilence = kDurLoop/kStep
 kTimeMetro = kDurLoop;+kSilence
 endif
 
endin

instr machine
schedule "Record", 0, p3
 iSwift cabbageGetValue "swft"
 
iStep = p4
 iTime = p3/iStep
 iDur = iTime
if metro(1/iTime) == 1 then
kStart random 0, iSwift
schedulek "Play", kStart, iDur
endif
endin

instr loopme
iMod cabbageGetValue "mod"
iStartTime cabbageGetValue "strt"
iEndTime cabbageGetValue "end"
kTimeLoop cabbageGet "loopdur"
iDurLine cabbageGetValue "linetime"
iDur cabbageGetValue "loopdur"
 iSwift cabbageGetValue "swft"
if iMod == 1 then 
kTime = 1/kTimeLoop
elseif iMod == 2 then
kTime linseg iStartTime, iDurLine, iEndTime
elseif iMod == 3 then
kTime linseg iEndTime, iDurLine, iStartTime
elseif iMod == 4 then
kTime rspline iStartTime, iEndTime, 2,4
endif
 if metro(kTime) == 1 then
    kStart random 0, iSwift
    schedulek "Play", 0, iDur
 endif
 
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
 iFade cabbageGetValue "fde" 
 iAtt = 0.01
 iRel = 0.1
 aEnv	transegr	0,iAtt,6, 1,p3,1,1, iRel,-6,0
 aLoopL poscil3 1, iSpeed, giTableL,0
 aLoopR poscil3 1, iSpeed, giTableR,0
 aOutL linen aLoopL*aEnv,p3/iFade, p3, p3/iFade
 aOutR linen aLoopR*aEnv,p3/iFade, p3, p3/iFade
; iPitch = p4
; aPchLaPchR  PchSh aOutL,aOutR, iPitch
 
 chnmix	aOutL,"LoopL"
 chnmix	aOutL,"LoopR"
; out aOutL, aOutR
endin


</CsInstruments>
<CsScore>
i "Start" 0 [6^6]
</CsScore>

</CsoundSynthesizer>
