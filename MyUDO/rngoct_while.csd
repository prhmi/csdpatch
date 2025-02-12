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
 iMidi, iStat xin
 		iChng = (iMidi < iStat) ? 1 : 0
 		iMin = (iStat+(iChng*12))-12
 		while  iMidi < iMin || iMidi > iMin+12 do
 		iMidi += ((iChng*24)-12)
 		od 
xout iMidi
endop



opcode octMk, k, ki
 kMidi, iStat xin
 		kChng = (kMidi < iStat) ? 1 : 0
 		kMin = (iStat+(kChng*12))-12
 		while  kMidi < kMin || kMidi > kMin+12 do
 		kMidi += ((kChng*24)-12)
 		od 
xout kMidi
endop


opcode octFi, i, ii
 iFrq, iStat xin
 		iChng = (iFrq < iStat) ? 1 : 0
 		iMin = iStat*(iChng+1)/2
 		iRatio = (iChng*1.5)+0.5
 		while  iFrq < iMin || iFrq > iMin*2 do
 		iFrq *= iRatio
 		od 
xout iFrq
endop


opcode octFk, k, ki
 kFrq, iStat xin
 		kChng = (kFrq < iStat) ? 1 : 0
 		kMin = iStat*(kChng+1)/2
 		kRatio = (kChng*1.5)+0.5
 		while  kFrq < kMin || kFrq > kMin*2 do
 		kFrq *= kRatio
 		od 
xout kFrq
endop



opcode rngMi, i, iii 
 iMidi, iMin, iMax xin 
 		iChng = (iMidi < iMin) ? (iMax-iMin) : -(iMax-iMin)
 		until iMidi >= iMin && iMidi <= iMax do
 		iMidi += iChng
 		enduntil 
xout iMidi
endop


opcode rngMk, k, kii 
 kMidi, iMin, iMax xin 
 		kChng = (kMidi < iMin) ? (iMax-iMin) : -(iMax-iMin)
 		until kMidi >= iMin && kMidi <= iMax do
 		kMidi += kChng
 		enduntil 
xout kMidi
endop


opcode rngFi, i, iii 
 iFrq, iMin, iMax xin
 		iChng = (iFrq < iMin) ? (iMax/iMin) : 1/(iMax/iMin)
 		until iFrq >= iMin && iFrq <= iMax do
 		iFrq  *= iChng
 		enduntil 
xout iFrq
endop



opcode rngFk, k, kii 
 kFrq, iMin, iMax xin
 		kChng = (kFrq < iMin) ? (iMax/iMin) : 1/(iMax/iMin)
 		until kFrq >= iMin && kFrq <= iMax do
 		kFrq  *= kChng
 		enduntil 
xout kFrq
endop










instr 1
iMidi = 55
iMidiOut1 octMi iMidi, 60
iMidiOut2 rngMi iMidi, 60, 70
print iMidiOut1, iMidiOut2
iFrq = 850
iFrqOut1 octFi iFrq, 400
iFrqOut2 rngFi iFrq, 400, 450
print iFrqOut1, iFrqOut2


kMidi = 55
kMidiOut1 octMk kMidi, 60
kMidiOut2 rngMk kMidi, 60, 70
printks "%.2f %.2f\n", 1, kMidiOut1, kMidiOut2


kFrq = 850
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
