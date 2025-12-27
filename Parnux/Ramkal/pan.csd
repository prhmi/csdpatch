/*
Ramkal VSTe package v6.0
written by parham izadyar | 2020-2025 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
form caption("Pan") size(350, 500)  guiMode("queue")  colour(30,30,50) pluginId("tpan")
hslider  bounds(40, 98, 227, 30), channel("lr"), range(-1, 1, 0, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)
hslider  bounds(40, 62, 227, 30), channel("ud"), range(-1, 1, 0, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)
checkbox bounds(34, 204, 30, 30) channel("mtl") text("MuteL") popupText("MuteL") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
checkbox bounds(88, 204, 30, 30) channel("mtr") text("MuteR") popupText("MuteR") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(26, 188, 100, 12) channel("label10005") text("Mute Left/Right")
checkbox bounds(166, 204, 30, 30) channel("swtch") text("swtch") popupText("swift") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(148, 188, 61, 12) channel("label10006") text("switch")
combobox   bounds(214, 206, 100, 23), text("manual", "lfo-sine", "lfo-sqr", "rnd-sine", "rnd-step", "jsp-sine", "jsp-step"), channel("lfomod"), value(1),  colour(56, 63, 79, 255)
combobox   bounds(40, 18, 98, 24), text("simple pan", "space pan", "3d pan", "skip pan", "mixdown"), channel("panmod"), value(1),  colour(56, 63, 79, 255)
vslider bounds(226, 348, 45, 142) channel("gainl") range(-60, 50, 0, 1, 1) trackerColour(198, 231, 231, 255) text("L") 
vslider bounds(274, 348, 45, 143) channel("gainr") range(-60, 50, 0, 1, 1) trackerColour(198, 231, 231, 255) text("R") 
rslider bounds(30, 252, 60, 60), channel("lfospd"), text("LFO"), range(0.05, 12, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(108, 252, 60, 60), channel("lfodep"), text("Depth"), range(0, 1, 0, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 


rslider bounds(108, 412, 60, 60), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(30, 412, 60, 60), channel("gain"), text("Gain"), range(-60, 50, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
label bounds(20, 106, 15, 15) channel("label10014") text("L")
label bounds(272, 103, 15, 15) channel("label10015") text("R")
label bounds(8, 70, 32, 15) channel("label10016") text("up")
label bounds(272, 69, 40, 15) channel("label10017") text("down")
image bounds(25, 158, 300, 4) channel("image10019") colour(142, 165, 185, 255)
image bounds(25, 324, 300, 4) channel("image10020") colour(142, 165, 185, 255)
hmeter bounds(30, 350, 168, 15) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
hmeter bounds(30, 374, 168, 15) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr 		= 44100	
ksmps 	= 64		
;nchnls 	= 2		
0dbfs	= 1		






opcode jspstep, k, kkk
kAmp, kSpdMin, kSpdMax xin
kTimeRnd = (kSpdMin+kSpdMax)/2
kTime randomh kSpdMin,kSpdMax,kTimeRnd
kOut randomh -kAmp, kAmp, kTime
xout kOut
endop

instr 1
kPortTime linseg 0, 0.001, 0.05
;aInL,aInR diskin "test.wav",1,0,1

iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif





kPanMod     cabbageGet "panmod"
kLeftRight  cabbageGet "lr"
kUpDown     cabbageGet "ud"
kMuteL      cabbageGet "mtl"
kMuteR      cabbageGet "mtr"
kSwitch     cabbageGet "swtch"
kMix        cabbageGet "mix"
kGainL      cabbageGet "gainl"
kGainR      cabbageGet "gainr"
kGain       cabbageGet "gain"	


kMuteL scale kMuteL, 1, 0, 0, 1
kMuteR scale kMuteR, 1, 0, 0, 1

if kSwitch == 0 then
aSoundL = aInL
aSoundR = aInR
elseif kSwitch == 1 then
aSoundL = aInR
aSoundR = aInL
endif

aSound sum aSoundL,aSoundR

;pan





;;mixer
 kGainL portk kGainL, kPortTime
 kGainR portk kGainR, kPortTime
 kGain  portk kGain, kPortTime
 kMix   portk kMix, kPortTime 
 printk2 kPanMod
    if kPanMod == 1 then
    kLeftRight scale kLeftRight, 0, 1, -1, 1
    aPanL, aPanR   pan2      aSound, kLeftRight, 1
    elseif kPanMod == 2 then
    kLeftRight scale kLeftRight, 0, 90, -1, 1
    kUpDown   scale kUpDown, -5, 5, -1, 1
    kUpDown abs kUpDown
    kUpDown limit kUpDown, 1, 30
    aPanL, aPanR locsig aSound, kLeftRight, kUpDown, 1
    elseif kPanMod == 3 then
    SL  =  "hrtf-48000-left.dat"
    SR  =  "hrtf-48000-right.dat"
    kLeftRight scale kLeftRight, -90, 90, -1, 1
    kUpDown   scale kUpDown, -40, 40, -1, 1
    aPanL, aPanR  hrtfmove2   aSound, kLeftRight, kUpDown, SL, SR
    elseif kPanMod == 4 then
    aPanL = aSoundL
    aPanR = aSoundR
    elseif kPanMod == 5 then
    aPanL = (aSoundL+aSoundR)/2
    aPanR = (aSoundL+aSoundR)/2
    endif
 aOutL = aPanL*ampdb(kGainL)*ampdb(kGain)*kMuteL
 aOutR = aPanR*ampdb(kGainR)*ampdb(kGain)*kMuteR
 aMixL  ntrpol  aInL, aOutL, kMix
 aMixR  ntrpol  aInR, aOutR, kMix
;;GUI	
 kMaxL max_k aMixL, metro(20), 1
 kMaxR max_k aMixR, metro(20), 1
 cabbageSetValue "meter1", kMaxL, metro(20)
 cabbageSetValue "meter2", kMaxR, metro(20)
 out aMixL,aMixR
endin

instr 2
kLFOmod     cabbageGet "lfomod"
kLFOspd     cabbageGet "lfospd"
kLFOdep     cabbageGet "lfodep"
kPanMod     cabbageGet "panmod"
  if (kPanMod != 5 || kPanMod != 4) && kLFOmod != 1 then
    if     kLFOmod == 2  then
    kLeftRight lfo kLFOdep, kLFOspd, 0
    kUpDown    lfo kLFOdep, kLFOspd, 0
    elseif kLFOmod == 3  then
    kLeftRight lfo kLFOdep, kLFOspd, 2
    kUpDown    lfo kLFOdep, kLFOspd, 2
    elseif kLFOmod == 4  then
    kLeftRight randi kLFOdep, kLFOspd, 1
    kUpDown    randi kLFOdep, kLFOspd, 3
    elseif kLFOmod == 5  then
    kLeftRight randh kLFOdep, kLFOspd, 1
    kUpDown    randh kLFOdep, kLFOspd, 3
    elseif kLFOmod == 6  then
    kLeftRight jspline kLFOdep, kLFOspd/2, kLFOspd
    kUpDown    jspline kLFOdep, kLFOspd/2, kLFOspd
    elseif kLFOmod == 7  then
    kLeftRight jspstep kLFOdep, kLFOspd/2, kLFOspd
    kUpDown    jspstep kLFOdep, kLFOspd/2, kLFOspd
    endif
 cabbageSetValue "lr", kLeftRight
 cabbageSetValue "ud", kUpDown
 endif
endin


</CsInstruments>
<CsScore>
i1 0 [6^6]
i2 0 [6^6]
</CsScore>
</CsoundSynthesizer>
