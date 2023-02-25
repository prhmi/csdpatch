; Ramkal_VSTe_V_4.9, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2023
; github.com/prhmi
<Cabbage>
image bounds(0, 0, 302, 150) file("back.jpg") channel("image1")
form caption("Metalizer") size(300,150), pluginId("mtlz")
rslider bounds(112, 44, 85, 85) channel("metalizer_time") text("Metalizer") range(0, 5, 1, 1, 0.001) valueTextBox(147)  trackerColour(147, 207, 207, 255)textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
rslider bounds(26, 44, 85, 85) channel("blur_time") text("Blur Time") range(0, 5, 0.3, 1, 0.001) valueTextBox(1) trackerColour(147, 207, 207, 255) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
checkbox  bounds(202, 18, 57, 21), text("Pan") , channel("pan")   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255), value(0) fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
rslider bounds(196, 44, 85, 85), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001), trackerColour(147, 207, 207, 255) valueTextBox(1) textColour(255, 255, 255, 255) fontColour(255, 255, 255, 255)
combobox   bounds(120, 18, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontColour(255,255,255) colour(56, 63, 79, 255)

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

gainL init 0
gainR init 0
gaoutL init 0
gaoutR init 0

opcode	Metalizer,aa,aakk

asig1,asig2,kdepth,krvt	xin

kBox_metalizer cabbageGet "box"


kBox randomh 1, 7, 3
kBox = int(kBox)


if kBox == 1 then
klp1      =         1/8*kdepth          
klp2      =         1/13*kdepth
klp3      =         1/546*kdepth
klp4      =         1/739*kdepth
klp5      =         1/1360 *kdepth
klp6      =         1/2654*kdepth
elseif kBox == 2 then
klp1      =         1/8*kdepth          
klp2      =         1/10*kdepth
klp3      =         1/12*kdepth
klp4      =         1/16*kdepth
klp5      =         1/18 *kdepth
klp6      =         1/20*kdepth
elseif kBox == 3 then
klp1      =         1/33*kdepth          
klp2      =         1/35*kdepth
klp3      =         1/37*kdepth
klp4      =         1/39*kdepth
klp5      =         1/41 *kdepth
klp6      =         1/43*kdepth
elseif kBox == 4 then
klp1      =         1/10*kdepth          
klp2      =         1/20*kdepth
klp3      =         1/30*kdepth
klp4      =         1/40*kdepth
klp5      =         1/50 *kdepth
klp6      =         1/60*kdepth
elseif kBox == 5 then
klp1      =         1/8*kdepth          
klp2      =         1/16*kdepth
klp3      =         1/32*kdepth
klp4      =         1/64*kdepth
klp5      =         1/128 *kdepth
klp6      =         1/256*kdepth
elseif kBox == 6 then
klp1      =         1/10*kdepth          
klp2      =         1/50*kdepth
klp3      =         1/100*kdepth
klp4      =         1/150*kdepth
klp5      =         1/200 *kdepth
klp6      =         1/250*kdepth
endif
asig = (asig1+asig2)/2
aecho1    vcomb      asig, krvt, klp1, 1 
aecho2    vcomb      asig, krvt, klp2, 1
aecho1    =         asig+aecho1
aecho2    =         asig+aecho2
aecho3    vcomb      aecho1, krvt, klp3, 1
aecho4    vcomb      aecho1, krvt, klp4, 1
aecho5    vcomb      aecho2, krvt, klp5, 1
aecho6    vcomb      aecho2, krvt, klp6, 1
aecho6 = aecho6 * 0.01
aout1     =         (aecho1+aecho3+aecho5)*.1
aout2     =         (aecho2+aecho4+aecho6)*.1

xout	aout1 ,aout2

endop



opcode	blur ,a,akkkiiii
	ain,kblurtime,kmix,klev,iFFTsize,ioverlap,iwinsize,iwintype	xin
	f_anal  	pvsanal	ain, iFFTsize, ioverlap, iwinsize, iwintype		;ANALYSE AUDIO INPUT SIGNAL AND OUTPUT AN FSIG
	f_blur		pvsblur	f_anal, kblurtime, 2					;BLUR AMPLITUDE AND FREQUENCY VALUES OF AN F-SIGNAL
	aout		pvsynth f_blur                      				;RESYNTHESIZE THE f-SIGNAL AS AN AUDIO SIGNAL
	amix		ntrpol		ain, aout, kmix					;CREATE DRY/WET MIX
			xout		amix*klev	
endop






instr	blur_load
;-------------------------------------------
; metalizer
;-------------------------------------------

kdepth1 = 1
kmetalizertime cabbageGet "metalizer_time" ; 0-5
kmetalizer_onoff = 1

ainL,ainR	ins

;ainL,ainR diskin "test.wav",1,10,1
;ainR = ainL

aout1,aout2	Metalizer	ainL,ainR,kdepth1,kmetalizertime


aMetalL	ntrpol	aout1*0.7,ainL,1-kmetalizer_onoff
aMetalR	ntrpol	aout2*0.7,ainR,1-kmetalizer_onoff

;---------------------------------------------
; Blur
;---------------------------------------------
katt_table	init	 5
kblurtime cabbageGet "blur_time" ; 0-5
	kblur_onoff	= 1

	klev		= 1
	kPan cabbageGet "pan"
	;kPan port kPan, 0.01


kFFTSize cabbageGet "FFTSize"
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	ioverlap = iFFTsize/4 ;256
	iwinsize = 2^(i(kFFTSize)+6)
	iwintype = 1 
	/*-------------------*/
	
	kblurtime	port	kblurtime,0.1    
   aLeft		blur 	aMetalL,kblurtime,kblur_onoff,klev,iFFTsize,ioverlap,iwinsize,iwintype
   aRight	  	blur 	aMetalR,kblurtime,kblur_onoff,klev,iFFTsize,ioverlap,iwinsize,iwintype
 rireturn
gainL = ainL
gainR = ainR



kpan1	jspline	1,1,5
kpan2	jspline 1,1,4
aoutL1,aoutR1	pan2		aLeft,kpan1
aoutL2,aoutR2	pan2		aRight,kpan2



if kPan == 1 then
aoutL = (aoutL1+aoutL2)
aoutR = (aoutR1+aoutR2)
elseif kPan == 0 then
aoutL = aLeft*2
aoutR = aRight*2
endif
aDelayL linenr gaoutL,0.1,1,0.01
aDelayR linenr gaoutR,0.1,1,0.01
aoutL = aoutL+aDelayL
aoutR = aoutR+aDelayR

kmix cabbageGet "mix"
aMixEnv interp (kmix+2)
kMixRnd = randi:k(0.4, 2, 2) + 0.5
aRvbMixL, aRvbMixR  freeverb aoutL, aoutR, kblurtime/2, 0.35,1
	amixL		ntrpol		aoutL, aRvbMixL*aMixEnv, kMixRnd
	amixR		ntrpol		aoutR, aRvbMixR*aMixEnv, kMixRnd

	amixoutL		ntrpol		ainL, amixL, kmix
	amixoutR		ntrpol		ainR, amixR, kmix	

outs		amixoutL,amixoutR
print 6^6
endin









</CsInstruments>

<CsScore>
;i 1 0 [60*60*24*7]
i "metro"     0 [6^6]
i "blur_load" 0 [6^6]

</CsScore>

</CsoundSynthesizer>
