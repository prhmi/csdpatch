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

seed 26

opcode RndNoRep, k,kk
kMin, kMax xin
kChkArr[] init 2
kIndx init 0
kCheck init 1
	kRnd = int(random:k(kMin,kMax))
	kChkArr[kIndx] = kRnd
	kIndx = (kIndx + 1) %2
	kCheck = (kCheck + 1) %2
	  until kChkArr[kIndx] != kChkArr[kCheck] do
	  kRnd = int(random:k(kMin,kMax))
	  kChkArr[kIndx] = kRnd
	  kIndx = (kIndx + 1) %2
	  kCheck = (kCheck + 1) %2
	  od
;printks "t = %d, c = %d\\n",-1, kIndx,kCheck
;printarray kChkArr,-1
xout kRnd
endop


instr 1
kTime = 20
if metro(kTime) == 1 then
kRnd RndNoRep 2,5
printk -1, kRnd
endif

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
