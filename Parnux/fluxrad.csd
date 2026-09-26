
<Cabbage>
form caption("FluxRad")    size(880, 620)   guiMode("queue") colour(20,20,40) pluginId("flrd") ; style("legacy")
label bounds(664, 84, 185, 37) channel("sec") fontColour(169, 196, 219, 255) text(" 0 : 00 : 08")s
;;radio input
image bounds(360, 422, 274, 176) channel("cover8") colour(30, 30, 50, 255)
image bounds(24, 36, 302, 282) channel("cover1") colour(30, 30, 50, 255)
image bounds(24, 354, 302, 244) channel("cover12") colour(30, 30, 50, 255)
hmeter bounds(30, 292, 187, 16) channel("rline") outlineColour(0, 0, 0, 255) overlayColour(50, 50, 80, 255)    value(0.331562) corners(0) meterColour:0(120, 182, 207, 255)

nslider bounds(228, 260, 50, 35) channel("ampn1") range(-60, 20, -5, 1, 1)  colour(37, 56, 75, 255)
rslider bounds(110, 218, 60, 60) channel("rvspd") range(10, 180, 10, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(40, 218, 60, 60) channel("rvmix") range(0, 1, 0, 1, 0.001) text("rvrs mix") trackerColour(111, 157, 217, 255)
label bounds(74, 182, 121, 16) channel("labelr100") text("Revers-Machine")
button bounds(40, 176, 25, 25) channel("metrorvs") colour:0(70, 70, 80) colour:1(50, 150, 250) text("") value(0)
label bounds(68, 60, 101, 16) channel("labelr1001") text("FX-Machine")
button bounds(40, 50, 25, 25) channel("metrofx") colour:0(70, 70, 80) colour:1(50, 150, 250) text("") value(0)
rslider bounds(40, 90, 60, 60) channel("fxspd") range(10, 180, 50, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
label bounds(186, 60, 101, 16) channel("labelr10s") text("blur-control")

rslider bounds(192, 90, 60, 60) channel("blrspd") range(0, 10, 0, 1, 1) text("speed") trackerColour(111, 157, 217, 255)

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
image bounds(570, 94, 20, 20) channel("ampshow") colour(30, 30, 30, 255)
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
image bounds(648, 133, 217, 245) channel("cover5") colour(30, 30, 50, 255)
button bounds(764, 146, 90, 35) channel("tapeply") colour:0(70, 70, 80) colour:1(50, 80, 150) text("tape", "running") value(0)
hmeter bounds(662, 198, 149, 16) channel("rcline1") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
hmeter bounds(662, 230, 149, 16) channel("rcline2") outlineColour(0, 0, 0) overlayColour(50, 50, 80)   meterColour:0(120, 182, 207) value(0.5)
rslider bounds(660, 274, 60, 60) channel("tapepch1") range(-2400, 1200, 0, 1, 50) text("cent1") trackerColour(111, 157, 217, 255)
rslider bounds(724, 274, 60, 60) channel("tapepch2") range(-2400, 1200, 0, 1, 50) text("cent2") trackerColour(111, 157, 217, 255)

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

nslider bounds(380, 286, 88, 37) channel("tflt") range(1, 10, 1, 1, 0.1) text("filter") colour(42, 50, 55, 255)
checkbox bounds(826, 196, 20, 20) channel("tr1") colour:0(58, 63, 67, 255) colour:1(255, 72, 0, 255)
checkbox bounds(826, 228, 20, 20) channel("tr2") colour:0(58, 63, 67, 255) colour:1(255, 72, 0, 255)



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 --displays ; -n -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1


;pgmassign 0, 0
;ctrlinit 1,58,64



giTableSize = 15;sec
giTable ftgen 0, 0, giTableSize*sr, 2, 0
giTableLen = ftlen(giTable) / sr


giTabRec1 ftgen 0, 0, giTableSize*sr, 2, 0
giTabRec2 ftgen 0, 0, giTableSize*sr, 2, 0

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
 aIn1 inch 1
 aIn2 inch 2
 aIn sum aIn1, aIn2
 iStart random 0, 40
; aIn diskin "radio.wav", 1, iStart, 1
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
 kTpe cabbageGet "tapeply"
 kLoopMix cabbageGet "rvmix"
 
 iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn    poscil 1, (1/giTableLen),  giTable,iPhase
 aRvrs  poscil 1, (-1/giTableLen), giTable,iPhase
 aMix ntrpol aIn,aRvrs, kLoopMix
 

kSpeedBlr cabbageGet "blrspd"
if kSpeedBlr == 0 then
kMixBlrOut = 0 
else
kMixBlr = int(randomh:k(0, 100,1/kSpeedBlr)) > 40 ? 0 : 1 
kMixBlrOut port kMixBlr, 0.1
endif
 
 kBlurSize = 0.2 ;randomh 1, 5, 3
 aBlur blurMe aMix, kBlurSize, kMixBlrOut
 
 aOut = aBlur
 if kSpeedBlr != 0 && //
 (kFrz == 1 || kLop == 1 || kTnr == 1 || kPch == 1 || kTpe == 1) then
 ;aOut = aBlur*0
 aOut blurMe aMix*0.3, kBlurSize, 1
 elseif kFrz == 1 || kLop == 1 || kTnr == 1 || kPch == 1 || kTpe == 1 then
 aOut = a(0)
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
 printk2 kTrig
Scolor sprintfk "colour(%d, %d,%d)", (80*kTrig)+30,(80*kTrig)+30,(150*kTrig)+30
 cabbageSet 1, "frzshow", Scolor
 aFrz FrzMono aMix,kTrig
 aEnv linen aFrz, 0.05, p3, 0.05
 kLFOfrq rspline 1, kTimeAmp, 2, 5
 if kTrig == 1 && kTimeAmp > 1 then
 aLFO lfo 1, kLFOfrq, 3
 kLFO lfo 1, kLFOfrq, 3
 else
 aLFO = 1
 kLFO = 0
 endif
 Scolor2 sprintfk "colour(%d, %d,%d)", (80*kLFO)+30,(80*kLFO)+30,(150*kLFO)+30
 cabbageSet 1, "ampshow", Scolor2
 
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
  kTflt cabbageGet "tflt"
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
 aSine1 vco2 ampdb(kamp), kFrq, 2, 0.5
 aSine1 clfilt aSine1, kFrq*kTflt, 0, 50
 aSine2 poscil ampdb(kamp)/2, kFrq*1.5
 aOut = (aSine1)*kGain
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
 aGauss1 gausstrig kRng*5, kFrq*5, 0.8
 aGauss2 gaussi kRng/2, kRng/50, kFrq
 aWNoise noise 0.8, 0.5
 aNoise = (aWNoise+aGauss1+aGauss2)*kharsh
 aFb init 1
 kFb scale kNoiseIn, 170, 10
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

gkTapeTime1 init 0
gkTapeTime2 init 0
gkTapeLen1  init 0
gkTapeLen2  init 0

instr taperec1
kRadioLine phasor 1/giTableSize
kTimeLine line 0, 1, 1
if kTimeLine >= giTableSize then
turnoff
endif
gkTapeTime1 = kTimeLine
gkTapeLen1 = kRadioLine
cabbageSetValue "rcline1", kRadioLine
iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn    poscil 1, (1/giTableLen),  giTable,iPhase
 aLine linseg 0, giTableLen, giTableLen*sr
 tablew aIn, aLine, giTabRec1
endin

instr taperec2
kRadioLine phasor 1/giTableSize
kTimeLine line 0, 1, 1
if kTimeLine >= giTableSize then
turnoff
endif
gkTapeTime2 = kTimeLine
gkTapeLen2 = kRadioLine
cabbageSetValue "rcline2", kRadioLine
iStart = i(gkTableTime)
 iPhase = iStart/giTableLen
 aIn    poscil 1, (1/giTableLen),  giTable,iPhase
 aLine linseg 0, giTableLen, giTableLen*sr
 tablew aIn, aLine, giTabRec2
endin


instr tape1
kPchIn cabbageGetValue "tapepch1"
kPchRnd jspline 50, 2, 7
kPch = cent:k(kPchIn+kPchRnd)
iTime = i(gkTapeTime1)
iLen = i(gkTapeLen1)
kRadioLine phasor 1/iTime*kPch
cabbageSetValue "rcline1", kRadioLine
aPointer =  (phasor:a(1/iTime*kPch))*iLen
aSound table aPointer,giTabRec1,1
chnmix aSound, "out"
endin

instr tape2
kPchIn cabbageGetValue "tapepch2"
kPchRnd jspline 50, 2, 7
kPch = cent:k(kPchIn+kPchRnd)
iTime = i(gkTapeTime2)
iLen = i(gkTapeLen2)
kRadioLine phasor 1/iTime*kPch
cabbageSetValue "rcline2", kRadioLine
aPointer =  (phasor:a(1/iTime*kPch))*iLen
aSound table aPointer,giTabRec2,1
chnmix aSound, "out"
endin

;schedule "tape", 1, 9999

instr speakers
 aIn chnget "out"
 kMasterdB cabbageGet "outn1"
 kMaster ampdb kMasterdB
 aMaster interp kMaster
aShow1 = aIn*aMaster
display	aShow1, 1/1000, 5
aOut = aIn*aMaster
 kMax max_k aOut, metro(20), 1
 cabbageSetValue "meter2", kMax, metro(20)
 out aOut,aOut
 ;fout "record.wav", 8, aOut
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


instr widgets
 iDurMaster = 99999
    schedule "time", 0, iDurMaster
    schedule "speakers", 0, iDurMaster
    schedule "radioRecMachine", 0, iDurMaster
    schedule "radioPlay", 1, iDurMaster

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
  
    kTrgTape1 cabbageGet "tr1"
    kTrgTape2 cabbageGet "tr2"
    kTapePly  cabbageGet "tapeply"
    if     kTrgTape1 == 1 && changed(kTrgTape1) == 1 then
	schedulek "taperec1", 0, 99999
    elseif kTrgTape1 == 0 && changed(kTrgTape1) == 1 then
	turnoff2 "taperec1", 0, 0
    endif
    if     kTrgTape2 == 1 && changed(kTrgTape2) == 1 then
	schedulek "taperec2", 0, 99999
    elseif kTrgTape2 == 0 && changed(kTrgTape2) == 1 then
	turnoff2 "taperec2", 0, 0
    endif
    if     kTapePly == 1 && changed(kTapePly) == 1 then
	schedulek "tape1", 0, 99999
	schedulek "tape2", 0, 99999
    elseif kTapePly == 0 && changed(kTapePly) == 1 then
	turnoff2 "tape1", 0, 0
	turnoff2 "tape2", 0, 0
    endif
endin

</CsInstruments>
<CsScore>
i "widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

