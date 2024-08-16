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

iLen strlen Snote
iLenNote = 0
indxN = 0
while indxN < iLen do
if strchar(Snote,indxN) == 32 then
iLenNote += 1
endif
indxN += 1
od
iArrOut [] init iLenNote
iChStrt = 0
iLenS = 0
iChIndx = 0
while iChStrt < iLen do
Schar     strsub    Snote, 0, 1
	iChCount = 0
	until strcmp(Schar," ") == 0 do
	Schar     strsub    Snote, iChIndx, iChIndx+1
	iChIndx += 1
	iChCount += 1
	od
ScharOut     strsub    Snote, iChStrt, iChStrt+(iChCount-1)
iChStrt += (iChCount)
	inum strtod ScharOut
	iArrOut [iLenS] = inum
iLenS += 1
od
xout iArrOut
endop


instr 1
  Sseq  = "1   34 64258 -2 77 342"
iArr [] StrToArr Sseq
printarray iArr, "%d"
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
