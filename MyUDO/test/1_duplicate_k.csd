

/*-------------------------------------------------------------------------
kOutArr[] DupArr kInArr1[], kDupInx,iHT

Duplicate a value for (iHT)Times
	kDupInx: number of index for duplicated value
	iHT:		How many Times will be duplicated
	
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
opcode DupArr, k[], k[]ki
 kInArr [], kDupInx,iHT xin
 kOutArr[] init (lenarray:i(kInArr)+iHT)
 kDupNote  = kInArr[kDupInx]
 kStart    = 0
 kDupCount = kDupInx
 kEnd      = kDupInx
 kRead     = 0
while kRead < lenarray(kInArr) do
	kOutArr [kStart] = kInArr[kStart]
	kOutArr[kDupCount] = kDupNote
	kOutArr[kEnd+iHT] = kInArr[kEnd]
	kStart += 1
		if kStart >=kDupInx then
			kStart = kDupInx
		endif
	kDupCount += 1
		if kDupCount >= (kDupInx+iHT) then
			kDupCount = kDupInx+iHT
		endif
	kEnd += 1
		if kEnd >= lenarray(kInArr) then
			kEnd =lenarray(kInArr)-1
		endif
	kRead += 1
od
 xout kOutArr
endop


instr 1
 kArrIn  [] fillarray 60,61,62,63,68,69
 if metro:k(1) == 1 then
	kDupInx = int(random:k(0,4)) 
	iHT     = 2
	kArrOut [] DupArr kArrIn, kDupInx,iHT
	printarray kArrOut,-1, "%.0f", "Dublicated value:"
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
