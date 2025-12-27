/*
Ramkal VSTe package v6.0
written by parham izadyar | 2020-225 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage> bounds(0, 0, 0, 0)
form size(400, 250), caption("Morph")  guiMode("queue") pluginId("mrph") colour(30,30,50)
rslider bounds(20, 78, 60, 60), channel("morph"), range(0, 1, 0.5, 1, 0.001), text("Morph"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(84, 78, 60, 60), channel("basefrq"), range(10, 800, 60, 1, 10), text("Freq"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(150, 78, 60, 60), channel("purefrq"), range(10, 800, 60, 1, 10), text("purity"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
combobox   bounds(100, 20, 75, 30), text("clr", "cello", "oboe", "flute","trmp", "horn" ), channel("sound"), value(1),  colour(56, 63, 79, 255)
combobox   bounds(268, 20, 110, 30), text("purity off", "purity on"), channel("pure"), value(1),  colour(56, 63, 79, 255)
combobox   bounds(190, 24, 61, 23), text("64", "128","256","512","1024","2048","4096","8192"), channel("fft"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(248, 78, 60, 60), channel("gain"), range(-30, 30, 0, 1, 1), text("Gain"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(320, 78, 60, 60), channel("mix"), range(0, 1, 1, 1, 0.01), text("Mix"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
checkbox bounds(18, 22, 72, 24) channel("start") text("start") colour:0(102, 113, 128, 255) colour:1(221, 255, 0, 255)
signaldisplay bounds(20, 170, 158, 61), channel("display1") colour("white") displayType("waveform"), backgroundColour(30,40,70), zoom(-1), signalVariable("aShow1")
signaldisplay bounds(218, 170, 158, 61), channel("display2") colour("white") displayType("waveform"), backgroundColour(30,40,70), zoom(-1), signalVariable("aShow2")
label bounds(22, 155, 80, 12) channel("label10011") text("input signal")
label bounds(222, 155, 80, 12) channel("label10012") text("output signal")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays 
</CsOptions>
<CsInstruments>

;sr = 48000
ksmps = 64
;nchnls = 1
0dbfs = 1

giSine  ftgen 0, 0, 16384, 10, 1.0 ;0.05, 0.7, 0.05, 0.5, 0.05, 0.3, 0.05, 0.2, 0.05
giClr   ftgen 0, 0, 16384, 10, 1.0, 0.05, 0.7, 0.05, 0.5, 0.05, 0.3, 0.05, 0.2, 0.05
giCello ftgen 0, 0, 16384, 10, 1.0, 0.7, 0.6, 0.5, 0.4, 0.3, 0.25, 0.2, 0.15, 0.1
giOboe  ftgen 0, 0, 16384, 10, 1.0, 0.4, 0.8, 0.3, 0.6, 0.25, 0.5, 0.2, 0.4, 0.15
giFlute ftgen 0, 0, 16384, 10, 1.0, 0.3, 0.2, 0.15, 0.1, 0.08, 0.06, 0.05, 0.04, 0.03
giTrmp  ftgen 0, 0, 16384, 10, 1.0, 0.8, 0.7, 0.6, 0.5, 0.4, 0.35, 0.3, 0.25, 0.2
giHorn  ftgen 0, 0, 16384, 10, 1.0, 0.6, 0.5, 0.4, 0.35, 0.3, 0.25, 0.2, 0.15, 0.1


opcode myTuner, akk,aki
aIn, kBaseFrq, iWave xin
if iWave == 0 then
iWave = giSine
endif
kPortTime linseg 0, 0.1, 0.1
kFrq,kDb  ptrack aIn, 2048,3
kFrq samphold kFrq, changed(int(kFrq/10)*10)
kDb portk kDb, kPortTime
    until kFrq < kBaseFrq+100 do
    kFrq = kFrq/2
    od
    until kFrq > kBaseFrq do
    kFrq = kFrq*2
    od 
  aOut  poscil ampdb(kDb),kFrq, iWave
xout aOut, kDb, kFrq
endop

instr 1
iMod cabbageGetValue "sound"
kBaseFrq cabbageGet "basefrq"
kMix cabbageGet "mix" 
kGain = ampdb:k(cabbageGetValue:k("gain"))
kPureFrq cabbageGet "purefrq"
kPureFrq scale kPureFrq, 800, 10, 10, 800
kMorphMix cabbageGet "morph"
iFFT cabbageGetValue "fft" 
kPurityOnOff cabbageGet "pure"
if iFFT == 3 then
iFFT = 2
endif
iFFTsize = 2^(iFFT+5)
iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
 aInL, aInR ins 
endif
aIn = (aInL+aInR)
;aIn diskin "deltest1.wav", 1, 0, 1
if     iMod == 1 then
iWave = giClr
elseif iMod == 2 then
iWave = giCello
elseif iMod == 3 then
iWave = giOboe
elseif iMod == 4 then
iWave = giFlute
elseif iMod == 5 then
iWave = giTrmp
elseif iMod == 6 then
iWave = giHorn
endif



;;morph
aSim,k1,kFrq myTuner aIn, kBaseFrq,iWave
f1     pvsanal  aIn, iFFTsize, iFFTsize/4, iFFTsize, 1
f2     pvsanal  aSim, iFFTsize, iFFTsize/4, iFFTsize, 1 
fs1   pvscale f1, 1  
fs2   pvscale f2, 1 
   if iFFTsize <= 128 then
   fsound    pvsfilter fs2, fs1, 1
   elseif iFFTsize >= 256 then
   fsound		 pvsmorph f1, f2, kMorphMix, kMorphMix
   endif
   
;filter
kacf = 1/100
kfcf = 1/100
ftps pvsmooth fsound, kacf, kfcf
 klowcut = kFrq*0.7
 khighcut = (kFrq*1.3)+kPureFrq
fpure  pvsbandp	ftps, klowcut, klowcut+10, khighcut, khighcut+10
aGen		pvsynth	ftps   
aSine,k1,k2 myTuner aGen, kBaseFrq*2 , 0  


if kPurityOnOff == 1 then
fmorph = fsound
kSineEnv = 0
elseif kPurityOnOff == 2 then
fmorph = fpure
kSineEnv scale kPureFrq, 0, 0.2, 100, 10
kSineEnv limit kSineEnv, 0, 0.1
endif
;printk2 kPureFrq
;;generate sound   
aSound      pvsynth   fmorph
aRvrb = ntrpol:a(aSound,nreverb:a(aSound+(aSine*kSineEnv), 0.3, 0.3),0.2)
aOut ntrpol aIn, aRvrb*kGain, kMix
aFilt clfilt aOut, 200, 1, 10

aShow1 = aIn*2
aShow2 = aFilt*2
display aShow1, 1/1000, 20
display aShow2, 1/1000, 20
out aFilt
endin



instr 2
kStart cabbageGet "start"
kMod cabbageGet "sound"
kFFT cabbageGet "fft" 
if kStart == 1 && changed(kStart) == 1 then
schedulek 1, 0, 99999
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 1,0,0
endif
if changed(kMod,kFFT) == 1 then
turnoff2 1,0,0
cabbageSetValue "start", k(0)
endif
endin
</CsInstruments>
<CsScore>
i2 0 9999999
</CsScore>
</CsoundSynthesizer>



