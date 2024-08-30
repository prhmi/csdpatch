; parnux VSTe v5.2, Cabbage v2.9.0
; Written by Parham Izadyar, 2022-2024
; parhamizadyar.net
<Cabbage>
form     caption("Speed") size(380,350), pluginId("sped"), colour(30,30,50) guiMode("queue")

rslider  bounds(296, 62, 80, 80), channel("spdp"), text("Speed Point"), range(0.1, 2, 0.7, 1, 0.001)   trackerColour(147, 207, 207, 255)      textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider  bounds(296, 256, 80, 80), channel("pitch"), text("Pitch Point"), range(0.1, 2, 1, 1, 0.001)   trackerColour(147, 207, 207, 255)      textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
rslider  bounds(296, 160, 80, 80), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001)     trackerColour(147, 207, 207, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
checkbox bounds(310, 4, 68, 21), text("Record") , channel("record") colour:1(236, 255, 0, 255)  colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox bounds(12, 8, 74, 21), text("Random") , channel("metro"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox bounds(310, 28, 68, 21), text("Play") , channel("play") colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
hslider bounds(10, 38, 251, 25) channel("rngmin") range(0.1, 1, 0.7, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("rng min")
hslider bounds(10, 64, 251, 25) channel("rngmax") range(0.7, 2, 1, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("rng max")
hslider bounds(10, 106, 251, 25) channel("spdmin") range(0.4, 3, 0.7, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd min")
hslider bounds(10, 132, 251, 25) channel("spdmax") range(0.7, 12, 1, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd max")

combobox bounds(182, 10, 75, 22) channel("mod") text("line", "rnd") value(2)
checkbox bounds(10, 230, 95, 21), text("Rnd Pitch") , channel("rndpitch"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255) value(0)
hslider bounds(10, 284, 251, 25) channel("pchmin") range(0.4, 10, 0.7, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("pch min")
hslider bounds(10, 312, 251, 25) channel("pchmax") range(0.7, 15, 1, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("pch max")
hslider bounds(10, 256, 251, 25) channel("rngpch") range(0.01, 0.5, 0.1, 1, 0.01) trackerColour(198, 231, 231, 255) valueTextBox(1) text("rng pch")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
;nchnls = 2
0dbfs = 1

giSoundFileL      	ftgen   0, 0, 60*sr, 10, 0
giSoundFileR      	ftgen   0, 0, 60*sr, 10, 0
giTableLength = ftlen(giSoundFileL)/ sr





instr start
kMetro cabbageGet "metro"
kRcrd cabbageGet "record"
kPly cabbageGet "play"
kMix cabbageGet "mix"




;aInL,aInR diskin "Ninotchka 1_1.wav",1,3,1
iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif

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

  kPortTime linseg 0, 0.001, 0.05
  kMix portk kMix,kPortTime
aMixL ntrpol aInL,aSpeedL,kMix
aMixR ntrpol aInR,aSpeedR,kMix

    if iCh == 1 then
    out (aMixL+aMixR)/2
    elseif  iCh == 2 then
	outs aMixL,aMixR
    endif
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
kRngMin cabbageGet "rngmin"
kRngMax cabbageGet "rngmax"
kSpeedMin cabbageGet "spdmin"
kSpeedMax cabbageGet "spdmax"
kSpeedPoint cabbageGet "spdp"
iSpeedPoint = i(kSpeedPoint)
iSpdEnd = 1.3-iSpeedPoint
print iSpdEnd, iSpdEnd+0.7
kMod cabbageGet "mod"
kBox = p4
if kBox == 0 then
kSpeed = kSpeedPoint
elseif kBox == 1 then
    if kMod == 1 then  
    kSpeed = (line:k( 0, i(kSpeedMax), iSpdEnd) % iSpdEnd) + iSpeedPoint
    elseif kMod == 2 then
    kSpeed rspline kRngMin, kRngMax, kSpeedMin, kSpeedMax
    endif
endif

iAmp = 1
kPitchIn cabbageGet "pitch"
kPchRng cabbageGet "rngpch"
kPchMin cabbageGet "pchmin"
kPchMax cabbageGet "pchmax"
kRndPitch cabbageGet "rndpitch"

if kRndPitch == 0 then
kPitch = kPitchIn
elseif kRndPitch == 1 then
kPitch = jspline:k( kPchRng, kPchMin, kPchMax) + kPitchIn
endif
aSpeedL   temposcal kSpeed, iAmp, kPitch, giSoundFileL, 1
aSpeedR   temposcal kSpeed, iAmp, kPitch, giSoundFileR, 1
 chnmix	aSpeedL,"SpeedL"
 chnmix	aSpeedR,"SpeedR"

endin

</CsInstruments>
<CsScore>
i "start"  0 [6^6]
</CsScore>
</CsoundSynthesizer>


 
