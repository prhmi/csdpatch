
<Cabbage>
form caption("MiniPoo") size(600, 400), pluginid("MiniPoo") style("legacy")  colour:0(20, 30, 82, 255)
image bounds(0, 0, 600, 400) file("cover.png")
;;Sequencer
groupbox bounds(310, 216, 282, 180) plant("seq") text("Sequencer"){
image    bounds(10, 30, 12, 13), channel("MIDIL")identchannel("MIDILID"), colour(100, 100, 110, 255)  shape("circle")
label    bounds(25, 30, 50, 12) text("MIDI IN")
image    bounds(10, 55, 12, 13), channel("Seq1L")identchannel("Seq1LID"), colour(100, 100, 110, 255)  shape("circle")
label    bounds(25, 55, 30, 12) text("Seq1")
image    bounds(10, 82, 12, 13), channel("Seq2L")identchannel("Seq2LID"), colour(100, 100, 110, 255)  shape("circle")
label    bounds(25, 82, 30, 12) text("Seq2")
checkbox bounds(60, 55, 15, 15) colour:0(100, 100, 100, 255) popuptext("Sequencer1")  channel("sq1") colour:1(100, 250, 60, 255)
checkbox bounds(60, 80, 15, 15) colour:0(100, 100, 100, 255) popuptext("Sequencer2")  channel("sq2") colour:1(100, 250, 60, 255)
label    bounds(78, 30, 88, 12) text("Instr")
combobox bounds(95, 50, 65, 25) text("instr1", "instr2") channel("ins1") 
combobox bounds(95, 72, 65, 25) text("instr1", "instr2") channel("ins2") 
nslider  bounds(10, 130, 47, 31) range(50, 180, 90, 1, 1) velocity(50) fontcolour(208, 157, 253, 255) text("BPM") channel("BPM") identchannel("BPMID")
nslider  bounds(60, 130, 47, 31) range(1, 10, 3, 1, 1) velocity(50) fontcolour(208, 157, 253, 255) text("DV") channel("DV") identchannel("DVID")
checkbox bounds(120, 142, 15, 15) colour:0(100, 100, 100, 255) popuptext("LongSequencer")  channel("sqlong") colour:1(100, 250, 60, 255)
label    bounds(140, 142, 48, 12) text("Long sq")
combobox bounds(195, 138, 65, 25) text("instr1", "instr2") channel("inslng") 
image    bounds(135, 115, 12, 13), channel("tmpch")identchannel("tmpchID"), colour(100, 100, 110, 255) 
label    bounds(150, 115, 20, 12) text("tch")
label    bounds(160, 30, 88, 12) text("Rythm & Pitch")
combobox bounds(170, 50, 65, 25) text("Rythm", "Tala", "TalaRep", "TalaPlus", "TalaPlusR", "TalaPlusJ") channel("tala") 
combobox bounds(170, 72, 65, 25) text("Pitch", "Shoor", "Segah") channel("dastgah") 
}
;;Effect
groupbox bounds(310, 126, 150, 90) plant("GPrvb") text("Reverb"){
rslider  bounds(65, 25, 50, 45) range(0, 1, 0, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("rvb")
label    bounds(65, 68, 55, 12) text("Mix")
rslider  bounds(16, 25, 50, 45) range(0.1, 0.9, 0.55, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("rvbsz")
label    bounds(15, 68, 55, 12) text("Size")
checkbox bounds(120, 35, 15, 15) colour:0(100, 100, 100, 255) popuptext("Reverb")  channel("rvbOnOff") colour:1(100, 250, 60, 255)
}
groupbox bounds(462, 34, 130, 182) plant("GPdl") text("Delay"){
rslider  bounds(5, 25, 70, 45) range(0.1, 3, 1.2, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("dlytm")
label    bounds(65, 50, 30, 12) text("Time")
rslider  bounds(5, 80, 70, 45) range(0.1, 0.9, 0.15, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("dlyfb")
label    bounds(55, 100, 65, 12) text("FeedBack")
rslider  bounds(5, 130, 70, 45) range(0, 1, 0, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("dlymx")
label    bounds(65, 150, 20, 12) text("Mix")
checkbox bounds(95, 125, 15, 15) colour:0(100, 100, 100, 255) popuptext("Delay")  channel("dlyOnOff") colour:1(100, 250, 60, 255)
}
groupbox bounds(310, 34, 150, 90) plant("GPfltr") text("Filter"){
rslider  bounds(12, 25, 50, 45) range(20, 5000, 600, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("fltrfrq")
label    bounds(10, 68, 60, 12) text("Frequency")
combobox bounds(65, 28, 40, 20) text("LP", "HP") channel("fltrmd") value(2)
checkbox bounds(120, 30, 15, 15) colour:0(100, 100, 100, 255) popuptext("Filter")  channel("fltrOnOff") colour:1(100, 250, 60, 255)
}
;;Ding
groupbox bounds(10, 34, 299, 92) plant("Ding") text("Instrument (seq1)"){ 
rslider  bounds(13, 25, 45, 45) range(0.001, 0.1, 0.001, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("att") identchannel("attID") visible(0)
label    bounds(15, 70, 42, 12) text("Attack") identchannel("attLID") visible(0)
rslider  bounds(60, 25, 45, 45) range(0.2, 1.5, 0.7, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("rel") identchannel("relID")visible(0)
label    bounds(60, 70, 49, 12) text("Release") identchannel("relLID") visible(0) 
checkbox bounds(120, 27, 15, 15) colour:0(135, 87, 142, 255) popuptext("Reverse")  channel("rvs") colour:1(231, 79, 208, 255) text("Reverse") identchannel("rvsID") visible(0)
label    bounds(140, 28, 47, 12) text("Reverse") identchannel("rvsLID") visible(0)
checkbox bounds(195, 27, 15, 15) colour:0(135, 87, 142, 255) popuptext("Staccato")  channel("stc") colour:1(231, 79, 208, 255) text("Staccato") identchannel("stcID") visible(0)
label    bounds(212, 28, 50, 12) text("Staccato") identchannel("stcLID") visible(0)
button   bounds(241, 55, 45, 25)    colour:0(100, 60, 126, 255) colour:1(100, 60, 126, 255) text("", "") channel("hrmtrg") identchannel("hrmtrgID") visible(0)
nslider  bounds(120, 52, 55, 28) range(0.4, 3.5, 2.134, 1, 0.001) text("Harmonic") channel("hrmchng") identchannel("hrmchngID") visible(0)
nslider  bounds(175, 52, 45, 28) range(0, 1, 0.5, 1, 0.1)  text("Decimal")channel("dcmchng") identchannel("dcmchngID") visible(0)
}
;;Ding2
groupbox bounds(10, 128, 299, 92) plant("Ding2") text("Instrument (seq2)"){ 
rslider  bounds(13, 25, 45, 45) range(0.001, 0.1, 0.001, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("att2") identchannel("att2ID") 
label    bounds(15, 70, 42, 12) text("Attack2") identchannel("att2LID") 
rslider  bounds(60, 25, 45, 45) range(0.2, 1.5, 0.7, 1, 0.001) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("rel2") identchannel("rel2ID")
label    bounds(60, 70, 49, 12) text("Release2") identchannel("rel2LID")  
checkbox bounds(120, 27, 15, 15) colour:0(135, 87, 142, 255) popuptext("Reverse")  channel("rvs2") colour:1(231, 79, 208, 255) text("Reverse") identchannel("rvs2ID") 
label    bounds(140, 28, 47, 12) text("Reverse2") identchannel("rvs2LID") 
checkbox bounds(195, 27, 15, 15) colour:0(135, 87, 142, 255) popuptext("Staccato")  channel("stc2") colour:1(231, 79, 208, 255) text("Staccato") identchannel("stc2ID") 
label    bounds(212, 28, 50, 12) text("Staccato2") identchannel("stc2LID") 
button   bounds(241, 55, 45, 25)    colour:0(100, 60, 126, 255) colour:1(100, 60, 126, 255) text("", "") channel("hrm2trg") identchannel("hrm2trgID") 
nslider  bounds(120, 52, 55, 28) range(0.4, 3.5, 2.134, 1, 0.001) text("Harmonic") channel("hrm2chng") identchannel("hrm2chngID") 
nslider  bounds(175, 52, 45, 28) range(0, 1, 0.5, 1, 0.1)  text("Decimal")channel("dcm2chng") identchannel("dcm2chngID") 
}
;;midlle
groupbox bounds(10, 221, 299, 80) plant("middle") text("Instrument (middle)"){ 
}
;;PadLong
groupbox bounds(10, 302, 299, 92) plant("PadLong") text("Instrument (Long)"){ 
rslider  bounds(13, 25, 45, 45)  range(1, 10, 3, 1, 0.1) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("lfo1s") identchannel("lfo1sID") 
label    bounds(15, 70, 42, 12)  text("LFO1S") identchannel("lfo1sLID") 
rslider  bounds(60, 25, 45, 45)  range(0.4, 5, 0.4, 1, 0.1) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("frq1s") identchannel("frq1sID") 
label    bounds(63, 70, 42, 12)  text("Frq1S") identchannel("frq1sLID") 
rslider  bounds(120, 25, 45, 45) range(1, 10, 2, 1, 0.1) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("lfo2s") identchannel("lfo2sID") 
label    bounds(120, 70, 42, 12) text("LFO2S") identchannel("lfo2sLID") 
rslider  bounds(167, 25, 45, 45) range(0.4, 5, 2, 1, 0.1) trackercolour(208, 200, 253, 255) colour(119, 100, 154, 255)  markercolour(208, 200, 253, 255) trackerinsideradius(0.74) channel("frq2s") identchannel("frq2sID") 
label    bounds(167, 70, 42, 12) text("Frq2S") identchannel("frq2sLID") 
button   bounds(241, 55, 45, 25) colour:0(100, 60, 126, 255) colour:1(100, 60, 126, 255) text("", "") channel("hrmLtrg") identchannel("hrmLtrgID") 
}


image    bounds(30, 255, 20, 20), channel("brs")identchannel("brsID"), colour(100, 100, 110, 255) 
label    bounds(55, 260, 35, 12) text("Brass")
image    bounds(100, 255, 20, 20), channel("strng")identchannel("strngID") colour(255, 255, 0, 255)
label    bounds(125, 260, 35, 12) text("String")
image    bounds(175, 255, 20, 20), channel("smple")identchannel("smpleID"), colour(100, 100, 110, 255) 
label    bounds(200, 260, 45, 12) text("Sample")

vmeter bounds(562, 258, 18, 80) channel("vMeter1") value(0) overlaycolour(100, 100, 53, 255) metercolour:0(100, 255, 0, 255) metercolour:1(150, 150, 171, 255) metercolour:2(200, 50, 123, 255) outlinethickness(2) 


</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

massign	5,1 ;channel 10 for instr 1
seed 0

giRythArr [] fillarray .5,.5,2,1,.5,1,2,1,.5
giRythArrP[] fillarray .5,.5,2,1,.5,1,2,1,.5
giPlusArr [] fillarray -1.5,-1,-0.5, 0.5, 1, 1.5
giSumArr     sumarray giRythArr

giNoteArr [] init 7 ;fillarray 75, 80, 68, 70
giAccArr  [] fillarray 2, 0, 1, 1, 0, 0, 1, 0
giLength     init lenarray(giNoteArr)
giEmptyArr[] init giLength	

giNoteArrP[] init giLength+2
gkPrsnIndx   init 0

giTalaCount  init 0
giPlusCount  init 0
giChngIndx   init 0
giElement    init 0

giActive     init 0
giCountMIDI  init 0

gkTempo      init 0
gkStart      init 0

gkTala       init 0
gkDastgah    init 0

giFrqProps []init 9
giAmps     []init 9
giFrqProps2[]init 9
giAmps2    []init 9
giFrqPropL []init 5
giAmpL     []init 5

;gkAtt        init 0.01
;gkRev        init 0

;gkMixReverb  init 0

;gkHrmChng    init 0
;gkDcmChng    init 0

;gkDur        init 0

;;indian
opcode ArrTala, i[], i[]
 iInArr[] xin
 giTalaCount = (giTalaCount+1)% lenarray(iInArr)
 iRead = 0
 iWrite = giTalaCount
 while iRead <lenarray(iInArr) do
 	giRythArrP [iRead] = iInArr[iWrite]
	iRead +=1
	iWrite = (iWrite+1)% lenarray(iInArr)
 od
 printarray giRythArrP,"%.02f", "ArrTala ="
 xout giRythArrP
endop
opcode ArrRep, i[], i[]
 iInArr[] xin
 giRythArrP[] = iInArr
 giRythArrP[giTalaCount+1] = iInArr[giTalaCount]
 giTalaCount = (giTalaCount+1)% (lenarray(iInArr)-1)
 xout giRythArrP
endop
opcode ArrPlus, i[],i[]
 iInArr[] xin
  giPlusCount = (giPlusCount+1)% lenarray(giPlusArr)
 if giPlusCount == 0  then
    giTalaCount = (giTalaCount+1)% (lenarray(iInArr))
 endif
 giRythArrP[] = iInArr
  giRythArrP[giTalaCount] = iInArr[giTalaCount] + giPlusArr[giPlusCount]
  giRythArrP[giTalaCount] = ( giRythArrP[giTalaCount] < 0.5 ) ?
  giRythArr[giTalaCount] :  giRythArrP[giTalaCount]
  printarray giRythArrP,"%.02f", "ArrPlus ="
 xout giRythArrP
endop
opcode ArrPlusR, i[], i[]
 iInArr[] xin
 if giTalaCount == giChngIndx then
  iElm random 0, lenarray(iInArr)
  iAdd random -2,2 
  iAdd = (iAdd == 0) ? 1 : iAdd
  giRythArrP[iElm] =  iInArr[iElm]+iAdd
  giRythArrP[iElm] = ( giRythArrP[iElm] < 1 ) ?
    giRythArr[iElm] :  giRythArrP[iElm]
  giChngIndx = (giChngIndx+1)% 3
  printarray giRythArrP,"%.02f", "ArrPlusR ="   
  giTalaCount = 0
 endif
 giTalaCount = (giTalaCount+1)% lenarray(iInArr)
 xout giRythArrP
endop
opcode ArrPlusJ, i[], i[]
 iInArr[] xin
 if giTalaCount == giChngIndx then
  giRythArrP[giElement] =  iInArr[giElement]+ giPlusArr[giPlusCount]
  giRythArrP[giElement] = ( giRythArrP[giElement] < 1 ) ?
    giRythArr[giElement] :  giRythArrP[giElement]
  giChngIndx = (giChngIndx+1)% 3
  giChngIndx = (giChngIndx=0) ? 1: giChngIndx 
  giTalaCount = 0
  giElement = (giElement+1)%lenarray(iInArr)
  giPlusCount =(giPlusCount+1) % lenarray(giPlusArr)
  printarray giRythArrP,"%.02f", "ArrPlusJ =" 
 endif
 giTalaCount = (giTalaCount+1)% lenarray(iInArr)
 xout giRythArrP
endop

;;persian
opcode PersianScale, i[],i[]i
 iInArr[],iDastgah xin
 iNoteIndx =  giCountMIDI
 if     iDastgah == 2 then ;shoor
  iCent1 = 1.5-0.16
  iCent2 = 1.5+0.13
  iCent3 = 0
 elseif iDastgah == 3 then ;3gah
  iCent1 = 1.5-0.26
  iCent2 = 1.5
  iCent3 = 1.5+0.32
 endif
 giNoteArrP[0] = iInArr[0]
 giNoteArrP[1] = iInArr[0]+iCent1
 iRead = 1
 while iRead < (lenarray(iInArr)) do
  giNoteArrP[iRead+1] = iInArr[iRead]
  iRead += 1
 od
 if iNoteIndx >= 3 then
   giNoteArrP[3] = giNoteArrP[3]+iCent3
  giNoteArrP[iNoteIndx+1] = iInArr[iNoteIndx-1]+iCent2
 endif
 iClean = giCountMIDI+2
 while iClean < lenarray(giNoteArrP) do
 giNoteArrP [iClean] = 0
 iClean += 1
 od
 xout giNoteArrP
endop



;;MIDI INPUT
instr MIDI
 giActive active 1
 gkStart = 1
 giCountMIDI = (giCountMIDI+1 >= giLength) ? giLength : giCountMIDI+1
 iNote notnum
 iVel veloc 0, 127
 iRead = giCountMIDI 
 if giActive == 1 then
  giNoteArr [] = giEmptyArr
  giCountMIDI = 1
 endif
 while iRead < giLength do
  giNoteArr [iRead] = giEmptyArr[iRead]
  iRead += 1
 od	
 giNoteArr [giCountMIDI-1] = iNote	
 
 iseq chnget "sqlong"
 ;print iNote
 ;printarray giNoteArr, "%.0f", "Notes On ="
 if changed(iNote) == 1 && giCountMIDI == 1 && iseq == 1 then
 turnoff2 "Long_seq", 0, 0
 turnoff2 "PadLong", 0, 1
 schedulek "Long_seq", 0, 999
 endif
   schedule "MIDIOn" , 0,0
   schedule "MIDIOff",.2,0
   schedule "PersianTrig",0,0,gkDastgah
endin

;;Widgets
instr Widgets
;;tempo
 kBPM chnget "BPM"
 kdvn chnget "DV" 
 ;;Env
 gkAtt  chnget "att"
 gkRel  chnget "rel"
 gkAtt2 chnget "att2"
 gkRel2 chnget "rel2"

 gkTempoChnge  ctrl7    5,30,0,1
 gkStcRnd chnget "stc"
 gkStcRnd2 chnget "stc2"
 if gkTempoChnge == 1 && changed(gkTempoChnge) == 1 then
 chnset "colour(50, 200, 253)", "tmpchID"
  gkDur random 0.1, 0.4
  gkDur2 random 0.1, 0.4
  ktmpchng random 3,5
 elseif  gkTempoChnge == 0 then
 chnset "colour(100, 100, 110)", "tmpchID"
   gkDur = gkRel
   gkDur2 = gkRel2
   ktmpchng = 1
 endif
  gkTempo = (kBPM/60)*((kdvn/5)+1)*ktmpchng


;;sequencer
 kSq1 chnget "sq1"
 if kSq1 == 1 && changed(kSq1) == 1 then
  schedulek "TIAB_seq1", 0, 999
 elseif kSq1 == 0 && changed(kSq1) == 1 then
  turnoff2 "TIAB_seq1", 0, 0
 endif 
  kSq2 chnget "sq2"
 if kSq2 == 1 && changed(kSq2) == 1 then
  schedulek "TIAB_seq2", 0, 999
 elseif kSq2 == 0 && changed(kSq2) == 1 then
  turnoff2 "TIAB_seq2", 0, 0
 endif 
  kSqLong chnget "sqlong"
  if kSqLong == 1 && changed(kSqLong) == 1 && gkStart == 1 then
  schedulek "Long_seq", 0, 999
 elseif kSqLong == 0 && changed(kSqLong) == 1 then
  turnoff2 "PadLong", 0, 1
  turnoff2 "Long_seq", 0, 0
 endif
 
;;rythm
 gkTala chnget "tala"
 gkDastgah chnget "dastgah"
  if changed(gkDastgah) == 1 then 
	  if gkDastgah == 1 then
	  gkPrsnIndx = 0
	  elseif gkDastgah != 1 then
	  gkPrsnIndx = 2
	  endif
  schedulek "PersianTrig",0,0,gkDastgah
  endif
	
;;out widgets
 kSq1_CC    ctrl7    5,20,0,1
 kSq2_CC    ctrl7    5,21,0,1
 kSqLong_CC ctrl7    5,22,0,1
 if changed(kSq1_CC) == 1 then
 chnset kSq1_CC,    "sq1"
 endif
 if changed(kSq2_CC) == 1 then
 chnset kSq2_CC,    "sq2"
 endif
 if changed(kSqLong_CC) == 1 then
 chnset kSqLong_CC, "sqlong"
 endif
 ;printk2 kTempoChnge
 
;;harmonic
 kHrmncOnOff chnget "hrmtrg"
 kHrmChng chnget "hrmchng"
 kDcmChng chnget "dcmchng"
 schedule "Harmonic", 0, 0,2.134,0.5
 if changed(kHrmncOnOff) == 1 then
 schedulek "Harmonic", 0, 0,kHrmChng,kDcmChng
 endif
 
 kHrmnc2OnOff chnget "hrm2trg"
 kHrm2Chng chnget "hrm2chng"
 kDcm2Chng chnget "dcm2chng"
 schedule "Harmonic2", 0, 0,2.134,0.5
 if changed(kHrmnc2OnOff) == 1 then
 schedulek "Harmonic2", 0, 0,kHrm2Chng,kDcm2Chng
 endif
 
 kHrmncLOnOff chnget "hrmLtrg"
 schedule "HarmonicLong", 0, 0,3.124,1
 if changed(kHrmncLOnOff) == 1 then
 schedulek "HarmonicLong", 0, 0
 endif

 

;;reverse
gkRev chnget "rvs"
gkRev2 chnget "rvs2"
;;Effect
gkMixReverb  chnget "rvb"
gkSizeReverb chnget "rvbsz"
gkRoomReverb chnget "rvbrm"

gkDelMix chnget "dlymx"
gkDelFB chnget "dlyfb"
gkDelTime chnget "dlytm"

gkFltrFrq chnget "fltrfrq"
gkFltrMod chnget "fltrmd"
printk2 gkFltrMod
if changed(gkFltrMod) == 1 then
turnoff2 "effects", 0, 1
schedulek "effects", 0, 9999
endif


;;Long Instrument
 gkLFO1S  chnget "lfo1s";10
 gkLFrq1S chnget "frq1s" ; 0.4

 gkLFO2S  chnget "lfo2s"; 10
 gkLFrq1S chnget "frq2s"

;;midlle
kBrass  ctrl7    5,31,0,1
;printk2 kmidlle
if kBrass == 1 && changed(kBrass) == 1 then
kBrsPch = 1/ (random:k( 0, 100))+ 8.05 
schedulek "Brass", 0, 3,kBrsPch
endif
if kBrass == 1 then
chnset "colour(60, 200, 120)", "brsID"
elseif kBrass == 0 then
chnset "colour(100, 100, 110, 255)", "brsID"
endif

kString  ctrl7    5,32,0,1
;printk2 kmidlle
if kString == 1 && changed(kString) == 1 then
kStgPch random 0, giCountMIDI
schedulek "String", 0, 3,giNoteArrP[kStgPch]
endif

if kString == 1 then
chnset "colour(255, 255, 0, 255)", "strngID"
elseif kString == 0 then
chnset "colour(100, 100, 110, 255)", "strngID"
endif

kSample  ctrl7    5,27,0,1
;printk2 kmidlle
if kSample == 1 && changed(kSample) == 1 then
schedulek "Sample", 0, 9999
elseif kSample == 0 && changed(kSample) == 1 then
turnoff2 "Sample", 0, 1
endif
if kSample == 1 then
chnset "colour(50, 200, 253)", "smpleID"
elseif kSample == 0 then
chnset "colour(100, 100, 110, 255)", "smpleID"
endif


;;widgets
kIns1Trig chnget "ins1"
if kIns1Trig == 1 then
chnset "visible(1)","attID"
chnset "visible(1)","relID"
chnset "visible(1)","attLID"
chnset "visible(1)","relLID"
chnset "visible(1)","rvsID"
chnset "visible(1)","rvsLID"
chnset "visible(1)","hrmtrgID"
chnset "visible(1)","hrmchngID"
chnset "visible(1)","dcmchngID"
chnset "visible(1)","stcID"
chnset "visible(1)","stcLID"
else
chnset "visible(0)","attID"
chnset "visible(0)","relID"
chnset "visible(0)","attLID"
chnset "visible(0)","relLID"
chnset "visible(0)","rvsID"
chnset "visible(0)","rvsLID"
chnset "visible(0)","hrmtrgID"
chnset "visible(0)","hrmchngID"
chnset "visible(0)","dcmchngID"
chnset "visible(0)","stcID"
chnset "visible(0)","stcLID"
endif
;printk2 kIns1Trig

chnset abs:k(randi:k(.8, 12, 2)), "vMeter1"
       
endin






;;short instrument 1
instr Harmonic
iHrmChng = p4
iDcmChng = p5
 iWrite = 0
 iHarmonic = 1
 iHarriz = 0
 irndf = 0
 iRndAmp = 0
 while iWrite < lenarray(giFrqProps) do
  giFrqProps[iWrite] = iHarmonic
  irndf random -iDcmChng, iDcmChng
  iRndAmp random 0.001, 0.1
  giAmps[iWrite] = ((1/iHarmonic)/2)+iRndAmp
  iHarmonic = ((iHarmonic+iHrmChng+irndf) <= 1) ?
   2 : (iHarmonic+iHrmChng+irndf)
  iWrite += 1
 od
 printarray giFrqProps,"%.02f", "frq =" 
 printarray giAmps,"%.02f", "amp =" 
endin
instr ShortTrigger
 iVolumeDb  = p4 ;db
 iBasePitch = p5 ;midi note number
 ;print iVolumeDb
 iDur = p6
 iReverse = p7
 iAtt = p8
 iDurVar = 0.5
 iPlay = 0
 iDurDiffStep = 0
 while iPlay < lenarray(giFrqProps) do 
  iFreq = mtof:i(iBasePitch)*giFrqProps[iPlay]
  iAmp = ampdb(iVolumeDb)*giAmps[iPlay]
  iDurOut = (iDur-(iDurDiffStep*iPlay) <= 0.1) ?
   0.1 : iDur-(iDurDiffStep*iPlay)
  schedule "Ding", 0, iDurOut, iAmp, iFreq,iReverse,iAtt
  iPlay += 1
  iDurDiffStep += 0.02
 od

endin
instr Ding 
 iAmp     = p4
 iFreq    = p5
 iReverse = p6
 if iReverse == 0 then
  iAtt = p7
  iRel = 0
 elseif iReverse == 1 then
  iAtt = ((p3-p7) <= 0) ? p7: p3-p7
  iRel = iAmp
 endif
 ;aEnvRndDb randi 2, 5, 2*ampdb(aEnvRndDb)
 aEnvRndDb randi 2, 5, 2
 kPchRnd randi 1/10, 4, 2
 aEnv1 transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, iRel
 aEnv2 linseg 1, p3-0.007, 1, 0.005, 0
 aSine poscil aEnv1*aEnv2*ampdb(aEnvRndDb), iFreq+kPchRnd
 chnmix	aSine,"Send"
endin


instr Harmonic2
iHrmChng = p4
iDcmChng = p5

 iWrite = 0
 iHarmonic = 1
 iHarriz = 0
 irndf = 0
 iRndAmp = 0
 while iWrite < lenarray(giFrqProps2) do
  giFrqProps2[iWrite] = iHarmonic
  irndf random -iDcmChng, iDcmChng
  iRndAmp random 0.001, 0.1
  giAmps2[iWrite] = ((1/iHarmonic)/2)+iRndAmp
  iHarmonic = ((iHarmonic+iHrmChng+irndf) <= 1) ?
   2 : (iHarmonic+iHrmChng+irndf)
  iWrite += 1
 od
 print iHarmonic
 printarray giFrqProps2,"%.02f", "frq2 =" 
 printarray giAmps2,"%.02f", "amp2 =" 
endin
instr ShortTrigger2
 iVolumeDb  = p4 ;db
 iBasePitch = p5 ;midi note number
 ;print iVolumeDb
 iDur = p6
 iReverse = p7
 iAtt = p8
 iDurVar = 0.5
 iPlay = 0
 iDurDiffStep = 0
 while iPlay < lenarray(giFrqProps2) do 
  iFreq = mtof:i(iBasePitch)*giFrqProps2[iPlay]
  iAmp = ampdb(iVolumeDb)*giAmps2[iPlay]
  iDurOut = (iDur-(iDurDiffStep*iPlay) <= 0.1) ?
   0.1 : iDur-(iDurDiffStep*iPlay)
  schedule "Ding2", 0, iDurOut, iAmp, iFreq,iReverse,iAtt
  iPlay += 1
  iDurDiffStep += 0.02
 od

endin
instr Ding2 
 iAmp     = p4
 iFreq    = p5
 iReverse = p6
 if iReverse == 0 then
  iAtt = p7
  iRel = 0
 elseif iReverse == 1 then
  iAtt = ((p3-p7) <= 0) ? p7: p3-p7
  iRel = iAmp
 endif
 ;aEnvRndDb randi 2, 5, 2*ampdb(aEnvRndDb)
 aEnvRndDb randi 2, 5, 2
 kPchRnd randi 1/10, 4, 2
 aEnv1 transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, iRel
 aEnv2 linseg 1, p3-0.007, 1, 0.005, 0
 aSine poscil aEnv1*aEnv2*ampdb(aEnvRndDb), iFreq+kPchRnd
 chnmix	aSine,"Send2"
endin

;;short sequencer 1
instr TIAB_seq1 
;to infinity and beyond
kTala = gkTala
kRythArrIndx init 0
kNoteArrIndx init 0
kAccArrIndx  init 0
kdb = -20
kTime init 0
kDurRnd init 0.5
if gkStcRnd == 0 then
kDur = gkDur
elseif gkStcRnd == 1 then
kDur = kDurRnd
endif
if metro:k(kTime) == 1 then
kTime = 1/(giRythArrP[kRythArrIndx])*gkTempo
  if giNoteArrP[kNoteArrIndx] != 0 then
   schedulek "ShortTrigger",0,0,kdb+(giAccArr[kAccArrIndx]),
   giNoteArrP[kNoteArrIndx],kDur,gkRev,gkAtt
kDurRnd random 0.1, 1.2
  endif
kRythArrIndx = (kRythArrIndx+1) % lenarray(giRythArrP)
kNoteArrIndx = (kNoteArrIndx+1) % (giCountMIDI+gkPrsnIndx)
kAccArrIndx  = (kAccArrIndx+1)  % lenarray(giAccArr)
	if kRythArrIndx == 0 then
	schedulek "TalaTrig",0,0,kTala
	endif
	
			schedulek "Seq1On",0,0
			schedulek "Seq1Off",0.1,0
			
 
endif

  if changed(gkTempoChnge) == 1 then
  schedulek "ShortTrigger",0,0,kdb+(giAccArr[kAccArrIndx]),
   giNoteArrP[kNoteArrIndx],gkDur,gkRev,gkAtt
  endif
;printk2 kDur
endin


;;short sequencer 2
instr TIAB_seq2 
;to infinity and beyond
kTala = gkTala
kRythArrIndx init 0
kNoteArrIndx init 0
kAccArrIndx  init 0
kdb = -20
kTime init 0
kDurRnd init 0.5
if gkStcRnd2 == 0 then
kDur = gkDur2
elseif gkStcRnd2 == 1 then
kDur = kDurRnd
endif
if metro:k(kTime) == 1 then
kTime = 1/(giRythArrP[kRythArrIndx])*gkTempo
  if giNoteArrP[kNoteArrIndx] != 0 then
   schedulek "ShortTrigger2",0,0,kdb+(giAccArr[kAccArrIndx]),
   giNoteArrP[kNoteArrIndx],kDur,gkRev2,gkAtt2
kDurRnd random 0.1, 1.2
  endif
kRythArrIndx = (kRythArrIndx+1) % lenarray(giRythArrP)
kNoteArrIndx = (kNoteArrIndx+1) % (giCountMIDI+gkPrsnIndx)
kAccArrIndx  = (kAccArrIndx+1)  % lenarray(giAccArr)
	if kRythArrIndx == 0 then
	schedulek "TalaTrig",0,0,kTala
	endif
	
			schedulek "Seq2On",0,0
			schedulek "Seq2Off",0.1,0
endif

  if changed(gkTempoChnge) == 1 then
  schedulek "ShortTrigger2",0,0,kdb+(giAccArr[kAccArrIndx]),
   giNoteArrP[kNoteArrIndx],gkDur2,gkRev2,gkAtt2
  endif
;printk2 kDur
endin

;;Effects
instr effects

kDelOnOff  chnget "dlyOnOff" 
kRvbOnOff  chnget "rvbOnOff" 
kFltrOnOff chnget "fltrOnOff" 
aIn		chnget	"Send"
aIn2	chnget	"Send2"
 
itest = 0
if kDelOnOff == 0 kgoto skip_delay

gkDelTime port gkDelTime, 0.1
 	kTimes = gkDelTime
 	kFeedback = gkDelFB
 	aTim	interp	kTimes
 	abuf	delayr	4	
 	aDelay	deltapi	aTim	
 	delayw	aIn + (aDelay*kFeedback)
 gkDelMix port gkDelMix, 0.1
 aEnvDel interp (gkDelMix+1)
 	aDelMix		ntrpol	 aIn*aEnvDel,aDelay,  gkDelMix
 	aIn = aDelMix*aEnvDel
itest += 1

skip_delay:

if kRvbOnOff == 0 kgoto skip_reverb
aEnvRvb interp (gkMixReverb+1)
	aRvbOut,aRvbOut freeverb aIn, aIn, gkSizeReverb,1
	aRvbMix		ntrpol		aIn*aEnvRvb, aRvbOut , gkMixReverb
	aIn = aRvbMix
	itest += 0.3
skip_reverb:

if kFltrOnOff == 0 kgoto skip_filter
 kfrq port gkFltrFrq, 0.1
 iMod = i(gkFltrMod)
 if iMod == 2  then
 iMod = 1
 else
 iMod = 0
endif 
print iMod
 ;aFltrOut clfilt aIn, kfrq, iMod, 35
 aFltrOut2 clfilt aIn2, kfrq, iMod, 35
 ;aIn =  aFltrOut
 aIn2 =  aFltrOut2
itest += 0.4
skip_filter:

 ;aEnv transeg 0, 0.5, 4, 1, p3-0.5, -4, 0
aout = aIn+aIn2;*aEnv
out aout,aout
;fout     "WriteToDisk2.wav",4,aout
chnclear	"Send"
chnclear	"Send2"
endin

;;triger instrument
instr TalaTrig
iTala = p4
if iTala == 1 then
giRythArrP [] = giRythArr
elseif iTala == 2 then
giRythArrP [] ArrTala giRythArr
elseif iTala == 3 then
giRythArrP [] ArrRep giRythArr
elseif iTala == 4 then
giRythArrP [] ArrPlus giRythArr
elseif iTala == 5 then
giRythArrP [] ArrPlusR giRythArr
elseif iTala == 6 then
giRythArrP [] ArrPlusJ giRythArr
endif
;printarray giRythArr,"%.02f", "org ="
;printarray giRythArrP,"%.02f", "note ="
endin
instr PersianTrig
iDastgah = p4
if iDastgah == 1 then
  iRead = 0
  while iRead < lenarray(giNoteArr) do
  giNoteArrP [iRead] = giNoteArr[iRead]
  iRead += 1
  od
elseif iDastgah > 1 then
giNoteArrP [] PersianScale giNoteArr,iDastgah
endif
;printarray giNoteArr,"%.02f", "ord ="
;printarray giNoteArrP,"%.02f", "note ="
endin



;;long instrument 1
instr HarmonicLong
iHrmChng random 2,3
iDcmChng random 0,1 
 iWrite = 0
 iHarmonic = 1
 iHarriz = 0
 irndf = 0
 iRndAmp = 0
 while iWrite < lenarray(giFrqPropL) do
  giFrqPropL[iWrite] = iHarmonic
  irndf random -iDcmChng, iDcmChng
  iRndAmp random 0.001, 0.1
  giAmpL[iWrite] = ((1/iHarmonic)/2)+iRndAmp
  iHarmonic = ((iHarmonic+iHrmChng+irndf) <= 1) ?
   2 : (iHarmonic+iHrmChng+irndf)
  iWrite += 1
 od
 printarray giFrqPropL,"%.02f", "frq =" 
 printarray giAmpL,"%.02f", "amp =" 
endin
instr PadLongTrigger
 index = 0
 iBasePitch = p4
 iVolumeDb = -10
 while (index < lenarray(giFrqPropL)) do
  iFreq = mtof:i(iBasePitch)*giFrqPropL[index]
  iAmp = ampdb(iVolumeDb)*giAmpL[index]
  schedule("PadLong", 0, 6^6,iAmp, iFreq)
  index += 1 
 od
endin
instr PadLong
 kSpeedLFO1 = gkLFO1S;10
 kFrqRng1 = 3
 kFrqSpeed1 = gkLFrq1S ; 0.4

 kSpeedLFO2 = gkLFO2S; 10
 kFrqRng2 = 5
 kFrqSpeed2 = gkLFrq1S ; 10
 

 iAmp = p4
 iAtt = 1.5
 iRel = 3
 aEnv	transegr	0,iAtt,4, 1,p3,4,0, iRel,-4,0
   kLFORnd1 randi kSpeedLFO1,3,2
 aLFO1 lfo 1, kLFORnd1, 1
 kFrqRnd1 randi kFrqRng1,kFrqSpeed1, 2
 kfrq1 = p5
 until kfrq1 < 600 do
 kfrq1 /= 2
 enduntil
 aFrq1 = (poscil:a( iAmp*aLFO1, kfrq1+kFrqRnd1))
   kLFORnd2 randi kSpeedLFO2,5,2
 aLFO2 lfo 1, kLFORnd2, 0
 kFrqRnd2 randi kFrqRng2,kFrqSpeed2, 2 
 kfrq2 = p5
 until kfrq2 < 150 do
 kfrq2 /= 2
 enduntil
  aFrq2 = (poscil:a( iAmp*aLFO2, kfrq2+kFrqRnd2))
   kCutOff = randi:k( 500,0.7,2)+800
   kMix = randi:k(0.4, 0.4,2)+0.5

 aout  clfilt (aFrq1+aFrq2)*aEnv, kCutOff, 0, 50
 aRvbOut,aRvbOut freeverb aout, aout, 0.75,1
 aRvbMix		ntrpol		aout, aRvbOut , kMix
 out aRvbMix,aRvbMix
;fout     "WriteToDisk2.wav",4,aout
endin

;;long sequencer
instr Long_seq
	iNumber 	nstrnum "Long_seq"
kLongIndx init 0
 ktrig metro (1/(giSumArr*2))*gkTempo
 if ktrig == 1 then
   turnoff2   "PadLong", 0, 1
   schedulek "PadLongTrigger", 0, 0,giNoteArrP[kLongIndx]
   kLongIndx random 0, giCountMIDI
 endif
endin




instr Brass
iAtt = 0.5
iAmp = 10
aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, 0
ifrq	=	p4
print ifrq
kv1	= randi:k( 20 , 0.3, 2 ) + 100 
kv3	= randi:k( 50 , 0.7, 2 ) + 120
asig	STKBrass cpspch(ifrq), 1, 2, kv1, 4, 100, 11, kv3, 1, 10, 128, 40
aout	=	asig	*aEnv
   kMix = randi:k(0.4, 1,2)+0.5
   aEnvRvb interp (kMix+1)
 aRvbOut,aRvbOut freeverb aout, aout, 0.65,1
 aRvbMix		ntrpol		aout*aEnvRvb, aRvbOut , kMix
	outs aRvbMix, aRvbMix
endin

instr String
iAmp = 0.2
iAtt = 0.1
aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, 0
kamp = 0.1
icps random 80, 200
kpos randi 0.5, 5,2
kbowpres randi .2, 6,2
kbowpres = kbowpres + 0.7
gkgain = 0.999
iconst random 0.8, 0.9
ivel = 0
ibowpos = 0
ilow = 20 
print iconst
	ain  wgbowedbar 	kamp, icps, kpos, kbowpres, gkgain,iconst, ivel, ibowpos, ilow
	aout = ain*aEnv	
   kMix = randi:k(0.4, 1,2)+0.5
   aEnvRvb interp (kMix+1)
 aRvbOut,aRvbOut freeverb aout, aout, 0.65,1
 aRvbMix		ntrpol		aout*aEnvRvb, aRvbOut , kMix
	outs aRvbMix*aEnvRvb, aRvbMix*aEnvRvb
endin

instr Sample
if metro:k(3)  == 1 then
kFrq = (random:k( 0,100) > 35 ) ? -1 : 1
kRndSample = int(random:k( 0, 7))
kStart random 0, 10
;printk2 kRndSample
schedulek "SamplePlay", 0, 3,kRndSample, kFrq,kStart
endif
endin
instr SamplePlay
iRndSample = p4
kFrq = p5
iStart = p6
iAtt = 0.1
iAmp = 0.4
aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -4, 0
Ssample [] fillarray "farnaz.wav", "owl1.wav", "owl2.wav", "owl3.wav", "owl4.wav", "owl5.wav", "owl6.wav"
ain diskin2 Ssample [iRndSample], kFrq, iStart, 1
kCut = randi:k(1000,1,2)+2200
 aFltrOut clfilt ain, kCut, 0, 35
aout = aFltrOut*aEnv
kMix = randi:k(0.4, 0.7, 2) + 0.5
aEnvRvb interp (kMix+1)
aRvbOut,aRvbOut freeverb aout, aout, 0.7,1
aRvbMix		ntrpol		aout*aEnvRvb, aRvbOut , kMix
out aRvbMix, aRvbMix
endin

instr Seq1On
chnset "colour(208, 200, 253)", "Seq1LID"
endin
instr Seq1Off
chnset "colour(100, 100, 110)", "Seq1LID"
endin
instr Seq2On
chnset "colour(208, 200, 253)", "Seq2LID"
endin
instr Seq2Off
chnset "colour(100, 100, 110)", "Seq2LID"
endin
instr MIDIOn
chnset "colour(208, 200, 253)", "MIDILID"
endin
instr MIDIOff
chnset "colour(100, 100, 110)", "MIDILID"
endin



</CsInstruments>
<CsScore>
i "Widgets" 0 999
i "effects" 0 999
</CsScore>
</CsoundSynthesizer>

