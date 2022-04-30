
<Cabbage>
form caption("CoreLa") size(250, 300)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("crla")
image bounds(0, 0, 250, 300) channel("img") file("CoreLa.jpg")
;;Sequencer
label    bounds(35, 15, 40, 12) text("On/Off") channel("label1")
checkbox bounds(10, 10, 20, 20) colour:0(100, 100, 100, 255) popupText("Start")  channel("sq") colour:1(100, 250, 60, 255) value(1)
checkbox bounds(12, 40, 15, 15) colour:0(100, 100, 100, 255) popupText("Hold")  channel("hold") colour:1(0, 212, 255, 255)
label    bounds(35, 42, 30, 12) text("Hold") channel("label2")
nslider  bounds(90, 15, 40, 31) range(50, 180, 90, 1, 1)  fontColour(208, 157, 253, 255) text("BPM") channel("BPM")
nslider  bounds(130, 15, 30, 31) range(1, 10, 4, 1, 1)  fontColour(208, 157, 253, 255) text("DV") channel("DV") 
combobox bounds(165, 10, 65, 25) text("Indian", "Tala", "Rep", "Plus", "Change") channel("tala") 
hslider bounds(70, 73, 150, 28) range(0.05, 2, 0.7, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) channel("dur")
label    bounds(10, 80, 50, 12) text("Duration") channel("labe3")
texteditor bounds(40, 117, 175, 20) channel("NoteArr") colour(180, 140, 250, 150) colour:0(180, 140, 250, 200)fontSize(20)
label      bounds(0, 122, 35, 12) text("nte") channel("label70")
checkbox   bounds(220, 120, 15, 15) colour:0(100, 100, 100, 255)  channel("nte") colour:1(0, 212, 255, 255) value(0)

texteditor bounds(40, 141, 200, 20) channel("SeqArr") colour(180, 140, 250, 150) colour:0(180, 140, 250, 200)fontSize(20)
label      bounds(0, 145, 35, 12) text("seq") channel("label4")
checkbox   bounds(148, 170, 15, 15) colour:0(100, 100, 100, 255)  channel("vlc") colour:1(0, 212, 255, 255) value(0)
texteditor bounds(40, 166, 100, 20) channel("VelocArr") colour(180, 140, 250, 150) colour:0(180, 140, 250, 200)fontSize(20)
label      bounds(0, 168, 35, 12) text("vel") channel("label5")
checkbox   bounds(124, 194, 15, 15) colour:0(100, 100, 100, 255)  channel("Bss") colour:1(0, 212, 255, 255) value(1)
texteditor bounds(40, 191, 80, 20) channel("BassArr") colour(180, 140, 250, 150) colour:0(180, 140, 250, 200)fontSize(20)
label      bounds(0, 193, 35, 12) text("Bss") channel("label6")
checkbox   bounds(125, 219, 15, 15) colour:0(100, 100, 100, 255)  channel("Rep") colour:1(0, 212, 255, 255) value(1)
texteditor bounds(40, 216, 80, 20) channel("RepArr") colour(180, 140, 250, 150) colour:0(180, 140, 250, 200)fontSize(20)
label      bounds(0, 220, 35, 12) text("Rep") channel("label7")

nslider  bounds(98, 47, 25, 26) range(1, 7, 5, 1, 1)  fontColour(208, 157, 253, 255) channel("dlt")
checkbox bounds(130, 54, 15, 15) channel("dl") colour:0(100, 100, 100, 255) colour:1(0, 212, 255, 255) value(0)
label    bounds(176, 176, 40, 12) text("On/Off") channel("label27")
checkbox bounds(222, 174, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("dng") colour:1(100, 250, 60, 255) value(1)
combobox bounds(189, 242, 52, 23) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2)
combobox bounds(147, 216, 94, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2) 
combobox bounds(164, 194, 77, 19) text("Instr", "Pick", "VCO") channel("instr")  value(3)

label bounds(170, 40, 55, 28) channel("SeqCount") text("0") fontColour(208, 157, 253, 255)
label bounds(6, 276, 240, 16) channel("SeqArRy")  fontColour(208, 157, 253, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1

 seed 0
 massign 1,1

#include "CoreLa.udo"
	


 giArrNote  [] init 8
 giArrEmpty [] init lenarray:i(giArrNote)
 giArrVeloc [] init lenarray:i(giArrNote)
 giArrVel [] = giArrVeloc
 giLenVel      lenarray giArrVel
 giNote     [] fillarray 1,1
 giWriteNote   init 0




gkHold init 0

instr GetMidi ;1
 iActive1 active 1
 iHold cabbageGetValue "hold"

 kRel release
 iNum notnum
 iVel veloc 0,127
 
 if iActive1 == 1 then
  giArrNote [] = giArrEmpty
  giArrVeloc [] = giArrEmpty
  giWriteNote = 0
 endif
 schedule "WriteMidi",0,.1,iNum,iVel
 	if kRel == 1 && changed(kRel) == 1 && iHold == 0 then
 	schedulek "WriteMidi", 0, .1,iNum,0
 	endif
endin
instr WriteMidi ;2
iVelocIn cabbageGetValue "vlc"
 iActive1 active 1
 iNote = p4
 iVel = p5
 iveloc = int((p5/127)*10)

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
 if iVelocIn == 0 then
 giArrVeloc [giWriteNote] = iveloc
 endif
 elseif iVel == 0 then
		indxw = 0
		while indxw < iLen do
			if giArrNote [indxw] == iNote then
			giArrNote [indxw] = 0
			 if iVelocIn == 0 then
			giArrVeloc [indxw] = 0
			endif
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
 ;printarray giArrNote,"%d", "Array:"
 ;printarray giNote,"%d","Note:"
 
 if iVelocIn == 0 then
  giArrVel [] RmvZ giArrVeloc
  giLenVel lenarray giArrVel
 endif
  ;printarray giArrVeloc,"%d","veloc:"
  ;printarray giArrVel,"%d","veloc:"
endin



instr Widgets ;6
schedule "Effect", 0, -1
kHold cabbageGet "hold"
if kHold == 0 && changed(kHold) == 1 then
schedulek "Empty",0,0.1,1
endif

  Snte  = "60 74 67 63 68 79"
  Sseq  = "1 2 2 4 1 1 2 1 4"
  Svel  = "2 2 2 7"
  Sbss  = "2 3 5"
  Srp   = "2 5 8"
  cabbageSet "NoteArr" , "text",  Snte
  cabbageSet "SeqArr"  , "text",  Sseq
  cabbageSet "VelocArr", "text",  Svel
  cabbageSet "BassArr" , "text",  Sbss
  cabbageSet "RepArr"  , "text",  Srp
  SNteIn cabbageGetValue  "NoteArr"
  SseqIn cabbageGet  "SeqArr"
  SvelIn cabbageGet  "VelocArr"
  SbssIn cabbageGet  "BassArr"
  SrpIn  cabbageGet  "RepArr"
  
  puts SNteIn,1
  kVelOn cabbageGet   "vlc"
  kNteOn cabbageGet   "nte"

  if kNteOn == 1 && changed(kNteOn) == 1 then
  schedulek "StrngNte",0,0.1,SNteIn
  elseif kNteOn == 0 && changed(kNteOn) == 1 then
  schedulek "Empty",0,0.1,1
  endif
  if kVelOn == 1 && changed(kVelOn) == 1 then
  schedulek "StrngVel",0,0.1,SvelIn
  elseif kVelOn == 0 && changed(kVelOn) == 1 then
  schedulek "Empty",0,0.1,2
  endif
  
  if changed(SNteIn) == 1 && kNteOn == 1 then
  schedulek "StrngNte",0,0.1,SNteIn
  endif
  if changed(SseqIn) == 1 then
  turnoff2 "RySeq",0,0
  schedulek "StrngSeq",0,0.1,SseqIn
  schedulek "RySeq",0.15,-1
  endif
  if changed(SvelIn) == 1 && kVelOn == 1 then
  schedulek "StrngVel",0,0.1,SvelIn
  endif
  if changed(SbssIn) == 1 then
  schedulek "StrngBass",0,0.1,SbssIn
  endif
  if changed(SrpIn) == 1 then
  schedulek "StrngRep",0,0.1,SrpIn
  endif

;printk2 kSeqOnOff

  kSeqOnOff cabbageGet "sq"
  if kSeqOnOff == 1 && changed(kSeqOnOff) == 1 then
  schedulek "RySeq",0.15,-1
  elseif kSeqOnOff == 0 && changed(kSeqOnOff) == 1 then
  turnoff2 "RySeq",0,0
  endif


  kPedal ctrl7 10,64,0,1
  if kPedal == 1 && changed(kPedal) == 1 then
  schedulek "hold", 0,0.1,1
  elseif kPedal == 0 && changed(kPedal) == 1 then
  schedulek "Empty",0,0.1,1
  schedulek "hold",0,0.1,0
  endif
endin


instr wgs
print 1
  SNteIn cabbageGet  "NoteArr"
  SseqIn cabbageGet  "SeqArr"
  SvelIn cabbageGet  "VelocArr"
  SbssIn cabbageGet  "BassArr"
  SrpIn  cabbageGet  "RepArr"
  kVelOn cabbageGet   "vlc"
  kNteOn cabbageGet   "nte"
  schedule "StrngNte",0,0.1,SNteIn
  schedule "StrngSeq",0,0.1,SseqIn
  schedule "StrngVel",0,0.1,SvelIn
  schedule "StrngBass",0,0.1,SbssIn
  schedule "StrngRep",0,0.1,SrpIn
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


instr StrngNte
SIn = p4
giArrNote  [] StrToArr SIn
giNote [] = giArrNote
giLenNote lenarray giNote
endin

instr StrngSeq
iTala cabbageGetValue "tala"
schedule "tala",0,0.1,1,iTala
 SIn = p4
giArrSeq  [] StrToArr SIn
giArrSeqP [] = giArrSeq
giLenSeq lenarray giArrSeqP
Sscale     sprintf "text(Seq: %s)",SIn
  Sprint init ""
  Sprint strcat Sprint, Sscale
 cabbageSet 1, "SeqArRy",Sprint
 ;printarray giArrSeqP, "%d","seq"
endin
instr StrngVel
 SIn = p4
 puts SIn,1
giArrVeloc [] StrToArr SIn
giArrVel = giArrVeloc
giLenVel lenarray giArrVel
;printarray giArrVel, "%d","veloc"
endin
instr StrngBass
 SIn = p4
giArrBass [] StrToArr SIn
giLenBass lenarray giArrBass
;printarray giArrBass, "%d","bass"
endin
instr StrngRep
 SIn = p4
giArrRep [] StrToArr SIn
giLenRep  lenarray giArrRep
;printarray giArrRep, "%d","rep"
endin

instr putstrng
 Sout ArrToStrg giArrSeqP
 Sscale     sprintf "text(Seq: %s)",Sout
  ;puts Sscale,1
  Sprint init ""
  Sprint strcat Sprint, Sscale
 cabbageSet 1, "SeqArRy",Sprint
endin



instr RySeq ;3
 kActive1 active 1
 kHold cabbageGet "hold"
 kTala cabbageGet "tala"
 kDur cabbageGet "dur"
 kDing cabbageGet "dng"

 kTime    init 0
 kTimeB   init 0
 kSeqIndx init 0
 kVelIndx init 0
 kTempo cabbageGet "BPM"
 kBPM = kTempo/60
 kTms cabbageGet "DV"
 kBassIn cabbageGet "Bss"
 kRepIn cabbageGet "Rep"
 kVeloIn cabbageGet "vlc"
 kNoteIndx init 0
 kTalaCount init 0
 kRep init 0

 if metro(1/kTime) == 1 then
 kTime = (giArrSeqP[kSeqIndx])/(kBPM*kTms)
 kNoteIndx = (kNoteIndx+1) % giLenNote
    if changed(gkLenNote) == 1 then
    kNoteIndx = gkLenNote-1
    endif
 kNote = giNote[kNoteIndx]
 kVelIndx = (kVelIndx+1) % giLenVel
 kVeloc = giArrVel [kVelIndx]
 if kNote > 20  then
 schedulek "MidiOut",0,kDur,kNote,kVeloc
   if kDing == 1 then
 schedulek "Sound"  ,0,kDur,kNote,kVeloc,0.0005
   endif
	;;Rep Seq:
	if kRepIn == 1 then
	kndxRepCh = 0
	while kndxRepCh < giLenRep do
			if kSeqIndx == giArrRep[kndxRepCh] then
                            kNoteRep = kNote
					    	until kNoteRep > 80 do
  							kNoteRep = kNoteRep+12
  							enduntil
			 kTrigRep = 0
			 kRepR = ((int(random:k(0,16)))/4)+0.5
						until kTrigRep > .08 do
						kRepT = giArrSeqP[kSeqIndx]*kRepR
  						kRepR = kRepR-.25
  						kTrigRep = kTime/kRepT
  						enduntil
  								until kTrigRep < .3 do
								kRepT = giArrSeqP[kSeqIndx]*kRepR
  								kRepR = kRepR+.25
  								kTrigRep = kTime/kRepT
  								enduntil
                    kDurRep =  kTrigRep
					kndxRep = 1
					while kndxRep < kRepT do
						schedulek "MidiOut",kTrigRep,kDurRep,kNoteRep,1
						  if kDing == 1 then
						schedulek "Sound"  ,kTrigRep,kDurRep,kNoteRep,-1,0.001
						  endif
						kTrigRep += kTime/kRepT
						kndxRep += 1
					od			
			endif
	kndxRepCh += 1
	od
    endif
;;Bass
if kBassIn == 1 then
	kndxB = 0
	while kndxB < giLenBass do
			if kSeqIndx == giArrBass[kndxB] then
			                kBidx = 0
                            kNoteBass = giNote [kBidx]
					    	until kNoteBass < 40 do
  							kNoteBass = kNoteBass-12
  							enduntil
					if giArrSeqP [kSeqIndx] <= 2 then
					kTrigBass = kTime/2
					else
					kRndBass = int(random:k(1,4))
					kTrigBass = (kTime/4)*kRndBass
					kBassRep = kTrigBass
							if kRndBass == 1 then
								kndxRB = 0
								while kndxRB < int(random:k(0,3)) do
								schedulek "MidiOut",kTrigBass,kDur,kNoteBass,kVeloc
								  if kDing == 1 then
								schedulek "Sound"  ,kTrigBass,kDur,kNoteBass,kVeloc,0.0005
								  endif
								kndxRB += 1
								kTrigBass += kBassRep
								od
							endif
					endif
			schedulek "MidiOut",kTrigBass,kDur,kNoteBass,kVeloc
			  if kDing == 1 then
			schedulek "Sound"  ,kTrigBass,kDur,kNoteBass,kVeloc,0.0005
			  endif
			endif
	kndxB += 1
	od

endif
 endif
    SseqCount     sprintfk "text(%d)", kSeqIndx+1
    kTrig changed SseqCount
    cabbageSet kTrig,"SeqCount",SseqCount
    kSeqIndx = (kSeqIndx+1) % (giLenSeq+kRep)


 		;;Tala
		if kSeqIndx == 0 then
		schedulek "tala",0,0.1,kTalaCount,kTala
		kTalaCount = (kTalaCount+1) % giLenSeq
		    if kTala == 3 then
		    kRep = 1
		    else
		    kRep = 0
		    endif
		endif
endif
 
endin


instr tala ;4
iTala = p4
iChoose = p5
if iChoose == 1 then
giArrSeqP [] = giArrSeq
elseif iChoose == 2 then
giArrSeqP [] ArrTala giArrSeq, iTala
elseif iChoose == 3 then
giArrSeqP [] ArrRep giArrSeq, iTala
elseif iChoose == 4 then
giArrSeqP [] ArrPlus giArrSeq, iTala
elseif iChoose == 5 then
giArrSeqP [] ArrChng giArrSeq
endif
;printarray giArrSeqP, "%.2f"
schedule "putstrng",0,0.1
endin


instr Sound ;5
;;Frq
iMidiNote = p4
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

;;amp
iveloc = p5
;print iveloc
iAtt = p6
 aEnv transeg 0, iAtt,4, 1, p3-iAtt,-6, 0
 
 
 
 iModIn cabbageGetValue "instr"
iMod = iModIn-1
if iMod == 0 goto end
if iMod == 1 goto pick
if iMod == 2 goto VCO

pick:
iDur = (p3 < 0.2 ) ? 0.2 : p3
iplk  MirrorMe (iveloc/10)*0.3,0.01,.3
ipick = (iveloc/10)*0.3
irefl MirrorMe iDur,0,1
aPick wgpluck2 iplk,.3, iFrq, ipick, irefl-0.01
aout = aPick*aEnv
goto OUT

VCO:
 iPW random 0, 1
 aSine    vco2    .1+iveloc/20,iFrq,0,iPW
 aFilter clfilt aSine, 700+(iFrq), 0, 20
 aFilter clfilt aFilter, 100, 1, 10
 aout = aFilter*aEnv
goto OUT

 OUT:
 chnmix aout, "snd"
 end:
endin

instr Effect
kDel cabbageGet "dl"
kDelayTime cabbageGet "dlt"
kFeedback = .3

;;sound

aIn chnget "snd"
;;time
kBPM cabbageGet "BPM"
kTempo = kBPM/60
kTms cabbageGet "DV"
kTime = (1/(kTempo*kTms))*kDelayTime
if kDel == 0 then
aInD = aIn*0
elseif kDel == 1 then
aInD = aIn
endif
 	aTim	interp	kTime
 	abuf	delayr	7
 	aDelay	deltapi	aTim	
 	delayw	aInD + (aDelay*kFeedback)
  	aDelMix		ntrpol	 aIn,aDelay,  .65
  
  aRvrbL, aRvrbR reverbsc aIn,aIn, 0.7, 1600
  aoutL	ntrpol	 aIn,aRvrbL+aDelMix,  .4
  aoutR	ntrpol	 aIn,aRvrbR+aDelMix,  .4
out aoutL*2,aoutR*2
chnclear "snd"
endin



instr MidiOut ;12
inum = p4
ivel = int((p5*127)/10)
;print inum,ivel
midion 1, inum, ivel
endin

</CsInstruments>
<CsScore>
i "Widgets" 0 9999
</CsScore>
</CsoundSynthesizer>

