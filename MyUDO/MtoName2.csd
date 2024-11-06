<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



opcode MtoNameInt, S,i
iMidi xin 
SNoteArr [] fillarray "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "A#", "B"
iAraziArr[] fillarray 1, 3, 6, 8, 10
iNoteIndex = (iMidi) % 12
iNoteIndxInt = int(iNoteIndex)
iSCent = int((iMidi-int(iMidi))*100.5)
if iSCent  == 0 then
Sout sprintf "%s",SNoteArr[iNoteIndex]
elseif iSCent == 100 then
Sout sprintf "%s",SNoteArr[iNoteIndex+1]
elseif iSCent != 0 then
		if iSCent > 50 then
		Sout sprintf "%s-",SNoteArr[iNoteIndex+1]
		elseif iSCent <= 50 then
		Sout sprintf "%s+",SNoteArr[iNoteIndex]
			indx = 0			
			while indx < lenarray(iAraziArr) do
				if iNoteIndxInt = iAraziArr[indx] then
				Sout sprintf "%s-",SNoteArr[iNoteIndex+1]
				endif
			indx += 1
			od
		endif
endif
xout Sout
endop


instr 1

iNum = 77.56
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
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
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
