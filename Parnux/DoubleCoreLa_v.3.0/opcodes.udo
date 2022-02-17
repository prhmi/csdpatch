;;midi
opcode RmvZ, i[],i[]
iArrIn[] xin
iLen lenarray iArrIn
indxc = 0
iLenA = 0
while indxc < iLen do
	if iArrIn[indxc] != 0 then
	iLenA += 1
	endif
indxc += 1
od
		if iLenA == 0 then
		iLenA = 1
		endif
iArrOut [] init iLenA
indx = 0
indxw = 0
while indx < iLen do
	if iArrIn[indx] != 0 then
	iArrOut [indxw] = iArrIn[indx]
	indxw += 1
	endif
indx += 1
od
xout iArrOut
endop


;;tala
opcode ArrTala, i[], i[]i
 iInArr[],iTalaCount xin
 iLen lenarray iInArr
 iOutArr [] init iLen
 iRead = 0
 iWrite = iTalaCount
 while iRead < iLen do
 	iOutArr [iRead] = iInArr[iWrite]
	iRead +=1
	iWrite = (iWrite+1)% iLen
 od
 xout iOutArr
endop
opcode ArrRep, i[], i[]i
 iInArr[],iTalaCount xin
 iLen lenarray iInArr
 iOutArr[] init  iLen+1
 iRead = 0
 iWrite = 0
 while iRead < iLen+1 do
 iOutArr [iRead] = iInArr [iWrite]
 	if iRead != iTalaCount then
 	iWrite += 1
 	endif
 iRead += 1
 od
 iOutArr[iTalaCount+1] = iInArr[iTalaCount]
 xout iOutArr
endop
opcode ArrPlus, i[], i[]i
 iInArr[],iElm xin
 iLen lenarray iInArr
 iOutArr[] = iInArr
 iAdd = int(random:i( 1,4))
 iMines = random:i( 0,100) > 50 ? 1: -1
 iOutArr [iElm] = iInArr [iElm] + (iAdd*iMines)	
		 iOutArr[iElm] = ( iOutArr[iElm] < 1 ) ? 
 		 iInArr[iElm] :  iOutArr[iElm]
 xout iOutArr
endop
opcode ArrChng, i[], i[]
 iInArr[] xin
 iLen lenarray iInArr
 iOutArr[] = iInArr
 indx = 0 
 while indx < iLen do
 iAdd random  0, 3
 iMines = random:i( 0,100) > 50 ? 1: -1
 iOutArr [indx] = iInArr [indx] + (iAdd*iMines)
 		 iOutArr[indx] = ( iOutArr[indx] < 1 ) ? 
 		 iInArr[indx] :  iOutArr[indx]
 indx += 1
 od
 xout iOutArr
endop


;;scale
opcode pythagorean,i,ii
iBaseNote,iNote xin
iMidi = iNote
		iOct = 0
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		iOct += 1
  		enduntil
 iMidiMin = (iMidi-iBaseNote)
  	iRatio = 1
  	if iMidiMin == 0 then
  	iRatio = 1/1
  	elseif iMidiMin == 1 then
  	iRatio = 2187/2048
  	elseif iMidiMin == 2 then
  	iRatio = 9/8
  	elseif iMidiMin == 3 then
  	iRatio = 32/27
  	elseif iMidiMin == 4 then
  	iRatio = 81/64
  	elseif iMidiMin == 5 then
  	iRatio = 4/3
  	elseif iMidiMin == 6 then
  	iRatio = 729/512
  	elseif iMidiMin == 7 then
  	iRatio = 3/2
  	elseif iMidiMin == 8 then
  	iRatio = 6561/4096
  	elseif iMidiMin == 9 then
  	iRatio = 27/16
  	elseif iMidiMin == 10 then
  	iRatio = 16/9
  	elseif iMidiMin == 11 then
  	iRatio = 243/128
  	elseif iMidiMin == 12 then
  	iRatio = 2/1
  	endif
iBaseFrq mtof iBaseNote+(iOct*12)
iFrq = (iBaseFrq)*iRatio
xout iFrq
endop


opcode shur,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  	iCent = 0
  	iRndPlus random -0.1, 0.2
   if iMidiMin == 2  then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.5+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote-iCent)
xout iFrqOut
endop

opcode homayun,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
   iRndPlus random -0.05, 0.05
  	iCent = 0
   if iMidiMin == 2  then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.25+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote+iCent)
xout iFrqOut
endop


opcode segah,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  iRndPlus random -0.2, 0.2
  	iCent = 0
   if iMidiMin == 4  then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 5 then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 9 then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 11 then
  	iCent = (0.5+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote-iCent)
xout iFrqOut
endop

opcode chargah,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  iRndPlus random -0.05, 0.05
  	iCent = 0
   if iMidiMin == 2  then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.25+iRndPlus)
  	elseif iMidiMin == 9 then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 11 then
  	iCent = (0.25+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote+iCent)
xout iFrqOut
endop

;;string
opcode StrToArr, i[],S
SIn xin
Snote     sprintf "%s ",SIn

iLen strlen Snote
iLenNote = 0
indxN = 0
while indxN < iLen do
if strchar(Snote,indxN) == 32 then
iLenNote += 1
endif
indxN += 1
od
iArrOut [] init iLenNote
iChStrt = 0
iLenS = 0
iChIndx = 0
while iChStrt < iLen do
Schar     strsub    Snote, 0, 1
	iChCount = 0
	until strcmp(Schar," ") == 0 do
	Schar     strsub    Snote, iChIndx, iChIndx+1
	iChIndx += 1
	iChCount += 1
	od
ScharOut     strsub    Snote, iChStrt, iChStrt+(iChCount-1)
iChStrt += (iChCount)
	inum strtod ScharOut
	iArrOut [iLenS] = inum
iLenS += 1
od
xout iArrOut
endop

opcode ArrToStrg, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf " %d",iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop


;;saveload
opcode save1,i,i
isave xin
giArrSeq1Save1 [] init 28
giArrAcc1Save1 [] init 28
giArrBss1Save1 [] init 28
giArrRep1Save1 [] init 28
giArrSeq2Save1 [] init 28
giArrAcc2Save1 [] init 28
giArrBss2Save1 [] init 28
giArrRep2Save1 [] init 28

iGetWidgets = 0
while iGetWidgets < 28 do
SseqValue1 sprintf "seq1%d",iGetWidgets
iSeqValue1 cabbageGetValue SseqValue1
giArrSeq1Save1 [iGetWidgets] = iSeqValue1
SaccValue1 sprintf "acc1%d",iGetWidgets
iAccValue1 cabbageGetValue SaccValue1
giArrAcc1Save1 [iGetWidgets] = iAccValue1
SbssValue1 sprintf "bss1%d",iGetWidgets
iBssValue1 cabbageGetValue SbssValue1
giArrBss1Save1 [iGetWidgets] = iBssValue1
SrepValue1 sprintf "rep1%d",iGetWidgets
iRepValue1 cabbageGetValue SrepValue1
giArrRep1Save1 [iGetWidgets] = iRepValue1
SseqValue2 sprintf "seq2%d",iGetWidgets
iSeqValue2 cabbageGetValue SseqValue2
giArrSeq2Save1 [iGetWidgets] = iSeqValue2
SaccValue2 sprintf "acc2%d",iGetWidgets
iAccValue2 cabbageGetValue SaccValue2
giArrAcc2Save1 [iGetWidgets] = iAccValue2
SbssValue2 sprintf "bss2%d",iGetWidgets
iBssValue2 cabbageGetValue SbssValue2
giArrBss2Save1 [iGetWidgets] = iBssValue2
SrepValue2 sprintf "rep2%d",iGetWidgets
iRepValue2 cabbageGetValue SrepValue2
giArrRep2Save1 [iGetWidgets] = iRepValue2
iGetWidgets += 1
od
; printarray giArrSeq1Save1, "%d"
xout isave 
endop


opcode save2,i,i
isave xin
giArrSeq1Save2 [] init 28
giArrAcc1Save2 [] init 28
giArrBss1Save2 [] init 28
giArrRep1Save2 [] init 28
giArrSeq2Save2 [] init 28
giArrAcc2Save2 [] init 28
giArrBss2Save2 [] init 28
giArrRep2Save2 [] init 28

iGetWidgets = 0
while iGetWidgets < 28 do
SseqValue1 sprintf "seq1%d",iGetWidgets
iSeqValue1 cabbageGetValue SseqValue1
giArrSeq1Save2 [iGetWidgets] = iSeqValue1
SaccValue1 sprintf "acc1%d",iGetWidgets
iAccValue1 cabbageGetValue SaccValue1
giArrAcc1Save2 [iGetWidgets] = iAccValue1
SbssValue1 sprintf "bss1%d",iGetWidgets
iBssValue1 cabbageGetValue SbssValue1
giArrBss1Save2 [iGetWidgets] = iBssValue1
SrepValue1 sprintf "rep1%d",iGetWidgets
iRepValue1 cabbageGetValue SrepValue1
giArrRep1Save2 [iGetWidgets] = iRepValue1
SseqValue2 sprintf "seq2%d",iGetWidgets
iSeqValue2 cabbageGetValue SseqValue2
giArrSeq2Save2 [iGetWidgets] = iSeqValue2
SaccValue2 sprintf "acc2%d",iGetWidgets
iAccValue2 cabbageGetValue SaccValue2
giArrAcc2Save2 [iGetWidgets] = iAccValue2
SbssValue2 sprintf "bss2%d",iGetWidgets
iBssValue2 cabbageGetValue SbssValue2
giArrBss2Save2 [iGetWidgets] = iBssValue2
SrepValue2 sprintf "rep2%d",iGetWidgets
iRepValue2 cabbageGetValue SrepValue2
giArrRep2Save2 [iGetWidgets] = iRepValue2
iGetWidgets += 1
od
  ;printarray giArrSeq1Save, "%d"  
  xout isave
endop


opcode load1,i,i
iload xin
        iWrite = 0
        while iWrite < 28 do
        Ssq1 sprintf "seq1%d",iWrite
        cabbageSetValue Ssq1,giArrSeq1Save1[iWrite]
        Sac1 sprintf "acc1%d",iWrite
        cabbageSetValue Sac1,giArrAcc1Save1[iWrite]
        Sbs1 sprintf "bss1%d",iWrite
        cabbageSetValue Sbs1,giArrBss1Save1[iWrite]
        Srp1 sprintf "rep1%d",iWrite
        cabbageSetValue Srp1,giArrRep1Save1[iWrite]
        Ssq2 sprintf "seq2%d",iWrite
        cabbageSetValue Ssq2,giArrSeq2Save1[iWrite]
        Sac2 sprintf "acc2%d",iWrite
        cabbageSetValue Sac2,giArrAcc2Save1[iWrite]
        Sbs2 sprintf "bss2%d",iWrite
        cabbageSetValue Sbs2,giArrBss2Save1[iWrite]
        Srp2 sprintf "rep2%d",iWrite
        cabbageSetValue Srp2,giArrRep2Save1[iWrite]
        iWrite += 1
        od
 xout iload
endop


opcode load2,i,i
iload xin
        iWrite = 0
        while iWrite < 28 do
        Ssq1 sprintf "seq1%d",iWrite
        cabbageSetValue Ssq1,giArrSeq1Save2[iWrite]
        Sac1 sprintf "acc1%d",iWrite
        cabbageSetValue Sac1,giArrAcc1Save2[iWrite]
        Sbs1 sprintf "bss1%d",iWrite
        cabbageSetValue Sbs1,giArrBss1Save2[iWrite]
        Srp1 sprintf "rep1%d",iWrite
        cabbageSetValue Srp1,giArrRep1Save2[iWrite]
        Ssq2 sprintf "seq2%d",iWrite
        cabbageSetValue Ssq2,giArrSeq2Save2[iWrite]
        Sac2 sprintf "acc2%d",iWrite
        cabbageSetValue Sac2,giArrAcc2Save2[iWrite]
        Sbs2 sprintf "bss2%d",iWrite
        cabbageSetValue Sbs2,giArrBss2Save2[iWrite]
        Srp2 sprintf "rep2%d",iWrite
        cabbageSetValue Srp2,giArrRep2Save2[iWrite]
        iWrite += 1
        od
xout iload
endop
