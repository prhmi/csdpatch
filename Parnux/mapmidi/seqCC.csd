<Cabbage> 
form caption("seq-cc") size(320, 385), pluginId("mmap") colour(20,20,30)
;button bounds(270, 20, 101, 31) channel("start") text("start all", "stop all") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
checkbox bounds(130, 94, 20, 20) channel("start") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)

;label bounds(26, 20, 153, 21)    channel("track") text("cc-send")

;;cc1
checkbox bounds(32, 40, 20, 20) channel("cc1") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
nslider bounds(68, 24, 40, 35) channel("ccnum1") range(0, 127, 1, 1, 1) text("cc") colour(48, 66, 77, 255)
nslider bounds(117, 24, 80, 35) channel("cctime1") range(0.01, 10, 1.5, 1, 0.01) text("spd") colour(48, 66, 77, 255)
nslider bounds(206, 24, 40, 35) channel("ccmin1") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(250, 24, 40, 35) channel("ccmax1") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
;hmeter bounds(30, 66, 261, 15) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
combobox bounds(32, 88, 79, 26) channel("shape1") colour(50, 64, 82, 255) text("sine", "saw", "saw-r", "square", "table", "rnd-step", "rnd-line") value(1)
;image bounds(116, 144, 78, 27) channel("showshape1") file("s.png")

nslider bounds(236, 90, 54, 25) channel("port1") range(0, 0.07, 0.01, 1, 0.001) colour(48, 66, 77, 255)
label bounds(168, 99, 60, 12) channel("portl1") text("port time:")
;;cc2
checkbox bounds(32, 286, 20, 20) channel("cc2") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
nslider bounds(68, 270, 40, 35) channel("ccnum2") range(0, 127, 2, 1, 1) text("cc") colour(48, 66, 77, 255)
nslider bounds(117, 270, 80, 35) channel("cctime2") range(0.01, 10, 1.2, 1, 0.01) text("spd") colour(48, 66, 77, 255)
nslider bounds(206, 270, 40, 35) channel("ccmin2") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(250, 270, 40, 35) channel("ccmax2") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
;hmeter bounds(30, 224, 261, 15) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
combobox bounds(32, 334, 79, 26) channel("shape2") colour(50, 64, 82, 255) text("sine", "saw", "saw-r", "square","table", "rnd-step", "rnd-line", ) value(2)
;image bounds(116, 278, 78, 27) channel("showshape2") file("s.png")
nslider bounds(236, 334, 54, 25) channel("port2") range(0, 0.05, 0.01, 1, 0.001) colour(48, 66, 77, 255)
label bounds(168, 343, 60, 12) channel("portl2") text("port time:")
gentable bounds(32, 144, 255, 106),  identChannel("table1"), tableNumber(1.0), tableBackgroundColour(17, 17, 22, 255), tableGridColour(60, 56, 56, 128), , ampRange(0.0, 1.0, 1.0, 0.1), , active(1) fill(0)  zoom(-0.1) tableColour:0(61, 128, 154, 255)
;gentable bounds(346, 152, 227, 94),  identChannel("table2"), tableNumber(2.0), tableBackgroundColour(17, 17, 22, 255), tableGridColour(60, 56, 56, 128), , ampRange(0.0, 1.0, 1.0, 0.2000), , active(1) fill(0)  zoom(-0.1) tableColour:0(61, 128, 154, 255)


image bounds(30, 66, 261, 15), channel("meterb1") colour(64, 64, 65, 255)
image bounds(30, 312, 261, 15), channel("meterb2") colour(64, 64, 65, 255)
image bounds(30, 66, 0, 15), identChannel("meter1") colour(69, 171, 226, 255)
image bounds(30, 312, 0, 15), identChannel("meter2") colour(69, 171, 226, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0 
;-dm0 -n -+rtmidi=NULL -M0
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 1
0dbfs = 1

seed 0


giSine     ftgen   0, 0, 1024, 10, 1
giTriangle ftgen   0, 0, 1024, 7, 0, 512, 1, 512, 0
giSaw      ftgen   0, 0, 1024, 7, 1, 512, 0, 0, 1, 512, 0
girSaw     ftgen   0, 0, 1024, 7, 0, 512, 1, 0, 0, 512, 1
giSquare   ftgen   0, 0, 1024, 7, 1, 512, 1, 0, 0, 512, 0
;giSeq     ftgen   0, 0, 50, 7, 1, 10, 1, 0, 0.4, 10, 0.4, 0, 0.75, 10, 0.75, 0, 0, 10, 0, 0, 0.3, 10, 0.3

giSeq    ftgen    1, 0,   2^4, -2, 1, 0, 0, 0.5, 0.5, 0.5, 0, 0, 0, 1, 1, 1



instr ccout
 Sshape    sprintf "shape%d", p4
 Sport     sprintf "port%d", p4
 SccMin    sprintf "ccmin%d", p4
 SccMax    sprintf "ccmax%d", p4
 SccTime   sprintf "cctime%d", p4
 kShape    chnget Sshape

 kMin      chnget SccMin
 kMax      chnget SccMax
 kRate     chnget SccTime
 kPortTime chnget Sport ;giTableLen = ftlen(giTable) / sr
 iArrMod[] fillarray giTriangle,giSaw,girSaw,giSquare,giSeq
 UPDATE:
 iShape    chnget Sshape
   if iShape <= 5 then
   iMod = iArrMod[iShape-1]
      if iShape == 5 then
      kRate = kRate/3
      endif
   ;kLFO poscil 1,kRate, iMod
   kLFO phasor kRate
   kTab table kLFO*ftlen(iMod), iMod
   kValue = (kTab*(kMax-kMin))+kMin
   elseif iShape == 6 then
   kValue randomh kMin,kMax,kRate
   elseif iShape == 7 then
   kLFO = randi:k(0.5,kRate)+0.5
   kValue = (kLFO*(kMax-kMin))+kMin
   endif  
   if iShape >= 4 && iShape <= 6 then 
   kValue portk kValue, kPortTime
   endif
 rireturn
   if changed(kShape) == 1 then
   reinit UPDATE
   endif 
 iChn = 1
 iNumCC = p4
 Scc    sprintfk "meter%d", iNumCC
 iX = 30
 iY = 66+((p4-1)*246)
 Smeter sprintfk "bounds(%d, %d, %d, 15)", iX,iY, (kValue/127)*261
 chnset Smeter,Scc
 SccNum sprintfk "ccnum%d", iNumCC
 kNumCC chnget SccNum
 midiout 176,iChn, kNumCC, kValue
   if release() == 1 then
   Scconoff    sprintfk "cc%d", iNumCC
   chnset k(0),Scconoff
   Smeter0 sprintfk "bounds(%d, %d, %d, 15)", iX,iY,k(0)
   chnset Smeter0,Scc
   endif
endin

instr widgetWrite
; iY = 66
; iX = 30
; indx = 0
; while indx < 2 do
; SmeterB    sprintf "bounds(%d, %d, 261, 15),\
; channel(\"meterb%d\") colour(64, 64, 65, 255)", iX, iY, indx+1
; cabbageCreate "image", SmeterB 
; Smeter    sprintf "bounds(%d, %d, 0, 15),\
; channel(\"meter%d\") colour(69, 171, 226, 255)",iX, iY, indx+1
; cabbageCreate "image", Smeter 
; indx += 1
; iY += 158
; od
 
;  while indx < 8 do
; SmeterB    sprintf "bounds(%d, %d, 261, 15),\
; channel(\"meterb%d\") colour(64, 64, 65, 255)", iX, iY, indx+1
; cabbageCreate "image", SmeterB 
; Smeter    sprintf "bounds(%d, %d, 0, 15),\
; channel(\"meter%d\") colour(69, 171, 226, 255)",iX, iY, indx+1
; cabbageCreate "image", Smeter 
; indx += 1
; iY += 158
; od

endin



instr widgets

 kStart    chnget "start"
 iDur = 9^9
   if kStart == 1 && changed(kStart) == 1 then
   chnset  k(1),"cc1"
   chnset  k(1),"cc2"
   elseif kStart == 0 && changed(kStart) == 1 then
   chnset  k(0),"cc1"
   chnset  k(0),"cc2"

   endif
 kCC1      chnget "cc1"
 kCC2      chnget "cc2"
 iCCinstr  nstrnum "ccout"
   if kCC1 == 1 && changed(kCC1) == 1 then
     schedulek iCCinstr+0.1, 0, iDur, 1
     elseif kCC1 == 0 && changed(kCC1) == 1 then
     turnoff2 iCCinstr+0.1, 4, 1
   endif
   if kCC2 == 1 && changed(kCC2) == 1 then
     schedulek iCCinstr+0.2, 0, iDur, 2
     elseif kCC2 == 0 && changed(kCC2) == 1 then
     turnoff2 iCCinstr+0.2, 4, 1
   endif
endin

schedule "widgets", 0, 999999
;schedule "widgetWrite", 0, 1

</CsInstruments>
<CsScore>
;i "rndNote" 0 999999
;i 9 0 1
</CsScore>
</CsoundSynthesizer>
