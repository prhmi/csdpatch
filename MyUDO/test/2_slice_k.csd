

/*-------------------------------------------------------------------------
kOutArr[] sliceArr_k kInArr, kStart,kEnd

Take a Slice from Input Array (k-variable)
		kStart:	start selection
		kEnd:		end of selection
		
kOutArr[] - output array (same length as input Array)
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

opcode sliceArr_k, k[], k[]kk
 kInArr [], kStart,kEnd xin
 kOutArr[] init (lenarray:i(kInArr))
 kRead  = 0
 kWrite = 0
 kLength = kEnd-kStart
 while kRead < lenarray:i(kInArr) do
 	if kRead >= kStart && kRead <= kEnd then
		kOutArr[kWrite] = kInArr[kRead]
		kWrite += 1
	endif
 kRead += 1
 kOutArr[kLength] = 0
 kLength += 1
	 if kLength >= lenarray:i(kInArr) then
 		kLength = lenarray:i(kInArr)-1
 	endif
 od
 xout kOutArr
endop

instr 1
 kInArr [] fillarray 60,61,62,63,64,65,66,67
 if metro:k(1) == 1 then
	kStart = int(random:k(1,3))
	kEnd   = int(random:k(3,6))
	kOutArr[] sliceArr_k kInArr, kStart,kEnd
	printarray kOutArr,-1, "%.0f", "take a slice:"
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
