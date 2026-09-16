<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1




zakinit 1, 3

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


opcode genNote, i[], i[]ii
 iArrInNote[],iShahed,iIst xin
 iLenRead lenarray iArrInNote
 iNoteArr[] init 5
 		indx = 0
 		while indx < lenarray(iNoteArr) do
 		iOctave =  0;int(random:i(0, 100) > 40 ? 0 : 12)
 		iNoteIndx RndNoRep 0, iLenRead
 		iNoteRnd = iArrInNote[iNoteIndx]
 		iNote = random:i(0, 100) > 60 ? iShahed : iNoteRnd
 		iNoteArr[indx] = iNote+iOctave
 		indx += 1
 		od
 xout iNoteArr
endop

seed 0
gkTime init 0
giShahedIndx = 0
giIstIndx = 5

instr 1
iPicth = 432
SbaseNote ="1F#"
i3gahArr[] fillarray 0,1.5,1.5,2,1.5,1.5,2
iDastgah[] Dastgah i3gahArr,SbaseNote,iPicth
printarray iDastgah, "%.3f"

iShahedMidi = iDastgah[1]
iIstMidi = iDastgah[0]
iBaseFrq mtof iShahedMidi
print iBaseFrq

SDastgahArr ArrToStrg iDastgah

iGenNotArr[] genNote iDastgah,iShahedMidi,iIstMidi
SNotesArr ArrToStrg iGenNotArr
iDur = p5

schedule p4,0,iDur,SNotesArr,iShahedMidi,iIstMidi
endin

instr 2
SNoteArr = p4
iNoteArr[] strToArr SNoteArr
;printarray iNoteArr, "%d"
iNoteLen lenarray iNoteArr
iShahedMidi = p5
iIstMidi = p6
kTime init 0

if metro(1/kTime) == 1 then
kTime random 7, 12
kRndIndx = int(random:k(0,lenarray(iNoteArr)))
kNote = random:k(0,100) > 25 ? iShahedMidi : iNoteArr[kRndIndx]
kFrq mtof kNote
	kIndx = 0
	while kIndx < 3 do
	kDur random kTime*0.5, kTime*0.8
	kDelay random 0.5, 2
	schedulek 10, kDelay, kDur,kFrq
	kFrqRatio random 0.8, 1.2
	kFrq *= kFrqRatio
	kIndx += 1
	od
endif

fprints "shahed1.txt","%.2f %.3f\n",mtof(iShahedMidi),0
fprints "shahed1.txt","%.2f %.3f\n",mtof(iShahedMidi),85
;fprints "ist1.txt","%.2f %.3f\n",mtof(iIstMidi),0
;fprints "ist1.txt","%.2f %.3f\n",mtof(iIstMidi),85

fprints "shahed2.txt","%.2f %.3f\n",mtof(iShahedMidi+12),0
fprints "shahed2.txt","%.2f %.3f\n",mtof(iShahedMidi+12),85
;fprints "ist2.txt","%.2f %.3f\n",mtof(iIstMidi+24),0
;fprints "ist2.txt","%.2f %.3f\n",mtof(iIstMidi+24),85

endin

instr 3
SNoteArr = p4
iNoteArr[] strToArr SNoteArr
iNoteLen lenarray iNoteArr
printarray iNoteArr, "%d"
iShahedMidi = p5
print iShahedMidi
iIstMidi = p6
kTime init 1
kCount init 0
if metro(1/kTime) == 1 then
kTime random 1, 6
kDur random kTime*0.5, kTime*1.1
kFrqMoses = random:k(0,100) > 50 ? 1 : 10
schedulek 11, 0, kDur, kCount,kFrqMoses,iShahedMidi
kCount = (kCount+1) % 3
endif
endin



;;sound
instr 10
iActive active 10
iTimeLine = i(gkTime)
idB random -20, -15
iAmp ampdb idB
iFrqIn = p4
iOctaveArr[] fillarray 1, 2, 4
iOctaveIndx = int(random:i(0, 3))
iOctaveRnd = (random:i(0,100) > 15 ? 0 : iOctaveIndx)
iOctave = iOctaveArr[iOctaveRnd]
iFrq = iFrqIn
iAtt random 0.005, 0.01
aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, 6, 0
aSound poscil aEnv, iFrq
outall aSound
iChn = (int(random:i(0,100)) < 50 ) ? 0 : 1
if iChn == 0 then
chnmix aSound, "staticL"
elseif iChn == 1 then
chnmix aSound, "staticR"
endif
SnameFile sprintf "staticLine%d.txt",iActive
fprints SnameFile,"%.2f %.3f\n",iFrq,iTimeLine
fprints SnameFile,"%.2f %.3f\n",iFrq,iTimeLine+p3

endin

instr 11
iActive active 2
if iActive > 3 then
turnoff
endif
idB random -25, -15
iAmp ampdb idB
iFrqIn mtof p6
iFrq = iFrqIn*2
iAtt = 1
iRel = 3
 aEnv	transegr	0,iAtt,3, 1,p3,4,0, iRel,-4,0
iFrqMoses = p5
print iFrqMoses
kFrq = randi:k(iFrqMoses,.5,1.5)
kFrqOut = kFrq+iFrq 

if iFrqMoses == 10 then
iAmpMoses = iFrq/8
elseif iFrqMoses == 50 then
iAmpMoses = iFrq/4
endif

aSine poscil iAmp, kFrqOut
iCount = p4+1
zkw kFrqOut, iCount

aAMP = randi:a( .7, 14, 2)+0.5
asum = aSine*aEnv*aAMP
   adel delay asum, 0.4
   aout sum asum,adel* ampdb(-5)
   keq = jspline:k(400, 0.4, 0.8) + 1200
   aout butlp aout, keq
   
outall aout
iChn = (int(random:i(0,100)) < 50 ) ? 0 : 1
if iChn == 0 then
chnmix aout, "lineL"
elseif iChn == 1 then
chnmix aout, "lineR"
endif
endin



instr 99
kTime timeinsts
gkTime = kTime
kFrqLine1 zkr 1
kFrqLine2 zkr 2
kFrqLine3 zkr 3
if kFrqLine1 != 0 && changed(int(kFrqLine1)) == 1 then
fprintks "FrqLine1.txt","%f %f\n",int(kFrqLine1),gkTime
endif
if kFrqLine2 != 0 && changed(int(kFrqLine2)) == 1 then
fprintks "FrqLine2.txt","%f %f\n",kFrqLine2,gkTime
endif
if kFrqLine3 != 0 && changed(int(kFrqLine3)) == 1 then
fprintks "FrqLine3.txt","%f %f\n",kFrqLine3,gkTime
endif


aStaticL chnget "staticL"
aStaticR chnget "staticR"
fout "recordLine1.wav", 8, aStaticL,aStaticR
aLineL chnget "lineL"
aLineR chnget "lineR"
fout "recordLine2.wav", 8, aLineL,aLineR
aSumL sum aStaticL,aLineL
aSumR sum aStaticR,aLineR
fout "recordSum.wav", 8, aSumL,aSumR
chnclear "staticL"
chnclear "staticR"
chnclear "lineL"
chnclear "lineR"
zkcl 0, 1
zkcl 0, 2
zkcl 0, 3
endin
</CsInstruments>
<CsScore>
;					ins	dur
i1 0 1 			2 		84
i1 10 1 		3 		73
i99 0 86.4
</CsScore>
</CsoundSynthesizer>



















































