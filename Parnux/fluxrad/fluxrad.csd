
<Cabbage>
form caption("FluxRad")    size(880, 620)   guiMode("queue") colour(20,20,40) pluginId("flrd") ; style("legacy")
label bounds(664, 140, 185, 37) channel("sec") fontColour(169, 196, 219, 255) text(" 0 : 00 : 05")s
button bounds(700, 74, 110, 35) channel("start") colour:0(102, 102, 113, 255) colour:1(50, 80, 150) text("S  T  A  R  T", "S  T  O  P") value(1)
;;radio input
image bounds(360, 422, 274, 176) channel("cover8") colour(30, 30, 50, 255)

image bounds(24, 36, 302, 282) channel("cover1") colour(30, 30, 50, 255)
image bounds(24, 354, 302, 244) channel("cover12") colour(30, 30, 50, 255)

nslider bounds(228, 260, 50, 35) channel("ampn1") range(-60, 20, -5, 1, 1)  colour(37, 56, 75, 255)
rslider bounds(110, 218, 60, 60) channel("rvspd") range(10, 180, 10, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(40, 218, 60, 60) channel("rvmix") range(0, 1, 0, 1, 0.001) text("rvrs mix") trackerColour(111, 157, 217, 255)
label bounds(74, 182, 121, 16) channel("labelr100") text("Revers-Machine")
button bounds(40, 176, 25, 25) channel("metrorvs") colour:0(70, 70, 80) colour:1(50, 150, 250) text("") value(1)
label bounds(68, 60, 101, 16) channel("labelr1001") text("FX-Machine")
button bounds(40, 50, 25, 25) channel("metrofx") colour:0(70, 70, 80) colour:1(50, 150, 250) text("") value(0)
rslider bounds(40, 90, 60, 60) channel("fxspd") range(10, 180, 50, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
label bounds(186, 60, 101, 16) channel("labelr10s") text("blur-control")

rslider bounds(192, 90, 60, 60) channel("blrspd") range(10, 180, 70, 1, 1) text("speed") trackerColour(111, 157, 217, 255)

vmeter bounds(292, 156, 15, 143) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)      value(0.39405)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
label bounds(510, 498, 118, 16) channel("labelpp11") text("pitch-Machine")
button bounds(602, 522, 25, 25) channel("metropch") colour:0(70, 70, 80) colour:1(50, 150, 250) text("") value(0)
;pitch
button bounds(534, 446, 90, 35) channel("pchply") colour:0(70, 70, 80) colour:1(50, 80, 150) text("Pitch Shifter", "running") value(0)
rslider bounds(374, 450, 60, 60) channel("pchpch") range(0.2, 1.5, 0.5, 1, 0.01) text("pitch") trackerColour(111, 157, 217, 255)
rslider bounds(444, 450, 60, 60) channel("pchspd") range(0.2, 1.5, 0.5, 1, 0.01) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(442, 522, 60, 60) channel("spdmetro") range(1, 7, 3, 1, 0.1) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(374, 522, 60, 60) channel("pchmetro") range(1, 7, 3, 1, 0.1) text("pitch") trackerColour(111, 157, 217, 255)
;freeze
image bounds(360, 36, 272, 90) channel("cover2") colour(30, 30, 50, 255)
button bounds(532, 48, 90, 35) channel("frzply") colour:0(70, 70, 80) colour:1(50, 80, 150) text("freeze", "running") value(0)
rslider bounds(372, 52, 60, 60) channel("rndfrz") range(0.2, 7, 0.5, 1, 0.1) text("frz time") trackerColour(111, 157, 217, 255)
rslider bounds(436, 52, 60, 60) channel("rndamp") range(1, 12, 4, 1, 0.1) text("amp time") trackerColour(111, 157, 217, 255)
image bounds(594, 94, 20, 20) channel("frzshow") colour(30, 30, 30, 255)
;loop
image bounds(361, 134, 272, 130) channel("cover3") colour(30, 30, 50, 255)
button bounds(532, 146, 90, 35) channel("loopply") colour:0(70, 70, 80) colour:1(50, 80, 150) text("loop", "running") value(0)
rslider bounds(372, 194, 60, 60) channel("lptime") range(0.3, 10, 3, 1, 0.01) text("time") trackerColour(111, 157, 217, 255)
rslider bounds(436, 194, 60, 60) channel("lprep") range(2, 12, 3, 1, 1) text("rep") trackerColour(111, 157, 217, 255)
hmeter bounds(370, 152, 150, 16) channel("lpline") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
image bounds(588, 200, 20, 20) channel("lpshow") colour(30, 30, 30)
;tuner
image bounds(361, 274, 272, 138) channel("cover4") colour(30, 30, 50, 255)
button bounds(532, 286, 90, 35) channel("tunerply") colour:0(70, 70, 80) colour:1(50, 80, 150) text("tuner", "running") value(0)
rslider bounds(372, 338, 60, 60) channel("tnmin") range(200, 900, 300, 1, 1) text("min") trackerColour(111, 157, 217, 255)
rslider bounds(436, 338, 60, 60) channel("tnmax") range(400, 1200, 500, 1, 1) text("max") trackerColour(111, 157, 217, 255)
rslider bounds(500, 338, 60, 60) channel("tnstep") range(20, 200, 80, 1, 1) text("step") trackerColour(111, 157, 217, 255)
rslider bounds(564, 338, 60, 60) channel("tngain") range(0.01, 2, 0.1, 1, 0.01) text("gain") trackerColour(111, 157, 217, 255)

;tapeRecord


;output
image bounds(649, 391, 216, 204) channel("cover10") colour(30, 30, 50, 255)
label bounds(670, 404, 80, 16) channel("label10029") text("output")
nslider bounds(776, 442, 50, 35) channel("outn1") range(-60, 20, -15, 1, 1) colour(37, 56, 75, 255)

vmeter bounds(832, 426, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255) outlineThickness(0)
signaldisplay bounds(668, 494, 150, 80), channel("display1") colour("white") displayType("waveform"), backgroundColour(40,40,60), zoom(-1), signalVariable("aShow1")

;noise
image bounds(220, 522, 20, 20) channel("noiseshow") colour(70, 70, 70, 255)
rslider bounds(40, 390, 60, 60) channel("noiseplay1") range(0, 1, 0.5, 1, 0.1) text("tuning") trackerColour(111, 157, 217, 255)
rslider bounds(108, 390, 60, 60) channel("noiseplay2") range(0, 1, 0.5, 1, 0.001) text("Noisy") trackerColour(111, 157, 217, 255)
rslider bounds(178, 390, 60, 60) channel("noiseplay3") range(0, 100, 0, 1, 1) text("range") trackerColour(111, 157, 217, 255)
rslider bounds(248, 390, 60, 60) channel("noiseplay4") range(0, 70, 10, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(250, 486, 60, 60) channel("noiseplay6") range(0.1, 7, 3, 1, 0.01) text("gain") trackerColour(111, 157, 217, 255)
button bounds(44, 496, 100, 40), channel("noiseply"), alpha(1), colour:0(70, 70, 80) colour:1(50, 80, 150) text("noise", "running")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


massign 1, "noteMidi"
pgmassign 0, 0
ctrlinit 1,58,64



giTableSize = 15;sec
giTable ftgen 0, 0, giTableSize*sr, 2, 0
giTableLen = ftlen(giTable) / sr


giTabRec1 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec2 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec3 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec4 ftgen 0, 0, giTableSize*sr, 2, 0

seed 0

opcode FrzMono,a,ak
 aIn,kTrig xin
 iFFTsize = 1024
 ioverlap = iFFTsize/4
 iwinsize = iFFTsize
 iwintype = 1 
 f_anal  	pvsanal	aIn, iFFTsize, ioverlap, iwinsize, iwintype
 f_freeze	pvsfreeze f_anal, kTrig, kTrig
 aFrz	    pvsynth f_freeze
 aOut = aFrz
 xout aOut
endop

opcode blurMe, a,akk
aIn, kBlurSize, kMix xin
iFFTsize = 2048
	ioverlap = iFFTsize/4 
	iwinsize = iFFTsize
	iwintype = 1
fftin		pvsanal	aIn, iFFTsize, ioverlap, iwinsize, iwintype
fftblur	    pvsblur	fftin, kBlurSize, 1; blur
aBlur		pvsynth	fftblur
aOut ntrpol aIn, aBlur*2, kMix
xout aOut
endop

opcode lohiFilti, a, aii ;lowPass and HighPass Filters
  aIn, iLowCut, iHighCut xin
  aHighCut clfilt aIn, iHighCut, 0, 10
  aOut clfilt aHighCut, iLowCut, 1, 10
  xout aOut
endop



instr radioRecMachine
kRadioLine phasor 1/giTableSize
cabbageSetValue "rline", kRadioLine
    if metro(1/giTableSize) == 1 then
    schedulek "radioTabRec", 0, giTableSize
    endif
    
;; machine    
kMetroRvs cabbageGet "metrorvs"
kSpeedRvs cabbageGet "rvspd"
 kMix = int(randomh:k(0, 100,1/kSpeedRvs)) < 35 ? 0 : 1 
   kMixOut port kMix, 0.1
   if kMetroRvs == 1 then       
   cabbageSetValue "rvmix", kMixOut  
   endif 
   
;fx
kMetroFx cabbageGet "metrofx"
kSpeedFx cabbageGet "fxspd"


   if kMetroFx == 1 then
   kMod = int(randomh:k(1, 5,1/kSpeedFx))
      if kMod == 1  then
      cabbageSetValue "frzply",   k(1) 
      cabbageSetValue "loopply",  k(0)
      cabbageSetValue "tunerply", k(0)
      cabbageSetValue "pchply",   k(0)
      elseif kMod == 2 then
      cabbageSetValue "frzply",   k(0) 
      cabbageSetValue "loopply",  k(1)
      cabbageSetValue "tunerply", k(0)
      cabbageSetValue "pchply",   k(0)
      elseif kMod == 3 then
      cabbageSetValue "frzply",   k(0) 
      cabbageSetValue "loopply",  k(0)
      cabbageSetValue "tunerply", k(1)
      cabbageSetValue "pchply",   k(0)
      elseif kMod == 4 then
      cabbageSetValue "frzply",   k(0) 
      cabbageSetValue "loopply",  k(0)
      cabbageSetValue "tunerply", k(0)
      cabbageSetValue "pchply",   k(1)
      endif
   endif
kMetroPch cabbageGet "metropch"  
kPchPly   cabbageGet "pchply" 
kSpeedPch cabbageGet "spdmetro"
kPitchPch cabbageGet "pchmetro"
if kMetroPch == 1 && kPchPly == 1 then
kRndPch = jspline:k( 0.07*kPitchPch, 1, kPitchPch) + 1
kRndSpd = jspline:k( 0.07*kSpeedPch, 1, kSpeedPch) + 0.7
cabbageSetValue "pchpch",   kRndPch
cabbageSetValue "pchspd",   kRndSpd
endif
endin



instr radioTabRec
 gkTableTime line 0, 1, 1
; aIn inch 1
 iStart random 0, 40
 aIn diskin "radio.wav", 1, iStart, 1
 kAmpdB cabbageGet "ampn1"
 kAmp ampdb kAmpdB
 aRadio linen aIn*kAmp, 0.01, p3, 0.01
 aSound clip aRadio, 1, ampdb(-0.5)
 kMax max_k aSound, metro(20), 1
 cabbageSetValue "meter1", kMax, metro(20)
  kRms rms aSound
  kAmpdB = 0.1
 if kRms > kAmpdB then
  Scolor = "colour(50,250,100)"
  cabbageSet 1, "radioshow", Scolor
 else
 cabbageSet 1,"radioshow","colour(70, 70, 70)"
 endif
 chnmix aSound, "snd"
 aLine linseg 0, giTableLen, giTableLen*sr
 tablew aSound, aLine, giTable
endin

instr radioPlay
 kFrz cabbageGet "frzply"
 kLop cabbageGet "loopply"
 kTnr cabbageGet "tunerply"
 kPch cabbageGet "pchply"
 kLoopMix cabbageGet "rvmix"
 
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn    poscil 1, (1/giTableLen),  giTable,iPhase
 aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
 aMix ntrpol aIn,aRvrs, kLoopMix
 

kSpeedBlr cabbageGet "blrspd"
 kMixBlr = int(randomh:k(0, 100,1/kSpeedBlr)) < 35 ? 0 : 1 
   printk2 kMixBlr
   kMixBlrOut port kMixBlr, 0.1
 
 kBlurSize = 0.4 ;randomh 1, 5, 3
 aBlur blurMe aMix, kBlurSize, kMixBlrOut
 
 aOut = aBlur
 if kFrz == 1 || kLop == 1 || kTnr == 1 || kPch == 1 then
 ;aOut = aBlur*0
 aOut blurMe aMix*0.3, kBlurSize, 1
 endif
 
 chnmix aOut, "out"
endin

instr radioFrz
 kTime cabbageGet "rndfrz"
 kTimeAmp cabbageGet "rndamp"
 kLoopMix cabbageGet "rvmix"
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn    poscil 1, (1/giTableLen),  giTable,iPhase
 aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
 aMix ntrpol aIn,aRvrs, kLoopMix
 
 kTrig = int(randomh:k(0,2,kTime))
Scolor sprintfk "colour(%d, %d,%d)", (80*kTrig)+30,(80*kTrig)+30,(150*kTrig)+30
 cabbageSet 1, "frzshow", Scolor
 aFrz FrzMono aMix,kTrig
 aEnv linen aFrz, 0.05, p3, 0.05
 kLFOfrq rspline 1, kTimeAmp, 2, 5
 if kTrig == 1 && kTimeAmp > 1 then
 aLFO lfo 1, kLFOfrq, 3
 else
 aLFO = 1
 endif
 aOut = aEnv*aLFO
 chnmix aOut, "out"
endin

;schedule "radioFrz", 0, 999

instr loopMachine
 kTime cabbageGet "lptime"
 kRep cabbageGet "lprep"
    if metro(1/kTime) == 1 then
    kStart random i(gkTableTime), i(gkTableTime)+4
        kndx = 0
        while kndx < kRep do
        schedulek "loopRadio", (kTime/kRep)*kndx, kTime/kRep, kStart
        kndx += 1
        od
    endif
kLoopLine phasor 1/kTime
cabbageSetValue "lpline", kLoopLine
kLoopLED = phasor:k((1/kTime)*kRep) > 0.5 ? 0 : 1
 Scolor sprintfk "colour(%d, %d,%d)", (80*kLoopLED)+30,(80*kLoopLED)+30,(150*kLoopLED)+30
 cabbageSet 1, "lpshow", Scolor
endin

;schedule "loopMachine", 2, 999

instr loopRadio
kLoopMix cabbageGet "rvmix"
iStart = p4
iPhase = iStart/giTableLen
aIn    poscil 1, (1/giTableLen),  giTable,iPhase
aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
aMix ntrpol aIn,aRvrs, kLoopMix
aOut linen aMix, p3/10, p3, p3/10
;outall aOut
chnmix aOut, "out"
endin


instr tunerRadio
 aIn chnget "snd"
 kfr, kamp 	ptrack 		aIn, 1024,10
 kFrq = kfr
 kGain cabbageGet "tngain"
 kFrqFltrUp   cabbageGet "tnmin"
 kFrqFltrDown cabbageGet "tnmax"
 kFrqPort cabbageGet "tnstep"
 kFrqPort = int(kFrqPort/10)*10

 until kFrq < kFrqFltrUp do
 kFrq = kFrq/2
 od
 until kFrq > kFrqFltrDown do
 kFrq = kFrq*2
 od
 kPortTime linseg 0, 0.01, 0.05
 kFrq portk kFrq, kPortTime
 kFrq = int(kFrq/kFrqPort)*kFrqPort
; printk2 kFrq
 kamp portk kamp, kPortTime*2
 aSine1 poscil ampdb(kamp), kFrq
 aSine2 poscil ampdb(kamp)/2, kFrq*1.5
 aOut = (aSine1+aSine2)*kGain
; outall aSine*0.5
Schn sprintf "out%d", 1
chnmix aOut, "out"
 chnclear "snd"
endin

;schedule "tunerRadio", 0, 999




instr radioNoise
kGain cabbageGet "noiseplay6"
kNoiseIn cabbageGet "noiseplay2"
kRng cabbageGet "noiseplay3"
kFrq cabbageGet "noiseplay4"
kharsh scale kNoiseIn, 10, 2
 aGauss1 gausstrig 50, kRng, 0.8
 aGauss2 gaussi kRng/2, 0.3, kFrq
 aWNoise noise 0.8, 0.5
 aNoise = (aWNoise+aGauss1+aGauss2)*kharsh
 aFb init 1
 kFb scale kNoiseIn, 120, 20
 iDelayTime  random 0.1, 0.25
 aNoise = (aNoise*kFb)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, iDelayTime
 kTuneIn cabbageGet "noiseplay1"
 kTune   scale kTuneIn, 10, 0
    if changed(int(kTune)) == 1 then
    kGauss random 0.1*(kTune), 1*(kTune/5)
    kFrq1   random 60, 1000
    kFrq2   random 500, 1000
    kFrq3   random 1000, 2000
    kFrq4   random 500, 5000*(kTune/5)
    kQ1     random 0.1, 0.5
    kQ2     random 0.1, 0.5
    endif
    kPortTime linseg 0, 0.01, 0.001
    kFrq1 portk kFrq1, kPortTime
    kFrq2 portk kFrq2, kPortTime
    kFrq3 portk kFrq3, kPortTime
    kFrq4 portk kFrq4, kPortTime
    kQ1 portk kQ1, kPortTime
    kQ2 portk kQ2, kPortTime
 aFilt1 pareq aFb, kFrq1, 0.001, kQ1, 1
 aFilt2 pareq aFilt1, kFrq2, 0.001, 0.5
 aFilt3 pareq aFilt2, kFrq3, 0.001, kQ2
 aFilt4 pareq aFilt3, kFrq4, 0.001, 0.5, 2
 ;out
aOut = aFilt4*kGain
  kRms rms aFilt4
 if kRms > 0.002 && kRms <= 0.01 then
   cabbageSet 1,"noiseshow","colour(100,150,200)"
  elseif kRms > 0.01 && kRms <= 0.02 then
   cabbageSet 1,"noiseshow","colour(50,250,150)"
  elseif kRms > 0.02 then
   cabbageSet 1,"noiseshow","colour(250,150,100)"
 else
 cabbageSet 1,"noiseshow","colour(70, 70, 70)"
 endif
 chnmix aOut, "out"
endin

;schedule "radioNoise", 0, 999




instr pchspd
kRvrsIn cabbageGet "rvmix"
if kRvrsIn == 0 then
kRvrs = 1
elseif kRvrsIn == 1 then
kRvrs = -1
else
kRvrs = 1
endif
kSpeed cabbageGet "pchspd" ;0.7
iAmp = 1
kPitch cabbageGet "pchpch" ;= 0.9
;aIn    poscil 1, (1/giTableLen),  giTable,iPhase
aSound   temposcal kSpeed*kRvrs, iAmp, kPitch, giTable, 1
 chnmix aSound, "out"
;outall aSound
endin

;schedule "pchspd", 1, 9999

instr speakers
 aIn chnget "out"
 kMasterdB cabbageGet "outn1"
 kMaster ampdb kMasterdB
 aMaster interp kMaster
aShow1 = aIn
aShow2 = aIn*5
display	aShow1, 1/100, 1
dispfft aShow1, 1/100, 1024
display	aShow2, 1/100, 1
dispfft aShow2, 1/100, 512
cabbageSet "display2", "displayType", "spectroscope"
cabbageSet "display2", "skew", 2
aOut = aIn*aMaster
 kMax max_k aOut, metro(20), 1
 cabbageSetValue "meter2", kMax, metro(20)
 outall aOut
 chnclear "out"
endin

instr time
 kTimer line 0, 1, 1
 kSec = int(kTimer)
 kMin init 0
 kSec = kSec % 60
    if kSec == 0 && changed(kSec) == 1 then
    kMin += 1
    endif
 kHr init 0
    if kMin == 0 && changed(kMin) == 1 then
    kHr += 1
    endif
 STimer sprintfk "%2d : %02d : %02d", kHr, kMin, kSec
 cabbageSet 1, "sec", "text", STimer
endin


instr midi
kPad1  ctrl7 1,51,0,1
kPad2  ctrl7 1,52,0,1
kPad3  ctrl7 1,53,0,1
kPad4  ctrl7 1,54,0,1
kPad5  ctrl7 1,55,0,1
kPad6  ctrl7 1,56,0,1
kPad7  ctrl7 1,57,0,1
kPad8  ctrl7 1,58,0,1



kMetroFx cabbageGet "metrofx"
kActive1 active "radioFrz"
kActive2 active "loopMachine"
kActive3 active "tunerRadio"
kActive4 active "radioNoise"
kActive5 active "pchspd"

kActive = kActive1+kActive2+kActive3+kActive4+kActive5



if kMetroFx == 0 then
   cabbageSetValue "frzply",   kPad1
   cabbageSetValue "loopply",  kPad2
   cabbageSetValue "tunerply", kPad3
   cabbageSetValue "pchply",   kPad4
endif    
      cabbageSetValue "noiseply", kPad5 
      cabbageSetValue "metrofx",  kPad6
      cabbageSetValue "metrorvs", kPad7
      cabbageSetValue "metropch", kPad8


kslider3  ctrl7 1,13,0,1
kslider4  ctrl7 1,14,0,1
kslider5  ctrl7 1,15,0,1
kslider6  ctrl7 1,16,0,1
kslider7  ctrl7 1,17,0,1
kslider8  ctrl7 1,18,0,1


kslider9    ctrl7 1,19,10,180
kslider10   ctrl7 1,20,10,180
kslider11   ctrl7 1,21,10,180

cabbageSetValue "fxspd", kslider9
cabbageSetValue "blrspd", kslider10
cabbageSetValue "rvspd", kslider11

;kslider15   ctrl7 1,25,-60,20
;kslider16  ctrl7 1,26,-60,20
;cabbageSetValue "ampn1", kslider15
;cabbageSetValue "outn1", kslider16
;
kPchMachine cabbageGet "metropch" 

if kPad5 == 0 then
    if kPad7 == 0 then
    kslider1  ctrl7 1,11,0,1
    cabbageSetValue "rvmix", kslider1
    elseif kPad7 == 1 then
    kslider1  ctrl7 1,11,30,120
    cabbageSetValue "rvspd", kslider1
    endif
 
    kslider2  ctrl7 1,12,1,12
    kslider3  ctrl7 1,13,0.3,10
    kslider4  ctrl7 1,14,2,12
    kslider5  ctrl7 1,15,300,900
    kslider6  ctrl7 1,16,20,200
    kslider7  ctrl7 1,17,0.01,2
    kslider8  ctrl7 1,18,0,1
    cabbageSetValue "rndfrz", kslider2/2
    cabbageSetValue "rndamp", kslider2
    cabbageSetValue "lptime", kslider3
    cabbageSetValue "lprep", kslider4
    cabbageSetValue "tnmin", kslider5
    cabbageSetValue "tnmax", kslider5+200
    cabbageSetValue "tnstep", kslider6
        if kPchMachine == 0 then
        kslider7  ctrl7 1,17,0.2,1.5
        kslider8  ctrl7 1,18,0.2,1.5
        cabbageSetValue "pchpch", kslider7
        cabbageSetValue "pchspd", kslider8
        elseif kPchMachine == 1 then
        kslider7  ctrl7 1,17,1,7
        kslider8  ctrl7 1,18,1,7
        cabbageSetValue "pchmetro", kslider7
        cabbageSetValue "spdmetro", kslider8
        endif
elseif kPad5 == 1 then
kslider1  ctrl7 1,11,0,1
kslider2  ctrl7 1,12,0,1
kslider3  ctrl7 1,13,0,100
kslider4  ctrl7 1,14,0,70
kslider8  ctrl7 1,18,0.1,7
cabbageSetValue "noiseplay1", kslider1
cabbageSetValue "noiseplay2", kslider2
cabbageSetValue "noiseplay3", kslider3
cabbageSetValue "noiseplay4", kslider4
cabbageSetValue "noiseplay6", kslider8
    if kPad3 == 1 || cabbageGet:k("tunerply") == 1 then
    kslider5  ctrl7 1,15,300,900
    kslider6  ctrl7 1,16,20,200
    kslider7  ctrl7 1,17,0.01,2
    cabbageSetValue "tnmin", kslider5
    cabbageSetValue "tnmax", kslider5+200
    cabbageSetValue "tnstep", kslider6
    cabbageSetValue "tngain", kslider7
    elseif kPad4 == 1 || cabbageGet:k("pchply") == 1 then
        if kPchMachine == 0 then
        kslider5  ctrl7 1,15,0.2,1.5
        kslider6  ctrl7 1,16,0.2,1.5
        cabbageSetValue "pchpch", kslider5
        cabbageSetValue "pchspd", kslider6
        elseif kPchMachine == 1 then
        kslider5  ctrl7 1,15,1,7
        kslider6  ctrl7 1,16,1,7
        cabbageSetValue "pchmetro", kslider5
        cabbageSetValue "spdmetro", kslider6
        endif
    elseif kPad2 == 1 || cabbageGet:k("loopply") == 1 then
    kslider5  ctrl7 1,15,0.3,10
    kslider6  ctrl7 1,16,2,12
    cabbageSetValue "lptime", kslider5
    cabbageSetValue "lprep", kslider6
    elseif kPad1 == 1 || cabbageGet:k("frzply") == 1 then
    kslider5  ctrl7 1,15,0.2,7
    kslider6  ctrl7 1,16,1,12
    cabbageSetValue "rndfrz", kslider5
    cabbageSetValue "rndamp", kslider6
    endif
endif


endin

schedule "midi", 0, 999

instr noteMidi
iMidi notnum
print iMidi
if release() == 1 then
printk2 k(iMidi)
endif
endin

instr widgets
 iDurMaster = 99999
 ;schedule "widgetWrite", 0, 1
 kStart cabbageGet "start"
    if kStart == 1 && changed(kStart) == 1 then
    schedulek "time", 0, iDurMaster
    schedulek "speakers", 0, iDurMaster
    schedulek "radioRecMachine", 0, iDurMaster
    schedulek "radioPlay", 1, iDurMaster
    elseif kStart == 0 && changed(kStart) == 1 then
        kIndx = 1
        while kIndx < 20 do
        turnoff2 kIndx, 0, 0
        kIndx += 1
        od
    endif

    kTrigNoise cabbageGet "noiseply"
    if     kTrigNoise == 1 && changed(kTrigNoise) == 1 then
	schedulek "radioNoise", 0, 99999
    elseif kTrigNoise == 0 && changed(kTrigNoise) == 1 then
	turnoff2 "radioNoise", 0, 0
    endif

    kTrigFrz cabbageGet "frzply"
    if     kTrigFrz == 1 && changed(kTrigFrz) == 1 then
	schedulek "radioFrz", 0, 99999
    elseif kTrigFrz == 0 && changed(kTrigFrz) == 1 then
	turnoff2 "radioFrz", 0, 0
    endif
 
    kTrigLoop cabbageGet "loopply"
    if     kTrigLoop == 1 && changed(kTrigLoop) == 1 then
	schedulek "loopMachine", 0, 99999
    elseif kTrigLoop == 0 && changed(kTrigLoop) == 1 then
	turnoff2 "loopMachine", 0, 0
    endif
    
    kTrigTuner cabbageGet "tunerply"
    if     kTrigTuner == 1 && changed(kTrigTuner) == 1 then
	schedulek "tunerRadio", 0, 99999
    elseif kTrigTuner == 0 && changed(kTrigTuner) == 1 then
	turnoff2 "tunerRadio", 0, 0
    endif
    
    kTrigPch cabbageGet "pchply"
    if     kTrigPch == 1 && changed(kTrigPch) == 1 then
	schedulek "pchspd", 0, 99999
    elseif kTrigPch == 0 && changed(kTrigPch) == 1 then
	turnoff2 "pchspd", 0, 0
    endif
  
endin

</CsInstruments>
<CsScore>
i "widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

