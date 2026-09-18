<Cabbage>
form caption("midi-map") size(550, 360), guiMode("queue"), pluginId("mmap") colour(20,20,30)
button bounds(22, 34, 101, 31) channel("start") text("start", "stop") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
image bounds(264, 33, 261, 309)  channel("ccbk") colour(25, 28, 31, 255) outlineColour(141, 164, 183, 255) outlineThickness(2) corners(5)
image bounds(22, 74, 225, 266)  channel("trackbk") colour(25, 28, 31, 255) outlineColour(141, 164, 183, 255) outlineThickness(2) corners(5)
label bounds(24, 7, 153, 21)    channel("track") text("midi generator")
label bounds(282, 44, 227, 17)    channel("track2") text("cc1        cc2        cc3        cc4") align("left")

image bounds(210, 90, 20, 20)   channel("durled") colour(113, 122, 125, 255)
label bounds(174, 92, 30, 20)  channel("active") text("") align("right") 
nslider bounds(32, 234, 50, 40) channel("durmin") range(1, 12, 3, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 234, 50, 40) channel("durmax") range(1, 12, 8, 1, 1) text("max") colour(48, 66, 77, 255)
label bounds(138, 254, 93, 20)  channel("durshow") text("dur:") align("left") 
nslider bounds(32, 186, 50, 40) channel("notemin") range(20, 100, 60, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 186, 50, 40) channel("notemax") range(20, 100, 72, 1, 1) text("max") colour(48, 66, 77, 255)
label bounds(138, 206, 93, 20)  channel("noteshow") text("Note:") align("left") 
nslider bounds(32, 282, 50, 40) channel("velmin") range(10, 110, 60, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 282, 50, 40) channel("velmax") range(10, 110, 70, 1, 1) text("max") colour(48, 66, 77, 255)
label bounds(138, 302, 93, 20)  channel("velshow") text("vel:") align("left")  
vmeter bounds(292, 210, 14, 85) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
nslider bounds(280, 124, 40, 35) channel("ccmin1") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(280, 166, 40, 35) channel("ccmax1") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
vmeter bounds(356, 210, 14, 85) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
nslider bounds(344, 124, 40, 35) channel("ccmin2") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(344, 166, 40, 35) channel("ccmax2") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
vmeter bounds(420, 210, 14, 85) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
nslider bounds(406, 124, 40, 35) channel("ccmin3") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(406, 166, 40, 35) channel("ccmax3") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
vmeter bounds(480, 210, 14, 85) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(64, 64, 65, 255)    outlineThickness(0) meterColour:0(10, 150, 220, 255) meterColour:1(10, 150, 220, 255)
nslider bounds(468, 124, 40, 35) channel("ccmin4") range(0, 127, 30, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(468, 166, 40, 35) channel("ccmax4") range(0, 127, 82, 1, 1) text("max") colour(48, 66, 77, 255)
rslider bounds(278, 70, 45, 45) channel("cctime1") range(1, 10, 4, 1, 0.1) trackerColour(130, 187, 209, 255)
rslider bounds(38, 86, 60, 60) channel("time") range(1, 10, 4, 1, 0.1) trackerColour(130, 187, 209, 255) text("speed")
rslider bounds(342, 70, 45, 45) channel("cctime2") range(1, 10, 4, 1, 0.1) trackerColour(130, 187, 209, 255)
rslider bounds(404, 70, 45, 45) channel("cctime3") range(1, 10, 4, 1, 0.1) trackerColour(130, 187, 209, 255)
rslider bounds(466, 70, 45, 45) channel("cctime4") range(1, 10, 4, 1, 0.1) trackerColour(130, 187, 209, 255)
checkbox bounds(288, 312, 20, 20) channel("cc1") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
checkbox bounds(352, 312, 20, 20) channel("cc2") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
checkbox bounds(416, 312, 20, 20) channel("cc3") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
checkbox bounds(478, 312, 20, 20) channel("cc4") colour:0(81, 86, 89, 255) colour:1(210, 236, 130, 255)
combobox bounds(184, 38, 60, 26) channel("rndmod") colour(50, 64, 82, 255) text("step", "line") value(1)
combobox bounds(114, 130, 46, 26) channel("basenote") colour(50, 64, 82, 255) text( "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "Bb", "B") value(1)
combobox bounds(169, 130, 67, 26) channel("scale") colour(50, 64, 82, 255) text("scale", "minor", "major", "prst1", "prst2") value(5)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1

seed 0

opcode MtoNameInt, S,i
iMidi xin 
SNoteArr[] fillarray "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "Bb", "B"
iAraziArr[] fillarray 1, 3, 6, 8, 10
iNoteIndex = (iMidi) % 12
iNoteIndxInt = int(iNoteIndex)
iSCent = int((iMidi-int(iMidi))*100.5)
if iSCent  == 0 then
Sout sprintf "%s",SNoteArr[iNoteIndex]
elseif iSCent == 100 then
Sout sprintf "%s",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
else
		if iSCent > 50 then
		Sout sprintf "%s-",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
		elseif iSCent <= 50 then
		Sout sprintf "%s+",SNoteArr[iNoteIndex]
			indx = 0			
			while indx < lenarray(iAraziArr) do
				if iNoteIndxInt = iAraziArr[indx] then
				Sout sprintf "%s-",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
				endif
			indx += 1
			od
		endif
endif
xout Sout
endop




opcode noteScale, i,ii
iNoteMin,iNoteMax xin
iScale       cabbageGetValue "scale"
iBaseNoteIn  cabbageGetValue "basenote"
iBaseNote = iBaseNoteIn-1
start:
iNoteRnd = int(random:i( iNoteMin, iNoteMax))

; a b c d e f g 
;iBaseNote ntom "0C"
iNote = iNoteRnd
iOctav = 0
	     until iNote < iBaseNote+12 do
	     iOctav += 1
  		iNote -= 12
  		enduntil
iMinor[]          fillarray 0, 2, 3, 5, 7, 8, 10, 12
iMajor[]          fillarray 0, 2, 4, 5, 7, 9, 11, 12
iMySc1[]          fillarray 0, 1, 3, 5, 6, 8, 10, 12
iMySc2[]          fillarray 0, 1, 3, 4, 6, 8, 9, 11, 12

if     iScale == 1 goto skip
;iNoteOut = iNoteRnd
if iScale == 2 then
iScaleArr[] = iMinor
elseif iScale == 3  then
iScaleArr[] = iMajor
elseif iScale == 4  then
iScaleArr[] = iMySc1
elseif iScale == 5  then
iScaleArr[] = iMySc2
endif
indx = 0
iCheck = 0
while indx < lenarray(iScaleArr) do
if iNote == iScaleArr[indx]+iBaseNote then
iCheck = 1
endif
indx += 1
od
;print iCheck

if iCheck == 0 goto start



SnoteOut MtoNameInt iNoteRnd

skip:
iNoteOut = iNote+(12*iOctav)


xout iNoteOut
endop

instr midiMachine
 kTimeRnd init 1
 kTimeGet cabbageGet "time"
 kTime = kTimeGet/15
 kDurMin cabbageGet "durmin"
 kDurMax cabbageGet "durmax"
   if metro(kTimeRnd) == 1 then
   kTimeRnd random kTime*0.9, kTime*1.1
   kDur random kDurMin, kDurMax
      StimeShow     sprintfk "text(time: %.2f)", kTime
      SdurShow     sprintfk "text(dur: %.2f)", kDur
      cabbageSet 1, "timeshow", StimeShow
      cabbageSet 1, "durshow", SdurShow
   schedulek "midiSend", 0, kDur
   endif
endin

instr ccOut
kRndMod cabbageGet "rndmod"
SccMin sprintf "ccmin%d", p4
SccMax sprintf "ccmax%d", p4
SccTime sprintf "cctime%d", p4
kMin cabbageGet SccMin
kMax cabbageGet SccMax
kTimeIn cabbageGet SccTime
kTime = kTimeIn/10
 iChn = 1
 iNumCC = p4
  if kRndMod == 1 then
  kValue randomh kMin, kMax, kTime
  elseif kRndMod == 2 then
  kValue rspline kMin, kMax, kTime*0.9, kTime*1.1
  endif
Scc    sprintfk "meter%d", iNumCC
cabbageSetValue Scc,kValue/127
  
 midiout 176,iChn, iNumCC, kValue
 if release() == 1 then
 Scconoff    sprintfk "cc%d", iNumCC
cabbageSetValue Scconoff,k(0)
cabbageSetValue Scc,k(0)
 endif
endin

instr midiSend
iActive active p1
SactiveShow     sprintf "text(%d)", iActive
cabbageSet "active", SactiveShow
Scolor = "colour(30,120,220)"
cabbageSet 1,"durled",Scolor
if release() == 1 then
ScolorOff = "colour(113, 122, 125, 255)"
cabbageSet 1,"durled",ScolorOff
endif
iChn = p4

iNoteMin cabbageGetValue "notemin"
iNoteMax cabbageGetValue "notemax"

iVelMin cabbageGetValue "velmin"
iVelMax cabbageGetValue "velmax"
iVeloc random iVelMin, iVelMax

iNote noteScale iNoteMin, iNoteMax

Snote MtoNameInt iNote
SnoteShow     sprintf "text(Note: %s)", Snote
cabbageSet "noteshow", SnoteShow
SvelShow     sprintf "text(vel: %d)", iVeloc
cabbageSet "velshow", SvelShow

midion iChn, iNote, iVeloc


endin


instr widgets
kStart    cabbageGet "start"

kCC1      cabbageGet "cc1"
kCC2      cabbageGet "cc2"
kCC3      cabbageGet "cc3"
kCC4      cabbageGet "cc4"
iDur = 9^9
if kStart == 1 && changed(kStart) == 1 then
schedulek "midiMachine", 0, iDur
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 "midiMachine", 0, 0
turnoff2 "midiSend", 0, 1
turnoff2 "ccOut", 0, 1
endif

iCCinstr  nstrnum "ccOut"

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
if kCC3 == 1 && changed(kCC3) == 1 then
schedulek iCCinstr+0.3, 0, iDur, 3
elseif kCC3 == 0 && changed(kCC3) == 1 then
turnoff2 iCCinstr+0.3, 4, 1
endif
if kCC4 == 1 && changed(kCC4) == 1 then
schedulek iCCinstr+0.4, 0, iDur, 4
elseif kCC4 == 0 && changed(kCC4) == 1 then
turnoff2 iCCinstr+0.4, 4, 1
endif
endin

schedule "widgets", 0, -1

</CsInstruments>
<CsScore>
;i "rndNote" 0 999999
;i 9 0 1
</CsScore>
</CsoundSynthesizer>
