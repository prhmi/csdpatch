<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

seed 0

opcode RndR, k,kkk
kMin, kMax,kSpeed xin
kindx init 0
kRndArr [] init 2 

if metro(kSpeed) == 1 then
	start:
	kRnd = int(random:k(kMin,kMax))
	kindx = (kindx + 1) %2
	kRead = (kindx == 0 ) ? 1: 0
	kRndArr [kindx] = kRnd	
		if kRnd == kRndArr [kRead] kgoto start
		kgoto pass
	pass:
endif
xout kRnd
endop


instr 1
kMin = 2
kMax = 10
kSpeed = 2
krnd RndR kMin,kMax,kSpeed
printk2 krnd
endin

</CsInstruments>
<CsScore>
i1 0 10
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
