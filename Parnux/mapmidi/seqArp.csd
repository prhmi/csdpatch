<Cabbage>
form caption("seq-arp") size(320, 385), guiMode("queue"), pluginId("mmap") colour(20,20,30)
button bounds(16, 20, 74, 31) channel("start") text("start", "stop") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
nslider bounds(32, 98, 50, 40) channel("bpm") range(30, 140, 83, 1, 1) text("BPM") colour(48, 66, 77, 255)
nslider bounds(84, 98, 50, 40) channel("dur") range(0.3, 3, 0.7, 1, 0.1) text("dur") colour(48, 66, 77, 255)
nslider bounds(138, 106, 36, 31) channel("len1") range(3, 16, 8, 1, 1) text("ch-1") colour(48, 66, 77, 255)
nslider bounds(182, 106, 36, 31) channel("len2") range(3, 16, 13, 1, 1) text("ch-2") colour(48, 66, 77, 255)
nslider bounds(32, 148, 50, 40) channel("notemin") range(20, 100, 60, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(84, 148, 50, 40) channel("notemax") range(20, 100, 72, 1, 1) text("max") colour(48, 66, 77, 255)
nslider bounds(140, 148, 50, 40) channel("notelen") range(2, 8, 4, 1, 1) text("len") colour(48, 66, 77, 255)
combobox bounds(166, 54, 46, 26) channel("basenote") colour(50, 64, 82, 255) text( "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "Bb", "B") value(1)
combobox bounds(220, 54, 81, 26) channel("scale") colour(50, 64, 82, 255) text("scale", "minor", "major", "prst1", "prst2") value(2)
combobox bounds(220, 86, 81, 26) channel("rndoct") colour(50, 64, 82, 255) text("oct off", "-1:0", " -0:1", " -1:1") value(1)
combobox bounds(234, 118, 66, 26) channel("seqmod") colour(50, 64, 82, 255) text("poly", "mono") value(1)
nslider bounds(16, 56, 42, 29) channel("chn1") range(1, 16, 1, 1, 1) text("chn-1") colour(48, 66, 77, 255)
nslider bounds(62, 56, 42, 29) channel("chn2") range(1, 16, 2, 1, 1) text("chn-2") colour(48, 66, 77, 255)
button bounds(20, 300, 40, 31) channel("ii") text("ii", "ii") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(68, 300, 40, 31) channel("iii") text("iii", "iii") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(114, 300, 40, 31) channel("iv") text("iv", "iv") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(160, 300, 40, 31) channel("v") text("v", "v") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(206, 300, 40, 31) channel("vi") text("vi", "vi") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(254, 300, 40, 31) channel("vii") text("vii", "vii") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
button bounds(198, 162, 40, 31) channel("gennote") text("gen", "gen") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)

texteditor bounds(16, 204, 283, 27) channel("seqarr") fontSize(27) text("1") colour(50, 60, 80) fontColour(200,200,200)
checkbox bounds(278, 26, 20, 20) channel("b1") colour:0(79, 79, 74, 255) colour:1(255, 245, 0, 255)
checkbox bounds(252, 26, 20, 20) channel("b2") colour:0(79, 79, 74, 255) colour:1(255, 245, 0, 255)
label bounds(254, 164, 41, 22)  channel("funcshow")  text("-") fontColour(209, 245, 52, 255)
label bounds(168, 120, 21, 16) channel("label10027") text(":")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
;-dm0 -n -+rtmidi=NULL -Q0
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 0
0dbfs = 0

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




opcode noteScale, iS,ii
 iNoteMin,iNoteMax xin
 iScale       cabbageGetValue "scale"
 iBaseNoteIn  cabbageGetValue "basenote"
 iBaseNote = iBaseNoteIn-1
 start:
 iNoteRnd = int(random:i( iNoteMin, iNoteMax))
 iNote = iNoteRnd
 iOctav = 0
	     until iNote < iBaseNote+12 do
	     iOctav += 1
  		iNote -= 12
  		enduntil
 iMinor[]          fillarray 0, 2, 3, 5, 7, 8, 10, 12
 iMajor[]          fillarray 0, 2, 4, 5, 7, 9, 11, 12
 iMySc1[]          fillarray 0, 1, 3, 5, 6, 8, 10, 12
 iMySc2[]          fillarray 0, 1, 3, 4, 6, 8, 9, 11, 12
 if     iScale == 1 goto skip
 ;iNoteOut = iNoteRnd
 if iScale == 2 then
 iScaleArr[] = iMinor
 elseif iScale == 3  then
 iScaleArr[] = iMajor
 elseif iScale == 4  then
 iScaleArr[] = iMySc1
 elseif iScale == 5  then
 iScaleArr[] = iMySc2
 endif
 indx = 0
 iCheck = 0
 while indx < lenarray(iScaleArr) do
 if iNote == iScaleArr[indx]+iBaseNote then
 iCheck = 1
 endif
 indx += 1
 od
 ;print iCheck
    if iCheck == 0 goto start
 SnoteOut MtoNameInt iNoteRnd
 skip:
 iNoteOut = iNote+(12*iOctav) 	
;   iCheckRep = 0
;   while iCheckRep < lenarray(giNoteArr) do
;   if iNoteOut = giNoteArr[iCheckRep] goto start
;   iCheckRep += 1
;   od
 xout iNoteOut,SnoteOut
endop 



opcode FuncPrg, i[],ii
iFunc,iLen xin
 iScale       cabbageGetValue "scale"
 iBaseNoteIn  cabbageGetValue "basenote"
 iMin cabbageGetValue "notemin"
 iNoteBase = iBaseNoteIn-1 
    until iNoteBase > iMin do
    iNoteBase += 12
    enduntil
 iNorm[]    genarray 0, 12
 iMinor[]   fillarray 0, 2, 3, 5, 7, 8, 10, 12
 iMajor[]   fillarray 0, 2, 4, 5, 7, 9, 11, 12
 iMySc1[]   fillarray 0, 1, 3, 5, 6, 8, 10, 12
 iMySc2[]   fillarray 0, 1, 3, 4, 6, 8, 9, 11, 12
 if     iScale == 1 then
 iScaleArr[] = iNorm
 elseif iScale == 2 then
 iScaleArr[] = iMinor
 elseif iScale == 3  then
 iScaleArr[] = iMajor
 elseif iScale == 4  then
 iScaleArr[] = iMySc1
 elseif iScale == 5  then
 iScaleArr[] = iMySc2
 endif

iOutArr[] init iLen
SOutArr[] init iLen
 indx = 0
 iRead = iFunc-1
 while indx < iLen do
 iNote = iNoteBase+iScaleArr[iRead]
  iOutArr[indx] = iNote
 Snote mton iNote
 ;puts Snote, 1
 SOutArr[indx] = Snote
 indx += 1
 iRead = (iRead+2) % (lenarray(iScaleArr)-1)
 od
xout iOutArr
endop



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

opcode StrToArr, i[],S
SIn xin
Snote     sprintf "%s ",SIn
iLenStr strlen SIn
iReadChar = 0
iCountChr = 0
while iReadChar < iLenStr do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	if strchar(Snote,iReadChar) == 32 then
	iCountChr += 1
	endif
	od	
iReadChar += 1
od
iArrOut[] init iCountChr
iWrite = 0
iRead = 0
while iRead < iLenStr do
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


opcode ArrToStrgN, S,i[]
  iArrIn[] xin
  
  iArrIn RmvZ iArrIn
  
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    SNote MtoNameInt iArrIn[indx]
    Sscale     sprintf " %s ", SNote
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop

opcode ArrPermRnd, i[], i[]i
iInArr[], iLen xin
iN =  iLen
iOutArr[] init iN
iIndx = 0
 until iIndx == iN do
iRndIndx random 0, iLen-.0001
iRndIndx = int(iRndIndx)
iOutArr[iIndx] = iInArr[iRndIndx]
  until iRndIndx == iLen-1 do
iInArr[iRndIndx] = iInArr[iRndIndx+1]
iRndIndx += 1
  enduntil
iLen -= 1
iIndx += 1
 enduntil
xout iOutArr
endop


giNoteArr[] init 8
giEmptArr[] init 8
gkLenNote init 1

instr seqMachine1
kLen1 cabbageGet "len1"
kLen2 cabbageGet "len2"
kB1   cabbageGet "b1"
kB2   cabbageGet "b2"
SIn   cabbageGet "seqarr" 
 update:
iSeqArr[] StrToArr SIn
kSeqIndx1 init 0
kSeqIndx2 init 0
iLenSeq lenarray iSeqArr
rireturn
if changed(SIn) == 1 then
reinit update
endif
kTime init 1
kLEDindx1 init 0
kLEDindx2 init 0
kNoteIndx1 init 1
kNoteIndx2 init 1
kCount init 0
kBPM cabbageGet "bpm"
kDurIn cabbageGet "dur"

kTempo = (60/kBPM)*4

;kTime1 = (kTempo/iLen1)
kTime1 init 1
if metro(1/kTime1) == 1 then
kTime1 = iSeqArr[kSeqIndx1]*(kTempo/kLen1)
kDur1 = (kTime1)*kDurIn
schedulek "ledOn", 0, kDur1, 1,kLEDindx1, 1
schedulek "ledOff", kDur1, kDur1, 1,kLEDindx1
schedulek "noteColorOn", 0, kDur1,kNoteIndx1,1
schedulek "noteColorOff", kDur1, kDur1,kNoteIndx1
kLEDindx1 = (kLEDindx1+1) % kLen1
kSeqIndx1 = (kSeqIndx1+1)% iLenSeq
kNoteIndx1 = (kNoteIndx1+1) % gkLenNote
   if kLEDindx1 == 0 && kB1 == 1 then
   schedulek "chngOrd", 0, 0.1
   endif
   kRndModul init 1
   if kLEDindx1 == 0 then
   if kCount == 0 && kB2 == 1 then
   schedulek "funcChng", 0, 0.3, int(rnd:k(6))+2
   kRndModul = int(random:k(1, 4))
   endif
   kCount = (kCount+1) % kRndModul
   endif
endif
;kTime2 = (kTempo/iLen2)
kTime2 init 1
if metro(1/kTime2) == 1 then
kTime2 = iSeqArr[kSeqIndx2]*(kTempo/kLen2)
kDur2 = (kTime2)*kDurIn
schedulek "ledOn", 0, kDur2, 2,kLEDindx2, 2
schedulek "ledOff", kDur2, kDur2, 2,kLEDindx2
schedulek "noteColorOn", 0, kDur2,kNoteIndx2,2
schedulek "noteColorOff", kDur2, kDur2,kNoteIndx2
kLEDindx2 = (kLEDindx2+1) % kLen2
kSeqIndx2 = (kSeqIndx2+1)% iLenSeq
kNoteIndx2 = (kNoteIndx2+1) % gkLenNote
endif
endin




instr seqMachine2

kLen1 cabbageGet "len1"
kLen2 cabbageGet "len2"
kB1   cabbageGet "b1"
kB2   cabbageGet "b2"
SIn cabbageGet "seqarr" 
update:
iSeqArr[] StrToArr SIn
kSeqIndx init 0
kNoteIndx init 0
iLenSeq lenarray iSeqArr

rireturn
if changed(SIn) == 1 then
reinit update
endif

kTime init 1
kLEDindx1 init 0
kLEDindx2 init 0

kBPM cabbageGet "bpm"
kDurIn cabbageGet "dur"
kTempo = (kBPM/60)*4
if metro(1/kTime) == 1 then
kTime = iSeqArr[kSeqIndx]/kTempo
kDur = (kTime)*kDurIn
schedulek "ledOn", 0, kDur, 1,kLEDindx1
schedulek "ledOn", 0, kDur, 2,kLEDindx2
schedulek "noteColorOn", 0, kDur,kNoteIndx,1
schedulek "ledOff", kDur, kDur, 1,kLEDindx1
schedulek "ledOff", kDur, kDur, 2,kLEDindx2
schedulek "noteColorOff", kDur, kDur,kNoteIndx
kLEDindx1 = (kLEDindx1+1) % kLen1
kLEDindx2 = (kLEDindx2+1) % kLen2
kRndModul init 1
kCount init 0
   if kLEDindx1 == 0 || kLEDindx2 == 0 then
   if kB1 == 1 then
   schedulek "chngOrd", 0, 0.1
   endif
   if kB2 == 1 then
   if kCount == 0 then
   schedulek "funcChng", 0, 0.1, int(rnd:k(6))+2
   kRndModul = int(random:k(1, 6))
   endif
   kCount = (kCount+1) % kRndModul
   endif
   endif
kSeqIndx = (kSeqIndx+1) % iLenSeq
kNoteIndx = (kNoteIndx+1) % gkLenNote
endif
endin


;instr ledOn
;kFadeR transeg 60, p3,  2, 64
;kFadeG transeg 150, p3, 2, 64
;kFadeB transeg 200, p3, 2, 65
;Sled sprintf "seq%dled%d", p4,p5+1
;ScolorOn  sprintfk "colour(%d, %d, %d, 255)", kFadeR,kFadeG,kFadeB
; cabbageSet 1, Sled,ScolorOn
;endin

instr ledOn
Sled sprintf "seq%dled%d", p4,p5+1
;ScolorOn  = "colour(60, 150, 200, 255)"
ScolorOn  sprintf "colour(60, 150, %d, 255)", (p6*40)+200
 cabbageSet 1, Sled,ScolorOn
endin

instr ledOff
Sled sprintf "seq%dled%d", p4,p5+1
ScolorOff = "colour(64, 64, 65, 255)"
 cabbageSet 1, Sled,ScolorOff 
endin



instr genNote
giNoteArr[] = giEmptArr
iLen cabbageGetValue "notelen"
iMin cabbageGetValue "notemin"
iMax cabbageGetValue "notemax"
indx = 0
while indx < 8 do
SnoteOut sprintf "text(%s)", ""
SList sprintf "list%d", indx+1
cabbageSet SList,SnoteOut
indx += 1
od
indx = 0
while indx < iLen do
start:
iNote, Snote noteScale iMin, iMax
if iLen >= (iMax-iMin)/2 goto skip
   iCheckRep = 0
   while iCheckRep < lenarray(giNoteArr) do
   if iNote = giNoteArr[iCheckRep] goto start
   iCheckRep += 1
   od
skip:
giNoteArr[indx] = iNote
Snote MtoNameInt iNote
SnoteOut sprintf "text(%s)", Snote
SList sprintf "list%d", indx+1
cabbageSet SList,SnoteOut
indx += 1
od
giNoteArr[] RmvZ giNoteArr
printarray giNoteArr, "%d"
gkLenNote lenarray giNoteArr
SfuncShow sprintf "text(%s)", "-"
 cabbageSet 1, "funcshow", SfuncShow
endin

instr chngOrd
iLen = lenarray(giNoteArr)
giNoteArr[] ArrPermRnd giNoteArr,iLen
indx = 0
while indx < lenarray(giNoteArr) do
iNote = giNoteArr[indx]
Snote MtoNameInt iNote
SnoteOut sprintf "text(%s)", Snote
SList sprintf "list%d", indx+1
cabbageSet SList,SnoteOut
indx += 1
od
endin

instr noteColorOn
Snote sprintf "list%d", p4+1
ScolorOn  sprintf "fontColour(60, 150, %d, 255)", (p5*40)+200
cabbageSet 1, Snote,ScolorOn
endin

instr noteColorOff
Snote sprintf "list%d", p4+1
ScolorOff = "fontColour(100, 100, 100, 255)"
cabbageSet 1, Snote,ScolorOff
endin


instr midiSend
 iChn cabbageGetValue "chn"
 kActive active p1
 SactiveShow   sprintfk "text(%d)", kActive
 cabbageSet 1, "active", SactiveShow
 iNote = p4
 iVeloc = p5
 midion 1, iNote, iVeloc
endin

instr widgetWrite
 iY = 250
 iX = 20
 indx = 0
 while indx < 16 do
 SledSeq1    sprintf "bounds(%d, %d, 10, 10),\
 channel(\"seq1led%d\") colour(64, 64, 65, 255)", iX, iY, indx+1
 cabbageCreate "image", SledSeq1 
 SledSeq2    sprintf "bounds(%d, %d, 10, 10),\
 channel(\"seq2led%d\") colour(64, 64, 65, 255)",iX, iY+20, indx+1
 cabbageCreate "image", SledSeq2 
 indx += 1
 iX += 17
 od
 
 indx = 0
 iX = 25
 iY = 350
  while indx < 8 do
 SList    sprintf "bounds(%d, %d, 30, 20),\
 channel(\"list%d\") text(\"\") fontColour(100, 100, 100, 255)", iX, iY, indx+1
 cabbageCreate "label", SList 
 indx += 1
 iX += 35
 od
 
endin

instr seqChng
iLen1 cabbageGetValue "len1"
iLen2 cabbageGetValue "len2"
 indx = 0
 while indx < 16 do
 Sled1 sprintf "seq1led%d", indx+1
 Sled2 sprintf "seq2led%d", indx+1
 cabbageSet Sled1,"visible(0)"
 cabbageSet Sled2,"visible(0)"
 indx += 1
 od
 iX1 = 20
 indx1 = 0
 while indx1 < iLen1 do
 Sled1 sprintf "seq1led%d", indx1+1
 SledSeq1    sprintf "bounds(%d, 250, 10, 10), visible(1)", iX1
 cabbageSet Sled1,SledSeq1
 iX1 += 282/iLen1
 indx1 += 1
 od
 iX2 = 20
 indx2 = 0
 while indx2 < iLen2 do
 Sled2 sprintf "seq2led%d", indx2+1
 SledSeq2    sprintf "bounds(%d, 270, 10, 10), visible(1)", iX2
 cabbageSet Sled2,SledSeq2
 iX2 += 282/iLen2
 indx2 += 1
 od
endin


instr funcChng
iLen cabbageGetValue "notelen"
giNoteArr[] FuncPrg p4, iLen
print p4
indx = 0
while indx < lenarray(giNoteArr) do
iNote = giNoteArr[indx] 
Snote MtoNameInt iNote
SnoteOut sprintf "text(%s)", Snote
SList sprintf "list%d", indx+1
cabbageSet SList,SnoteOut
indx += 1
od
if p4 == 2 then
Sfunc = "II"
elseif p4 = 3 then
Sfunc = "III"
elseif p4 = 4 then
Sfunc = "IV"
elseif p4 = 5 then
Sfunc = "V"
elseif p4 = 6 then
Sfunc = "VI"
elseif p4 = 7 then
Sfunc = "VII"
endif
kChngColor transeg 0, p3*0.9, -2, 1
SfuncShow sprintfk "text(%s) fontColour(209, 245, 52, %d)", Sfunc, kChngColor*255
 cabbageSet 1, "funcshow", SfuncShow
endin


instr widgets
 kStart    cabbageGet "start"
 kGenNote  cabbageGet "gennote"
 kNoteLen cabbageGet "notelen"
 kNoteMin cabbageGet "notemin"
 kNoteMax cabbageGet "notemax"
 kSeqMod cabbageGet "seqmod"
 
 
  schedule "genNote", 0, 0.1
 

    SWidgetChannels[] cabbageGetWidgetChannels
    kIndex, kTrig cabbageChanged SWidgetChannels
if kTrig == 1 then

if kIndex >= 15 && kIndex <= 20 then
schedulek "funcChng", 0, 0.3, kIndex-13
endif
endif
 


 
 iDur = 9^9
    if kStart == 1 && changed(kStart) == 1 then
    if kSeqMod == 1 then
    schedulek "seqMachine1", 0, 9999
    elseif kSeqMod == 2 then
    schedulek "seqMachine2", 0, 9999
    endif
    elseif kStart == 0 && changed(kStart) == 1 then
    turnoff2 "seqMachine1", 0, 0
    turnoff2 "seqMachine2", 0, 0
    endif
kLen1 cabbageGet "len1"
kLen2 cabbageGet "len2"    
    if changed(kLen1,kLen2) == 1 then
    schedulek "seqChng", 0, 1
    endif
    if changed(kSeqMod) == 1 then
    cabbageSetValue "start", k(0)
;    turnoff2 "seqMachine1", 0, 0
;    turnoff2 "seqMachine2", 0, 0
    endif
    if changed(kGenNote) == 1 then
    if kNoteLen < (kNoteMax-kNoteMin) then
    schedulek "genNote", 0, 1
    endif
    endif
endin

schedule "widgets", 0, 999999
schedule "widgetWrite", 0, 1

</CsInstruments>
<CsScore>
;i "rndNote" 0 999999
;i 9 0 1
</CsScore>
</CsoundSynthesizer>
