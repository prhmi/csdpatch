<Cabbage>
form caption("Loop") size(350,200), pluginId("Loop")
image  bounds(0, 0, 350, 200), outlineThickness(6), , colour(45, 61, 87, 255) file("loop.jpg")
checkbox  bounds(12, 10, 68, 21), text("Loop") , channel("loop"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(260, 10, 68, 21), text("Metro") , channel("metro"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(258, 48, 85, 85), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(10, 48, 85, 85), channel("looptime"), text("Time"), range(0.2, 10, 1, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
nslider bounds(26, 152, 56, 32) range(0, 100, 70, 1, 1) velocity(50) channel("mtromss") text("Metro moses")
nslider bounds(148, 10, 53, 25) range(10, 100, 10, 1, 1) velocity(50) channel("fde") text("Fade")

nslider bounds(128, 126, 46, 31), channel("stepsmin"), text("StepsMin"), range(1, 6, 2, 1, 1), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) velocity(50)
nslider bounds(176, 126, 45, 31), channel("stepsmax"), text("StepsMax"), range(4, 20, 10, 1, 1), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 
checkbox  bounds(136, 162, 89, 21), text("Rnd Steps") , channel("rndstp"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) value(1)
nslider bounds(114, 42, 61, 31), channel("pitchmin"), text("PitchMin"), range(0.3, 1.5, 1, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) velocity(50)
nslider bounds(178, 42, 60, 31), channel("pitchmax"), text("PitchMax"), range(0.5, 2, 1.01, 1, 0.001), trackerColour(147, 207, 207, 255) outlineColour(3, 29, 29, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1) 

checkbox  bounds(134, 78, 84, 21), text("Rnd Pitch") , channel("rndptch"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) 
nslider bounds(266, 152, 56, 32) range(0, 1, 0.1, 1, .001) velocity(50) channel("swft") text("SWIFT")


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
 aInL,aInR diskin2 "harp.wav",1,0,1
 ;aInL,aInR ins
 kTime init 0
 kTime chnget "looptime"
 kMetroMoses chnget "mtromss"
 kMetroTime init 0
 kMetro chnget "metro"
 kLoop chnget "loop"
 kSwift chnget "swft"
 kRndStp chnget "rndstp"
 kPitch chnget "pitch"
 kStepsMin chnget "stepsmin"
 kStepsMax chnget "stepsmax"
 kRndPch chnget "rndpch"
 kPitchMin chnget "pitchmin"
 kPitchMax chnget "pitchmax"
 kMix chnget "mix"
 
 if kMetro == 1 && kLoop == 0 then
    if metro(1/kTime) == 1 then
      kMetroTirg = (random:k(0, 100) > kMetroMoses ) ? 0 : 1
    endif
 elseif kMetro == 0 then
    kMetroTirg = 0
 endif
;printk2 kMetroTirg

 ;kMetroTirg = 1
 
	if kMetroTirg == 1 then
		if metro:k(1/kMetroTime) == 1 then
		kMetroTime random kTime/2, kTime
		    if kRndStp == 1 then
		      kSteps = int(random:k( kStepsMin, kStepsMax))
		    elseif kRndStp == 0 then
		      kSteps =  kStepsMin
		    endif
		    if kRndPch == 1 then
		      kPitch = int(random:k( kPitchMin, kPitchMax))
		    elseif kRndPch == 0 then
		      kPitch =  kPitchMin
		    endif		
		schedulek "Record", 0 ,kMetroTime
		schedulek "machine", 0,kMetroTime,kSteps,kSwift,kPitch
		endif
	endif
	
	if kLoop == 1 && changed(kLoop) == 1 && kMetro == 0 then
	schedulek "Record", 0 ,9999
    schedulek "loopme", 0,9999,kTime,kStepsMin,kSwift,kPitchMin
    elseif kLoop == 0 && changed(kLoop) == 1 && kMetro == 0  then
    turnoff2 "Record",0,1
    turnoff2 "loopme",0,1
	endif
	


 chnmix	aInL,"audioL"
 chnmix	aInR,"audioR"
 
 aLoopL chnget "LoopL"
 aLoopR chnget "LoopR"
  
  aMixL ntrpol aInL,aLoopL,kMix
  aMixR ntrpol aInR,aLoopR,kMix
  
if kLoop == 0 && kMetro == 0 then
kIn = 1
kOut = 0
elseif kLoop == 1 && kMetro == 0 then
kIn = 0
kOut = 1
elseif kLoop == 0 && kMetro == 1 then
    if kMetroTirg == 1 then
    kIn = 0
    kOut = 1
    elseif kMetroTirg == 0 then
    kIn = 1
    kOut = 0
    endif 
endif
;printk2 kOut
aIn interp kIn
aOut interp kOut


aoutL sum (aMixL*aOut),(aInL*aIn)
aoutR sum (aMixR*aOut),(aInR*aIn)


  out aoutL,aoutR
  
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


instr machine
 if metro(1/(p3/p4)) == 1 then
    kStart random 0, p5
    schedulek "Play", kStart, p3/p4,p6
 endif
 kTimer line 0, 1, 1
 if kTimer >= p3*p4 then
    turnoff
 endif
endin

instr loopme
 if metro(1/(p4/p5)) == 1 then
    kStart random 0, p6
    schedulek "Play", kStart, p4/p5,p7
 endif
endin



instr Play
 iSpeed = p4/giTableLength
 ;print iSkip
 iFade chnget "fde" 
 iAtt = p3/iFade
 iRel = p3/iFade
 aEnv	transegr	0,iAtt,6, 1,p3,4,1, iRel,-6,0
 aLoopL poscil3 0.5, iSpeed, giTableL,0
 aLoopR poscil3 0.5, iSpeed, giTableR,0
 aoutL linen aLoopL*aEnv,p3/iFade, p3, p3/iFade
 aoutR linen aLoopR*aEnv,p3/iFade, p3, p3/iFade
 chnmix	aoutL,"LoopL"
 chnmix	aoutL,"LoopR"
endin


</CsInstruments>
<CsScore>
i "Start" 0 999
</CsScore>
</CsoundSynthesizer>