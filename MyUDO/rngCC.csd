<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


opcode ztoi, i, iii
iValue, iMin, iMax xin
iRange = iMax-iMin
iOut = abs((iValue-iMin)/iRange) % 1.00001
xout iOut
endop 


opcode ztok, k, kii
kValue, iMin, iMax xin
iRange = iMax-iMin
kOut = abs((kValue-iMin)/iRange) % 1.00001
xout kOut
endop 


opcode rngCCi, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut = (iValue*iDiff)+iMin
xout iOut
endop 

opcode rngCCk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = (kValue*iDiff)+iMin
xout kOut
endop 






instr 1
;;slider one range is 0 to 1
;;slider two range is iMin to iMax
iCC = 0.2
iMin = 4
iMax = 8
iOut rngCCi iCC, iMin, iMax
print iOut
endin


instr 2
;;slider one range is 0 to 1
;;slider two range is iMin to iMax
kCC = 1
iMin = 0.5
iMax = 1
kOut rngCCk kCC, iMin, iMax
printk2 kOut
endin


instr 3
;;slider one range is iMin to iMax
;;slider two range is 0 to 1
iCC =  42
iMin = 20
iMax = 40
iOut ztoi iCC, iMin, iMax
print iOut
endin


instr 4
;;slider one range is iMin to iMax
;;slider two range is 0 to 1
kCC = 10
iMin = 2
iMax = 10
kOut ztok kCC, iMin, iMax
printk2 kOut
endin

</CsInstruments>
<CsScore>
i3 0 1
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
