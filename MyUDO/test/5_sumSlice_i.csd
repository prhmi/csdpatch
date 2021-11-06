
/*-------------------------------------------------------------------------
kSum SumSlice kInArr, iStart,iEnd

Sum sliced values
		iStart:	start selection
		iEnd:		end of selection
		kSum:		sum of selected values
		
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


opcode SumSlice, k, k[]ii
 kInArr [], iStart,iEnd xin
 kOutArr[] init (lenarray:i(kInArr))
 kRead  = 0
 kWrite = 0
 while kRead < lenarray:i(kInArr) do
 	if kRead >= iStart && kRead <= iEnd then
		kOutArr[kWrite] = kInArr[kRead]
 		kWrite += 1
 	endif
 kRead += 1
 od
 ksum sumarray kOutArr
 xout ksum
endop

instr 1
kInArr [] fillarray 60,61,62,63,64,65,66,67
iStart = 3
iEnd   = 5
kSum SumSlice kInArr, iStart,iEnd
printks "Sum slice value = %d\\n", -1, kSum
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
