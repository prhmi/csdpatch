<Cabbage>
form caption("vcf") size(250, 370), guiMode("queue") pluginId("vcfo") colour(30,30,50)
rslider bounds(26, 50, 60, 60), channel("filt"), range(100, 4000, 400, 1, 1), text("Filt"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(168, 50, 60, 60), channel("res"), range(1, 100, 30, 1, 0.01), text("Res"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
combobox bounds(90, 68, 75, 30) channel("mod") colour(56, 63, 79, 255) text("LoPass", "HiPass") value(1)
combobox   bounds(90, 186, 75, 30), text("off", "sine", "sqr", "rnd-si", "rnd-st", "jsp-si", "jsp-st"), channel("lfomod"), value(1),  colour(56, 63, 79, 255)
rslider bounds(26, 174, 60, 60), channel("lfospd"), text("LFO"), range(0.05, 12, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(168, 174, 60, 60), channel("lfodep"), text("Depth"), range(0, 1, 0, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(26, 284, 60, 60), channel("gain"), range(0, 2, 0.2, 1, 0.01), text("Gain"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(168, 282, 60, 60), channel("mix"), range(0, 1, 1, 1, 0.01), text("Mix"), textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
label bounds(72, 16, 105, 18) channel("label10001") text("3320 Filter")
image bounds(20, 128, 210, 4) channel("image10019") colour(142, 165, 185, 255)
image bounds(20, 262, 210, 4) channel("image10020") colour(142, 165, 185, 255)
label bounds(64, 140, 124, 16) channel("label10011") text("LFO-Modulation")
label bounds(88, 282, 80, 16) channel("label10012") text("output")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1



opcode jspstep, k, kkk
kAmp, kSpdMin, kSpdMax xin
kTimeRnd = (kSpdMin+kSpdMax)/2
kTime randomh kSpdMin,kSpdMax,kTimeRnd
kOut randomh -kAmp, kAmp, kTime
xout kOut
endop

seed 0
gkFilt init 200
gkRes init 1
instr 1
kGain     cabbageGet "gain"
kMod      cabbageGet "mod"
kMix      cabbageGet "mix"
kLFOmod   cabbageGet "lfomod"
kLFOspd   cabbageGet "lfospd"
kLFOdep   cabbageGet "lfodep"
kFilt     cabbageGet "filt"
kRes      cabbageGet "res"

;aInL,aInR diskin "test.wav",1,0,1

iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif

 if changed(kMod) == 1 then
 reinit    UPDATE
 endif
     UPDATE:
     iMod = i(kMod)-1
    rireturn 



    if kLFOmod == 2  then
    kLFOfilt lfo kLFOdep, kLFOspd, 0
    elseif kLFOmod == 3  then
    kLFOfilt lfo kLFOdep, kLFOspd, 2
    elseif kLFOmod == 4  then
    kLFOfilt randi kLFOdep, kLFOspd, 1
    elseif kLFOmod == 5  then
    kLFOfilt randh kLFOdep, kLFOspd, 1
    elseif kLFOmod == 6  then
    kLFOfilt jspline kLFOdep, kLFOspd/2, kLFOspd
    elseif kLFOmod == 7  then
    kLFOfilt jspstep kLFOdep, kLFOspd/2, kLFOspd
    endif
    kLFOfilt scale kLFOfilt, 0.5, 2, -1, 1
    if kLFOmod == 1 then
    kLFOfilt = 1
    kLFOres = 1
    endif
    ;printk2 kFilt*kLFOfilt
    
aFiltL bqrez aInL, kFilt*kLFOfilt,  kRes, iMod
aFiltR bqrez aInR, kFilt*kLFOfilt,  kRes, iMod
aOutL ntrpol aInL,aFiltL*kGain, kMix
aOutR ntrpol aInR,aFiltR*kGain, kMix
out aOutL, aOutR
endin



</CsInstruments>
<CsScore>
i1 0 99999
</CsScore>
</CsoundSynthesizer>
