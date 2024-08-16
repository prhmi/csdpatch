<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

seed 63
opcode MirrorMe,i,iii
iValue,iMin,iMax xin
iMiddle = iMin+((iMax-iMin)/2)
if iValue == iMiddle then
iOut = iValue
elseif iValue > iMiddle then
iOut = iMiddle - (iValue-iMiddle)
elseif iValue < iMiddle then
iOut = iMiddle + (iMiddle-iValue)
endif
xout iOut
endop

instr 1
puts "same as the box:", 1
iMinRng = 20
iMaxRng = 30
iValue = 20
while iValue <= iMaxRng do
iprint MirrorMe iValue, 20, 30
print iprint
iValue += 1
od
endin


instr 2
puts "less than the box:", 1
iMinRng = 20
iMaxRng = 30
iValue = iMinRng-5
while iValue <= iMinRng do
iprint MirrorMe iValue, 20, 30
print iprint
iValue += 1
od
endin


instr 3
puts "more than the box:", 1
iMinRng = 20
iMaxRng = 30
iValue = iMaxRng
while iValue <= iMaxRng+5 do
iprint MirrorMe iValue, 20, 30
print iprint
iValue += 1
od
endin

</CsInstruments>
<CsScore>
i1 0 1
i2 + 1
i3 + 1
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
