; parnux VSTe v5.2, Cabbage v2.9.0
; Written by Parham Izadyar, 2022-2024
; parhamizadyar.net
<Cabbage>
form caption("Blur") size(240,400), pluginId("blur") colour( 30, 30, 50) guiMode("queue")
;image bounds(0, 0, 220, 150) file("back.jpg")
combobox   bounds(134, 64, 57, 23), text("1024","2048","4096","8192"), channel("fft"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(32, 56, 60, 60) channel("size") text("Size") range(0, 1, 0.3, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(32, 184, 60, 60) channel("spd") text("speed") range(0, 1, 0.7, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(144, 184, 60, 60) channel("rng") text("range") range(0, 0.4, 0.1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
checkbox  bounds(30, 154, 75, 21), text("Metro") , channel("metro")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
checkbox  bounds(30, 20, 75, 21), text("On/Off") , channel("onoff")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(144, 302, 60, 60), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)  
rslider bounds(32, 302, 60, 60), channel("maingain"), text("Gain"), range(0, 4, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)  
combobox   bounds(134, 92, 85, 23), text("scrtch", "blur", "sch & blr"), channel("blurmod"), value(1), fontColour(255,255,255) colour(56, 63, 79, 255)
image bounds(22, 136, 200, 3) channel("image10009") colour(135, 162, 173, 255)
image bounds(22, 276, 200, 3) channel("image10010") colour(135, 162, 173, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr = 44100
ksmps = 64
0dbfs = 1
;nchnls = 1

giTable1    ftgen  0, 0, 15*sr, 2, 0
giTable2    ftgen  0, 0, 15*sr, 2, 0


giTableLength = ftlen(giTable1)/sr


seed 0


opcode blurMe, a,aik
aIn, iFFTsize, kBlurSize xin
	ioverlap = iFFTsize/4
	iwinsize = iFFTsize
	iwintype = 1
fftin	pvsanal	aIn, iFFTsize, ioverlap, iwinsize, iwintype
fftblur	pvsblur	fftin, kBlurSize, 1; blur
aOut		pvsynth	fftblur
xout aOut
endop

gaAudio init 0
instr Record1
aPointer linseg 0, giTableLength, giTableLength*sr
tablew gaAudio, aPointer, giTable1
endin

instr Record2
aPointer linseg 0, giTableLength, giTableLength*sr
tablew gaAudio, aPointer, giTable2
endin


instr Play1
iFFTsizeIn = p4+3
iFFTsize = 2^(iFFTsizeIn+6)
iSize = p5
iStrchSize = iSize*10
kBlurSize = iSize*2
   aStretch paulstretch iStrchSize, 1, giTable1
kMod cabbageGet "blurmod"
iAtt = 0.1
iRel = p3/2
aEnv	linsegr	0,iAtt, 1, iRel, 0
aPointer linseg 0, giTableLength, 1
aIn table aPointer,giTable1, 1
if kMod == 1 then
aOut = aStretch
elseif kMod == 2 then
aBlur blurMe aIn,iFFTsize,kBlurSize
aOut = aBlur
elseif kMod == 3 then
aStBlur blurMe aStretch,iFFTsize,kBlurSize
aOut = aStBlur
endif
chnmix aOut*aEnv, "out1"
endin

instr Play2
iFFTsizeIn = p4+3
iFFTsize = 2^(iFFTsizeIn+6)
iSize = p5
iStrchSize = iSize*10
kBlurSize = iSize*2
   aStretch paulstretch iStrchSize, 1, giTable2
kMod cabbageGet "blurmod"
iAtt = 0.1
iRel = p3/2
aEnv	linsegr	0,iAtt, 1, iRel, 0
aPointer linseg 0, giTableLength, 1
aIn table aPointer,giTable2, 1
if kMod == 1 then
aOut = aStretch
elseif kMod == 2 then
aBlur blurMe aIn,iFFTsize,kBlurSize
aOut = aBlur
elseif kMod == 3 then
aStBlur blurMe aStretch,iFFTsize,kBlurSize
aOut = aStBlur
endif
chnmix aOut*aEnv, "out2"
endin

instr Widgets
;aInL,aInR diskin2 "../flute.wav", 1, 0, 1
iDurMaster = 9^9

iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif
aIn = aInL+aInR
;aInL,aInR diskin "test.wav", 1, 0, 1
gaAudio = aIn

 kSize cabbageGet "size" 
 kOnOff cabbageGet "onoff"
 kFFTsize cabbageGet "fft"
 
 if changed(kSize) == 1 || changed(kFFTsize) == 1 then
 turnoff2 "Play1", 0, 1
 turnoff2 "Play2", 0, 1
 turnoff2 "Record1", 0, 1
 turnoff2 "Record2", 0, 1
 cabbageSetValue "onoff", k(0)
 cabbageSetValue "metro", k(0)
 endif
kMetro cabbageGet "metro"
 
 if     kOnOff == 1 && changed(kOnOff) == 1 && kMetro == 0 then
 schedulek "Record1", 0, iDurMaster
 schedulek "Play1", 0.1, iDurMaster, kFFTsize, kSize
 elseif kOnOff == 0 && changed(kOnOff) == 1 then
 turnoff2 "Record1", 0, 1
 turnoff2 "Play1", 0, 1
 endif

kTimeIn cabbageGet "spd"
kRng cabbageGet "rng"

kSpeed init 1
;printk2 kSpeed
if kMetro == 1 && kOnOff == 0 then

if metro(1/kSpeed) == 1 then
kSpeed scale kTimeIn, 20, 1, 0, 1
kDur = kSpeed/2
kStart = kSpeed/2
kSize1 = kSize+(rand:k(kRng))
kSize1 limit kSize1, 0, 1
 schedulek "Record1", 0, kDur
 schedulek "Play1", 0.1, kDur, kFFTsize, kSize1
kSize2 = kSize+(rand:k(kRng))
kSize2 limit kSize2, 0, 1
 schedulek "Record2",kStart    , kDur
 schedulek "Play2"  ,kStart+0.1, kDur, kFFTsize, kSize2
endif

endif

kMainGain cabbageGet "maingain"
aMainGain interp kMainGain

kMix cabbageGet "mix"
aOut1 chnget "out1" 
aOut2 chnget "out2" 
aOut sum aOut1, aOut2
kPortTime linseg 0, 0.001, 0.05
 kMix portk kMix, kPortTime
	aMixL		ntrpol		aInL, aOut, kMix
	aMixR		ntrpol		aInR, aOut, kMix
aOutL = aMixL*aMainGain
aOutR = aMixR*aMainGain	
out aOutL, aOutR

 chnclear "out1", "out2"

endin

</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

