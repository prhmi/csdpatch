;v5
<Cabbage>
form caption("DoubleCoreLa")    size(785, 540)   guiMode("queue")  colour(25, 25, 35) pluginId("crlp") ; style("legacy")
;double corela
image bounds(10, 15, 764, 386) channel("image10045") colour(19, 19, 24, 255)
image bounds(10, 410, 365, 116) channel("image10046") colour(19, 19, 24, 255)
image bounds(380, 410, 397, 115) channel("image10047") colour(19, 19, 24, 255)
label    bounds(30, 104, 28, 12)    channel("label3")  text("seq") 
label    bounds(30, 144, 28, 12)   channel("label5")  text("bss")
label    bounds(30, 124, 28, 12)   channel("label6")  text("rep")
label    bounds(44, 34, 40, 12)   channel("label8")  text("On/Off")
label    bounds(30, 302, 28, 12)   channel("label10") text("seq")
label    bounds(30, 342, 28, 12)   channel("label12") text("bss")
label    bounds(30, 322, 28, 12)   channel("label13") text("rep")
label    bounds(516, 276, 46, 12)  channel("label15") text("Reverse")
label    bounds(516, 78, 46, 12)   channel("label16") text("Reverse")
label    bounds(16, 62, 60, 20)  channel("noteshow1")  fontColour(220, 234, 245, 255) align("left")  text("")
label    bounds(20, 262, 60, 20)  channel("noteshow2")  fontColour(220, 234, 245, 255) text("") align("left") 
checkbox bounds(568, 76, 18, 18)   channel("rvrs1")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(568, 274, 18, 18)  channel("rvrs2")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) 
checkbox bounds(20, 32, 18, 18)   channel("sq2")     popupText("Start")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255)  value(1)
nslider  bounds(90, 29, 60, 45)     channel("bpm1")   range(10, 210, 90, 1, 1)    fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("BPM") 
nslider  bounds(150, 44, 40, 30)    channel("DV1")     range(1, 16, 4, 1, 1)       fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("DV") 
nslider  bounds(192, 35, 40, 40)    channel("steps1")  range(1, 28, 13, 1, 1)     fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Step")
nslider  bounds(90, 236, 60, 45)   channel("bpm2")    range(10, 250, 90, 1, 1)   fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("BPM") 
nslider  bounds(150, 250, 40, 30)  channel("DV2")     range(1, 16, 4, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("DV") 
nslider  bounds(192, 240, 40, 40)  channel("steps2")  range(1, 28, 13, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Step")
nslider  bounds(464, 236, 45, 38)  channel("oct2")  range(-4, 4, 0, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("octv") 
nslider  bounds(464, 36, 45, 38)  channel("oct1")  range(-4, 4, 0, 1, 1)      fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("octv") 

nslider bounds(340, 34, 90, 40) channel("att1") range(0.0001, 0.5, 0.001, 1, 0.001) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("att")
nslider bounds(340, 240, 90, 40) channel("att2") range(0.0001, 0.5, 0.001, 1, 0.001)  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("att")
nslider bounds(246, 34, 90, 40) channel("dur1") range(0.05, 5, 1.5, 1, 0.01) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("duration")
nslider bounds(244, 240, 90, 40) channel("dur2") range(0.05, 5, 1.5, 1, 0.01)  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("duration")
vslider bounds(710, 18, 50, 150) channel("amp1") range(0, 1, 0.55, 1, 0.001) trackerColour(160, 200, 250, 255)text("ampS1")
vslider bounds(714, 236, 50, 150) channel("amp2") range(0, 1, 0.4, 1, 0.001) trackerColour(160, 200, 250, 255) text("ampS2")
combobox bounds(634, 72, 70, 30)   channel("BNote1")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(50, 54, 60, 255)
combobox bounds(594, 36, 110, 35)   channel("scale1")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf")  value(2) colour(50, 54, 60, 255)
combobox bounds(634, 268, 70, 30)  channel("BNote2")  text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D", "E")   value(2) colour(50, 54, 60, 255)
combobox bounds(594, 232, 110, 35) channel("scale2")  text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah", "homayun", "bayat esf") value(2)  colour(50, 54, 60, 255)
combobox bounds(604, 104, 100, 30)   channel("sound1")  text("Instr", "sine1", "sine2", "sine3", "dahina", "wood", "tibetan", "albert", "vco", "tri", "saw", "square", "myset", "pick")   value(11) colour(50, 54, 60, 255)
combobox bounds(604, 300, 100, 30)   channel("sound2")  text("Instr", "sine1", "sine2", "sine3", "dahina", "wood", "tibetan", "albert", "vco", "tri", "saw", "square", "myset", "pick")  value(4) colour(50, 54, 60, 255)
combobox bounds(512, 36, 70, 30)  channel("seqmod1")  text("seq", "tala", "aRnd", "iRnd")   value(1) colour(50, 54, 60, 255)
combobox bounds(512, 234, 70, 30)  channel("seqmod2")  text("seq","tala","aRnd", "iRnd")   value(1) colour(50, 54, 60, 255)
label bounds(36, 192, 564, 31) channel("narrshow") fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)    align("left")   text("")
nslider bounds(614, 160, 90, 40) channel("filterseq1") range(100, 12000, 800, 1, 1) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Filter")
nslider bounds(618, 346, 90, 40) channel("filterseq2") range(100, 12000, 800, 1, 1) fontColour(220, 234, 245, 255) colour(50, 60, 70, 255)  text("Filter")

;time
label bounds(388, 420, 107, 31) channel("sec")fontColour(220, 234, 245, 255) text("00 : 06")
button bounds(272, 420, 88, 27) channel("start") text("S  T  A  R  T", "S  T  O  P") colour:0(124, 150, 204, 255) colour:1(69, 72, 96, 255) value(1)
label bounds(568, 430, 28, 23) channel("chndata")  fontColour(220, 234, 245, 255) colour(50, 60, 70, 255) text("0")
combobox bounds(506, 424, 57, 27)  channel("tune")  text("440", "432")   value(2) colour(50, 54, 60, 255)
combobox bounds(598, 422, 58, 31), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0")  colour(50, 54, 60, 255) text("oo")
filebutton bounds(660, 424, 50, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8")  colour:0(50, 54, 60, 255)
filebutton bounds(716, 424, 50, 25), text("Rmv", "Rmv"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101")  colour:0(50, 54, 60, 255)

;output
hmeter bounds(526, 470, 125, 15) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
hmeter bounds(526, 492, 125, 15) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)
nslider bounds(688, 464, 77, 44) channel("maingain") range(-90, 50, 0, 1, 1) colour(49, 64, 79, 255) text("Master Gain")
signaldisplay bounds(390, 466, 123, 46), channel("display") colour("white") displayType("waveform"), backgroundColour(40,40,60), zoom(-1), signalVariable("aShow")
;WgPad
groupbox bounds(0, 25, 480, 380), text("WG"), plant("pop1"), popup(1), visible(0) colour(20, 20, 20), channel("pops1") {
button bounds(22, 48, 80, 40), channel("bowonoff"), alpha(1), colour:0(70, 70, 80) colour:1(50, 80, 150) text("bow start", "bow stop")
combobox bounds(260, 114, 75, 27)  channel("lfomodbow1")  text("line", "step", "seq")   value(2) colour(50, 54, 60, 255)
combobox bounds(250, 146, 95, 27)  channel("lfomodbow2")  text("pos/vibr", "pos/filt", "vib/filt")   value(1) colour(50, 54, 60, 255)
combobox bounds(25, 135, 74, 27)  channel("bowfrqmod")  text("seq", "MIDI", "CC")   value(2) colour(50, 54, 60, 255)
rslider bounds(142, 112, 60, 60) channel("lfobow1") range(0.05, 20, 1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("LFO-rate")
rslider bounds(398, 114, 60, 60) channel("lfobow2") range(0.05, 20, 1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("LFO-rate")
rslider bounds(142, 42, 60, 60) channel("bow1") range(0.03, 5, 0.1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("pos")
rslider bounds(206, 42, 60, 60) channel("bow2") range(0.1, 5, 1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("vibr")
rslider bounds(270, 42, 60, 60) channel("bow3") range(0, 1, 0.1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("lfo-dep")
rslider bounds(334, 42, 60, 60) channel("bow4") range(400, 2000, 500, 1, 10) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("Filter")
rslider bounds(398, 42, 60, 60) channel("bow5") range(0.1, 3, 0.5, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("Gain")
image bounds(48, 98, 20, 20) channel("bowled") colour(40, 40, 50, 255)
image bounds(210, 118, 20, 20) channel("bowledlfo1") colour(40, 40, 50, 255)
image bounds(360, 118, 20, 20) channel("bowledlfo2") colour(40, 40, 50, 255)
image bounds(42, 200, 400, 3) channel("wgwg") colour(128, 126, 126, 255)
;flute
button bounds(22, 228, 80, 40), channel("fltonoff"), alpha(1), colour:0(70, 70, 80) colour:1(50, 80, 150) text("flute start", "flute stop")
rslider bounds(142, 296, 60, 60) channel("lfoflt1") range(0.05, 20, 1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("jet-rate")
rslider bounds(398, 296, 60, 60) channel("lfoflt2") range(0.05, 20, 1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("flt-rate")
combobox bounds(256, 308, 75, 27)  channel("lfomodflt1")  text("line", "step", "seq")   value(2) colour(50, 54, 60, 255)
combobox bounds(25, 318, 74, 27)  channel("fltfrqmod")  text("seq", "MIDI", "CC")   value(2) colour(50, 54, 60, 255)
rslider bounds(142, 230, 60, 60) channel("flt1") range(0.1, 5, 0.56, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("jet")
rslider bounds(226, 230, 60, 60) channel("flt2") range(0, 1, 0.1, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("lfo-dep")
rslider bounds(310, 230, 60, 60) channel("flt3") range(300, 8000, 500, 1, 10) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("Filter")
rslider bounds(398, 230, 60, 60) channel("flt4") range(0.1, 3, 0.3, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255)  text("Gain")
image bounds(50, 284, 20, 20) channel("fltled") colour(40, 40, 50, 255)
image bounds(210, 302, 20, 20) channel("fltledlfo1") colour(40, 40, 50, 255)
image bounds(360, 302, 20, 20) channel("fltledlfo2") colour(40, 40, 50, 255)
}
button bounds(20, 464, 80, 40), channel("wgfolder"), alpha(1), colour:0(70, 70, 80) colour:1(50, 80, 150) text("W-G", "running")


;effects
groupbox bounds(0, 25, 600, 430), text("Fx package"), plant("pop2"), popup(1), visible(0) colour(20, 20, 20), channel("pops2") {
label    bounds(24, 80, 70, 18)    channel("labelfx1")  text("Seq") 
combobox bounds(10, 30, 83, 34) channel("dlymod") text("sync", "sec") colour(50, 54, 60, 255) value(1)
rslider bounds(100, 30, 90, 90) channel("dlyt1") range(0.3, 3, 0.1, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("delay")
rslider bounds(180, 30, 90, 90) channel("dlyfb1") range(0.1, 0.9, 0.3, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("fb")
rslider bounds(260, 30, 90, 90) channel("dlymix1") range(0, 1, 0.3, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("d mix")
rslider bounds(340, 30, 90, 90) channel("rvrbsize1") range(0.2, 0.9, 0.6, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("reverb")
rslider bounds(420, 30, 90, 90) channel("rvrbmix1") range(0, 1, 0.3, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("r mix")
rslider bounds(500, 30, 90, 90) channel("lowfseq1") range(20, 1000, 0.6, 1, 10) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("HPF")
label    bounds(24, 200, 70, 18)    channel("labelfx2")  text("Bow") 
rslider bounds(100, 160, 90, 90) channel("dlyt2") range(0.3, 3, 0.1, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("delay")
rslider bounds(180, 160, 90, 90) channel("dlyfb2") range(0.1, 0.9, 0.3, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("fb")
rslider bounds(260, 160, 90, 90) channel("dlymix2") range(0, 1, 0.3, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("d mix")
rslider bounds(340, 160, 90, 90) channel("rvrbsize2") range(0.1, 0.9, 0.6, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("reverb")
rslider bounds(420, 160, 90, 90) channel("rvrbmix2") range(0, 1, 0.3, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("r mix")
rslider bounds(500, 160, 90, 90) channel("lowfseq2") range(20, 1000, 0.6, 1, 10) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("HPF")
label    bounds(24, 320, 70, 18)    channel("labelfx3")  text("Flute") 
rslider bounds(100, 290, 90, 90) channel("dlyt3") range(0.3, 3, 0.1, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("delay")
rslider bounds(180, 290, 90, 90) channel("dlyfb3") range(0.1, 0.9, 0.3, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("fb")
rslider bounds(260, 290, 90, 90) channel("dlymix3") range(0.2, 0.9, 0.6, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("d mix")
rslider bounds(340, 290, 90, 90) channel("rvrbsize3") range(0.2, 0.9, 0.6, 1, 0.01) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("reverb")
rslider bounds(420, 290, 90, 90) channel("rvrbmix3") range(0, 1, 0.6, 1, 0.1) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("r mix")
rslider bounds(500, 290, 90, 90) channel("lowfseq3") range(20, 1000, 0.6, 1, 10) trackerColour(54, 203, 233, 255) colour(139, 162, 171, 255) valueTextBox(1) text("HPF")

}
button bounds(108, 464, 80, 40), channel("fxfolder"), alpha(1), colour:0(70, 70, 80) colour:1(50, 80, 150) text("Effects", "running")
;;midi
groupbox bounds(0, 25, 400, 200), text("Midi Setting"), plant("pop3"), popup(1), visible(0) colour(20, 20, 20), channel("pops3") {
label    bounds(14, 54, 85, 18)    channel("labelm1")  text("Octaves") 
nslider bounds(162, 38, 45, 45) channel("prgoct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("Prgm")
nslider bounds(210, 38, 45, 45) channel("noteoct") range(-7, 7, 0, 1, 1) colour(37, 56, 75, 255) text("Note")
nslider bounds(112, 38, 45, 45) channel("ccoct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("CC")
nslider bounds(260, 38, 45, 45) channel("knoboct") range(0, 9, 0, 1, 1) colour(37, 56, 75, 255) text("knob")
label    bounds(14, 118, 85, 18)    channel("labelm2")  text("prgmTime") 
label bounds(116, 114, 96, 28) channel("prgdata") fontColour(163, 209, 250, 255) colour(37, 56, 75, 255)  text("12") fontSize(20)
}
button bounds(196, 464, 80, 40), channel("midifolder"), , colour:0(70, 70, 80, 255) colour:1(50, 80, 150, 255) text("Midi Set", "running")
checkbox bounds(334, 472, 25, 25) channel("mpad8") colour:0(37, 56, 75, 255) colour:1(0, 154, 255, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
-m128 -n --displays -+rtmidi=NULL -M0 --midi-key-cps=4 --midi-velocity-amp=5
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







opcode myDelay, a, akkkkk
aIn, kTime, kFb, kBPM, kMod, kMix xin
   if kMod == 1 then ;sync
   kDlyT = 1/(kBPM/60)*(1+(int(kTime*5)))
   elseif kMod == 2 then ;free
   kDlyT = kTime
   endif
 iBufSize = 5
 abuf      delayr   iBufSize
 aTim     interp   kDlyT
 aDelay   deltapi  aTim
 delayw    aIn + (aDelay*kFb)
 aOut   ntrpol  aIn,aDelay,  kMix
 
xout aOut
endop

opcode myRvrb, a, akk
aIn, kSize, kMix xin
 aRvrb,aRvrb   reverbsc aIn,aIn, kSize, 8000, sr, 0.5, 1
 aOut  ntrpol aIn,aRvrb, kMix
 xout aOut
endop
 giArrNote[]    init 11
 giArrEmpty[]   init lenarray:i(giArrNote)
 giWriteNote    init 0



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
gkCCArr[] init 6
gkCCIndx init 0

opcode setcc, kk, kk
kNum, kData xin
kCCnum = kNum
if kData == 0 goto skip
kIndx = gkCCIndx
kTurnOff = 0
	kndx = 0
	while kndx < lenarray(gkCCArr) do
		if gkCCArr[kndx] == kCCnum then
		gkCCArr[kndx] = 0
		kCConOff = 0
		gkCCIndx = kndx
		kTurnOff = 1
		endif 
	kndx += 1
	od
if kTurnOff == 0 then
		kndx = 0 
		kSkip = 1
		while kndx < lenarray(gkCCArr) do
			if gkCCArr[kndx] == 0 then
			kSkip = 0
			endif
		kndx += 1
		od
	if kSkip == 0 then
		while gkCCArr[kIndx] != 0 do
		kIndx = (kIndx+1) % lenarray(gkCCArr)
		od
	gkCCArr[kIndx] = kCCnum
	kCConOff = 1
	gkCCIndx = (gkCCIndx+1) % lenarray(gkCCArr)
	endif
endif
skip:
if kNum >= 21 && kNum <= 52 then
kCConOff = kData
	if kData != 0 then
	kCConOff = 1
	endif
endif
	xout kCCnum, kCConOff
endop
gkPrgRepArr[] init 2
gkPrgmIndx init 0
opcode setprgm, kk, kk
kPrgNum,kTime xin
iDur = 0.5
if kTime >= iDur then
kTime = 0
gkPrgmIndx = 0
gkPrgRepArr[0] = 0
gkPrgRepArr[1] = 0
endif
gkPrgRepArr[gkPrgmIndx] = kPrgNum
if gkPrgmIndx == 0 then
kTime = 0
endif
kPrgNumOut = kPrgNum
if gkPrgmIndx == 0 then
gkPrgRepArr[1] = 0
endif
if gkPrgmIndx == 1 && kTime < iDur then
	if gkPrgRepArr[0] != gkPrgRepArr[1] then
	kPrgNumOut = (gkPrgRepArr[0]*100)+gkPrgRepArr[1]
	endif
endif
gkPrgmIndx = (gkPrgmIndx+1) % 2
xout kPrgNumOut, kTime
skip:
endop

gkUpDownPrg1 init 0
gkUpDownPrg2 init 0
gkUpDownPrg3 init 0
gkUpDownPrg4 init 0
gkOctArr[] init 2
gkOctIndx init -1
opcode setoct, kkkk, kk
kPrgNum,kTime xin
iDurReset = 0.1
if changed(kPrgNum) == 1 then
gkOctIndx = (gkOctIndx+1) % 2
endif
gkOctArr[gkOctIndx] = kTime
kMidiTime abs gkOctArr[1]-gkOctArr[0]
if kPrgNum == 1 then
gkUpDownPrg1 -= 1
	if gkUpDownPrg1 <= 1 then
	gkUpDownPrg1 = 1
	endif
elseif kPrgNum == 5 then
gkUpDownPrg1 += 1
	if gkUpDownPrg1 >= 7 then
	gkUpDownPrg1 = 7
	endif
endif
if (kPrgNum == 1 || kPrgNum == 5) && kMidiTime < iDurReset then
gkUpDownPrg1 = 0
endif
if kPrgNum == 2 then
gkUpDownPrg2 -= 1
	if gkUpDownPrg2 <= 1 then
	gkUpDownPrg2 = 1
	endif
elseif kPrgNum == 6 then
gkUpDownPrg2 += 1
	if gkUpDownPrg2 >= 3 then
	gkUpDownPrg2 = 3
	endif
endif
if (kPrgNum == 2 || kPrgNum == 6) && kMidiTime < iDurReset then
gkUpDownPrg2 = 0
endif
if kPrgNum == 3 then
gkUpDownPrg3 -= 1
	if gkUpDownPrg3 <= -7 then
	gkUpDownPrg3 = -7
	endif
elseif kPrgNum == 7 then
gkUpDownPrg3 += 1
	if gkUpDownPrg3 >= 7 then
	gkUpDownPrg3 = 7
	endif
endif
if (kPrgNum == 3 || kPrgNum == 7) && kMidiTime < iDurReset then
gkUpDownPrg3 = 0
endif
if kPrgNum == 4 then
gkUpDownPrg4 -= 1
	if gkUpDownPrg4 <= 1 then
	gkUpDownPrg4 = 1
	endif
elseif kPrgNum == 8 then
gkUpDownPrg4 += 1
	if gkUpDownPrg4 >= 7 then
	gkUpDownPrg4 = 7
	endif
endif
if (kPrgNum == 4 || kPrgNum == 8) && kMidiTime < iDurReset then
gkUpDownPrg4 = 0
endif
xout gkUpDownPrg1, gkUpDownPrg2, gkUpDownPrg3, gkUpDownPrg4
endop


giSteps init 24
massign 0,0
massign 1,1
;massign 3,18
;massign 5,12
pgmassign 0, 0

iLenSeq init 15
gkNote init 0
giTune init 0
gkWGnote init 0
gkCCnote init 0
giSine ftgen 0, 0, 512, 10, 1
giSeq      ftgen   0, 0, 50, 7, 1, 10, 1, 0, -0.4, 10, -0.4, 0, 0.5, 10, 0.5, 0, -1, 10, -1, 0, -0.3, 10, -0.3


 giArrNote[]   init iLenSeq
 giNote[]      init iLenSeq
 giArrEmpty[]  init iLenSeq
 giWriteNote   init 0
 gkWGnote init 0

instr GetMidi ;1
 iActive active "GetMidi"
 iHold cabbageGetValue "mpad8"
 kHold cabbageGet "mpad8"
 kRel release
 iMidi notnum
 gkWGnote = iMidi
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
    if giNote[0] == 0 then
    SnoteShow     sprintf "text(%s)", ""
    cabbageSet "narrshow",SnoteShow
    endif
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
kFilter     = cabbageGet:k(sprintf:S("filterseq%d",p4)) ;"slider1"
kOct        = cabbageGet:k(sprintf:S("oct%d",p4))


 kFiltStart init 1 ; "filts3"
 kFiltEnd   init 1 ;cabbageGet "filte3"
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
            kNote  = giNote[kNoteIndx]+(kOct*12)
            iSeqAmp = -10
            schedulek "Sound" ,0,kDur,kNote, kAtt,iSeqAmp, kFilter, p4 ,kSeqIndx, kFiltStart,kFiltEnd
            schedulek "MidiOut" ,0,kDur,kNote, p4
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
    kFilterBs = 400
        schedulek "Sound" ,0,kDur*1.5,kNoteBass, iBassAtt,iBassAmpdB, kFilterBs, p4, kSeqIndx, kFiltStart,kFiltEnd
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
			schedulek "Sound",kTrigRep,kDurRep,kNoteRep, iRepAtt,iRepAmpdB, kFilter, p4, kSeqIndx, kFiltStart,kFiltEnd
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

instr LED
if p4 == 1 then
Scolor = "colour(100, 250, 250)"
ScolorFont = "fontColour(100,200,100)"
elseif p4 == 2 then
Scolor = "colour(40, 40, 50)"
ScolorFont = "fontColour(100,100,100)"
endif
cabbageSet 1,"seqc",Scolor
kndx = p5
kndxNote = p7
SchnNote  sprintfk "nc%d", kndxNote+1
Schn  sprintfk "sqc%d", kndx+1
cabbageSet 1, Schn,Scolor
cabbageSet 1, SchnNote,Scolor

SnoteC mton p6
SnoteCp strsub SnoteC, 1
    SnoteShow     sprintf "text(%s)", SnoteCp
    cabbageSet "noteshow",SnoteShow
endin


instr Sound
p3 = p3*p11
iMidi = p4
iAmpIn        = cabbageGetValue:i(sprintf:S("amp%d",p8))
iBaseNoteIn   = cabbageGetValue:i(sprintf:S("BNote%d",p8))
iScale        = cabbageGetValue:i(sprintf:S("scale%d",p8))
iRvrs         = cabbageGetValue:i(sprintf:S("rvrs%d",p8))
iSineMod      = cabbageGetValue:i(sprintf:S("sound%d",p8))
kFilterL      = cabbageGet:k(sprintf:S("lowfseq%d",p8))
kpw     = 0.5
iAmp   = iAmpIn

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
iplk  random 0.1, 0.9
ipick random 0.1, 0.9
irelf random 0.1, 0.9
;print irelf
aPick wgpluck2 iplk,0.95, iFrq, ipick, irelf
aSound = aPick*aEnv
endif






iFilter  = p7
iAttFValue = p10

iRelFValue = p11


if iAttFValue >= 50 then
iStartFilter = iFilter
iAttF = p3/100
else
iAttF = p3/iAttFValue
iStartFilter = 10
endif

if iRelFValue <= 1 then
iEndFilter = iFilter
iRelF = p3/100
else
iRelF = p3/iRelFValue
iEndFilter = 1
endif

if p8 == 3 then
kFilter transeg iStartFilter, iAttF, 1, iFilter, iRelF, -4, iEndFilter
else
kFilter = iFilter
endif
aOut clfilt aSound, kFilter+(iFrq*0.7), 0, 10
aOut clfilt aOut, kFilterL, 1, 10

Ssound sprintf "sndseq%d", p8
chnmix aOut, Ssound
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    SchS sprintf "noteshow%d",p8
    cabbageSet SchS,SnoteShow
endif
endin

instr MidiOut
iVeloc = 10
iChOut = p5
iMidiOut = p4
;midion iChOut, iMidiOut, iVeloc
endin


instr bow
kLFOMod   cabbageGet "lfomodbow1"
kLFOgo    cabbageGet "lfomodbow2"
kRateLFO1  cabbageGet "lfobow1"
kRateLFO2  cabbageGet "lfobow2"
kPoseIn    cabbageGet "bow1"
kVibrIn    cabbageGet "bow2"
kLFOdep    cabbageGet "bow3"
kFiltIn    cabbageGet "bow4"
kGainIn    cabbageGet "bow5"
kFrqMod    cabbageGet "bowfrqmod"
;;modulation
  if kLFOMod == 1 then
  kLFO1 randi   1, kRateLFO1
  kLFO2 randi   1, kRateLFO2
  elseif kLFOMod == 2 then
  kLFO1 randomh -1, 1, kRateLFO1
  kLFO2 randomh -1, 1, kRateLFO2
  elseif kLFOMod == 3 then
  kLFO1 poscil 1, kRateLFO1/10, giSeq
  kLFO2 poscil 1, kRateLFO2/10, giSeq
  endif
  if     kLFOgo == 1 then
  kLFO1 scale kLFO1, 0.05, 20, -1, 1
  kLFOdep1 scale kLFOdep, 0, 0.1, 0, 1
  kPose  = (kLFO1*kLFOdep1)+kPoseIn
  kLFO2 scale kLFO2, 0.1, 0.2, -1, 1
  kLFOdep2 scale kLFOdep, 0, 3, 0, 1
  kVibr  = (kLFO2*kLFOdep2)+kVibrIn
  kFilt = kFiltIn
  elseif kLFOgo == 2 then
  kLFO1 scale kLFO1, 0.05, 20, -1, 1
  kLFOdep1 scale kLFOdep, 0, 0.1, 0, 1
  kPose  = (kLFO1*kLFOdep1)+kPoseIn
  kLFOdep2 scale kLFOdep, 0, 500, -1, 1
  kFilt = kFiltIn+(kLFO2*kLFOdep2)
  kVibr = kVibrIn
  elseif kLFOgo == 3 then
  kLFO1 scale kLFO1, 0.1, 0.2, -1, 1
  kLFOdep1 scale kLFOdep, 0, 3, 0, 1
  kVibr  = (kLFO1*kLFOdep1)+kVibrIn
  kLFOdep2 scale kLFOdep, 0, 500, -1, 1
  kFilt = kFiltIn+(kLFO2*kLFOdep2)
  kPose = kPoseIn
  endif 
iAmp   ampdb -5
if     kFrqMod == 1 then
kFrq mtof gkNote
elseif kFrqMod == 2 then
kFrq mtof gkWGnote 
elseif kFrqMod == 3 then
kCCnote scale gkCCnote, 10, 1200, 0, 127
kFrq = kCCnote
endif
kFrq init 50
kPresIn init 1.4
kPoseIn init 0.1
kVibr init 0
iPres random 1.4, 4.5

aBow	wgbow    iAmp,kFrq,iPres,kPose,0, kVibr, giSeq
aFilter clfilt aBow, kFrq+kFilt, 0, 10
aEnv linsegr 0, 1, 1, 1, 0 
aGain interp kGainIn
aOut = aFilter*aEnv*aGain
chnmix aOut, "sndbow"
endin

;schedule "bow", 0, 999
instr flute

kLFOMod    cabbageGet "lfomodflt1"
kLFOgo     cabbageGet "lfomodflt2"
kRateLFO1  cabbageGet "lfoflt1"
kRateLFO2  cabbageGet "lfoflt2"
kJetIn    cabbageGet "flt1"
kLFOdep    cabbageGet "flt2"
kFiltIn    cabbageGet "flt3"
kGainIn    cabbageGet "flt4"
kFrqMod    cabbageGet "fltfrqmod"
;;modulation
  if kLFOMod == 1 then
  kLFO1 randi   1, kRateLFO1
  kLFO2 randi   1, kRateLFO2
  elseif kLFOMod == 2 then
  kLFO1 randomh -1, 1, kRateLFO1
  kLFO2 randomh -1, 1, kRateLFO2
  elseif kLFOMod == 3 then
  kLFO1 poscil 1, kRateLFO1/10, giSeq
  kLFO2 poscil 1, kRateLFO2/10, giSeq
  endif

  kLFO1 scale kLFO1, 0.05, 20, -1, 1
  kLFOdep1 scale kLFOdep, 0, 0.1, 0, 1
  kJet  = (kLFO1*kLFOdep1)+kJetIn
  kLFO2 scale kLFO2, 1, 20, -1, 1
  kLFOdep2 scale kLFOdep, 0, 500, 0, 1
  kFilt = kFiltIn+(kLFO2*kLFOdep2)


iAmp   ampdb -5
if     kFrqMod == 1 then
kFrq mtof gkNote
elseif kFrqMod == 2 then
kFrq mtof gkWGnote 
elseif kFrqMod == 3 then
kCCnote scale gkCCnote, 10, 1200, 0, 127
kFrq = kCCnote
endif

kFrq init 50
kJet init 0.085
iatt = 0.1
idetk = 0.1
kAir randi 0.1, 0.7
aSound wgflute iAmp, kFrq, kJet, iatt, idetk, kAir, 0, 0 ;kVibr, giSeq
aFilter clfilt aSound, (kFrq/2)+kFilt, 0, 10
aEnv linsegr 0, 1, 1, 1, 0 
aGain interp kGainIn
aOut = aFilter*aEnv*aGain
chnmix aOut, "sndflt"
endin


instr speaker
 aSeqIn1     chnget "sndseq1"
 aSeqIn2     chnget "sndseq2"
 aInBow      chnget "sndbow"
 aInFlt      chnget "sndflt"
 kMainGain   cabbageGet "maingain"
 aMainGain interp ampdb(kMainGain)
 aAll = (aSeqIn1+aSeqIn2+aInBow+aInFlt)*aMainGain
aShow = aAll
display aShow, 1/1000, 128

;;FX
;double
 kBPM1         cabbageGet "bpm1"
 kDlyTime1     cabbageGet "dlyt1"
 kFb1          cabbageGet "dlyfb1"
 kDlyMix1      cabbageGet "dlymix1"
 kRvrbSize1    cabbageGet "rvrbsize1"
 kRvrbMix1     cabbageGet "rvrbmix1"
 kDlyMod       cabbageGet "dlymod"
 ;w-g-Bow
 kDlyTime2     cabbageGet "dlyt2"
 kFb2          cabbageGet "dlyfb2"
 kDlyMix2      cabbageGet "dlymix2"
 kRvrbSize2    cabbageGet "rvrbsize2"
 kRvrbMix2     cabbageGet "rvrbmix2"
 ;w-g-Flute
 kDlyTime3     cabbageGet "dlyt3"
 kFb3          cabbageGet "dlyfb3"
 kDlyMix3      cabbageGet "dlymix3"
 kRvrbSize3    cabbageGet "rvrbsize3"
 kRvrbMix3     cabbageGet "rvrbmix3"


 aDelay1 myDelay (aSeqIn1+aSeqIn2), kDlyTime1,kFb1, kBPM1, kDlyMod, kDlyMix1
 aRvrb1  myRvrb  aDelay1, kRvrbSize1, kRvrbMix1
 
 aDelay2 myDelay aInBow, kDlyTime2,kFb2, 90, 2, kDlyMix2
 aRvrb2  myRvrb  aDelay2, kRvrbSize2, kRvrbMix2
 
 aDelay3 myDelay aInFlt, kDlyTime3,kFb3, 90, 2, kDlyMix3
 aRvrb3  myRvrb  aDelay3, kRvrbSize3, kRvrbMix3
 
aOut1 = (aRvrb1+aRvrb2+aRvrb3)*aMainGain
aOut2 = (aRvrb1+aRvrb2+aRvrb3)*aMainGain

out aOut1, aOut2
 kMax1 max_k aOut1, metro(20), 1
 cabbageSetValue "meter1", kMax1, metro(20)
  kMax2 max_k aOut2, metro(20), 1
 cabbageSetValue "meter2", kMax2, metro(20)
;;speakers
 chnclear "sndseq1", "sndseq2" 
 chnclear "sndbow", "sndflt"
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

endin


instr loadbang
    iArrSeq1[] fillarray 1,0,0,1,1,0,0,1,0,1,0,0,1
    iArrRep1[] fillarray 0,0,0,0,0,1,0,0,0,0,0,0,0
    iArrBas1[] fillarray 0,0,0,0,1,0,0,0,0,0,0,0,0   
    iArrSeq2[] fillarray 0,1,1,0,0,1,0,0,1,0,0,1,0
    iArrRep2[] fillarray 0,0,0,0,0,0,0,0,0,0,0,1,0
    iArrBas2[] fillarray 0,0,0,1,0,0,1,0,0,0,0,0,0
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
    Ssq sprintf "sqsteps%d",indx+72
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



instr Time
kSec init 0
if metro(1) == 1 then
kSec = (kSec+1) % 60
endif
kMin init 0
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
schedulek "speaker",0,iDurMaster
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 "Time", 0, 0
turnoff2 "seq", 0,0
turnoff2 "Sound", 0,1
turnoff2 "record", 0,0
turnoff2 "speaker",0,0
endif
    if kSeq2Play == 1 && changed(kSeq2Play) == 1 then
    schedulek "seq",0,iDurMaster, 1
    schedulek "seq",0,iDurMaster, 2
    elseif kSeq2Play == 0 && changed(kSeq2Play) == 1 then
    turnoff2 "seq",0,0
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
    kTrigWG cabbageGet "wgfolder"
    if     kTrigWG == 1 && changed(kTrigWG) == 1 then
	cabbageSet 1, "pops1", "visible(1)"
    elseif kTrigWG == 0 && changed(kTrigWG) == 1 then
	cabbageSet 1, "pops1", "visible(0)"
    endif
    kBowOnOff cabbageGet "bowonoff"
    if kBowOnOff == 1 && changed(kBowOnOff) == 1 then
    schedulek "bow", 0, 99999
    elseif kBowOnOff == 0 && changed(kBowOnOff) == 1 then
    turnoff2 "bow", 0, 1
    endif
    kFltOnOff cabbageGet "fltonoff"
    if kFltOnOff == 1 && changed(kFltOnOff) == 1 then
    schedulek "flute", 0, 99999
    elseif kFltOnOff == 0 && changed(kFltOnOff) == 1 then
    turnoff2 "flute", 0, 1
    endif
    kTrigFX cabbageGet "fxfolder"
    if     kTrigFX == 1 && changed(kTrigFX) == 1 then
	cabbageSet 1, "pops2", "visible(1)"
    elseif kTrigFX == 0 && changed(kTrigFX) == 1 then
	cabbageSet 1, "pops2", "visible(0)"
    endif 
    kTrigMidiFolder cabbageGet "midifolder"
    if     kTrigMidiFolder == 1 && changed(kTrigMidiFolder) == 1 then
	cabbageSet 1, "pops3", "visible(1)"
    elseif kTrigMidiFolder == 0 && changed(kTrigMidiFolder) == 1 then
	cabbageSet 1, "pops3", "visible(0)"
    endif 
endin


</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>