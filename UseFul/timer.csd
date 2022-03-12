<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

instr Time
kMin init 0
kTime = int(line:k(0,1,1))
kSec = kTime % 60
if changed(kSec) == 1 then
if kSec == 0 then
kMin += 1
endif
printks "%d:%d --- %d\n",-1, kMin,kSec,kTime
endif
endin
schedule "Time",0,-1

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
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
