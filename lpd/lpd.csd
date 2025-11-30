<Cabbage> bounds(0, 0, 0, 0)
form size(500, 300), caption("Untitled") guiMode("queue")  colour(25, 25, 35) pluginId("crlp")
;midi
image bounds(10, 540, 491, 84) channel("cover6") colour(40, 40, 50, 255)
label    bounds(14, 54, 85, 18)    channel("labelm1")  text("Octaves") 
nslider bounds(162, 38, 45, 45) channel("prgoct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("Prgm")
nslider bounds(210, 38, 45, 45) channel("noteoct") range(-7, 7, 0, 1, 1) colour(37, 56, 75, 255) text("Note")
nslider bounds(112, 38, 45, 45) channel("ccoct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("CC")
nslider bounds(260, 38, 45, 45) channel("knoboct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("knob")
label    bounds(14, 118, 85, 18)    channel("labelm2")  text("prgmTime") 
label bounds(116, 114, 96, 28) channel("prgdata") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255)  text("12") fontSize(20)
checkbox bounds(220, 118, 25, 25) channel("holdmidi") colour:0(37, 56, 75, 255) colour:1(0, 154, 255, 255)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
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
if kNum >= 21 && kNum <= 52 then
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
iDur = 0.5
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
	cabbageSetValue "ccoct",kccOct
	cabbageSetValue "noteoct",kNoteOct
	cabbageSetValue "prgoct",kPrgOct
	cabbageSetValue "knoboct",kKnobOct
	else
	kNumOut, kTime setprgm kNum, kTime
	printks  "num=%d,	value=%.2f\\n", -1, kNumOut,kTime
	SprgData sprintfk "%d - %.2f", kNumOut, kTime
    cabbageSet 1, "prgdata", "text", SprgData
	endif
	if kNumOut == 12 then
	kHold = kTime != 0 ? 1 : 0
	printk2 int(kHold)
    cabbageSetValue "holdmidi", kHold
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
