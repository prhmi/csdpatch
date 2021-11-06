
/*-------------------------------------------------------------------------
kSum SumSlice kInArr, kStart,kEnd

Sum sliced values
		kStart:	start selection
		kEnd:		end of selection
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

seed 0

opcode SumSlice, k, k[]kk
 kInArr [], kStart,kEnd xin
 kOutArr[] init (lenarray:i(kInArr))
 kRead  = 0
 kWrite = 0
 while kRead < lenarray:i(kInArr) do
 	if kRead >= kStart && kRead <= kEnd then
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
 if metro:k(1) == 1 then
	kStart = int(random:k(0,3))
	kEnd   = int(random:k(3,6))
	kSum SumSlice kInArr, kStart,kEnd
	printks "Sum slice value = %d\\n", -1, kSum
 endif
endin

</CsInstruments>
<CsScore>
i 1 0 999
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
