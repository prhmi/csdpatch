<CsoundSynthesizer>
<CsOptions>
-odac
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

opcode MatchMe, i,iiiii
iValue,iMinValue,iMaxValue,iMinOut,iMaxOut xin
if iValue >= iMaxValue then
iValue = iMaxValue
elseif  iValue <= iMinValue then
iValue = iMinValue
endif
iOut = ((iValue/(iMaxValue-iMinValue))*(iMaxOut-iMinOut))+iMinOut
xout iOut
endop

instr 1
iValue = 100

iMinValue = 0
iMaxValue = 127

iMinOut = 50
iMaxOut = 60

iPrint MatchMe iValue,iMinValue,iMaxValue,iMinOut,iMaxOut
print iPrint
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
