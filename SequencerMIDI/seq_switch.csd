
/*-------------------------------------------------------------------------
Writing MIDI to Array for MIDI Sequencer
	write the midi number in order that played
-------------------------------------------------------------------------*/


<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

massign	0,0

giNoteArr  []   init 4	
giLength        init lenarray:i(giNoteArr)
giEmptyArr []   init giLength		
giCountMIDI     init 0 

instr MIDI_Play
 kHold = 1
 kstatus, kchan, kNote, kVel  midiin
 ktrig changed kchan, kNote, kVel
 kCount init 0
 if ktrig == 1 && kVel != 0 then
 kCount = ((kCount+1) > giLength) ? giLength : kCount+1
 elseif ktrig == 1 && kVel == 0 then
  kCount = (kCount-1 < 0) ? 0 : kCount-1
 endif
 
 if kVel != 0 && ktrig == 1 && kCount == 1 then
  schedulek "NoteRmv",  0, 0, kNote
 endif
 
 	if     kVel != 0 && ktrig == 1 && kchan == 1 && kCount != 1 then	;channel 1 to sequence 1
  	 schedulek "NoteOn_sq1",  0, 0, kNote
 	elseif kVel == 0 && ktrig == 1 && kchan == 1 && kHold == 0 then
  	 schedulek "NoteOff_sq1", 0, 0, kNote
 	elseif kVel != 0 && ktrig == 1 && kchan == 2 && kCount != 1 then ;channel 2 to sequence 2
  	 schedulek "NoteOn_sq2",  0, 0, kNote
 	elseif kVel == 0 && ktrig == 1 && kchan == 2 && kHold == 0 then
  	 schedulek "NoteOff_sq2", 0, 0, kNote
 	endif
endin

instr NoteOn_sq1
 giCountMIDI = (giCountMIDI+1 >= giLength) ? giLength : giCountMIDI+1
 iNote = p4
 iRead = giCountMIDI 
 if giCountMIDI == 0 then
  giNoteArr [] = giEmptyArr
 endif
 while iRead < giLength do
  giNoteArr [iRead] = giEmptyArr[iRead]
  iRead += 1
 od	
 giNoteArr [giCountMIDI-1] = iNote	
 printarray giNoteArr, "%.0f", "Notes On ="
endin
instr NoteOff_sq1
 giCountMIDI = (giCountMIDI-1 < 0) ? 0 : giCountMIDI-1
 iRead  = 0
 iWrite = 0
 iNote  = p4
 while iRead < giLength do
   if giNoteArr[iRead] != iNote then		
     giNoteArr [iWrite] = giNoteArr [iRead]						
     iWrite += 1											
   endif		
 iRead +=1
 od
 iRead2 = giCountMIDI
  while iRead2 < giLength do
  giNoteArr [iRead2] = giEmptyArr[iRead2]
  iRead2 += 1
 od	
 printarray giNoteArr, "%.0f", "Notes Off ="
endin




instr NoteOn_sq2
 iNote = p4
 iRead = 0 
 iWrite = 0
 giNoteIndx = 0
 while iWrite < giLength do								
	if giNoteArr[iWrite] == 0 then
		giNoteArr[giNoteIndx] = iNote
	else
		giNoteIndx +=1
	endif
 iWrite += 1
 od	
 printarray giNoteArr, "%.0f", "Notes On ="
endin
instr NoteOff_sq2
 iRead = 0
 iNote = p4
 while iRead < giLength do
	if giNoteArr[iRead] = iNote then	
	 giNoteArr [iRead] = 0				
	endif
 iRead +=1
 od
  	if giNoteIndx == giLength then
		giNoteArr[giLength-1] = iNote
	endif	
 printarray giNoteArr, "%.0f", "Notes Off ="
endin
instr NoteRmv
giCountMIDI = 1
giNoteArr [] = giEmptyArr
giNoteArr [giCountMIDI-1] = p4
printarray giNoteArr, "%.0f", "Notes On ="
endin

</CsInstruments>
<CsScore>
i "MIDI_Play" 0 999
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>604</x>
 <y>683</y>
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
