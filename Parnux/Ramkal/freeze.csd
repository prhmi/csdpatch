; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Freeze") size(300,215) pluginId("frze") guiMode("queue") colour(30,30, 50)
;image bounds(0, 0, 300, 215) file("back.jpg")

checkbox  bounds(116, 12, 75, 21) text("Random")  channel("metro")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
checkbox  bounds(18, 12, 73, 21) text("Freeze")  channel("frznow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
checkbox  bounds(206, 12, 77, 21) text("AmpRnd")  channel("ampnow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
rslider bounds(10, 82, 85, 85) channel("frztme") text("Freeze Time") range(0.5, 30, 7, 1, 0.1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
nslider bounds(24, 42, 56, 32) range(0, 100, 40, 1, 1) velocity(50) channel("frzmss") text("Frz moses") colour(56, 63, 79, 255)
rslider bounds(202, 82, 85, 85) channel("amptme") text("Amp Time") range(5, 50, 12, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
nslider bounds(216, 42, 56, 32) range(0, 100, 70, 1, 1) velocity(50) channel("ampmss") text("Amp moses") colour(56, 63, 79, 255)
rslider bounds(116, 98, 69, 69) channel("mix") text("mix"), range(0, 1, 1, 1, 0.001) trackerColour(198, 231, 231, 255)  outlineColour(0, 0, 0, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
combobox   bounds(122, 54, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)
combobox   bounds(210, 172, 75, 23), text("Square", "Termolo", "RndTerm"), channel("tml"), value(1), colour(56, 63, 79, 255)
combobox   bounds(16, 174, 71, 23), text("on Frz","anyway"), channel("frzmd"), value(1), fontColour(255,255,255) colour(56, 63, 79, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr 		= 	44100
ksmps 		= 	64
nchnls 		= 	2
0dbfs		=	1	


seed 0

opcode Freeze,aa,aakk
aInL,aInR,kTrig,kFFTSize xin
	iFFTsize = 2^(i(kFFTSize)+6)
	ioverlap = iFFTsize/4 ;256
	iwinsize = 2^(i(kFFTSize)+6)
	iwintype = 1 
	kfreeza = kTrig
	kfreezf = kTrig
;;Left
    f_analL  	pvsanal	aInL, iFFTsize, ioverlap, iwinsize, iwintype		;ANALYSE AUDIO INPUT SIGNAL AND OUTPUT AN 
	f_freezeL	pvsfreeze f_analL, kfreeza, kfreezf
	aFL		pvsynth f_freezeL                      				;RESYNTHESIZE THE f-SIGNAL AS AN AUDIO SIGNAL
 ;;Right
    f_analR  	pvsanal	aInR, iFFTsize, ioverlap, iwinsize, iwintype		;ANALYSE AUDIO INPUT SIGNAL AND OUTPUT AN 
	f_freezeR	pvsfreeze f_analR, kfreeza, kfreezf
	aFR		pvsynth f_freezeR  
	
aOutL = aFL
aOutR = aFR
xout aOutL,aOutR
endop


instr	1
kAmpRnd cabbageGet "ampnow"
kfrznow cabbageGet "frznow"
kmetro cabbageGet "metro"
kMix	cabbageGet	"mix"
kAmpSpeed cabbageGet "amptme"
kAmpMoses cabbageGet "ampmss"

kFrzSpeed cabbageGet "frztme"
kFrzMoses cabbageGet "frzmss"

kAmpMod cabbageGet "tml"
kFrzMod cabbageGet "frzmd"

kTime init 1
if kmetro == 1 then
kfrznow = ((randi:k(50,kFrzSpeed,2)+50) < kFrzMoses) ? 0 : 1
cabbageSetValue "frznow",kfrznow
endif

if kFrzMod == 1 then
kFrzM = kfrznow
elseif kFrzMod == 2 then
kFrzM = 1
endif

kAmp = 1
if kAmpRnd == 1 && kFrzM == 1 then

    if kAmpMod == 1 then
    kAmp = ((randi:k(50,kAmpSpeed,2)+50) > kAmpMoses) ? 0 : 1


    elseif kAmpMod == 2 then
    kRng = (kAmpSpeed/5)
    kSpeedMin = ((kAmpMoses/100)*5)+1
    kSpeedMax = ((kRng*kSpeedMin)/10)+5
    kAmp = jspline:k(kRng,kSpeedMin,12)+kRng
    kAmp  lfo  1, kAmp,1
    elseif kAmpMod == 3 then
    kRng = (kAmpSpeed/5)
    kSpeedMin = ((kAmpMoses/100)*5)+1
    kSpeedMax = ((kRng*kSpeedMin)/10)+5
    kAmp = jspline:k(kRng,kSpeedMin,12)+kRng
    kAmp  lfo  1, kAmp,3
    endif

endif
   kAmp port kAmp, 0.003
    aAmp interp kAmp



aInL,aInR	ins
;aInL,aInR	diskin2	"../flute.wav",1,0,1


kFFTSize cabbageGet "FFTSize"
kFFTSize	init	4 

	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:

aFrzL,aFrzR Freeze aInL,aInR,kfrznow,kFFTSize
rireturn

kmix port kfrznow, 0.08
		
	amixL		ntrpol		aInL, aFrzL, kmix
	amixR		ntrpol		aInR, aFrzR, kmix
	aOutOutL = amixL*aAmp
	aOutOutR = amixR*aAmp
			
kMix port kMix, 0.1
	aMixOutL		ntrpol		aInL, aOutOutL, kMix
	aMixOutR		ntrpol		aInR, aOutOutR, kMix
			out aMixOutL,aMixOutR
endin


</CsInstruments>

<CsScore>
i 1 0 [6^6]
</CsScore>

</CsoundSynthesizer>
