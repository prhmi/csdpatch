/*
Panic — resonant distortion with analog-style saturation.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2026.
parhamizadyar.net
*/
<Cabbage>
form caption("panic") size(220, 430), guiMode("queue") pluginId("pnic") colour(10,20,35)
nslider bounds(12, 12, 86, 43) channel("spdmin") range(1, 600, 2, 1, 1) text("spd min") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 12, 86, 43) channel("spdmax") range(1, 600, 18, 1, 1) text("spd max") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(12, 68, 86, 43) channel("frqmin") range(1, 15000, 2, 1, 1) text("Frq min") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 68, 86, 43) channel("frqmax") range(1, 15000, 2000, 1, 1) text("Frq max") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(12, 122, 86, 43) channel("bndmin") range(0.1, 15000, 0.1, 1, 0.1) text("Bnd min") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 122, 86, 43) channel("bndmax") range(1, 15000, 300, 1, 1) text("Bnd max") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(12, 284, 86, 43) channel("filthi") range(50, 15000, 50, 1, 1) text("HiP") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 284, 86, 43) channel("filtlo") range(50, 15000, 15000, 1, 1) text("LoP") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(12, 176, 86, 43) channel("ampns") range(0, 0.2, 0.1, 1, 0.01) text("noise amp") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 176, 86, 43) channel("spdns") range(1, 999, 12, 1, 1) text("noise spd") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(12, 234, 86, 43) channel("ampsine") range(0, 0.4, 0.1, 1, 0.01) text("sine amp") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
nslider bounds(108, 234, 86, 43) channel("spdsine") range(1, 999, 8, 1, 1) text("sine spd") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)
rslider bounds(136, 348, 60, 60) channel("mix") range(0, 1, 1, 1, 0.001) trackerColour(124, 218, 245, 255) text("mix") textColour(192, 238, 241, 255)
checkbox bounds(104, 354, 25, 25) channel("lfoget") colour:0(77, 77, 77, 255) colour:1(118, 203, 214, 255)
nslider bounds(12, 348, 86, 43) channel("spdlfo") range(2, 80, 12, 1, 1) text("spd amp") colour(36, 53, 63, 255) textColour(166, 211, 214, 255)


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

seed 0


instr 1

kSpdMin    cabbageGet "spdmin"
kSpdMax    cabbageGet "spdmax"
kFrqMin    cabbageGet "frqmin"
kFrqMax    cabbageGet "frqmax"
kBndMin    cabbageGet "bndmin"
kBndMax    cabbageGet "bndmax"
kFiltHi    cabbageGet "filthi"
kFiltLo    cabbageGet "filtlo"
kLFOget    cabbageGet "lfoget"
kSpdLFO    cabbageGet "spdlfo"
kMix       cabbageGet "mix"
kNoiseAmp  cabbageGet "ampns"
kNoiseSpd  cabbageGet "spdns"
kSineAmp   cabbageGet "ampsine"
kSineSpd   cabbageGet "spdsine"

;Sfile = "test2.wav"
;aInL diskin Sfile, 1, 0, 1
;aInR = aInL
iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif

aPink pinkish kNoiseAmp, 0
kFrq rspline kFrqMin, kFrqMax, kSpdMin, kSpdMax
kBw rspline kBndMin, kBndMax , kSpdMin, kSpdMax
aResL reson aInL, kFrq, kBw
aResR reson aInR, kFrq, kBw

if kLFOget == 1 then
aLFO randomh 0, 2, kSpdLFO
elseif kLFOget == 0 then
aLFO = 1
endif
aClpL clip aResL*int(aLFO), 0, 0.1
aClpR clip aResR*int(aLFO), 0, 0.1
kSpdNs = 2
k1 rspline 0, 1, 1, kNoiseSpd
k2 jspline 1, 1, kNoiseSpd
aNoise pdclip aPink, k2, k1
kSineFrq randomh kFrqMin, kFrqMax, kSineSpd
kRndAmpSine = int(randomh:k( 0, 2, kSineSpd))
aSine poscil kSineAmp*kRndAmpSine, kSineFrq/kBw
aSine pdclip aSine, k2, k1
aSine clip aSine, 3, 1/50

aHiPsL clfilt aClpL+aNoise+(aSine*kSineAmp*100), kFiltHi, 1, 50
aFiltL clfilt aHiPsL, kFiltLo, 0, 50
aHiPsR clfilt aClpR+aNoise+(aSine*kSineAmp*100), kFiltHi, 1, 50
aFiltR clfilt aHiPsR, kFiltLo, 0, 50

aOutL ntrpol aInL, aFiltL, kMix
aOutR ntrpol aInR, aFiltR, kMix

out aOutL, aOutR
endin


</CsInstruments>
<CsScore>
i1 0 99999
</CsScore>
</CsoundSynthesizer>


