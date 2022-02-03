
<Cabbage>
form caption("Freeze") size(300,180) pluginId("frze")
image bounds(0, 0, 300, 180) file("Freeze.jpg")

checkbox  bounds(116, 12, 68, 21) text("Metro")  channel("metro")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
checkbox  bounds(18, 12, 73, 21) text("Freeze")  channel("frznow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
checkbox  bounds(206, 12, 77, 21) text("AmpRnd")  channel("ampnow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontColour:0(243, 243, 243, 255) fontColour:1(243, 243, 243, 255)
rslider bounds(10, 82, 85, 85) channel("frztme") text("Freeze Time") range(5, 50, 7, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
nslider bounds(24, 42, 56, 32) range(0, 100, 40, 1, 1) velocity(50) channel("frzmss") text("Frz moses")
rslider bounds(202, 82, 85, 85) channel("amptme") text("Amp Time") range(5, 50, 12, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
nslider bounds(216, 42, 56, 32) range(0, 100, 70, 1, 1) velocity(50) channel("ampmss") text("Amp moses")
rslider bounds(116, 98, 69, 69) channel("mix") text("mix"), range(0, 1, 1, 1, 0.001) trackerColour(198, 231, 231, 255)  outlineColour(0, 0, 0, 255)  textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255) valueTextBox(1)
combobox   bounds(122, 54, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontColour(255,255,255)

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
kAmpRnd chnget "ampnow"
kfrznow chnget "frznow"
kmetro chnget "metro"
kmix	chnget	"mix"
kmix port kmix, 0.1

kAmpSpeed chnget "amptme"
kAmpMoses chnget "ampmss"

kFrzSpeed chnget "frztme"
kFrzMoses chnget "frzmss"

if kAmpRnd == 1 then
kAmp = ((randi:k(50,kAmpSpeed,2)+50) > kAmpMoses) ? 0 : 1
else
kAmp = 1
endif
kAmp port kAmp, 0.001
aAmp interp kAmp

kTime init 1
if kmetro == 1 then
kfrznow = ((randi:k(50,kFrzSpeed,2)+50) < kFrzMoses) ? 0 : 1
endif


aInL,aInR	ins
;ainL	diskin2	"test.wav",1,0,1
;ainR = ainL

kFFTSize chnget "FFTSize"
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
aFrzL,aFrzR Freeze aInL,aInR,kfrznow,kFFTSize
rireturn	
		
	amixL		ntrpol		aInL, aFrzL*aAmp, kmix
	amixR		ntrpol		aInR, aFrzR*aAmp, kmix
						
			;outs	 aoutL, aoutR
			outs amixL,amixR
endin


</CsInstruments>

<CsScore>
i 1 0 [60*60*24*7]
</CsScore>

</CsoundSynthesizer>
