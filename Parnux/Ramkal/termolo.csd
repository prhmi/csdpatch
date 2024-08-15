; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Termolo") size(420, 100)  guiMode("queue")  colour(30,30,50)  pluginId("trml")
;image bounds(0, 142, 300, 150) file("3DPan.jpg") channel("image3")
rslider bounds(238, 10, 75, 75), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(10, 10, 75, 75), channel("spdmin"), text("Min spd"), range(0.5, 12, 3, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(86, 10, 75, 75), channel("spdmax"), text("Max spd"), range(8, 23, 12, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
rslider bounds(162, 10, 75, 75), channel("rng"), text("Rng"), range(0.1, 12, 0.7, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)

combobox bounds(322, 12, 62, 27) channel("mod") text("mod1", "mod2") value(1)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr     = 44100	
ksmps 	= 64		
nchnls 	= 2		
0dbfs	= 1		


instr 1

;aInL,aInR diskin "../flute.wav",1,0,1
aInL,aInR ins
kSpeedMin cabbageGet "spdmin"
kSpeedMax cabbageGet "spdmax"
kMod	cabbageGet	"mod"
kRng cabbageGet "rng"
kMix cabbageGet "mix"
	 if changed(kMod)==1 then
	 reinit UPDATE
	 endif
 UPDATE:
	if kMod == 1 then
    kLFO = jspline:k(kRng,kSpeedMin,kSpeedMax)+kRng
    aLFO  lfo 1, kLFO,1
    elseif kMod == 2 then
    kRng2 = (kRng/17)+0.3
    aLFO = jspline:a(kRng2,kSpeedMin,kSpeedMax)+kRng2
    endif
rireturn




aoutL = aInL*aLFO
aoutR = aInR*aLFO

   	amixL		ntrpol		aInR, aoutL, kMix	
	amixR		ntrpol		aInR, aoutR, kMix	
out amixL,amixR
endin
</CsInstruments>
<CsScore>
i1 0 [9^9]
</CsScore>
</CsoundSynthesizer>
