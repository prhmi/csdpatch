; parnux VSTe v5.2, Cabbage v2.9.0
; Written by Parham Izadyar, 2022-2024
; parhamizadyar.net
<Cabbage> 
form caption("Tuner") size(480, 300) pluginId("tunr") guiMode("queue") colour( 30, 30, 50)
;image bounds(0, 0, 480, 300) file("back.jpg") channel("image2")
label bounds(14, 16, 62, 16)   text("4A+47") channel("tuner") align("left") fontColour(147, 207, 207, 255)
hslider bounds(254, 210, 216, 33), channel("pxl"), text("plck/s"), range(10, 300, 130, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
hslider bounds(14, 212, 238, 31), channel("frflu"), text("frqUp"), range(150, 2500, 350, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
hslider bounds(14, 244, 238, 31), channel("frfld"), text("frqDown"), range(50, 800, 120, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)


rslider bounds(88, 132, 69, 77), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(158, 52, 69, 77), channel("hfltr"), text("High Cut"), range(400, 6000, 1200, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(88, 52, 69, 77), channel("lfltr"), text("Low Cut"), range(100, 2000, 300, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(18, 132, 69, 77), channel("dtn"), text("Detune"), range(-1200, 2000, 1200, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(18, 52, 69, 77), channel("velocity"), text("Gate"), range(0.01, 0.7, 0.1, 1, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
combobox   bounds(102, 14, 57, 23), text("128","256","512","1024","2048","4096"), channel("FFTSize"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
combobox   bounds(260, 248, 57, 23), text("5","7","10","12","15","17"), channel("NumPeaks"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(158, 132, 69, 77) channel("gain") range(0, 90, 60, 1, 1) trackerColour(147, 207, 207, 255) valueTextBox(1)  text("Valume") fontColour(255, 255, 255, 255) textColour(255, 255, 255, 255)
checkbox   bounds(78, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("TunerOnOff") value(1)
combobox   bounds(162, 14, 70, 23), text("Saw", "Square", "Tri", "Imp1","Imp2","Imp3","Imp4", "Pick", "VCO"), channel("snds"), value(2), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(324, 132, 69, 77), channel("dur"), text("Duration"), range(0.1, 2.5, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(324, 52, 69, 77), channel("plk"), text("plk"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(254, 52, 69, 77), channel("pck"), text("pick"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(392, 52, 69, 77), channel("pfl"), text("rel"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(254, 132, 69, 77), channel("att"), text("Att"), range(0.0001, 0.1, 0.001, 2, 0.0001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
checkbox   bounds(442, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("rnd") 
combobox   bounds(342, 12, 60, 23), text("x 0.33","x 0.5","x 1","x 2","x 3"), channel("frqt"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)
checkbox   bounds(258, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("picka") 
rslider    bounds(394, 132, 69, 77) channel("gainp") range(0, 90, 60, 1, 0.001) trackerColour(147, 207, 207, 255) valueTextBox(1)  text("Valume") fontColour(255, 255, 255, 255) textColour(255, 255, 255, 255)
label bounds(280, 16, 54, 14) channel("label10006") text("on/off")
label bounds(406, 16, 35, 14) channel("label10005") text("Rnd")

label bounds(320, 254, 123, 15) channel("label10025") text("number peaks")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 64
;nchnls = 2
0dbfs = 1

seed 0


giSaw     ftgen     0, 0, 2^10, 10, 1,-1/2,1/3,-1/4,1/5,-1/6,1/7,-1/8,1/9
giSquare  ftgen     0, 0, 2^10, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9
giTri     ftgen     0, 0, 2^10, 10, 1, 0, -1/9, 0, 1/25, 0, -1/49, 0, 1/81
giImp1    ftgen     0, 0, 2^10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1
giImp2    ftgen     0, 0, 2^10, 10, 1, 0.375, 0.75, 0, 0, 0.4,0.25, 0.125
giImp3    ftgen     0, 0, 2^10, 10, 0.25, 1, 0, 0.25, 0, 0, 0.25, 0.25
giImp4    ftgen     0, 0, 2^10, 10, 1, 0.1, 0.3, 0.1, 0, 0.1, -0.1

					
instr Start


kVelocity cabbageGet "velocity"
kHFltr  cabbageGet "hfltr"
kLFltr  cabbageGet "lfltr"
kDetuneIn cabbageGet "dtn"
kDetune cent kDetuneIn
kGainIn cabbageGet "gain"
kGainP cabbageGet "gainp"
kGain ampdb kGainIn-60
aGain interp kGain
kGainPout ampdb kGainP-60
kDur cabbageGet "dur"
kFrqTime cabbageGet "frqt"

kpxl cabbageGet "pxl"
kpcka cabbageGet "picka"
kSoundMod cabbageGet "snds"
kTunerOnOff cabbageGet "TunerOnOff"
;aInL,aInR diskin2 "../flute_mono.wav", 1,0,1
iCh = nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif
aIn = (aInL+aInR)/2

kFFTSize cabbageGet "FFTSize"
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	
kNumPeaks cabbageGet "NumPeaks"
kNumPeaks init 5
	 if changed(kNumPeaks)==1 then
	  reinit UPDATEp
	 endif
	 UPDATEp:
	iNumPeaks = int(2.5*(i(kNumPeaks)+1))
	
;print iNumPeaks
	
kfr, kamp 	ptrack 		aIn, iFFTsize,iNumPeaks
kamp = ampdb(kamp)
rireturn
;printk2 iFFTsize
ktrig init 0
if kamp > kVelocity then
kEnv = 1
ktrig = 1
else 
kEnv = 0
ktrig = 0
endif
kEnv port kEnv, 0.07
aEnv interp kEnv
kmix  cabbageGet "mix"
kPortTime linseg 0, 0.001, 0.1
kmix portk kmix, kPortTime
aEnv2 interp (kmix+1)
;printk2 kSoundMod

if kFrqTime == 1 then
kFrqTime = 1/3
elseif kFrqTime == 2 then
kFrqTime = 1/2
elseif kFrqTime == 3 then
kFrqTime = 1
elseif kFrqTime == 4 then
kFrqTime = 2
elseif kFrqTime == 5 then
kFrqTime = 3
endif
kFrq = kfr;*kFrqTime


kFrqFltrUp cabbageGet "frflu"
kFrqFltrDown cabbageGet "frfld"

until kFrq < kFrqFltrUp do
kFrq = kFrq/2
od

until kFrq > kFrqFltrDown do
kFrq = kFrq*2
od





if kSoundMod == 1 kgoto saw
if kSoundMod == 2 kgoto square
if kSoundMod == 3 kgoto tri
if kSoundMod == 4 kgoto Imp1
if kSoundMod == 5 kgoto Imp2
if kSoundMod == 6 kgoto Imp3
if kSoundMod == 7 kgoto Imp4
if kSoundMod == 8 kgoto plk
if kSoundMod == 9 kgoto svco


saw:
aSaw1 poscil kamp, kFrq,giSaw 
aSaw2 poscil kamp*0.7, kFrq*kDetune,giSaw                         
asum sum aSaw1, aSaw2
kgoto filter

square:
aSquare1 poscil kamp, kFrq,giSquare 
aSquare2 poscil kamp*0.7, kFrq*kDetune,giSquare                         
asum sum aSquare1, aSquare2
kgoto filter

tri:
aTri1 poscil kamp, kFrq,giTri
aTri2 poscil kamp*0.7, kFrq*kDetune,giTri                       
asum sum aTri1, aTri2
kgoto filter

Imp1:
aImp1 poscil kamp, kFrq,giImp1
aImp2 poscil kamp*0.7, kFrq*kDetune,giImp1                       
asum sum aImp1, aImp2
kgoto filter

Imp2:
aImp1 poscil kamp, kFrq,giImp2
aImp2 poscil kamp*0.7, kFrq*kDetune,giImp2                      
asum sum aImp1, aImp2
kgoto filter

Imp3:
aImp1 poscil kamp, kFrq,giImp3
aImp2 poscil kamp*0.7, kFrq*kDetune,giImp3                      
asum sum aImp1, aImp2
kgoto filter

Imp4:
aImp1 poscil kamp, kFrq,giImp4
aImp2 poscil kamp*0.7, kFrq*kDetune,giImp4                   
asum sum aImp1, aImp2
kgoto filter

svco:
a1 vco2 kamp, kFrq,0,0.5
a2 vco2 kamp, kFrq*kDetune,0,0.8
asum sum a1,a2
kgoto filter

filter:
aFltr clfilt asum, kHFltr, 0, 35
aFltrOut clfilt aFltr, kLFltr, 1, 35
aRvbOut,aRvbOut freeverb aFltrOut, aFltrOut, 0.65,1
aRvbMix		ntrpol		aFltrOut, aRvbOut , 0.4
aoutL		ntrpol		aInL, aRvbMix*aEnv*aEnv2 , kmix
aoutR		ntrpol		aInR, aRvbMix*aEnv*aEnv2 , kmix
aGainL = aoutL*aGain
aGainR = aoutR*aGain



    if iCh == 1 then
    out (aGainL+aGainR)/2
    elseif  iCh == 2 then
	outs aGainL,aGainR
    endif


plk:
kFrqOut = kFrq*kFrqTime
;if kFrqOut < kLFltr then
;kFrqOut = 0
;elseif kFrqOut > kHFltr then
;kFrqOut = 0
;endif
knum		=			(octcps(kFrq*2)-3) * 12
if ktrig == 1 && changed(ktrig) == 1 && kTunerOnOff == 1 then
    schedulek  "NoteShow", 0, 0.01,knum
endif

    kFrqpx = int(kFrq/kpxl)
if ktrig == 1 then
    if kSoundMod == 8 || kpcka == 1 then
        if changed(kFrqpx) == 1 then
        schedulek "plck", 0, kDur, kFrqOut,kGainPout
        endif
    endif
endif
endin

instr plck
iAtt cabbageGetValue "att"
aEnv linseg 0,iAtt, 1, p3-iAtt, 0
iFrq = p4
aGain interp p5
imod cabbageGetValue "rnd"
if imod == 0 then
iplk  cabbageGetValue "plk"
ipick cabbageGetValue "pck"
irefl cabbageGetValue "prl"
elseif imod == 1 then
iplk  random 0.1, 0.9
ipick random 0.1, 0.9
irefl random 0.1, 0.9
endif
aPick wgpluck2 iplk,.3, iFrq, ipick, irefl-0.01
aout = aPick*aEnv*aGain

iCh = nchnls
    if iCh == 1 then
    out aout
    elseif  iCh == 2 then
	outs aout,aout
    endif
endin

instr NoteShow
 inum = p4
SNoteIn  mton inum
SNote   sprintf "text(%s)", SNoteIn
cabbageSet "tuner",SNote
endin

</CsInstruments>
<CsScore>
i "Start" 0 [6^6]
</CsScore>
</CsoundSynthesizer>

