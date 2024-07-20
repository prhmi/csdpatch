;v3
<Cabbage>
form caption("DoubleCoreLa")    size(800, 500)   guiMode("queue")         colour(30,0,40)             pluginId("crlp") ; style("legacy")

label    bounds(35, 15, 40, 12)    channel("label1")  text("On/Off")
label    bounds(35, 42, 30, 12)    channel("label2")  text("Hold")
label    bounds(198, 16, 50, 12)   channel("labe12")  text("Duration")
label    bounds(10, 72, 28, 12)    channel("label3")  text("seq") 
label    bounds(10, 92, 28, 12)    channel("label4")  text("acc")
label    bounds(10, 130, 28, 12)   channel("label5")  text("bss")
label    bounds(10, 110, 28, 12)   channel("label6")  text("rep")
label    bounds(434, 10, 90, 12)   channel("label7")  text("sound On/Off")
label    bounds(35, 187, 40, 12)   channel("label8")  text("On/Off")
label    bounds(196, 188, 50, 12)  channel("labe19")  text("Duration")
label    bounds(10, 242, 28, 12)   channel("label10") text("seq")
label    bounds(10, 262, 28, 12)   channel("label11") text("acc")
label    bounds(10, 300, 28, 12)   channel("label12") text("bss")
label    bounds(10, 280, 28, 12)   channel("label13") text("rep")
label    bounds(441, 182, 83, 12)  channel("label14") text("sound On/Off")
label    bounds(478, 206, 46, 12)  channel("label15") text("Reverse")
label    bounds(478, 36, 46, 12)   channel("label16") text("Reverse")
label    bounds(48, 356, 78, 13)   channel("label17") text("Fx on/off")
label    bounds(624, 18, 78, 13)   channel("label18") text("pad on/off")
label    bounds(746, 46, 45, 16)   channel("label19") text("FM")
label    bounds(88, 44, 100, 20)  channel("noteshow1")  fontColour(208, 157, 253, 255)
label    bounds(12, 208, 100, 20)  channel("noteshow2") text("") fontColour(208, 157, 253, 255)


checkbox bounds(10, 10, 20, 20)    channel("sq1")     popupText("Start")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(1)
checkbox bounds(12, 40, 15, 15)    channel("hold")    popupText("Hold")            colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(1)
checkbox bounds(530, 8, 15, 15)    channel("dng1")    popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(1)
checkbox bounds(530, 180, 15, 15)  channel("dng2")    popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(1)
checkbox bounds(530, 34, 15, 15)   channel("rvrs1")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(530, 204, 15, 15)  channel("rvrs2")   popupText("Synth")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(0)
checkbox bounds(12, 186, 15, 15)   channel("sq2")     popupText("Start")           colour:0(100, 100, 100, 255) colour:1(100, 250, 60, 255) value(1)
checkbox bounds(22, 350, 22, 22)   channel("fx")                                   colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
checkbox bounds(380, 400, 15, 15)   channel("dl1")                                  colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
checkbox bounds(402, 400, 15, 15)   channel("dl2")                                  colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
checkbox bounds(594, 14, 22, 22)   channel("pdfx")                                   colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)


nslider  bounds(90, 9, 40, 31)     channel("BPM1")    range(20, 280, 90, 1, 1)     fontColour(208, 157, 253, 255) text("BPM") 
nslider  bounds(130, 9, 30, 31)    channel("DV1")     range(1, 10, 4, 1, 1)        fontColour(208, 157, 253, 255) text("DV") 
nslider  bounds(162, 9, 30, 31)    channel("steps1")  range(1, 28, 13, 1, 1)       fontColour(208, 157, 253, 255) text("Step") 
nslider  bounds(90, 180, 40, 31)   channel("BPM2")    range(20, 280, 90, 1, 1)     fontColour(208, 157, 253, 255) text("BPM") 
nslider  bounds(130, 181, 30, 31)  channel("DV2")     range(1, 10, 4, 1, 1)        fontColour(208, 157, 253, 255) text("DV") 
nslider  bounds(162, 181, 30, 31)  channel("steps2")  range(1, 28, 13, 1, 1)       fontColour(208, 157, 253, 255) text("Step") 
nslider  bounds(742, 204, 47, 31)  channel("cnt")  range(10, 500, 50, 1, 1)       fontColour(208, 157, 253, 255) text("Cent") 
nslider  bounds(428, 201, 47, 31)  channel("oct")  range(-2, 2, 0, 1, 1)       fontColour(208, 157, 253, 255) text("octv") 

hslider  bounds(198, 32, 137, 21)  channel("dur1")    range(0.05, 2, 1.5, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) 
hslider  bounds(195, 204, 146, 21) channel("dur2")    range(0.05, 2, 1.3, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) 
hslider  bounds(586, 184, 152, 21) channel("spdstrngmin")    range(0.1, 1, 0.7, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("spdMin")  
hslider  bounds(586, 54, 152, 21) channel("pres")    range(0.2, 0.7,0.3, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("pres")  
hslider  bounds(586, 86, 152, 21) channel("pos")    range(0.2, 0.7, 0.7, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("pose")  
hslider  bounds(586, 118, 152, 21) channel("vib")    range(0.2, 0.7,0.5, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("vib")  
hslider  bounds(586, 154, 152, 21) channel("spdstrng")    range(0.7, 12, 5, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("spdMax")  
hslider  bounds(586, 214, 152, 21) channel("spdfrq")    range(0.6, 12, 1, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("spdFrq")  

vslider  bounds(750, 62, 20, 130) channel("fma")    range(0, 400, 40, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("a")  
vslider  bounds(770, 62, 20, 130) channel("fmf")    range(1, 400, 100, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) text("f")  

rslider  bounds(574, 356, 60, 60)   channel("att")     range(0.0001, 0.05, 0.001, 1, 0.0001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Att")     
rslider  bounds(626, 356, 60, 60)   channel("fltr")     range(100, 8000, 1000, 1, 1) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Fltr")     
rslider  bounds(730, 356, 60, 60)   channel("rvbpad")     range(0.3, 0.9, 0.75, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("pad rvb")     
rslider  bounds(586, 252, 60, 60)   channel("attpad")     range(0.1, 2, 0.1, 1, 0.01) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Att")     
rslider  bounds(638, 252, 60, 60)   channel("relpad")     range(0.1, 3, 1.5, 1, 0.01) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Rel")     
rslider  bounds(738, 252, 60, 60)   channel("ginpad")     range(0.1, 5, 1, 1, 0.01) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Gain")     
rslider  bounds(688, 252, 60, 60)   channel("pdfltr")     range(100, 8000, 1000, 1, 1) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Fltr")     
rslider  bounds(678, 356, 60, 60)   channel("dltmpd")     range(0, 3, 1, 1, 0.1) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("pad dly")     

rslider  bounds(130, 356, 60, 60)   channel("pan1")     range(0, 1, 0.5, 1, 0.1) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("pan1")     
rslider  bounds(190, 356, 60, 60)   channel("gn1")      range(0, 5, 0.5, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Gn1")
rslider  bounds(312, 356, 60, 60)   channel("gn2")      range(0, 5, 0.5, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Gn2")
rslider  bounds(250, 356, 60, 60)   channel("pan2")     range(0, 1, 0.5, 1, 0.1) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("pan2")     
rslider bounds(424, 356, 60, 60)    channel("fdb")      range(0, 1, 0.3, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("FdB")
rslider bounds(474, 356, 60, 60)    channel("rvrb")      range(0.3, 3, 0.3, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Rvrb")
rslider bounds(522, 356, 60, 60)    channel("dlGn")      range(0, 1, 0.3, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("fxGain")


nslider  bounds(380, 358, 40, 31) range(1, 12, 4, 1, 1)  fontColour(208, 157, 253, 255) text("Delay") channel("dlt")


combobox bounds(340, 30, 77, 25)   channel("BNote")   text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D")   value(2)
combobox bounds(308, 4, 109, 25)   channel("scale")   text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah",  "homayun", "bayat esf")  value(2) 
combobox bounds(346, 202, 77, 25)  channel("BNote2")  text("Note", "G", "A-", "Bb", "C", "E-", "D-", "F", "A", "B", "Gb", "D")   value(2)
combobox bounds(318, 174, 105, 25) channel("scale2")  text("Scale", "pythagorean", "shur", "abuata", "bayat tork", "afshari", "dashti", "nava", "segah", "chargah",  "homayun", "bayat esf") value(2) 
combobox bounds(58, 376, 68, 22)   channel("sound1")  text("Instr", "Dahina", "Wood", "Tibetan", "Albert", "sine", "Tri", "Saw", "Square", "myset", "Pick", "VCO")   value(6)
combobox bounds(58, 399, 68, 22)   channel("sound2")  text("Instr", "Dahina", "Wood", "Tibetan", "Albert", "sine", "Tri", "Saw", "Square", "myset", "Pick", "VCO")  value(4)
combobox bounds(718, 12, 71, 26)   channel("sound3")  text("Instr", "Sine", "Tri", "Saw", "Square")   value(2)
combobox bounds(8, 388, 42, 19)   channel("midichn")  text("1", "15")   value(1)


button   bounds(568, 432, 60, 25)  channel("saveA") text("Save A", "Save A") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)
button   bounds(568, 468, 60, 25)  channel("saveB") text("Save B", "Save B") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)
button   bounds(732, 432, 60, 25)  channel("loadA") text("Load A", "Load A") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)
button   bounds(732, 468, 60, 25)  channel("loadB") text("Load B", "Load B") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)
filebutton bounds(650, 432, 60, 25) channel("sampleA") text("sample A", "Loaded") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)
filebutton bounds(650, 468, 60, 25) channel("sampleB") text("sample B", "Loaded") colour:0(120, 45, 113, 255)  colour:1(120, 45, 113, 255)


keyboard bounds(4, 432, 554, 68) channel("keyboard10043") value(40)
label bounds(561, 318, 236, 16) channel("label10057") text("-------------------------------")
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

massign 1,1
massign 2,11
massign 3,12
massign 4,13
massign 5,15
massign 6,16

#include "DoubleCoreLa.udo"


 giArrNote[]    init 8
 giArrEmpty[]   init lenarray:i(giArrNote)
 giArrVeloc[]   init lenarray:i(giArrNote)
 giArrVel[] =   giArrVeloc
 giLenVel       lenarray giArrVel
 giNote[]       fillarray 1,1
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






instr GetMidi ;1
 iActive1 active 1
 iHold cabbageGetValue "hold"
 kRel release
 iNum notnum
 iVel veloc 0,127
 if iActive1 == 1 then
 giArrNote[] = giArrEmpty
 giArrVeloc[] = giArrEmpty
 giWriteNote = 0
 endif
 schedule "WriteMidi",0,.1,iNum,iVel
 	if kRel == 1 && changed(kRel) == 1 && iHold == 0 then
 	schedulek "WriteMidi", 0, .1,iNum,0
 	endif
endin
instr WriteMidi ;2
 iActive1 active 1
 iNote = p4
 iVel = p5
 iveloc = int((p5/127)*10)
 iveloc = ((iveloc/10)^1.5)*10
 if iveloc == 0 then
 iveloc = 1
 endif

 iLen lenarray giArrNote
 if iVel != 0 then
 					indxr = 0
 					iCountZero = 0
					while indxr < iLen do
						if giArrNote[indxr] != 0 then
						iCountZero += 1
						endif
					indxr += 1
					od
		if iCountZero != iLen then
			while giArrNote[giWriteNote] != 0 do
			giWriteNote = (giWriteNote+1) % iLen
			od
		else
			giWriteNote = (giWriteNote+1) % iLen
		endif
 giArrNote[giWriteNote] = iNote
 giArrVeloc[giWriteNote] = iveloc
 elseif iVel == 0 then
		indxw = 0
		while indxw < iLen do
			if giArrNote[indxw] == iNote then
			giArrNote[indxw] = 0
			giArrVeloc[indxw] = 0
			giWriteNote = indxw-1
			endif
		indxw += 1
		od
 giWriteNote = (giWriteNote-1) <= 0 ? 0 : giWriteNote
 endif
			if iActive1 == 0 then
			giWriteNote = 0
			endif
 giNote[] RmvZ giArrNote
 giLenNote lenarray giNote
 gkLenNote lenarray giNote

  giArrVel[] RmvZ giArrVeloc
  giLenVel lenarray giArrVel

endin


instr seq1
kActive1 active 1
kSeq2 cabbageGet "sq2"
  if kSeq2 == 1 then
  ;schedule "seq2",0,-1
  endif
kDing cabbageGet "dng1"
kHold cabbageGet "hold"

kAtt cabbageGet "att"
kFilter cabbageGet "fltr"
kSeqIndx   init 0
kNoteIndx  init 0
kBPM cabbageGet "BPM1"
kTempo = kBPM/60
kTms cabbageGet "DV1"
kSteps cabbageGet "steps1"
kTime = (kTempo*kTms)
;printk2 kTime
ksel = 0
kNoteIn = giNote[ksel]
kDur cabbageGet "dur1"
    if metro(kTime) == 1 then
    if kNoteIn > 20 then
    ;;sound
    SseqValue sprintfk "seq1%d",kSeqIndx
    kSeqValue cabbageGet SseqValue
    SaccValue sprintfk "acc1%d",kSeqIndx
    kAccValue cabbageGet SaccValue
      if kSeqValue == 1 then 
                    kNoteIndx  = (kNoteIndx+1)  % giLenNote
                    if changed(gkLenNote) == 1 then
                    kNoteIndx = gkLenNote-1
                    endif
                    kNote  = giNote[kNoteIndx]
        if kDing == 1 then
        schedulek "Sound1" ,0,kDur,kNote,kAccValue*2, kAtt,kFilter
        endif
      schedulek "MidiOut1",0,kDur,kNote,kAccValue*2
      endif
    ;;acc

    ;;Bss
    SbssValue sprintfk "bass1%d",kSeqIndx
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    		kBidx = 0
        kNoteBass = giNote[kBidx]
			  until kNoteBass < 45 do
  			kNoteBass = kNoteBass-12
  			enduntil
      if kDing == 1 then
      schedulek "Sound1" ,0,kDur,kNoteBass,0, 0.01,kFilter
      endif
    schedulek "MidiOut1",0,kDur,kNoteBass,0
    ;printk2 kNoteBass
    endif
    ;;Rep
    SrepValue sprintfk "rep1%d",kSeqIndx
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
              if kDing == 1 then
						  schedulek "Sound1",kTrigRep,kDurRep,kNoteRep,-3, 0.0001,kFilter
					    endif
					  schedulek "MidiOut1",kTrigRep,kDurRep,kNoteRep,-3
						kTrigRep += kDurRep
						kndxRep += 1
					od	
    endif
    endif
    schedulek "LEDon1",0,0.1,kSeqIndx
    schedulek "LEDoff1",1/kTime,0.1,kSeqIndx
    kSeqIndx = (kSeqIndx+1) % kSteps

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
iMidiNote = p4
iAmp cabbageGetValue "gn1"
iAmpdB ampdb p5
iAmp = iAmp*iAmpdB
iBaseNoteIn cabbageGetValue "BNote"

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
endif
iBaseNote ntom SbaseNote
iScale      cabbageGetValue "scale"
if iScale == 1 then
iMidiOut = iMidiNote
elseif iScale == 2 then
iMidiOut pythagorean iBaseNote,iMidiNote
SnoteName mton iMidiOut
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


Snote mton iMidiOut
Snote strsub Snote, 1
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow1",SnoteShow
endif
iFrq mtof iMidiOut

iAtt = p6
;iAtt cabbageGetValue "att"

iRvrs cabbageGetValue "rvrs1"
if iRvrs == 0 then
 aEnv transeg 0, iAtt,6, iAmp, p3-iAtt,-6, 0
elseif iRvrs == 1 then
 aEnv transeg 0, p3*(1-iAtt),4, iAmp,p3*iAtt,-4,0
endif





 iFilter = p7+iFrq
 
 iModIn cabbageGetValue "sound1"
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

aSine poscil3 iAmp, (iFrq)/giRtosScale,giWave
 aFilS clfilt aSine, iFilter, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnv
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


aSine poscil iAmp, iFrq,giWave
 aFilS clfilt aSine, iFilter, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnv
goto OUT


pick:
iplk  random 0.1, 0.8
ipick random 0.3, 0.9
iRel random p3-0.1, p3+0.1
irefl MirrorMe iRel, 0.5,1.5,0; random p3/2, 1
aPick wgpluck2 iplk,0.3, iFrq, ipick, irefl-0.01
 aFilV clfilt aPick, iFilter, 0, 10
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnv
goto OUT

VCO:
aVco    vco2   0.5,iFrq,0,0.5
 aFilV clfilt aVco, iFilter, 0, 10
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnv


OUT:

 iFx cabbageGetValue "fx"
 kPan cabbageGet "pan1"
 if iFx == 1 goto fx
aoutL,aoutR	pan2	aout, kPan
outs aoutL, aoutR
goto end
fx:
chnmix aout, "snd1"
end:
endin




instr seq2
kActive1 active 1
kDing cabbageGet "dng2"
kHold cabbageGet "hold"
kSeqIndx   init 0
kNoteIndx  init 0
kVelocIndx init 0
kBPM cabbageGet "BPM2"
kTempo = kBPM/60
kTms cabbageGet "DV2"
kSteps cabbageGet "steps2"
kAtt cabbageGet "att"
kFilter cabbageGet "fltr"
kOctave cabbageGet "oct"
kOct = 12*kOctave
kTime = (kTempo*kTms)
;printk2 kTime
ksel = 0
kNoteIn = giNote[ksel]
kDur cabbageGet "dur2"
    if metro(kTime) == 1 then
    if kNoteIn > 20 then
    ;;sound
    SseqValue sprintfk "seq2%d",kSeqIndx
    kSeqValue cabbageGet SseqValue
    SaccValue sprintfk "acc2%d",kSeqIndx
    kAccValue cabbageGet SaccValue
      if kSeqValue == 1 then 
                    kNoteIndx  = (kNoteIndx+1)  % giLenNote
                    if changed(gkLenNote) == 1 then
                    kNoteIndx = gkLenNote-1
                    endif
                    kNote  = giNote[kNoteIndx]+kOct
        if kDing == 1 then
        schedulek "Sound2" ,0,kDur,kNote,kAccValue*2, kAtt,kFilter
        endif
      schedulek "MidiOut2",0,kDur,kNote,kAccValue*2
      endif
    ;;acc

    ;;Bss
    SbssValue sprintfk "bass2%d",kSeqIndx
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    		kBidx = 0
        kNoteBass = giNote[kBidx]
			  until kNoteBass < 45 do
  			kNoteBass = kNoteBass-12
  			enduntil
      if kDing == 1 then
      schedulek "Sound2" ,0,kDur,kNoteBass,0, 0.01,kFilter
      endif
    schedulek "MidiOut2",0,kDur,kNoteBass,0
    ;printk2 kNoteBass
    endif
    ;;Rep
    SrepValue sprintfk "rep2%d",kSeqIndx
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
              if kDing == 1 then
						  schedulek "Sound2",kTrigRep,kDurRep,kNoteRep,0, 0.0001,kFilter
					    endif
					  schedulek "MidiOut2",kTrigRep,kDurRep,kNoteRep,0
						kTrigRep += kDurRep
						kndxRep += 1
					od	
    endif
    endif
    schedulek "LEDon2",0,0.1,kSeqIndx
    schedulek "LEDoff2",1/kTime,0.1,kSeqIndx
    kSeqIndx = (kSeqIndx+1) % kSteps
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
iMidiNote = p4
iAmp cabbageGetValue "gn2"
iAmpdB ampdb p5
iAmp = iAmp*iAmpdB
iBaseNoteIn cabbageGetValue "BNote2"

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
endif
iBaseNote ntom SbaseNote
iScale      cabbageGetValue "scale2"
if iScale == 1 then
iMidiOut = iMidiNote
elseif iScale == 2 then
iMidiOut pythagorean iBaseNote,iMidiNote
SnoteName mton iMidiOut
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
Snote mton iMidiOut
Snote strsub Snote, 1
if changed(Snote) == 1 then
    SnoteShow     sprintf "text(%s)", Snote
    cabbageSet "noteshow2",SnoteShow
endif
iFrq mtof iMidiOut

iAtt = p6
;iAtt cabbageGetValue "att"

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

aSine poscil3 iAmp, (iFrq)/giRtosScale,giWave
 aFilS clfilt aSine, iFilter, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnv
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


aSine poscil iAmp, iFrq,giWave
 aFilS clfilt aSine, iFilter, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnv
goto OUT


pick:
iplk  random 0.1, 0.8
ipick random 0.3, 0.9
iRel random p3-0.1, p3+0.1
irefl MirrorMe iRel, 0.5,1.5,0; random p3/2, 1
aPick wgpluck2 iplk,0.3, iFrq, ipick, irefl-0.01
 aFilV clfilt aPick, iFilter, 0, 10
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnv
goto OUT

VCO:
aVco    vco2   0.5,iFrq,0,0.5
 aFilV clfilt aVco, iFilter, 0, 10
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnv


OUT:

 iFx cabbageGetValue "fx"
 kPan cabbageGet "pan2"
 if iFx == 1 goto fx
aoutL,aoutR	pan2	aout, kPan
outs aoutL, aoutR
goto end
fx:
chnmix aout, "snd2"
end:
endin


;--------------------------------------------------
;pad sound





instr String
iAttEnv cabbageGetValue "attpad"
iRelEnv cabbageGetValue "relpad"
iGain cabbageGetValue "ginpad"
iPosIn cabbageGetValue "pos"
iPresIn cabbageGetValue "pres"
iVibIn cabbageGetValue "vib"
 iNum notnum
  	iFrqMin mtof iNum
 	iFilter cabbageGetValue "pdfltr"
    iCent cabbageGetValue "cnt"
 	iFrq = iFrqMin+cent(5)
 iSpeed cabbageGetValue "spdstrng"
 iSpdFrq cabbageGetValue "spdfrq"
 iSpeedMin cabbageGetValue "spdstrngmin"
	kAmp    rspline  0.2, 0.3, 0.7, 1
	kFrq    rspline  iFrq, iFrq*cent(iCent), 0.4, iSpdFrq
	kPres   rspline  0.1, iPresIn*10, iSpeedMin-0.1, iSpeed
	kRate   rspline  0.1, iPosIn*10, iSpeedMin-0.3, iSpeed
	kVib    rspline  1,   iVibIn*10, iSpeedMin, iSpeed
	aSound	wgbow    kAmp*iGain,kFrq,kPres,kRate,kVib,0,giSine,iFrqMin
	aSound  tone     aSound,iFilter
	aSound  atone    aSound,500
	aAtt transeg 0, iAttEnv, 4, 1
    aRel transegr 1, iRelEnv, -4, 0
	aOut = aSound*aAtt*aRel*1.3
	chnmix aOut, "sndpad"
endin


instr Brass
iAttEnv cabbageGetValue "attpad"
iRelEnv cabbageGetValue "relpad"
iGain cabbageGetValue "ginpad"
iTenseIn cabbageGetValue "pres"
iVampIn cabbageGetValue "pos"
iVibIn cabbageGetValue "vib"

 iSpdFrq cabbageGetValue "spdfrq"
 iSpeedMin cabbageGetValue "spdstrngmin"
 
 iNum notnum
 iAtt random 0.01, 0.1
  	iFrqMin mtof iNum
 	iFilter cabbageGetValue "pdfltr"
    iCent cabbageGetValue "cnt"
 	iFrq = iFrqMin+cent(1200)
 iSpeed cabbageGetValue "spdstrng"

 
	kAmp    rspline  0.1, 0.2, 0.7, 1
	kFrq    rspline  iFrq, iFrq*cent(iCent), 0.4,iSpdFrq
	kTens   rspline  0.1, iTenseIn, iSpeedMin, iSpeed
	kVib    = kFrq-cent(iVibIn*1000)

	kvamp   rspline  0.1, iVampIn, iSpeedMin, iSpeed
	aSound	wgbrass    kAmp,kFrq,kTens,iAtt,kVib,kvamp,giSine,iFrqMin

	
	aFilter  tone     aSound,iFilter
	aFilter  atone    aFilter,200
	aAtt transeg 0, iAttEnv, 4, 1
    aRel transegr 1, iRelEnv, -4, 0
	aOut = aFilter*aAtt*aRel*iGain*0.5
	chnmix aOut, "sndpad"
endin


instr Sine
iAttEnv cabbageGetValue "attpad"
iRelEnv cabbageGetValue "relpad"
iGain cabbageGetValue "ginpad"
 iNum notnum
 iFrq mtof iNum
 iCent cabbageGetValue "cnt"
; print iCent
 iMod cabbageGetValue "sound3"
 iSpeed cabbageGetValue "spdstrng"
  	iFilter cabbageGetValue "pdfltr"
  
iPlusF1 cabbageGetValue "pres"
iPlusF2 cabbageGetValue "pos"
iPlusF3 cabbageGetValue "vib"
 iSpdFrq cabbageGetValue "spdfrq"
 iSpeedMin cabbageGetValue "spdstrngmin"
 
if iMod == 2 then
giWave = giSineTwo
elseif iMod == 3 then
giWave = giTri
elseif iMod == 4 then
giWave = giSaw
elseif iMod == 5 then
giWave = giSquare
endif
 	kAmp    rspline  0.2, 0.3, 0.7, 1
 	kFrq    rspline  iFrq, iFrq*cent(iCent), iSpeedMin,iSpdFrq

iFmAmp cabbageGetValue "fma"
iFmFrq cabbageGetValue "fmf"
aFM poscil iFmAmp, iFmFrq
aSound1 poscil kAmp*iGain, kFrq+aFM, giWave
aSound2 poscil kAmp*iGain*0.1, kFrq+(iPlusF1*10)
aSound3 poscil kAmp*iGain*0.1, kFrq+(iPlusF2*10)
aSound4 poscil kAmp*iGain*0.1, kFrq+(iPlusF3*10)

aSound sum aSound1,aSound2,aSound3,aSound4

if iSpeed <= 0.7 then
aSound = aSound1
endif
    aSound clfilt aSound, iFilter, 0, 10
	aSound clfilt aSound, 350, 1, 10
	aAtt transeg 0, iAttEnv, 4, 1
    aRel transegr 1, iRelEnv, -4, 0
	aOut = aSound*aAtt*aRel*0.8
	chnmix aOut, "sndpad"
endin


instr PadFx
aIn chnget "sndpad"
aSound = aIn
kTime cabbageGet "dltmpd"
if kTime <= 0.2 kgoto rvb
kFeedback cabbageGet "fdb"
 	aTim	interp	kTime
 	abuf	delayr	7
 	aDelay	deltapi	aTim	
 	delayw	aIn + (aDelay*kFeedback)
  	aSound		ntrpol	 aIn,aDelay,  .65
  
rvb:

kRvrb cabbageGet "rvbpad"
	aRvbL,aRvbR reverbsc aSound,aSound,kRvrb,7000
	aMixL		ntrpol	 aSound,aRvbL,  .4
	aMixR		ntrpol	 aSound,aRvbR,  .4	
   outs     aMixL,aMixR
 
chnclear "sndpad"
endin

;;--------------------------------------------------------------
;sample


instr Sample1
iAttEnv cabbageGetValue "attpad"
iRelEnv cabbageGetValue "relpad"
iLen filelen gSfile1
iStart random 0, iLen
iNum notnum
iInterval = (iNum-60)*50
iCent cent iInterval
aSound,aSound diskin2 gSfile1, iCent,iStart,1
	aAtt transeg 0, iAttEnv, 4, 1
    aRel transegr 1, iRelEnv, -4, 0
aOut = aSound*aAtt*aRel
outall aOut
endin

instr Sample2
iAttEnv cabbageGetValue "attpad"
iRelEnv cabbageGetValue "relpad"
iLen filelen gSfile2
iStart random 0, iLen
iNum notnum
iInterval = (iNum-60)*50
iCent cent iInterval
aSound,aSound diskin2 gSfile2, iCent,iStart,1
	aAtt transeg 0, iAttEnv, 4, 1
    aRel transegr 1, iRelEnv, -4, 0
aOut = aSound*aAtt*aRel
outall aOut
endin


instr hold
 cabbageSetValue "hold",p4
endin

instr Empty ;7
print 1
if p4 == 1 then
 giArrNote [] = giArrEmpty
 giNote    [] = giArrEmpty
elseif p4 == 2 then
giArrVel [] RmvZ giArrVeloc
giLenVel lenarray giArrVel
;printarray giArrVel, "%d"
endif
endin

;--------------------------------------------------------
;Midi
instr MidiOut1 ;12
inum = p4
ivel = int((p5*127)/10)
midion 1, inum, ivel
endin

instr MidiOut2 ;12
inum = p4
ivel = int((p5*127)/10)
midion 2, inum, ivel
endin


;-------------------------------------------------------
;Effects


instr Effect

kDelayTime cabbageGet "dlt"
kFeedback cabbageGet "fdb"

;;sound
aIn1 chnget "snd1"
aSound1 = aIn1
aIn2 chnget "snd2"
aSound2 = aIn2
;;time
kBPM1 cabbageGet "BPM1"
kTempo1 = kBPM1/60
kTms1 cabbageGet "DV1"
kTime1 = (1/(kTempo1*kTms1))*kDelayTime
kBPM2 cabbageGet "BPM2"
kTempo2 = kBPM2/60
kTms2 cabbageGet "DV2"
kTime2 = (1/(kTempo2*kTms2))*kDelayTime


kDelay1 cabbageGet "dl1"
kDelay2 cabbageGet "dl2"

if kDelay1 == 0 && kDelay2 == 0 then
aSoundD = aSound1*0
kTime = 0.1
elseif kDelay1 == 1 && kDelay2 == 0 then
kTime = kTime1
aSoundD = aSound1
elseif kDelay1 == 0 && kDelay2 == 1 then
kTime = kTime2
aSoundD = aSound2
elseif kDelay1 == 1 && kDelay2 == 1 then
kTime = kTime1
aSoundD = aSound1+aSound2
endif

kDelayMix cabbageGet "dlGn"
 	aTim	interp	kTime
 	abuf	delayr	7
 	aDelay	deltapi	aTim	
 	delayw	aSoundD + (aDelay*kFeedback)
  	aDelMix		ntrpol	 aSoundD,aDelay,  kDelayMix
  
  aSound = aSound1+aSound2
  
kRvrbMix = kDelayMix*0.5

kRvt cabbageGet "rvrb"
a1          comb        aSound, kRvt, 0.0297
a2          comb        aSound, kRvt, 0.0371
a3          comb        aSound, kRvt, 0.0411
a4          comb        aSound, kRvt, 0.0437
asum        sum     a1,a2,a3,a4 
a5 alpass asum, 0.1, 0.005 
aOut        alpass a5, 0.1, 0.02291 
aRvrb        ntrpol      aSound, aOut, kRvrbMix

amix        ntrpol      aRvrb, aDelMix, 0.7


out amix,amix
chnclear "snd1"
chnclear "snd2"
endin



;-------------------------------------------------------
;widgets
instr widgetWrite
    iX = 0
    iCount = 0
    ispc = 0
    while iCount < giSteps do
            Sseq1    sprintf "bounds(%d, 70, 15, 15)  , channel(\"seq1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sacc1    sprintf "bounds(%d, 90, 15, 15)  , channel(\"acc1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Srep1    sprintf "bounds(%d, 110, 15, 15) , channel(\"rep1%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount           
            Sbass1   sprintf "bounds(%d, 130, 15, 15) , channel(\"bass1%d\")      colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount           
             Slte1   sprintf "bounds(%d, 150, 12, 12) , channel(\"lte1%d\")       colour(100, 100, 100, 200) ", 51+iCount*(17)+ispc, iCount

            Sseq2    sprintf "bounds(%d, 240, 15, 15) , channel(\"seq2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sacc2    sprintf "bounds(%d, 260, 15, 15) , channel(\"acc2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Srep2    sprintf "bounds(%d, 280, 15, 15) , channel(\"rep2%d\")       colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sbass2   sprintf "bounds(%d, 300, 15, 15) , channel(\"bass2%d\")      colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Slte2    sprintf "bounds(%d, 320, 12, 12) , channel(\"lte2%d\")       colour(100, 100, 100, 200) ", 51+iCount*(17)+ispc, iCount
            
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
    kArrRep2[] fillarray 0,0,0,0,1,0,0,0,0,0,0,1,0
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


instr saveWidgets
    Sp4 = p4
    indx = 0
    while indx < giSteps do
    Sseq1Save   sprintf "seq1%d",indx
    Sacc1Save   sprintf "acc1%d",indx
    Srep1Save   sprintf "rep1%d",indx
    Sbass1Save  sprintf "bass1%d",indx
    
    Sseq2Save   sprintf "seq2%d",indx
    Sacc2Save   sprintf "acc2%d",indx
    Srep2Save   sprintf "rep2%d",indx
    Sbass2Save  sprintf "bass2%d",indx

    iSeq1   cabbageGetValue Sseq1Save
    iAcc1   cabbageGetValue Sacc1Save
    iRep1   cabbageGetValue Srep1Save
    iBass1  cabbageGetValue Sbass1Save
    
    iSeq2   cabbageGetValue Sseq2Save
    iAcc2   cabbageGetValue Sacc2Save
    iRep2   cabbageGetValue Srep2Save
    iBass2  cabbageGetValue Sbass2Save
    
    giStepArr1[indx]    = iSeq1
    giAccArr1[indx]     = iAcc1
    giRepArr1[indx]     = iRep1
    giBassArr1[indx]    = iBass1
    
    giStepArr2[indx]    = iSeq2
    giAccArr2[indx]     = iAcc2
    giRepArr2[indx]     = iRep2
    giBassArr2[indx]    = iBass2
    
    indx += 1
    od
    
    Sseqtxt1 ArrToStrg giStepArr1
    Sacctxt1 ArrToStrg giAccArr1
    Sreptxt1 ArrToStrg giRepArr1
    Sbastxt1 ArrToStrg giBassArr1
    
    Sseqtxt2 ArrToStrg giStepArr2
    Sacctxt2 ArrToStrg giAccArr2
    Sreptxt2 ArrToStrg giRepArr2
    Sbastxt2 ArrToStrg giBassArr2

    Spreset sprintf "preset%s.txt",Sp4
;    Spreset sprintf "d:/preset%s.txt",Sp4
if metro(0) == 1 then
    fprintks Spreset, ""
endif
    fprints Spreset, "%s \n", Sseqtxt1
    fprints Spreset, "%s \n", Sacctxt1
    fprints Spreset, "%s \n", Sreptxt1
    fprints Spreset, "%s \n", Sbastxt1
    
    fprints Spreset, "%s \n", Sseqtxt2
    fprints Spreset, "%s \n", Sacctxt2
    fprints Spreset, "%s \n", Sreptxt2
    fprints Spreset, "%s \n", Sbastxt2
    
    
    iBPM1       cabbageGetValue "BPM1"
    iBPM2       cabbageGetValue "BPM2"
    iDV1        cabbageGetValue "DV1"
    iDV2        cabbageGetValue "DV2"
    iDur1       cabbageGetValue "dur1"
    iDur2       cabbageGetValue "dur2"
    iScale1     cabbageGetValue "scale"
    iScale2     cabbageGetValue "scale2"
    iBaseNote1  cabbageGetValue "BNote"
    iBaseNote2  cabbageGetValue "BNote2"
    iSteps1     cabbageGetValue "steps1"
    iSteps2     cabbageGetValue "steps2"
    iOct        cabbageGetValue "oct"
    iSound1     cabbageGetValue "sound1"
    iSound2     cabbageGetValue "sound2"
    
    fprints Spreset, "%f \n", iBPM1
    fprints Spreset, "%f \n", iBPM2
    fprints Spreset, "%f \n", iDV1
    fprints Spreset, "%f \n", iDV2
    fprints Spreset, "%f \n", iDur1
    fprints Spreset, "%f \n", iDur2
    fprints Spreset, "%f \n", iScale1
    fprints Spreset, "%f \n", iScale2
    fprints Spreset, "%f \n", iBaseNote1
    fprints Spreset, "%f \n", iBaseNote2
    fprints Spreset, "%f \n", iSteps1
    fprints Spreset, "%f \n", iSteps2
    fprints Spreset, "%f \n", iOct
    fprints Spreset, "%f \n", iSound1
    fprints Spreset, "%f \n", iSound2
    
endin



instr loadWidgets
    Sp4 = p4
iEkhtelaf = 15
   Spreset sprintf "preset%s.txt",Sp4
;   Spreset sprintf "d:/preset%s.txt",Sp4
   iLoad ftgen 0,0,0,-23,Spreset
   iLenLoad ftlen iLoad
   
   indxtxt = 0
   indxLine = 0
   indxArr = 0
while indxtxt < iLenLoad-iEkhtelaf do
    Sseq1   sprintf "seq1%d",indxLine
    Sacc1   sprintf "acc1%d",indxLine
    Srep1   sprintf "rep1%d",indxLine
    Sbass1  sprintf "bass1%d",indxLine
    
    Sseq2   sprintf "seq2%d",indxLine
    Sacc2   sprintf "acc2%d",indxLine
    Srep2   sprintf "rep2%d",indxLine
    Sbass2  sprintf "bass2%d",indxLine

    SwidgetArr[] fillarray Sseq1,Sacc1,Srep1,Sbass1,Sseq2,Sacc2,Srep2,Sbass2

    iValue table indxtxt,iLoad  
    cabbageSetValue SwidgetArr[indxArr],iValue
    indxLine = (indxLine+1) % giSteps
    if indxLine == 0 then
    indxArr += 1
    endif
    indxtxt += 1
od


SwidgetArr2[] fillarray "BPM1","BPM2","DV1","DV2","dur1","dur2","scale","scale2","BNote","BNote2",\
    "steps1","steps2","oct","sound1","sound2"

iRead = 0
while indxtxt < iLenLoad do
iValue table indxtxt,iLoad 
cabbageSetValue SwidgetArr2[iRead],iValue
indxtxt += 1
iRead += 1
od 
    
endin


instr Widgets
    schedule "widgetWrite", 0, 1
    kSaveA cabbageGet "saveA"
    if changed(kSaveA) == 1 then
    schedulek "saveWidgets", 0, 1, "A"
    endif

    kSaveB cabbageGet "saveB"
    if changed(kSaveB) == 1 then
    schedulek "saveWidgets", 0, 1, "B"
    endif

    kLoadA cabbageGet "loadA"
    if changed(kLoadA) == 1 then
    schedulek "loadWidgets", 0, 1, "A"
    endif

    kLoadB cabbageGet "loadB"
    if changed(kLoadB) == 1 then
    schedulek "loadWidgets", 0, 1, "B"
    endif
    
   kPedal ctrl7 1,64,0,1
  if kPedal == 1 && changed(kPedal) == 1 then
  schedulek "hold", 0,0.1,1
  elseif kPedal == 0 && changed(kPedal) == 1 then
  schedulek "Empty",0,0.1,1
  schedulek "hold",0,0.1,0
  endif
    
    
    kSeq1Play cabbageGet "sq1"
kSeq2Play cabbageGet "sq2"
if kSeq1Play == 1 && changed(kSeq1Play) == 1 then
schedulek "seq1",0,-1
  if kSeq2Play == 1 then
  schedulek "seq2",0,-1
  endif
elseif kSeq1Play == 0 && changed(kSeq1Play) == 1 then
turnoff2 "seq1",0,0
turnoff2 "seq2",0,0
endif

if kSeq2Play == 0 && changed(kSeq2Play) == 1 then
turnoff2 "seq2",0,0
endif


kFx cabbageGet "fx"

if kFx == 1 && changed(kFx) == 1 then
schedulek "Effect", 0, 9999999
elseif kFx == 0 && changed(kFx) == 1 then
turnoff2 "Effect",0,0
endif

kPadFx cabbageGet "pdfx"

if kPadFx == 1 && changed(kPadFx) == 1 then
schedulek "PadFx", 0, 9999999
elseif kPadFx == 0 && changed(kPadFx) == 1 then
turnoff2 "PadFx",0,0
endif

  kWidgetLoad   ctrl7    1,63,0,1
  if kWidgetLoad == 0 && changed(kWidgetLoad) == 1 then
  schedulek "loadWidgets", 0, 1, "A"
  elseif kWidgetLoad == 1 && changed(kWidgetLoad) == 1 then
schedulek "loadWidgets", 0, 1, "B"
  endif


gSfile1    cabbageGet    "sampleA" 
gSfile2    cabbageGet    "sampleB" 
    
    
    aInL,aInR monitor
;    fout "record.wav", 8, aInL, aInR
endin



</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

