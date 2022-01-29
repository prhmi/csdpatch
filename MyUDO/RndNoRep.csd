/**********************************************************************
kRnd RndNoRep kMin,kMax,kTime

genarate unrepeated random numbers
Written by Parham Izadyar 

kMin - minimum value
kMax - maximum value
kTime - rate of random genaration
kRnd - output array 
***********************************************************************/

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

//k-rate version
opcode RndNoRep, k,kkk
kMin, kMax,kTime xin
kIndx init 0
kRndArr [] init 2 
 if metro(kTime) == 1 then
	start:
	kRnd = int(random:k(kMin,kMax))	
	kIndx = (kIndx + 1) %2
	kCheck = (kIndx == 0 ) ? 1: 0
	kRndArr [kIndx] = kRnd
	  if kRnd == kRndArr [kCheck] kgoto start
	  kgoto pass
   pass:
 endif
xout kRnd
endop


instr 1
kMin = 2
kMax = 10
kTime = 20
krnd RndNoRep kMin,kMax,kTime
printk2 krnd
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
