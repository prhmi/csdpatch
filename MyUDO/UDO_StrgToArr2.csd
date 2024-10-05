<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

opcode StrToArr, i[],S
SIn xin
Snote     sprintf "%s ",SIn
iLenStr strlen SIn
iReadChar = 0
iCountChr = 0
while iReadChar < iLenStr do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	if strchar(Snote,iReadChar) == 32 then
	iCountChr += 1
	endif
	od	
iReadChar += 1
od


print iLenStr,iCountChr

iArrOut[] init iCountChr

iWrite = 0
iRead = 0
while iRead < iLenStr do
iCountChr = 0
iStart = iRead 
	until strchar(Snote,iRead) == 32 do
	iRead += 1
	iCountChr += 1
	od	
	Schar     strsub    Snote, iStart, iStart+iCountChr
	if strchar(Schar,0) != 0 then
	inum strtod Schar
	iArrOut[iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop


instr 1
 ;Sseq  = "1 34 64258 -2 77 342" 
  Sseq = " 1.05     1 546   23"
iArr[] StrToArr Sseq
printarray iArr, "%.2f"
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
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
