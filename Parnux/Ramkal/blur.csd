; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Blur") size(500,300), pluginId("blur") colour( 30, 30, 50) guiMode("queue")
;image bounds(0, 0, 220, 150) file("back.jpg")
combobox   bounds(120, 18, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("fft"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(26, 48, 85, 85) channel("size") text("Blur Size") range(0.5, 10, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
checkbox  bounds(298, 20, 75, 21), text("Metro") , channel("metro")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(28, 20, 75, 21), text("On/Off") , channel("onoff")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(422, 220, 73, 72), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
combobox   bounds(120, 46, 101, 23), text("scrtch", "blur", "scrtch & blur"), channel("blurmod"), value(2), fontColour(255,255,255) colour(56, 63, 79, 255)
hslider bounds(114, 74, 174, 25) channel("rel") range(0.1, 5, 0.5, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("Rel")
hslider bounds(114, 100, 174, 25) channel("strt") range(0.1, 2, 0.5, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("start")

hslider bounds(28, 138, 263, 25) channel("stch") range(1, 20, 10, 1, 1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("blur time")
hslider bounds(298, 50, 200, 25) channel("spdmin") range(0.2, 3, 0.7, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd min")
hslider bounds(298, 82, 200, 25) channel("spdmax") range(1, 5, 2, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd max")
hslider bounds(298, 110, 200, 25) channel("sizemin") range(0.2, 2, 0.8, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("size min")
hslider bounds(298, 138, 200, 25) channel("sizemax") range(1, 5, 2, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("size max")
hslider bounds(298, 168, 200, 25) channel("durblur") range(0.5, 2, 1.2, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("dur blur")

hslider bounds(28, 164, 263, 25) channel("blurres") range(0.1, 2, 0.6, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("blur res")
checkbox  bounds(28, 194, 75, 21), channel("rvrb")  text("Reverb")  , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
hslider bounds(28, 218, 230, 25) channel("rvrbsize") range(0.2, 0.9, 0.6, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("Reverb Size")
hslider bounds(28, 246, 230, 25) channel("rvrbmins") range(1, 5, 3, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("Reverb res")
hslider bounds(260, 218, 150, 25) channel("rvrbmin") range(0.7, 5, 1, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("min")
hslider bounds(260, 246, 150, 25) channel("rvrbmax") range(1, 12, 3, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("max")


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr = 44100
ksmps = 64
0dbfs = 1
nchnls = 2

giTableL    ftgen  0, 0, 60*sr, 2, 0
giTableR    ftgen  0, 0, 60*sr, 2, 0
giTableLength = ftlen(giTableL) / sr


seed 0


opcode blurMe, aa,aaiki
aInL,aInR, iFFTsize, kBlurSize,iResl xin
	ioverlap = iFFTsize/4 
	iwinsize = iFFTsize
	iwintype = 1 
fftinL		pvsanal	aInL, iFFTsize, ioverlap, iwinsize, iwintype
fftblurL	pvsblur	fftinL, kBlurSize, iResl; blur
aOutL		pvsynth	fftblurL

fftinR		pvsanal	aInR, iFFTsize, ioverlap, iwinsize, iwintype
fftblurR	pvsblur	fftinR, kBlurSize, iResl; blur
aOutR		pvsynth	fftblurR

xout aOutL, aOutR
endop


instr Record
aInL chnget "sndl"
aInR chnget "sndr"
iAtt = 0.1
iRel = 0.5
aEnv	transegr	0,iAtt,1, 1, iRel, -6, 0
aPointer linseg 0, giTableLength, giTableLength*sr
tablew aInL*aEnv, aPointer, giTableL
tablew aInR*aEnv, aPointer, giTableR
chnclear "sndl"
chnclear "sndr"
endin


instr Play
iSize = p4
kSize cabbageGet "size"
kStrchMin cabbageGet "stch"
kBlurSize = kSize/kStrchMin

kMod cabbageGet "blurmod"
aStretchL paulstretch iSize, 1, giTableL
aStretchR paulstretch iSize, 1, giTableR
iAtt = 0.1
iRel cabbageGetValue "rel"
aEnv	transegr	0,iAtt,1, 1, iRel, -6, 0
if kMod == 1 then
aOutL = aStretchL
aOutR = aStretchR
endif

iFFTsizeIn cabbageGetValue "fft"
iFFTsize = 2^(iFFTsizeIn+6)
aPointer linseg 0, giTableLength, 1
aInL table aPointer,giTableL, 1
aInR table aPointer,giTableR, 1
iReso cabbageGetValue "blurres"

if kMod == 2 then
aBlurL, aBlurR blurMe aInL, aInR,iFFTsize,kBlurSize,iReso
aOutL = aBlurL
aOutR = aBlurR
endif


if kMod == 3 then
aStBlurL, aStBlurR blurMe aStretchL, aStretchR,iFFTsize,kBlurSize,iReso
aOutL = aStBlurL
aOutR = aStBlurR
endif

kRvrb cabbageGet "rvrb"
kRvrbSizeIn cabbageGet "rvrbsize"
kRvrbMines cabbageGet "rvrbmins"
kRvrbMin cabbageGet "rvrbmin"
kRvrbMax cabbageGet "rvrbmax"
kRvrbSize = (kRvrbSizeIn+kBlurSize)
if kRvrb == 1 then
kMixRnd = jspline:k(0.4, kRvrbMin, kRvrbMax) + 0.5

aRvbL, aRvbR  freeverb aOutL, aOutR,kRvrbSize/3, kRvrbSize;,1
aRvbMixL		ntrpol		aOutR, aRvbL , kMixRnd
aRvbMixR		ntrpol		aOutR, aRvbR , kMixRnd
aOutL = aRvbMixL
aOutR = aRvbMixR
endif


chnmix aOutL*aEnv, "outl"
chnmix aOutR*aEnv, "outr"
endin


instr Widgets
;aInL,aInR diskin2 "../flute.wav", 1, 0, 1
aInL, aInR ins
chnmix aInL, "sndl"
chnmix aInR, "sndr"
 kSize cabbageGet "size" 
 kOnOff cabbageGet "onoff"
 kMetro cabbageGet "metro"
 kSpeedMin cabbageGet "spdmin"
 kSpeedMax cabbageGet "spdmax"
 kSizeMin cabbageGet "sizemin"
 kSizeMax cabbageGet "sizemax"
 kDur cabbageGet "durblur"
 kReso cabbageGet "blurres"
 kStartIn cabbageGet "strt"
 kStart = kSize*kStartIn
 if kOnOff == 1 && changed(kOnOff) == 1 && kMetro == 0 then
 schedulek "Record", 0, 9999
 schedulek "Play", kStart, 9999,kSize
 elseif kOnOff == 0 && kMetro == 0 then
 turnoff2 "Record", 0, 1
 turnoff2 "Play", 0, 1
 elseif kOnOff == 0 && kMetro == 1 then
  kTimePlay init 1
 if metro(1/kTimePlay) == 1  then
 kDurPlay = kTimePlay*kDur
 kSize random kSizeMin, kSizeMax
 schedulek "Record", 0, kDurPlay
 schedulek "Play", kStart, kDurPlay, kSize
 kTimePlay random kSpeedMin, kSpeedMax
 endif
 endif
 

kMix cabbageGet "mix"
aOutL chnget "outl" 
aOutR chnget "outr" 
kPortTime linseg 0, 0.001, 0.1
 kMix portk kMix, kPortTime
	aMixL		ntrpol		aInL, aOutL, kMix
	aMixR		ntrpol		aInR, aOutR, kMix
	out aMixL, aMixR
 chnclear "outl"
 chnclear "outr"

endin

</CsInstruments>
<CsScore>
i "Widgets" 0 [6^6]
</CsScore>
</CsoundSynthesizer>

