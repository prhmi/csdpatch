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
iNoteIndex = iMidi % 12
iSnumber = int(iMidi/12)-1
Sout sprintfk "%s%d",SNoteArr[iNoteIndex],iSnumber
xout Sout
endop


instr 1

iNum = 10
S1 MtoName iNum
S2 mton iNum

printf_i  "note = %s, note = %s\n", 1, S1,S2

endin

</CsInstruments>
<CsScore>
i1 0 .1
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>745</x>
 <y>99</y>
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
