;v4
<Cabbage>
form caption("CoreLa")    size(1080, 615)   guiMode("queue") colour(10,45,35) pluginId("crla") ; style("legacy")
image bounds(372, 36, 20, 20) channel("metronom") colour(10, 10, 10, 255)
texteditor bounds(46, 64, 378, 37) channel("seqarr") colour:0(71, 137, 100, 255)fontSize(27) text("1 1 2 1 2 4") colour(71, 137, 100, 255)
combobox bounds(502, 64, 77, 37)   channel("BNote")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")  colour(49, 79, 62, 255)  value(2)
combobox bounds(470, 22, 109, 39)   channel("scale")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf") colour(49, 79, 62, 255) value(2) 
combobox bounds(502, 106, 77, 31)   channel("instrmod")   text("sine", "mySet1", "mySet2", "mySet3", "mySet4", "mySet5", "mySet6")  colour(49, 79, 62, 255)  value(6)
vslider bounds(786, 448, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(828, 448, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(868, 448, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(71, 137, 100, 255) 
vslider bounds(910, 448, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(71, 137, 100, 255) 
nslider bounds(960, 380, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(49, 79, 62, 255) text("Master Gain (dB)")
hslider bounds(46, 186, 316, 40) channel("dur") range(0.1, 10, 3, 1, 0.1) trackerColour(71, 137, 100, 255) text("dur")
hslider bounds(694, 194, 222, 40) channel("vcoFilt") range(400, 1500, 500, 1, 1) trackerColour(71, 137, 100, 255) text("Filt")
hslider bounds(694, 238, 222, 40) channel("resspd") range(300, 900, 300, 1, 1) trackerColour(71, 137, 100, 255) text("resSpd")
nslider bounds(984, 234, 65, 35) channel("vcoamps") range(1, 50, 10, 1, 1) colour(49, 79, 62, 255)
hslider bounds(46, 226, 316, 40) channel("att") range(0.003, 0.3, 0.003, 1, 0.0001) trackerColour(71, 137, 100, 255) text("Att")
label bounds(440, 570, 59, 18) channel("label22") text("CC-13") fontColour(224, 219, 219, 255)
nslider bounds(430, 184, 65, 35) channel("durs") range(0.1, 10, 3, 1, 0.1) colour(49, 79, 62, 255)
nslider bounds(984, 192, 65, 35) channel("vcoFilts") range(200, 3000, 892, 1, 1) colour(49, 79, 62, 255)
nslider bounds(430, 224, 65, 35) channel("atts") range(0.0001, 1, 0.01, 1, 0.0001) colour(49, 79, 62, 255)
nslider bounds(584, 64, 65, 35) channel("ratiomin") range(0.4, 2, 0.43, 1, 0.01) colour(49, 79, 62, 255) text("ratio min")
nslider bounds(584, 100, 65, 35) channel("ratiomax") range(1, 2, 1.2, 1, 0.01) colour(49, 79, 62, 255) text("ratio max")
label bounds(592, 306, 59, 18) channel("label7") text("CC-13") fontColour(224, 219, 219, 255)
hslider bounds(46, 438, 391, 40) channel("pos") range(0, 1, 0.1, 1, 0.01) trackerColour(71, 137, 100, 255) text("pos")
hslider bounds(18, 478, 420, 40) channel("spdmin") range(0, 1, 0.4, 1, 0.01) trackerColour(71, 137, 100, 255) text("spd min")
hslider bounds(14, 518, 424, 40) channel("spdmax") range(0, 1, 0.2, 1, 0.01) trackerColour(71, 137, 100, 255) text("spd max")
hslider bounds(48, 560, 392, 40) channel("wgfilt") range(0, 1, 0.7, 1, 0.001) trackerColour(71, 137, 100, 255) text("Filt")
vslider bounds(596, 142, 50, 157) channel("ampseq") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("sAmp")
nslider bounds(504, 518, 65, 35) channel("spdmaxs") range(0, 12, 5, 1, 0.01) colour(49, 79, 62, 255)
nslider bounds(504, 478, 65, 35) channel("spdmins") range(0, 12, 0, 1, 0.01) colour(49, 79, 62, 255)
nslider bounds(504, 438, 65, 35) channel("poss") range(0, 5, 0.03, 1, 0.001) colour(49, 79, 62, 255)
nslider bounds(504, 562, 65, 35) channel("wgfilts") range(500, 15000, 700, 1, 1) colour(49, 79, 62, 255)
combobox bounds(264, 286, 83, 34) channel("delayt") text("sec", "sync")  colour(49, 79, 62, 255) value(2)
vmeter bounds(964, 448, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(988, 448, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1012, 448, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1036, 448, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(964, 434, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(988, 434, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1012, 434, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1036, 434, 15, 15) channel("clip4") colour(0, 0, 0, 255)
label bounds(10, 64, 37, 15) channel("label1") text("seq")
hmeter bounds(694, 290, 357, 20) channel("timeline")  outlineColour(0, 0, 0, 255), overlayColour(59, 63, 59, 255)   value(1) corners(5)   outlineThickness(2) meterColour:0(139, 200, 145, 255)
combobox bounds(428, 64, 71, 37) channel("seqmod") colour(49, 79, 62, 255) text("seq", "tala", "Brk", "aRnd", "iRnd", "RndL"), value(1)
combobox bounds(428, 104, 71, 37) channel("notemod") colour(49, 79, 62, 255) text("note", "tala", "aRnd", "iRnd"), value(1)
checkbox bounds(166, 32, 25, 25) channel("hold") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), 
combobox bounds(298, 20, 71, 37) channel("wgseq") colour(49, 79, 62, 255) text("none", "Bow", "Flute", "both"), value(1)
checkbox bounds(584, 32, 25, 25) channel("ratiornd") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), 
checkbox bounds(704, 162, 25, 25) channel("vcopad") colour:0(99, 94, 94, 255) colour:1(214, 40, 149, 255), 
checkbox bounds(704, 132, 25, 25) channel("analogpad") colour:0(99, 94, 94, 255) colour:1(66, 204, 221, 255), 
checkbox bounds(256, 32, 25, 25) channel("drump") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255) value(1)
checkbox bounds(672, 248, 20, 20) channel("tbrs") colour:0(99, 94, 94, 255) colour:1(211, 214, 40, 255) value(1)
checkbox bounds(1024, 316, 25, 25) channel("rvrs") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), value(0)
checkbox bounds(696, 316, 25, 25) channel("strt") colour:0(99, 94, 94, 255) colour:1(71, 137, 100, 255), value(1)
checkbox bounds(832, 380, 20, 20) channel("rcrd") colour:0(99, 94, 94, 255) colour:1(250, 100, 100), value(0)

label bounds(732, 164, 40, 18) channel("labelpad") text("vco")
label bounds(732, 136, 46, 13) channel("labelpad2") text("analog")
nslider bounds(784, 134, 63, 53) channel("padcent") range(0, 500, 0, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("Pad Cent")
nslider bounds(984, 134, 63, 53) channel("ambamp") range(-20, 10, -3, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("Pad Amp")
nslider bounds(920, 134, 63, 53) channel("analogamp") range(-20, 10, -3, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("anlg Amp")
nslider bounds(514, 192, 63, 53) channel("drumamp") range(-20, 10, 0, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("DrumAmp")
nslider bounds(502, 144, 88, 39) channel("swift") range(0, 0.5, 0, 1, 0.01) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("swift")
label bounds(852, 170, 59, 18) channel("label25") text("CC-00") fontColour(224, 219, 219, 255)
nslider bounds(264, 322, 83, 39) channel("seqfilt") range(350, 15000, 800, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("Filt")
label bounds(196, 34, 47, 19) channel("label2") text("hold")
label bounds(612, 38, 37, 15) channel("labelr2") text("ratio")
label bounds(724, 320, 62, 15) channel("labelsm1") text("startRnd")
label bounds(982, 318, 37, 15) channel("labelsm2") text("rvrs")
nslider bounds(45, 11, 62, 49) channel("bpm") range(10, 210, 90, 1, 1) colour(71, 137, 100, 255) fontColour(0, 0, 0, 255)
nslider bounds(128, 30, 31, 30) channel("dv") range(1, 16, 4, 1, 1) colour(71, 137, 100, 255) fontColour(0, 0, 0, 255)
label bounds(112, 42, 10, 15) channel("label3") text("x")
label bounds(922, 202, 59, 18) channel("labelv2") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(924, 246, 59, 18) channel("labelv3") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(366, 198, 59, 18) channel("label5") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(366, 236, 59, 18) channel("label80") text("CC-11") fontColour(224, 219, 219, 255)
label bounds(396, 24, 70, 33) channel("noteshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255), text(" ")
label bounds(44, 144, 454, 31) channel("narrshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) align("left")  text("")
label bounds(46, 106, 377, 22) channel("sarrshow")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) align("left") text("")  
label bounds(830, 10, 70, 33) channel("data")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("0")
label bounds(779, 12, 49, 31) channel("chndata")  fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("0")
label bounds(442, 450, 59, 18) channel("label9") text("CC-11") fontColour(224, 219, 219, 255)
label bounds(440, 486, 59, 18) channel("label12") text("CC-07") fontColour(224, 219, 219, 255)
label bounds(576, 474, 59, 18) channel("label17") text("CC-00") fontColour(224, 219, 219, 255)
label bounds(440, 528, 59, 18) channel("label13") text("CC-15") fontColour(224, 219, 219, 255)
combobox bounds(918, 344, 70, 35), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0")colour(68, 103, 63, 255) text("t2", "t1")
filebutton bounds(856, 354, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8") colour:0(68, 103, 63, 255)
filebutton bounds(990, 352, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101") colour:0(68, 103, 63, 255)
nslider bounds(574, 418, 64, 52) channel("cent") range(0, 500, 0, 1, 1) colour(49, 79, 62, 255) fontColour(176, 231, 182, 255) text("Vib Cent")
vslider bounds(644, 398, 50, 196) channel("ampwg") range(0, 20, 10, 1, 1) trackerColour(71, 137, 100, 255) text("wgAmp")
nslider bounds(792, 412, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(49, 79, 62, 255)
nslider bounds(832, 412, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(49, 79, 62, 255)
nslider bounds(872, 412, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(49, 79, 62, 255)
nslider bounds(912, 412, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(49, 79, 62, 255)
label bounds(790, 46, 239, 66) channel("sec") text("00 : 08") fontColour(135, 226, 127, 255)
button bounds(910, 14, 116, 27) channel("start") text("S  T  A  R  T", "S  T  O  P") colour:0(53, 67, 60, 255) colour:1(96, 69, 69, 255) value(1)
combobox bounds(704, 78, 66, 31)  channel("tune")  text("440", "432")   value(2)  colour(49, 79, 62, 255)

image bounds(54, 400, 30, 30) channel("bowlight") corners(5) colour(53, 67, 60, 255)
image bounds(138, 400, 30, 30) channel("flutelight") corners(5) colour(53, 67, 60, 255)
label bounds(174, 400, 30, 30) channel("activeflute") corners(5) fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("")
label bounds(88, 400, 30, 30) channel("activestring") corners(5) fontColour(135, 226, 127, 255) colour(53, 67, 60, 255) text("")
rslider bounds(352, 284, 70, 70) channel("delaytseq") range(0.1, 2, 1.5, 1, 0.001)trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("delayT")
rslider bounds(422, 284, 70, 70) channel("dfbseq") range(0, 1, 0.2, 1, 0.01)trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("fb")
rslider bounds(492, 284, 70, 70) channel("dmixseq") range(0, 1, 0.3, 1, 0.01) trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("mix")
rslider bounds(120, 284, 70, 70) channel("rroomeseq") range(0.1, 0.9, 0.8, 1, 0.01) trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("room")
rslider bounds(50, 284, 70, 70) channel("rsizeseq") range(0.1, 5, 0.5, 1, 0.1) trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("size")
rslider bounds(190, 284, 70, 70) channel("rmixseq") range(0, 1, 0.3, 1, 0.01) trackerColour(96, 173, 99, 255) colour(160, 192, 167, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("mix")
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

 
opcode CsdMeter, 0, SakS
 SClip, aSig, kTrig, Smeter	xin
 iDbRange = 60
 iHoldTim = 0.5
 kOn init 0
 kTim init 0
 kStart init 0
 kEnd init 0
 kMax max_k aSig, kTrig, 1
 cabbageSetValue Smeter, kMax, metro(20)
 if kTrig == 1 then
 kMeter = (iDbRange + dbfsamp(kMax)) / iDbRange
  if kOn == 0 && kMax > 1 then
   kTim = 0
   kEnd = iHoldTim
   cabbageSet 1,SClip,"colour(250,0, 0)"
   kOn = 1
  endif
  if kOn == 1 && kTim > kEnd then
   cabbageSet 1,SClip,"colour(0,0,0)"
   kOn =	0
  endif
 endif
 kTim += ksmps/sr
endop

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

opcode PchSh,a,ak
aIn, kPitch xin
iFFTsize = 1024
 ioverlap = iFFTsize/8
 ;;Pitch
 fSound pvsanal aIn, iFFTsize, ioverlap, iFFTsize, 1
 fTranspose pvscale fSound, cent(kPitch)
 aOut pvsynth fTranspose
xout aOut
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
giMyset1	ftgen       0,0,2^10,10,    1,  0.2, 0.1
giMyset2	ftgen       0,0,2^10,10,    1,  0,   0.2,   0,   0.1
giMyset3    ftgen       0,0,2^10,9,     1,  3,   0,3,   1,   0,   9,      0.333,  180
giMyset4    ftgen		0,0,2^10,10,    1,  0.7, 0,     0.3, 0,   0,      0.3
giMyset5    ftgen		0,0,2^10,10,    1,  1/8, 1/5,   0,   0,   1/4,    1/2,    1/8
giMyset6	ftgen	    0,0,2^10,10,    1,  0.1, 0.5,   0.8, 0.1, 0.5,0.8

 massign 1,1
 massign 3,24
 massign 5,25
 massign 7,26
 massign 16,29
 
 massign 2,0
 massign 4,0
 massign 6,0
 massign 8,0
 massign 9,0
 massign 10,0
 massign 11,0
 massign 12,0
 massign 13,0
 massign 14,0
 massign 15,0

iLenSeq          init 32
giNoteArr[]      init iLenSeq
giNoteCopyArr[]  init iLenSeq
giNoteCopyArrZ[] init iLenSeq
giEmpty[]        init iLenSeq
giIndxNote       init 0

  gkSeqBow init 0
  gkSeqFlute init 0 

instr GetMidi ;1
 iActive active "GetMidi"
 iHold cabbageGetValue "hold"
 kHold cabbageGet "hold"
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
; puts SnArrShow,1
; printarray giNoteCopyArr,"%d","Notes:"
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
 giNoteArr skpZ giNoteArr
  iNoteArrShow[] rmvZ giNoteArr
   giNoteCopyArr[] = iNoteArrShow
 SnArrShow ArrToStrgN iNoteArrShow
      SnoteShow     sprintf "text(%s)", SnArrShow
    cabbageSet "narrshow",SnoteShow
; puts SnArrShow,1 
; printarray giNoteArr,"%d","Notes(R):"
 giIndxNote -= 1
 gkMaxIndx = giIndxNote
endin

instr seq
kSeqMod cabbageGet "seqmod"
kNoteMod cabbageGet "notemod"
kRatio cabbageGet "ratiornd"
kActiveMidi active "GetMidi"
kPedal ctrl7 15,64,0,1
SInn = p4
SIn rmvtxt SInn
    puts SIn,1
    SseqShow sprintf "text(%s)", SIn
    cabbageSet "seqarr",SseqShow  
    iActive active "seq"
    print iActive
Sarr[] StrSprd SIn
seqVis Sarr
iSeqArr[] StrToArr SIn
giSeqArr[] = iSeqArr
kLenSeq lenarray giSeqArr
kLenNote lenarray giNoteArr
kSwift cabbageGet "swift"
kNoteIndx init 0
kSeqIndx init 0
kTime init 1
kBPM cabbageGet "bpm"
kDv cabbageGet "dv"
kDurIn cabbageGet "dur"
kAmpdBIn cabbageGet "ampseq"
kPad cabbageGet "pad"
kRatioMin cabbageGet "ratiomin"
kRatioMax cabbageGet "ratiomax"
kDrumPlay cabbageGet "drump"
kPedal ctrl7 15,64,0,1
kAmpdB = kAmpdBIn-25
kTempo = (kBPM/60)*kDv
    if metro(1/kTime) == 1 then
    kSeq = giSeqArr[kSeqIndx]
    kSwiftRnd random kSwift*(-1), kSwift
    kTime = (kSeq/kTempo)*(1+kSwiftRnd)
        if kTime <= 0.001 then
        kTime = 0.001
        endif
        if kRatio == 1 then
        kRatioLen = int(random:k(2, 7))
        kRndFrqRatio random kRatioMin, kRatioMax
        elseif kRatio == 0 then
        kRatioLen = 1
        kRndFrqRatio = 1
        endif
    kDur = kTime*kDurIn
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
        schedulek "soundPlay", 0, kDur, kNote, kAmpdB, kRndFrqRatio, kRatioLen
;        schedulek "Bow", 0, kDur, kNote-12
        endif
        if kNote != 0 && kSeq == 4 then
        kRndB = int(random:k(0, 100)) > 50 ? 2 : 4
        kDelayB = kTime/kRndB
           kNoteBass = kNote
			until kNoteBass < 45 do
  			kNoteBass = kNoteBass-12
  			enduntil
        schedulek "soundPlay", kDelayB, kDur*0.6, kNoteBass, kAmpdB-3, kRndFrqRatio, kRatioLen
            if kSeqMod != 6  && kDrumPlay == 1 then
            schedulek "DrumSound", (kTime/4)+(kTime/2), 1, 3
            endif
        kNoteRep = kNote
        kRep = int(random:k(2, 8))
		    until kNoteRep > 80 do
  			kNoteRep = kNoteRep+12
  		    enduntil
            kRepIndx = 0
            kDelayR = kTime/kRep
            while kRepIndx < (kRep/2) do
            schedulek "soundPlay",kDelayR, 0.1, kNoteRep, kAmpdB-7,kRndFrqRatio, kRatioLen
                if kSeqMod != 6  && kDrumPlay == 1 then
                schedulek "DrumSound", kDelayR+(kTime), 1, 2
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
        if kNoteIndx == 0 && kActiveMidi == 0 && gkMaxIndx >= 2 && kPedal == 1 then 
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
    kwgSeq cabbageGet "wgseq"
        if kwgSeq == 1 then
        gkSeqBow = 0
        gkSeqFlute = 0
        endif
    if kNote != 0 && kwgSeq != 1 then
        if kwgSeq == 2 then
        kRndInsIndx = 0
        elseif kwgSeq == 3 then
        kRndInsIndx = 1
        elseif kwgSeq == 4 then
        kRndInsIndx = int(random:k(0, 2))
        endif
        if kRndInsIndx == 0 then
        gkSeqBow = 1
        gkSeqFlute = 0
        kWgMin = 35
        kWgMax = 60
        elseif kRndInsIndx == 1 then
        gkSeqBow = 0
        gkSeqFlute = 1
        kWgMin = 45
        kWgMax = 60
        endif
        SwgArr[] fillarray "Bow", "Flute"
        SwgIns =  SwgArr[kRndInsIndx]
        kNotewg = kNote
            until kNotewg < kWgMin do
  	        kNotewg = kNotewg-12
  	        enduntil
  	        until kNotewg > kWgMax do
  	        kNotewg = kNotewg+12
  	        enduntil
        kwgTime init 1
            if metro(kTempo) == 1 then
            kwgSeqOnOff = int(random:k(0,100)) < 80 ? 0 : 1
            endif
        if metro(kwgTime) == 1 && kwgSeqOnOff == 1 then
        kwgTime random 2, 7
        kDurwg random 0.5, 1
        schedulek SwgIns, 0,kDurwg, kNotewg
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
Scolor = "colour(10, 10, 10)"
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


instr soundPlay
iMidi = p4
iBaseNoteIn cabbageGetValue "BNote"
iScale      cabbageGetValue "scale"

iBaseMidi,iQ noteBase iBaseNoteIn
iMidiOut noteScale iMidi,iBaseMidi,iScale, iQ
Snote MtoNameInt iMidiOut
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow",SnoteShow
endif


iMod cabbageGetValue "instrmod"
if iMod == 1 then
giWave = giSine
elseif iMod == 2 then
giWave = giMyset1
elseif iMod == 3 then
giWave = giMyset2
elseif iMod == 4 then
giWave = giMyset3
elseif iMod == 5 then
giWave = giMyset4
elseif iMod == 6 then
giWave = giMyset5
elseif iMod == 7 then
giWave = giMyset6
endif

iFrqIn mtof iMidiOut
iTuneIn cabbageGetValue "tune"
    if iTuneIn == 1 then
    iTune = 440
    elseif iTuneIn == 2 then
    iTune = 432
    endif
iRatio = iTune/440
iFrq = iFrqIn*iRatio

iAmpIn = p5-(p7*3)
iRndFrqRatio = p6
iFrqOut = iFrq
indx = 0
while indx < p7 do
;iAmp random iAmpIn, iAmpIn+5
schedule "SoundSine", 0, p3, iFrqOut, iAmpIn
iFrqOut *= iRndFrqRatio
indx+= 1
od
endin

instr SoundSine
iFrq = p4
iAtt cabbageGetValue "att"
iAmp ampdb p5
    if iAtt >= p3*0.9 then
    iAtt = p3*0.9
    endif
aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -6, 0
aSound poscil aEnv, iFrq, giWave

iFiltIn cabbageGetValue "seqfilt"
iFilt = iFiltIn+(iFrq*0.5)
print iFilt
aFilt clfilt aSound, iFilt, 0, 10
aFilt clfilt aFilt, 150, 1, 10
aOut = aFilt
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



instr VCOMachine
kBPM cabbageGet "bpm"
kTempo = (kBPM/60)
;printk2 kTempo
kTime init 1
kDur init 1
    if metro(1/kTime) == 1 then
    kTime random 5, 12
    kDur = kTime
    schedulek "VCOPlay", 0, kDur
    endif
endin


instr VCOPlay
iBaseNoteIn cabbageGetValue "BNote"
iScale      cabbageGetValue "scale"
iBaseMidi,iQ noteBase iBaseNoteIn
iMidiNote = iBaseMidi+(12*4)
iChord = int(random:i(3, 6))
iNumber = int(random:i(1, 5))
SChordArr[] init iNumber
indx = 0
iInterval = 0
iRndNote = int(random:i(-2, 2))
iNote = iMidiNote+iRndNote
iAmpdB = (-15-(iNumber*3))
while indx < iNumber do
iNote += iInterval
    until iNote < 65 do
  	iNote = iNote-12
  	enduntil
  	until iNote > 40 do
  	iNote = iNote+12
  	enduntil
iMidiOut noteScale iNote, iBaseMidi, iScale,iQ
    SNoteOct mton iMidiOut
    SChordArr[indx] = SNoteOct
iMajor = int(random:i(0, 2))
iInterval += (iChord+iMajor)
iDelay random 0, 1
schedule "VCOSound", iDelay, p3, iMidiOut, iAmpdB
indx += 1
;print iMidiOut
od
;print 1
printarray SChordArr, 1
endin

instr VCOSound
 kVCO ctrl7 10, 58, 0, 1
 if kVCO == 0 then
; turnoff
 endif
kCentIn cabbageGet "padcent"
kAmpdBin cabbageGet "ambamp"
kAmpdB ampdb kAmpdBin
iMidi = p4
iFrqIn mtof iMidi
iTuneIn cabbageGetValue "tune"
    if iTuneIn == 1 then
    iTune = 440
    elseif iTuneIn == 2 then
    iTune = 432
    endif
iRatio = iTune/440
iFrq = iFrqIn*iRatio



iAmp ampdb p5
kSpeedMinIn   cabbageGet "spdmin"
kSpeedMaxIn   cabbageGet "spdmax"
kFilter     cabbageGet "vcoFilt"
kSpeedMin  rateCCk kSpeedMinIn, 1, 10
kSpeedMax  rateCCk kSpeedMaxIn, 3, 12
cabbageSetValue "spdmins",  kSpeedMin
cabbageSetValue "spdmaxs",  kSpeedMax
cabbageSetValue "vcoFilts",  kFilter
kCent1 jspline kCentIn, kSpeedMin, kSpeedMax
kCent2 jspline kCentIn, kSpeedMin, kSpeedMax
kFrqv = iFrq*cent(kCent1)
kFrqm = iFrq*cent(kCent2)
kResSpd cabbageGet "resspd"
kTableRes cabbageGet "tbrs"
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
avco vco2 iAmp, kFrqv,0,0.5
avcoFlt clfilt avco, kFilter+kFiltTable1, 0, 10
avcoFlt clfilt avcoFlt, 200, 1, 10
iHarmonics random 2, 10
aMoog	buzz iAmp, kFrqm, iHarmonics, giSine
aMoogFlt clfilt aMoog, kFilter+kFiltTable2, 0, 10
aMoogFlt clfilt aMoogFlt, 200, 1, 10
kMix jspline 0.5, kSpeedMin/2, kSpeedMax/2
aMix ntrpol  avcoFlt,aMoogFlt, kMix+0.5
iAtt random 0.5, 1
aEnvR linsegr 0, iAtt, 1, iAtt, 0
;xtratim 0.1
aOut = aMix*kAmpdB*aEnvR
;outall aOut
chnmix aOut, "sndwg"
endin


instr AnalogMachine
kTime init 1
if metro(1/kTime) == 1 then
kTime random 10, 20
kDur = kTime*1.2
schedulek "AnalogPlay", 0, kDur
endif
endin

instr AnalogPlay
indx = 0
iBaseFrq random 120, 700
iFrq = iBaseFrq
iRndLen = int(random:i( 4, 8))
iRndArr[] init iRndLen
iAmpdB = -3
while indx < iRndLen do
schedule "AnalogSound", 0, p3, iFrq, iBaseFrq, iAmpdB-(iRndLen*3)
iRndCent random 50, 200
iFrq += iBaseFrq*cent(iRndCent)
indx += 1
od
endin


instr AnalogSound
kAmpdBin    cabbageGet "analogamp"
kAmpdB      ampdb kAmpdBin+p6
;iAmpdB      ampdb p6
iCent       random 10, 200
kCent       jspline iCent, 0.2, 0.7
kFrq = p4*cent(kCent)
kAmp        rspline 0, 1, 0.3, 0.7
kAmp1       rspline 0, 1, 0.3, 0.7
kAmp2       rspline 0, 1, 0.7, 2
aSound      poscil kAmp, kFrq
kRndAm1     rspline 0.1, 0.3, 0.4, 0.7
kRndFm1     rspline 0.7, 1.5, 0.7, 2
kRndAm2     rspline 0.2, 0.7, 0.4, 0.7
kRndFm2     rspline 0.7, 3, 0.4, 0.7
iRndFm1     random 2, 10
iRndFm2     random 2, 10
aFm1        poscil p4/iRndFm1*kRndAm1, p5/iRndFm2*kRndFm1
aFm2        poscil p4/iRndFm2*kRndAm2, p5/iRndFm1*kRndFm2
a1          poscil kAmp1, p5*cent(kCent)+aFm1
a2          poscil kAmp2, p5*cent(kCent)+aFm2
iDel        random 0.1, 0.5
 	aTim	interp	iDel
 	abuf	delayr	3
 	ad	    deltapi	aTim	
 	        delayw	-a1*a2 + (ad*0.3)
aSound *= ad

iMode = int(random:i(1, 3))
if iMode == 1 then
iFrqRnd random 400, 500
aRing poscil 1, iFrqRnd
elseif iMode == 2 then
aRing init 1
endif	
	kFilter     cabbageGet "vcoFilt"
	kResSpd     cabbageGet "resspd"
    kTableRes   cabbageGet "tbrs"
    kFiltTable = 0
    if kTableRes == 1 then
    iResTable ftgen 0, 0, 100, 8, 0, 40, 8, 2, 10, 5, 0, 5, 1, 30, 0
    kResRnd rspline 0, kResSpd, 0.4, 3
    kFiltTableIn table kResRnd, iResTable
    kFiltTable abs kFiltTableIn*1000
    endif
    iAtt random 0.3, 0.7
    iRel random 0.1, 0.5
    aEnv linsegr 0, iAtt, 1, iRel, 0
	aFilt tone aSound*aRing, kFilter+kFiltTable
	aFilt clfilt aFilt, 150, 1, 10	
aOut = aFilt*kAmpdB*aEnv
chnmix aOut, "sndwg"
endin


instr Bow
iActive active p1
cabbageSet 1,"bowlight","colour(200, 150, 50) visible(1)"
Sactive     sprintf "text(%d)", iActive
cabbageSet "activestring",Sactive
kRelease release
    if kRelease == 1  then
    cabbageSet 1,"bowlight","colour(53, 67, 60, 255) visible(1)"
    endif
    iAtt random 0.1, 0.5
    iRel random 0.1, 0.5
if p3 == -1 then
      if gkSeqBow == 1 then
      turnoff
      endif
aEnv linsegr 0, iAtt, 1, iRel, 0
elseif p3 != -1 then
aEnv transeg 0, iAtt, 1, 1, p3-iAtt, 6, 0
endif
kGainWGIn cabbageGet "ampwg"
kGainWG = ampdb:k(kGainWGIn-20)
iAmdB ampdb -17
kPosIn        cabbageGet "pos"
kSpeedMinIn   cabbageGet "spdmin"
kSpeedMaxIn   cabbageGet "spdmax"
kFilterIn     cabbageGet "wgfilt"
kPose     rateCCk kPosIn, 0.1,2
kSpeedMin rateCCk kSpeedMinIn, 0.2, 10
kSpeedMax rateCCk kSpeedMaxIn, 0.7, 12
kFilter   rateCCk kFilterIn, 400, 15000
cabbageSetValue "poss",     kPose
cabbageSetValue "spdmins",  kSpeedMin
cabbageSetValue "spdmaxs",  kSpeedMax
cabbageSetValue "wgfilts",  kFilter
	kFrq init 60
	kAmp init 0.1
	kPoseRnd init 0.025
    iMidi = p4 ;notnum
;  	iFrq mtof iMidi
    iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
    iRatio = iTune/440
    iFrq = iFrqIn*iRatio

    kCent cabbageGet "cent"
	kGliss jspline kCent,kSpeedMin, kSpeedMax
	kFrq = iFrq*cent(kGliss)
	iPres   random  1.5, 4.5
	kPoseRnd  rspline 0.026 ,kPose, kSpeedMin, kSpeedMax
    aSound	wgbow    iAmdB,kFrq,iPres,kPoseRnd,0,0;,giSine
    kFiltFrq = kFilter+(iFrq*0.5)
    aFilt clfilt aSound, kFiltFrq, 0, 10
    aFilt clfilt aFilt, 150, 1, 10
    aOut = aFilt*aEnv*kGainWG
	chnmix aOut, "sndwg"
endin


instr Flute
iActive active p1
cabbageSet 1,"flutelight","colour(150, 200, 50) visible(1)"
Sactive     sprintf "text(%d)", iActive
cabbageSet "activeflute",Sactive
kRelease release
    if kRelease == 1  then
    cabbageSet 1,"flutelight","colour(53, 67, 60, 255) visible(1)"
    endif
kGainWGIn cabbageGet "ampwg"
kGainWG = ampdb:k(kGainWGIn-20)
iGaindB ampdb -15
kPosIn        cabbageGet "pos"
kSpeedMinIn   cabbageGet "spdmin"
kSpeedMaxIn   cabbageGet "spdmax"
kFilterIn     cabbageGet "wgfilt"
kPose      rateCCk kPosIn, 0.085, 1
kSpeedMin  rateCCk kSpeedMinIn, 0.1, 7
kSpeedMax  rateCCk kSpeedMaxIn, 0.2, 10
kFilter    rateCCk kFilterIn, 400, 12000
cabbageSetValue "poss",     kPose
cabbageSetValue "spdmins",  kSpeedMin
cabbageSetValue "spdmaxs",  kSpeedMax
cabbageSetValue "wgfilts",  kFilter
	kFrq init 60
	kAmp init 0.1
	kPoseRnd init 0.025
    iMidi = p4 ;notnum
;  	iFrq mtof iNum
    iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
    iRatio = iTune/440
    iFrq = iFrqIn*iRatio
    kCent cabbageGet "cent"
	kGliss jspline kCent,kSpeedMin, kSpeedMax
	kFrq = iFrq*cent(kGliss)
iatt = 0.1
idetk = 0.1
kJet   rspline 0.085,kPose, kSpeedMin, kSpeedMax
kAir rspline 0.03, 0.15, kSpeedMin/2, kSpeedMax/2
aSound wgflute iGaindB, kFrq, kJet, iatt, idetk, kAir, 0, 0;, giSine ;giMyset1
    iAtt random 0.1, 0.5
    iRel random 0.1, 0.5
if p3 == -1 then
      if gkSeqFlute == 1 then
      turnoff
      endif
aEnv linsegr 0, iAtt, 1, iRel, 0
elseif p3 != -1 then
aEnv transeg 0, iAtt, 4, 1, p3-iAtt, -6, 0
endif    
    kFiltFrq = kFilter+(iFrq*0.5)
    aFilt clfilt aSound, kFiltFrq, 0, 10
    aFilt clfilt aFilt, 150, 1, 10       
    aOut = aFilt*kGainWG*aEnv
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

gkSpeaker1 init -45
gkSpeaker2 init -45
gkSpeaker3 init -60
gkSpeaker4 init -60

gkSpkrCopy1 init -45
gkSpkrCopy2 init -45
gkSpkrCopy3 init -60
gkSpkrCopy4 init -60


instr Speaker
iMidi notnum
iVel veloc
iSpeed = 20
iStart1 = i(gkSpeaker1)
iStart2 = i(gkSpeaker2)
iStart3 = i(gkSpeaker3)
iStart4 = i(gkSpeaker4)

iBaseMidi = 60


if iMidi == iBaseMidi+1 then
print rnd(9)
gkSpeaker1 = gkSpkrCopy1
gkSpeaker2 = gkSpkrCopy2
gkSpeaker3 = gkSpkrCopy3
gkSpeaker4 = gkSpkrCopy4
endif

if iMidi == iBaseMidi then
gkSpeaker1 = int(line:k(iStart1, 1/iSpeed, iStart1-1))
elseif iMidi == iBaseMidi+2 then
gkSpeaker1 = int(line:k(iStart1, 1/iSpeed, iStart1+1))
endif
if iMidi == iBaseMidi+4 then
gkSpeaker2 = int(line:k(iStart2, 1/iSpeed, iStart2-1))
elseif iMidi == iBaseMidi+5 then
gkSpeaker2 = int(line:k(iStart2, 1/iSpeed, iStart2+1))
endif
if iMidi == iBaseMidi+7 then
gkSpeaker3 = int(line:k(iStart3, 1/iSpeed, iStart3-1))
elseif iMidi == iBaseMidi+9 then
gkSpeaker3 = int(line:k(iStart3, 1/iSpeed, iStart3+1))
endif
if iMidi == iBaseMidi+11 then
gkSpeaker4 = int(line:k(iStart4, 1/iSpeed, iStart4-1))
elseif iMidi == iBaseMidi+12 then
gkSpeaker4 = int(line:k(iStart4, 1/iSpeed, iStart4+1))
endif
cabbageSetValue  "out1", gkSpeaker1+65
cabbageSetValue  "outn1", gkSpeaker1
cabbageSetValue  "out2", gkSpeaker2+65
cabbageSetValue  "outn2", gkSpeaker2
cabbageSetValue  "out3", gkSpeaker3+65
cabbageSetValue  "outn3", gkSpeaker3
cabbageSetValue  "out4", gkSpeaker4+65
cabbageSetValue  "outn4", gkSpeaker4
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




instr widgetCrt
indx init 0
while indx < 16 do
SWidget sprintf "bounds(%d, 104, 25, 25), channel(\"seqnum%d\"), text(\"%d\"),fontColour(100,100,100) visible(0)",\
indx*22+45, indx, rnd(9)
cabbageCreate "label", SWidget
indx += 1
od
endin
schedule "widgetCrt", 0.01, 1

instr Widgets
iDurMaster = 9^9
kStart init 0
kStart cabbageGet "start"
SseqIn cabbageGet "seqarr"
kRecord cabbageGet "rcrd"
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
 kActive active "GetMidi"
 ;;bow setting
 kPos   ctrl7    2,31,0.025,2
    if changed(kPos) == 1 then
;    cabbageSetValue  "pos", kPos
    endif   
 kSpeedMin   ctrl7    2,27,0.7,5 
    if changed(kSpeedMin) == 1 then
;    cabbageSetValue "spdmin", kSpeedMin
    endif
 kSpeedMax   ctrl7     2,35,1,12
    if changed(kSpeedMax) == 1 then
;    cabbageSetValue  "spdmax", kSpeedMax
    endif   
  kCent   ctrl7     2,0,0,500
    if changed(kCent) == 1 then
    cabbageSetValue  "cent", kCent
    endif     
  kwgFilter   ctrl7     2,33,500,7000
    if changed(kwgFilter) == 1 then
;    cabbageSetValue  "wgfilt", kBowFilter
    endif
 kAmpWG   ctrl7    2,29,0,20
    if changed(kAmpWG) == 1 then
    cabbageSetValue  "ampwg", kAmpWG
    endif
    
;;Ambient
 kStartVCO cabbageGet "vcopad"
; kStartVCO ctrl7 10, 58, 0, 1
 if kStartVCO == 1 && changed(kStartVCO) == 1 then
 schedulek "VCOMachine", 0, iDurMaster
 cabbageSetValue  "vcopad", k(1)
 elseif kStartVCO == 0 && changed(kStartVCO) == 1 then
 turnoff2 "VCOMachine", 0, 0
 turnoff2 "VCOPlay", 0, 0
 turnoff2 "VCOSound", 0, 1
 cabbageSetValue  "vcopad", k(0)
 endif
 
 kStartAnalog ctrl7 10, 59, 0, 1
 if kStartAnalog == 1 && changed(kStartAnalog) == 1 then
 schedulek "AnalogMachine", 0, iDurMaster
 cabbageSetValue  "analogpad", k(1)
 elseif kStartAnalog == 0 && changed(kStartAnalog) == 1 then
 turnoff2 "AnalogMachine", 0, 0
 turnoff2 "AnalogPlay", 0, 0
 turnoff2 "AnalogSound", 0, 1
 cabbageSetValue  "analogpad", k(0)
 endif
 
 
  kReset ctrl7 10, 63, 0, 1
  if kReset == 1 && changed(kReset) == 1 then
  cabbageSetValue  "seqmod",k(1)
  cabbageSetValue  "notemod",k(1)
  cabbageSetValue  "bpm",k(90)
  schedulek "Reset", 0, 1
  endif
 
  kChngRatio ctrl7 10, 62, 0, 1
    if changed(kChngRatio) == 1 then
    cabbageSetValue  "ratiornd", kChngRatio
    endif
  kvcoFilt   ctrl7    1,33,300,3000
    if changed(kvcoFilt) == 1 then
    cabbageSetValue  "vcoFilt", kvcoFilt
    endif   
 kCentVco   ctrl7     1,0,0,500
    if changed(kCentVco) == 1 then
    cabbageSetValue  "padcent", kCentVco
    endif   
   
    

 kPedal ctrl7 15,64,0,1
    if kPedal == 1 && changed(kPedal) == 1 then
    kSusB = 1
    cabbageSetValue "hold",kSusB
    elseif kPedal == 0 && changed(kPedal) == 1 then
    kSusB = 0
    cabbageSetValue "hold",kSusB
    elseif kPedal == 0 && changed(kPedal) == 1 && kActive == 0 then
    kSusB = 0
    schedulek "Empty",0,0.1,kActive
    cabbageSetValue "hold",kSusB
    endif
    if kActive == 0 && changed(kActive) == 1 && kPedal == 0 then
    schedulek "Empty",0,0.1,kActive
    endif
; kHold cabbageGet "hold"
;    if kHold == 0 && changed(kHold) == 1 && kActive == 0 then
;    schedulek "Empty",0,0.1,kActive
;    endif
    
 
     
 ;;seq 
  kAmpSeq   ctrl7    1,21,0,20
    if changed(kAmpSeq) == 1 then
    cabbageSetValue  "ampseq", kAmpSeq
    endif       
                 
 kDurSlider   ctrl7    1,23,0,10
    if changed(kDurSlider) == 1 then
    cabbageSetValue  "dur", kDurSlider
    endif
    
  kAttSlider   ctrl7    1,31,0.005,0.1
    if changed(kAttSlider) == 1 then
    cabbageSetValue  "att", kAttSlider
    endif
    
  kBpmSlider   ctrl7    1,41,10,210
    if changed(kBpmSlider) == 1 then
    cabbageSetValue  "bpm", kBpmSlider
    endif
    
    
    
kstatus, kchan, kdata1, kdata2  midiin
    if changed(kdata2) == 1 then
    SMidiShow     sprintfk "text(%d)", kdata2
    cabbageSet 1, "data",SMidiShow
    
    SMidiChn    sprintfk "text(%d)", kchan
    cabbageSet 1, "chndata",SMidiChn
    
;    cabbageSetValue "data", kdata2
    endif
endin



</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

