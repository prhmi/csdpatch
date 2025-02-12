<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

opcode rateSliderk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = ((kValue-iMin)/iDiff)
if kOut >= 1 then
kOut = 1
endif
if kOut <= 0 then
kOut = 0
endif
xout kOut
endop 


instr 1
iMin = 200
iMax = 400
kValueIn = 100
kValue rateSliderk kValueIn,iMin,iMax
printk2 kValue
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
