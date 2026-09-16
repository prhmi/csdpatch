<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1



opcode strToArr, i[],S
SIn xin
Snote     sprintf "%s ",SIn
iLen strlen SIn
iReadChar = 0
iLenCount = 0
while iReadChar < iLen do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	od	
	iReadChar2 = iReadChar+1
			while strchar(Snote,iReadChar2) == 32 do
			iReadChar2 += 1
			iReadChar += 1
			od
iReadChar += 1
iLenCount += 1
od
iArrOut [] init iLenCount

iWrite = 0
iRead = 0
while iRead < iLen do
iCountChr = 0
iStart = iRead 
	until strchar(Snote,iRead) == 32 do
	iRead += 1
	iCountChr += 1
	od	
		Schar     strsub    Snote, iStart, iStart+iCountChr
	if strchar(Schar,0) != 0 then
	inum strtod Schar
	;print inum
	iArrOut [iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop


opcode ArrToStrg, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf "%f ",iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop





opcode ArrToStrgP, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf "%d ",iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop

opcode iTokArr, k[],i[]
  iArrIn[] xin
  iLen lenarray iArrIn
  kArrOut[] init iLen
  kIndx = 0
	while kIndx < lenarray(kArrOut) do
	kArrOut[kIndx] = iArrIn[kIndx]
	kIndx += 1
   od
  xout kArrOut
endop


opcode MtoName, S,i
iMidi xin 
SNoteArr [] fillarray "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "A#", "B"
iAraziArr[] fillarray 1, 3, 6, 8, 10
iNoteIndex = (iMidi) % 12
iNoteIndxInt = int(iNoteIndex)
iOctave = int(iMidi/12)-1
iSCent = int((iMidi-int(iMidi))*100.5)
if iSCent  == 0 then
Sout sprintf "%d%s",iOctave,SNoteArr[iNoteIndex]
elseif iSCent == 100 then
Sout sprintf "%d%s",iOctave,SNoteArr[iNoteIndex+1]
elseif iSCent != 0 then
		if iSCent > 50 then
		Sout sprintf "%d%s-%d",iOctave,SNoteArr[iNoteIndex+1],(100-iSCent)
		elseif iSCent < 50 then
		Sout sprintf "%d%s+%d",iOctave,SNoteArr[iNoteIndex],iSCent
		elseif iSCent == 50 then
		Sout sprintf "%d%s+",iOctave,SNoteArr[iNoteIndex]
			indx = 0			
			while indx < lenarray(iAraziArr) do
				if iNoteIndxInt = iAraziArr[indx] then
				Sout sprintf "%d%s-",iOctave,SNoteArr[iNoteIndex+1]
				endif
			indx += 1
			od
		endif
endif
xout Sout
endop

opcode Dastgah, i[],i[]Si
  iInArr[],SbaseNote,iPitch xin
  iMidi ntom SbaseNote
  iFrq mtof iMidi
  iRatio = iPitch/440
  iBaseFrq = iFrq*iRatio
  iBaseMidi ftom iBaseFrq
  iLen lenarray iInArr
  iOutArr[] init iLen
  iNote = iBaseMidi-1.5
  indx = 0
	while indx < iLen do
	iNote = iNote+(iInArr[indx])
	iOutArr[indx] = iNote
	iFrq1 mtof iNote
	iFrq2 = iFrq1*(440/432)
	iMidi ftom iFrq2
	Sname MtoName iMidi
	printf_i  "Note = %s iMidi = %.2f\n", 1, Sname,iNote
	indx += 1
	od
  xout iOutArr
endop

opcode findMax, i, i[]
 iArrIn[] xin
 iLen lenarray iArrIn
 iArrInSort[] sorta iArrIn
 iMaxValue = iArrInSort[iLen-1]
 
 indx = 0
 while indx < iLen do
 if iArrIn[indx] == iMaxValue then
 iMaxIndx = indx
 endif
 indx += 1
 od
 xout iMaxIndx
endop


giRndArr[] init 2 
gindxRnd init 0
opcode RndNoRep, i,ii
iMin, iMax xin
	start:
	iRnd = int(random:i(iMin,iMax))	
	giRndArr[gindxRnd] = iRnd
	iCheck = (gindxRnd == 0 ) ? 1: 0
	 if iRnd == giRndArr[iCheck] igoto start
	  igoto pass
   pass:
gindxRnd = (gindxRnd+1) % 2
xout iRnd
endop

opcode genNote, i[], i[]i[]ii
 iArrInNote[],iArrInSeq[],iShahed,iIst xin
 print iShahed,iIst
 iLenRead lenarray iArrInNote
 iLenWrite lenarray iArrInSeq
 iNoteArr[] init iLenWrite
 iMaxIndx findMax iArrInSeq
 		indx = 0
 		while indx < lenarray(iNoteArr) do
 		iOctave =  0;int(random:i(0, 100) > 40 ? 0 : 12)
 		iNoteIndx RndNoRep 0, iLenRead
 		iNoteRnd = iArrInNote[iNoteIndx]
 		iNote = random:i(0, 100) > 100 ? iShahed : iNoteRnd
 		iNoteArr[indx] = iNote+iOctave
 		indx += 1
 		od
 		iNoteArr[iMaxIndx] = iIst+iOctave
; 		printarray iNoteArr, "%d"
 xout iNoteArr
endop


opcode genSeq, k[], i[]i
 iArrIn[],iLen xin
 kArrOut[] init iLen
 kIndx = 0
 while kIndx < iLen do
 kRndIndx = int(random:k(0,lenarray(iArrIn)-1))
 kArrOut[kIndx] = iArrIn[kRndIndx]
 kIndx += 1
 od
 iSortArrIn[] sorta iArrIn
 kMaxValue = iSortArrIn[lenarray(iSortArrIn)-1]
 kRndIndx2 = int(random:k(0,lenarray(kArrOut)))
 kArrOut[kRndIndx2] = kMaxValue
 xout kArrOut
endop


opcode orgArr, k[], k[]k[]i
 kNoteArrIn[],kSeqArrIn[],iIstMidi xin
 kArrOut[] init lenarray(kNoteArrIn)
 kArrOut = kNoteArrIn
 kLen lenarray kNoteArrIn
 kSeqSortArr[] sorta kSeqArrIn
 kMaxValue = kSeqSortArr[lenarray(kSeqSortArr)-1]
 kndx = 0
 while kndx < kLen do
 	if kSeqArrIn[kndx] == kMaxValue then
 	kMaxIndx = kndx
 	endif
 kndx += 1
 od
 kArrOut[kMaxIndx] = iIstMidi
 xout kArrOut
endop

seed 0
gkTime init 0
gkMoses init 0
gkMin init 0
giCountIns2 = 0

instr 1
iPicth = 432
SbaseNote ="1E"
i3gahArr[] fillarray 0,1.5,1.5,2,1.5,1.5,2
iDastgah[] Dastgah i3gahArr,SbaseNote,iPicth
iShahedMidi = iDastgah[1]
iIstMidi = iDastgah[0]
SDastgahArr ArrToStrg iDastgah
iSeqArr[] fillarray 1, 1, 2, 1, 2, 4
SseqArr ArrToStrg iSeqArr
iGenNotArr[] genNote iDastgah,iSeqArr,iShahedMidi,iIstMidi
SNotesArr ArrToStrg iGenNotArr

fprints "shahed1.txt","%.2f %.3f\n",mtof(iShahedMidi),0
fprints "shahed1.txt","%.2f %.3f\n",mtof(iShahedMidi),85
fprints "ist1.txt","%.2f %.3f\n",mtof(iIstMidi),0
fprints "ist1.txt","%.2f %.3f\n",mtof(iIstMidi),85

fprints "shahed2.txt","%.2f %.3f\n",mtof(iShahedMidi+24),0
fprints "shahed2.txt","%.2f %.3f\n",mtof(iShahedMidi+24),85
fprints "ist2.txt","%.2f %.3f\n",mtof(iIstMidi+24),0
fprints "ist2.txt","%.2f %.3f\n",mtof(iIstMidi+24),85

iDur = p5
iMode = p6
schedule p4,0,iDur,SNotesArr,SseqArr,iShahedMidi,iIstMidi,iMode
endin

instr 2
giCountIns2 += 1
SWriteFile sprintf "SeqChng%d.txt",giCountIns2
SNoteArr = p4
iNoteArrIn[] strToArr SNoteArr
if metro(0) == 1 then
kNoteArrIn[] = iNoteArrIn
endif
iNoteLen lenarray iNoteArrIn
iShahedMidi = p6
iIstMidi = p7
SseqArr = p5
iMode = p8
kSeqArr[] fillarray 1, 1, 2, 1, 2, 4
iSeqExamArr[] fillarray 1,1.5,2,2.5, 3, 3.5, 4
if metro(0) == 1 then
kSeqArr[] genSeq iSeqExamArr,6
kNoteArr[] orgArr kNoteArrIn,kSeqArr,iIstMidi
endif
printarray kSeqArr, 1, "%.2f"
printarray kNoteArr,1, "%.2f"
kTime init 0
kSeqIndx init 0
kNoteIndx init 0
kSeqCount init 0
iCountseq = int(random:i(1, 3))
iTempo = (180/60)
if metro(1/kTime) == 1 then
kTime = kSeqArr[kSeqIndx]/iTempo
kDur random kTime*0.7,kTime
kNote = kNoteArr[kNoteIndx]
schedulek 10, 0, kDur,kNote
kSeqIndx = (kSeqIndx+1) % lenarray(kSeqArr)
	if kSeqIndx == 0 then
	kSeqCount += 1
	endif
	if kSeqIndx == 0 && kSeqCount > 1 then
	kWrite = 0
	fprintks SWriteFile, "%s \n", " "
	while kWrite < lenarray(kSeqArr) do
	fprintks SWriteFile, "%.2f  ",kSeqArr[kWrite]
	kWrite += 1
	od
	kSeqIndxRnd = int(random:k(0,lenarray(kSeqArr)))
	kRndSeq random gkMin, 1
	kSeqArr[kSeqIndxRnd] = kSeqArr[kSeqIndxRnd]+kRndSeq
		if kSeqArr[kSeqIndxRnd] < 0.5 then
		kSeqArr[kSeqIndxRnd] = 0.5
		endif
	kNoteArr[] orgArr kNoteArrIn,kSeqArr,iIstMidi
	endif
kNoteIndx = (kNoteIndx+1) % lenarray(kNoteArr)
endif

endin

instr 3
SNoteArr = p4
iNoteArr[] strToArr SNoteArr
iNoteLen lenarray iNoteArr
iShahedMidi = p6
iIstMidi = p7
SseqArr = p5
iSeqArr[] strToArr SseqArr

iFrq = iShahedMidi
kTime init 0
kNoteIndx init 0
kCount init 0
	if metro(kTime) == 1 then
	iRndArr[] fillarray 4, 8, 6, 12
	kRndIndx = int(random:k(0,4))
	kTime = iRndArr[kRndIndx]
	kNote = iNoteArr[kNoteIndx]
	kNoteIndx = (kNoteIndx+1) % lenarray(iNoteArr)
	kDurRndMin random 0.02, 0.05
	kDurRndMax random 0.1, 0.5
	kDur = random:k(0,100) > 20 ? kDurRndMin : kDurRndMax
		if kDur > 0.1 then
		kNote = iIstMidi
		kCount += 1
			if kCount >= 10 then
			turnoff
			endif
		endif
	schedulek 11,0,kDur,kNote
	endif
endin

;;sound
instr 10
iTimeLine = i(gkTime)
idB random -20, -15
iAmp ampdb idB
iFrqIn mtof p4
iOctave = (random:i(0,100) > 10 ? 1 : 2)
iFrq = iFrqIn*iOctave
iAtt random 0.005, 0.008
aEnv transeg 0, p3-iAtt, 4, iAmp,iAtt , -6, 0
aSound poscil aEnv, iFrq
outall aSound
iChn = (int(random:i(0,100)) < 50 ) ? 0 : 1
if iChn == 0 then
chnmix aSound, "shortL"
elseif iChn == 1 then
chnmix aSound, "shortR"
endif
fprints "ShortNotes.txt","%.2f %.2f\n",iFrq,iTimeLine
endin

instr 11
iMoses = i(gkMoses)
iFrqIn mtof p4
iTimeLine = i(gkTime) 
giCount += 1
idB random -30, -22
iAmp ampdb idB
iOctave = random:i(0,100) > 10 ? 4 : 8
iFrq = iFrqIn*iOctave
fprints "click.txt","%.2f %.2f\n",iFrq,iTimeLine
iAtt  random 0.003, 0.005
;print iAtt
aEnv transeg 0, p3-iAtt, 4, iAmp, iAtt, -4, 0
aSound poscil aEnv, iFrq
outall aSound
iChn = (int(random:i(0,100)) > 50 ) ? 0 : 1
if iChn == 0 then
chnmix aSound, "clkL"
elseif iChn == 1 then
chnmix aSound, "clkR"
endif
endin



instr 99
kTime timeinsts
printk2 int(kTime)
gkTime = kTime
gkMoses linseg 100, p3, 0
gkMin linseg -2,15,-2, p3-15, -1
aShortL chnget "shortL"
aShortR chnget "shortR"
fout "recordShort.wav", 8, aShortL,aShortR
aClkL chnget "clkL"
aClkR chnget "clkR"
fout "recordClick.wav", 8, aClkL,aClkR
aSumL sum aShortL,aClkL
aSumR sum aShortR,aClkR
fout "recordSum.wav", 8, aSumL,aSumR
chnclear "shortL"
chnclear "shortR"
chnclear "clkL"
chnclear "clkR"
endin
</CsInstruments>
<CsScore>
;				ins	dur	mod
i1 0   1	2		40
i1 42  1	2		40
i1 0   1	3   	8
i1 10  1	3   	8
i1 20  1	3   	8
i1 30  1	3   	8
i1 40  1	3   	8
i1 50  1	3   	8
i1 60  1	3   	8
i1 70  1	3   	8
i1 80  1	3   	3
i99 0 86.4
</CsScore>
</CsoundSynthesizer>

















