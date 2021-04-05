
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

giNoteArr  []   init 5
giLength        init lenarray:i(giNoteArr)
giEmptyArr []   init giLength
giCountMIDI     init 0 

instr MIDI_Play
 kstatus, kchan, kNote, kVel  midiin
 ktrig changed kchan, kNote, kVel
; printk2 kchan
 	if     kVel != 0 && ktrig == 1 && kchan == 1 then	;channel 1 to sequence 1
  	 schedulek "NoteOn_sq1",  0, 0, kNote
 	elseif kVel == 0 && ktrig == 1 && kchan == 1 then
  	 schedulek "NoteOff_sq1", 0, 0, kNote
 	elseif kVel != 0 && ktrig == 1 && kchan == 2 then ;channel 2 to sequence 2
  	 schedulek "NoteOn_sq2",  0, 0, kNote
 	elseif kVel == 0 && ktrig == 1 && kchan == 2 then
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
 print giCountMIDI
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
 print giCountMIDI
endin



instr NoteOn_sq2
 iNote = p4
 print iNote
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
 	if giNoteIndx == giLength then
		giNoteArr[giLength-1] = iNote
	endif	
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
 printarray giNoteArr, "%.0f", "Notes Off ="
endin


</CsInstruments>
<CsScore>
i "MIDI_Play" 0 999
</CsScore>
</CsoundSynthesizer>

