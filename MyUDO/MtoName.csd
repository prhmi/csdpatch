<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



opcode MtoName, S,i
iMidi xin 
SNoteArr [] fillarray "C", "C#", "D", "D#","E", "F", "F#", "G","G#", "A", "A#", "B"

iNoteIndex = (iMidi) % 12
iSnumber = int(iMidi/12)-1
iSCent = (iMidi-int(iMidi))*100
if iSCent != 0 then
	if iSCent > 50 then
		Sout sprintfk "%d%s-%d",iSnumber,SNoteArr[iNoteIndex+1],(100-iSCent)
	elseif iSCent <= 50 then
		Sout sprintfk "%d%s+%d",iSnumber,SNoteArr[iNoteIndex],iSCent
	endif
elseif iSCent == 0 then
Sout sprintfk "%d%s",iSnumber,SNoteArr[iNoteIndex]
endif
xout Sout
endop


instr 1

iNum = p4
S1 MtoName iNum
S2 mton iNum

itest = int(-4.5)
;print itest
printf_i  "Parham = %s, Csound = %s\n", 1, S1,S2

endin

</CsInstruments>
<CsScore>
i1 + .1 25.6
;i1 + .1 1
;i1 + .1 13
;i1 + .1 24
;i1 + 99 38
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>792</x>
 <y>500</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
