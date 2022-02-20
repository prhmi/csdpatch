
<Cabbage>
form caption("DoubleCoreLa") size(650, 350)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("crlp")
image bounds(0, 0, 650, 350) channel("img") file("DoubleCoreLa.jpg")
;;sequencer1
label    bounds(35, 15, 40, 12) text("On/Off") channel("label1")
checkbox bounds(10, 10, 20, 20) colour:0(100, 100, 100, 255) popupText("Start")  channel("sq1") colour:1(100, 250, 60, 255) value(1)
checkbox bounds(12, 40, 15, 15) colour:0(100, 100, 100, 255) popupText("Hold")  channel("hold") colour:1(100, 250, 60, 255) value(0)
label    bounds(35, 42, 30, 12) text("Hold") channel("label2")
nslider  bounds(90, 9, 40, 31) range(50, 180, 90, 1, 1)  fontColour(208, 157, 253, 255) text("BPM") channel("BPM1")
nslider  bounds(130, 9, 30, 31) range(1, 10, 4, 1, 1)  fontColour(208, 157, 253, 255) text("DV") channel("DV1") 
nslider  bounds(162, 9, 30, 31) range(1, 28, 13, 1, 1)  fontColour(208, 157, 253, 255) text("Step") channel("steps1")
label    bounds(236, 24, 50, 12) text("Duration") channel("labe12")
hslider bounds(236, 36, 150, 21) range(0.05, 2, 1.5, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) channel("dur1")
label    bounds(10, 72, 28, 12) text("seq") channel("label3")
label    bounds(10, 92, 28, 12) text("acc") channel("label4")
label    bounds(10, 112, 28, 12) text("bss") channel("label5")
label    bounds(10, 132, 28, 12) text("rep") channel("label6")
;;synth1
label    bounds(484, 10, 40, 12) text("On/Off") channel("label10")
checkbox bounds(530, 8, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("dng1") colour:1(100, 250, 60, 255) value(1)
combobox bounds(396, 30, 77, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2)
combobox bounds(396, 4, 77, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2) 
label    bounds(196, 8, 40, 12) text("Veloc") channel("label11")
checkbox bounds(206, 26, 15, 15) colour:0(100, 100, 100, 255) popupText("velocity")  channel("vlc") colour:1(100, 250, 60, 255) value(1)
;sequncer2
label    bounds(35, 187, 40, 12) text("On/Off") channel("label20")
checkbox bounds(12, 186, 15, 15) colour:0(100, 100, 100, 255) popupText("Start")  channel("sq2") colour:1(100, 250, 60, 255) value(1)
nslider  bounds(90, 180, 40, 31) range(50, 180, 90, 1, 1)  fontColour(208, 157, 253, 255) text("BPM") channel("BPM2")
nslider  bounds(130, 181, 30, 31) range(1, 10, 4, 1, 1)  fontColour(208, 157, 253, 255) text("DV") channel("DV2") 
nslider  bounds(162, 181, 30, 31) range(1, 28, 13, 1, 1)  fontColour(208, 157, 253, 255) text("Step") channel("steps2")
hslider bounds(236, 196, 150, 21) range(0.05, 2, 1.3, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) channel("dur2")
label    bounds(236, 182, 50, 12) text("Duration") channel("labe19")
label    bounds(10, 242, 28, 12) text("seq") channel("label22")
label    bounds(10, 262, 28, 12) text("acc") channel("label23")
label    bounds(10, 282, 28, 12) text("bss") channel("label24")
label    bounds(10, 302, 28, 12) text("rep") channel("label25")
;;synth2
label    bounds(484, 182, 40, 12) text("On/Off") channel("label30")
checkbox bounds(530, 180, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("dng2") colour:1(100, 250, 60, 255) value(1)
combobox bounds(396, 202, 77, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote2")  value(2)
combobox bounds(396, 176, 77, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale2") value(2) 
label    bounds(478, 206, 46, 12) text("Reverse") channel("label31")
checkbox bounds(530, 204, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("rvrs2") colour:1(100, 250, 60, 255) value(0)
label    bounds(478, 36, 46, 12) text("Reverse") channel("label32")
checkbox bounds(530, 34, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("rvrs1") colour:1(100, 250, 60, 255) value(0)
button bounds(296, 12, 41, 20) channel("sve1") text("Save1", "Save1") colour:0(120, 45, 113, 255) colour:1(120, 45, 113, 255)
button bounds(340, 12, 41, 20) channel("sve2") text("Save2", "Save2") colour:0(120, 45, 113, 255) colour:1(120, 45, 113, 255)
;;fx
label    bounds(580, 6, 57, 12) text("Fx on/off") channel("label50")
checkbox bounds(582, 20, 54, 18) channel("fx") colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
rslider bounds(580, 268, 60, 60) channel("gn2") range(0, 2, 1, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Gn2")
rslider bounds(580, 200, 60, 60) channel("gn1") range(0, 2, 1, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("Gn1")
rslider bounds(580, 118, 60, 60) channel("fdb") range(0, 1, .3, 1, 0.001) valueTextBox(1) colour(250, 200, 250, 250) trackerColour(250, 150, 250, 255) text("FdB")
nslider  bounds(588, 44, 40, 31) range(1, 7, 4, 1, 1)  fontColour(208, 157, 253, 255) text("Delay") channel("dlt")
checkbox bounds(590, 80, 15, 15) channel("dl1") colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(1)
checkbox bounds(612, 80, 15, 15) channel("dl2") colour:0(100, 100, 100, 255) colour:1(141, 88, 156, 255) value(0)

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


#include "DoubleCoreLa.udo"

 giArrNote  [] init 8
 giArrEmpty [] init lenarray:i(giArrNote)
 giArrVeloc [] init lenarray:i(giArrNote)
 giArrVel [] = giArrVeloc
 giLenVel      lenarray giArrVel
 giNote     [] fillarray 1,1
 giWriteNote   init 0


instr GetMidi ;1
 iActive1 active 1
 iHold cabbageGetValue "hold"
 kRel release
 iNum notnum
 iVel veloc 0,127
 if iActive1 == 1 then
 giArrNote  [] = giArrEmpty
 giArrVeloc [] = giArrEmpty
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
						if giArrNote [indxr] != 0 then
						iCountZero += 1
						endif
					indxr += 1
					od
		if iCountZero != iLen then
			while giArrNote [giWriteNote] != 0 do
			giWriteNote = (giWriteNote+1) % iLen
			od
		else
			giWriteNote = (giWriteNote+1) % iLen
		endif
 giArrNote [giWriteNote] = iNote
 giArrVeloc [giWriteNote] = iveloc
 elseif iVel == 0 then
		indxw = 0
		while indxw < iLen do
			if giArrNote [indxw] == iNote then
			giArrNote [indxw] = 0
			giArrVeloc [indxw] = 0
			giWriteNote = indxw-1
			endif
		indxw += 1
		od
 giWriteNote = (giWriteNote-1) <= 0 ? 0 : giWriteNote
 endif
			if iActive1 == 0 then
			giWriteNote = 0
			endif
 giNote [] RmvZ giArrNote
 giLenNote lenarray giNote
 gkLenNote lenarray giNote
 ;printarray giArrNote,"%d", "Note:"
 ;printarray giNote,"%d","Note:"
 

  giArrVel [] RmvZ giArrVeloc
  giLenVel lenarray giArrVel
  ;print giLenVel
  ;print giLenNote
  ;printarray giArrVeloc,"%d","veloc:"
  ;printarray giArrVel,"%d","veloc:"
endin


instr seq1
kActive1 active 1
kSeq2 cabbageGet "sq2"
  if kSeq2 == 1 then
  ;schedule "seq2",0,-1
  endif
kDing cabbageGet "dng1"
kHold cabbageGet "hold"
kVelocity cabbageGet "vlc"
kSeqIndx   init 0
kNoteIndx  init 0
kVelocIndx init 0
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
                    kAcc = (kAccValue == 1) ? .8 : 1.2
                    kVelocIndx = (kVelocIndx+1) % giLenVel
                    if kVelocity == 0 then
                    kVeloc = giArrVel[kVelocIndx]
                    elseif kVelocity == 1 then
                    kVeloc = random:k( 1, 3)
                    endif
                    kVeloc = ((kVeloc/10)^kAcc)*10
        if kDing == 1 then
        schedulek "Sound1" ,0,kDur,kNote,kVeloc, 0.0001
        endif
      schedulek "MidiOut1",0,kDur,kNote,kVeloc
      endif
    ;;acc

    ;;Bss
    SbssValue sprintfk "bss1%d",kSeqIndx
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    		kBidx = 0
        kNoteBass = giNote[kBidx]
			  until kNoteBass < 45 do
  			kNoteBass = kNoteBass-12
  			enduntil
      if kDing == 1 then
      schedulek "Sound1" ,0,kDur,kNoteBass,2, 0.00001
      endif
    schedulek "MidiOut1",0,kDur,kNoteBass,2
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
						  schedulek "Sound1",kTrigRep,kDurRep,kNoteRep,2, 0.0001
					    endif
					  schedulek "MidiOut1",kTrigRep,kDurRep,kNoteRep,2
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
iAmp = p5*0.1
;print 1
;iBaseNote  ntom "0C"
iBaseNoteIn cabbageGetValue "BNote"
iBaseNote = iBaseNoteIn-2
iScale      cabbageGetValue "scale"
if iScale == 1 then
iFrq mtof iMidiNote
elseif iScale == 2 then
iFrq pythagorean iBaseNote-2,iMidiNote
elseif iScale == 3 then
iFrq shur iBaseNote-2,iMidiNote
elseif iScale == 4 then
iFrq homayun iBaseNote-2,iMidiNote
elseif iScale == 5 then
iFrq segah iBaseNote-2,iMidiNote
elseif iScale == 6 then
iFrq chargah iBaseNote-2,iMidiNote
endif
iAtt = p6

iRvrs cabbageGetValue "rvrs1"
if iRvrs == 0 then
 aEnv transeg 0, iAtt,6, iAmp, p3-iAtt,-13, 0
elseif iRvrs == 1 then
 aEnv transeg 0, p3*0.99,4, iAmp*0.1,p3*0.01,-6,0
endif
 aSine    vco2    1,iFrq,0,0.5
 aFilter clfilt aSine, 1000+(iFrq), 0, 10
 aFilter clfilt aFilter, 150, 1, 10
 aout = aFilter*aEnv
 iFx cabbageGetValue "fx"
 if iFx == 1 goto fx
outch 1, aout
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
kVelocity cabbageGet "vlc"
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
                    kNote  = giNote[kNoteIndx]
                    kAcc = (kAccValue == 1) ? 1 : 1.5
                    kVelocIndx = (kVelocIndx+1) % giLenVel
                    if kVelocity == 0 then
                    kVeloc = giArrVel[kVelocIndx]
                    elseif kVelocity == 1 then
                    kVeloc = random:k( 1, 3)
                    endif
                    kVeloc = ((kVeloc/10)^kAcc)*10
          ;printk2 kAcc
        if kDing == 1 then
        schedulek "Sound2" ,0,kDur,kNote,kVeloc,0.0003
        endif
      schedulek "MidiOut2",0,kDur,kNote,kVeloc
      endif
    ;;acc

    ;;Bss
    SbssValue sprintfk "bss2%d",kSeqIndx
    kBssValue cabbageGet SbssValue
    if kBssValue == 1 then
    		kBidx = 0
        kNoteBass = giNote[kBidx]
			  until kNoteBass < 45 do
  			kNoteBass = kNoteBass-12
  			enduntil
      if kDing == 1 then
      schedulek "Sound2" ,0,kDur,kNoteBass,1.5,0.005
      endif
    schedulek "MidiOut2",0,kDur,kNoteBass,1.5
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
						  schedulek "Sound2",kTrigRep,kDurRep+.5,kNoteRep,.7,.0003
					    endif
					  schedulek "MidiOut2",kTrigRep,kDurRep,kNoteRep,.7
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
iVeloc = p5
;iBaseNote  ntom "0C"
iBaseNoteIn cabbageGetValue "BNote"
iBaseNote = iBaseNoteIn-2
iScale      cabbageGetValue "scale"
if iScale == 1 then
iFrq mtof iMidiNote
elseif iScale == 2 then
iFrq pythagorean iBaseNote-2,iMidiNote
elseif iScale == 3 then
iFrq shur iBaseNote-2,iMidiNote
elseif iScale == 4 then
iFrq homayun iBaseNote-2,iMidiNote
elseif iScale == 5 then
iFrq segah iBaseNote-2,iMidiNote
elseif iScale == 6 then
iFrq chargah iBaseNote-2,iMidiNote
endif
iAtt = p6
iRvrs cabbageGetValue "rvrs2"
if iRvrs == 0 then
aEnv transeg 0, iAtt,4, 1,p3-iAtt,-6,0
elseif iRvrs == 1 then
 aEnv transeg 0, p3*0.95,4, 1,p3*0.05,0,0
endif

  ipick =  MirrorMe:i(iVeloc,0,10)/10
  iplk =  ((iVeloc*10)^1.3)/100 + (random:i( .3, .4))
  iDur = (p3/2.3)+0.1
  irefl =  MirrorMe:i(iDur,0.1,0.9)
  aPick wgpluck2 iplk,0.4, iFrq, ipick, irefl
 aout clfilt aPick, 70, 1, 10
  aout = aout*aEnv
 iFx cabbageGetValue "fx"
 if iFx == 1 goto fx
outch 2, aout
goto      end
 fx:
chnmix aout, "snd2"
end:
endin




instr Effect

kDelayTime cabbageGet "dlt"
kFeedback cabbageGet "fdb"

;;sound
kGain1 cabbageGet "gn1"
aGn1	interp	kGain1
aIn1 chnget "snd1"
aSound1 = aIn1*aGn1
kGain2 cabbageGet "gn2"
aGn2	interp	kGain2
aIn2 chnget "snd2"
aSound2 = aIn2*aGn2
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
 	aTim	interp	kTime
 	abuf	delayr	7
 	aDelay	deltapi	aTim	
 	delayw	aSoundD + (aDelay*kFeedback)
  	aDelMix		ntrpol	 aSoundD,aDelay,  .65
  
  aSound = aSound1+aSound2
  
  aRvrbL, aRvrbR reverbsc aSound,aSound, 0.7, 1600
  aoutL	ntrpol	 aSound,aRvrbL+aDelMix,  .4
  aoutR	ntrpol	 aSound,aRvrbR+aDelMix,  .4
out aoutL,aoutR
chnclear "snd1"
chnclear "snd2"
endin

instr Widgets
schedule "widgetWrite",0,0.1
schedule "WidgetSave",0,0.1,1
schedule "WidgetSave",0,0.1,2
kFx cabbageGet "fx"

if kFx == 1 && changed(kFx) == 1 then
schedulek "Effect", 0, 99999
elseif kFx == 0 && changed(kFx) == 1 then
turnoff2 "Effect",0,0
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
kSaveLoad1 cabbageGet "sve1"
if changed(kSaveLoad1) == 1 then
schedulek "WidgetSave",0,0.1,1
endif
kSaveLoad2 cabbageGet "sve2"
if changed(kSaveLoad2) == 1 then
schedulek "WidgetSave",0,0.1,2
endif
  kWidgetLoad   ctrl7    1,63,0,1
  if kWidgetLoad == 0 && changed(kWidgetLoad) == 1 then
  schedulek "WidgetLoad", 0, 0.1,1
  elseif kWidgetLoad == 1 && changed(kWidgetLoad) == 1 then
  schedulek "WidgetLoad", 0, 0.1,2
  endif
endin


instr widgetWrite
iX = 0
iCount = 0
ispc = 0
        while iCount < 28 do
            Sseq1 sprintf "bounds(%d, 70, 15, 15) , channel(\"seq1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sacc1 sprintf "bounds(%d, 90, 15, 15) , channel(\"acc1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sbss1 sprintf "bounds(%d, 110, 15, 15), channel(\"bss1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Srep1 sprintf "bounds(%d, 130, 15, 15), channel(\"rep1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Slte1 sprintf "bounds(%d, 150, 12, 12), channel(\"lte1%d\") colour(100, 100, 100, 200) ", 51+iCount*(17)+ispc, iCount
            cabbageCreate "checkbox", Sseq1
            cabbageCreate "checkbox", Sacc1
            cabbageCreate "checkbox", Sbss1
            cabbageCreate "checkbox", Srep1
            cabbageCreate "image"   , Slte1
            Sseq2 sprintf "bounds(%d, 240, 15, 15), channel(\"seq2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sacc2 sprintf "bounds(%d, 260, 15, 15), channel(\"acc2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Sbss2 sprintf "bounds(%d, 280, 15, 15), channel(\"bss2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Srep2 sprintf "bounds(%d, 300, 15, 15), channel(\"rep2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255)", 50+iCount*(17)+ispc, iCount
            Slte2 sprintf "bounds(%d, 320, 12, 12), channel(\"lte2%d\") colour(100, 100, 100, 200) ", 51+iCount*(17)+ispc, iCount
            cabbageCreate "checkbox", Sseq2
            cabbageCreate "checkbox", Sacc2
            cabbageCreate "checkbox", Sbss2
            cabbageCreate "checkbox", Srep2
            cabbageCreate "image"   , Slte2
            iCount += 1
            iX = (iX+1) % 4
            if iX == 0 then
            ispc += 5
            endif
        od
iArrSeq1 [] fillarray 1,0,0,1,1,0,0,1,0,1,0,0,0
iArrAcc1 [] fillarray 1,0,0,0,1,0,0,0,0,1,0,0,0
iArrBss1 [] fillarray 0,0,1,0,0,0,0,0,1,0,0,0,1
iArrRep1 [] fillarray 0,0,0,0,0,0,0,0,0,0,0,0,0
iArrSeq2 [] fillarray 0,1,1,0,0,0,1,1,0,0,1,1,0
iArrAcc2 [] fillarray 0,0,1,0,0,0,1,0,0,0,0,1,0
iArrBss2 [] fillarray 0,0,0,1,0,1,0,0,0,0,0,0,0
iArrRep2 [] fillarray 0,0,0,0,0,0,0,1,0,0,0,0,0
        iWrite = 0
        while iWrite < lenarray(iArrSeq1) do
        Ssq1 sprintf "seq1%d",iWrite
        cabbageSetValue Ssq1,iArrSeq1[iWrite]
        Sac1 sprintf "acc1%d",iWrite
        cabbageSetValue Sac1,iArrAcc1[iWrite]
        Sbs1 sprintf "bss1%d",iWrite
        cabbageSetValue Sbs1,iArrBss1[iWrite]
        Srp1 sprintf "rep1%d",iWrite
        cabbageSetValue Srp1,iArrRep1[iWrite]
        Ssq2 sprintf "seq2%d",iWrite
        cabbageSetValue Ssq2,iArrSeq2[iWrite]
        Sac2 sprintf "acc2%d",iWrite
        cabbageSetValue Sac2,iArrAcc2[iWrite]
        Sbs2 sprintf "bss2%d",iWrite
        cabbageSetValue Sbs2,iArrBss2[iWrite]
        Srp2 sprintf "rep2%d",iWrite
        cabbageSetValue Srp2,iArrRep2[iWrite]
        iWrite += 1
        od
endin

instr WidgetSave
if p4 == 1 then
 isave save1 1
elseif p4 == 2 then
 isave save2 1
endif
endin



instr WidgetLoad
if p4 == 1 then
iload load1 1
elseif p4 == 2 then
iload load2 1
endif
endin



instr MidiOut1 ;12
inum = p4
ivel = int((p5*127)/10)
;print inum,ivel
midion 1, inum, ivel
endin

instr MidiOut2 ;12
inum = p4
ivel = int((p5*127)/10)
;print inum,ivel
midion 2, inum, ivel
endin
</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

