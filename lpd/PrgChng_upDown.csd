<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


massign 0, 0

giPrgArr[] init 6
giIndx init 0

zakinit 1, 32


instr GetMidi
kstatus, kchan, kdata1, kdata2 midiin 
if kstatus == 192 then
iInstr nstrnum "upDown"
kInstr = iInstr+(kdata1/10)
	schedulek kInstr, 0, 0.05,kdata1
endif
endin

giUpDown1 init 0
giUpDown2 init 0
giUpDown3 init 0
giUpDown4 init 0
instr upDown
iActive active "upDown"
iPrgNum = p4
if iPrgNum == 1 then
giUpDown1 -= 1
print giUpDown1
elseif iPrgNum == 5 then
giUpDown1 += 1
print giUpDown1
endif
if iActive >= 2 && (iPrgNum == 1 || iPrgNum == 5 ) then
giUpDown1 = 0
print giUpDown1
endif


if iPrgNum == 2 then
giUpDown2 -= 1
print giUpDown2
elseif iPrgNum == 6 then
giUpDown2 += 1
print giUpDown2
endif
if iActive >= 2 && (iPrgNum == 2 || iPrgNum == 6 ) then
giUpDown2 = 0
print giUpDown2
endif

if iPrgNum == 3 then
giUpDown3 -= 1
print giUpDown3
elseif iPrgNum == 7 then
giUpDown3 += 1
print giUpDown3
endif
if iActive >= 2 && (iPrgNum == 3 || iPrgNum == 7 ) then
giUpDown3 = 0
print giUpDown3
endif

if iPrgNum == 4 then
giUpDown4 -= 1
print giUpDown4
elseif iPrgNum == 8 then
giUpDown4 += 1
print giUpDown4
endif
if iActive >= 2 && (iPrgNum == 4 || iPrgNum == 8 ) then
giUpDown4 = 0
print giUpDown4
endif

;print giUpDown1,giUpDown2,giUpDown3,giUpDown4
endin

</CsInstruments>
<CsScore>
i 1 0 9999 
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
