<Cabbage>
form caption("Piano") size(400, 190), pluginId("pino")
image bounds(1, 3, 397, 147) file("piano.jpg")
vmeter bounds(354, 6, 16, 117) channel("ch1")  overlayColour(50, 50, 50, 250) meterColour:0(0, 255, 255, 200) meterColour:1(34, 126, 245, 150)
vmeter bounds(376, 6, 16, 117) channel("ch2")  overlayColour(50, 50, 50, 250) meterColour:0(0, 241, 255, 200) meterColour:1(24, 50, 123, 150)
keyboard bounds(0, 126, 399, 60) blackNoteColour(40, 58, 89, 255) whiteNoteColour(65, 80, 106, 255) , arrowColour(142, 49, 49, 255) channel("kbrd") identChannel("kbrd_i") mouseOverKeyColour(22, 22, 3, 128)
checkbox bounds(8, 10, 20, 20) shape("circle") colour:0(24, 81, 103, 255) colour:1(0, 255, 197, 255) channel("led1")  identChannel("led1_i")
checkbox bounds(34, 10, 20, 20) shape("circle") colour:0(24, 81, 103, 255) colour:1(0, 255, 197, 255) channel("led2")  identChannel("led2_i")
rslider bounds(16, 48, 60, 60) range(0, 1, 0.3, 1, 0.001) trackerColour(60, 143, 185, 255) channel("s1")
rslider bounds(144, 48, 60, 60) range(0, 1, 0.5, 1, 0.001) trackerColour(60, 143, 185, 255)channel("s2")
rslider bounds(80, 48, 60, 60) range(0, 1, 0.7, 1, 0.001) trackerColour(60, 143, 185, 255) channel("s3")
csoundoutput bounds(232, 0, 114, 121)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1

massign	0,0


instr 1
kstatus, kchan, kdata1, kdata2 midiin 

printk2 kdata2
printk2 kdata1

;aInL,aInR diskin "test.wav",1,0,1
aInL,aInR ins
iFFTsize = 1024
 kFrq, kampL 	ptrack 		aInL, iFFTsize
  kFrq, kampR 	ptrack 		aInR, iFFTsize
  krnd = 0.4
printks "%.d %d\n" ,0.2,  int(kFrq), kampL
  kampDBL ampdb kampL
  kampDBR ampdb kampR
;printk2 kampDBL
chnset kampDBL*2,"ch1"
chnset kampDBR*2,"ch2"
;kLED init 0 
kLED = (kdata2 == 0 ) ? 0: 1
if kLED == 0 && changed(kLED) == 1 then
chnset "value(0)", "led1_i"
elseif kLED == 1 && changed(kLED) == 1 then
kRnd = int(randomh:k(0,2,4))
chnset "value(1)", "led1_i"
endif


if kLED == 1 then
kLED2 = int(randomh:k(0,2,8))
printks "%.f %.f\n",0.15,kFrq,kampL
    if kLED2 == 1 && changed(kLED2) == 1 then
    chnset "value(1)", "led2_i"
    elseif kLED2 == 0 && changed(kLED2) == 1 then
    chnset "value(0)", "led2_i"
    endif
endif

endin
</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
;starts instrument 1 and runs it for a week
i1 0 [60*60*24*7] 
</CsScore>
</CsoundSynthesizer>
