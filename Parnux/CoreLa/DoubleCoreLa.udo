

giTableSize    =    131073   
giRtosScale    =    1000  

giSine  	  	 ftgen		0, 0, 2^10,10,1
giSineTwo  	  	 ftgen		0, 0, 2^10,10,1, 0.5
giTri     ftgen     0, 0, 2^10, 10, 1, 0, -1/9, 0, 1/25, 0, -1/49, 0, 1/81
giSaw     ftgen     0, 0, 2^10, 10, 1, 1/2, 1/3, 1/4, 1/5, 1/6, 1/7, 1/8, 1/9  ;harmonics
giSquare  ftgen     0, 0, 2^10, 10, 1, 0, 1/3, 0, 1/5, 0, 1/7, 0, 1/9
giMyset  ftgen		0, 0, 2^10,10,1, 0.7, 0, 0.1, 0, 0, 0.3, 0, 0, 0, 0.2

giwave1        ftgen    0, 0, giTableSize, 9, 1000,1.000,0, 2890,0.500,0,		\
					     4950,0.250,0,     6990,0.125,0,     8010,0.062,0,     			\
					     9020,0.031,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,   	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0
giwave2    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     2572,0.667,0,  	\
						  4644,0.444,0,     6984,0.296,0,     9723,0.198,0,   				\
						   0,0.132,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0
giwave3        ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1027,1.000,0,\
					     1422,1.000,0,     1448,1.000,0,     1466,1.000,0,     \
					     1499,1.000,0,     1789,1.000,0,     1877,1.000,0,     \
					     1965,1.000,0,     1979,1.000,0,     2033,1.000,0,     \
					     2145,1.000,0,     2156,1.000,0,     2253,1.000,0,     \
					     2291,1.000,0,     2333,1.000,0,     2457,1.000,0,     \
					     2493,1.000,0,     2566,1.000,0,     2606,1.000,0,     \
					     2669,1.000,0,     2714,1.000,0

giwave4    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1002,0.833,0, \
					    1794,0.694,0,     1801,0.579,0,     2520,0.482,0,    \
					    2522,0.402,0,     2991,0.335,0,     2994,0.279,0,     \
					    3786,0.233,0,     3806,0.194,0,     4569,0.162,0,     \
					    4575,0.135,0,     5030,0.112,0,     5046,0.093,0,     \
					    6076,0.078,0,     5909,0.065,0,     6412,0.054,0,     \
					    6443,0.045,0,     7083,0.038,0,     7092,0.031,0,     \
					    7319,0.026,0,     7555,0.022,0






giScaleArr[] init 12
giShurArr[] 			fillarray 0, 1.5, 0.5, 1, 1, 1, 1.5, 0.5, 1.5, 0.5, 1, 1
giAbuataArr[] 		fillarray 0, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
giBayattorkArr[] 	fillarray 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5, 0.5
giAfshariArr[] 		fillarray 0, 1.5,0.5, 1, 1, 1, 1, 1, 1.5,0.5, 1, 1
giDashtiArr[] 		fillarray 0, 1, 1, 1, 1, 1, 1.5,0.5,  1, 1, 1, 1
giNavaArr[] 			fillarray 0, 1, 1, 1, 1, 1, 1, 1, 1.5, 0.5, 1, 1
gi3gahArr[] 			fillarray 0, 0.5, 1, 1, 1, 1.5, 0.5, 1.5, 0.5, 1, 1, 1
gi4gahArr[] 			fillarray 0, 1.5, 0.5, 1, 1,1, 1, 1, 1.5, 0.5, 1, 1
giHomayunArr[]   	fillarray 0, 0.5, 1, 1, 1,1, 1, 1.5, 0.5, 1, 1, 1
giBayatEsArr[]   	fillarray 0, 1,1,1, 1, 1,1,1, 1.5, 0.5, 1.5, 0.5



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
iMidiOut ftom iFrq
xout iMidiOut
endop


opcode dastgah, i,i[]iii
  iInArr[],iBaseMidi,iMidiIn,iQ xin
  iLen lenarray iInArr
  iOutArr[] init iLen
  iNote = iBaseMidi
  indx = 0
	while indx < iLen do
	iNote = iNote+(iInArr[indx])
	iOutArr[indx] = iNote
	indx += 1
	od
	iMidi = int(iMidiIn)+iQ
	indxOct = 0
	     until iMidi < iBaseMidi+12 do
	     indxOct += 1
  		iMidi = iMidi-12
  		enduntil
  		iIntrval = (iMidi-iBaseMidi)
iMidiOut = iOutArr[iIntrval]+(12*indxOct)
SnoteOut mton iMidiOut
  xout iMidiOut
endop



;;string
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

opcode ArrToStrg, S,i[]
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


;;udos
opcode MirrorMe,i,iii
iValue,iMin,iMax xin
iMiddle = iMin+((iMax-iMin)/2)
if iValue == iMiddle then
iOut = iValue
elseif iValue > iMiddle then
iOut = iMiddle - (iValue-iMiddle)
elseif iValue < iMiddle then
iOut = iMiddle + (iMiddle-iValue)
endif
xout iOut

endop
