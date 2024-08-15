; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Shift") size(520, 280)  guiMode("queue")  colour(30,30,50)  pluginId("shft")
rslider bounds(20, 14, 73, 72), channel("psh"), text("Pitch"), range(-1200, 1200, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
rslider bounds(94, 14, 73, 72), channel("tsh"), text("Timbre"), range(-1200, 1200, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
rslider bounds(168, 14, 73, 72), channel("mixp"), text("Pch mix"), range(0, 1, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
rslider bounds(20, 88, 73, 72), channel("fsh"), text("Frq"), range(-1200, 1200, -100, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
rslider bounds(168, 88, 73, 72), channel("mixf"), text("Frq mix"), range(0, 1, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
combobox   bounds(94, 102, 72, 20), text("128", "256", "512", "1024", "2048", "4096", "8192"), channel("fft"), value(4),  colour(56, 63, 79, 255)
checkbox  bounds(266, 12, 77, 21) text("Metro")  channel("metro")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
combobox   bounds(352, 12, 57, 20), text("Up", "Down"), channel("updown"), value(1),  colour(56, 63, 79, 255)
rslider bounds(24, 178, 73, 72), channel("att"), text("Att"), range(0, 2, 0.15, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
rslider bounds(98, 178, 73, 72), channel("rel"), text("Rel"), range(0.1, 2, 0.1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 

rslider bounds(172, 178, 73, 72), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1) 
hslider bounds(264, 50, 250, 25) channel("start") range(-700, 700, -200, 1, 50) trackerColour(198, 231, 231, 255) valueTextBox(1) text("start pitch")
hslider bounds(264, 76, 250, 25) channel("end") range(-700, 700, 200, 1, 50) trackerColour(198, 231, 231, 255) valueTextBox(1) text("End pitch")
hslider bounds(264, 108, 250, 25) channel("dur") range(3, 12, 5, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("dur")
hslider bounds(264, 134, 250, 25) channel("slnc") range(0.2, 5, 1, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("silence")
hslider bounds(264, 162, 250, 25) channel("stp") range(0, 200, 0.5, 1, 50) trackerColour(198, 231, 231, 255) valueTextBox(1) text("Step Cent")

hslider bounds(264, 198, 250, 25) channel("spdmin") range(0.2, 8, 0.7, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd min")
hslider bounds(264, 226, 250, 25) channel("spdmax") range(1, 15, 2, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd max")

combobox   bounds(94, 134, 72, 20), text("Pitch", "Frq", "PchFrq"), value(1), channel("fx")  colour(56, 63, 79, 255)
combobox   bounds(414, 12, 57, 20), text("Line", "Rnd"), channel("mod"), value(2),  colour(56, 63, 79, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0
gisine		ftgen	0,0,4096,10,1

giTableL ftgen 0, 0, 10*sr, 2, 0
giTableR ftgen 0, 0, 10*sr, 2, 0
giTableLength = ftlen(giTableL) / sr


opcode PchSh,aa,aakkkk
aInL, aInR, kPitch, kTimb, kFFTSize,kMixPch xin
iFFTsize = 2^(i(kFFTSize)+6)
 ioverlap = iFFTsize/4
 ;;Pitch Left
 fSoundL pvsanal aInL, iFFTsize, ioverlap, iFFTsize, 1
 fTempL pvscale fSoundL, cent(kTimb), 1
 fTransposeL pvscale fTempL, cent(kPitch)
 aOutL pvsynth fTransposeL
 ;;Pitch Right
 fSoundR pvsanal aInR, iFFTsize, ioverlap, iFFTsize, 1
 fTempR pvscale fSoundR, cent(kTimb), 1
 fTransposeR pvscale fTempR, cent(kPitch)
 aOutR pvsynth fTransposeR
 	aMixL		ntrpol		aInL, aOutL, kMixPch
	aMixR		ntrpol		aInR, aOutR, kMixPch
	
xout aMixL,aMixR
endop
 
 
 
 opcode FrqSh,aa,aakk
aInL,aInR,kFrq,kMixFrq xin
	;;FrqLeft		
	aRealL, aImagL hilbert aInL			
	aSinL 	oscili       1,    kFrq,     gisine,           0
	aCosL 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1L	=		aRealL * aCosL
	aMod2L =		aImagL * aSinL	
	aFSL	= (aMod1L - aMod2L)
	aOutL	= aFSL
	;;FrqRight		
	aRealR, aImagR hilbert aInR		
	aSinR 	oscili       1,    kFrq,     gisine,           0
	aCosR 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1R	=		aRealR * aCosR
	aMod2R =		aImagR * aSinR	
	aFSR	= (aMod1R - aMod2R)
	aOutR	= aFSR
	aMixL		ntrpol		aInL, aOutL, kMixFrq
	aMixR		ntrpol		aInR, aOutR, kMixFrq
xout aMixL,aMixR
endop


;;instruments

instr ordplay
aInL, aInR diskin2 "../harf4.wav", 1,random:i(0,filelen("../harf4.wav")),1
;aInL, aInR ins

kFFTsize cabbageGet "fft"
kFX cabbageGet "fx"

kPitch cabbageGet "psh"
kTimb cabbageGet "tsh"
kMixPch cabbageGet "mixp" 

kFrqSh cabbageGet "fsh"
kMixFrq cabbageGet "mixf" 

kMix cabbageGet "mix"


kFFTsize	init	4 
	 if changed(kFFTsize)==1 then
	  reinit UPDATE
	 endif


UPDATE:


if kFX == 1 then
aOutFxL,aOutFxR PchSh aInL,aInR,kPitch,kTimb,kFFTsize,kMixPch
elseif kFX == 2 then
aOutFxL, aOutFxR FrqSh aInL, aInR, kFrqSh,kMixFrq
elseif kFX == 3 then
aPshL,aPshR PchSh aInL,aInR,kPitch,kTimb,kFFTsize,kMixPch
aOutFxL, aOutFxR FrqSh aPshL, aPshR, kFrqSh,kMixFrq
endif
rireturn




 aMixL ntrpol aInL, aOutFxL, kMix
 aMixR ntrpol aInR, aOutFxR, kMix
	
aEnv transegr 0, 0.1, 1, 1, 0.1,-6,0
	
aOutL = aMixL*aEnv
aOutR = aMixR*aEnv
out aMixL,aMixR
chnmix aInL ,"micL"
chnmix aInR ,"micR"
endin









instr play
aInL chnget "sndL"
aInR chnget "sndR"


kStartPch cabbageGet "start"
iStartPch = i(kStartPch)
kEndPch cabbageGet "end"
iEndPch = i(kEndPch)
iUpDown   cabbageGetValue "updown"
iSemitone cabbageGetValue "stp"
kMinSpeed cabbageGet "spdmin"
kMaxSpeed cabbageGet "spdmax"
kFrqShIn cabbageGet "fsh"


if iSemitone == 0 then
iSemitone = 1
endif
 kMod cabbageGet "mod"
;printk2 kMod

 if kMod == 1 && iUpDown == 1 then 
 kSemitone linseg iStartPch, p3, iEndPch
 kPitch = int(kSemitone/iSemitone)*iSemitone
 kFrqSh = kFrqShIn
 elseif kMod == 1 && iUpDown == 2 then
 kSemitone linseg iEndPch, p3, iStartPch
 kPitch = int(kSemitone/iSemitone)*iSemitone
 kFrqSh = kFrqShIn
 elseif kMod == 2 then
 kPitch rspline kStartPch, kEndPch, kMinSpeed, kMaxSpeed
; kFrqSh rspline kStartPch, kEndPch, kMinSpeed, kMaxSpeed
 kFrqSh = kPitch
 endif
;printk2 kPitch
kFFTsize cabbageGet "fft"
kFX cabbageGet "fx"

kPitchIn cabbageGet "psh"
; printk2 kSemitone
kTimb cabbageGet "tsh"
kMixPch cabbageGet "mixp" 

kMixFrq cabbageGet "mixf" 

if kFX == 1 then
aOutFxL,aOutFxR PchSh aInL,aInR,kPitch,kTimb,kFFTsize,kMixPch
elseif kFX == 2 then
aOutFxL, aOutFxR FrqSh aInL, aInR, kFrqSh,kMixFrq
elseif kFX == 3 then
aPshL,aPshR PchSh aInL,aInR,kPitch,kTimb,kFFTsize,kMixPch
aOutFxL, aOutFxR FrqSh aPshL, aPshR, kFrqSh,kMixFrq
endif
 aEnv transegr 0, 0.15, 8, 1, 0.15,-6,0
 aOutL = aOutFxL*aEnv
 aOutR = aOutFxL*aEnv


 out aOutL,aOutR
 chnclear "sndL", "sndR"
endin





instr widgets
aInL, aInR diskin2 "../harf4.wav", 1,0,1
;aInL, aInR ins
chnmix aInL, "sndL"
chnmix aInR, "sndR"
 kMetro    cabbageGet "metro"

 kMinSpeed cabbageGet "spdmin"
 kMaxSpeed cabbageGet "spdmax"
 kDurIn      cabbageGet "dur"
 kSilence    cabbageGet "slnc"

 kTime = 1/(kDurIn+kSilence)


kActive active 2
 kMod cabbageGet "mod"
if kMod == 1 then
kDur = kDurIn
elseif kMod == 2 then
kDur = 99999
endif

 if kMetro == 1 && changed(kMetro) == 1 then
turnoff2 "play",0,1
schedulek "play", 0, kDur
elseif kMetro == 0 then
turnoff2 "play",0,1
endif
if kActive == 0 && changed(kActive) == 1 then
schedulek "showw", 0, 1
 endif
 
 
endin


instr showw
cabbageSetValue "metro", 0
endin

;schedule "ordplay", 0, -1
schedule "widgets", 0, -1




</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>


