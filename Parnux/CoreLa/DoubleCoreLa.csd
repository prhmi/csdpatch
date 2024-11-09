;v3
<Cabbage>
form caption("DoubleCoreLa")    size(1120, 660)   guiMode("queue")  colour(30,30,50) pluginId("crlp") ; style("legacy")

label    bounds(35, 32, 30, 12)    channel("label2")  text("Hold")
label    bounds(30, 104, 28, 12)    channel("label3")  text("seq") 
label    bounds(30, 124, 28, 12)    channel("label4")  text("acc")
label    bounds(30, 162, 28, 12)   channel("label5")  text("bss")
label    bounds(30, 142, 28, 12)   channel("label6")  text("rep")
label    bounds(36, 258, 40, 12)   channel("label8")  text("On/Off")
label    bounds(30, 302, 28, 12)   channel("label10") text("seq")
label    bounds(30, 322, 28, 12)   channel("label11") text("acc")
label    bounds(30, 360, 28, 12)   channel("label12") text("bss")
label    bounds(30, 340, 28, 12)   channel("label13") text("rep")
label    bounds(578, 276, 46, 12)  channel("label15") text("Reverse")
label    bounds(578, 78, 46, 12)   channel("label16") text("Reverse")
label    bounds(16, 62, 60, 20)  channel("noteshow1")  fontColour(208, 157, 253, 255) align("left")  text(" ")
label    bounds(20, 232, 60, 20)  channel("noteshow2")  fontColour(208, 157, 253, 255) align("left") text("")
checkbox bounds(12, 28, 20, 20)    channel("hold")    popupText("Hold")            colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(672, 76, 20, 20)     channel("rndwidgets1")    popupText("Rnd")            colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) 
checkbox bounds(670, 274, 20, 20)    channel("rndwidgets2")    popupText("Rnd")            colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) 
checkbox bounds(630, 76, 18, 18)   channel("rvrs1")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(630, 274, 18, 18)  channel("rvrs2")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) 
checkbox bounds(14, 258, 18, 18)   channel("sq2")     popupText("Start")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255)  value(1)
checkbox bounds(642, 424, 25, 25)   channel("ambmachine")   colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
checkbox bounds(964, 412, 20, 20)   channel("rcrd")        colour:0(100, 100, 100, 255) colour:1(250, 100, 100) value(0)

nslider  bounds(90, 29, 60, 45)     channel("bpm1")   range(10, 210, 90, 1, 1)     fontColour(208, 157, 253, 255) text("BPM") colour(60, 50, 60, 255)
nslider  bounds(150, 44, 40, 30)    channel("DV1")     range(1, 10, 4, 1, 1)        fontColour(208, 157, 253, 255) text("DV") colour(60, 50, 60, 255)
nslider  bounds(192, 35, 40, 40)    channel("steps1")  range(1, 28, 13, 1, 1)       fontColour(208, 157, 253, 255) text("Step") colour(60, 50, 60, 255)
nslider  bounds(90, 236, 60, 45)   channel("bpm2")    range(10, 250, 90, 1, 1)     fontColour(208, 157, 253, 255) text("BPM") colour(60, 50, 60, 255)
nslider  bounds(150, 250, 40, 30)  channel("DV2")     range(1, 10, 4, 1, 1)        fontColour(208, 157, 253, 255) text("DV") colour(60, 50, 60, 255)
nslider  bounds(192, 240, 40, 40)  channel("steps2")  range(1, 28, 13, 1, 1)       fontColour(208, 157, 253, 255) text("Step")colour(60, 50, 60, 255)
nslider  bounds(638, 456, 68, 42)  channel("cnt")  range(0, 500, 0, 1, 1)       fontColour(208, 157, 253, 255) text("PadCent") colour(60, 50, 60, 255)
nslider  bounds(638, 502, 68, 42)  channel("cntp")  range(0, 500, 0, 1, 1)       fontColour(208, 157, 253, 255) text("PlayCent") colour(60, 50, 60, 255)
nslider  bounds(492, 236, 45, 38)  channel("oct")  range(-2, 2, 0, 1, 1)       fontColour(208, 157, 253, 255) text("octv") colour(60, 50, 60, 255)
;hslider  bounds(238, 22, 190, 30)  channel("dur1")    range(0.05, 5, 1.5, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255)  text("dur")  
;hslider  bounds(236, 226, 190, 30) channel("dur2")    range(0.05, 5, 1.3, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255)  text("dur")  
hslider  bounds(31, 500, 370, 45) channel("spdstrngmin")    range(0, 1, 0.1, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("spdMin")  
hslider  bounds(46, 456, 355, 45) channel("pos")    range(0, 1, 0.1, 1, 0.001) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("pose")  
hslider  bounds(28, 544, 373, 45) channel("spdstrngmax")    range(0, 1, 0.2, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("spdMax")  
;hslider  bounds(238, 54, 190, 30) channel("att1")    range(0.0001, 0.05, 0.0005, 1, 0.0001) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("att")  
;hslider  bounds(236, 258, 190, 30) channel("att2")    range(0.0001, 0.05, 0.001, 1, 0.0001) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("att")  
hslider  bounds(44, 592, 357, 45) channel("pdfltr")    range(0, 1, 0.3, 1, 0.001) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("Filter")  
nslider bounds(472, 460, 63, 35) channel("poss") range(0, 100, 0.56214, 1, 0.01) colour(78, 49, 79, 255)
nslider bounds(472, 502, 63, 35) channel("spdstrngmins") range(0, 100, -45, 1, 0.01) colour(78, 49, 79, 255)
nslider bounds(472, 548, 63, 35) channel("spdstrngmaxs") range(0, 100, -45, 1, 0.01) colour(78, 49, 79, 255)
nslider bounds(472, 594, 63, 35) channel("pdfltrs") range(100, 15000, 1000, 1, 1) colour(78, 49, 79, 255)
nslider bounds(676, 136, 90, 40) channel("fltrseq1") range(100, 9000, 800, 1, 1) colour(78, 49, 79, 255)text("filter")
nslider bounds(340, 34, 90, 40) channel("att1") range(0.0001, 0.5, 0.001, 1, 0.0001) colour(78, 49, 79, 255)text("att")
nslider bounds(340, 240, 90, 40) channel("att2") range(0.0001, 0.5, 0.001, 1, 0.0001) colour(78, 49, 79, 255)text("att")

nslider bounds(246, 34, 90, 40) channel("dur1") range(0.05, 5, 1.5, 1, 0.01) colour(78, 49, 79, 255)text("duration")

nslider bounds(244, 240, 90, 40) channel("dur2") range(0.05, 5, 1.5, 1, 0.01) colour(78, 49, 79, 255)text("duration")

nslider bounds(676, 332, 90, 40) channel("fltrseq2") range(100, 9000, 800, 1, 1) colour(78, 49, 79, 255)text("filter")
vslider bounds(772, 10, 50, 150) channel("gn1") range(0, 20, 15, 1, 1) trackerColour(208, 157, 253, 255)text("ampS1")
vslider bounds(776, 236, 50, 150) channel("gn2") range(0, 20, 15, 1, 1) trackerColour(208, 157, 253, 255) text("ampS2")
vslider bounds(542, 461, 60, 181) channel("gnpd") range(0, 80, 60, 1, 1) trackerColour(208, 157, 253, 255) text("ampPad")
combobox bounds(696, 72, 70, 30)   channel("BNote")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(60, 50, 60, 255)
combobox bounds(656, 36, 110, 35)   channel("scale")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah",  "homayun", "bayat esf")  value(2) colour(60, 50, 60, 255)
combobox bounds(696, 268, 70, 30)  channel("BNote2")  text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(60, 50, 60, 255)
combobox bounds(656, 232, 110, 35) channel("scale2")  text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf") value(2)  colour(60, 50, 60, 255)
combobox bounds(666, 104, 100, 30)   channel("sound1")  text("Instr", "Dahina", "Wood", "Tibetan", "Albert", "sine", "Tri", "Saw", "Square", "myset", "Pick", "VCO")   value(6) colour(60, 50, 60, 255)
combobox bounds(666, 300, 100, 30)   channel("sound2")  text("Instr", "Dahina", "Wood", "Tibetan", "Albert", "sine", "Tri", "Saw", "Square", "myset", "Pick", "VCO")  value(4) colour(60, 50, 60, 255)
combobox bounds(574, 36, 70, 30)  channel("seqmod1")  text("seq","tala","aRnd", "iRnd")   value(1) colour(60, 50, 60, 255)
combobox bounds(574, 234, 70, 30)  channel("seqmod2")  text("seq","tala","aRnd", "iRnd")   value(1) colour(60, 50, 60, 255)
label bounds(854, 56, 239, 66) channel("sec") fontColour(219, 169, 206, 255) text("00 : 19")
button bounds(974, 24, 116, 27) channel("start") text("S  T  A  R  T", "S  T  O  P") colour:0(204, 124, 188, 255) colour:1(96, 69, 69, 255) value(1)
label bounds(898, 25, 66, 28) channel("data")  fontColour(219, 169, 206, 255) colour(78, 49, 79, 255) text("0")
label bounds(853, 22, 44, 31) channel("chndata")  fontColour(219, 169, 206, 255) colour(78, 49, 79, 255) text("0")

combobox bounds(724, 480, 87, 35)  channel("smpr")  text("sample", "sample1", "sample2", "sample3")   value(2) colour(60, 50, 60, 255)





combobox bounds(726, 414, 66, 31)  channel("tune")  text("440", "432")   value(2) colour(60, 50, 60, 255)
label bounds(70, 414, 564, 31) channel("narrshow") fontColour(219, 169, 206, 255) colour(78, 49, 79, 255) align("left")  text("")
label bounds(410, 468, 59, 18) channel("label28") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(408, 514, 59, 18) channel("label30") text("CC-03") fontColour(224, 219, 219, 255)

label bounds(502, 6, 59, 18) channel("label32") text("CC-03") fontColour(224, 219, 219, 255)

label bounds(502, 218, 59, 18) channel("label34") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(408, 602, 59, 18) channel("label37") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(410, 558, 59, 18) channel("label36") text("CC-03") fontColour(224, 219, 219, 255)
vslider bounds(830, 478, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(208, 157, 253, 255)
vslider bounds(872, 478, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(208, 157, 253, 255)
vslider bounds(912, 478, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(208, 157, 253, 255)
vslider bounds(954, 478, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(208, 157, 253, 255)
nslider bounds(1004, 410, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(78, 49, 79, 255) text("Master Gain (dB)")
nslider bounds(836, 442, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(78, 49, 79, 255)
nslider bounds(876, 442, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(78, 49, 79, 255)
nslider bounds(916, 442, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(78, 49, 79, 255)
nslider bounds(956, 442, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(78, 49, 79, 255)
rslider bounds(854, 250, 70, 70) channel("delaytseq") range(0.1, 2, 1.5, 1, 0.001)trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("delayT")
rslider bounds(924, 250, 70, 70) channel("dfbseq") range(0, 1, 0.2, 1, 0.01)trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("fb")
rslider bounds(996, 250, 70, 70) channel("dmixseq") range(0, 1, 0.3, 1, 0.01) trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("mix")
combobox bounds(918, 214, 83, 34) channel("delayt") text("sec", "sync")  colour(60, 50, 60, 255) value(2)
rslider bounds(922, 136, 70, 70) channel("rroomeseq") range(1200, 15000, 7000, 1, 1) trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("room")
rslider bounds(852, 136, 70, 70) channel("rsizeseq") range(0.01, 0.98, 0.6, 1, 0.01) trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("size")
rslider bounds(994, 136, 70, 70) channel("rmixseq") range(0, 1, 0.3, 1, 0.01)trackerColour(208, 157, 253, 255) colour(161, 160, 192, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("mix")
combobox bounds(682, 604, 70, 35), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0")  colour(78, 49, 79, 255) 
filebutton bounds(620, 614, 60, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8")  colour:0(78, 49, 79, 255)
filebutton bounds(754, 612, 60, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101")  colour:0(78, 49, 79, 255)
vmeter bounds(1008, 478, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1032, 478, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1056, 478, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1080, 478, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(1008, 464, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(1032, 464, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1056, 464, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1080, 464, 15, 15) channel("clip4") colour(0, 0, 0, 255)
image bounds(726, 522, 30, 30) channel("samplelight1") corners(5)  colour(70, 62, 68, 255)
image bounds(776, 522, 30, 30) channel("samplelight2") corners(5)  colour(70, 62, 68, 255)
;image bounds(896, 416, 30, 30) channel("seqlight") corners(5) colour(70, 62, 68, 255)
;image bounds(934, 416, 30, 30) channel("bowlight") corners(5) colour(70, 62, 68, 255)
;image bounds(972, 416, 30, 30) channel("flutelight") corners(5) colour(70, 62, 68, 255)
image bounds(882, 402, 30, 30) channel("ambienlight") corners(5) colour(70, 62, 68, 255)
image bounds(922, 402, 30, 30) channel("loadlight") corners(5) colour(70, 62, 68, 255)
image bounds(162, 234, 15, 15) channel("fast1") corners(1) colour(70, 62, 68, 255)
image bounds(162, 28, 15, 15) channel("fast2") corners(1) colour(70, 62, 68, 255)


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


opcode rateCCk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = (kValue*iDiff)+iMin
xout kOut
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


 giArrNote[]    init 11
 giArrEmpty[]   init lenarray:i(giArrNote)
 giArrVeloc[]   init lenarray:i(giArrNote)
 giArrVel[] =   giArrVeloc
 giLenVel       lenarray giArrVel
; giNote[]       fillarray 1,1
 giWriteNote    init 0


gSfile1 init 0
gSfile2 init 0

giSteps init 28
giStepArr1[]    init giSteps
giAccArr1[]     init giSteps
giRepArr1[]     init giSteps
giBassArr1[]    init giSteps

giStepArr2[]    init giSteps
giAccArr2[]     init giSteps
giRepArr2[]     init giSteps
giBassArr2[]    init giSteps


massign 1,1
massign 3,13
massign 5,15
massign 7,16
massign 16,23


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


iLenSeq init 11
gkNote init 0

 giArrNote[]    init iLenSeq
 giNote[] init iLenSeq
 giArrEmpty[]   init iLenSeq
 giWriteNote init 0
gkSec init 0


instr GetMidi ;1
 iActive active "GetMidi"
 iHold cabbageGetValue "hold"
 kHold cabbageGet "hold"
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
; puts SnArrShow,1
; printarray giNote,"%d","Notes:"
 
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
; puts SnArrShow,1

; printarray giNote,"%d","Notes(R):"
 giWriteNote -= 1
endin


instr seq1
schedule "copyArr1", 0, 1
kActive1 active 1
kDing cabbageGet "dng1"
kHold cabbageGet "hold"
kAtt cabbageGet "att1"
kFilter cabbageGet "fltr"
gkSeqIndx1   init 0
kNoteIndx  init 0
kBPM cabbageGet "bpm1"
kTempo = kBPM/60
kTms cabbageGet "DV1"
kSteps cabbageGet "steps1"
;kRndWidget cabbageGet "rndwidgets1"
kRndWidget cabbageGet "seqmod1"
kTime = (kTempo*kTms)
ksel = 0
kNoteIn = giNote[ksel]
kDur cabbageGet "dur1"
    if metro(kTime) == 1 then
    if kNoteIn > 20 then
    ;;sound
    SseqValue sprintfk "seq1%d",gkSeqIndx1
    kSeqValue cabbageGet SseqValue
    SaccValue sprintfk "acc1%d",gkSeqIndx1
    kAccValue cabbageGet SaccValue
        if kSeqValue == 1 then 
        kNoteIndx  = (kNoteIndx+1)  % giLenNote
            if changed(gkLenNote) == 1 then
            kNoteIndx = gkLenNote-1
            endif
            kNote  = giNote[kNoteIndx]
            schedulek "Sound1" ,0,kDur,kNote,kAccValue*2, kAtt,kFilter
        endif
    ;;Bss
    SbssValue sprintfk "bass1%d",gkSeqIndx1
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    	kBidx = 0
        kNoteBass = giNote[kBidx]
	    until kNoteBass < 45 do
  		kNoteBass = kNoteBass-12
  		enduntil
        schedulek "Sound1" ,0,kDur,kNoteBass,0, 0.005,kFilter
    endif
    ;;Rep
    SrepValue sprintfk "rep1%d",gkSeqIndx1
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
			schedulek "Sound1",kTrigRep,kDurRep,kNoteRep,-3, 0.0005,kFilter
	    kTrigRep += kDurRep
		kndxRep += 1
		od	
    endif
    endif
    schedulek "LEDon1",0,0.1,gkSeqIndx1
    schedulek "LEDoff1",1/kTime,0.1,gkSeqIndx1
        if gkSeqIndx1 == 0 && changed(gkSeqIndx1) == 1 then 
            if kRndWidget == 1 && changed(kRndWidget) == 1 && gkSec > 5 then
            schedulek "ResetWidget1", 0, 1
            elseif kRndWidget == 2 then
            schedulek "RndtWidget1", 0, 1
            elseif kRndWidget == 3 then
            schedulek "RndaWidget1", 0, 1
            elseif kRndWidget == 4 then
            schedulek "RndiWidget1", 0, 1
            endif
        endif
    gkSeqIndx1 = (gkSeqIndx1+1) % kSteps
    endif
endin

instr LEDon1
Slte sprintf "lte1%d",p4
cabbageSet 1,Slte,"colour(150, 150, 200, 250)"
endin
instr LEDoff1
Slte sprintf "lte1%d",p4
cabbageSet 1,Slte,"colour(100, 100, 100, 200)"
endin

instr Sound1 ;5
iMidi = p4
iAmpIn cabbageGetValue "gn1"
iAmpseq ampdb iAmpIn-30
iAmpdB ampdb p5
iAmp = iAmpseq*iAmpdB
;print iAmp
iBaseNoteIn cabbageGetValue "BNote"
iScale      cabbageGetValue "scale"
iBaseMidi,iQ noteBase iBaseNoteIn
iMidiOut noteScale iMidi,iBaseMidi,iScale, iQ
Snote MtoNameInt iMidiOut
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow1",SnoteShow
endif
gkNote = iMidiOut
iFrqIn mtof iMidiOut
iTuneIn cabbageGetValue "tune"
    if iTuneIn == 1 then
    iTune = 440
    elseif iTuneIn == 2 then
    iTune = 432
    endif
iRatio = iTune/440
iFrq = iFrqIn*iRatio

iAtt = p6
    if iMidi <= 55 && iAtt < 0.001 then
    iAtt = 0.005
    endif
;iAtt cabbageGetValue "att"
iRvrs cabbageGetValue "rvrs1"
if iRvrs == 0 then
 aEnv transeg 0, iAtt,1, iAmp, p3-iAtt,-6, 0
elseif iRvrs == 1 then
 aEnv transeg 0, p3*(1-iAtt),4, iAmp,p3*iAtt,-4,0
endif
 iModIn cabbageGetValue "sound1"
iMod = iModIn-1
if iMod == 0 goto end
if iMod == 1 || iMod == 2 || iMod == 3 || iMod == 4 goto sine
if iMod == 5 || iMod == 6 || iMod == 7 || iMod == 8 \
|| iMod == 9 goto sine2
if iMod == 10 goto pick
if iMod == 11 goto VCO
sine:
if iMod == 1 then
giWave = giwave1
elseif iMod == 2 then
giWave = giwave2
elseif iMod == 3 then
giWave = giwave3
elseif iMod == 4 then
giWave = giwave4
endif
aSine poscil3 aEnv, (iFrq)/giRtosScale,giWave
aout = aSine
goto OUT
sine2:
if iMod == 5 then
giWave = giSineTwo
elseif iMod == 6 then
giWave = giTri
elseif iMod == 7 then
giWave = giSaw
elseif iMod == 8 then
giWave = giSquare
elseif iMod == 9 then
giWave = giMyset
endif
aSine poscil aEnv, iFrq,giWave
aout = aSine
goto OUT
pick:
iplk  random 0.1, 0.8
ipick random 0.3, 0.9
iRel random p3-0.1, p3+0.1
irefl MirrorMe iRel, 0.5,1.5,0; random p3/2, 1
aPick wgpluck2 iplk,1, iFrq, ipick, irefl-0.01
aout = aPick*aEnv
goto OUT
VCO:
;aVco    vco2   0.5,iFrq,0,0.5
aVco vco 1, iFrq, 3, .5, giSine
aout = aVco*aEnv
OUT:
chnmix aout, "sndseq1"
;outall aout
end:
endin




instr seq2
kActive1 active 1
schedule "copyArr2", 0, 1
kDing cabbageGet "dng2"
kHold cabbageGet "hold"
gkSeqIndx2   init 0
kNoteIndx  init 0
kVelocIndx init 0
kBPM cabbageGet "bpm2"
kTempo = kBPM/60
kTms cabbageGet "DV2"
kSteps cabbageGet "steps2"
kAtt cabbageGet "att2"
kFilter cabbageGet "fltr"
kOctave cabbageGet "oct"
;kRndWidget cabbageGet "rndwidgets2"
kRndWidget cabbageGet "seqmod2"
kOct = 12*kOctave
kTime = (kTempo*kTms)
;printk2 kTime
ksel = 0
kNoteIn = giNote[ksel]
kDur cabbageGet "dur2"
    if metro(kTime) == 1 then
    if kNoteIn > 20 then
    ;;sound
    SseqValue sprintfk "seq2%d",gkSeqIndx2
    kSeqValue cabbageGet SseqValue
    SaccValue sprintfk "acc2%d",gkSeqIndx2
    kAccValue cabbageGet SaccValue
        if kSeqValue == 1 then 
        kNoteIndx  = (kNoteIndx+1)  % giLenNote
            if changed(gkLenNote) == 1 then
            kNoteIndx = gkLenNote-1
            endif
            kNote  = giNote[kNoteIndx]+kOct
            schedulek "Sound2" ,0,kDur,kNote,kAccValue*2, kAtt,kFilter
        endif
    ;;Bss
    SbssValue sprintfk "bass2%d",gkSeqIndx2
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    kBidx = 0
    kNoteBass = giNote[kBidx]
        until kNoteBass < 45 do
  	    kNoteBass = kNoteBass-12
  		enduntil
        schedulek "Sound2" ,0,kDur,kNoteBass,0, 0.005,kFilter
    endif
    ;;Rep
    SrepValue sprintfk "rep2%d",gkSeqIndx2
    kRepValue cabbageGet SrepValue
    if kRepValue == 1 then
    kNoteRep = kNote
	    until kNoteRep > 90 do
  		kNoteRep = kNoteRep+12
  		enduntil
     kRepR = ((int(random:k(0,3)))/2)+1
     kRepT = int(random:k( 2,7))
     kDurRep = (1/kTime)/kRepR
     kTrigRep = kDurRep
     kndxRep = 0
        while kndxRep < kRepT do
		    schedulek "Sound2",kTrigRep,kDurRep,kNoteRep,-3, 0.0005,kFilter
		kTrigRep += kDurRep
		kndxRep += 1
		od	
    endif
    endif
    schedulek "LEDon2",0,0.1,gkSeqIndx2
    schedulek "LEDoff2",1/kTime,0.1,gkSeqIndx2
        if gkSeqIndx2 == 0 && changed(gkSeqIndx2) == 1 then 
            if kRndWidget == 1 && changed(kRndWidget) == 1 && gkSec > 5 then
            schedulek "ResetWidget2", 0, 1
            elseif kRndWidget == 2 then
            schedulek "RndtWidget2", 0, 1
            elseif kRndWidget == 3 then
            schedulek "RndaWidget2", 0, 1
            elseif kRndWidget == 4 then
            schedulek "RndiWidget2", 0, 1
            endif
        endif
    gkSeqIndx2 = (gkSeqIndx2+1) % kSteps
    endif
endin

instr LEDon2
Slte sprintf "lte2%d",p4
cabbageSet 1,Slte,"colour(150, 150, 200, 250)"
endin
instr LEDoff2
Slte sprintf "lte2%d",p4
cabbageSet 1,Slte,"colour(100, 100, 100, 200)"
endin

instr Sound2 ;5
iMidi = p4
iAmpIn cabbageGetValue "gn2"
iAmpseq ampdb iAmpIn-30
iAmpdB ampdb p5
iAmp = iAmpseq*iAmpdB
iBaseNoteIn cabbageGetValue "BNote2"
iScale      cabbageGetValue "scale2"
iBaseMidi,iQ noteBase iBaseNoteIn
iMidiOut noteScale iMidi,iBaseMidi,iScale, iQ
Snote MtoNameInt iMidiOut
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow2",SnoteShow
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

iAtt = p6
    if iMidi <= 55 && iAtt < 0.001 then
    iAtt = 0.005
    endif
iRvrs cabbageGetValue "rvrs2"
if iRvrs == 0 then
 aEnv transeg 0, iAtt,6, iAmp, p3-iAtt,-6, 0
elseif iRvrs == 1 then
 aEnv transeg 0, p3*(1-iAtt),4, iAmp,p3*iAtt,-4,0
endif
 iFilter = p7+iFrq
 iModIn cabbageGetValue "sound2"
iMod = iModIn-1
;print iMod
if iMod == 0 goto end
if iMod == 1 || iMod == 2 || iMod == 3 || iMod == 4 goto sine
if iMod == 5 || iMod == 6 || iMod == 7 || iMod == 8 \
|| iMod == 9 goto sine2
if iMod == 10 goto pick
if iMod == 11 goto VCO
sine:
if iMod == 1 then
giWave = giwave1
elseif iMod == 2 then
giWave = giwave2
elseif iMod == 3 then
giWave = giwave3
elseif iMod == 4 then
giWave = giwave4
endif
aSine poscil3 aEnv, (iFrq)/giRtosScale,giWave
aout = aSine
goto OUT
sine2:
if iMod == 5 then
giWave = giSineTwo
elseif iMod == 6 then
giWave = giTri
elseif iMod == 7 then
giWave = giSaw
elseif iMod == 8 then
giWave = giSquare
elseif iMod == 9 then
giWave = giMyset
endif
aSine poscil aEnv, iFrq,giWave
aout = aSine
goto OUT
pick:
iplk  random 0.1, 0.8
ipick random 0.3, 0.9
iRel random p3-0.1, p3+0.1
irefl MirrorMe iRel, 0.5,1.5,0; random p3/2, 1
aPick wgpluck2 iplk,0.3, iFrq, ipick, irefl-0.01
aout = aPick*aEnv
goto OUT
VCO:
;aVco    vco2   0.5,iFrq,0,0.5
aVco vco 1, iFrq, 3, .5, giSine
aout = aVco*aEnv
OUT:
chnmix aout, "sndseq2"
end:
endin

;--------------------------------------------------
;pad sound

instr AmbientMachine
iBaseNoteIn cabbageGetValue "BNote"
iBaseMidi,iQ noteBase iBaseNoteIn
kTime init 1
if metro(1/kTime) == 1 then

kTime random 3, 7
kDur = kTime*1.3
kMidi = gkNote
    if kMidi == 0 then
    kMidi = iBaseMidi
    endif
        until kMidi > 45 do
  		kMidi = kMidi+12
  		enduntil
      	until kMidi < 55 do
  		kMidi = kMidi-12
  		enduntil 
    schedulek "AmbSound", 0, kDur, kMidi
endif
endin


instr AmbSound
kAmpdBin cabbageGet "gnpd"
kAmpdB ampdb kAmpdBin-60
    cabbageSet 1,"ambienlight","colour(100, 150, 200)"
    kRelease release
    if kRelease == 1 then
    cabbageSet 1,"ambienlight","colour(70, 62, 68, 255)"
    endif
kCentIn cabbageGet "cnt"
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


kPoseIn      cabbageGet "pos"
kSpeedMinIn   cabbageGet "spdstrngmin"
kSpeedMaxIn   cabbageGet "spdstrngmax"
kFilterIn     cabbageGet "pdfltr"
kPose   rateCCk kPoseIn, 0.7, 20
kbriteIn rateCCk kPoseIn, 1, 20
kFrqRnd   rateCCk kPoseIn, 0, 2
kFilter    rateCCk kFilterIn, 200, 3000
kSpeedMin  rateCCk kSpeedMinIn, 1, 10
kSpeedMax  rateCCk kSpeedMaxIn, 3, 12
cabbageSetValue "poss",  kPose
cabbageSetValue "spdstrngmins",  kSpeedMin
cabbageSetValue "spdstrngmaxs",  kSpeedMax
cabbageSetValue "pdfltrs",  kFilter
kCent1 jspline kCentIn, kSpeedMin/10, kSpeedMax/10
kCent2 jitter kCentIn, kSpeedMin/10, kSpeedMax/10
kFrq1 = k(iFrq)*cent(kCent1)
kFrq2 = k(iFrq)*cent(kCent2)
kFrqRnd1 jspline kFrqRnd, kSpeedMin, kSpeedMax
kFrqRnd2 = kFrqRnd1*(-1)
iAmp        ampdb -16
avco        vco iAmp, kFrq1, 3, .5, giSine
iHarmonics  random 2, 10
aMoog	    buzz iAmp, kFrq2+kFrqRnd2, iHarmonics, giSine
avcoFlt     clfilt avco, kFilter, 0, 10
avcoFlt     clfilt avcoFlt, 200, 1, 10
aMoogFlt    clfilt aMoog, kFilter, 0, 10
aMoogFlt    clfilt aMoogFlt, 200, 1, 10
kMixVB jspline 0.5, kSpeedMin/2, kSpeedMax/2
aMixVb ntrpol  avcoFlt,aMoogFlt, kMixVB+0.5
aRes = (avcoFlt*aMoog)+(avco*aMoogFlt)
aResFlt clfilt aRes*7, kFilter, 0, 50
aResFlt clfilt aResFlt, 300, 1, 50
kMix = (-0.5)
if kPose <= 0.7 then
kMix jspline 0.5, kSpeedMin*2, kPose
endif
kMix port kMix, 0.1
aMix ntrpol  aMixVb,aResFlt, kMix+0.5
iblend ftgen 2, 0, 1024, -19, 1, 0.5, 270, 0.5
iwave  ftgen 1, 0, 1024, 10, 10, 1, 2, 5, 2, 1
  kbrite    jspline kbriteIn, kSpeedMin, kSpeedMax
  ibasfreq  random 50, 120
  ktone     rspline 0.1, kbriteIn/5,  kSpeedMin/10, kSpeedMax/10
iAmpSb ampdb -10
aSboscil hsboscil iAmpSb, ktone, kbrite, ibasfreq, iwave, iblend, 8, 1
iFrq     random 30, 80
ipick    random 0.1, 0.7
krefl    rspline 0.2, 0.9, kSpeedMin/10, kSpeedMax/10
aPlck    repluck 1, 1, iFrq, ipick, krefl, aSboscil
acPlck   clip aPlck, iAmpSb, 1
kFiltRnd     rspline 300, 700, kSpeedMin, kSpeedMax*2
aFiltSboscil clfilt acPlck, kFilter+kFiltRnd, 0, 10
aFiltSboscil clfilt aFiltSboscil,300,1,10
  iAtt random 1, 2
  if iAtt >= p3/2 then
  iAtt = p3/2
  endif
 aEnv transeg 0, iAtt, 1, 1, p3-(iAtt*2),1, 1, iAtt, -4, 0
; aEnv linen 1, iAtt, p3, iAtt
 aEnvR linsegr 1, 0.1, 0
;xtratim iAtt/2
aOut = (aMix+aFiltSboscil)*kAmpdB*aEnv*aEnvR
	chnmix aOut, "sndpad"
endin




instr sineMidi
iAmpdBin cabbageGetValue "gnpd"
isAmp ampdb iAmpdBin-60
print isAmp
 ;isAmp = 0 ;cabbageGetValue "seqamp"
 iAmp ampdb -35
 iNum notnum
 iFrqIn mtof iNum
iTuneIn cabbageGetValue "tune"
    if iTuneIn == 1 then
    iTune = 440
    elseif iTuneIn == 2 then
    iTune = 432
    endif
iRatio = iTune/440
iFrq = iFrqIn*iRatio
 
 iVel veloc 5, 0.001
 iAtt = (iVel^2)/10
 iRel  random 0.1, 1
    aEnv linsegr 0, iAtt, 1, iRel, 0
    iRnd1 random 1.1, 2
    iRnd2 random 1.5, 3
    kCentIn cabbageGet "cntp"
    kVib poscil 2, 5
    kCent randomh -kCentIn, kCentIn, 12
    kFrq = (iFrq*cent(kCent))+kVib   
 aSine1 poscil iAmp, kFrq, giMyset, 0
 aSine2 poscil iAmp*0.8, kFrq*iRnd1, giMyset, 0.25
 aSine3 poscil iAmp*0.5, kFrq*iRnd2, giMyset, 0.5
 aSound sum aSine1,aSine2,aSine3
 aOut = aSound*aEnv*isAmp
 chnmix aOut, "sndpad"
; outall aSound
endin


instr PadFx
aIn chnget "sndpad"
	aRvrb nreverb aIn,1, 0.3
	aMix		ntrpol	 aIn,aRvrb,  .4
outall aMix
 
chnclear "sndpad"
endin


;;--------------------------------------------------------------
;sample


instr Sample1
iFolder cabbageGetValue "smpr"
Sfile sprintf "./preset%d/sample1.wav", iFolder-1
kAmp cabbageGet "sampleamp"
iLen filelen Sfile
iNum notnum
iInterval = (iNum-60)*50

iCent cent iInterval
iDur = iLen/iCent
p3 = iDur
xtratim iDur
kOnOff linseg 1, p3, 0
cabbageSet 1,"samplelight1","colour(200, 50, 100)"
if kOnOff == 0 then
cabbageSet 1,"samplelight1","colour(70, 62, 68, 255)"
endif
aSound diskin2 Sfile, iCent,0,0
aOut = aSound
outall aSound
;chnmix aOut, "sndout"
endin

instr Sample2
iFolder cabbageGetValue "smpr"
Sfile sprintf "./preset%d/sample2.wav", iFolder-1
kAmp cabbageGet "sampleamp"
iLen filelen Sfile
iNum notnum
iInterval = (iNum-60)*50
print iInterval
iCent cent iInterval
iDur = iLen/iCent
p3 = iDur
xtratim iDur
kOnOff linseg 1, p3, 0
cabbageSet 1,"samplelight2","colour(200, 50, 100)"
if kOnOff == 0 then
cabbageSet 1,"samplelight2","colour(70, 62, 68, 255)"
endif
aSound diskin2 Sfile, iCent,0,0
aOut = aSound
outall aSound
;chnmix aOut, "sndout"
endin


instr hold
 cabbageSetValue "hold",p4
endin

instr Empty ;7
if p4 == 1 then
 giArrNote[] = giArrEmpty
 giNote[] = giArrEmpty
    SnoteShow     sprintf "text(%s)", " "
    cabbageSet "narrshow",SnoteShow
elseif p4 == 2 then
giArrVel[] RmvZ giArrVeloc
giLenVel lenarray giArrVel
;printarray giArrVel, "%d"
endif
endin


;-------------------------------------------------------
;Effects


instr FxSeq

kPortTime linseg 0, 0.01, 0.0001
;;seq
iBPM            cabbageGetValue "bpm1"
iTms            cabbageGetValue "DV1"
iDelayTimeIn    cabbageGetValue "delaytseq"
kFeedback       cabbageGet "dfbseq"
kDelayMix       cabbageGet "dmixseq"
kRvrbMix        cabbageGet "rmixseq"
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


aIn1 chnget "sndseq1"
aIn2 chnget "sndseq2"


kFilter1 cabbageGet "fltrseq1"
kFilter2 cabbageGet "fltrseq2"

aSound1 tone aIn1, kFilter1
aSound2 tone aIn2, kFilter2

aSound sum aSound1,aSound2


aDelay init 0
aDelay  delay    aSound+(aDelay*kFeedback), iDelayTime
  	aDelMix		ntrpol	 aSound,aDelay,  kDelayMix
 
  
;  aRvrb	nreverb	aSound, 1, 0.2

  aRvrb,aRvrb  reverbsc aSound,aSound, kSizeRvrb, kRoomRvrb, sr, 1, 1
  
  aRvrbMix ntrpol aSound,aRvrb, kRvrbMix
  
  aMixOut = (aDelMix+aRvrbMix)/2
  outall aMixOut
  chnclear "sndseq1", "sndseq2"
endin



;-------------------------------------------------------
;widgets
instr widgetWrite
    iX = 0
    iCount = 0
    ispc = 10
    while iCount < giSteps do
            Sseq1    sprintf "bounds(%d, 100, 18, 18)  , channel(\"seq1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Sacc1    sprintf "bounds(%d, 120, 18, 18)  , channel(\"acc1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Srep1    sprintf "bounds(%d, 140, 18, 18) , channel(\"rep1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount           
            Sbass1   sprintf "bounds(%d, 160, 18, 18) , channel(\"bass1%d\")      colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount           
             Slte1   sprintf "bounds(%d, 180, 15, 15) , channel(\"lte1%d\")       colour(100, 100, 100, 200) ", 51+iCount*(20)+ispc, iCount

            Sseq2    sprintf "bounds(%d, 300, 18, 18) , channel(\"seq2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Sacc2    sprintf "bounds(%d, 320, 18, 18) , channel(\"acc2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Srep2    sprintf "bounds(%d, 340, 18, 18) , channel(\"rep2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Sbass2   sprintf "bounds(%d, 360, 18, 18) , channel(\"bass2%d\")      colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(20)+ispc, iCount
            Slte2    sprintf "bounds(%d, 380, 15, 15) , channel(\"lte2%d\")       colour(100, 100, 100, 200) ", 51+iCount*(20)+ispc, iCount
            
     cabbageCreate "checkbox", Sseq1
     cabbageCreate "checkbox", Sacc1
     cabbageCreate "checkbox", Srep1
     cabbageCreate "checkbox", Sbass1
     cabbageCreate "image"   , Slte1
            
     cabbageCreate "checkbox", Sseq2
     cabbageCreate "checkbox", Sacc2
     cabbageCreate "checkbox", Srep2
     cabbageCreate "checkbox", Sbass2
     cabbageCreate "image"   , Slte2          

     iCount += 1
     iX = (iX+1) % 4
     if iX == 0 then
     ispc += 5
     endif
    od
    
    kArrSeq1[] fillarray 1,0,0,1,1,0,0,1,0,1,0,0,1
    kArrRep1[] fillarray 0,0,0,0,0,1,0,0,0,0,0,0,0
    kArrBas1[] fillarray 0,0,0,0,1,0,0,0,0,0,0,0,0
    
    kArrSeq2[] fillarray 0,1,1,0,0,1,0,0,1,0,0,1,0
    kArrRep2[] fillarray 0,0,0,0,0,0,0,0,0,0,0,1,0
    kArrBas2[] fillarray 1,0,0,0,0,0,1,0,0,0,0,0,0
    kWrite = 0
    while kWrite < lenarray(kArrSeq1) do
     Ssq1 sprintfk "seq1%d",kWrite
     Srp1 sprintfk "rep1%d",kWrite
     Sbs1 sprintfk "bass1%d",kWrite
     Ssq2 sprintfk "seq2%d",kWrite
     Srp2 sprintfk "rep2%d",kWrite
     Sbs2 sprintfk "bass2%d",kWrite
     cabbageSetValue Ssq1,kArrSeq1[kWrite]
     cabbageSetValue Srp1,kArrRep1[kWrite]
     cabbageSetValue Sbs1,kArrBas1[kWrite]
     cabbageSetValue Ssq2,kArrSeq2[kWrite]
     cabbageSetValue Srp2,kArrRep2[kWrite]
     cabbageSetValue Sbs2,kArrBas2[kWrite]
     kWrite += 1
    od    
endin

instr copyArr1
iLen init 28
giArrCopySeq1[] init iLen
giArrCopyAcc1[] init iLen
giArrCopyRep1[] init iLen
giArrCopyBas1[] init iLen
giStepsCopy1 cabbageGetValue "steps1"
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq1%d",iWrite
     Sac sprintf "acc1%d",iWrite
     SRp sprintf "rep1%d",iWrite
     Sbs sprintf "bass1%d",iWrite
     giArrCopySeq1[iWrite] cabbageGetValue Ssq
     giArrCopyAcc1[iWrite] cabbageGetValue Sac
     giArrCopyRep1[iWrite] cabbageGetValue SRp
     giArrCopyBas1[iWrite] cabbageGetValue Sbs
     iWrite += 1
    od   
endin

instr copyArr2
iLen init 28
giArrCopySeq2[] init iLen
giArrCopyAcc2[] init iLen
giArrCopyRep2[] init iLen
giArrCopyBas2[] init iLen
giStepsCopy2 cabbageGetValue "steps2"
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq2%d",iWrite
     Sac sprintf "acc2%d",iWrite
     SRp sprintf "rep2%d",iWrite
     Sbs sprintf "bass2%d",iWrite
     giArrCopySeq2[iWrite] cabbageGetValue Ssq
     giArrCopyAcc2[iWrite] cabbageGetValue Sac
     giArrCopyRep2[iWrite] cabbageGetValue SRp
     giArrCopyBas2[iWrite] cabbageGetValue Sbs
     iWrite += 1
    od   
endin



instr ResetWidget1
gkSeqIndx1 init 0
cabbageSetValue "steps1", giStepsCopy1
iLen init 28
indx = 0 
while indx < iLen do
     Ssq sprintf "seq1%d",indx
     Sac sprintf "acc1%d",indx 
     SRp sprintf "rep1%d",indx 
     Sbs sprintf "bass1%d",indx
     cabbageSetValue Ssq,giArrCopySeq1[indx]
     cabbageSetValue Sac,giArrCopyAcc1[indx]
     cabbageSetValue SRp,giArrCopyRep1[indx]
     cabbageSetValue Sbs,giArrCopyBas1[indx]
indx += 1
od
endin

instr ResetWidget2
gkSeqIndx2 init 0
cabbageSetValue "steps2", giStepsCopy2
iLen init 28
indx = 0 
while indx < iLen do
     Ssq sprintf "seq2%d",indx
     Sac sprintf "acc2%d",indx 
     SRp sprintf "rep2%d",indx 
     Sbs sprintf "bass2%d",indx
     cabbageSetValue Ssq,giArrCopySeq2[indx]
     cabbageSetValue Sac,giArrCopyAcc2[indx]
     cabbageSetValue SRp,giArrCopyRep2[indx]
     cabbageSetValue Sbs,giArrCopyBas2[indx]
indx += 1
od
endin

instr RndtWidget1
iLen cabbageGetValue "steps1"
iArrSeq[] init iLen
iArrRep[] init iLen
iArrBas[] init iLen
    iWrite = 0
    iRead = 1
    while iWrite < iLen do
    Ssq sprintf "seq1%d",iRead 
    SRp sprintf "rep1%d",iRead 
    Sbs sprintf "bass1%d",iRead   
    iSeqValue cabbageGetValue Ssq
    iRepValue cabbageGetValue SRp
    ibasValue cabbageGetValue Sbs
    iArrSeq[iWrite] = iSeqValue
    iArrRep[iWrite] = iRepValue
    iArrBas[iWrite] = ibasValue
     iWrite += 1
     iRead = (iRead+1)%iLen
    od     
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq1%d",iWrite 
     SRp sprintf "rep1%d",iWrite 
     Sbs sprintf "bass1%d",iWrite    
     cabbageSetValue Ssq,iArrSeq[iWrite]
     cabbageSetValue SRp,iArrRep[iWrite]
     cabbageSetValue Sbs,iArrBas[iWrite]
     iWrite += 1
    od  
endin

instr RndaWidget1
iLen = int(random:i( 8, 18))
cabbageSetValue "steps1", iLen
;iLen cabbageGetValue "steps1"
iArrSeq[] init iLen
    iWrite = 0
    while iWrite < iLen do
    iRndSeq = int(random:i(0,2))
    iArrSeq[iWrite] = iRndSeq
     Ssq sprintf "seq1%d",iWrite  
     SRp sprintf "rep1%d",iWrite   
     cabbageSetValue Ssq,iArrSeq[iWrite]
     cabbageSetValue SRp,0
     iWrite += 1
    od 
iRepIndx = int(random:i(0,iLen)) 
SRp sprintf "rep1%d",iRepIndx 
cabbageSetValue SRp,1
endin


instr RndiWidget1
iLen cabbageGetValue "steps1"
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq1%d",iWrite 
     Sac sprintf "acc1%d",iWrite 
     SRp sprintf "rep1%d",iWrite 
     Sbs sprintf "bass1%d",iWrite    
     cabbageSetValue Ssq,giArrCopySeq1[iWrite]
     cabbageSetValue Sac,giArrCopyAcc1[iWrite]
     cabbageSetValue SRp,giArrCopyRep1[iWrite]
     cabbageSetValue Sbs,giArrCopyBas1[iWrite]
     iWrite += 1
    od  
iSeqIndx = int(random:i(0,iLen))
iAccIndx = int(random:i(0,iLen))
iRepIndx = int(random:i(0,iLen))
iBasIndx = int(random:i(0,iLen))
iSeqValue = int(random:i(0,2))
iAccValue = int(random:i(0,2))
iRepValue = int(random:i(0,2))
iBasValue = int(random:i(0,2))
     Ssq sprintf "seq1%d",iSeqIndx
     Sac sprintf "acc1%d",iAccIndx 
     SRp sprintf "rep1%d",iRepIndx 
     Sbs sprintf "bass1%d",iBasIndx
     cabbageSetValue Ssq,iSeqValue
     cabbageSetValue Sac,iAccValue
     cabbageSetValue SRp,iRepValue
     cabbageSetValue Sbs,iBasValue
endin


instr RndtWidget2
iLen cabbageGetValue "steps2"
iArrSeq[] init iLen
iArrRep[] init iLen
iArrBas[] init iLen
    iWrite = 0
    iRead = 1
    while iWrite < iLen do
    Ssq sprintf "seq2%d",iRead 
    SRp sprintf "rep2%d",iRead 
    Sbs sprintf "bass2%d",iRead   
    iSeqValue cabbageGetValue Ssq
    iRepValue cabbageGetValue SRp
    ibasValue cabbageGetValue Sbs
    iArrSeq[iWrite] = iSeqValue
    iArrRep[iWrite] = iRepValue
    iArrBas[iWrite] = ibasValue
     iWrite += 1
     iRead = (iRead+1)%iLen
    od     
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq2%d",iWrite 
     SRp sprintf "rep2%d",iWrite 
     Sbs sprintf "bass2%d",iWrite    
     cabbageSetValue Ssq,iArrSeq[iWrite]
     cabbageSetValue SRp,iArrRep[iWrite]
     cabbageSetValue Sbs,iArrBas[iWrite]
     iWrite += 1
    od  
endin

instr RndaWidget2
iLen = int(random:i( 8, 18))
cabbageSetValue "steps2", iLen
;iLen cabbageGetValue "steps2"
iArrSeq[] init iLen
iArrBas[] init iLen
    iWrite = 0
    while iWrite < iLen do
    iRndSeq = int(random:i(0,2))
    iRndBas = random:i(0,100) > 20 ? 0 : 1
    iArrSeq[iWrite] = iRndSeq
    iArrBas[iWrite] = iRndBas
     Ssq sprintf "seq2%d",iWrite
     SRp sprintf "rep2%d",iWrite
     Sbs sprintf "bass2%d",iWrite
     cabbageSetValue Ssq,iArrSeq[iWrite]
     cabbageSetValue SRp,0
     cabbageSetValue Sbs,iArrBas[iWrite]
     iWrite += 1
    od   
iRepIndx = int(random:i(0,iLen)) 
SRp sprintf "rep2%d",iRepIndx 
cabbageSetValue SRp,1
endin

instr RndiWidget2
iLen cabbageGetValue "steps2"
    iWrite = 0
    while iWrite < iLen do
     Ssq sprintf "seq2%d",iWrite 
     Sac sprintf "acc2%d",iWrite 
     SRp sprintf "rep2%d",iWrite 
     Sbs sprintf "bass2%d",iWrite    
     cabbageSetValue Ssq,giArrCopySeq2[iWrite]
     cabbageSetValue Sac,giArrCopyAcc2[iWrite]
     cabbageSetValue SRp,giArrCopyRep2[iWrite]
     cabbageSetValue Sbs,giArrCopyBas2[iWrite]
     iWrite += 1
    od  
iSeqIndx = int(random:i(0,iLen))
iAccIndx = int(random:i(0,iLen))
iRepIndx = int(random:i(0,iLen))
iBasIndx = int(random:i(0,iLen))
iSeqValue = int(random:i(0,2))
iAccValue = int(random:i(0,2))
iRepValue = int(random:i(0,2))
iBasValue = int(random:i(0,2))
     Ssq sprintf "seq2%d",iSeqIndx
     Sac sprintf "acc2%d",iAccIndx 
     SRp sprintf "rep2%d",iRepIndx 
     Sbs sprintf "bass2%d",iBasIndx
     cabbageSetValue Ssq,iSeqValue
     cabbageSetValue Sac,iAccValue
     cabbageSetValue SRp,iRepValue
     cabbageSetValue Sbs,iBasValue
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
gkSec = kSec
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
schedulek "seq1",0,iDurMaster
schedulek "FxSeq" , 0, iDurMaster
schedulek "PadFx",0,iDurMaster
    if kSeq2Play == 1 then
    schedulek "seq2",0,iDurMaster
    endif
    if kRecord == 1 then
    schedulek "record",0,iDurMaster
    endif
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 "Time", 0, 0
turnoff2 "seq1", 0,0
turnoff2 "seq2", 0,0
turnoff2 "FxSeq", 0,0
turnoff2 "PadFx", 0,0
turnoff2 "record", 0,0
endif

if kSeq2Play == 0 && changed(kSeq2Play) == 1 then
turnoff2 "seq2",0,0
endif
    
    
    
    
  kAmbientMachine   ctrl7    1,57,0,1
  if kAmbientMachine == 1 && changed(kAmbientMachine) == 1 then
  schedulek "AmbientMachine", 0, iDurMaster
  elseif kAmbientMachine == 0 && changed(kAmbientMachine) == 1 then
  turnoff2 "AmbientMachine", 0, 0
  turnoff2 "AmbSound", 0, 1
  endif
    
    
   kPedal ctrl7 15,64,0,1
  if kPedal == 1 && changed(kPedal) == 1 then
  schedulek "hold", 0,0.1,1
  elseif kPedal == 0 && changed(kPedal) == 1 then
  schedulek "Empty",0,0.1,1
  schedulek "hold",0,0.1,0
  endif
   
   kHold cabbageGet "hold"
   kActive1 active 1
    if kHold == 0 && changed(kActive1) == 1 && kActive1 == 0 then
    schedulek "Empty",0,0.1,kActive1+1
    endif
  
  
  
  
  kRndWidget ctrl7 1,63,0,1
  if kRndWidget == 1 && changed(kRndWidget) == 1 then
  schedulek "RndaWidget1",0,1
  schedulek "RndaWidget2",0,1
  elseif kRndWidget == 0 && changed(kRndWidget) == 1 then
  schedulek "ResetWidget1", 0, 1
  schedulek "ResetWidget2", 0, 1
  endif

  kBpmSlider   ctrl7    1,41,10,210
    if changed(kBpmSlider) == 1 then
;    cabbageSetValue "bpm1", kBpmSlider
;    cabbageSetValue  "bpm2", kBpmSlider
    Sbpm sprintfk "%d", kBpmSlider
    cabbageSet 1, "showBPM", "text", Sbpm
    endif
    
    

kstatus, kchan, kdata1, kdata2  midiin
    SMidiShow     sprintfk "text(%d)", kdata2
    cabbageSet 1, "data",SMidiShow
    SChnShow     sprintfk "text(%d)", kchan
    cabbageSet 1, "chndata",SChnShow


if kStart == 0 then
kDvCopy1 cabbageGetValue "DV1"
kDvCopy2 cabbageGetValue "DV2"
endif

  kFast   ctrl7    1,62,0,1
  if kFast == 0 && changed(kFast) == 1 then
  cabbageSetValue "DV1", kDvCopy1
  cabbageSetValue "DV2", kDvCopy2
  cabbageSet 1,"fast1","colour(70, 62, 68, 255)"
  cabbageSet 1,"fast2","colour(70, 62, 68, 255)"
  elseif kFast == 1 && changed(kFast) == 1 then
  cabbageSetValue "DV1", kDvCopy1*2 ;k(8)
  cabbageSetValue "DV2", kDvCopy2*2 ;k(8)
  cabbageSet 1,"fast1","colour(150, 200, 250)"
  cabbageSet 1,"fast2","colour(150, 200, 250)"
  endif


;Sfile1    = "test.wav"
Sfile1    cabbageGet    "sampleA" 
Sfile2    cabbageGet    "sampleB" 
    if changed(Sfile1) == 1 then
    schedulek "test", 0, 1, Sfile1
    endif
    
;    aInL,aInR monitor
;    fout "record.wav", 8, aInL, aInR
endin


</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

