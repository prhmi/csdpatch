<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1




opcode octMi, i, ii
 iMidiIn, iStatic xin
 iMidi = iMidiIn
 iAdd = iMidiIn < iStatic ? 12 : -12
 loop:
 iMidi += iAdd
 		if  iMidiIn < iStatic && iMidi < iStatic goto loop
 		if  iMidiIn > iStatic && iMidi > iStatic goto loop
xout iMidi
endop



opcode octMk, k, ki
 kMidiIn, iStatic xin
 kMidi = kMidiIn
 kAdd = kMidiIn < iStatic ? 12 : -12
 loop:
 kMidi += kAdd
 		if  kMidiIn < iStatic && kMidi < iStatic goto loop
 		if  kMidiIn > iStatic && kMidi > iStatic goto loop
xout kMidi
endop


opcode octFi, i, ii
 iFrqIn, iStatic xin
 iFrq = iFrqIn
 iRatio = iFrqIn < iStatic ? 2 : 0.5
 loop:
 iFrq *= iRatio
 		if  iFrqIn < iStatic && iFrq < iStatic goto loop
 		if  iFrqIn > iStatic && iFrq > iStatic goto loop
xout iFrq
endop


opcode octFk, k, ki
 kFrqIn, iStatic xin
 kFrq = kFrqIn
 kRatio = kFrqIn < iStatic ? 2 : 0.5
 loop:
 kFrq *= kRatio
 		if  kFrqIn < iStatic && kFrq < iStatic goto loop
 		if  kFrqIn > iStatic && kFrq > iStatic goto loop
xout kFrq
endop



opcode rngMi, i, iii 
 iMidiIn, iMin, iMax xin 
 iMidi = iMidiIn
 		iAdd = (iMidiIn < iMin) ? (iMax-iMin) : -(iMax-iMin)
 loop:
 iMidi += iAdd
  		if  iMidiIn < iMin && iMidi < iMin goto loop
 		if  iMidiIn > iMax && iMidi > iMax goto loop
xout iMidi
endop


opcode rngMk, k, kii 
 kMidiIn, iMin, iMax xin 
 kMidi = kMidiIn
 		kAdd = (kMidiIn < iMin) ? (iMax-iMin) : -(iMax-iMin)
 loop:
 kMidi += kAdd
  		if  kMidiIn < iMin && kMidi < iMin goto loop
 		if  kMidiIn > iMax && kMidi > iMax goto loop
xout kMidi
endop


opcode rngFi, i, iii 
 iFrqIn, iMin, iMax xin
 iFrq = iFrqIn
 		iRatio = (iFrq < iMin) ? (iMax/iMin) : 1/(iMax/iMin)
 loop:
 iFrq  *= iRatio
  		if  iFrqIn < iMin && iFrq < iMin goto loop
 		if  iFrqIn > iMax && iFrq > iMax goto loop
xout iFrq
endop



opcode rngFk, k, kii 
 kFrqIn, iMin, iMax xin
 kFrq = kFrqIn
 		kRatio = (kFrq < iMin) ? (iMax/iMin) : 1/(iMax/iMin)
 loop:
 kFrq  *= kRatio
  		if  kFrqIn < iMin && kFrq < iMin goto loop
 		if  kFrqIn > iMax && kFrq > iMax goto loop
xout kFrq
endop





instr 1
iMidi = 77
iMidiOut1 octMi iMidi, 60
iMidiOut2 rngMi iMidi, 60, 70
print iMidiOut1, iMidiOut2
iFrq = 500
iFrqOut1 octFi iFrq, 400
iFrqOut2 rngFi iFrq, 400, 450
print iFrqOut1, iFrqOut2


kMidi = 77
kMidiOut1 octMk kMidi, 60
kMidiOut2 rngMk kMidi, 60, 70
printks "%.2f %.2f\n", 1, kMidiOut1, kMidiOut2


kFrq = 500
kFrqOut1 octFk kFrq, 400
kFrqOut2 rngFk kFrq, 400, 450
printks "%.2f %.2f\n", 1, kFrqOut1, kFrqOut2

endin

</CsInstruments>
<CsScore>
i1 0 1
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
