;v5
<Cabbage>
form caption("DoubleCoreLa")    size(1200, 700)   guiMode("queue")  colour(25, 35, 50, 230) pluginId("crlp") ; style("legacy")
label    bounds(30, 104, 28, 12)    channel("label3")  text("seq") 
label    bounds(30, 144, 28, 12)   channel("label5")  text("bss")
label    bounds(30, 124, 28, 12)   channel("label6")  text("rep")
label    bounds(36, 258, 40, 12)   channel("label8")  text("On/Off")
label    bounds(30, 302, 28, 12)   channel("label10") text("seq")
label    bounds(30, 342, 28, 12)   channel("label12") text("bss")
label    bounds(30, 322, 28, 12)   channel("label13") text("rep")
label    bounds(594, 276, 46, 12)  channel("label15") text("Reverse")
label    bounds(594, 78, 46, 12)   channel("label16") text("Reverse")
label    bounds(16, 62, 60, 20)  channel("noteshow1")  fontColour(220, 234, 245, 255) align("left")  text("")
label    bounds(20, 232, 60, 20)  channel("noteshow2")  fontColour(220, 234, 245, 255) align("left") text("")
checkbox bounds(646, 76, 18, 18)   channel("rvrs1")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(646, 274, 18, 18)  channel("rvrs2")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) 
checkbox bounds(14, 258, 18, 18)   channel("sq2")     popupText("Start")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255)  value(1)
nslider  bounds(90, 29, 60, 45)     channel("bpm1")   range(10, 210, 90, 1, 1)    fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("BPM") 
nslider  bounds(150, 44, 40, 30)    channel("DV1")     range(1, 16, 4, 1, 1)       fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("DV") 
nslider  bounds(192, 35, 40, 40)    channel("steps1")  range(1, 28, 13, 1, 1)     fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Step")
nslider  bounds(90, 236, 60, 45)   channel("bpm2")    range(10, 250, 90, 1, 1)   fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("BPM") 
nslider  bounds(150, 250, 40, 30)  channel("DV2")     range(1, 16, 4, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("DV") 
nslider  bounds(192, 240, 40, 40)  channel("steps2")  range(1, 28, 13, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Step")
nslider  bounds(492, 236, 45, 38)  channel("oct")  range(-2, 2, 0, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("octv") 

nslider bounds(340, 34, 90, 40) channel("att1") range(0.0001, 0.5, 0.001, 1, 0.001) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("att")
nslider bounds(340, 240, 90, 40) channel("att2") range(0.0001, 0.5, 0.001, 1, 0.001)  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("att")
nslider bounds(246, 34, 90, 40) channel("dur1") range(0.05, 5, 1.5, 1, 0.01) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("duration")
nslider bounds(244, 240, 90, 40) channel("dur2") range(0.05, 5, 1.5, 1, 0.01)  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("duration")

vslider bounds(788, 10, 50, 150) channel("amp1") range(0, 1, 0.4, 1, 0.001) trackerColour(160, 200, 250, 255)text("ampS1")
vslider bounds(792, 236, 50, 150) channel("amp2") range(0, 1, 0.4, 1, 0.001) trackerColour(160, 200, 250, 255) text("ampS2")
vslider bounds(672, 506, 60, 181) channel("amp3") range(0, 1, 0.4, 1, 0.001) trackerColour(160, 200, 250, 255) text("ampPad")
vslider bounds(734, 506, 60, 181) channel("amp4") range(0, 1, 0.4, 1, 0.001) trackerColour(160, 200, 250, 255) text("ampPad")
combobox bounds(712, 72, 70, 30)   channel("BNote1")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(50, 54, 60, 255)
combobox bounds(672, 36, 110, 35)   channel("scale1")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf")  value(2) colour(50, 54, 60, 255)
combobox bounds(712, 268, 70, 30)  channel("BNote2")  text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(50, 54, 60, 255)
combobox bounds(672, 232, 110, 35) channel("scale2")  text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf") value(2)  colour(50, 54, 60, 255)
combobox bounds(682, 104, 100, 30)   channel("sound1")  text("Instr", "sine1", "sine2", "sine3", "dahina", "wood", "tibetan", "albert", "vco", "tri", "saw", "square", "myset", "pick")   value(14) colour(50, 54, 60, 255)
combobox bounds(682, 300, 100, 30)   channel("sound2")  text("Instr", "sine1", "sine2", "sine3", "dahina", "wood", "tibetan", "albert", "vco", "tri", "saw", "square", "myset", "pick")  value(4) colour(50, 54, 60, 255)
combobox bounds(590, 36, 70, 30)  channel("seqmod1")  text("seq", "tala", "aRnd", "iRnd")   value(1) colour(50, 54, 60, 255)
combobox bounds(590, 234, 70, 30)  channel("seqmod2")  text("seq","tala","aRnd", "iRnd")   value(1) colour(50, 54, 60, 255)
label bounds(934, 54, 239, 66) channel("sec")fontColour(220, 234, 245, 255) text("00 : 07")
button bounds(1054, 22, 116, 27) channel("start") text("S  T  A  R  T", "S  T  O  P") colour:0(124, 150, 204, 255) colour:1(69, 72, 96, 255) value(1)
label bounds(978, 24, 66, 28) channel("data")  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255) text("0")
label bounds(932, 22, 44, 31) channel("chndata")  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255) text("0")
combobox bounds(816, 478, 66, 31)  channel("tune")  text("440", "432")   value(2) colour(50, 54, 60, 255)
label bounds(70, 414, 564, 31) channel("narrshow") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("") align("left")   
label bounds(68, 474, 90, 40) channel("data1") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)   text("")
label bounds(164, 474, 90, 40) channel("data2") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)    text("")
label bounds(260, 474, 90, 40) channel("data3") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)   text("")
label bounds(356, 474, 90, 40) channel("data4") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)    text("")
label bounds(452, 474, 90, 40) channel("data5") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)    text("")
label bounds(548, 474, 90, 40) channel("data6") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)    text("")
vslider bounds(914, 532, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(160, 200, 250, 255)
vslider bounds(956, 532, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(160, 200, 250, 255)
vslider bounds(996, 532, 50, 150) channel("out3") range(0, 80, 0, 1, 1)trackerColour(160, 200, 250, 255)
vslider bounds(1038, 532, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(160, 200, 250, 255)
nslider bounds(1088, 464, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(49, 64, 79, 255) text("Master Gain (dB)")
nslider bounds(920, 496, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(49, 64, 79, 255)
nslider bounds(960, 496, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(49, 64, 79, 255)
nslider bounds(1000, 496, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(49, 64, 79, 255)
nslider bounds(1040, 496, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(49, 64, 79, 255)
combobox bounds(812, 622, 83, 34) channel("delayt") text("sec", "sync") colour(50, 54, 60, 255) value(2)
combobox bounds(816, 544, 70, 35), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0")  colour(50, 54, 60, 255)
filebutton bounds(820, 516, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8")  colour:0(50, 54, 60, 255)
filebutton bounds(822, 584, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101")  colour:0(50, 54, 60, 255)
vmeter bounds(1092, 532, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1116, 532, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1140, 532, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1164, 532, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(1092, 518, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(1116, 518, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1140, 518, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1164, 518, 15, 15) channel("clip4") colour(0, 0, 0, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0


opcode MtoNameInt, S,i
iMidi xin 
SNoteArr[] fillarray "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "Bb", "B"
iAraziArr[] fillarray 1, 3, 6, 8, 10
iNoteIndex = (iMidi) % 12
iNoteIndxInt = int(iNoteIndex)
iSCent = int((iMidi-int(iMidi))*100.5)
if iSCent  == 0 then
Sout sprintf "%s",SNoteArr[iNoteIndex]
elseif iSCent == 100 then
Sout sprintf "%s",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
else
		if iSCent > 50 then
		Sout sprintf "%s-",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
		elseif iSCent <= 50 then
		Sout sprintf "%s+",SNoteArr[iNoteIndex]
			indx = 0			
			while indx < lenarray(iAraziArr) do
				if iNoteIndxInt = iAraziArr[indx] then
				Sout sprintf "%s-",SNoteArr[(iNoteIndex+1)%lenarray(SNoteArr)]
				endif
			indx += 1
			od
		endif
endif
xout Sout
endop



giTableSize    =    131073   
giRtosScale    =    1000  

giSine  	 ftgen		0, 0, 2^10,10,1
giSineTwo  	 ftgen		0, 0, 2^10,10,1, 0.5
giMyset      ftgen		0, 0, 2^10,10,1, 0.7, 0, 0.1, 0, 0, 0.3, 0, 0, 0, 0.2
ift          vco2init   -1, 10000, 0, 0, 0, giMyset

;giwave0        ftgen    0, 0, giTableSize, 9, 1000,1.000,0, 2890,0.500,0
giwave1        ftgen    0, 0, giTableSize, 9, 1000,1,0, 250,0.5
giwave2        ftgen    0, 0, giTableSize, 9, 1000,1,0, 250,0.5,0, 2480,0.451,0,     3806,0.325,0, 6412,0.154
giwave3        ftgen    0, 0, giTableSize, 9, 1000,1,0, 289,0.5,0, 5909,0.265,0,     7555,0.522

giwave4        ftgen    0, 0, giTableSize, 9, 1000,1.000,0, 2890,0.500,0,		\
					     4950,0.250,0,     6990,0.125,0,     8010,0.062,0,     			\
					     9020,0.031,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,   	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0
giwave5    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     2572,0.667,0,  	\
						  4644,0.444,0,     6984,0.296,0,     9723,0.198,0,   				\
						   0,0.132,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0
giwave6        ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1027,1.000,0,\
					     1422,1.000,0,     1448,1.000,0,     1466,1.000,0,     \
					     1499,1.000,0,     1789,1.000,0,     1877,1.000,0,     \
					     1965,1.000,0,     1979,1.000,0,     2033,1.000,0,     \
					     2145,1.000,0,     2156,1.000,0,     2253,1.000,0,     \
					     2291,1.000,0,     2333,1.000,0,     2457,1.000,0,     \
					     2493,1.000,0,     2566,1.000,0,     2606,1.000,0,     \
					     2669,1.000,0,     2714,1.000,0

giwave7    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1002,0.833,0, \
					    1794,0.694,0,     1801,0.579,0,     2520,0.482,0,    \
					    2522,0.402,0,     2991,0.335,0,     2994,0.279,0,     \
					    3786,0.233,0,     3806,0.194,0,     4569,0.162,0,     \
					    4575,0.135,0,     5030,0.112,0,     5046,0.093,0,     \
					    6076,0.078,0,     5909,0.065,0,     6412,0.054,0,     \
					    6443,0.045,0,     7083,0.038,0,     7092,0.031,0,     \
					    7319,0.026,0,     7555,0.022,0







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


opcode skpZ, i[],i[]
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
iArrOut[] init iLen
indx = 0
indxw = 0
while indx < iLen do
	if iArrIn[indx] != 0 then
	iArrOut[indxw] = iArrIn[indx]
	indxw += 1
	endif
indx += 1
od
xout iArrOut
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



opcode ArrToStrgN, S,i[]
  iArrIn[] xin
  
  iArrIn RmvZ iArrIn
  
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    SNote MtoNameInt iArrIn[indx]
    Sscale     sprintf "%s ", SNote
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop





;;scale
giScaleArr[] init 13
giNormal[]          fillarray 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
giPythaArr[]        fillarray 1, 2187/2048, 9/8, 32/27, 81/64, 4/3, 729/512, 3/2, 6561/4096, 27/16, 16/9, 243/128, 2/1
giShurArr[] 	    fillarray 0, 1.5, 0.5, 1, 1, 1, 1.5, 0.5, 1.5, 0.5, 1, 1
giAbuataArr[] 		fillarray 0, 0.5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
giBayattorkArr[] 	fillarray 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1.5, 0.5
giAfshariArr[] 		fillarray 0, 1.5,0.5, 1, 1, 1, 1, 1, 1.5,0.5, 1, 1
giDashtiArr[] 		fillarray 0, 1, 1, 1, 1, 1, 1.5,0.5,  1, 1, 1, 1
giNavaArr[] 		fillarray 0, 1, 1, 1, 1, 1, 1, 1, 1.5, 0.5, 1, 1
gi3gahArr[] 		fillarray 0, 0.5, 1, 1, 1, 1.5, 0.5, 1.5, 0.5, 1, 1, 1
gi4gahArr[] 		fillarray 0, 1.5, 0.5, 1, 1,1, 1, 1, 1.5, 0.5, 1, 1
giHomayunArr[]   	fillarray 0, 0.5, 1, 1, 1,1, 1, 1.5, 0.5, 1, 1, 1
giBayatEsArr[]   	fillarray 0, 1,1,1, 1, 1,1,1, 1.5, 0.5, 1.5, 0.5

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




opcode noteBase, ii, i
iBaseNoteIn xin
if iBaseNoteIn == 2 then
SbaseNote = "0G"
iQ = 0
elseif iBaseNoteIn == 3 then
SbaseNote = "0A-"
iQ = 1
elseif iBaseNoteIn == 4 then
SbaseNote = "0Bb"
iQ = 0
elseif iBaseNoteIn == 5 then
SbaseNote = "0C"
iQ = 0
elseif iBaseNoteIn == 6 then
SbaseNote = "0E-"
iQ = 1
elseif iBaseNoteIn == 7 then
SbaseNote = "0D-"
iQ = 1
elseif iBaseNoteIn == 8 then
SbaseNote = "0F"
iQ = 0
elseif iBaseNoteIn == 9 then
SbaseNote = "0A"
iQ = 0
elseif iBaseNoteIn == 10 then
SbaseNote = "0B"
iQ = 0
elseif iBaseNoteIn == 11 then
SbaseNote = "0Gb"
iQ = 0
elseif iBaseNoteIn == 12 then
SbaseNote = "0D"
iQ = 0
elseif iBaseNoteIn == 13 then
SbaseNote = "0E"
iQ = 0
endif
iBaseNote ntom SbaseNote
xout iBaseNote, iQ
endop


opcode noteScale, i,iiii
iMidiNote, iBaseNote, iScale,iQ xin
if iScale == 1 then
iMidiOut = iMidiNote
elseif iScale == 2 then
iMidiOut pythagorean iBaseNote,iMidiNote
elseif iScale == 3 then
iMidiOut dastgah giShurArr,     iBaseNote,iMidiNote, iQ
elseif iScale == 4 then
iMidiOut dastgah giAbuataArr,   iBaseNote,iMidiNote, iQ
elseif iScale == 5 then
iMidiOut dastgah giBayattorkArr,iBaseNote,iMidiNote, iQ
elseif iScale == 6 then
iMidiOut dastgah giAfshariArr,  iBaseNote,iMidiNote, iQ
elseif iScale == 7 then
iMidiOut dastgah giDashtiArr,   iBaseNote,iMidiNote, iQ
elseif iScale == 8 then
iMidiOut dastgah giNavaArr,     iBaseNote,iMidiNote, iQ
elseif iScale == 9 then
iMidiOut dastgah gi3gahArr,     iBaseNote,iMidiNote, iQ
elseif iScale == 10 then
iMidiOut dastgah gi4gahArr,     iBaseNote,iMidiNote, iQ
elseif iScale == 11 then
iMidiOut dastgah giHomayunArr,  iBaseNote,iMidiNote, iQ
elseif iScale == 12 then
iMidiOut dastgah giBayatEsArr,  iBaseNote,iMidiNote, iQ
endif
xout iMidiOut
endop


opcode rngMk, k, kii 
 kMidiIn, iMin, iMax xin 
 kMidi = kMidiIn
 		kAdd = (kMidiIn < iMin) ? (iMax-iMin) : -(iMax-iMin)
 loop:
 kMidi += kAdd
  		if  kMidiIn < iMin && kMidi < iMin goto loop
 		if  kMidiIn > iMax && kMidi > iMax goto loop
xout kMidi
endop



opcode rateCCk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = (kValue*iDiff)+iMin
xout kOut
endop 


opcode rateCCi, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut = (iValue*iDiff)+iMin
xout iOut
endop 


opcode rateSlideri, i, iii
iValue, iMin, iMax xin
iDiff = iMax-iMin
iOut = ((iValue-iMin)/iDiff)
if iOut >= 1 then
iOut = 1
endif
if iOut <= 0 then
iOut = 0
endif
xout iOut
endop 


 giArrNote[]    init 11
 giArrEmpty[]   init lenarray:i(giArrNote)
 giWriteNote    init 0


giSteps init 28
massign 0,0
massign 1,1
massign 3,10
massign 5,12
pgmassign 0, 0

iLenSeq init 15
gkNote init 0
giTune init 0

 giArrNote[]    init iLenSeq
 giNote[] init iLenSeq
 giArrEmpty[]   init iLenSeq
 giWriteNote init 0

instr GetMidi ;1
 iActive active "GetMidi"
 iHold cabbageGetValue "mpad8"
 kHold cabbageGet "mpad8"
 kRel release
 iMidi notnum
  if iActive == 1 then
  giArrNote[] = giArrEmpty
  giWriteNote = 0
  endif
 giArrNote[giWriteNote] = iMidi
 giWriteNote = (giWriteNote+1) % lenarray(giArrNote)
giNote[] RmvZ giArrNote
 giLenNote lenarray giNote
 gkLenNote lenarray giNote
 SnArrShow ArrToStrgN giNote
     SnoteShow     sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
 if kRel == 1 && kHold == 0  then
 schedulek "rmvMidi", 0, 0.1, iMidi
 endif
 
endin
instr rmvMidi ;2
 iRead = 0
    while iRead < lenarray(giArrNote) do
        if giArrNote[iRead] == p4 then
        giArrNote[iRead] = 0
        endif
    iRead += 1
    od
 giArrNote[] skpZ giArrNote
 giNote[] RmvZ giArrNote
  giLenNote lenarray giNote
 gkLenNote lenarray giNote
   giNoteCopyArr[] = giNote
 SnArrShow ArrToStrgN giNote
      SnoteShow     sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
 giWriteNote -= 1
endin


instr seq
SarrCopy sprintf "copyArr%d", p4
;puts SarrCopy, 1
schedule SarrCopy, 0.1, 0.1
kAtt        = cabbageGet:k(sprintf:S("att%d",p4))
kBPM        = cabbageGet:k(sprintf:S("bpm%d",p4))
kTms        = cabbageGet:k(sprintf:S("DV%d",p4))
kSteps      = cabbageGet:k(sprintf:S("steps%d",p4)) 
kRndWidget  = cabbageGet:k(sprintf:S("seqmod%d",p4))
kDur        = cabbageGet:k(sprintf:S("dur%d",p4))
kFilterIn   = cabbageGet:k(sprintf:S("slider%d",((p4-1)*8)+2)) ;"slider1"
kFilterBsIn = cabbageGet:k(sprintf:S("slider%d",((p4-1)*8)+3)) ;"slider2"
 ;"slider3" "slider3"
;kpw rateCCk kpwIn, 0.05, 0.95

kFilter     rateCCk kFilterIn, 300, 10000
kFilterBs   rateCCk kFilterBsIn, 0, 800

kTempo = kBPM/60
kTime = (kTempo*kTms)
ksel = 0
kNoteIn = giNote[ksel]
kSeqIndx   init 0
kNoteIndx  init 0


iStepsNotes = giSteps*((p4-1)*3)
iStepsRep = giSteps*(((p4-1)*3)+1)
iStepsBass = giSteps*(((p4-1)*3)+2)

    if metro(kTime) == 1 then
    if kNoteIn > 20 then
    ;;sound
    SseqValue sprintfk "sqsteps%d",kSeqIndx+iStepsNotes
    kSeqValue cabbageGet SseqValue
        if kSeqValue == 1 then 
        kNoteIndx  = (kNoteIndx+1)  % giLenNote
            if changed(gkLenNote) == 1 then
            kNoteIndx = gkLenNote-1
            endif
            kNote  = giNote[kNoteIndx]
            iSeqAmp = -10
            schedulek "Sound" ,0,kDur,kNote, kAtt,iSeqAmp, kFilter, p4
        endif
    ;;Bss
    SbssValue sprintfk "sqsteps%d",(kSeqIndx+iStepsBass)
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    	kBidx = 0
        kNoteBass = giNote[kBidx]
	    until kNoteBass < 45 do
  		kNoteBass = kNoteBass-12
  		enduntil
    iBassAtt = 0.0001
    iBassAmpdB = -3
        schedulek "Sound" ,0,kDur*1.5,kNoteBass, iBassAtt,iBassAmpdB, kFilterBs, p4
    endif
    ;;Rep
    SrepValue sprintfk "sqsteps%d",kSeqIndx+iStepsRep
    kRepValue cabbageGet SrepValue
    if kRepValue == 1 then
        kNoteRep = kNote
	    until kNoteRep > 80 do
  		kNoteRep = kNoteRep+12
  		enduntil
    kRepR = ((int(random:k(0,6)))/4)+1
        if kRepR <= 1.5 then
        kRepT = int(random:k( 3,7))
        else
        kRepT = int(random:k( 2,4))
        endif
    kDurRep = (1/kTime)/kRepR
    kTrigRep = kDurRep
    kndxRep = 0
        while kndxRep < kRepT do
        iRepAtt = 1/5000
        iRepAmpdB = -15
			schedulek "Sound",kTrigRep,kDurRep,kNoteRep, iRepAtt,iRepAmpdB, kFilter, p4
	    kTrigRep += kDurRep
		kndxRep += 1
		od	
    endif
    endif
    schedulek "LEDon",0,0.1,kSeqIndx, p4
    schedulek "LEDoff",1/kTime,0.1,kSeqIndx, p4
        if kSeqIndx == 0 && changed(kSeqIndx) == 1 then 
            if kRndWidget == 1 && changed(kRndWidget) == 1 && p4 == 1 then
            schedulek "resetArr", 0.1, 1, 1
            elseif kRndWidget == 2 && p4 == 1 then
            schedulek "RndtWidget", 0.1, 1, 1
            elseif kRndWidget == 3 && p4 == 1 then
            schedulek "RndaWidget", 0.1, 1, 1
            elseif kRndWidget == 4 && p4 == 1 then
            schedulek "resetArr", 0.1, 1, 1
            schedulek "RndiWidget", 0.2, 1, 1
            endif
            if kRndWidget == 1 && changed(kRndWidget) == 1 && p4 == 2 then
            schedulek "resetArr", 0.1, 1, 2
            elseif kRndWidget == 2 && p4 == 2 then
            schedulek "RndtWidget", 0.1, 1, 2
            elseif kRndWidget == 3 && p4 == 2 then
            schedulek "RndaWidget", 0.1, 1, 2
            elseif kRndWidget == 4 && p4 == 2 then
            schedulek "resetArr", 0.1, 1, 2
            schedulek "RndiWidget", 0.2, 1, 2
            endif
        endif
    kSeqIndx = (kSeqIndx+1) % kSteps
    endif
    
;;OutPut Sound    
kPortTime linseg 0, 0.01, 0.0001
iBPM            cabbageGetValue "bpm1"
iTms            cabbageGetValue "DV1"
iDelayTimeIn    = 1 ;cabbageGetValue "delaytseq"
kFeedback       cabbageGet "dfbseq"
kDelayMix       = 0 ;cabbageGet "dmixseq"
kRvrbMix        = 0 ;cabbageGet "rmixseq"
kSizeRvrb       cabbageGet "rsizeseq"
kRoomRvrb       cabbageGet "rroomeseq"
iDelay = 1+(int(iDelayTimeIn*5))
iTime = (1/((iBPM/60)*iTms))*iDelay
iDelayT cabbageGetValue "delayt"
if iDelayT == 1 then
iDelayTime = iDelayTimeIn
elseif iDelayT == 2 then
iDelayTime = iTime
endif
aSound chnget "sndseq"
aDelay init 0
aDelay  delay    aSound+(aDelay*kFeedback), iDelayTime
  	aDelMix		ntrpol	 aSound,aDelay,  kDelayMix
  aRvrb,aRvrb  reverbsc aSound,aSound, kSizeRvrb, kRoomRvrb, sr, 1, 1
  aRvrbMix ntrpol aSound,aRvrb, kRvrbMix
  aMixOut = (aDelMix+aRvrbMix)/2
  outall aMixOut
  chnclear "sndseq"   
endin

instr LEDon
iNum = (p5-1)*giSteps
Slte sprintf "lte%d",p4+iNum
cabbageSet 1,Slte,"colour(160, 200, 250, 255)"
endin
instr LEDoff
iNum = (p5-1)*giSteps
Slte sprintf "lte%d",p4+iNum
cabbageSet 1,Slte,"colour(100, 100, 100, 200)"
endin


instr Sound 
iMidi = p4
iAmpIn        = cabbageGetValue:i(sprintf:S("amp%d",p8))
iBaseNoteIn   = cabbageGetValue:i(sprintf:S("BNote%d",p8))
iScale        = cabbageGetValue:i(sprintf:S("scale%d",p8))
iRvrs         = cabbageGetValue:i(sprintf:S("rvrs%d",p8))
iSineMod      = cabbageGetValue:i(sprintf:S("sound%d",p8))
kpwIn         = cabbageGet:k(sprintf:S("slider%d",((p8-1)*8)+4))
ipluckIn      = cabbageGetValue:i(sprintf:S("slider%d",((p8-1)*8)+5))
ipickIn       = cabbageGetValue:i(sprintf:S("slider%d",((p8-1)*8)+6))
kpw     rateCCk kpwIn, 0.05, 0.95
ipluckMin  rateCCi ipluckIn, 0.1, 0.00001
ipluckMax  rateCCi ipluckIn, 0.5, 0.005
ipickMin   rateCCi ipickIn, 0.3, 0.5
ipickMax   rateCCi ipickIn, 0.7, 0.9

iDur rateSlideri p3, 0.05, 5
irelfMin       rateCCi iDur, 0.9, 0.1
irelfMax       rateCCi iDur, 0.5, 0.01
iAmpdB  rateCCi iAmpIn, -30, 20
iAmp    ampdb iAmpdB+p6

iBaseMidi,iQ noteBase iBaseNoteIn
iMidiOut     noteScale iMidi,iBaseMidi,iScale, iQ
Snote        MtoNameInt iMidiOut
gkNote = iMidiOut
iFrqIn  mtof iMidiOut
iRatio = giTune/440
iFrq = iFrqIn*iRatio

iAtt = p5
if iRvrs == 0 then
 aEnv transeg 0, iAtt,4, iAmp, p3-iAtt,-6, 0
elseif iRvrs == 1 then
        if iAtt <= 0.008 then
        iAtt = 0.008
        endif
        if iMidi > 80 then
        iAtt = p3*0.4
        endif
 aEnv transeg 0, p3*(1-iAtt),4, iAmp,p3*iAtt,-4,0
endif



if iSineMod <= 8 then
    if iSineMod == 2 then
    iWave = giwave1 ;sine1
    elseif iSineMod == 3  then
    iWave = giwave2 ;sine2
    elseif iSineMod == 4  then
    iWave = giwave3 ;sine3
    elseif iSineMod == 5  then
    iWave = giwave4 ;dahina
    elseif iSineMod == 6  then
    iWave = giwave5 ;wood
    elseif iSineMod == 7  then
    iWave = giwave6 ;tibetan
    elseif iSineMod == 8  then
    iWave = giwave7 ;albert
    else
    iWave = giwave1
    endif
aSound poscil aEnv, (iFrq)/giRtosScale,iWave
elseif iSineMod >= 9 && iSineMod <= 13 then
    if iSineMod == 9  then
    iMod = 0 ;vco
    elseif iSineMod == 10 then
    iMod = 12; tria
    elseif iSineMod == 11 then
    iMod = 4 ;saw
    elseif iSineMod == 12 then
    iMod = 2 ; square
    elseif iSineMod == 13  then
    iMod = 14 ;mey set
    else
    iMod = 1
    endif
aVco    vco2   1,iFrq,iMod, kpw
aSound = aVco*aEnv
elseif iSineMod == 14 then
iplk  random ipluckMin, ipluckMax
ipick random ipickMin, ipickMax
irelf random irelfMin, irelfMax
;print irelf
aPick wgpluck2 iplk,0.95, iFrq, ipick, irelf
aSound = aPick*aEnv
endif



iFilter  = p7
aOut clfilt aSound, iFilter+(iFrq*0.7), 0, 10
chnmix aOut, "sndseq"

if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    SchS sprintf "noteshow%d",p8
    cabbageSet SchS,SnoteShow
endif

endin


;--------------------------------------------------
;pad sound

instr AmbientMachine
iBaseNoteIn cabbageGetValue "BNote1"
iBaseMidi,iQ noteBase iBaseNoteIn
kTime init 1
if metro(1/kTime) == 1 then

kTime random 3, 7
kDur = kTime*1.5
    if gkNote != 0 then
    kMidi = gkNote
    else
    kMidi random 45, 55
    endif
    kMidiOut rngMk kMidi, 45, 55
    schedulek "AmbientSound", 0, kDur, kMidiOut
endif

endin
;schedule "AmbientMachine", 0, 9999

instr AmbientSound
kAmpdB ampdb 0
    cabbageSet 1,"mtrx1","colour(100, 150, 200)"
    kRelease release
    if kRelease == 1 then
    cabbageSet 1,"mtrx1","colour(70, 62, 68, 255)"
    endif
 iMidi = p4
 iFrqIn mtof iMidi
iRatio = giTune/440
iFrq = iFrqIn*iRatio

iFade = 5
iAmp        ampdb -20
iMod = 2
kpw rspline 0.1, 0.9, 0.7, 1
aVco    vco2   iAmp,iFrq,iMod, kpw
aVcoFlt     clfilt aVco, 1200, 0, 10
kVcoLFO rspline 0.4, 8, 0.3, 1
 iVcoRng random 0.1, 0.5
 aVcoLFO = lfo:a(iVcoRng, kVcoLFO, 0) + 0.5


 iwave  ftgen 1, 0, 1024, 10, 1, 1, 0, 1
 iblend ftgen 2, 0, 1024, -19, 1, 0.5, 270, 0.5
 itone random 0.1, 0.9
 ktone     rspline itone, itone+0.02,  2, 8
 kbrite    jspline 0.5,  2, 5
 ibasfreq  random 50, 120
 aHsbo hsboscil ampdb(-10), ktone, kbrite, ibasfreq, iwave, iblend, 8, 1
 aHsboFlt clfilt aHsbo, 1000, 0, 10
 kHsboLFO rspline 1, 3, 0.7, 2
 iHsboRng random 0.1, 0.5
 aHsboLFO = lfo:a(iHsboRng, kHsboLFO, 0) + 0.5

aSum = (aHsboFlt*aHsboLFO)+(aVcoFlt*aVcoLFO)

 aSumEnv linen aSum, p3/iFade, p3, p3/iFade

aOut = aSumEnv
	chnmix aOut, "sndpad"
endin



 gkBowNote init 0
instr bowMachine
iNumInstr     nstrnum "bowSound"
 kTime init 1 
 kSpeedIn cabbageGet "slider3"
 kSpeed rateCCk kSpeedIn, 0.4, 5
        if gkBowNote != 0 then
        kMidi random gkBowNote-5, gkBowNote+5
        elseif gkBowNote == 0 then
        kMidi random 45, 60
        endif
    if metro(kTime) == 1 || (kSpeedIn == 1 && changed(kSpeedIn) == 1) then
    kTime random kSpeed, kSpeed*1.5
    kRndDur random 0.5, 1.5
    kDur = (1/kTime)*kRndDur
    schedulek iNumInstr+0.1, 0, kDur,kMidi
    endif   
endin

;schedule "bowMachine", 0, 9999

instr bowSound
    cabbageSet 1, "mtrx5", "colour(200, 150, 100)"
    iMidi = p4
    if p3 == -1 then
    gkBowNote = iMidi
    turnoff
    endif
    iFrqIn mtof iMidi
    iRatio = giTune/440
    iFrq = iFrqIn*iRatio
    iAtt = 0.1
    iRel random 0.5, 1.5
    aEnv linsegr 0, iAtt, 1, iRel, 0
        if release() == 1 then
        cabbageSet 1,"mtrx5","colour(50, 50, 50,)"
        endif
 kPoseIn      cabbageGet "slider2"
 kFilterIn    cabbageGet "slider4"
 kPose        rateCCk kPoseIn, 0.1,   5 ;0.025, 2
 kFilter      rateCCk kFilterIn,400, 12000  
 iAmp   ampdb -20
 kRate  init 0.026
 kPres  rspline  2.5, 3.5, 1/p3, 2/p3
 kRate   rspline 0.026, kPose, 1/p3, 2/p3  ;0.025 - 0.23  (0.1)
 aBow	wgbow    iAmp,iFrq,kPres,kRate,0,0;,giSine;, iFrqMin
 aFiltBow clfilt aBow, kFilter+(iFrq*3), 0, 50
 aOut = aFiltBow*aEnv
 chnmix aOut, "sndbow"
endin




 gkFluteNote init 0
instr fluteMachine
 iNumInstr     nstrnum "fluteSound"
 kTime init 1
 kSpeedIn cabbageGet "slider12"
 kSpeed rateCCk kSpeedIn, 2, 0.1
        if gkFluteNote != 0 then
        kMidi random gkFluteNote-5, gkFluteNote+5
        elseif gkFluteNote == 0 then
        kMidi random 50, 85
        endif
    if changed(kSpeed) == 1 then
    kTime init 10
    endif
    if metro(1/kTime) == 1 || (kSpeedIn == 1 && changed(kSpeedIn) == 1) then
    kTime random kSpeed, kSpeed*2
    kRndDur random 1, 2
    kDur = kTime*kRndDur
    schedulek iNumInstr+0.1, 0, kDur,kMidi
    endif 
endin
schedule "fluteMachine", 0, 9999

instr fluteSound
    cabbageSet 1,"mtrx6","colour(100, 200, 100)"
    iMidi = p4
    if p3 == -1 then
    gkFluteNote = iMidi
    turnoff
    endif
    iAtt = 0.1
    iRel = 0.1
    iFrqIn mtof iMidi
    iRatio = giTune/440
    iFrq = iFrqIn*iRatio
        if release() == 1 then
        cabbageSet 1,"mtrx6","colour(10, 10, 10)"
        endif
 kFilterIn cabbageGet "slider10"
   kPosIn        cabbageGet      "slider1"
  kFilter rateCCk kFilterIn,700, 10000
 kJet init 0.085
 iAmp ampdb -15 
 iJetMax random 0.1, 2
 kJet   rspline 0.085,iJetMax, 5, 12
 iAirSound random 0, 0.3;, 2, 5
 aFlute  wgflute iAmp, iFrq, kJet, 0.2, 0.2, iAirSound, 0, 0;, iWave,iFrqMin
 aFiltFlute clfilt aFlute, kFilter+(iFrq*0.5), 0, 10
; aFiltFlute clfilt aFiltFlute, 250, 1, 10
 aOut linen aFiltFlute, p3/2, p3, p3/2
 chnmix aOut, "sndflt"
;outall aOut
endin




instr padFx
aInAmb      chnget "sndamb"
aInBow      chnget "sndbow"
aInFlute    chnget "sndflt"
aSound sum aInAmb,aInBow, aInFlute

;;OutPut Sound    
kPortTime linseg 0, 0.01, 0.0001
kFeedback       = 0.3 ;cabbageGet "dfbseq"
kDelayMix       cabbageGet "slider13"
kRvrbMix        cabbageGet "slider14"
kSizeRvrb       cabbageGet "slider15"
kRoomRvrb       = 8000;cabbageGet "rroomeseq"
iDelayTime      = 1.3 ;cabbageGetValue "delayt"

aDelay init 0
aDelay  delay    aSound+(aDelay*kFeedback), iDelayTime
  aDelMix		ntrpol	 aSound,aDelay,  kDelayMix
  aRvrb,aRvrb   reverbsc aSound,aSound, kSizeRvrb, kRoomRvrb, sr, 0.5, 1
  aRvrbMix      ntrpol aSound,aRvrb, kRvrbMix
  aMixOut = (aDelMix+aRvrbMix)/2
  outall aMixOut
  chnclear "sndamb", "sndbow","sndflt"
endin


instr hold
 cabbageSetValue "mpad8",p4
endin

instr Empty ;7
    gkNote = 0
 giArrNote[] = giArrEmpty
 giNote[] = giArrEmpty
    SnoteShow     sprintf "text(%s)", " "
    cabbageSet "narrshow",SnoteShow
endin



;-------------------------------------------------------
;widgets
instr widgetWrite    
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < giSteps*6 do
 SSteps    sprintf "bounds(%d, %d, 18, 18),valueTextBox(0)\
 channel(\"sqsteps%d\"),colour:0(70, 70, 70) colour:1(160, 200, 250)",\
 iX+65+ispcx, iY+100, indx
 cabbageCreate "checkbox", SSteps 
 iX = (iX+21)
 indx += 1
    if (indx%4) == 0 then
    iX += 4
    endif
    if (indx%giSteps) == 0 then
    iY += 21
    iX = 0
    endif
    if (indx%(giSteps*3)) == 0 then
    iY += 136
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < giSteps*2 do
 Sleds    sprintf "bounds(%d, %d, 16, 16),valueTextBox(0)\
 channel(\"lte%d\") colour(100, 100, 100, 200)",\
 iX+66+ispcx, iY+164, indx
 cabbageCreate "image", Sleds
 iX = (iX+21)
 indx += 1
    if (indx%4) == 0 then
    iX += 4
    endif
    if (indx%giSteps) == 0 then
    iY += 200
    iX = 0
    endif
 od
  schedule "loadbang", 0.1, 0.1   
      
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < 16 do
 SKnob    sprintf "bounds(%d, %d, 70, 70),valueTextBox(0)\
 channel(\"slider%d\") range(0, 1, 0, 1, 0.01), text(%d)\
 markerColour(255, 255, 255, 255) trackerColour(160, 200, 250)\
  colour(130, 140, 150)",\
 iX+65+ispcx, iY+530, indx+1, indx+1
 cabbageCreate "rslider", SKnob 
 iX = (iX+70)
 indx += 1
    if (indx%4) == 0 then
    iX += 20
    ispcx = 0
    endif
    if (indx%8) == 0 then
    iY += 80
    iX = 0
    ispcx = 0
    endif
 od
 iX = 0
 iY = 0
 indx = 0
 while indx < 16 do
 SmPad    sprintf "bounds(%d, %d, 35, 35),\
 channel(\"mpad%d\") colour:0(70, 70, 70) colour:1(160, 200, 250) text()", \
 iX+850, iY+350, indx+1
 cabbageCreate "button", SmPad 
 iX = (iX+40)
 indx += 1
    if (indx%4) == 0 then
    iX += 5
    endif
    if (indx%16) == 0 then
    iY += 10
    iX = 0
    endif
    if (indx%8) == 0 then
    iY += 40
    iX = 0
    endif
 od
  iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 ispcy = 0
 while indx < 84 do
 Smtrx    sprintf "bounds(%d, %d, 20, 20),\
 channel(\"mtrx%d\") colour(70, 70, 70)", \
 860+iX+ispcx, iY+150+ispcy, indx+1
 cabbageCreate "image", Smtrx 
  iX += 24
  indx += 1
    if (indx%4) == 0 then
    ispcx += 5
    endif
    if (indx%12) == 0 then
    iY += 20
    iX = 0
    ispcx = 0
    endif
    if (indx%12) == 0 then
    ispcy += 5
    endif
 od
endin


instr loadbang
    iArrSeq1[] fillarray 1,0,0,1,1,0,0,1,0,1,0,0,1
    iArrRep1[] fillarray 0,0,0,0,0,1,0,0,0,0,0,0,0
    iArrBas1[] fillarray 0,0,0,0,1,0,0,0,0,0,0,0,0   
    iArrSeq2[] fillarray 0,1,1,0,0,1,0,0,1,0,0,1,0
    iArrRep2[] fillarray 0,0,0,0,0,0,0,0,0,0,0,1,0
    iArrBas2[] fillarray 1,0,0,0,0,0,1,0,0,0,0,0,0
    indx = 0
    while indx < 13 do
     Ssq1 sprintf "sqsteps%d",indx
     Srp1 sprintf "sqsteps%d",(indx+giSteps)
     Sbs1 sprintf "sqsteps%d",indx+(giSteps*2)
     Ssq2 sprintf "sqsteps%d",indx+(giSteps*3)
     Srp2 sprintf "sqsteps%d",indx+(giSteps*4)
     Sbs2 sprintf "sqsteps%d",indx+(giSteps*5)
     cabbageSetValue Ssq1, iArrSeq1[indx]
     cabbageSetValue Srp1, iArrRep1[indx]
     cabbageSetValue Sbs1, iArrBas1[indx]
     cabbageSetValue Ssq2, iArrSeq2[indx]
     cabbageSetValue Srp2, iArrRep2[indx]
     cabbageSetValue Sbs2, iArrBas2[indx]
     indx += 1
    od
endin

instr copyArr1
iLenIn cabbageGetValue "steps1"
giArrSeq1[] init iLenIn
    indx = 0
    while indx < iLenIn do
    Ssq sprintf "sqsteps%d",indx
    iSeqValue cabbageGetValue Ssq
    giArrSeq1[indx] = iSeqValue
    indx += 1
    od
endin

instr copyArr2 
iLenIn cabbageGetValue "steps2"
giArrSeq2[] init iLenIn
    indx = 0
    while indx < iLenIn do
    Ssq sprintf "sqsteps%d",indx+84
    iSeqValue cabbageGetValue Ssq
    giArrSeq2[indx] = iSeqValue
    indx += 1
    od
endin


instr resetArr
SlenChn sprintf "steps%d",p4   
iLenIn cabbageGetValue SlenChn
iSteps = ((p4-1)*giSteps)*3
iLen = iLenIn+iSteps
if p4 == 1 then
iArr[] = giArrSeq1
elseif p4 == 2 then
iArr[] = giArrSeq2
endif
indx = 0
while indx < iLenIn do
     Ssq sprintf "sqsteps%d",indx+iSteps
     cabbageSetValue Ssq,iArr[indx]
indx += 1
od
endin

instr RndtWidget
SlenChn sprintf "steps%d",p4   
iLenIn cabbageGetValue SlenChn
iSteps = ((p4-1)*giSteps)*3
iLen = iLenIn+iSteps
iArrSeq[] init iLenIn
    iWrite = 0
    iRead = 1
    while iWrite < iLenIn do
    Ssq sprintf "sqsteps%d",(iRead+iSteps)
    iSeqValue cabbageGetValue Ssq
    iArrSeq[iWrite] = iSeqValue
     iWrite += 1
     iRead = (iRead+1)%iLenIn
    od
    iWrite = iSteps
    iRead = 0
    while iRead < iLenIn do
     Ssq sprintf "sqsteps%d",iWrite   
     cabbageSetValue Ssq,iArrSeq[iRead]
     iWrite += 1
     iRead += 1
    od  
endin

instr RndaWidget
SlenChn sprintf "steps%d",p4   
iLenIn cabbageGetValue SlenChn
iSteps = ((p4-1)*giSteps)*3
iLen = iLenIn+iSteps
    indx = 0
    while indx < iLenIn do
    iRnd = random:i(0, 100) > 40 ? 0 : 1
    Ssq sprintf "sqsteps%d",indx+iSteps 
    cabbageSetValue Ssq,iRnd
    indx += 1
    od
endin


instr RndiWidget
SlenChn sprintf "steps%d",p4   
iLenIn cabbageGetValue SlenChn
iSteps = ((p4-1)*giSteps)*3
iLen = iLenIn+iSteps
iRndIndx = int(random:i(iSteps, iLen))
    Ssq sprintf "sqsteps%d",iRndIndx
    iRead cabbageGetValue Ssq
    if iRead == 1 then
    iWrite = 0
    elseif iRead == 0 then
    iWrite = 1
    endif
    cabbageSetValue Ssq,iWrite
endin




instr record
SFilenames[] directory "./record", ".wav"
iLen lenarray SFilenames
print iLen
SrecordFile sprintf "record/record%d.wav", iLen
aInArr[] monitor
aIn = aInArr[0]
fout SrecordFile, 8, aIn
endin

instr Time
kTimer line 0, 1, 1
kSec = int(kTimer)
kMin init 0
kSec = kSec % 60
if kSec == 0 && changed(kSec) == 1 then
kMin += 1
endif
STimer sprintfk "%02d : %02d", kMin, kSec
cabbageSet 1, "sec", "text", STimer
endin

instr Widgets
iDurMaster = 9^9
    schedule "widgetWrite", 0, 1
    
kStart init 0
kStart cabbageGet "start"
kRecord cabbageGet "rcrd"
kSeq2Play cabbageGet "sq2"
if kStart == 1 && changed(kStart) == 1 then
schedulek "Time", 0, iDurMaster
schedulek "seq",0,iDurMaster,1
schedulek "padFx",0,iDurMaster
    if kSeq2Play == 1 then
    schedulek "seq",0,iDurMaster, 2
    endif
    if kRecord == 1 then
    schedulek "record",0,iDurMaster
    endif
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 "Time", 0, 0
turnoff2 "seq", 0,0
turnoff2 "Sound", 0,1
turnoff2 "record", 0,0
endif

if kSeq2Play == 0 && changed(kSeq2Play) == 1 then
turnoff2 "seq2",0,0
endif
    
    kTuneIn cabbageGet "tune"
    
    updatetune:
    iTuneIn = i(kTuneIn)
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
        giTune = iTune
        if changed(kTuneIn) == 1 then
        reinit updatetune
        endif
        rireturn
        
        
  kType, kChn, kNum, kData midiin
if kType == 176 && kNum >= 49 then ;;cc
	if changed(kNum, kData) == 1 then
	printks  "num=%d, value=%d\\n", -1, kNum, kData
	SCCnum sprintfk "mpad%d",(kNum-48)
	cabbageSetValue SCCnum, kData
	endif
elseif kType == 176 && kNum <= 48 then
SsliderNum sprintfk "slider%d",kNum-20
cabbageSetValue SsliderNum , kData/127
endif
    SMidiShow     sprintfk "text(%d)", kData
    cabbageSet 1, "data",SMidiShow
    SChnShow     sprintfk "text(%d)", kChn
    cabbageSet 1, "chndata",SChnShow



    if      cabbageGet:k("mpad1") == 127 && changed(cabbageGet:k("mpad1")) == 1 then
    schedulek "AmbientMachine", 0, iDurMaster
    elseif  cabbageGet:k("mpad1") == 0 && changed(cabbageGet:k("mpad1")) == 1 then
    turnoff2 "AmbientMachine", 0, 0
    turnoff2 "AmbientSound", 0, 1
    endif
 
 kPedal cabbageGet "mpad8"
; kPedal = 127
  if kPedal == 127 && changed(kPedal) == 1 then
  schedulek "hold", 0,0.1,1
  elseif kPedal == 0 && changed(kPedal) == 1 then
  schedulek "Empty",0,0.1,1
  schedulek "hold",0,0.1,0
  endif
   
   kHold cabbageGet "mpad8"
   kActive1 active 1
    if kHold == 0 && changed(kActive1) == 1 && kActive1 == 0 then
    schedulek "Empty",0,0.1
    endif
  
  kbpmOut  ctrl7 1,37,30,200
  kDurOut1 ctrl7 1,27,0.05,4
  kDurOut2 ctrl7 1,35,0.05,4
  kAttOut1 ctrl7 1,28,0.001,0.5
  kAttOut2 ctrl7 1,36,0.001,0.5
  kDV  ctrl7 1,53,0,1
  cabbageSetValue  "bpm1", kbpmOut
  cabbageSetValue  "bpm2", kbpmOut
  cabbageSetValue  "dur1", kDurOut1
  cabbageSetValue  "dur2", kDurOut2
  cabbageSetValue  "att1", kAttOut1
  cabbageSetValue  "att2", kAttOut2

kDVin cabbageGet "DV1"
kDVcopy init i(kDVin)
if kDV == 1 && changed(kDV) == 1 then
kRndDV = int(random:k(1, 5))
kDVout = kDVcopy+kRndDV
cabbageSetValue  "DV1", kDVout
cabbageSetValue  "DV2", kDVout
elseif kDV == 0 && changed(kDV) == 1 then
cabbageSetValue  "DV1", kDVcopy
cabbageSetValue  "DV2", kDVcopy
endif
endin


</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>