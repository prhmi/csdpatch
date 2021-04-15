<Cabbage> 
form caption("Tuner") size(180, 225) pluginid("Tuner")
image bounds(0, 0, 370, 225) file("tuner.jpg")
label bounds(24, 14, 61, 32)   text("---") identchannel("tuner") align("left") fontcolour(147, 207, 207, 255)
rslider bounds(18, 132, 69, 77), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001)     trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(90, 52, 69, 77), channel("fltr"), text("Filter"), range(250, 6000, 700, 1, 0.001)     trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(92, 132, 69, 77), channel("dtn"), text("Detune"), range(0.5, 2.5, 2, 2, 0.001)     trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(18, 52, 69, 77), channel("velocity"), text("Velocity"), range(0.1, 0.7, 0.1, 1, 0.001)     trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
combobox   bounds(94, 14, 57, 23), text("128","256","512","1024","2048","4096","8192"), channel("FFTSize"), value(4), fontcolour(255,255,255)
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


instr Start


kVelocity chnget "velocity"
kFilter  chnget "fltr"
kDetune chnget "dtn"
;ainL diskin2 "test3.wav", 1,0,1
;ainR = ainL
;
ainL, ainR ins
ain sum ainL, ainR

kFFTSize chnget "FFTSize"
printk2 kFFTSize
kFFTSize	init	4 
	 if changed(kFFTSize)==1 then
	  reinit UPDATE
	 endif
	 UPDATE:
	iFFTsize = 2^(i(kFFTSize)+6)
	
kfr, kamp 	ptrack 		ain, iFFTsize
rireturn
printk2 iFFTsize
kamp = ampdb(kamp)
;printk2 kfr
a1 poscil 0.4, kfr, 26
a2 poscil kamp/2, kfr*kDetune, 26
asum sum a1,a2

aFltrOut clfilt asum, kFilter, 0, 35
aRvbOut,aRvbOut freeverb aFltrOut, aFltrOut, 0.65,1
aRvbMix		ntrpol		aFltrOut, aRvbOut , 0.4



;;note show

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
kmix  chnget "mix"
kmix port kmix, 0.1
aEnv2 interp (kmix+1)
aoutL		ntrpol		ainL, aRvbMix*aEnv*aEnv2 , kmix
aoutR		ntrpol		ainR, aRvbMix*aEnv*aEnv2 , kmix
out aoutL,aoutR
;out ain,ain
knum		=			(octcps(kfr*2)-3) * 12
if ktrig == 1 && changed(ktrig) == 1 then
        schedulek  "NoteShow", 0, 0.01,knum
    endif


endin



instr NoteShow
 S1 init ""
 knum = p4
 S2  mton knum

	S1 strcat S1, "align(\"left\") "
  SIdent	sprintfk	"text(%0.2s)", S2
  S1 strcat S1, SIdent



  chnset S1, "tuner"
;  puts S1,1

endin

</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f 26	0	512	7	-1 256 -1 513 1 256
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
