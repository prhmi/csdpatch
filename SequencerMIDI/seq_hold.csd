

<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

massign	3,1 ;channel 3 for this sequencer

giNoteArr  []   init 4	
giLength        init lenarray:i(giNoteArr)
giEmptyArr []   init giLength		
giActive        init 0
giCountMIDI     init 0



instr 1
 giActive active 1
 giCountMIDI = (giCountMIDI+1 >= giLength) ? giLength : giCountMIDI+1
 iNote notnum
 iRead = giCountMIDI 
 if giActive == 1 then
  giNoteArr [] = giEmptyArr
  giCountMIDI = 1
 endif
 while iRead < giLength do
  giNoteArr [iRead] = giEmptyArr[iRead]
  iRead += 1
 od	
 giNoteArr [giCountMIDI-1] = iNote	
 printarray giNoteArr, "%.0f", "Notes On ="
endin



</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>725</x>
 <y>140</y>
 <width>400</width>
 <height>300</height>
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
