; Ramkal_VSTe_V_4.9, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2023
; github.com/prhmi
<Cabbage> 
form caption("Tuner") size(480, 250) pluginId("tunr") guiMode("queue")
image bounds(0, 0, 480, 300) file("back.jpg") channel("image2")
label bounds(14, 16, 62, 16)   text("4A+47") channel("tuner") align("left") fontColour(147, 207, 207, 255)
hslider bounds(216, 210, 254, 33), channel("res"), text("Pixel"), range(50, 250, 130, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)

rslider bounds(88, 132, 69, 77), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(158, 52, 69, 77), channel("hfltr"), text("High Cut"), range(400, 6000, 1200, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(88, 52, 69, 77), channel("lfltr"), text("Low Cut"), range(200, 6000, 300, 1, 1)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(18, 132, 69, 77), channel("dtn"), text("Detune"), range(0.5, 2.5, 2, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(18, 52, 69, 77), channel("velocity"), text("Gate"), range(0.1, 0.7, 0.1, 1, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
combobox   bounds(102, 14, 57, 23), text("128","256","512","1024","2048"), channel("FFTSize"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(158, 132, 69, 77) channel("gain") range(0, 90, 60, 1, 0.001) trackerColour(147, 207, 207, 255) valueTextBox(1)  text("Valume") fontColour(255, 255, 255, 255) textColour(255, 255, 255, 255)
checkbox   bounds(78, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("TunerOnOff") value(1)
combobox   bounds(162, 14, 70, 23), text("Saw", "Square", "Tri", "Imp", "Pick", "VCO"), channel("snds"), value(2), fontColour(255,255,255) colour(56, 63, 79, 255)
rslider bounds(324, 132, 69, 77), channel("dur"), text("Duration"), range(0.1, 2.5, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(324, 52, 69, 77), channel("plk"), text("plk"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(254, 52, 69, 77), channel("pck"), text("pick"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(392, 52, 69, 77), channel("pfl"), text("rel"), range(0.01, 0.93, 0.5, 2, 0.001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(254, 132, 69, 77), channel("att"), text("Att"), range(0.0001, 0.1, 0.001, 2, 0.0001)     trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
checkbox   bounds(442, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("rnd") 
combobox   bounds(342, 12, 60, 23), text("x 0.5","x 1","x 2","x 3"), channel("frqt"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)
checkbox   bounds(258, 14, 20, 20) colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) channel("picka") 
rslider    bounds(394, 132, 69, 77) channel("gainp") range(0, 90, 60, 1, 0.001) trackerColour(147, 207, 207, 255) valueTextBox(1)  text("Valume") fontColour(255, 255, 255, 255) textColour(255, 255, 255, 255)
label bounds(280, 16, 54, 14) channel("label10006") text("on/off")
label bounds(406, 16, 35, 14) channel("label10005") text("Rnd")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 64
nchnls = 2
0dbfs = 1

seed 0


giSaw     ftgen     0, 0, 2^10, 10, 1,-1/2,1/3,-1/4,1/5,-1/6,1/7,-1/8,1/9
giSquare  ftgen     0, 0, 2^10, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9
giTri     ftgen     0, 0, 2^10, 10, 1, 0, -1/9, 0, 1/25, 0, -1/49, 0, 1/81
giImp     ftgen     0, 0, 2^10, 10, 1, 1, 1, 1, 1, 1, 1, 1, 1

					
instr Start


kVelocity cabbageGet "velocity"
kHFltr  cabbageGet "hfltr"
kLFltr  cabbageGet "lfltr"
kDetune cabbageGet "dtn"
kGainIn cabbageGet "gain"
kGainP cabbageGet "gainp"
kGain ampdb kGainIn-60
aGain interp kGain
kGainPout ampdb kGainP-60
kDur cabbageGet "dur"
kFrqTime cabbageGet "frqt"
if kFrqTime == 0 then
kFrqTime = 0.5
endif
kRes cabbageGet "res"
kpcka cabbageGet "picka"
kSoundMod cabbageGet "snds"
kTunerOnOff cabbageGet "TunerOnOff"
;aInL,aInR diskin2 "test2.wav", 1,0,1
;ainR = ainL
aInL, aInR ins
aIn = (aInL+aInL)/2

kFFTSize cabbageGet "FFTSize"
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	
kfr, kamp 	ptrack 		aIn, iFFTsize
kamp = ampdb(kamp)
rireturn
printk2 iFFTsize
ktrig init 0
if kamp > kVelocity && changed(kamp) == 1 then
kEnv = 1
ktrig = 1
else 
kEnv = 0
ktrig = 0
endif
kEnv port kEnv, 0.07
aEnv interp kEnv
kmix  cabbageGet "mix"
kmix port kmix, 0.1
aEnv2 interp (kmix+1)
printk2 kSoundMod
if kSoundMod == 1 kgoto saw
if kSoundMod == 2 kgoto square
if kSoundMod == 3 kgoto tri
if kSoundMod == 4 kgoto Imp
if kSoundMod == 5 kgoto plk
if kSoundMod == 6 kgoto svco

saw:
aSaw1 poscil kamp, kfr,giSaw 
aSaw2 poscil kamp*0.7, kfr*kDetune,giSaw                         
asum sum aSaw1, aSaw2
kgoto filter

square:
aSquare1 poscil kamp, kfr,giSquare 
aSquare2 poscil kamp*0.7, kfr*kDetune,giSquare                         
asum sum aSquare1, aSquare2
kgoto filter

tri:
aTri1 poscil kamp, kfr,giTri
aTri2 poscil kamp*0.7, kfr*kDetune,giTri                       
asum sum aTri1, aTri2
kgoto filter

Imp:
aImp1 poscil kamp, kfr,giImp
aImp2 poscil kamp*0.7, kfr*kDetune,giImp                       
asum sum aImp1, aImp2
kgoto filter

svco:
a1 vco2 kamp, kfr,0,0.5
a2 vco2 kamp, kfr*kDetune,0,0.8
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
out aGainL,aGainR

plk:
kFrqOut = kfr*kFrqTime
if kFrqOut < kLFltr then
kFrqOut = 0
elseif kFrqOut > kHFltr then
kFrqOut = 0
endif
knum		=			(octcps(kfr*2)-3) * 12
if ktrig == 1 && changed(ktrig) == 1 && kTunerOnOff == 1 then
    schedulek  "NoteShow", 0, 0.01,knum
    kFrq = int(kfr/kRes)
    if kSoundMod == 5 || kpcka == 1 then
        if changed(kFrq) == 1 && kFrqOut > kLFltr && kFrqOut < kHFltr then
        schedulek "plck", 0, kDur, kfr*kFrqTime,kGainPout
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
out aout,aout
endin

instr NoteShow
 knum = p4
SNoteIn  mton knum
SNote   sprintf "text(%s)", SNoteIn
cabbageSet "tuner",SNote
endin

</CsInstruments>
<CsScore>
i "Start" 0 [6^6]
</CsScore>
</CsoundSynthesizer>
