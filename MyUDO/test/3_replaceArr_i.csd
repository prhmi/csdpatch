
/*-------------------------------------------------------------------------
kOutArr[] RplArr kInArr1, kInArr2, iStart, iEnd, iRplInx 

Replace a selected slice from first Array to the second Array
		iStart:	start selection
		iEnd:		end of selection
		iRplInx:	number of index to start replacing
		
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


opcode RplArr, k[], k[]k[]iii
 kInArr1[],kInArr2[], iStart,iEnd,iRplInx xin
 kOutArr[] init (lenarray:i(kInArr1))
 kRead  = 0
 kWrite = 0
	while kRead < lenarray:i(kInArr1) do
		if kRead >= iStart && kRead <= iEnd then
			kInArr2[iRplInx] = kInArr1[kRead]
			iRplInx +=1
				if iRplInx > (iEnd-iStart)+iRplInx then
					iRplInx = (iEnd-iStart)+iRplInx
				endif
		endif
		kRead += 1
	od
 xout kInArr2
endop

instr 1
kInArr1 [] fillarray 60,61,62,63,64,65,66,67
kInArr2 [] fillarray 40,41,42,43,44,45,46,47
iStart    = 3
iEnd      = 5
iRplInx   = 2
kRplLengh = ((iEnd-iStart))+iRplInx
kOutArr[] RplArr kInArr1,kInArr2, iStart,iEnd,iRplInx
printarray kOutArr,-1, "%.0f", "Replaced Slice:"
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
