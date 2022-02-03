<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



opcode StrgArr,i[],S
Stype xin
iLen       strlen     Stype 
iTypeArr [] init iLen
indx = 0
while indx < iLen do
ichr       strchar    Stype, indx
iTypeArr [indx]  = ichr
indx += 1
od
 iLenW = 0
 iLenR = 0
while iLenR < iLen do
 if iTypeArr[iLenR] != 32 then
  iLenW += 1
 endif
iLenR += 1
od
iNumArr [] init iLenW
iRead = 0
iWrite = 0
while iRead < iLen do
 if iTypeArr[iRead] != 32 then
 iNumArr [iWrite] = iTypeArr[iRead]-48
 iWrite += 1
 endif
iRead += 1
od
xout iNumArr
endop

instr 1
Stype = "1 7 1"
iArr [] StrgArr Stype
printarray iArr, "%.f"
endin

</CsInstruments>
<CsScore>
i 1 0 .5
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
