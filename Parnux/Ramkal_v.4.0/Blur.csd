<Cabbage>
form caption("Blur") size(220,150), pluginid("Blur")
image bounds(0, 0, 220, 150) file("Blur.jpg")
combobox   bounds(120, 18, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontcolour(255,255,255)
rslider bounds(28, 46, 85, 85) channel("blrsze") text("Blur Size") range(0, 1, 0.2, 1, 0.001) valuetextbox(1) trackercolour(147, 207, 207, 255) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
checkbox  bounds(28, 18, 75, 21), text("Random") , channel("mod")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255), value(0) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
rslider bounds(116, 57, 73, 72), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001), trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr = 44100
ksmps = 64
0dbfs = 1
nchnls = 2

giTableL    ftgen  0, 0, 60*sr, 2, 0
giTableR    ftgen  0, 0, 60*sr, 2, 0
giTableLength = ftlen(giTableL) / sr


seed 0


instr audio
gkmod chnget "mod"
gkRndSpeed chnget "rndspd"
gkBlurSize chnget "blrsze"
gkFFTSize chnget "FFT"
gkmix chnget "mix"

;ainL diskin2 "test.wav", 0.7, 0, 1
;ainR = ainL
ainL, ainR ins

gaoutL = ainL
gaoutR = ainR
kmod = gkmod
kBlureSize = gkBlurSize*10
kTime init 1
schedule "blur", 0.01, 999
if metro:k(kTime) == 1 then
kTime random 1/4, 1/2
turnoff2 "record", 0, 1
turnoff2 "play", 0, 1
schedulek "record", 0, 999,kmod,kBlureSize
endif
endin
instr record
iAtt = 0.5
iRel = 2
imod = p4
iBlureSize = p5
aEnv	transegr	0,iAtt,4, 1,p3,4,0, iRel,-4,0
aPointer linseg 0, giTableLength, giTableLength*sr
tablew gaoutL*aEnv, aPointer, giTableL
tablew gaoutR*aEnv, aPointer, giTableR
schedule "play", 0.01, 999,imod,iBlureSize
endin
instr play
imod = p4
if imod == 0 then
iSpeed = p5
elseif imod == 1 then
iSpeed random 1, 10
endif
iAtt = 0.5
iRel = 2
aEnv	transegr	0,iAtt,4, 1,p3,4,0, iRel,-4,0
ainL paulstretch iSpeed, 0.2, giTableL
ainR paulstretch iSpeed, 0.2, giTableR
aoutL = ainL*aEnv
aoutR = ainR*aEnv
;out aout,aout
gaout2L = aoutL
gaout2R = aoutR
endin

instr blur
ainL = gaoutL
ainR = gaoutR
if gkmod == 1 then
kBlurSize = randi:k(0.4, 8, 2)+0.4
elseif gkmod == 0 then
kBlurSize = gkBlurSize
endif
kFFTSize = gkFFTSize
kFFTSize	init	5 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	ioverlap = iFFTsize/4 
	iwinsize = 2^(i(kFFTSize)+6)
	iwintype = 1 
	
fftinL		pvsanal	ainL, iFFTsize, ioverlap, iwinsize, iwintype
fftblurL	pvsblur	fftinL, kBlurSize, 0.65; blur
aoutBlurL		pvsynth	fftblurL

fftinR		pvsanal	ainR, iFFTsize, ioverlap, iwinsize, iwintype
fftblurR	pvsblur	fftinR, kBlurSize, 0.65; blur
aoutBlurR		pvsynth	fftblurR
rireturn

kMixRnd = randi:k(0.4, 2, 2) + 0.5
aRvbMixL		ntrpol		aoutBlurL, gaout2L , kMixRnd
aRvbMixR		ntrpol		aoutBlurR, gaout2R , kMixRnd
aRvbMixL, aRvbMixR  freeverb aRvbMixL, aRvbMixR, kBlurSize/2, 0.35,1
kmix = gkmix
aMixEnv interp (kmix+5)
aoutL		ntrpol		ainL, aRvbMixL*aMixEnv , kmix
aoutR		ntrpol		ainR, aRvbMixR*aMixEnv , kmix
outs aoutL, aoutR
endin
</CsInstruments>
<CsScore>
i "audio" 0 999
</CsScore>
</CsoundSynthesizer>

