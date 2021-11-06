
/*-------------------------------------------------------------------------
kOutArr[] RplArr kInArr1, kInArr2, kStart, kEnd, kRplInx 

Replace a selected slice from first Array to the second Array
		kStart:	start selection
		kEnd:		end of selection
		kRplInx:	number of index to start replacing
		
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
opcode RplArr, k[], k[]k[]kkk
 kInArr1[],kInArr2[], kStart,kEnd,kRplInx xin
 kOutArr[] init (lenarray:i(kInArr1))
 kRead  = 0
 kWrite = 0
	while kRead < lenarray:i(kInArr1) do
		if kRead >= kStart && kRead <= kEnd then
			kInArr2[kRplInx] = kInArr1[kRead]
			kRplInx +=1
				if kRplInx > (kEnd-kStart)+kRplInx then
					kRplInx = (kEnd-kStart)+kRplInx
				endif
				if kRplInx > lenarray:i(kInArr1) then
					kRplInx = lenarray:i(kInArr1)
				endif
		endif
		kRead += 1
	od
 xout kInArr2
endop

instr 1
kInArr1 [] fillarray 60,61,62,63,64,65,66,67
kInArr2 [] fillarray 40,41,42,43,44,45,46,47
 if metro:k(1) == 1 then
	kStart    = int(random:k(0,3))
	kEnd      = int(random:k(5,7))
	kRplInx   = int(random:k(0,3))
	kRplLengh = ((kEnd-kStart))+kRplInx
	kOutArr[] RplArr kInArr1,kInArr2, kStart,kEnd,kRplInx
	printarray kOutArr,-1, "%.0f", "Replaced Slice:"
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
