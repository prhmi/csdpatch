<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

seed 0

opcode ArrToStrg, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf "%d ", iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop



opcode StrToArr, i[],S
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
iArrOut[] init iLenCount

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
	iArrOut[iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop

opcode ArrElIn, i, ii[]
 iEl, iArr[] xin
 iRes = 0
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = 1
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes
endop

opcode ArrRmDup, i[], i[]
 iInArr[] xin
 iOutArr[] init lenarray:i(iInArr)
 iReadIndx = 0
 iWriteIndx = 0
 iCnt = 0
 while iReadIndx < lenarray:i(iInArr) do
  if ArrElIn:i(iInArr[iReadIndx],iOutArr) == 0 then
   iOutArr[iWriteIndx] = iInArr[iReadIndx]
   iWriteIndx += 1
   iCnt += 1
  endif
  iReadIndx += 1
 od
 trim_i iOutArr, iCnt
 xout iOutArr
endop

  opcode ArrRmIndx, i[], i[]i
iInArr[], iIndx xin
iOutArr[]  init       lenarray(iInArr)-1
iReadIndx  =          0
 until iReadIndx == iIndx do
iOutArr[iReadIndx] =  iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
iReadIndx  +=         1
 until iReadIndx == lenarray(iInArr) do
iOutArr[iReadIndx-1] = iInArr[iReadIndx]
iReadIndx  +=         1
 enduntil
           xout       iOutArr
  endop






instr 1
SNoteArray[] fillarray "5E", "5F", "5Gb", "5Ab", "5A", "6C", "6D"
iLen lenarray SNoteArray
iMidiArr[] init iLen
	indx = 0
	while indx < iLen do
	Snotes = SNoteArray[indx]
	iMidiArr[indx] ntom Snotes
	indx += 1
	od
Sout ArrToStrg iMidiArr
schedule 2, 0, 1, Sout
endin

instr 2	
SIn = p4
iMidiArr[] StrToArr SIn
iLen lenarray iMidiArr
iMidiWriteArr[] init 3
iMidiOut[] init 12
iNoteOut[] init 4
SNoteOut[] init 4
SAllOut[] init 6

indx = 0
while indx < iLen do
indxHarmony = 0
iWrite = 0
while indxHarmony < 4 do
		indxChord = 0
		indxWrite = indx
		while indxChord < 3 do
		iMidiOut[iWrite] = iMidiArr[indxWrite]
		indxWrite = (indxWrite+(indxHarmony+1)) % iLen
		indxChord += 1
		iWrite += 1
		od
indxHarmony += 1
od
iOutArr[] ArrRmDup iMidiOut

iAllIndx = 0
while iAllIndx < lenarray(iOutArr) do
iNameAll = iOutArr[iAllIndx]
SNameAll mton iNameAll
SAllOut[iAllIndx] = SNameAll
iAllIndx += 1
od
SnoteAll1 = SAllOut[0]
SnoteAll2 = SAllOut[1]
SnoteAll3 = SAllOut[2]
SnoteAll4 = SAllOut[3]
SnoteAll5 = SAllOut[4]
SnoteAll6 = SAllOut[5]
SNoteAll sprintf "%s	%s	%s	%s	%s	%s", SnoteAll1,SnoteAll2,SnoteAll3,\
SnoteAll4,SnoteAll5,SnoteAll6
fprints "contemporaryChordsAll.txt", "%d:	%s \n", indx+1, SNoteAll




iRmvIndx = 0
while iRmvIndx < 2 do
iRnd = int(random:i(0,lenarray(iOutArr)))
iOutArr[]  ArrRmIndx iOutArr, iRnd
iRmvIndx += 1
od

iNoteIndx = 0
while iNoteIndx < lenarray(iOutArr) do
iName = iOutArr[iNoteIndx]
SName mton iName
SNoteOut[iNoteIndx] = SName
iNoteIndx += 1
od
SnoteString1 = SNoteOut[0]
SnoteString2 = SNoteOut[1]
SnoteString3 = SNoteOut[2]
SnoteString4 = SNoteOut[3]
SNoteString sprintf "%s	%s	%s	%s", SnoteString1,SnoteString2,SnoteString3,\
SnoteString4
;fprints "RndName.txt", "%d:	%s \n", indx+1, SNoteString

SNotes ArrToStrg iOutArr
;fprints "RndMidi.txt", "%d:	%s \n", indx+1, SNotes
;printarray  iOutArr, "%d"
indx += 1
od




endin



</CsInstruments>
<CsScore>
i1 0 1
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
