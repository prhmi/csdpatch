


/*-------------------------------------------------------------------------
kOutArr[] addDffArr kInArr1, kInArr2

find the value from second Array that is different from all first Array values
and add it to the first Array

kOutArr[] - output array 
-------------------------------------------------------------------------*/


<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


opcode addDffArr, k[],k[]k[]
 kInArr1[], kInArr2[] xin
 kOutArr[] init (lenarray:i(kInArr1)+1)
 kRead = 0
	while kRead <lenarray(kInArr1) do
 		kOutArr [kRead] = kInArr1[kRead]
 			if kInArr1[kRead] != kInArr2[kRead] then
 				kOutArr[lenarray:i(kOutArr)-1] = kInArr2[kRead]
 			endif
 		kRead += 1
 	od
 xout kOutArr
endop

instr 1
kInArr1 [] fillarray 60,61,62,63,64,65
kInArr2 [] fillarray 60,61,42,63,64,65
kOutArr[] addDffArr kInArr1,kInArr2
printarray kOutArr,-1, "%.0f", "add value:"
turnoff
endin

</CsInstruments>
<CsScore>
i 1 0 1
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
