;v4
<Cabbage>
form caption("CoreLa")    size(1080, 615)   guiMode("queue") colour(10,45,35) pluginId("crla") ; style("legacy")
image bounds(372, 36, 20, 20) channel("metronom") colour(10, 60, 10)
texteditor bounds(46, 64, 378, 37) channel("seqarr") fontSize(27) text("1 1 2 1 2 4") colour(70, 130, 100)
combobox bounds(502, 64, 77, 37)   channel("BNote")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")  colour(49, 79, 62, 255)  value(2)
combobox bounds(470, 22, 109, 39)   channel("scale")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf") colour(49, 79, 62, 255) value(2) 
combobox bounds(502, 106, 77, 31)   channel("instrmod")   text("sine", "vco", "tri", "saw", "square")  colour(49, 79, 62, 255)  value(4)
combobox bounds(708, 356, 83, 34) channel("delayt") text("sec", "sync")  colour(49, 79, 62, 255) value(2)
label bounds(10, 64, 37, 15) channel("label1") text("seq")
hmeter bounds(694, 290, 357, 20) channel("timeline")  outlineColour(0, 0, 0, 255), overlayColour(59, 63, 59, 255)   value(1) corners(5)   outlineThickness(2) meterColour:0(139, 200, 145, 255)
combobox bounds(428, 64, 71, 37) channel("seqmod") colour(49, 79, 62, 255) text("seq", "tala", "Brk", "aRnd", "iRnd", "RndL"), value(1)
combobox bounds(428, 104, 71, 37) channel("notemod") colour(49, 79, 62, 255) text("note", "tala", "aRnd", "iRnd"), value(1)
checkbox bounds(166, 32, 25, 25) channel("hold") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), 
combobox bounds(298, 20, 71, 37) channel("wgseq") colour(49, 79, 62, 255) text("none", "Bow", "Flute", "both"), value(1)
checkbox bounds(584, 32, 25, 25) channel("ratiornd") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), 
checkbox bounds(256, 32, 25, 25) channel("drump") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255) value(1)
checkbox bounds(660, 338, 20, 20) channel("tbrs") colour:0(99, 94, 94, 255) colour:1(211, 214, 40, 255) value(1)
checkbox bounds(1024, 316, 25, 25) channel("rvrs") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), value(0)
checkbox bounds(696, 316, 25, 25) channel("strt") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), value(1)
checkbox bounds(832, 380, 20, 20) channel("rcrd") colour:0(99, 94, 94, 255) colour:1(250, 100, 100), value(0)
nslider bounds(502, 144, 88, 39) channel("swift") range(0, 0.5, 0, 1, 0.01) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("swift")
label bounds(196, 34, 47, 19) channel("label2") text("hold")
label bounds(612, 38, 37, 15) channel("labelr2") text("ratio")
label bounds(724, 320, 62, 15) channel("labelsm1") text("startRnd")
label bounds(982, 318, 37, 15) channel("labelsm2") text("rvrs")
nslider bounds(45, 11, 62, 49) channel("bpm") range(10, 210, 90, 1, 1) colour(71, 137, 100, 255) fontColour(0, 0, 0, 255)
nslider bounds(128, 30, 31, 30) channel("dv") range(1, 16, 4, 1, 1) colour(71, 137, 100, 255) fontColour(0, 0, 0, 255)
label bounds(112, 42, 10, 15) channel("label3") text("x")
label bounds(396, 24, 70, 33) channel("noteshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255), text(" ")
label bounds(44, 144, 454, 31) channel("narrshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255)text("") align("left")  
label bounds(46, 106, 377, 22) channel("sarrshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) align("left")  text("") 
label bounds(830, 10, 70, 33) channel("data")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("0")
label bounds(779, 12, 49, 31) channel("chndata")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("0")
combobox bounds(918, 344, 70, 35), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0")colour(68, 103, 63, 255) text("t2", "t1")
filebutton bounds(856, 354, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8") colour:0(68, 103, 63, 255)
filebutton bounds(990, 352, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101") colour:0(68, 103, 63, 255)
label bounds(70, 370, 90, 40) channel("data1") fontColour(245, 220, 245, 255) colour(53, 67, 60, 255) text("")
label bounds(164, 370, 90, 40) channel("data2") fontColour(245, 220, 245, 255) colour(53, 67, 60, 255)  text("")
label bounds(258, 370, 90, 40) channel("data3") fontColour(245, 220, 245, 255) colour(53, 67, 60, 255)   text("")
label bounds(352, 370, 90, 40) channel("data4") fontColour(245, 220, 245, 255) colour(53, 67, 60, 255)  text("")
nslider bounds(792, 412, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(49, 79, 62, 255)
nslider bounds(832, 412, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(49, 79, 62, 255)
nslider bounds(872, 412, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(49, 79, 62, 255)
nslider bounds(912, 412, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(49, 79, 62, 255)
label bounds(790, 46, 239, 66) channel("sec") text("00 : 08") fontColour(135, 226, 127, 255)
button bounds(910, 14, 116, 27) channel("start") text("S  T  A  R  T", "S  T  O  P") colour:0(53, 67, 60, 255) colour:1(96, 69, 69, 255) value(1)
combobox bounds(712, 402, 66, 31)  channel("tune")  text("440", "432")   value(2)  colour(49, 79, 62, 255)
vslider bounds(786, 448, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(828, 448, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(868, 448, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(910, 448, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(71, 137, 100, 255) 
nslider bounds(960, 380, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(49, 79, 62, 255) text("Master Gain (dB)")
nslider bounds(584, 64, 65, 35) channel("ratiomin") range(0.4, 2, 0.43, 1, 0.01) colour(49, 79, 62, 255) text("ratio min")
nslider bounds(584, 100, 65, 35) channel("ratiomax") range(1, 2, 1.2, 1, 0.01) colour(49, 79, 62, 255) text("ratio max")
vslider bounds(496, 216, 50, 157) channel("amp1") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("sAmp")
vslider bounds(546, 216, 50, 157) channel("amp2") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("sAmp")
vslider bounds(598, 216, 50, 157) channel("amp3") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("sAmp")
vslider bounds(624, 438, 50, 157) channel("amp4") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("sAmp")
vmeter bounds(964, 448, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(988, 448, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1012, 448, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1036, 448, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(964, 434, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(988, 434, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1012, 434, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1036, 434, 15, 15) channel("clip4") colour(0, 0, 0, 255)

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

 
opcode countValue, i,i[]
iArrIn[] xin
iLen lenarray iArrIn
indx = 0
iCountValue = 0
while indx < iLen do
	if iArrIn[indx] != 0 then
	iCountValue += 1
	endif
indx += 1
od
xout iCountValue
endop


opcode rmvZ, i[],i[]
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
iArrOut[] init iLenA
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

opcode ArrToStrgN, S,i[]
  iArrIn[] xin
  
  iArrIn rmvZ iArrIn
  
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

opcode ArrToStrgF, S,i[]
  iArrIn[] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
  iFloatTest = iArrIn[indx]-int(iArrIn[indx])
  if iFloatTest == 0 then
  Sf = "%.0f "
  elseif iFloatTest > 0 && iFloatTest < 0.1 then
  Sf = "%.1f "
  elseif iFloatTest >= 0.1 then
  Sf = "%.2f "
  endif
    Sscale     sprintf Sf,iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop
opcode ArrToStrg, S,i[]
  iArrIn[] xin
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
iLenStr strlen SIn
iReadChar = 0
iCountChr = 0
while iReadChar < iLenStr do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	if strchar(Snote,iReadChar) == 32 then
	iCountChr += 1
	endif
	od	
iReadChar += 1
od
iArrOut[] init iCountChr
iWrite = 0
iRead = 0
while iRead < iLenStr do
iCountChr = 0
iStart = iRead 
	until strchar(Snote,iRead) == 32 do
	iRead += 1
	iCountChr += 1
	od	
	Schar     strsub    Snote, iStart, iStart+iCountChr
	if strchar(Schar,0) != 0 then
	inum strtod Schar
	iArrOut[iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop



opcode arrtala, i[], i[]
 iInArr[] xin
 iLen lenarray iInArr
 iOutArr[] init iLen
 iRead = 0
 iWrite = 1
 while iRead < iLen do
 	iOutArr[iRead] = iInArr[iWrite]
	iRead += 1
	iWrite = (iWrite+1) % (iLen)
 od
 xout iOutArr
endop

opcode arrtalanote, i[], i[]i
 iInArr[],iLen xin
 iOutArr[] init lenarray(iInArr)
 iRead = 0
 iWrite = 1
 while iRead < iLen do
 	iOutArr[iRead] = iInArr[iWrite]
	iRead += 1
	iWrite = (iWrite+1) % (iLen)
 od
 xout iOutArr
endop

opcode arrbrk, i[], i[]
 iInArr[] xin
 iLen lenarray iInArr
 iOutArr[] = iInArr
 iRndIndx = int(random:i(0, iLen))
 iRndFl random -0.25, 0.25
 iOutArr[iRndIndx] = iOutArr[iRndIndx]+iRndFl
 if iOutArr[iRndIndx] <= 0.75 then
 iOutArr[iRndIndx] = 0.75
 endif
 xout iOutArr
endop

opcode rndallseq, i[], i[]
 iInArr[] xin
 iLen lenarray iInArr
 iOutArr[] init iLen
 iRead = 0
 iSeq[] fillarray 1, 2, 4
 while iRead < iLen do
    iIndxSeq = int(random:i(0,3))
 	iOutArr[iRead] = iSeq[iIndxSeq]
	iRead += 1
 od
 xout iOutArr
endop

opcode rndallnote, i[], i[]i
 iInArr[],iLen xin
 iOutArr[] init lenarray(iInArr)
 iRead = 0
 while iRead < iLen do
    iRndMidi = int(random:i(45,80))
 	iOutArr[iRead] = iRndMidi
	iRead += 1
 od
 xout iOutArr
endop

opcode rndindxseq, i[], i[]
 iInArr[] xin
 SIn cabbageGetValue "seqarr"
iOutArr[] StrToArr SIn
 
 iSeq[] fillarray 1, 2, 4
iRndSeq = int(random:i(0, lenarray(iSeq)))
iRndValue = iSeq[iRndSeq]
iRndIndx = int(random:i(0, lenarray(iOutArr)))
iOutArr[iRndIndx] = iRndValue
 xout iOutArr
endop

opcode rndindxnote, i[], i[]i
 iInArr[],iLen xin
iOutArr[] = iInArr
iRndValue = int(random:i(60, 72))
iRndIndx = int(random:i(0, iLen))
iOutArr[iRndIndx] = iRndValue
 xout iOutArr
endop

opcode arrlongrnd, i[], i[]
 iInArr[] xin
 iLen =int(random:i(8, 16))
 iOutArr[] init iLen
 iRead = 0
 iSeqArr[] fillarray 4, 8
 while iRead < iLen do
    iRndMin = int(random:i(1, 3))
    iRndSeqIndx = int(random:i(0, 2))
    iRndMax = iSeqArr[iRndSeqIndx]
    iRndValue = random:i(0, 100) < 10 ? iRndMax : iRndMin
 	iOutArr[iRead] = iRndValue
    iRndMax = int(random:i(20,50))
    iOutArr[iLen-1] = iRndMax
	iRead += 1
 od
 xout iOutArr
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



;;drum
opcode bass, a,i
iAmpIn xin
p3 = 0.15
iAmp ampdb iAmpIn
aEnv linseg 1,p3,0.001 
iFrq random 120, 150
kFrq expon iFrq,p3,30
aSound poscil aEnv*iAmp,kFrq 
xout aSound
endop


opcode snare, a,i
iAmpIn xin
p3 = 0.3
iAmp ampdb iAmpIn
aEnv expon 1, p3, 0.001
aNse noise 1, 0
iFilt random 700, 8000
aNse tone aNse, iFilt
iFrq random 100, 200
iHigh random 0, 100
kFrq expon iFrq, p3, iFrq+iHigh
aJit randomi 0.2, 1.3, 50000
aSound poscil aEnv, kFrq*aJit
iNoise random 0.01, 0.1
aSum sum aNse*iNoise, aSound
aRes comb aSum, 0.01, 0.003
aOut = aRes*iAmp*aEnv
xout aOut
endop

opcode hihat, a,i
iAmpIn xin
iAmp ampdb iAmpIn
p3 = 0.1
aEnv expon 1,p3,0.001
aNse noise aEnv, 0
iFilt random 10000, 12000
aFilt buthp aNse*iAmp*0.5, iFilt
aSound buthp aFilt, iFilt 
xout aSound
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


opcode StrSprd, S[],S
SIn xin
Snote     sprintf "%s ",SIn
iLenStr strlen SIn
iReadChar = 0
iCountChr = 0
while iReadChar < iLenStr do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	if strchar(Snote,iReadChar) == 32 then
	iCountChr += 1
	endif
	od	
iReadChar += 1
od
SArrOut[] init iCountChr
iWrite = 0
iRead = 0
while iRead < iLenStr do
iCountChr = 0
iStart = iRead 
	until strchar(Snote,iRead) == 32 do
	iRead += 1
	iCountChr += 1
	od	
Schar     strsub    Snote, iStart, iStart+iCountChr
SArrOut[iWrite] = Schar
iWrite += 1
iRead += 1
od
xout SArrOut
endop


opcode seqVis, 0, S[]
 Sarr[] xin
 indx = 0
    while indx < lenarray(Sarr) do
    StxtOut  sprintf "text(%s) visible(1)", Sarr[indx]
    Schn  sprintf "seqnum%d", indx
    cabbageSet Schn,StxtOut
    indx += 1
    od
    while indx < 16 do
    Schn  sprintf "seqnum%d", indx
    cabbageSet Schn,"visible(0)"
    indx += 1
    od
endop

opcode rngMk, k, kkk 
 kMidiIn, kMin, kMax xin 
 kMidi = kMidiIn
 		kAdd = (kMidiIn < kMin) ? (kMax-kMin) : -(kMax-kMin)
 loop:
 kMidi += kAdd
  		if  kMidiIn < kMin && kMidi < kMin goto loop
 		if  kMidiIn > kMax && kMidi > kMax goto loop
xout kMidi
endop

opcode rngMi, i, iii 
 iMidiIn, iMin, iMax xin 
 iMidi = iMidiIn
 		iAdd = (iMidiIn < iMin) ? (iMax-iMin) : -(iMax-iMin)
 loop:
 iMidi += iAdd
  		if  iMidiIn < iMin && iMidi < iMin goto loop
 		if  iMidiIn > iMax && iMidi > iMax goto loop
xout iMidi
endop

opcode rmvtxt, S,S
Sin xin
iLen strlen Sin
iArrChk[] fillarray 32,48,49,50,51,52,53,54,55,56,57
iNum1 strchar Sin, 0
iNum2 strchar Sin, iLen-1
	indxChk = 0
	iStartLetter = 0
	iEndLetter = 0
	while indxChk < lenarray(iArrChk) do
		if iNum1 == iArrChk[indxChk]  then
		iStartLetter += 1
		endif
		if iNum2 == iArrChk[indxChk]  then
		iEndLetter += 1
		endif
	indxChk += 1
	od
	if iStartLetter == 1 then
	iRmvStart = 0
	elseif iStartLetter == 0 then
	iRmvStart = 1
	endif	
	if iEndLetter == 1 then
	iRmvEnd = 0
	elseif iEndLetter == 0 then
	iRmvEnd = 1
	endif
Sout strsub Sin, iRmvStart, iLen-iRmvEnd
xout Sout
endop

giSine		ftgen       0,0,2^10,10,    1
giMyset	    ftgen       0,0,2^10,10,    1,  0.2, 0.1
ift         vco2init   -1, 10000, 0, 0, 0, giMyset



iGetMidi  nstrnum "GetMidi"
iBow      nstrnum "Bow"
iFlute    nstrnum "Flute"
iSample   nstrnum "sample"

 massign 0, 0
 massign 1,iGetMidi
 massign 3,iBow
 massign 5,iFlute
 massign 7,iSample


iLenSeq          init 32
giNoteArr[]      init iLenSeq
giNoteCopyArr[]  init iLenSeq
giNoteCopyArrZ[] init iLenSeq
giEmpty[]        init iLenSeq
giIndxNote       init 0
giTune init 0

instr GetMidi ;1
 iActive active "GetMidi"
 iHold cabbageGetValue "mpad8"
 kHold cabbageGet "mpad8"
 kRel release
 iMidi notnum
  if iActive == 1 then
  giNoteArr[] = giEmpty
  giIndxNote = 0
  endif
 giNoteArr[giIndxNote] = iMidi
 giIndxNote = (giIndxNote+1) % lenarray(giNoteArr)
 gkMaxIndx = giIndxNote
 iNoteArrShow[] rmvZ giNoteArr
 giNoteCopyArr[] = iNoteArrShow
 giNoteCopyArrZ[] = giNoteArr
 SnArrShow ArrToStrgN iNoteArrShow
     SnoteShow     sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
 if kRel == 1 && kHold == 0  then
 schedulek "rmvMidi", 0, 0.1, iMidi
 endif 
endin
instr rmvMidi ;2
 iRead = 0
    while iRead < lenarray(giNoteArr) do
        if giNoteArr[iRead] == p4 then
        giNoteArr[iRead] = 0
        endif
    iRead += 1
    od
 giNoteArr      skpZ giNoteArr
 iNoteArrShow[] rmvZ giNoteArr
 giNoteCopyArr[] = iNoteArrShow
 SnArrShow      ArrToStrgN iNoteArrShow
    SnoteShow   sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
 giIndxNote -= 1
 gkMaxIndx = giIndxNote
endin

instr seq
 kSeqMod    cabbageGet "seqmod"
 kNoteMod   cabbageGet "notemod"
 kSwift     cabbageGet "swift"
 kBPM       cabbageGet "bpm"
 kDv        cabbageGet "dv"
 kAmpdBIn   cabbageGet "ampseq"
 kPad       cabbageGet "pad"
 kDrumPlay  cabbageGet "drump"
 kwgSeq     cabbageGet "wgseq"
 kDurIn     cabbageGet "slider3"
 kFiltIn    cabbageGet "slider4"
 kFilterBs  cabbageGet "slider5"
 kActiveMidi active "GetMidi"
 kPedal cabbageGet "mpad8"
 SInn = p4
 SIn rmvtxt SInn
    SseqShow sprintf "text(%s)", SIn
    cabbageSet "seqarr",SseqShow  
    iActive active "seq"
 Sarr[] StrSprd SIn
 seqVis Sarr
 iSeqArr[] StrToArr SIn
 giSeqArr[] = iSeqArr
 kLenSeq  lenarray giSeqArr
 kLenNote lenarray giNoteArr
 kNoteIndx  init 0
 kSeqIndx   init 0
 kTime      init 1

kAmpdB rateCCk kAmpdBIn, -6, 12
kDur rateCCk kDurIn, 0.05, 4
kFilter rateCCk kFiltIn, 200, 8000
kFilterBs rateCCk kFilterBs, 0, 800


kTempo = (kBPM/60)*kDv
    if metro(1/kTime) == 1 then
    kSeq = giSeqArr[kSeqIndx]
    kSwiftRnd random kSwift*(-1), kSwift
    kTime = (kSeq/kTempo)*(1+kSwiftRnd)
        if kTime <= 0.001 then
        kTime = 0.001
        endif
    kDur = kTime*kDur
       if kSeqIndx == kLenSeq-1 && kSeqMod == 6 then
        kDur = kTime*0.5
        endif
        if kNoteIndx > (gkMaxIndx-1) then
        kNoteIndx = (gkMaxIndx-1)
        endif
    kNote = giNoteArr[kNoteIndx]
    schedulek "LED",0  ,0.1,1,kSeqIndx
    schedulek "LED",0.1,0.1,2,kSeqIndx
        if kNote != 0 then
        schedulek "seqPlay", 0, kDur, kNote, kAmpdB, kFilter
        endif
        if kNote != 0 && kSeq == 4 then
        kRndB = int(random:k(0, 100)) > 50 ? 2 : 4
        kDelayB = kTime/kRndB
           kNoteBass = kNote
			until kNoteBass < 50 do
  			kNoteBass = kNoteBass-12
  			enduntil
  kDurBass rateCCk kDurIn, 0.2, 2
        schedulek "seqSound", kDelayB, kDurBass, mtof:k(kNoteBass), kAmpdB,kFilterBs
            if kSeqMod != 6  && kDrumPlay == 1 then
;            schedulek "DrumSound", (kTime/4)+(kTime/2), 1, 3
            endif
        kNoteRep = kNote
        kDurRep rateCCk kDurIn, 0.01, 0.1
        kRep = int(random:k(2, 8))
		    until kNoteRep > 80 do
  			kNoteRep = kNoteRep+12
  		    enduntil
            kRepIndx = 0
            kDelayR = kTime/kRep
            while kRepIndx < (kRep/2) do
            schedulek "seqSound",kDelayR, kDurRep, mtof:k(kNoteRep), kAmpdB-7, kFilter
                if kSeqMod != 6  && kDrumPlay == 1 then
;                schedulek "DrumSound", kDelayR+(kTime), 1, 2
                endif
            kDelayR += (kTime/kRep)
            kRepIndx += 1
            od
        endif
    kSeqIndx = (kSeqIndx+1) % kLenSeq
    kNoteIndx = (kNoteIndx+1) % giIndxNote
        if kSeqIndx == 0 && kSeqMod == 2 then
        schedulek "tala", 0, 1
        elseif kSeqIndx == 0 && kSeqMod == 3 then
        schedulek "arrBrk", 0, 1
        elseif kSeqIndx == 0 && kSeqMod == 4 then
        schedulek "arrAllRnd", 0, 1
        elseif kSeqIndx == 0 && kSeqMod == 5 then
        schedulek "arrIndxRnd", 0, 1
        elseif kSeqIndx == 0 && kSeqMod == 6 then
        schedulek "arrLongRnd", 0, 1
        endif

        if kNoteIndx == 0 && kActiveMidi == 0 && gkMaxIndx >= 2 && kPedal == 127 then 
            if kNoteMod == 1 then
            elseif kNoteMod == 2 then
            schedulek "talaNote", 0, 1
            elseif  kNoteMod == 3 then
            schedulek "arrAllRndNote", 0, 1
            elseif kNoteMod == 4 then
            schedulek "arrIndxRndNote", 0, 1
            endif
        endif
    endif
    if metro(kTempo) == 1 && kSeqMod == 6 && kPedal == 1 && kDrumPlay == 1 then
    schedulek "DrumSound", 0, 1, 1
    endif    
    if kNote != 0 && kwgSeq != 1 then
        if kwgSeq == 2 then
        kRndInsIndx = 0
        elseif kwgSeq == 3 then
        kRndInsIndx = 1
        elseif kwgSeq == 4 then
        kRndInsIndx = int(random:k(0, 2))
        endif
        iBowInstr   nstrnum "Bow"
        iFluteInstr nstrnum "Flute"
        iwgArr[] fillarray iBowInstr, iFluteInstr
        kwgIns =  iwgArr[kRndInsIndx]
        kNotewg = kNote
        kNotewgOut rngMk kNotewg, 45, 60
        kwgTime init 1
            if metro(kTempo) == 1 then
            kwgSeqOnOff = int(random:k(0,100)) < 80 ? 0 : 1
            endif
        if metro(kwgTime) == 1 && kwgSeqOnOff == 1 then
        kwgTime random 2, 7
        kDurwg random 0.5, 1
        schedulek kwgIns+0.5, 0,kDurwg, kNotewgOut
        endif
    endif
endin



instr tala
 giSeqArr[] arrtala giSeqArr
 SnArrShow ArrToStrg giSeqArr
 Sarr[] StrSprd SnArrShow
 seqVis Sarr
endin


instr arrBrk
    giSeqArr[] arrbrk giSeqArr
    SnArrShow ArrToStrgF giSeqArr
    Sarr[] StrSprd SnArrShow
    seqVis Sarr
endin


instr arrAllRnd
    giSeqArr[] rndallseq giSeqArr
    SnArrShow ArrToStrg giSeqArr
    Sarr[] StrSprd SnArrShow
    seqVis Sarr
endin

instr arrIndxRnd
    giSeqArr[] rndindxseq giSeqArr
    SnArrShow ArrToStrg giSeqArr
    Sarr[] StrSprd SnArrShow
    seqVis Sarr
endin

instr arrLongRnd
    giSeqArr[] arrlongrnd giSeqArr
    SnArrShow ArrToStrg giSeqArr
    Sarr[] StrSprd SnArrShow
    seqVis Sarr
endin



instr talaNote
 giNoteArr[] arrtalanote giNoteArr,giIndxNote
 SnArrShow ArrToStrgN giNoteArr
 SnoteShow sprintfk "text(%s)", SnArrShow
 cabbageSet "narrshow",SnoteShow
endin


instr arrAllRndNote
    giNoteArr[] rndallnote giNoteArr,giIndxNote
    SnArrShow ArrToStrgN giNoteArr
    SnoteShow sprintfk "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
endin


instr arrIndxRndNote
    giNoteArr[] rndindxnote giNoteCopyArrZ,giIndxNote
    SnArrShow ArrToStrgN giNoteArr
    SnoteShow sprintfk "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
endin


instr LED
if p4 == 1 then
Scolor = "colour(10, 250, 10)"
ScolorFont = "fontColour(100,200,100)"
elseif p4 == 2 then
Scolor = "colour(10, 70, 10)"
ScolorFont = "fontColour(100,100,100)"
endif
cabbageSet 1,"metronom",Scolor
kndx = p5
Schn  sprintfk "seqnum%d", kndx
cabbageSet 1, Schn,ScolorFont
endin


instr Empty
iActive = p4
    if iActive == 0 then
    giNoteArr[] = giEmpty
    SnoteShow     sprintf "text(%s)", " "
    cabbageSet "narrshow",SnoteShow
    cabbageSet "noteshow",SnoteShow
    else
    endif    
endin

instr Reset
 kPedal ctrl7 15,64,0,1
    if kPedal == 0 then
    schedulek "Empty", 0, 0.1, 0
    turnoff
    endif  
 SseqIn cabbageGet "seqarr"
 iSeqArr[] StrToArr SseqIn
 giSeqArr[] = iSeqArr
    if kPedal == 1 then
    giNoteArr[] = giNoteCopyArrZ
    giIndxNote lenarray giNoteCopyArr
    iNoteArrShow[] rmvZ giNoteArr
    giIndxNote lenarray iNoteArrShow
    gkMaxIndx = giIndxNote
    SnArrShow ArrToStrgN iNoteArrShow
    SnoteShow     sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
    endif
endin


instr seqPlay
 iMidi = p4
 iBaseNoteIn    cabbageGetValue "BNote"
 iScale         cabbageGetValue "scale"
 iRatioOnOff    cabbageGetValue "ratiornd"
 iRatioMin  cabbageGetValue "ratiomin"
 iRatioMax  cabbageGetValue "ratiomax"
 iFilter = p6
 iBaseMidi,iQ   noteBase    iBaseNoteIn
 iMidiOut       noteScale   iMidi,iBaseMidi,iScale, iQ
 Snote          MtoNameInt  iMidiOut
    if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow",SnoteShow
    endif
    
    if iRatioOnOff == 0 then
    iLenWhile = 1
    iRatio = 1
    elseif iRatioOnOff = 1 then
    iLenWhile = 5
    iRatio random iRatioMin, iRatioMax
    endif
 iFrqIn mtof iMidiOut
 iAmpIn = p5-(iLenWhile*3)
 iFrq = iFrqIn
    indx = 0
    while indx < iLenWhile do
    schedule "seqSound", 0, p3, iFrq, iAmpIn, iFilter
    iFrq *= iRatio
    indx+= 1
    od
endin

instr seqSound
 iSineMod   cabbageGetValue "instrmod"
 iAttIn       cabbageGetValue "slider2"
 iFilter = p6
 iAtt rateCCi iAttIn, 0.001, 0.1
 iFrqIn = p4
 iRatio = giTune/440
 iFrq = iFrqIn*iRatio
 iAmp ampdb p5
    if iAtt >= p3*0.9 then
    iAtt = p3*0.9
    endif
 aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -6, 0
;    print iSineMod
    if iSineMod == 1  then
    iMod = 14 ;sine
    elseif iSineMod == 2  then
    iMod = 0 ;vco
    elseif iSineMod == 3 then
    iMod = 12; tria
    elseif iSineMod == 4 then
    iMod = 4 ;saw
    elseif iSineMod == 5 then
    iMod = 2 ; square
    else
    iMod = 1
    endif
    
kpw jspline 0.4, 2, 5
aSound    vco2   1,iFrq,iMod, (kpw+0.5)

 aFilt clfilt aSound, iFilter+(iFrq*0.9), 0, 10
 aFilt clfilt aFilt, 100, 1, 10
 aOut = aFilt*aEnv
 ;outall aOut
 chnmix aOut, "sndseq"
endin


instr DrumSound
iAmpdB cabbageGetValue "drumamp"
if p4 == 1 then
iDrum = int(random:i(2,4))
iMode = int(random:i(0,100)) < 5 ? 1 : iDrum
elseif p4 = 2 then
iMode = 3
elseif p4 == 3 then
iMode = 1
endif
if iMode == 1 then
aSound bass -15+iAmpdB
elseif iMode == 2 then
aSound snare -12+iAmpdB
elseif iMode == 3 then
aSound hihat -7+iAmpdB
endif
outall aSound
endin



instr padMachine
kTime init 1
kDur init 1
    if metro(1/kTime) == 1 then
    kTime random 0.5, 3
    kDur = kTime
    schedulek "padPlay", 0, kDur
    endif
endin

;schedule "padMachine", 0, 999

instr padPlay
 iBaseNoteIn cabbageGetValue "BNote"
 iScale      cabbageGetValue "scale"
 iBaseMidi,iQ noteBase iBaseNoteIn
 iMidiNote = iBaseMidi+(12*4)
 iChord = int(random:i(3, 6))
 iLenWhile = int(random:i(1, 5))
 SChordArr[] init iLenWhile
    indx = 0
    iInterval = 0
    iRndNote = int(random:i(-2, 2))
    iNote = iMidiNote+iRndNote
    iAmpdB = (-15-(iLenWhile*3))
    while indx < iLenWhile do
    iNote += iInterval
    iNote rngMi iNote, 40, 65
    iMidiOut noteScale iNote, iBaseMidi, iScale,iQ
;        SNoteOct mton iMidiOut
;        SChordArr[indx] = SNoteOct
    iMajor = int(random:i(0, 2))
    iInterval += (iChord+iMajor)
    iDelay random 0, 1
    schedule "padSound", iDelay, p3, iMidiOut, iAmpdB
    indx += 1
    ;print iMidiOut
    od
;print 1
;printarray SChordArr, 1
endin

instr padSound
 kCentIn = 0 ;cabbageGet "padcent"
 kAmpdBin cabbageGet "ambamp"
 kResSpd  = 2 ;cabbageGet "resspd"
 kTableRes = 1 ;cabbageGet "tbrs"
 kAmpdB ampdb -1
 iMidi = p4
 iFrqIn mtof iMidi
 iRatio = giTune/440
 iFrq = iFrqIn*iRatio
 iAmp ampdb p5
 kSpeedMinIn  = 2 ; cabbageGet "spdmin"
 kSpeedMaxIn   = 5 ;cabbageGet "spdmax"
 kFilter     = 800 ;cabbageGet "vcoFilt"
 kSpeedMin  rateCCk kSpeedMinIn, 1, 10
 kSpeedMax  rateCCk kSpeedMaxIn, 3, 12
 kCent1 jspline kCentIn, kSpeedMin, kSpeedMax
 kCent2 jspline kCentIn, kSpeedMin, kSpeedMax
 kFrqv = iFrq*cent(kCent1)
 kFrqm = iFrq*cent(kCent2)
 kFiltTable1 = 0
 kFiltTable2 = 0
    if kTableRes == 1 then
    iResTable ftgen 0, 0, 100, 8, 0, 40, 8, 2, 10, 5, 0, 5, 1, 30, 0
    kResRnd1 rspline 0, kResSpd, 0.4, 3
    kResRnd2 rspline 0, kResSpd, 0.4, 3
    kFiltTableIn1 table kResRnd1, iResTable
    kFiltTableIn2 table kResRnd2, iResTable
    kFiltTable1 abs kFiltTableIn1*1000
    kFiltTable2 abs kFiltTableIn2*1000
    endif
 iWaveShape = 2
 kpw jspline 0.4, 2, 5
 avco vco2 iAmp, kFrqv,iWaveShape,(kpw+0.5)
 avcoFlt clfilt avco, kFilter+kFiltTable1, 0, 10
 avcoFlt clfilt avcoFlt, 200, 1, 10
 iHarmonics random 2, 10
 aMoog	buzz iAmp, kFrqm, iHarmonics, giSine
 aMoogFlt clfilt aMoog, kFilter+kFiltTable2, 0, 10
 aMoogFlt clfilt aMoogFlt, 200, 1, 10
 kMix jspline 0.5, kSpeedMin/2, kSpeedMax/2
 aMix ntrpol  avcoFlt,aMoogFlt, kMix+0.5
 iAtt random 0.5, 1
 aEnv linsegr 0, iAtt, 1, iAtt, 0
 ;xtratim 0.1
 aOut = aMix*kAmpdB*aEnv
 ;outall aOut
 chnmix aMoog*aEnv, "sndwg"
endin



instr Bow
 cabbageSet 1,"mtrx5","colour(200, 150, 50) visible(1)"
    if release() == 1  then
    cabbageSet 1,"mtrx5","colour(70, 70, 70) visible(1)"
    endif
 iAmdB ampdb -17
 kPosIn         cabbageGet      "slider1"
 kSpeedMinIn    cabbageGet      "slider2"
 kSpeedMaxIn    cabbageGet      "slider3"
 kFilterIn      cabbageGet      "slider4"
 kCent          cabbageGet      "slider5"
 iAtt           cabbageGetValue "slider6"
 kPose          rateCCk kPosIn,         0.1,   5
 kSpeedMin      rateCCk kSpeedMinIn,    0.2,   10
 kSpeedMax      rateCCk kSpeedMaxIn,    0.7,   12
 kFilter        rateCCk kFilterIn,      400,   15000
 kCent          rateCCk kCent,      0,   500
 iAtt           rateCCi iAtt,           0.001, 0.5
 
 
 

    iRel random 0.1, 0.5
    aEnv linsegr 0, iAtt, 1, iRel, 0
	kFrq init 60
	kAmp init 0.1
	kPoseRnd init 0.025
    iMidi = p4 ;notnum
    
    iBaseNoteIn cabbageGetValue "BNote"
    iScale      cabbageGetValue "scale"
    iBaseMidi,iQ noteBase iBaseNoteIn
    iMidiOut noteScale iMidi,iBaseMidi,iScale, iQ
    
;  	iFrq mtof iMidi
    iFrqIn mtof iMidiOut
    iRatio = giTune/440
    iFrq = iFrqIn*iRatio

	kGliss jspline kCent,kSpeedMin, kSpeedMax
	kFrq = iFrq*cent(kGliss)
	iPres   random  1.5, 4.5
	kPoseRnd  rspline 0.026 ,kPose, kSpeedMin, kSpeedMax
    aSound	wgbow    iAmdB,kFrq,iPres,kPoseRnd,0,0;,giSine
    kFiltFrq = kFilter+(iFrq*0.5)
    aFilt clfilt aSound, kFiltFrq, 0, 10
    aFilt clfilt aFilt, 150, 1, 10
    aOut = aFilt*aEnv
	chnmix aOut, "sndwg"
endin


instr Flute
 cabbageSet 1,"mtrx6","colour(150, 200, 50) visible(1)"
    if release() == 1 then
    cabbageSet 1,"mtrx6","colour(70,70,70) visible(1)"
    endif
 iAmp ampdb -25
  kPosIn        cabbageGet      "slider1"
 kSpeedMinIn    cabbageGet      "slider2"
 kSpeedMaxIn    cabbageGet      "slider3"
 kFilterIn      cabbageGet      "slider4"
 kCent          cabbageGet      "slider5"
 iAtt           cabbageGetValue "slider6"
 kPose          rateCCk kPosIn,        0.085, 1
 kSpeedMin      rateCCk kSpeedMinIn,   0.1, 12
 kSpeedMax      rateCCk kSpeedMaxIn,    0.2, 18
 kFilter        rateCCk kFilterIn,      400,   12000
 kCent          rateCCk kCent,      0,   200
 iAtt           rateCCi iAtt,           0.001, 0.5
 

	kFrq init 60
	kAmp init 0.1
	kPoseRnd init 0.025
    iMidi = p4 ;notnum
  	iBaseNoteIn cabbageGetValue "BNote"
    iScale      cabbageGetValue "scale"
    iBaseMidi,iQ noteBase iBaseNoteIn
    iMidiOut noteScale iMidi,iBaseMidi,iScale, iQ
    iFrqIn mtof iMidiOut
    iRatio = giTune/440
    iFrq = iFrqIn*iRatio
	kGliss jspline kCent,kSpeedMin, kSpeedMax
	kFrq = iFrq*cent(kGliss)
iatt = 0.1
idetk = 0.1
kJet   rspline 0.085,kPose, kSpeedMin, kSpeedMax
kAir rspline 0.03, 0.15, kSpeedMin/2, kSpeedMax/2
aSound wgflute iAmp, kFrq, kJet, iatt, idetk, kAir, 0, 0;, giSine ;giMyset1
    iRel random 0.1, 0.5
    aEnv linsegr 0, iAtt, 1, iRel, 0 
    kFiltFrq = kFilter+(iFrq*0.9)
    aFilt clfilt aSound, kFiltFrq, 0, 10
    aFilt clfilt aFilt, 150, 1, 10       
    aOut = aFilt*aEnv
chnmix aOut, "sndwg"
;outall aFlute
endin




instr sample
iActive active "sample"
kAmpdBin cabbageGet "ampwg"
kAmpdB ampdb kAmpdBin-25
Sfile = "voice.wav"
iLenFile filelen Sfile
iR = 1
iRvrs cabbageGetValue "rvrs"
if iRvrs == 1 then
iR = -1
endif
iStart = 0
iSt cabbageGetValue "strt"
if iSt == 1 then
iStart = int(random:i(0, 100))/100
endif
iFox ftgen 0, 0, 0, 1, Sfile, 0 ,0 ,1
kCentIn cabbageGet "cent"
kSpdMinIn cabbageGet "spdmin"
kSpdMaxIn cabbageGet "spdmax"
kSpdMin rateCCk kSpdMinIn, 1, 7
kSpdMax rateCCk kSpdMaxIn, 3, 12
kCentRnd jspline kCentIn, kSpdMin, kSpdMax
kCent cent kCentRnd
kSpeed = kCent/(iLenFile)
aPointer phasor kSpeed*iR, iStart
aSound table aPointer,iFox, 1
krms rms aPointer, 100
    if iActive == 1 then
    cabbageSet 1, "timeline", "value" , krms
        kRel release 
        if kRel == 1 then
        cabbageSet 1, "timeline", "value" , k(0)
        aSound init 0
        aPointer init 0
        endif
    endif    
aEnv linsegr 0, 0.2, 1, 0.2, 0      
    aOut = aSound*aEnv*kAmpdB
outall aOut ;;send to FX
endin




instr FxAmb
;;wg
aIn chnget "sndwg"
aRvrb reverb2 aIn, 3, 0.5
aRvrbMix ntrpol aIn, aRvrb, 0.3
outall aRvrbMix
chnclear "sndwg"
endin




instr FxSeq
kPortTime linseg 0, 0.01, 0.0001
;;seq
kBPM            cabbageGet "bpm"
kTms            cabbageGet "dv"
kDelayTimeIn    cabbageGet "delaytseq"
kFeedback       cabbageGet "dfbseq"
kDelayMix       cabbageGet "dmixseq"
kRvrbMix        cabbageGet "rmixseq"
kSizeRvrb       cabbageGet "rsizeseq"
kRoomRvrb       cabbageGet "rroomeseq"
kDelay = 1+(int(kDelayTimeIn*5))
kTime = (1/((kBPM/60)*kTms))*kDelay
kDelayT cabbageGet "delayt"
if kDelayT == 1 then
kDelayTime = kDelayTimeIn
elseif kDelayT == 2 then
kDelayTime = kTime
endif
kPortTime linseg 0, 0.01, 0.01
kDelayTime portk kDelayTime, kPortTime
aIn chnget "sndseq"
iBufSize = 12 ;50
if kDelayTime >= iBufSize then
kDelayTime = iBufSize*0.8
endif
    aTim	interp	kDelayTime
    abuf	delayr	iBufSize
    aDelay	deltapi	aTim
    delayw	aIn + (aDelay*kFeedback)
  	aDelMix		ntrpol	 aIn,aDelay,  kDelayMix 
  aRvrb	nreverb	aIn, kSizeRvrb, kRoomRvrb
  aRvrbMix ntrpol aIn,aRvrb, kRvrbMix  
  aMixOut = (aDelMix+aRvrbMix)/2
  outall aMixOut
chnclear "sndseq"
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

instr widgetWrite   
 iX = 0
 iY = 0
 indx = 0
 ispcx = 0
 while indx < 16 do
 SKnob    sprintf "bounds(%d, %d, 70, 70),valueTextBox(0)\
 channel(\"slider%d\") range(0, 1, 0, 1, 0.01), text(%d)\
 markerColour(255, 255, 255)  trackerColour(150, 220, 150) colour(140, 150, 140)",\
 iX+30+ispcx, iY+430, indx+1, indx+1
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
 channel(\"mpad%d\") colour:0(70, 70, 70) colour:1(150, 220, 150) text()", \
 iX+710, iY+180, indx+1
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
 while indx < 96 do
 Smtrx    sprintf "bounds(%d, %d, 20, 20),\
 channel(\"mtrx%d\") colour(70, 70, 70)", \
 60+iX+ispcx, iY+200+ispcy, indx+1
 cabbageCreate "image", Smtrx 
  iX += 24
  indx += 1
    if (indx%4) == 0 then
    ispcx += 5
    endif
    if (indx%16) == 0 then
    iY += 20
    iX = 0
    ispcx = 0
    endif
    if (indx%16) == 0 then
    ispcy += 5
    endif
 od
indx init 0
while indx < 16 do
SWidget sprintf "bounds(%d, 104, 25, 25), channel(\"seqnum%d\"), text(\"%d\")\
,fontColour(100,100,100) visible(0)",indx*22+45, indx, rnd(9)
cabbageCreate "label", SWidget
indx += 1
od
endin

instr Widgets
 iDurMaster = 9^9
 kStart init 0
 kStart     cabbageGet "start"
 SseqIn     cabbageGet "seqarr"
 kRecord    cabbageGet "rcrd"
 kTuneIn    cabbageGet "tune"  
 kPedal     cabbageGet "mpad8"
 
 kActive active "GetMidi"  
    if kStart == 1 && changed(kStart) == 1  then
    schedulek "Time", 0, iDurMaster
    schedulek "seq",0,iDurMaster,SseqIn
    schedulek "FxSeq", 0.01, iDurMaster
    schedulek "FxAmb", 0.01, iDurMaster
        if kRecord == 1 then
        schedulek "record", 0.01, iDurMaster
        endif
    elseif kStart == 0 && changed(kStart) == 1 then
    turnoff2 "Time", 0, 0
    turnoff2 "seq", 0,0
    turnoff2 "FxSeq", 0,0
    turnoff2 "FxAmb", 0,0
    turnoff2 "record", 0,0
    endif
 updateSeq:
    SIn rmvtxt SseqIn
    iSeqArr[] StrToArr SIn
    giSeqArr[] = iSeqArr
    SnArrShow ArrToStrg giSeqArr
    Sarr[] StrSprd SnArrShow
    seqVis Sarr
    if changed(SseqIn) == 1 then
    reinit updateSeq
    endif
 rireturn
     
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
 SChnShow      sprintfk "text(%d)", kChn
 cabbageSet 1, "chndata",SChnShow
    if kPedal == 0 && changed(kPedal) == 1 then
    schedulek "Empty",0,0.1,kActive
    endif
    if kActive == 0 && changed(kActive) == 1 && kPedal == 0 then
    schedulek "Empty",0,0.1,kActive
    endif
  kbpmOut  ctrl7 1,37,30,200
  cabbageSetValue  "bpm", kbpmOut
endin



</CsInstruments>
<CsScore>
i "widgetWrite"  0      1
i "Widgets"      0.1   [9^9]
</CsScore>
</CsoundSynthesizer>

