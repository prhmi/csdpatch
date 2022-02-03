<Cabbage>
form caption("Speed") size(280,153), pluginId("sped")
image            bounds(0, 0, 278, 152), outlineThickness(6), , colour(45, 61, 87, 255) file("speed.jpg")
checkbox  bounds(106, 114, 68, 21), text("Lock") , channel("lock"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) value(1)
nslider bounds(194, 106, 56, 32) range(0.3, 1.5, 0.3, 1, 0.01) velocity(50) channel("spdpnt") text("Speed Point")
nslider bounds(18, 104, 70, 32) range(1, 23, 17, 1, 1) velocity(50) channel("spdrnd") text("Random Speed")

rslider bounds(8, 12, 85, 85), channel("spdrng"), text("Speed Range"), range(0.01, 1, 0.5, 1, 0.001)   trackerColour(147, 207, 207, 255)      textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(180, 14, 85, 85), channel("mix"), text("mix"), range(0, 1, .5, 1, 0.001)     trackerColour(147, 207, 207, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
checkbox  bounds(106, 52, 68, 21), text("Record") , channel("record") colour:1(236, 255, 0, 255)  colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(106, 14, 68, 21), text("Metro") , channel("metro"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(106, 74, 68, 21), text("Play") , channel("play") colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)

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

giSoundFileL      	ftgen   0, 0, 60*sr, 2, 0
giSoundFileR      	ftgen   0, 0, 60*sr, 2, 0
giTableLength = ftlen(giSoundFileL)/ sr





instr start
kMetro chnget "metro"
kRcrd chnget "record"
kPly chnget "play"
kMix chnget "mix"




;aInL,aInR diskin "harp.wav",1,0,1
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
kLock chnget "lock"
kSpeedPoint chnget "spdpnt"
kSpeedRange chnget "spdrng"
kRndSpd chnget "spdrnd"
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
i "start"     0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>


 
