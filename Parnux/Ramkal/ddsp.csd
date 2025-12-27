/*
Ramkal VSTe package v6.0
written by parham izadyar | 2020-225 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
form caption("DDSP") size(210,280), pluginId("ddsp") colour( 30, 30, 50) guiMode("queue")
rslider bounds(28, 12, 60, 60), channel("audio1"), text("Audio1"), range(-60, 20, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(116, 12, 60, 60), channel("audio2"), text("Audio2"), range(-60, 20, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
combobox   bounds(68, 96, 57, 23), text("128","256","512","1024","2048"), channel("fftsize"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(28, 202, 60, 60), channel("maingain"), text("Gain"), range(-15, 40, 20, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(116, 202, 60, 60), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
hmeter bounds(20, 150, 168, 15) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
hmeter bounds(20, 174, 168, 15) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
kFFTsize cabbageGet "fftsize"
kGaindB1 cabbageGet "audio1"
kGaindB2 cabbageGet "audio2"
kGainddB cabbageGet "maingain"
kMix     cabbageGet "mix"

kGain1 ampdb kGaindB1
kGain2 ampdb kGaindB2
kGain ampdb kGainddB
aIn1 inch 1
aIn2 inch 2
;aIn1 diskin2 "fox.wav", 1, 0, 1
;aIn2,aIn2 diskin2 "test.wav", 1, 0, 1
a1 = aIn1*kGain1
a2 = aIn2*kGain2
kFFTSize  init  3 
	 if changed(kFFTsize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTsize)+6)
iOverlap = iFFTsize/4
iWinSize = iFFTsize
iWinType = 1
f1        pvsanal  a1, iFFTsize, iOverlap, iWinSize, iWinType
f2        pvsanal  a2, iFFTsize, iOverlap, iWinSize, iWinType
fScale1   pvscale f1, 1  
fScale2   pvscale f2, 1 
fChange   pvsfilter fScale2, fScale1, 1
aChange   pvsynth   fChange
rireturn
aOut clip aChange*kGain, 1, 0.9
 aMixL  ntrpol  aIn1, aOut, kMix
 aMixR  ntrpol  aIn2, aOut, kMix
 kMaxL max_k aMixL, metro(20), 1
 kMaxR max_k aMixR, metro(20), 1
 cabbageSetValue "meter1", kMaxL, metro(20)
 cabbageSetValue "meter2", kMaxR, metro(20)
out aMixL,aMixR
endin

</CsInstruments>
<CsScore>
i 1 0 999999
</CsScore>
</CsoundSynthesizer>

