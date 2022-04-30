
<Cabbage>
form caption("CoreLa") size(900, 500)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("crla")
image bounds(0, 0, 900, 500) channel("img") file("CoreLa.jpg")
combobox bounds(834, 460, 52, 23) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2)
combobox bounds(792, 434, 94, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2) 
label bounds(776, 378, 107, 52) channel("Note")  fontColour(144, 80, 159, 255) text("")
vmeter bounds(26, 320, 23, 160) channel("meter") value(0) outlineColour(0, 0, 0), overlayColour(0, 0, 0) meterColour:0(255, 0, 0) meterColour:1(255, 255, 0) meterColour:2(0, 255, 0) outlineThickness(1) 
label bounds(726, 464, 75, 16) channel("111")  fontColour(144, 80, 159, 255) text("by Parnux")


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1




#include "CoreLa.udo"
giMetro = 80
giRV = 5
giArrSeqIn[]  fillarray 1,2,2,4,1,3,1,1,2,1,4
giArrSeq[]    fillarray 1,2,2,4,1,3,1,1,2,1,4
giLenSeq lenarray giArrSeq
giArrStartX[] init giLenSeq

giRepArr[] fillarray 1,4,6,8,giLenSeq-1
giLenRep lenarray giRepArr

giBassArr[] fillarray 1,3,4,5,7,8
giLenBass lenarray giBassArr

 ;giArrNote[] fillarray 60,65,61,66,64,62,58,72
 giArrNote[] init 8
 giArrEmpty[] init lenarray:i(giArrNote)
 giArrVeloc[] init lenarray:i(giArrNote)
 giArrVel[] = giArrVeloc
 giLenVel      lenarray giArrVel
 giNote[] fillarray 1,1
 giWriteNote   init 0

gkHold init 0


giCenter = (900/2)-20
opcode circle, kk,iikii
    iX, iY, kRadius, iBeat, iPoints xin
    iSlice = ($M_PI*2)/(iPoints)
    iAngle = iSlice*iBeat
    kXPoint = iX + kRadius * cos(iAngle)
    kYPoint = iY + kRadius * sin(iAngle)
    xout kXPoint, kYPoint
endop

opcode ArrTala, i[], i[]i
 iInArr[],iTalaCount xin
 iLen lenarray iInArr
 iOutArr [] init iLen
 iRead = 0
 iWrite = iTalaCount
 while iRead < iLen do
 	iOutArr [iRead] = iInArr[iWrite]
	iRead +=1
	iWrite = (iWrite+1)% (iLen)
 od
 xout iOutArr
endop

opcode RGB, iii,i
iNumber xin
      if iNumber == 1 then
      iRed = 120
      iGrn = 120
      iBlu = 250
      elseif iNumber == 2 then
      iRed = 120
      iGrn = 250
      iBlu = 180
      elseif iNumber == 3 then
      iRed = 130
      iGrn = 180
      iBlu = 200
      elseif iNumber == 4 then
      iRed = 80
      iGrn = 120
      iBlu = 250
      elseif iNumber == 5 then
      iRed = 50
      iGrn = 150
      iBlu = 200
      endif
xout iRed,iGrn,iBlu
endop


instr GetMidi ;1
 iActive1 active 1
 iHold = 0; "hold"
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
iVelocIn = 0; "vlc"
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
 ;gkLenNote lenarray giNote
 ;printarray giArrNote,"%d", "Array:"
 ;printarray giNote,"%d","Note:"
 ;print giLenNote
 
 if iVelocIn == 0 then
  giArrVel [] RmvZ giArrVeloc
  giLenVel lenarray giArrVel
 endif
  ;printarray giArrVeloc,"%d","veloc:"
  ;printarray giArrVel,"%d","veloc:"
endin


instr Create
iCrtStep init 0
    while iCrtStep < giLenSeq do
      SSteps  sprintf "bounds(10, 10, 30, 30), shape(\"sharp\"),corners(3), channel(\"steps%d\"),alpha(1), visible(%d)",iCrtStep,0
      cabbageCreate "image", SSteps
    iCrtStep += 1
    od
iCrtRep init 0
    while iCrtRep < 4 do
      SRep  sprintf "bounds(10, 10, 20, 21), shape(\"circle\"), channel(\"Reps%d\"), visible(0)", iCrtRep
      cabbageCreate "image", SRep
      SRepG  sprintf "bounds(10, 10, 20, 21),corners(5), shape(\"square\"), channel(\"RepsG%d\"), visible(0)", iCrtRep
      cabbageCreate "image", SRepG
    iCrtRep += 1
    od
iCrtGraph init 0
  while iCrtGraph < 23 do
        Sgraph  sprintf "bounds(10, 10, 5, 5), corners(5), shape(\"circle\"),channel(\"shapes%d\"),visible(0)", iCrtGraph
        cabbageCreate "image", Sgraph
        iCrtGraph += 1
    od
    
endin
schedule "Create",0,0

instr StepsChng
iCrt init 0
iPosX init 50
    while iCrt < giLenSeq do
    iStepValue = giArrSeq[iCrt]
    iRed,iGrn,iBlu RGB iStepValue
      iG = giArrSeq[iCrt]*50
      iSizeX = giArrSeq[iCrt]*30
      Schnl   sprintf "steps%d", iCrt
      SSteps  sprintf "bounds(%d, 100, %d, 30), shape(\"sharp\"), channel(\"steps%d\"),alpha(1), visible(1),\
      colour(%d,%d,%d)",iPosX,iSizeX,iCrt,iRed,iGrn,iBlu
      cabbageSet Schnl, SSteps
      ;giArrStartX[iCrt] = iPosX
    iCrt += 1
    iPosX += 10+iSizeX
    od
endin
schedule "StepsChng",0,0


instr Tala
iTala = p4
giArrSeq[] ArrTala giArrSeqIn, iTala
schedule "StepsChngTala",0,0
;printarray giArrSeq, "%d"
endin

instr StepsChngTala
iCrt init 0
iPosX init 50
    while iCrt < giLenSeq do
      iG = giArrSeq[iCrt]*50
      iSizeX = giArrSeq[iCrt]*30
      giArrStartX[iCrt] = iPosX
    iCrt += 1
    iPosX += 10+iSizeX
    od
endin
schedule "StepsChngTala",0,0



instr Metro
kTalaCount init 1
kTime init 0
kSeqIndx init 0
kNoteIndx init 0
iBPM = giMetro/60
kNoteIn = giNote[0]

if metro(1/kTime) == 1 then

kTime = (giArrSeq[kSeqIndx]/(iBPM*giRV))
kNoteIndx = (kNoteIndx+1) % giLenNote
kNote = giNote[kNoteIndx]
if kNote > 20 then
kStepsValue = giArrSeq[kSeqIndx]
if kSeqIndx != (giLenSeq-1) then
schedulek "SeqMotion", 0, kTime/2, kSeqIndx,1
endif
if kTalaCount == 0 && changed(kTalaCount) == 1 then
schedulek "ColorOff", 0, 0.1
endif
schedulek "Sound", 0, kTime, kNote,1
schedulek "GraphTrig", 0, kTime,kNote,kTalaCount

    if kSeqIndx == (giLenSeq-1) && changed(kSeqIndx) == 1 then
    schedulek "SeqMotion", 0, kTime/2, kSeqIndx,2
    schedulek "MotionTrg", 0, kTime/2
    schedulek "Tala",0.1,0,kTalaCount
    kTalaCount = (kTalaCount+1) % (lenarray(giArrSeq))
    endif
    if kSeqIndx == 0 && changed(kSeqIndx) == 1 then
    schedulek "StepsChng",0,0.1
    endif
    ;;rep
    kRepIndx = 0
    while kRepIndx < giLenRep do
        if kSeqIndx+1 == giRepArr[kRepIndx] then
            if giArrSeq[kSeqIndx] == 1 then
            kRepT = 1*kStepsValue
            elseif giArrSeq[kSeqIndx] == 2 then
            kRepT = random:k(0,100) > 50 ? kStepsValue:kStepsValue*2
            elseif giArrSeq[kSeqIndx] > 2 then
            kRepT = int(random:k(2,5))
            endif
                kNoteRep = kNote
			    until kNoteRep > 80 do
  				kNoteRep = kNoteRep+12
  			    enduntil
        kRep = 0
        kDelay = kTime/kRepT
        kTrig = kDelay
            while kRep < kRepT do
            schedulek "RepShape1", kTrig,0.1,kRep,giRepArr[kRepIndx],giArrSeq[kSeqIndx]
            schedulek "Sound", kTrig, 0.1, kNoteRep,0.6
            schedulek "GraphRep", kTrig, 0.1,kRep, kNoteRep
            schedulek "RepShape0", kTrig+(kTime/kRepT),0.1,kRep,giRepArr[kRepIndx]
            kRep += 1
            kTrig += kTime/kRepT
            od
        endif
     kRepIndx += 1
     od
         ;;Bass
    kBassIndx = 0
    while kBassIndx < giLenBass do
        if kSeqIndx+1 == giBassArr[kBassIndx] then
            if kStepsValue == 1 then
            kRndBass = 0
            elseif kStepsValue == 2 then
            kRndBass = 2
            endif
                kNoteBass = kNote
			    until kNoteBass < 50 do
  			    kNoteBass = kNoteBass-12
  				enduntil
        if giArrSeq[kSeqIndx] != 3 then
        schedulek "Sound", (kTime/4)*kRndBass, kTime,kNoteBass, 0.7
        endif
        schedulek "BassShape1", kTime/2,0.1,giBassArr[kBassIndx],giArrSeq[kSeqIndx]
        schedulek "BassShape0", kTime  ,0.1,giBassArr[kBassIndx]
        endif
    kBassIndx += 1
    od
kSeqIndx = (kSeqIndx+1) % (lenarray(giArrSeq))
endif
endif
endin

schedule "Metro",0,9999





instr MotionTrg
indx = 0
while indx < giLenSeq do
schedule "StepMotion",0,p3,indx
indx += 1
od
endin

instr StepMotion
kFade linseg 1, p3,-0.9
cabbageSet metro(50),"steps0", "alpha", kFade

indx = p4
if indx != 0 then
iStart = giArrStartX[indx]
iEnd = (giArrStartX[indx]-((giArrSeq[0]*30)+10))
kPointX linseg iStart, p3, iEnd-0.1

iSizeX = giArrSeq[indx]*30
Schnl   sprintf "steps%d", indx
SSteps  sprintfk "bounds(%d, 100, %d, 30), shape(\"sharp\"),visible(1)" ,kPointX,iSizeX
      cabbageSet metro(100),Schnl, SSteps
endif
endin

instr SeqMotion
iStepNumber = p4

iSizeX = giArrSeq[iStepNumber]*30
iSizeY = 30
iPosY = 100
if p5 = 1 then
iStart = giArrStartX[iStepNumber]+5
iEndX = giArrStartX[iStepNumber]
elseif p5 = 2 then
kSizeX linseg iSizeX-30, p3, iSizeX
iStart = giArrStartX[iStepNumber]+5
iEndX = (giArrStartX[iStepNumber]-((giArrSeq[0]*30)+10))
endif
kSizeX linseg iSizeX-20, p3, iSizeX
kSizeY linseg iSizeY+15,p3,iSizeY
kPosX linseg iStart,p3,iEndX
kPosY linseg iPosY-5,p3, iPosY
Schnl   sprintf "steps%d", iStepNumber
SSteps  sprintfk "bounds(%d, %d, %d, %d), shape(\"sharp\"),visible(1)" ,kPosX,kPosY,kSizeX,kSizeY
      cabbageSet metro(100),Schnl, SSteps

endin


instr RepShape1
iRepNumber = p4
iRepIndx = p5-1
iPointX = (iRepNumber*10)+giArrStartX[iRepIndx]
iPointY = 70
iStepValue = p6
  iRed,iGrn,iBlu RGB iStepValue   
SChannel sprintf "Reps%d", iRepNumber
      SRep  sprintf "bounds(%d, %d, 17, 18), channel(\"Reps%d\"),visible(1),\
      colour(%d,%d,%d)", iPointX,iPointY, iRepNumber,iRed,iGrn,iBlu
      cabbageSet SChannel, SRep
endin
instr RepShape0
iRepNumber = p4
iPointX = (p5*70)
iPointY = (iRepNumber*(-20))+150
SChannel sprintf "Reps%d", iRepNumber
      SRep  sprintf "bounds(%d, %d, 20, 21), channel(\"Reps%d\"),visible(%d),colour(250,120,250)", iPointX,iPointY, iRepNumber,0
      cabbageSet SChannel, SRep
endin

instr BassShape1
iBassIndx = p4-1
iStepValue = p5
  iRed,iGrn,iBlu RGB iStepValue  
iPointX = giArrStartX[iBassIndx]+10
      SBassShape  sprintf "bounds(%d, 140, 20, 21), channel(\"BassShape\"),visible(1),colour(%d,%d,%d)", iPointX,iRed,iGrn,iBlu
      cabbageSet "BassShape", SBassShape
endin
instr BassShape0
iPointX = (p4*70)+30
      SBassShape  sprintf "bounds(%d, 250, 20, 21), channel(\"BassShape\"),visible(%d),colour(120,150,250)", iPointX,0
      cabbageSet "BassShape", SBassShape
endin


instr GraphTrig
    iGraph = 0
    while iGraph < giLenSeq do
    schedule "Graph", 0, p3/2,iGraph,p4
    schedule "Fade", p3/3, p3,iGraph
    iGraph += 1
    od
    schedule "ColorOn", 0, 0.1,p5
endin


instr Graph
indx = p4
iTala = p6
kCircleWide linseg 30, p3, 100
iSizeX = 30
iSizeY = 31
iPoints = giLenSeq
iCircleX = giCenter
iCircleY = 300
iRotate = 0
kPosX, kPosY circle iCircleX, iCircleY, kCircleWide, indx, iPoints
Schnl sprintf "shapes%d", indx
Schng sprintfk "bounds(%d, %d, %d, %d), corners(2),visible(1),rotate(%d,0,0),alpha(1)\
",kPosX,kPosY,iSizeX,iSizeY,iRotate
cabbageSet metro(100),Schnl, Schng
endin

instr Fade
indx = p4
kFade linseg 2, p3,-0.9
Schnl sprintf "shapes%d", indx
cabbageSet metro(100),Schnl, "alpha", kFade
endin


instr ColorOn
indx = p4
iG = 150
iR = 100
iB = 250
Schnl sprintf "shapes%d", indx
Schng sprintf "colour(%d,%d,%d)",iG,iR,iB
cabbageSet Schnl, Schng
endin


instr ColorOff
indx = 0
while indx < giLenSeq do
Schnl sprintf "shapes%d", indx
Schng sprintf "colour(100,100,%d)",100
cabbageSet Schnl, Schng
indx += 1
od
endin
schedule "ColorOff", 0, 0

instr GraphRep
indx = p4
iG = p5*10
iR = (p5*20)+50
iB = (p5*10)+200
iPosX = giCenter
iPosY = 300
iSizeX random 30, 80
iSizeY = 10
iRotate random 0, 100
Schnl sprintf "RepsG%d", indx
;puts Schnl,1
Schng sprintf "bounds(%d, %d, %d, %d),visible(1),rotate(%d,10,10),alpha(1)\
colour(%d,%d,%d)",iPosX,iPosY,iSizeX,iSizeY,iRotate,iG,iR,iB
cabbageSet Schnl, Schng
endin

instr Sound

;;Frq
iMidiNote = p4
SNote mton iMidiNote
schedule "NoteShow",0,1,SNote
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


iAttP = 0.005
iplk  random 0.1, 0.5
ipick random 0.1, 0.8
irefl random 0.1, 0.9
aPick wgpluck2 iplk,.3, iFrq, ipick, irefl-0.01
 aEnvP transeg 0, iAttP,4, .5, p3-iAttP,-6, 0
 
iAtt = 0.0001
 iPW random 0, 1
 aSine    vco2    .2,iFrq,0,iPW
 aFilter clfilt aSine, 700+(iFrq), 0, 20
 aFilter clfilt aFilter, 100, 1, 10
 aEnv transeg 0, iAtt,4, 1, p3-iAtt,-6, 0
 aout = (aFilter*aEnv)+(aPick*aEnvP)
 chnmix aout, "snd"
endin

instr Effect
kDel = 1
kDelayTime = 4
kFeedback = .1

;;sound

aIn chnget "snd"
;;time
kBPM = 90
kTempo = kBPM/60
kTms = 2
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
  	aDelMix		ntrpol	 aIn,aDelay,  .2
  
  aRvrbL, aRvrbR reverbsc aIn,aIn, 0.8, 1600
  aoutL	ntrpol	 aIn,aRvrbL+aDelMix,  .7
  aoutR	ntrpol	 aIn,aRvrbR+aDelMix,  .7
out aoutL*2,aoutR*2

koutL rms aoutL, 50
  koutL portk koutL, 0.25
  cabbageSetValue "meter", koutL*15, metro(50)
chnclear "snd"
endin

schedule "Effect",0,999


instr NoteShow
SNoteIn = p4
SNote   sprintf "text(%s)", SNoteIn
cabbageSet "Note",SNote
endin
</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>

