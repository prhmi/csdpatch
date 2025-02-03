<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


massign 0, 0

gkCCArr[] init 6
gkCCIndx init 0
opcode setcc, kk, kk
kNum, kData xin
kCCnum = kNum
if kData == 0 goto skip
kIndx = gkCCIndx
kTurnOff = 0
	kndx = 0
	while kndx < lenarray(gkCCArr) do
		if gkCCArr[kndx] == kCCnum then
		gkCCArr[kndx] = 0
		kCConOff = 0
		gkCCIndx = kndx
		kTurnOff = 1
		endif 
	kndx += 1
	od
if kTurnOff == 0 then
		kndx = 0 
		kSkip = 1
		while kndx < lenarray(gkCCArr) do
			if gkCCArr[kndx] == 0 then
			kSkip = 0
			endif
		kndx += 1
		od
	if kSkip == 0 then
		while gkCCArr[kIndx] != 0 do
		kIndx = (kIndx+1) % lenarray(gkCCArr)
		od
	gkCCArr[kIndx] = kCCnum
	kCConOff = 1
	gkCCIndx = (gkCCIndx+1) % lenarray(gkCCArr)
	endif
endif
skip:
if kNum >= 81 && kNum <= 88 then
kCConOff = kData
	if kData != 0 then
	kCConOff = 1
	endif
endif
	xout kCCnum, kCConOff
endop
gkPrgRepArr[] init 2
gkPrgmIndx init 0
opcode setprgm, kk, kk
kPrgNum,kTime xin
iDur = 1.5
if kTime >= iDur then
kTime = 0
gkPrgmIndx = 0
gkPrgRepArr[0] = 0
gkPrgRepArr[1] = 0
endif
gkPrgRepArr[gkPrgmIndx] = kPrgNum
if gkPrgmIndx == 0 then
kTime = 0
endif
kPrgNumOut = kPrgNum
if gkPrgmIndx == 0 then
gkPrgRepArr[1] = 0
endif
if gkPrgmIndx == 1 && kTime < iDur then
	if gkPrgRepArr[0] != gkPrgRepArr[1] then
	kPrgNumOut = (gkPrgRepArr[0]*100)+gkPrgRepArr[1]
	endif
endif
gkPrgmIndx = (gkPrgmIndx+1) % 2
xout kPrgNumOut, kTime
skip:
endop

gkUpDownPrg1 init 0
gkUpDownPrg2 init 0
gkUpDownPrg3 init 0
gkUpDownPrg4 init 0
gkOctArr[] init 2
gkOctIndx init -1
opcode setoct, kkkk, kk
kPrgNum,kTime xin
iDurReset = 0.1
if changed(kPrgNum) == 1 then
gkOctIndx = (gkOctIndx+1) % 2
endif
gkOctArr[gkOctIndx] = kTime
kMidiTime abs gkOctArr[1]-gkOctArr[0]
if kPrgNum == 1 then
gkUpDownPrg1 -= 1
	if gkUpDownPrg1 <= 1 then
	gkUpDownPrg1 = 1
	endif
elseif kPrgNum == 5 then
gkUpDownPrg1 += 1
	if gkUpDownPrg1 >= 7 then
	gkUpDownPrg1 = 7
	endif
endif
if (kPrgNum == 1 || kPrgNum == 5) && kMidiTime < iDurReset then
gkUpDownPrg1 = 0
endif
if kPrgNum == 2 then
gkUpDownPrg2 -= 1
	if gkUpDownPrg2 <= 1 then
	gkUpDownPrg2 = 1
	endif
elseif kPrgNum == 6 then
gkUpDownPrg2 += 1
	if gkUpDownPrg2 >= 3 then
	gkUpDownPrg2 = 3
	endif
endif
if (kPrgNum == 2 || kPrgNum == 6) && kMidiTime < iDurReset then
gkUpDownPrg2 = 0
endif
if kPrgNum == 3 then
gkUpDownPrg3 -= 1
	if gkUpDownPrg3 <= -7 then
	gkUpDownPrg3 = -7
	endif
elseif kPrgNum == 7 then
gkUpDownPrg3 += 1
	if gkUpDownPrg3 >= 7 then
	gkUpDownPrg3 = 7
	endif
endif
if (kPrgNum == 3 || kPrgNum == 7) && kMidiTime < iDurReset then
gkUpDownPrg3 = 0
endif
if kPrgNum == 4 then
gkUpDownPrg4 -= 1
	if gkUpDownPrg4 <= 1 then
	gkUpDownPrg4 = 1
	endif
elseif kPrgNum == 8 then
gkUpDownPrg4 += 1
	if gkUpDownPrg4 >= 7 then
	gkUpDownPrg4 = 7
	endif
endif
if (kPrgNum == 4 || kPrgNum == 8) && kMidiTime < iDurReset then
gkUpDownPrg4 = 0
endif
xout gkUpDownPrg1, gkUpDownPrg2, gkUpDownPrg3, gkUpDownPrg4
endop

instr GetMidi
kTime init 0
if metro(100) == 1 then
kTime += 0.01
endif
kType, kChn, kNum, kData midiin
kDataOut init -1
if kType == 176 then
kNumOut, kDataOut setcc kNum,kData
	if changed(kNumOut,kDataOut) == 1 then
	printks  "num=%d, value=%d\\n", -1, kNumOut,kDataOut
	endif
elseif kType == 192 then
	if kNum <= 8 then
	kccOct, kPrgOct, kNoteOct, kKnobOct setoct kNum,kTime
	printks  "cc=%d,	prg=%d,	note=%d,	knob=%d\\n", -1,\
	 kccOct, kPrgOct, kNoteOct, kKnobOct
	else
	kNumOut, kTime setprgm kNum, kTime
	printks  "num=%d,	value=%.2f\\n", -1, kNumOut,kTime
	endif
 elseif kType == 160 then
 kPrs = kData
 printks  "num=%d,	value=%.2f\\n", -1, kNum,kPrs
endif
endin


</CsInstruments>
<CsScore>
i 1 0 9999 
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
