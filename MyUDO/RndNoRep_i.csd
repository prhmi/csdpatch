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
giRndArr[] init 2 
gindx init 0

//i-rate version
opcode RndNoRep, i,ii
iMin, iMax xin
	start:
	iRnd = int(random:i(iMin,iMax))	
	giRndArr[gindx] = iRnd
	iCheck = (gindx == 0 ) ? 1: 0
	 if iRnd == giRndArr[iCheck] igoto start
	  igoto pass
   pass:
gindx = (gindx+1) % 2
xout iRnd
endop

instr 1
if metro(3) == 1 then
schedulek 2,0,0.1
endif
endin

instr 2
iMin = 2
iMax = 10
iRndNoRep RndNoRep iMin,iMax
print  iRndNoRep
endin

</CsInstruments>
<CsScore>
i1 0 999
</CsScore>
</CsoundSynthesizer>





















<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>595</x>
 <y>493</y>
 <width>400</width>
 <height>300</height>
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
