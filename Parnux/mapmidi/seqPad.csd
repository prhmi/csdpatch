<Cabbage>
form caption("seq-pad") size(320, 385), guiMode("queue"), pluginId("mmap") colour(20,20,30)

button bounds(16, 20, 74, 31) channel("start") text("start", "stop") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
label bounds(260, 14, 30, 20)  channel("active")  align("right") text("")
image bounds(294, 18, 12, 12)   channel("durled") colour(113, 122, 125, 255)
nslider bounds(32, 148, 50, 40) channel("durmin") range(1, 12, 3, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 148, 50, 40) channel("durmax") range(1, 12, 8, 1, 1) text("max") colour(48, 66, 77, 255)
label bounds(138, 168, 99, 20)  channel("durshow") text("dur:") align("left") 
nslider bounds(32, 100, 50, 40) channel("notemin") range(20, 100, 60, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 100, 50, 40) channel("notemax") range(20, 100, 72, 1, 1) text("max") colour(48, 66, 77, 255)
label bounds(138, 120, 99, 20)  channel("noteshow") text("Note:") align("left") 
rslider bounds(98, 34, 60, 60) channel("time") range(1, 5, 2, 1, 0.1) trackerColour(130, 187, 209, 255) text("speed")
combobox bounds(166, 54, 46, 26) channel("basenote") colour(50, 64, 82, 255) text( "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "Bb", "B") value(1)
combobox bounds(220, 54, 81, 26) channel("scale") colour(50, 64, 82, 255) text("scale", "minor", "major", "prst1", "prst2") value(2)
combobox bounds(220, 86, 81, 26) channel("rndoct") colour(50, 64, 82, 255) text("oct off", "-1:0", " -0:1", " -1:1") value(1)
nslider bounds(20, 60, 65, 29) channel("chn") range(1, 16, 1, 1, 1) text("channel") colour(48, 66, 77, 255)
image bounds(30, 204, 261, 15), channel("meterb1") colour(64, 64, 65, 255)
image bounds(30, 224, 261, 15), channel("meterb2") colour(64, 64, 65, 255)
image bounds(30, 244, 261, 15), channel("meterb3") colour(64, 64, 65, 255)
image bounds(30, 264, 261, 15), channel("meterb4") colour(64, 64, 65, 255)
image bounds(30, 204, 0, 15), channel("meter1") colour(60, 150, 200, 255)
image bounds(30, 224, 0, 15), channel("meter2") colour(60, 150, 200, 255)
image bounds(30, 244, 0, 15), channel("meter3") colour(60, 150, 200, 255)
image bounds(30, 264, 0, 15), channel("meter4") colour(60, 150, 200, 255) ;150, 60, 100, 255
button bounds(16, 300, 74, 31) channel("chord") text("chord off", "chord on") colour:0(48, 66, 77, 255) colour:1(77, 48, 74, 255)
button bounds(104, 300, 40, 31) channel("iii") text("iii", "iii") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(152, 300, 40, 31) channel("iv") text("iv", "iv") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(200, 300, 40, 31) channel("v") text("v", "v") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(248, 300, 40, 31) channel("vi") text("vi", "vi") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
label bounds(23, 352, 258, 16) channel("chordshow") text("List:") align("left")

checkbox bounds(270, 124, 20, 20) channel("b1") colour:0(79, 79, 74, 255) colour:1(255, 245, 0, 255)
checkbox bounds(246, 124, 20, 20) channel("b2") colour:0(79, 79, 74, 255) colour:1(255, 245, 0, 255)

label bounds(260, 164, 32, 22)  channel("funcshow")  text("-") fontColour(209, 245, 52, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
;-dm0 -n -+rtmidi=NULL -Q0
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 0
0dbfs = 0

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




opcode noteScale, iS,ii
 iNoteMin,iNoteMax xin
 iScale       cabbageGetValue "scale"
 iBaseNoteIn  cabbageGetValue "basenote"
 iBaseNote = iBaseNoteIn-1
 start:
 iNoteRnd = int(random:i( iNoteMin, iNoteMax))
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
;   iCheckRep = 0
;   while iCheckRep < lenarray(giNoteArr) do
;   if iNoteOut = giNoteArr[iCheckRep] goto start
;   iCheckRep += 1
;   od
 xout iNoteOut,SnoteOut
endop 


opcode chordScale, iS,ii
 iNoteIn,iIntrval xin
 iScale       cabbageGetValue "scale"
 iBaseNoteIn  cabbageGetValue "basenote"
 iBaseNote = iBaseNoteIn-1
 iNote = iNoteIn
 iOctav = 0
	     until iNote < iBaseNote+12 do
	     iOctav += 1
  		iNote -= 12
  		enduntil
 iNorm[]           genarray 0, 12
 iMinor[]          fillarray 0, 2, 3, 5, 7, 8, 10, 12
 iMajor[]          fillarray 0, 2, 4, 5, 7, 9, 11, 12
 iMySc1[]          fillarray 0, 1, 3, 5, 6, 8, 10, 12
 iMySc2[]          fillarray 0, 1, 3, 4, 6, 8, 9, 11, 12
 if     iScale == 1 then
 iScaleArr[] = iNorm
 elseif iScale == 2 then
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
while iCheck < lenarray(iScaleArr) do
if iNote == iScaleArr[iCheck] then
indx = iCheck
endif
iCheck += 1
od
;print iNoteNum
iOctIn cabbageGetValue "rndoct"
if     iOctIn == 1 then
iRndOctave = 0
elseif iOctIn == 2 then
iRndOctave = -1
elseif iOctIn == 3 then
iRndOctave = 1
elseif iOctIn == 4 then
iRndOctave = int(random:i(-2, 2))
endif
 iIntralOut = iScaleArr[iIntrval-1]
 iNoteOut = ((iNote+(12*iOctav))+iIntralOut)+(12*iRndOctave)
 iNoteMin  cabbageGetValue "notemin"
 iNoteMax  cabbageGetValue "notemax"
; 	until iNoteOut < iNoteMax+12 do
;    iNoteOut -= 12
;  	enduntil
;   	until iNoteOut > iNoteMin-12 do
;    iNoteOut += 12
;  	enduntil 
 SnoteOut MtoNameInt iNoteOut
 SnoteIn MtoNameInt iNote
 Sprint sprintf "%s %s", SnoteIn, SnoteOut
 xout iNoteOut,SnoteOut
endop 


opcode FuncPrg, i[],ii
iFunc,iLen xin
 iScale       cabbageGetValue "scale"
 iBaseNoteIn  cabbageGetValue "basenote"
 iMin cabbageGetValue "notemin"
 iNoteBase = iBaseNoteIn-1 
    until iNoteBase > iMin do
    iNoteBase += 12
    enduntil
 iNorm[]    genarray 0, 12
 iMinor[]   fillarray 0, 2, 3, 5, 7, 8, 10, 12
 iMajor[]   fillarray 0, 2, 4, 5, 7, 9, 11, 12
 iMySc1[]   fillarray 0, 1, 3, 5, 6, 8, 10, 12
 iMySc2[]   fillarray 0, 1, 3, 4, 6, 8, 9, 11, 12
 if     iScale == 1 then
 iScaleArr[] = iNorm
 elseif iScale == 2 then
 iScaleArr[] = iMinor
 elseif iScale == 3  then
 iScaleArr[] = iMajor
 elseif iScale == 4  then
 iScaleArr[] = iMySc1
 elseif iScale == 5  then
 iScaleArr[] = iMySc2
 endif
iOutArr[] init iLen
SOutArr[] init iLen

 indx = 0
 iRead = iFunc-1
 while indx < iLen do
 iNote = iNoteBase+iScaleArr[iRead]
  iOutArr[indx] = iNote
 Snote mton iNote
 ;puts Snote, 1
 SOutArr[indx] = Snote
 indx += 1
 iRead = (iRead+2) % (lenarray(iScaleArr)-1)
 od
xout iOutArr
endop



instr midiMachine
 kChord cabbageGet "chord"
 kB1 cabbageGet "b1"
 if kChord == 0 && changed(kChord) == 1 then
  Sfunc sprintfk "text(%s)", "-"
  cabbageSet 1, "funcshow", Sfunc
 kIntrval = 0
 endif
 kActive active "midiMonitor"
 kTimeRnd init 1
 kTimeGet cabbageGet "time"
 kTime = kTimeGet/20
 kDurMin cabbageGet "durmin"
 kDurMax cabbageGet "durmax"
   if metro(kTimeRnd) == 1 then
   kTimeRnd random kTime*0.9, kTime*1.1
   kDur random kDurMin, kDurMax
      SdurShow     sprintfk "text(dur: %.1f)", kDur
   if kActive < 4 then
   cabbageSet 1, "durshow", SdurShow
   schedulek "midiMonitor", 0, kDur,kChord, kIntrval
      if kB1 == 1 then
      kDel random (1/kTime)/10, (1/kTime)/15
      schedulek "chordChng", kDel, 0.1
      endif
   endif
   endif
 kIII    cabbageGet "iii"
 kIV    cabbageGet "iv"
 kV     cabbageGet "v"
 kVI    cabbageGet "vi"
 if     changed(kIII) == 1 then
 kIntrval = 3
 Sfunc sprintfk "text(%s)", "III"
 elseif changed(kIV) == 1 then
 kIntrval = 4
 Sfunc sprintfk "text(%s)", "IV"
 elseif changed(kV) == 1 then
 kIntrval = 5
 Sfunc sprintfk "text(%s)", "V"
 elseif changed(kVI) == 1 then
 kIntrval = 6
 Sfunc sprintfk "text(%s)", "VI"
 endif
   if changed(kIII,kIV,kV,kVI) == 1then
      if kActive >= 4  then
      turnoff2 "midiMonitor", 1, 1
      turnoff2 "midiSend",    1, 1
      endif
   cabbageSet 1, "funcshow", Sfunc
   kDur random kDurMin, kDurMax
   if kChord == 0 then
   schedulek "midiMonitor", 0.1, kDur,kChord,kIntrval
   endif
   endif
endin

giNoteArr[] init 6

instr chordChng
SArr[] fillarray "iii", "iv", "v", "vi"
iRndChn = int(random:i(0, 4))
Sindx = SArr[iRndChn]
cabbageSetValue Sindx, rnd(1)
endin



instr midiMonitor
;print p4,p5
 kActive active p1
 iActive active p1
   if p4 == 0 then
   Scolor = "colour(60, 150, 200, 255)"
   elseif p4 == 1 then
   Scolor = "colour(150, 60, 100, 255)"
   endif
   ;write notes
   iNoteIndx = 0
   while giNoteArr[iNoteIndx] != 0 do
   iNoteIndx += 1
   od
   if release() == 1 then
   schedulek "rmvMidi", 0, 0.1, iNoteIndx
   cabbageSet 1,"noteshow", "text(Note:)"
   endif 
 ;;show widgets
 Smeter        sprintfk "bounds(30, %d, %d, 15),  %s ", \
 184+((iNoteIndx+1)*20),(timeinsts()/p3)*261,Scolor
 SActv         sprintf "meter%d", iNoteIndx+1
 cabbageSet 1, SActv,Smeter
 cabbageSet 1, "durled",Scolor
 ;;inputs
 iVeloc    random 60, 70
 iNoteMin  cabbageGetValue "notemin"
 iNoteMax  cabbageGetValue "notemax"
 iChord    cabbageGetValue "chord"
 kB2 cabbageGet "b2"
 ;;send
 SChrdArr[] init 4
 iChrdArr[] init 4
   if     p4 == 0 then ;one note, chord off
     if p5 == 0 then
       again:
       iNote,Snote noteScale iNoteMin, iNoteMax
       ;;check for repeated
       iCheck = 0
       while iCheck < lenarray(giNoteArr) do
       if iNote = giNoteArr[iCheck] goto again
       iCheck += 1
       od
       giNoteArr[iNoteIndx] = iNote
       SnoteShow  sprintf "text(Note: %s)", Snote
       cabbageSet "noteshow", SnoteShow
     elseif p5 != 0 then ;add interval
       iNoteR = giNoteArr[iNoteIndx-1]
       Snote1 MtoNameInt iNoteR
       iNote,Snote2 chordScale iNoteR, p5
       giNoteArr[iNoteIndx] = iNote
       Snote sprintf "%s  %s", Snote1, Snote2
       SnoteShow   sprintf "text(List: %s)", Snote
       cabbageSet "chordshow", SnoteShow 
         if release() == 1 then
         Sfunc sprintfk "text(%s)", "-"
         cabbageSet 1, "funcshow", Sfunc
         endif
       endif
   ;printarray giNoteArr, "%d"
   schedule "midiSend", 0, p3, iNote, iVeloc
   elseif p4 == 1 then ;chord on
   giNoteArr[iNoteIndx] = 10
       if     p5 == 0 then ;random notes
   indx = 0
   iRndChord = int(random:i(2, 5))
   while indx < iRndChord do
   iVeloc random 30, 55
       againchord:
       iNote,Snote  noteScale iNoteMin, iNoteMax
       ;;check for repeated
          iCheckRep = 0
          while iCheckRep < lenarray(iChrdArr) do
          if iNote = iChrdArr[iCheckRep] goto againchord
          iCheckRep += 1
          od
       iChrdArr[indx] = iNote
       SChrdArr[indx] = Snote
       schedule "midiSend", 0, p3, iNote, iVeloc
       indx += 1
       od
       elseif p5 != 0 then ;interval notes
       iRndChord = int(random:i(2, 5))
       iVeloc random 30, 55
       iNoteBarr[] FuncPrg p5, iRndChord
       ;printarray iNoteBarr
       iBaseNote = int(random:i(iNoteMin, iNoteMax))
         iWrite = 0
         while iWrite < iRndChord do
         if kB2 == 0 then
         iNote,Snote chordScale iBaseNote, p5
         iChrdArr[iWrite] = iNote
         SChrdArr[iWrite] = Snote
         iBaseNote = iNote
         elseif kB2 == 1 then
         iNote = iNoteBarr[iWrite]
         ;print iNote
         iChrdArr[iWrite] = iNote
         Snote MtoNameInt iNote
         SChrdArr[iWrite] = Snote
         iBaseNote = iNote
         endif
         schedule "midiSend", 0, p3, iNote, iVeloc
         iWrite += 1
         od
       SnoteP MtoNameInt iChrdArr[0]
       SnoteShow  sprintf "text(Note: %s)", SnoteP
       cabbageSet "noteshow", SnoteShow
       endif
   Schord sprintf "text(List:   %s   %s   %s   %s)"\
   ,SChrdArr[0],SChrdArr[1],SChrdArr[2],SChrdArr[3]
   ;printarray SChrdArr, 1, "%s"
   cabbageSet  "chordshow", Schord
   endif
endin


instr rmvMidi ;2
giNoteArr[p4] = 0
    ;printarray giNoteArr, "%d"
   SActv sprintf "meter%d", p4+1
   cabbageSet  1, SActv,"bounds(0, 0, 0, 0)"
 kActive active "midiSend"  
    SactiveShow   sprintfk "text(%d)", kActive
 cabbageSet 1, "active", SactiveShow
 Scolor = "colour(113, 122, 125, 255)"
 cabbageSet 1, "durled",Scolor
endin


instr midiSend
 iChn cabbageGetValue "chn"
 kActive active p1
 SactiveShow   sprintfk "text(%d)", kActive
 cabbageSet 1, "active", SactiveShow
 iNote = p4
 iVeloc = p5
 midion iChn, iNote, iVeloc
endin



instr widgets
 kStart    cabbageGet "start"
 iDur = 9^9
    if kStart == 1 && changed(kStart) == 1 then
    schedulek "midiMachine", 0, 99999
    elseif kStart == 0 && changed(kStart) == 1 then
    turnoff2 "midiMachine", 0, 1
    turnoff2 "midiMonitor", 0, 1
    turnoff2 "midiSend", 0, 1
    endif
endin

schedule "widgets", 0, 999999

</CsInstruments>
<CsScore>
;i "rndNote" 0 999999
;i 9 0 1
</CsScore>
</CsoundSynthesizer>
