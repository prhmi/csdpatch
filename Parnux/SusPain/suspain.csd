<Cabbage>
form caption("Pedal") size(400, 150), pluginId("pdal")
image bounds(1, 3, 397, 147) file("pedal.jpg")
nslider bounds(12, 8, 35, 35) range(0, 10, 4, 1, 1) velocity(50) channel("off")
hslider bounds(55, 12, 185, 35) range(0.05, 2, 0.5, 1, 0.01)  channel("on") colour(188, 167, 182, 250) trackerColour(210, 100, 250, 255)
nslider bounds(12, 48, 35, 35) range(0, 10, 3, 1, 1)  channel("dly") velocity(50)
hslider bounds(53, 48, 187, 35) range(0.1, 1, 0.4, 1, 0.01)  channel("dur") colour(188, 167, 182, 250) trackerColour(210, 100, 250, 255)
gentable bounds(282, 39, 113, 81), tableNumber(1.0), , identChannel("table"), , ampRange(0.0, 1.0, 1.0, 0.0100) active(1) tableColour:0(226, 193, 231, 255)

image bounds(250, 18, 25, 25) channel("pdl") identChannel("pdl_i")
image bounds(362, 11, 20, 20) channel("pdlp") identChannel("pdlp_i")
image bounds(250, 50, 25, 25) channel("nte") identChannel("nte_i")
texteditor bounds(76, 90, 169, 24) colour(188, 167, 182, 250) colour:0(188, 167, 182, 250) text("2 2 1 2 1 2 3 2 1 2") channel("txta")
nslider bounds(246, 84, 32, 31) range(0, 10, 5, 1, 1) velocity(50) channel("mid") identChannel("mid_i")
label bounds(18, 127, 369, 14) channel("shw") identChannel("shw_i")
label bounds(12, 94, 51, 16) text("Scale:")
label bounds(286, 8, 69, 30) text("G") channel("ntsh") identChannel("ntsh_i") fontColour(197, 105, 194, 255)


;csoundoutput bounds(249, -50, 151, 200)
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

massign	1,1
massign	2,3

seed 63

giNoteArr  [] init 5
giScaleArr [] init 5
giVelocTable ftgen 1, 0,    127, -7,  1

schedule "widget",0,-1

opcode StrgArr,i[],S
Stype xin
iLen       strlen     Stype 
iTypeArr [] init iLen
indx = 0
while indx < iLen do
ichr       strchar    Stype, indx
iTypeArr [indx]  = ichr
indx += 1
od
 iLenW = 0
 iLenR = 0
while iLenR < iLen do
 if iTypeArr[iLenR] != 32 then
  iLenW += 1
 endif
iLenR += 1
od
iNumArr [] init iLenW
iRead = 0
iWrite = 0
while iRead < iLen do
 if iTypeArr[iRead] != 32 then
 iNumArr [iWrite] = iTypeArr[iRead]-48
 iWrite += 1
 endif
iRead += 1
od
xout iNumArr
endop

opcode SclArr, i[],i[]i
iArrIn [],iMidPoint xin
iLen lenarray iArrIn
iArrScal [] init iLen
iMiddle = iMidPoint
indxDn = iMiddle
indxUp = iMiddle
indx = 0
iScaleUp = 0
iScaleDwn = 0
while indx <= iLen do
	if indx <= iMiddle then
		iScaleDwn = iScaleDwn + iArrIn[indxDn]
		iArrScal [indxDn] = iScaleDwn*(-1)
		indxDn -= 1
	elseif indx > iMiddle then
		iScaleUp = iScaleUp + iArrIn[indxUp]
		iArrScal [indxUp] = iScaleUp
		indxUp += 1
	endif
indx += 1
od

xout iArrScal
endop


opcode ArrToStrg, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf " % d ",iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop


instr midi
  iActive active 1
  ;print iActive
  iNote		notnum
  
  iCurve chnget "crv"
  print iCurve
  iVeloc veloc

  ires tablei iVeloc, 1
  iVelocity = ires*127

  midion 1, iNote, iVelocity
  puts "channel 1",1
  iOff chnget "off"
  iOff = ((iOff/10)*0.8)+0.2
  iOn  chnget "on"
  iOffP random 0.2, iOff
  iOnP  = random:i( 0.3, iOn) + iOffP
  iPedal  ctrl7    1,63,0,1
  ;prints "%.2f ,%.2f, %.2f\n", iOffP,iOnP,iActive
  if iActive == 1 && iPedal == 1 then
    schedule "pedal" , iOffP, 0.5,   0
    schedule "pedal" , iOnP , 0.5, 127
  endif
endin

instr pedal
  iActive1 active 1
  iActive2 active 2
  iActive3 active 3
  ;print iActive2

  ;print iActive
  if iActive1 != 0 || iActive3 != 0 then
      if p4 == 0 then
        puts "pedal off",1
        chnset "colour(188, 167, 200, 250)", "pdlp_i"
      elseif p4 == 127 then
        puts "pedal on",1
        chnset "colour(170, 100, 200, 250)", "pdlp_i"
      endif
  outic 1, 64, p4, 0, 127 
  endif
endin



instr NoteIn
  puts "channel 2",1
  iActive1 active 1
  iActive3 active 3
  if iActive3 >= 4 then
  ;turnoff2 "NoteIn", 0, 0
  endif
  ;print iActive
  iNote		notnum
  iVeloc veloc
  ires tablei iVeloc, 1
  iVelocity = ires*127
  ;print iVelocity
  schedule "NoteShw",0,0.2,iNote
  ;;pedal
  iOff chnget "off"
  iOff = ((iOff/10)*0.8)+0.2
  iOn  chnget "on"
  iOffP random 0.2, iOff
  iOnP  = random:i( 0.3, iOn) + iOffP
  iNoteP   ctrl7    2,47,0,1
  if iActive3 == 1 && iNoteP == 1 && iActive1 == 0 then
    schedule "pedal" , iOffP , .5,   0
    schedule "pedal" , iOnP  , .5, 127
  endif
  ;;NoteBass
  iLen lenarray giScaleArr
  iNoteIndx =  int(random:i(0,iLen))
  iNoteOut = iNote + giScaleArr[iNoteIndx]
  schedule "sclw",0,.1,iNoteIndx

  ;iVelocity    random 40,50
  midion 1, iNote, iVelocity
  Sprint     sprintf "Note In %d",iActive3
  ;puts Sprint,1

    ;print iNoteP
    iStec    chnget "off"
    iDelayIn chnget "dly"
    iDelayIn = ((iDelayIn/10)*1.9)+0.1
    iDelay1  random iStec, iDelayIn
    ;print iActive3
    if iActive3 < 3 && iNoteP == 1 then
    schedule "NoteTriger", iDelay1, 0.1 ,iNoteOut,iVelocity,iNoteIndx
    endif
endin


instr NoteTriger
  iActive3 active 3
  iActive4 active 4
  ;print iActive4
  iNote = p4
  iNoteSend = iNote
  iDurIn   chnget "dur"
  iMidIn   chnget "mid"
  iDelayIn chnget "dly"
  iDelayIn = ((iDelayIn/10)*1.9)+0.1
  iStrt    chnget "off"
  iStrt = ((iStrt/10)*0.8)+0.08
  ;print iStrt
  iDur   random iStrt,iDurIn
  iDelay =   0
  iVelocity = p5
  iNoteIndx = p6
  iLen lenarray giScaleArr
   
  
  if iActive3 == 0 && iActive4 = 1 then
    iOctav    = 1
    iNumber   = 3
  elseif iActive3 == 0 && iActive4 = 2 then
    iOctav    = 1
    iNumber   = 2
  elseif iActive3 == 1 && iActive4 = 1 then
    iOctav    = 0
    iNumber   = int(random:i(2, 5))
  elseif iActive3 == 2 && iActive4 = 1 then
    iOctav    = 0
    iNumber   = int(random:i(1, 4))
   else
   iNumber = 0
  endif
  
  iTrig = (iActive3 < 3) ? 1 : 0
;print iTrig
    indx = 0
    ic = 0

    if iTrig == 1 then
    while indx < iNumber do
      schedule "NotePlayer" , iDelay, iDur,iNoteSend + (12*ic),iVelocity,indx
      if iActive3 == 0 then
        iRndIndx = int(random:i(0,iLen))
        iNoteSend = iNote+ giScaleArr[iRndIndx]
        iDelPlus  = random:i(0.01,0.03)
        iVelocity = random:i(10,30)
          ;print iVelocity
      else
        iRndIndx = int(random:i(iNoteIndx-1,iNoteIndx+1))
            if iRndIndx < 1 then
            iRndIndx = 1
            elseif iRndIndx > (iLen-1) then
            iRndIndx = iLen-1
            endif
        iNoteSend = iNote+ giScaleArr[iRndIndx]
        iDelPlus  = random:i(iStrt,iDelayIn)
        iVelocity = random:i(-10,10) + p5
      endif
      iDelay    += iDelPlus 
      iDur   random iStrt,iDurIn
      ;print iDur
    iNoteIndx = int(random:i(0,iLen))
    ic = int(random:i(0,(iOctav*2)+1));-iOctav
    ;print ic
    indx += 1
        ;print indx
    od
  endif
endin


instr NotePlayer
;print p3
  iActive active 5

  if iActive >= 4 then
  ;turnoff2 "NotePlayer", 0, 0
  endif
    ;print iActive
  iNote = p4
  schedule "NoteShw",0,0.2,iNote
  iVelocity = p5 
  iNumberNote = p6
  Sprint     sprintf "%.f %.f %.f",iNumberNote,iNote,iVelocity
  ;puts Sprint,1
midion 1, iNote, iVelocity
endin




instr scl
  Sin chnget "txta"
  iMidIn chnget "mid"
  giNoteArr  [] StrgArr Sin
  iLen lenarray giNoteArr
  iMiddle = iMidIn/10
  iMidPoint = int(iMiddle*iLen)-1
  ;print iMidPoint
  giScaleArr [] SclArr giNoteArr, iMidPoint
  printarray giScaleArr, "%.f"
  Sout ArrToStrg giScaleArr
  Sscale     sprintf "text(scale: %s)",Sout
  ;puts Sscale,1
  Sprint init ""
  Sprint strcat Sprint, Sscale
  chnset Sprint, "shw_i"
endin

instr sclw
  iMidPoint = p4
  giScaleArr [] SclArr giNoteArr, iMidPoint
  ;printarray giScaleArr, "%.f"
  Sout ArrToStrg giScaleArr
  Sscale     sprintf "text(scale: %s)",Sout
  ;puts Sscale,1
  Sprint init ""
  Sprint strcat Sprint, Sscale
  chnset Sprint, "shw_i"
endin

instr NoteShw

iNum = p4
SNote mton iNum
Sprint     sprintf "text(%s)",SNote
chnset Sprint, "ntsh_i"

endin

instr widget
	giVelocTable	ftgen	1, 0,   127, -7, 0, 60, 0.53, 30, 0.75,37, 0.85
  ;schedule "scl",0,0.1
  Sin chnget "txta"
  kMidIn chnget "mid"
  if changed(Sin) == 1 || changed(kMidIn) == 1 then
    schedulek "scl",0,0.1
  endif
  kPedal  ctrl7    1,63,0,1
  kNoteP   ctrl7    2,47,0,1
  ;printk2 kPedal
  if kPedal == 1 then
    chnset "colour(210, 100, 250)", "pdl_i"
  elseif kPedal == 0 then
    chnset "colour(100, 100, 110, 255)", "pdl_i"
  endif
  ;kNoteP = 0
  if kNoteP == 1 then
    chnset "colour(210, 100, 250)", "nte_i"
  elseif kNoteP == 0 then
    chnset "colour(100, 100, 110, 255)", "nte_i"
  endif
  
endin

</CsInstruments>
<CsScore>
;i "widget" 0 [9^9]
</CsScore>
</CsoundSynthesizer>
