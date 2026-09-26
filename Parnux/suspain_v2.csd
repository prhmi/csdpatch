<Cabbage>
form caption("SusPain") size(900, 520),guiMode("queue")  pluginId("pdal") colour(10,35,45)
image bounds(0, 0, 900, 520) file("suspain.jpg") channel("image10")
;;score
image bounds(18, 159, 360, 330) file("piano.png") channel("image1")
image bounds(94, 127, 285, 27) file("octaveUp.png") channel("image2")
image bounds(94, 479, 285, 27) file("octaveDown.png") channel("image7")
image bounds(120, 324, 200, 1)  channel("image3")
image bounds(180, 184, 120, 1)  channel("image4")
image bounds(180, 173, 120, 1)  channel("image5")
image bounds(180, 164, 120, 1)  channel("image6")
;;Pedal
rslider bounds(40, 34, 75, 75) channel("PedOff") range(0.2, 2, 0.5, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
checkbox bounds(354, 66, 30, 30) channel("Pedal") colour:0(95, 96, 108, 255) colour:1(87, 72, 152, 255) corners(5) value(1)
label bounds(336, 40, 63, 17) channel("label10048") text("On/Off") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
label bounds(40, 16, 75, 15) channel("label10049") text("Pedal Off") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
rslider bounds(120, 34, 75, 75) channel("PedOn") range(0.1, 2, 0.5, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
label bounds(120, 16, 77, 14) channel("label10050") text("Pedal On") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
rslider bounds(224, 44, 65, 65) channel("RndPdl") range(0, 1, 0.15, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
label bounds(208, 28, 97, 14) channel("label10051") text("Random Rng") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
image bounds(320, 74, 20, 20) channel("PedalShow") colour(151, 151, 217, 255) 
;;High Notes
label bounds(420, 230, 97, 17) channel("labele1060") text("Right Hand") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
texteditor bounds(664, 52, 188, 30)  colour:0(151, 151, 217, 255) text("") channel("txta") fontSize(20)
checkbox bounds(552, 54, 30, 30) channel("Scale") colour:0(95, 96, 108, 255) colour:1(87, 72, 152, 255) corners(5) value(1)
label bounds(534, 28, 63, 17) channel("label10047") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255) text("On/Off")
label bounds(598, 58, 63, 17) channel("label2047") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255) text("Scale:")
label bounds(654, 26, 114, 14) channel("label10065") text("Range of scale:") colour(156, 156, 156, 0) fontColour(224, 220, 220, 255)
hrange bounds(664, 84, 190, 40) channel("MinRng", "MaxRng") max(10) min(0) range(0, 10, 2:4, 1, 1) increment(1) trackerColour(112, 125, 202, 255)
nslider bounds(636, 88, 38, 30) channel("MinShow") colour(0, 0, 0, 0) range(0, 100, 2, 1, 1)
nslider bounds(842, 88, 38, 30) channel("MaxShow") colour(0, 0, 0, 0) range(0, 100, 4, 1, 1)
nslider bounds(772, 18, 31, 32) channel("RngShow") range(0, 100, 2, 1, 1) colour(0, 0, 0, 0) 
rslider bounds(530, 206, 65, 65) channel("SideHDelay") range(0.1, 2, 0.5, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
rslider bounds(604, 206, 65, 65) channel("RngDlyHRnd") range(0.1, 1, 0.15, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
label bounds(526, 278, 71, 13) channel("label10060") text("Delay Time") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
label bounds(601, 278, 67, 13) channel("label10061") text("Delay Rng") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
label bounds(580, 130, 80, 14) channel("label10066") text("Main Note:") colour(156, 156, 156, 0) fontColour(224, 220, 220, 255)
hslider bounds(662, 118, 194, 43) channel("MainNote") range(0, 10, 5, 1, 1) trackerColour(147, 210, 0, 0) colour(72, 131, 209, 255)
nslider bounds(672, 244, 38, 30) channel("MinNoteShowH") range(0, 100, 4, 1, 1) colour(0, 0, 0, 0) 
nslider bounds(832, 244, 38, 30) channel("MaxNoteShowH") range(0, 100, 4, 1, 1) colour(0, 0, 0, 0) 
hrange bounds(684, 212, 176, 40) channel("MinNoteH", "MaxNoteH") max(4) min(1) range(1, 4, 2:4, 1, 1) increment(1) trackerColour(74, 102, 180, 255)
;;Low Notes
label bounds(428, 342, 88, 17) channel("labelf1060") text("Left Hand") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
rslider bounds(528, 318, 65, 65) channel("SideLDelay") range(0.2, 2, 0.8, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
rslider bounds(602, 318, 65, 65) channel("RngDlyLRnd") range(0.1, 1, 0.3, 1, 0.001) trackerColour(122, 139, 207, 255) valueTextBox(1) fontColour(255, 255, 255, 255)
label bounds(526, 388, 70, 13) channel("label1060") text("Delay Time") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
label bounds(604, 388, 65, 13) channel("label1061") text("Delay Rng") colour(156, 156, 156, 0) fontColour(204, 204, 204, 255)
nslider bounds(678, 356, 38, 30) channel("MinNoteShowL") range(0, 100, 4, 1, 1) colour(0, 0, 0, 0) 
nslider bounds(838, 356, 38, 30) channel("MaxNoteShowL") range(0, 100, 4, 1, 1) colour(0, 0, 0, 0) 
hrange bounds(690, 324, 176, 40) channel("MinNoteL", "MaxNoteL") max(4) min(1) range(1, 4, 1:2, 1, 1) increment(1) trackerColour(74, 102, 180, 255)
;;keyboard
gentable bounds(734, 425, 162, 92), tableNumber(1.0), , , , ampRange(0.0, 1.0, 1.0, 0.0100) active(1) tableColour:0(83, 89, 147, 255)
keyboard bounds(394, 448, 338, 68) channel("keyboardMidi") value(45) mouseOverKeyColour(59, 203, 212, 128)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128   -+rtmidi=null -ma -M0 -N -Q0 -+raw_controller_mode=1 temp.orc temp.sco
</CsOptions>
<CsInstruments>
; Initialize the global variables. 

ksmps = 32
nchnls = 2
0dbfs = 0




#include "suspain.udo"



massign	1,1
massign	2,4
massign	3,8


instr MIDI
  iNote		notnum
  schedule "NoteShow",0,10,iNote
  iVelocIn veloc
  iVelocTable tablei iVelocIn, 1
  iVelocity = iVelocTable*127
  midion 1, iNote, iVelocity
  
  iActive1 active "MIDI"
  iActive2 active "Pedal"
       ;;Pedal
       iPedal       cabbageGetValue "Pedal"
       iPedalOffIn  cabbageGetValue "PedOff"
       iPedalOnIn   cabbageGetValue "PedOn"
       iRndRng      cabbageGetValue "RndPdl"
       iPedalOff   random iPedalOffIn-iRndRng, iPedalOffIn+iRndRng
       iPedalOnInR random iPedalOnIn, iPedalOnIn+iRndRng
       iPedalOn = iPedalOff+iPedalOnInR
       ;print iPedalOff,iPedalOnIn,iPedalOn
       if iActive1 == 1 && iPedal == 1 && 
       iActive2 == 0 then
       schedule "Pedal" , iPedalOff, 0.5,   0
       schedule "Pedal" , iPedalOn, 0.5, 127
       endif

index = iActive1-1
  kRel release
 	if kRel == 1 && changed(kRel) == 1  then
 	schedulek "HideNotes", 0, .1,1,index
 	endif
; if kRel == 1 && iActive1 == 1 then
; turnoff2 "NoteShow",0,0
; kndxOff = 0
;    while kndxOff < 6 do
;    schedulek "HideNotes", 0, .1,1,kndxOff
;    kndxOff += 1
;    od
; endif
endin

instr NoteShow
iNote = p4
  iActive1 active "MIDI"
  index = iActive1-1
  iNotesArr[] init 6
  iNotesArr[index] = iNote

    if iNote >= 62 && iNote <= 79 then
    iPos = 402
    elseif iNote >= 41 && iNote <= 59 then
    iPos = 419
    elseif iNote == 60 || iNote == 61 then
    iPos = 410
    endif
  iNoteUp,iFade BWKeys iNote
  iX = (index*45)+100
  iY = iNoteUp+iPos
  SChnl sprintf "Note%d",index
  SPos sprintf "bounds(%d,%d,12,8),visible(%d)",iX,iY,1
  cabbageSet  SChnl,SPos
  SChnlSharp sprintf "Sharp%d",index
  SPosSharp sprintf "bounds(%d,%d,12,22),visible(%d)",iX-15,iY-7,iFade
  cabbageSet  SChnlSharp,SPosSharp
endin

instr Create
iCrtNotes init 0
    while iCrtNotes < 6 do
      SNotes  sprintf "bounds(10, 10, 12, 8), shape(\"circle\"), channel(\"Note%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SNotes
      SSharp  sprintf "bounds(10, 10, 12, 22), file(\"sharp.png\"), channel(\"Sharp%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SSharp
      SNoteHi  sprintf "bounds(10, 10, 12, 8), shape(\"circle\"), channel(\"NoteHi%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SNoteHi
      SSharpHi  sprintf "bounds(10, 10, 12, 22), file(\"sharp.png\"), channel(\"SharpHi%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SSharpHi
      SNoteLo  sprintf "bounds(10, 10, 12, 8), shape(\"circle\"), channel(\"NoteLo%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SNoteLo
      SSharpLo  sprintf "bounds(10, 10, 12, 22), file(\"sharp.png\"), channel(\"SharpLo%d\"), visible(%d)",iCrtNotes,0
      cabbageCreate "image", SSharpLo
    iCrtNotes += 1
    od 
    ;;widget Write
    Stxta   = "2 2 1 2 1 2 3 2 1 2"
    cabbageSet "txta" , "text",  Stxta
endin
schedule "Create",0,0.1


instr NoteInH
  iNoteIn  notnum
  iVelocIn veloc
  iVelocTable tablei iVelocIn, 1
  iVelocity = iVelocTable*127
  midion 1, iNoteIn, iVelocity
  iPos = 365
  iActive1 active "NoteInH"
  iActive2 active "MIDI"
       ;;Pedal
       iPedal       cabbageGetValue "Pedal"
       iPedalOffIn  cabbageGetValue "PedOff"
       iPedalOnIn   cabbageGetValue "PedOn"
       iRndRng      cabbageGetValue "RndPdl"
       iPedalOff   random iPedalOffIn-iRndRng, iPedalOffIn+iRndRng
       iPedalOnInR random iPedalOnIn-iRndRng, iPedalOnIn+iRndRng
       iPedalOn = iPedalOff+iPedalOnInR
       if iActive1 == 1 && iPedal == 1 && iActive2 == 0 then
       schedule "Pedal" , iPedalOff, 0.5, 0
       schedule "Pedal" , iPedalOn , 0.5, 127
       endif
  index = iActive1-1
    iTrigDelay cabbageGetValue "SideHDelay" ; 1
    schedule "NoteTrigH",iTrigDelay, 1,iNoteIn,iVelocity,iTrigDelay
  iNoteUp,iFade BWKeys iNoteIn
  iX = 170
  iY = iNoteUp+iPos
  SChnl      sprintf "NoteHi%d",index
  SPos       sprintf "bounds(%d,%d,12,8),visible(%d)",iX,iY,1
  cabbageSet  SChnl,SPos
  SChnlSharp sprintf "SharpHi%d",index
  SPosSharp  sprintf "bounds(%d,%d,12,22),visible(%d)",iX-15,iY-7,iFade
  cabbageSet  SChnlSharp,SPosSharp
  kRel release
 	if kRel == 1 && changed(kRel) == 1 then
 	schedulek "HideNotes", 0, 1,2,index
    turnoff2 "NotePlayH", 0,0
    turnoff2 "NoteShowH",0,0
 	endif
endin




instr NoteTrigH
  iActiveSide active "NoteInH"
  iNoteIn = p4
  iVelocIn = p5
  iDur = p6
  ;iScaleArr[] fillarray  2, 2, 1, 2, 1, 2, 3, 2, 1, 2
  SscaleIn cabbageGet "txta"
  iScaleArr[] StrgArr SscaleIn
  ;printarray iScaleArr,"%d"
  iLenIn lenarray iScaleArr
  iLen = iLenIn-1
  iScale cabbageGetValue "Scale"
  iMinRngIn cabbageGetValue "MinRng"
  iMinRng = int((iMinRngIn*iLen)/10)
  iMaxRngIn cabbageGetValue "MaxRng"
  iMaxRng = int((iMaxRngIn*iLen)/10)
  iRng = iMaxRngIn-iMinRngIn
  iBasedxIn cabbageGetValue "MainNoteH"
  iBasedx = int((iBasedxIn*iLen)/10)
  iLenMinNote cabbageGetValue "MinNoteH"
  iLenMaxNote cabbageGetValue "MaxNoteH"
  iLenNotes = int(random:i(iLenMinNote,iLenMaxNote+1))
    ;print iMinRng,iMaxRng,iBasedx,iLen
    if iActiveSide != 0 && iScale == 1 then
      indxNotes = 0
      iTrig     cabbageGetValue "SideHDelay"
      iRngDelay cabbageGetValue "RngDlyHRnd"
      iDelayRnd = iTrig
      while indxNotes < iLenNotes do
            indxSum = int(random:i(iMinRng,iMaxRng+1))
        iScaleSum SumArr iScaleArr,iBasedx, indxSum
        iNoteOut = iNoteIn+iScaleSum
          if iNoteIn <= 47 then
            until iNoteOut <= 47 do
            iNoteOut = (iNoteOut-12)
            enduntil
          elseif iNoteIn >= 74 then
            until iNoteOut >= 74 do
            iNoteOut = (iNoteOut+12)
            enduntil
          endif
      iVelocity random iVelocIn-10,iVelocIn+10
      schedule "NotePlayH",iTrig,iDur,iNoteOut,iVelocity
      schedule "NoteShowH",iTrig,15,iNoteOut
            iRndDelay = 0.2 ;random iDelayRnd-iRngDelay, iDelayRnd+iRngDelay
            if iRndDelay <= 0.1 then
            iRndDelay = 0.1
            endif
      iDur = iRndDelay
      iTrig += iRndDelay
      indxNotes += 1
      od
    endif
endin

instr NotePlayH
  iNoteIn = p4
  iVelocity = p5
  midion 1, iNoteIn, iVelocity
endin

instr NoteShowH
iNoteIn = p4
 iActive active "NoteShowH"
  index = iActive
  iPos = 365
  iNoteUp,iFade BWKeys iNoteIn
  iX = (index*45)+160
  iY = iNoteUp+iPos
  SChnl sprintf "NoteHi%d",index
  SPos sprintf "bounds(%d,%d,12,8),visible(%d)",iX,iY,1
  cabbageSet  SChnl,SPos
  SChnlSharp sprintf "SharpHi%d",index
  SPosSharp sprintf "bounds(%d,%d,12,22),visible(%d)",iX-15,iY-7,iFade
  cabbageSet  SChnlSharp,SPosSharp
endin



instr NoteInL
  iNoteIn	notnum
  print iNoteIn
  iVelocIn  veloc
  iVelocTable tablei iVelocIn, 1
  iVelocity = iVelocTable*127
  midion 1, iNoteIn, iVelocity
  iPos = 460
  iActive1 active "NoteInL"
  iActive2 active "MIDI"
       ;;Pedal
       iPedal       cabbageGetValue "Pedal"
       iPedalOffIn  cabbageGetValue "PedOff"
       iPedalOnIn   cabbageGetValue "PedOn"
       iRndRng      cabbageGetValue "RndPdl"
       iPedalOff   random iPedalOffIn-iRndRng, iPedalOffIn+iRndRng
       iPedalOnInR random iPedalOnIn-iRndRng, iPedalOnIn+iRndRng
       iPedalOn = iPedalOff+iPedalOnInR
       if iActive1 == 1 && iPedal == 1 && iActive2 == 0 then
       schedule "Pedal" , iPedalOff, 0.5,   0
       schedule "Pedal" , iPedalOn , 7, 127
       endif
  index = iActive1-1
    iTrigDelay cabbageGetValue "SideLDelay"
    schedule "NoteTrigL",iTrigDelay, 1,iNoteIn,iVelocity,iTrigDelay
  iNoteUp,iFade BWKeys iNoteIn
  iX = 170
  iY = iNoteUp+iPos
  SChnl sprintf "NoteLo%d",index
  SPos sprintf "bounds(%d,%d,12,8),visible(%d)",iX,iY,1
  SChnlSharp sprintf "SharpLo%d",index
  SPosSharp sprintf "bounds(%d,%d,12,22),visible(%d)",iX-15,iY-7,iFade
  cabbageSet  SChnlSharp,SPosSharp
  cabbageSet  SChnl,SPos
  kRel release
 	if kRel == 1 && changed(kRel) == 1 then
 	schedulek "HideNotes", 0, 1,3,index
    turnoff2 "NotePlayL", 0,0
    turnoff2 "NoteShowL", 0,0
 	endif
endin


instr NoteTrigL
  iActiveSide active "NoteInL"
  iNoteIn = p4
  iVelocIn = p5
  iDur = p6
  ;iScaleArr[] fillarray  2, 2, 1, 2, 1, 2, 3, 2, 1, 2
  SscaleIn cabbageGet "txta"
  iScaleArr[] StrgArr SscaleIn
  iLenIn lenarray iScaleArr
  iLen = iLenIn-1
  iScale cabbageGetValue "Scale"
  iMinRngIn cabbageGetValue "MinRng"
  iMinRng = int((iMinRngIn*iLen)/10)
  iMaxRngIn cabbageGetValue "MaxRng"
  iMaxRng = int((iMaxRngIn*iLen)/10)
  iRng = iMaxRngIn-iMinRngIn
  iBasedxIn cabbageGetValue "MainNoteL"
  iBasedx = int((iBasedxIn*iLen)/10)
  iLenMinNote cabbageGetValue "MinNoteL"
  iLenMaxNote cabbageGetValue "MaxNoteL"
  iLenNotes = int(random:i(iLenMinNote,iLenMaxNote+1))
     if iActiveSide != 0 && iScale == 1 then
      indxNotes = 0
      iTrig     cabbageGetValue "SideLDelay"
      iRngDelay cabbageGetValue "RngDlyLRnd"
      iDelayRnd = iTrig
      while indxNotes < iLenNotes do
        indxSum = int(random:i( iMinRng, iMaxRng+1))
        iScaleSum SumArr iScaleArr,iBasedx, indxSum
        ;print indxSum,iScaleSum
        iNoteOut = iNoteIn+iScaleSum
          if iNoteIn <= 47 then
            until iNoteOut <= 47 do
            iNoteOut = (iNoteOut-12)
            enduntil
          elseif iNoteIn >= 74 then
            until iNoteOut >= 74 do
            iNoteOut = (iNoteOut+12)
            enduntil
          endif
      iVelocity random iVelocIn-10,iVelocIn+10
      schedule "NotePlayL",iTrig,iDur,iNoteOut
      schedule "NoteShowL",iTrig,5,iNoteOut
      iRndDelay random iDelayRnd-iRngDelay, iDelayRnd+iRngDelay
            if iRndDelay <= 0.1 then
            iRndDelay = 0.1
            endif
      iDur = iRndDelay
      iTrig += iRndDelay
      indxNotes += 1
      od
    endif
endin

instr NotePlayL
  iNoteIn = p4
  iVelocity = p5
  midion 1, iNoteIn, iVelocity
endin


instr NoteShowL
  iNoteIn = p4
 iActive active "NoteShowL"
  index = iActive
  iPos = 460
  iNoteUp,iFade BWKeys iNoteIn
  iX = (index*45)+160
  iY = iNoteUp+iPos
  SChnl sprintf "NoteLo%d",index
  SPos sprintf "bounds(%d,%d,12,8),visible(%d)",iX,iY,1
  cabbageSet  SChnl,SPos
  SChnlSharp sprintf "SharpLo%d",index
  SPosSharp sprintf "bounds(%d,%d,12,22),visible(%d)",iX-15,iY-7,iFade
  cabbageSet  SChnlSharp,SPosSharp
endin

instr HideNotes
 if p4 == 1 then
 index = p5
    SChnl sprintf "Note%d",index
    cabbageSet  SChnl,"visible(0)"
    SChnlSharp sprintf "Sharp%d",index
    cabbageSet  SChnlSharp,"visible(0)"
 elseif p4 == 2 then ;;High Side Notes
    indxHi = 0
    while indxHi < 5 do
    SChnlNoteHi sprintf "NoteHi%d",indxHi
    cabbageSet  SChnlNoteHi,"visible(0)"
    SChnlSharp sprintf "SharpHi%d",indxHi
    cabbageSet  SChnlSharp,"visible(0)"
    indxHi += 1
    od
  elseif p4 == 3 then ;;Bass Side Notes
    indxLo = 0
    while indxLo < 5 do
    SChnlNoteLo sprintf "NoteLo%d",indxLo
    cabbageSet  SChnlNoteLo,"visible(0)"
    SChnlSharpLo sprintf "SharpLo%d",indxLo
    cabbageSet  SChnlSharpLo,"visible(0)"
    indxLo += 1
    od
  endif
endin


instr Pedal
  iPedal = p4
  ;print iPedal
  iActive1 active "MIDI"
  iActive2 active "NoteInH"
  iActive3 active "NoteInL"
  ;print iActive2
  ;print iActive
  if iActive1 != 0 || iActive2 != 0 || iActive3 != 0 then
      if iPedal == 0 then
      cabbageSet 1,"PedalShow","colour(95, 96, 108, 255)"
      elseif iPedal == 127 then
      cabbageSet 1,"PedalShow","colour(151, 151, 217, 255)"
      endif
  outic 1, 64, iPedal, 0, 127 
  endif
endin

instr Widgets
giVelocTable	ftgen	1, 0,   127, -7, 0, 20, 0.33, 80, 0.55, 28, 0.85


kMinRng cabbageGet "MinRng"
kMaxRng cabbageGet "MaxRng"
kDx = kMaxRng-kMinRng
cabbageSetValue "MinShow", kMinRng,metro(10)
cabbageSetValue "MaxShow", kMaxRng,metro(10)
cabbageSetValue "RngShow",     kDx,metro(10)


kMinNoteH cabbageGet "MinNoteH"
kMaxNoteH cabbageGet "MaxNoteH"
cabbageSetValue "MinNoteShowH", kMinNoteH,metro(10)
cabbageSetValue "MaxNoteShowH", kMaxNoteH,metro(10)

kMinNoteL cabbageGet "MinNoteL"
kMaxNoteL cabbageGet "MaxNoteL"
cabbageSetValue "MinNoteShowL", kMinNoteL,metro(10)
cabbageSetValue "MaxNoteShowL", kMaxNoteL,metro(10)
endin

schedule "Widgets",0,999

</CsInstruments>
<CsScore>
;i "Middle" 0 1
</CsScore>
</CsoundSynthesizer>
