/*
Ramkal VSTe package v6.0
written by parham izadyar | 2020-225 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
form caption("feedback") size(300,200), pluginId("ddsp") colour( 30, 30, 50) guiMode("queue")
rslider bounds(78, 52, 60, 60), channel("mainfb"), text("feedback"), range(0, 0.9, 0.3, 1, 0.0001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(12, 54, 60, 60), channel("inpt"), text("Input"), range(-25, 6, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(160, 54, 60, 60), channel("maingain"), text("Gain"), range(-25, 20, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(224, 54, 60, 60), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
hmeter bounds(22, 138, 168, 15) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
hmeter bounds(22, 162, 168, 15) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)
checkbox bounds(141, 71, 15, 15) channel("rndmod") colour:0(84, 85, 89, 255) colour:1(255, 0, 0, 255)
button bounds(14, 12, 80, 22) channel("reset") text("reset", "reset") colour:0(74, 77, 79, 255) colour:1(74, 77, 79, 255)
combobox bounds(205, 146, 77, 27) channel("fbmod") colour(74, 77, 79, 255)  value(1) text("dymc", "static")
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr = 44100
ksmps = 32
;nchnls = 2
0dbfs = 1



opcode rspstep, a, kkkk
kMin,kMax, kSpdMin, kSpdMax xin
kTimeRnd = (kSpdMin+kSpdMax)/2
kTime randomh kSpdMin,kSpdMax,kTimeRnd
kOut randomh kMin, kMax, kTime
kPortTime randomh 0.01,0.2,kTimeRnd
kOut portk kOut, kPortTime
aOut interp kOut
xout aOut
endop

opcode rspstepk, k, kkkk
kMin,kMax, kSpdMin, kSpdMax xin
kTimeRnd = (kSpdMin+kSpdMax)/2
kTime randomh kSpdMin,kSpdMax,kTimeRnd
kOut randomh kMin, kMax, kTime
kPortTime randomh 0.01,0.2,kTimeRnd
kOut portk kOut, kPortTime
xout kOut
endop

opcode myFb1, a, ak
aIn, kFb xin
kSpeedMin scale kFb, 0.02, 2, 0, 1
kSpeedMax scale kFb, 0.04, 5, 0, 1
kRngMin scale kFb, 300, 800, 0, 1
kRngMax scale kFb, 400, 7000, 0, 1
kMod cabbageGet "rndmod"
if kMod == 0 then
adRnd1     rspline 0.01, 0.2, kSpeedMin, kSpeedMax
adRnd2     rspline 0.02, 0.08, kSpeedMin, kSpeedMax
elseif kMod == 1 then
adRnd1     rspstep 0.01, 0.2, kSpeedMin, kSpeedMax
adRnd2     rspstep 0.02, 0.08, kSpeedMin, kSpeedMax
endif
 aBuffer    delayr    5
 ad1        deltapi   adRnd1
 ad2        deltapi   adRnd2
 a3 init 0
 krms      rms       a3
           delayw    (aIn/100)+(exp(-krms)*a3)
 a3        reson     -(ad1+ad2), kRngMin, kRngMax, 1
    aDC dcblock2 a3
    aLimit clip aDC, 1, 0.15
    aFilter clfilt aLimit, 200, 1, 50
    aFilter clfilt aFilter, 7000, 0, 50
    aOut clip aFilter, 1, 0.9
 xout aOut
endop

opcode myFb2, a, ak
aIn, kFb xin
kTime scale kFb, 0.05, 0.001, 0, 0.9
kDose scale kFb, 10, 100000, 0, 0.9
kSpeedMin scale kFb, 0.7, 7, 0, 1
kSpeedMax scale kFb, 2, 12, 0, 1
kRngPh scale kFb, 1, 10000, 0, 1
 aFb init 0
 aIn = aIn+aFb
 kMod cabbageGet "rndmod"
 if     kMod == 0 then
 kPhase = 1
 kAmpRnd = 1
 elseif kMod == 1 then
 kPhase rspstepk 1,kRngPh,kSpeedMin, kSpeedMax
 kAmpRnd rspstepk 0.1, 10, kSpeedMin, kSpeedMax
 endif
 ;printk2 kPhase
    aSine poscil 1*kAmpRnd, aIn*kPhase
    aPhas phasor aIn
    aSum sum aSine, aPhas
 abuf     delayr   5
 aTime    interp   kTime
 aFb   deltapi  aTime
 krms      rms       aFb
 delayw    (aSum/kDose)+(exp(-krms)*aFb);+ (aFb*kFb)
    aDC dcblock2 aFb*(kDose/10)
    aLimit clip aDC, 1, 0.15
    aFilter clfilt aLimit, 200, 1, 50
    aFilter clfilt aFilter, 7000, 0, 50
    aOut clip aFilter, 1, 0.9
xout aOut
endop


instr 1

kFb       cabbageGet "mainfb"
kMix      cabbageGet "mix"
kInGain   cabbageGet "inpt"
kGain     cabbageGet "maingain"
kMod      cabbageGet "fbmod"
kReset    cabbageGet "reset"
kPortTime linseg 0, 0.01, 0.01
kFb portk kFb, kPortTime
iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif
;aInL,aInR diskin2 "test.wav", -1, 0, 1
aIn = (aInL+aInR)*ampdb(kInGain)
if changed(kReset) == 1 then
reinit RESET
endif
RESET:
if kMod == 1 then
aOut myFb1 aIn, kFb
elseif kMod == 2 then
aOut myFb2 aIn, kFb
else
aOut = aIn
endif
rireturn
 aMixL  ntrpol  aInL, aOut*ampdb(kGain), kMix
 aMixR  ntrpol  aInR, aOut*ampdb(kGain), kMix
 kMaxL max_k aMixL, metro(20), 1
 kMaxR max_k aMixR, metro(20), 1
 kMeter1 dbfsamp kMaxL
 kMeter2 dbfsamp kMaxR
 cabbageSetValue "meter1", kMaxL, metro(20)
 cabbageSetValue "meter2", kMaxR, metro(20)
out aMixL,aMixR
endin


</CsInstruments>
<CsScore>
i 1 0 999999
</CsScore>
</CsoundSynthesizer>

