; ---------------------------------------------------------------
; MIDI learn state (shared by all sliders)
; ---------------------------------------------------------------
giMLCount init 0    ; counter used to give every slider its own index
gkLearn   init 0    ; index of the selected slider (0 = none)
gkClr     init 0    ; 1 for one k-cycle when Clear is pressed
gkReset   init 0    ; 1 for one k-cycle when Reset all is pressed
gkMLst    init 0    ; last MIDI message (status, data1, data2)
gkMLd1    init 0
gkMLd2    init 0

; per-slider MIDI learn (called automatically from inside every slider UDO)
opcode midiLearn, 0, S
  SChan xin

  ; unique index per slider, assigned automatically at init time
  giMLCount = giMLCount + 1
  iIndex = giMLCount

  ; MIDI message of this k-cycle (written once by midiLearnMaster)
  kst = gkMLst
  kd1 = gkMLd1
  kd2 = gkMLd2

  iB[]     cabbageGet SChan, "bounds"
  iRange[] cabbageGet SChan, "range"
  iMin  = iRange[0]
  iMax  = iRange[1]
  iSkew = (iRange[3] == 0 ? 1 : iRange[3])
  iInc  = iRange[4]

  SOv  sprintf "%s_pick", SChan     ; transparent click-catcher over the slider
  SLbl sprintf "%s_ccl", SChan      ; CC text shown in learn mode
  SCC  sprintf "%s_cc", SChan       ; hidden store widget (saved by the DAW)

  ; both start hidden; they are only shown while learn mode is on
  cabbageCreate "button", sprintf({{bounds(%d, %d, %d, %d), channel("%s"), text("", ""), latched(1), visible(0), colour:0(229, 106, 106, 40), colour:1(229, 106, 106, 130), corners(2)}}, iB[0], iB[1], iB[2], iB[3], SOv)
  iLW = 44
  iLX = int(iB[0] + iB[2] * 0.5 - iLW * 0.5)
  iLY = int(iB[1] + iB[3] * 0.5 - 7)
  cabbageCreate "label", sprintf({{bounds(%d, %d, %d, 14), channel("%s"), text(""), visible(0), fontColour(255, 255, 255), fontSize(11), align("centre"), mouseInteraction(0)}}, iLX, iLY, iLW, SLbl)

  kInit init 1
  kGo = 1                    ; explicit trigger: always send when the line runs
  kMode cabbageGet "mlearn"
  kBtn  cabbageGet SOv
  kCC   cabbageGet SCC
  kBC   changed kBtn
  kMC   changed kMode

  ; show / hide the overlay and label together with learn mode
  cabbageSet kMC + kInit, SOv,  "visible", kMode
  cabbageSet kMC + kInit, SLbl, "visible", kMode

  if kMode == 0 then
    ; learn mode off: deselect everything
    if kBtn == 1 then
      cabbageSetValue SOv, 0, kGo
    endif
    if gkLearn == iIndex then
      gkLearn = 0
    endif
  else
    ; click on a slider selects it (click again to deselect)
    if kBC == 1 then
      if kBtn == 1 then
        gkLearn = iIndex
      elseif gkLearn == iIndex then
        gkLearn = 0
      endif
    endif
    ; another slider was picked: release this one
    if kBtn == 1 && gkLearn != iIndex then
      cabbageSetValue SOv, 0, kGo
    endif
    ; Clear pressed while this slider is selected
    if gkClr == 1 && gkLearn == iIndex then
      cabbageSetValue SCC, -1, kGo
    endif
  endif

  ; Reset all: remove every mapping and deselect.
  ; Set iResetValues = 1 to also put each slider back to its default value.
  iResetValues = 0
  if gkReset == 1 then
    cabbageSetValue SCC, -1, kGo
    if kBtn == 1 then
      cabbageSetValue SOv, 0, kGo
    endif
    gkLearn = 0
    if iResetValues == 1 then
      cabbageSetValue SChan, iRange[2], kGo
    endif
  endif

  ; incoming MIDI control change (any MIDI channel)
  if kst == 176 then
    if kMode == 1 && gkLearn == iIndex then
      cabbageSetValue SCC, kd1, kGo     ; store the CC number
      cabbageSetValue SOv, 0, kGo       ; deselect, ready for the next slider
      gkLearn = 0
    elseif kMode == 0 && kd1 == kCC then
      ; CC position 0-1 -> slider value, respecting range, skew and increment
      kP   = kd2 / 127
      kVal = iMin + (iMax - iMin) * pow(kP, 1 / iSkew)
      if iInc > 0 then
        kVal = iMin + round((kVal - iMin) / iInc) * iInc
      endif
      cabbageSetValue SChan, kVal, kGo
    endif
  endif

  ; label text: "-" = unmapped, "listen" = selected, "CC n" = mapped
  kState = (gkLearn == iIndex ? -2 : kCC)
  kT changed kState
  SShow init ""
  if kState == -2 then
    SShow strcpyk "listen"
  elseif kState < 0 then
    SShow strcpyk "-"
  else
    SShow sprintfk "CC %d", kState
  endif
  cabbageSet kT + kInit, SLbl, "text", SShow
  kInit = 0
endop


; ---------------------------------------------------------------
; midiLearnMaster : call ONCE in the instrument, BEFORE the sliders.
; Reads MIDI (midiin may only be read in one place), handles the
; global buttons "mlearn", "mclear", "mreset".
; ---------------------------------------------------------------
opcode midiLearnMaster, 0, 0
  kInit init 1
  kst, kch, kd1, kd2 midiin
  gkMLst = kst
  gkMLd1 = kd1
  gkMLd2 = kd2

  ; a project saved while learn mode was on must not reopen in learn mode
  if timeinstk() == 1 then
    kGo = 1
    cabbageSetValue "mlearn", 0, kGo
  endif

  kMode cabbageGet "mlearn"
  kMC   changed kMode
  cabbageSet kMC + kInit, "mclear", "visible", kMode
  cabbageSet kMC + kInit, "mreset", "visible", kMode

  kClrBtn cabbageGet "mclear"
  kClrCh  changed kClrBtn
  gkClr = (kClrCh == 1 && kClrBtn == 1 ? 1 : 0)

  kRstBtn cabbageGet "mreset"
  kRstCh  changed kRstBtn
  gkReset = (kRstCh == 1 && kRstBtn == 1 ? 1 : 0)
  kInit = 0
endop



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
iArrOut[] init iLenCount

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
	iArrOut[iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop


opcode createOverlay, S, S
    SChan xin
    iB[] cabbageGet SChan, "bounds"
    SImg sprintf "%s_svg", SChan
    cabbageCreate "image", sprintf({{bounds(%d, %d, %d, %d), colour(0, 0, 0, 0), mouseInteraction(0), channel("%s")}}, iB[0], iB[1], iB[2], iB[3], SImg)
    xout SImg
endop


opcode createValueLabel, 0, SSiiiii
    SLbl, SAlign, iX, iY, iW, iH, iSize xin
    cabbageCreate "label", sprintf({{bounds(%d, %d, %d, %d), channel("%s"), text(""), fontColour(210, 210, 210), fontSize(%d), align("%s"), mouseInteraction(0)}}, iX, iY, iW, iH, SLbl, iSize, SAlign)
endop

opcode createNameLabel, 0, SSSiiiii
    SLbl, SText, SAlign, iX, iY, iW, iH, iSize xin
    cabbageCreate "label", sprintf({{bounds(%d, %d, %d, %d), channel("%s"), text("%s"), fontColour(190, 190, 190), fontSize(%d), align("%s"), mouseInteraction(0)}}, iX, iY, iW, iH, SLbl, SText, iSize, SAlign)
endop


opcode valFmt, S, i
    iNum xin
    iClean = round(iNum * 1000000000) / 1000000000
    iPlaces = 0
    iTest   = iClean
    while iPlaces < 9 do
        if abs(iTest - round(iTest)) < 1e-6 then
            goto found
        endif
        iTest   = iTest * 10
        iPlaces = iPlaces + 1
    od
    found:
    Sres sprintf "%%.%df", iPlaces
    xout Sres
endop

opcode rSlider, k, SSSii
    SChan, SName, Scolor, iShow, iWidth xin
    iBounds[] cabbageGet SChan, "bounds"
    iRange[]  cabbageGet SChan, "range"
    iColorArr[] StrToArr Scolor
    iR = iColorArr[0]
    iG = iColorArr[1]
    iB = iColorArr[2]
    SImg createOverlay SChan
    SLbl sprintf "%s_val", SChan
    iRadL = ((iBounds[2] < iBounds[3] ? iBounds[2] : iBounds[3]) * 0.5) - 8
    iNameOn = 0
    if strlen(SName) > 0 then
        iNameOn = 1
    endif
    iValShift = 0
    if iNameOn == 1 then
        iValShift = 0
    endif
    if iShow == 1 then
        createValueLabel SLbl, "centre", iBounds[0], iBounds[1] - iValShift, iBounds[2], iBounds[3], 19
    endif
    if iNameOn == 1 then
        SNameLbl sprintf "%s_name", SChan
        iNameSize strlen SName
        iUp = 1
        if iNameSize*10 < iBounds[3] then
        iUp = ((iNameSize)^0.2)-0.6
        endif
        iNW = iRadL * 3
        iNX = iBounds[0] + iBounds[2] * 0.5 - iNW * 0.5
        iNY = iBounds[1] + iBounds[3] * 0.5 + iRadL * iUp
        createNameLabel SNameLbl, SName, "centre", iNX, iNY, iNW, 14, 15
    endif
    SFmt valFmt iRange[4]
    kVal, kTrig cabbageGetValue SChan
    kInit init 1

    iW = iBounds[2]
    iH = iBounds[3]
    iCx = iW * 0.5
    iCy = iH * 0.5 
    iBig = iBounds[3]/10
    iRad = ((iW < iH ? iW : iH) * 0.5) - iBig
    iStart = 0.75 * $M_PI
    iSweep = 1.5 * $M_PI
    iX0 = iCx + iRad * cos(iStart)
    iY0 = iCy + iRad * sin(iStart)
    iX1 = iCx + iRad * cos(iStart + iSweep)
    iY1 = iCy + iRad * sin(iStart + iSweep)
    SAccent sprintf "rgb(%d, %d, %d)", iR, iG, iB
    kProp limit (kVal - iRange[0]) / (iRange[1] - iRange[0]), 0, 1
    kN = pow(kProp, iRange[3])
    kAngle = iStart + (iSweep * kN)
    kX = iCx + iRad * cos(kAngle)
    kY = iCy + iRad * sin(kAngle)
    ;iWidth = 6
    kLarge = (kN > 0.6667 ? 1 : 0)
    kWidth = (kN > 0.002 ? iWidth : 0)
    cabbageSet kTrig + kInit, SImg, "svgElement", sprintfk({{
        <path d="M %f %f A %f %f 0 1 1 %f %f" fill="none" stroke="rgb(44, 44, 54)" stroke-width="%d" stroke-linecap="bevel"/>
        <path d="M %f %f A %f %f 0 %d 1 %f %f" fill="none" stroke="%s" stroke-width="%d"  stroke-linecap="bevel" stroke-linejoin= "bevel"  />
    }}, iX0, iY0, iRad, iRad, iX1, iY1,iWidth+1, iX0, iY0, iRad, iRad, kLarge, kX, kY,SAccent, kWidth)
    cabbageSet (kTrig + kInit) * iShow, SLbl, "text", sprintfk(SFmt, kVal)
    kInit = 0
    midiLearn SChan
    xout kVal
endop


opcode vSlider, k, SSSi
    SChan,SName, Scolor, iShow xin
    iBounds[] cabbageGet SChan, "bounds"
    iRange[]  cabbageGet SChan, "range"
    iColorArr[] StrToArr Scolor
    iR = iColorArr[0]
    iG = iColorArr[1]
    iB = iColorArr[2]
    SImg createOverlay SChan
    SLbl sprintf "%s_val", SChan
    if iShow == 1 then
            iLW = (iBounds[2] > 56 ? iBounds[2] : 56)
            iLX = iBounds[0] + (iBounds[2] - iLW) * 0.5
            createValueLabel SLbl, "centre", iLX, iBounds[1] + iBounds[3], iLW, 18, 17
    endif
    if strlen(SName) > 0 then
        SNameLbl sprintf "%s_name", SChan
            iNW = (iBounds[2] > 80 ? iBounds[2] : 80)
            iNX = iBounds[0] + (iBounds[2] - iNW) * 0.5
            createNameLabel SNameLbl, SName, "centre", iNX, iBounds[1] - 18, iNW, 16, 17
    endif
    SFmt valFmt iRange[4]
    kVal, kTrig cabbageGetValue SChan
    kInit init 1
    iW = iBounds[2]
    iH = iBounds[3]
    iPad = 5
        iSx = iW * 0.5
        iSy = iH - iPad
        iEx = iW * 0.5
        iEy = iPad

    SAccent sprintf "rgb(%d, %d, %d)", iR, iG, iB

    kProp limit (kVal - iRange[0]) / (iRange[1] - iRange[0]), 0, 1
    kN = pow(kProp, iRange[3])
iWidth = iBounds[2]/3
    kTx = iSx + kN * (iEx - iSx)
    kTy = iSy + kN * (iEy - iSy)
    kWidth = (kN > 0.002 ? iWidth : 0)

    cabbageSet kTrig + kInit, SImg, "svgElement", sprintfk({{
        <line x1="%f" y1="%f" x2="%f" y2="%f" stroke="rgb(44, 44, 54)" stroke-width="%f" stroke-linecap="bevel"/>
        <line x1="%f" y1="%f" x2="%f" y2="%f" stroke="%s" stroke-width="%d" stroke-linecap="bevel"/>
    }}, iSx, iSy, iEx, iEy,iWidth, iSx, iSy, kTx, kTy, SAccent, kWidth)
    cabbageSet (kTrig + kInit) * iShow, SLbl, "text", sprintfk(SFmt, kVal)
    kInit = 0
    midiLearn SChan
    xout kVal
endop

opcode hSlider, k, SSSii
    SChan, SName, Scolor, iShow,iMod xin
    iBounds[] cabbageGet SChan, "bounds"
    iRange[]  cabbageGet SChan, "range"
    SImg createOverlay SChan
    SLbl sprintf "%s_val", SChan
    iColorArr[] StrToArr Scolor
    iR = iColorArr[0]
    iG = iColorArr[1]
    iB = iColorArr[2]
    if iShow == 1 then
            if iMod == 1 then
            createValueLabel SLbl, "right", iBounds[0], iBounds[1]+17, iBounds[2], iBounds[3], 17
            elseif iMod == 0 then
            createValueLabel SLbl, "right", iBounds[0], iBounds[1], iBounds[2]+35, iBounds[3], 17
            endif
     endif
     SNameLbl sprintf "%s_name", SChan
            if iMod == 1 then
            createNameLabel SNameLbl, SName, "left", iBounds[0]+5, iBounds[1]+17, iBounds[2], 16, 17
            elseif iMod == 0 then
            createNameLabel SNameLbl, SName, "right", iBounds[0]-iBounds[2], iBounds[1], iBounds[2], iBounds[3], 17
            endif
    SFmt valFmt iRange[4]
    kVal, kTrig cabbageGetValue SChan
    kInit init 1
    iW = iBounds[2]
    iH = iBounds[3]
    iPad = 5
        iSx = iPad
        iSy = iH * 0.5
        iEx = iW - iPad
        iEy = iH * 0.5
    SAccent sprintf "rgb(%d, %d, %d)", iR, iG, iB
    kProp limit (kVal - iRange[0]) / (iRange[1] - iRange[0]), 0, 1
    kN = pow(kProp, iRange[3])
    kTx = iSx + kN * (iEx - iSx)
    kTy = iSy + kN * (iEy - iSy)
    iWidth = iBounds[3]/2
    kWidth = (kN > 0.002 ? iWidth : 0)
puts SImg,1 
    cabbageSet kTrig + kInit, SImg, "svgElement", sprintfk({{
        <line x1="%f" y1="%f" x2="%f" y2="%f" stroke="rgb(44, 44, 54)" stroke-width="%d" stroke-linecap="bevel"/>
        <line x1="%f" y1="%f" x2="%f" y2="%f" stroke="%s" stroke-width="%d" stroke-linecap="bevel"/>
    }}, iSx, iSy, iEx, iEy,iWidth, iSx, iSy, kTx, kTy, SAccent, kWidth)
    cabbageSet (kTrig + kInit) * iShow, SLbl, "text", sprintfk(SFmt, kVal)
    kInit = 0
    midiLearn SChan
    xout kVal
endop

opcode hnSlider, k, SSSi
    SChan,SName, Scolor,iPos xin
    iNameW = 100
    iBounds[] cabbageGet SChan, "bounds"
    iRange[]  cabbageGet SChan, "range"
    SImg createOverlay SChan
    SLbl sprintf "%s_val", SChan
    iColorArr[] StrToArr Scolor
    iR = iColorArr[0]
    iG = iColorArr[1]
    iB = iColorArr[2]
         createValueLabel SLbl, "centre", iBounds[0], iBounds[1], iBounds[2], iBounds[3], 17
    SFmt valFmt iRange[4]
    kVal, kTrig cabbageGetValue SChan
    kInit init 1

    iW = iBounds[2]
    iH = iBounds[3]
    iRad = iH * 0.05

    SAccent sprintf "rgb(%d, %d, %d)", iR, iG, iB

    kProp limit (kVal - iRange[0]) / (iRange[1] - iRange[0]), 0, 1
    kN = pow(kProp, iRange[3])
    kFill = kN * (iW - 2)

    cabbageSet kTrig + kInit, SImg, "svgElement", sprintfk({{
        <rect x="0.5" y="0.5" width="%f" height="%f" rx="%f" fill="rgb(35, 35, 38)"/>
        <rect x="1" y="1" width="%f" height="%f" rx="%f" fill="%s" fill-opacity="0.25"/>
    }}, iW - 1, iH - 1, iRad, kFill, iH - 2, iRad - 1, SAccent)

    cabbageSet kTrig + kInit, SLbl, "text", sprintfk(SFmt, kVal)
    SLbl2 sprintf "%s_name", SChan
    if iPos == 1 then
        iNW = (iBounds[2] > 100 ? iBounds[2] : 100)
        iNX = iBounds[0] + (iBounds[2] - iNW) * 0.5
        createNameLabel SLbl2, SName, "centre", iNX, iBounds[1] - 18, iNW, 10, 17
    else
        createNameLabel SLbl2, SName, "right", iBounds[0] - iNameW - 8, iBounds[1], iNameW, iBounds[3], 17
    endif
    kInit = 0
    midiLearn SChan
    xout kVal
endop

opcode nSlider, k, SSi
    SChan, SName, iPos xin
    iNameW = 100
    iB[] cabbageGet SChan, "bounds"
    kOut cabbageGet SChan
    SLbl sprintf "%s_name", SChan
    if iPos == 1 then
        iNW = (iB[2] > 100 ? iB[2] : 100)
        iNX = iB[0] + (iB[2] - iNW) * 0.5
        createNameLabel SLbl, SName, "centre", iNX, iB[1] - 18, iNW, 10, 17
    else
        createNameLabel SLbl, SName, "right", iB[0] - iNameW - 8, iB[1], iNameW, iB[3], 20
    endif
    midiLearn SChan
    xout kOut
endop