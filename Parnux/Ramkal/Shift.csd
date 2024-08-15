<Cabbage>
form caption("Shift") size(550, 400)  guiMode("queue")  colour(20,30,40)  pluginId("shft")

checkbox bounds(24, 282, 30, 30) channel("metro") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
label bounds(54, 292, 80, 16) channel("label10002") text("Random")

checkbox bounds(24, 82, 30, 30) channel("play") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
label bounds(56, 90, 80, 16) channel("label10004") text("on/off")
checkbox bounds(204, 80, 20, 20) channel("rvrs") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
label bounds(172, 58, 80, 16) channel("label10012") text("reverse")

rslider bounds(460, 312, 70, 70) channel("mix") range(0, 1, 0.5, 1, 0.001)  text("mix")  trackerColour(0, 255, 154, 255)

label bounds(22, 254, 170, 22) channel("label10006") text("Random setting")
label bounds(20, 226, 511, 22) channel("label10010") text("--------------------------------------------------------")
label bounds(466, 60, 71, 16) channel("label10011") text("random")


label bounds(20, 26, 155, 22) channel("label10005") text("Play setting")
rslider bounds(22, 130, 70, 70) channel("minspeed") range(1, 7, 1, 1, 1)  text("spd min")  trackerColour(0, 255, 154, 255) valueTextBox(1)
rslider bounds(92, 130, 70, 70) channel("maxspeed") range(2, 10, 5, 1, 1)  text("spd max")  trackerColour(0, 255, 154, 255) valueTextBox(1)
label bounds(164, 152, 80, 16) channel("label10009") text("Duration")


nslider bounds(174, 170, 54, 29) channel("playtime") range(1, 20, 3, 1, 1)
combobox bounds(322, 14, 129, 30) channel("mode") text("ordinary", "Pitch Shifting", "Frq Shifting", "Pitch & Frq") value(4)
rslider bounds(398, 50, 70, 70) channel("mixfx") range(0, 1, 1, 1, 0.01)  text("FX mix")  trackerColour(0, 255, 154, 255) valueTextBox(1)
combobox bounds(180, 106, 71, 30) channel("fft") text("128", "256","512", "1024", "2048") value(4)
rslider bounds(324, 50, 70, 70) channel("smt") range(-20, 20, 0, 1, 0.5)  text("semitone")  trackerColour(0, 255, 154, 255) valueTextBox(1)
checkbox bounds(488, 90, 30, 30) channel("smrnd") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
rslider bounds(324, 124, 70, 70) channel("pbase") range(-1200, 1200, 0, 1, 100)  text("pitch")  trackerColour(0, 255, 154, 255) valueTextBox(1)
checkbox bounds(488, 164, 30, 30) channel("fxrnd") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
rslider bounds(398, 124, 70, 70) channel("fbase") range(-400, 400, 0, 1, 50)  text("Frq")  trackerColour(0, 255, 154, 255) valueTextBox(1)



rslider bounds(92, 318, 70, 70) channel("moses") range(0, 100, 50, 1, 1)  text("Moses")  trackerColour(0, 255, 154, 255) valueTextBox(1)
rslider bounds(22, 318, 70, 70) channel("speed") range(0.1, 10, 2, 1, 0.1)  text("Speed")  trackerColour(0, 255, 154, 255) valueTextBox(1)

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


opcode PchSh,aa,aakii
aInL, aInR, kPitch, iFFTsize,iMixPch xin

 ioverlap = iFFTsize/8
 ;;Pitch Left
 fSoundL pvsanal aInL, iFFTsize, ioverlap, iFFTsize, 1
 fTransposeL pvscale fSoundL, cent(kPitch)
 aOutL pvsynth fTransposeL
 ;;Pitch Right
 fSoundR pvsanal aInR, iFFTsize, ioverlap, iFFTsize, 1
 fTransposeR pvscale fSoundR, cent(kPitch)
 aOutR pvsynth fTransposeR
 	aMixL		ntrpol		aInL, aOutL, iMixPch
	aMixR		ntrpol		aInR, aOutR, iMixPch
	
xout aMixL,aMixR
endop
 
 
 
 opcode FrqSh,aa,aakii
aInL,aInR,kFrqIn,iFB,iMixFrq xin
kFrq = kFrqIn
	aFS	init	0
	;;FrqLeft
	aSndL	=	aInL + (aFS * iFB)			
	aRealL, aImagL hilbert aSndL			
	aSinL 	oscili       1,    kFrq,     gisine,           0
	aCosL 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1L	=		aRealL * aCosL
	aMod2L =		aImagL * aSinL	
	aFSL	= (aMod1L - aMod2L)
	aOutL	= aFSL
	;;FrqRight
	aSndR	=	aInR + (aFS * iFB)			
	aRealR, aImagR hilbert aSndR		
	aSinR 	oscili       1,    kFrq,     gisine,           0
	aCosR 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1R	=		aRealR * aCosR
	aMod2R =		aImagR * aSinR	
	aFSR	= (aMod1R - aMod2R)
	aOutR	= aFSR
	aMixL		ntrpol		aInL, aOutL, iMixFrq
	aMixR		ntrpol		aInR, aOutR, iMixFrq
xout aMixL,aMixR
endop



;;instruments

instr mic
aInL, aInR diskin2 "../flute.wav", 1,0,1
;aInL, aInR ins
chnmix aInL ,"micL"
chnmix aInR ,"micR"
endin




instr machine
iPlayTime cabbageGetValue "playtime"
schedule "record",0,12
schedule "play",0.1,iPlayTime

endin



instr play
iMinSpeed cabbageGetValue "minspeed"
iMaxSpeed cabbageGetValue "maxspeed"
iMode cabbageGetValue "mode"
iSemitone cabbageGetValue "smt"
iSemRnd cabbageGetValue "smrnd"

kSemitone init 0
kReverse cabbageGetValue "rvrs"

if kReverse == 0 then 
kTime linseg iMinSpeed, p3, iMaxSpeed
elseif kReverse == 1 then
kTime linseg iMaxSpeed, p3, iMinSpeed
endif
if metro(kTime) == 1 then
kDur = 1/(kTime)
if kDur <= 0.5 then
kDur = 0.5
endif
schedulek "sound", 0, kDur,iMode, kSemitone
    if iSemRnd == 1 then
    iSemitone random -15, 15
    endif
kSemitone += iSemitone
endif
endin


instr record
 aInL chnget "micL"
 aInR chnget "micR"
 aPointer linseg 0, giTableLength, giTableLength*sr
 tablew aInL, aPointer, giTableL
 tablew aInR, aPointer, giTableR
; chnclear	"micL"
; chnclear	"micR"
endin


instr sound
iMixFX cabbageGetValue "mixfx"
iFFTsizeIn cabbageGetValue "fft"
iFFTsize = 2^(iFFTsizeIn+6)
;kFxValue cabbageGet "fxvalue"
kSemitone semitone p5 
iBaseFrq cabbageGetValue "fbase"
iBasePitch cabbageGetValue "pbase"
iFxRnd cabbageGetValue "fxrnd"
if iFxRnd == 1 then
iBasePitch random -1200, 1200
iBaseFrq random -400, 400
endif


iSpeed = (1/giTableLength)
 aPlayL poscil3 1, iSpeed, giTableL,0
 aPlayR poscil3 1, iSpeed, giTableR,0
 
 iAtt = 0.01
 aEnv transeg 0, iAtt, 4, 1, p3-(iAtt*2), 1, 1, iAtt, -4, 0
 
; aInL = aPlayL*aEnv
; aInR = aPlayR*aEnv
aInL linen aPlayL, p3/2, p3, p3/2
aInR linen aPlayR, p3/2, p3, p3/2
 iMode = p4
if iMode == 1 goto Play
if iMode == 2 goto Pitch
if iMode == 3 goto Frq
if iMode == 4 goto PitchFrq
 
 ;;Pitch
 Pitch:
 		kPitch = kSemitone*iBasePitch
; printk2 kPitch
 		iMixPch = iMixFX
 		aPitchL, aPitchR PchSh aInL, aInR, kPitch, iFFTsize,iMixPch
        aOutL = aPitchL
        aOutR = aPitchR
        goto end
Frq:
 		kFrq = kSemitone*iBaseFrq
; printk2 kFrq
        iFB  = 0.5
 		iMixFrq = iMixFX
 		aFrqL, aFrqR FrqSh aInL, aInR, kFrq, iFB,iMixFrq
        aOutL = aFrqL
        aOutR = aFrqR
        goto end


PitchFrq:
 iRndMode = random:i(0, 100) > 50 ? 0:1
 if iRndMode == 0 goto Pitch
 if iRndMode == 1 goto Frq
 goto end
 
 Play:
 aOutL = aInL
 aOutR = aInR
; out aOutL, aOutR
end:
 chnmix	aOutL,"shiftL"
 chnmix	aOutL,"shiftR"
endin


instr widgets
;;sound
kMix cabbageGet "mix" ;0.5
 aInL       chnget "micL"
 aInR       chnget "micR"
 aShiftL    chnget "shiftL"
 aShiftR    chnget "shiftR"
 
 aMixL ntrpol aInL, aShiftL, kMix
 aMixR ntrpol aInR, aShiftR, kMix
out aMixL, aMixR
chnclear "micL", "micR", "shiftL", "shiftR"

;;compose
kMachine cabbageGet "metro"
kMoses cabbageGet "moses"
kSpeed cabbageGet "speed"
kTime = 1/kSpeed
if kMachine == 1 then
    if metro(kTime) == 1 then
    kPlay = int(random:k( 0,100) > kMoses ? 1:0)
    endif
cabbageSetValue "play",kPlay
endif

kPlay cabbageGet "play"
    if kPlay == 1 && changed(kPlay) == 1 then
    schedulek "machine", 0, 9999
    elseif kPlay == 0 && changed(kPlay) == 1 then
    turnoff2 "machine", 0,0
    turnoff2 "record", 0,0
    turnoff2 "sound", 0,1
    turnoff2 "play", 0,0
    endif
endin


schedule "mic", 0, -1
schedule "widgets", 0, -1



</CsInstruments>
<CsScore>
;i "Mic" 0 7
;i "Record" 0 1
;i "Machine" 1 5
</CsScore>
</CsoundSynthesizer>


