<Cabbage>
form caption("fbnoise") size(300, 200), guiMode("queue"), pluginId("fbns") colour(30,30,50)
;noise
image bounds(194, 152, 20, 20) channel("noiseshow") colour(70, 70, 70, 255)
rslider bounds(14, 20, 60, 60) channel("noiseplay1") range(0, 1, 0.5, 1, 0.1) text("tuning") trackerColour(111, 157, 217, 255)
rslider bounds(82, 20, 60, 60) channel("noiseplay2") range(0, 1, 0.5, 1, 0.001) text("Noisy") trackerColour(111, 157, 217, 255)
rslider bounds(152, 20, 60, 60) channel("noiseplay3") range(0, 100, 0, 1, 1) text("range") trackerColour(111, 157, 217, 255)
rslider bounds(222, 20, 60, 60) channel("noiseplay4") range(0, 70, 10, 1, 1) text("speed") trackerColour(111, 157, 217, 255)
rslider bounds(224, 116, 60, 60) channel("noiseplay6") range(0.1, 7, 3, 1, 0.01) text("gain") trackerColour(111, 157, 217, 255)
button bounds(18, 126, 100, 40), channel("noiseply"), , colour:0(70, 70, 80, 255) colour:1(50, 80, 150, 255) text("noise", "running")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

massign 0,0

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
 out aOut, aOut
endin


instr widget
kNoisePlay cabbageGet "noiseply"
if kNoisePlay == 1 && changed(kNoisePlay) == 1 then
schedulek "radioNoise", 0, 99999
elseif kNoisePlay ==0 && changed(kNoisePlay) == 1 then
turnoff2 "radioNoise", 0,0
endif
endin
</CsInstruments>
<CsScore>
i "widget" 0 999999
</CsScore>
</CsoundSynthesizer>
