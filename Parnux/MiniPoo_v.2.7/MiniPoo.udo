giTableSize    =    131073   
giRtosScale    =    1000  
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





