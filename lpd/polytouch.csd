<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


instr GetMidi
kstatus, kchan, kdata1, kdata2 midiin
if kstatus == 160 then
printk2 kdata2 ;pressure
;printk2 kdata1 ;number
endif
endin

</CsInstruments>
<CsScore>
i1 0 999
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
