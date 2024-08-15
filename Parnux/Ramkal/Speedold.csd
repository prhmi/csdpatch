; Ramkal_VSTe_V_4.9, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2023
; github.com/prhmi
<Cabbage>
form     caption("Speed") size(280,153), pluginId("sped")
image    bounds(0, 0, 280, 153), outlineThickness(6), , colour(45, 61, 87, 255) file("back.jpg") channel("image2")
checkbox bounds(106, 114, 68, 21), text("Lock") , channel("lock"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) value(1)
nslider  bounds(194, 106, 56, 32) range(0.3, 1.5, 0.3, 1, 0.01) velocity(50) channel("spdpnt") text("Speed Point") colour(56, 63, 79, 255)
nslider  bounds(18, 104, 70, 32) range(1, 23, 17, 1, 1) velocity(50) channel("spdrnd") text("Random Speed") colour(56, 63, 79, 255)
rslider  bounds(8, 12, 85, 85), channel("spdrng"), text("Speed Range"), range(0.01, 1, 0.5, 1, 0.001)   trackerColour(147, 207, 207, 255)      textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider  bounds(180, 14, 85, 85), channel("mix"), text("mix"), range(0, 1, .5, 1, 0.001)     trackerColour(147, 207, 207, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
checkbox bounds(106, 52, 68, 21), text("Record") , channel("record") colour:1(236, 255, 0, 255)  colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox bounds(106, 14, 74, 21), text("Random") , channel("metro"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox bounds(106, 74, 68, 21), text("Play") , channel("play") colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

giSoundFileL      	ftgen   0, 0, 60*sr, 10, 0
giSoundFileR      	ftgen   0, 0, 60*sr, 10, 0
giTableLength = ftlen(giSoundFileL)/ sr





instr start
kMetro cabbageGet "metro"
kRcrd cabbageGet "record"
kPly cabbageGet "play"
kMix cabbageGet "mix"




;aInL,aInR diskin "test.wav",1,0,1
aInL,aInR ins

if kMetro == 0 && changed(kMetro) == 1 then
turnoff2 "Record",0,0
turnoff2 "Play",0,0
elseif kMetro == 1 && changed(kMetro) == 1 then
schedulek "Record",0,99999
schedulek "Play",  0,99999,1
elseif kRcrd == 1 && changed(kRcrd) == 1 then
schedulek "Record",0,99999
elseif kRcrd == 0 && changed(kRcrd) == 1 then
turnoff2 "Record",0,0
elseif kPly == 1 && changed(kPly) == 1 then
schedulek "Play",0,99999,0
elseif kPly == 0 && changed(kPly) == 1 then
turnoff2 "Play",0,0
endif
 chnmix	aInL,"AudioL"
 chnmix	aInR,"AudioR"
aSpeedL chnget "SpeedL"
aSpeedR chnget "SpeedR"
;if kPly == 0 && kMetro == 0 then
;kMix = 0
;endif
aMixL ntrpol aInL,aSpeedL,kMix
aMixR ntrpol aInR,aSpeedR,kMix

out aMixL,aMixR
 chnclear	"SpeedL"
 chnclear	"SpeedR"
endin




instr Record
aInL chnget "AudioL"
aInR chnget "AudioR"

aPointer linseg 0, giTableLength, giTableLength*sr
tablew aInL, aPointer, giSoundFileL
tablew aInR, aPointer, giSoundFileR
 chnclear	"AudioL"
 chnclear	"AudioR"
endin

instr Play
kLock cabbageGet "lock"
kSpeedPoint cabbageGet "spdpnt"
kSpeedRange cabbageGet "spdrng"
kRndSpd cabbageGet "spdrnd"
kBox = p4
if kBox == 0 then
kSpeed = kSpeedPoint
elseif kBox == 1 then
kSpeed = randi:k( kSpeedRange,kRndSpd,2)+(kSpeedPoint/2)+kSpeedRange
endif

iAmp = 1
kPitch = 1
;printk2 kSpeed
aSpeedL   temposcal kSpeed, iAmp, kPitch, giSoundFileL, kLock
aSpeedR   temposcal kSpeed, iAmp, kPitch, giSoundFileR, kLock
 chnmix	aSpeedL,"SpeedL"
 chnmix	aSpeedR,"SpeedR"

endin

</CsInstruments>
<CsScore>
i "start"  0 [6^6]
</CsScore>
</CsoundSynthesizer>


 
