
<Cabbage>
form caption("Freeze") size(300,180) pluginid("Freeze")
image bounds(0, 0, 300, 180) file("Freeze.jpg")

checkbox  bounds(116, 12, 68, 21) text("Metro")  channel("metro")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontcolour:0(243, 243, 243, 255) fontcolour:1(243, 243, 243, 255)
checkbox  bounds(18, 12, 73, 21) text("Freeze")  channel("frznow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontcolour:0(243, 243, 243, 255) fontcolour:1(243, 243, 243, 255)
checkbox  bounds(206, 12, 77, 21) text("AmpRnd")  channel("ampnow")  colour:1(236, 255, 0, 255) colour:0(96, 95, 95, 255) fontcolour:0(243, 243, 243, 255) fontcolour:1(243, 243, 243, 255)
rslider bounds(10, 42, 85, 85) channel("frztme") text("Freeze Time") range(5, 50, 7, 1, 0.001) textcolour(255, 255, 255, 255) trackercolour(198, 231, 231, 255) outlinecolour(0, 0, 0, 255) valuetextbox(1) fontcolour(255, 255, 255, 255)
nslider bounds(24, 130, 56, 32) range(0, 100, 40, 1, 1) velocity(50) channel("frzmss") text("Frz moses")
rslider bounds(202, 42, 85, 85) channel("amptme") text("Amp Time") range(5, 50, 12, 1, 0.001) textcolour(255, 255, 255, 255) trackercolour(198, 231, 231, 255) outlinecolour(0, 0, 0, 255) valuetextbox(1) fontcolour(255, 255, 255, 255)
nslider bounds(216, 130, 56, 32) range(0, 100, 70, 1, 1) velocity(50) channel("ampmss") text("Amp moses")
rslider bounds(116, 58, 69, 69) channel("mix") text("mix"), range(0, 1, 1, 1, 0.001) trackercolour(198, 231, 231, 255)  outlinecolour(0, 0, 0, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
combobox   bounds(122, 138, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontcolour(255,255,255)

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



if kfrznow == 1 then
 kfreeza = 1
 kfreezf = 1
 else
 kfreeza = 0
 kfreezf = 0
endif


ainL,ainR	ins
;ainL	diskin2	"test.wav",1,0,1
;ainR = ainL

ainL linenr ainL, 0.1, 1, 0.01
ainR linenr ainR, 0.1, 1, 0.01

kFFTSize chnget "FFTSize"
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	ioverlap = iFFTsize/4 ;256
	iwinsize = 2^(i(kFFTSize)+6)
	iwintype = 1 
	

    f_anal  	pvsanal	ainL, iFFTsize, ioverlap, iwinsize, iwintype		;ANALYSE AUDIO INPUT SIGNAL AND OUTPUT AN FSIG
	f_freeze	pvsfreeze f_anal, kfreeza, kfreezf
	aFL		pvsynth f_freeze                      				;RESYNTHESIZE THE f-SIGNAL AS AN AUDIO SIGNAL
    aFrzL linenr aFL,0.1, 1, 0.01
    f_anal  	pvsanal	ainL, iFFTsize, ioverlap, iwinsize, iwintype		;ANALYSE AUDIO INPUT SIGNAL AND OUTPUT AN FSIG
	f_freeze	pvsfreeze f_anal, kfreeza, kfreezf
	aFR		pvsynth f_freeze                      				;RESYNTHESIZE THE f-SIGNAL AS AN AUDIO SIGNAL
    aFrzR linenr aFR,0.1, 1, 0.01

rireturn	
		
	amixL		ntrpol		ainL, aFrzL*aAmp, kmix
	amixR		ntrpol		ainR, aFrzR*aAmp, kmix
						
			;outs	 aoutL, aoutR
			outs amixL,amixR
endin


</CsInstruments>

<CsScore>
i 1 0 [60*60*24*7]
</CsScore>

</CsoundSynthesizer>

