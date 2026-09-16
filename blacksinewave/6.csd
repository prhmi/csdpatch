<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1



opcode MtoName, S,i
iMidi xin 
SNoteArr [] fillarray "C", "C#", "D", "D#","E","F", "F#", "G","G#", "A", "A#", "B"
iAraziArr[] fillarray 1, 3, 6, 8, 10
iNoteIndex = (iMidi) % 12
iNoteIndxInt = int(iNoteIndex)
iOctave = int(iMidi/12)-1
iSCent = int((iMidi-int(iMidi))*100.5)
if iSCent  == 0 then
Sout sprintf "%d%s",iOctave,SNoteArr[iNoteIndex]
elseif iSCent == 100 then
Sout sprintf "%d%s",iOctave,SNoteArr[iNoteIndex+1]
elseif iSCent != 0 then
		if iSCent > 50 then
		Sout sprintf "%d%s-%d",iOctave,SNoteArr[iNoteIndex+1],(100-iSCent)
		elseif iSCent < 50 then
		Sout sprintf "%d%s+%d",iOctave,SNoteArr[iNoteIndex],iSCent
		elseif iSCent == 50 then
		Sout sprintf "%d%s+",iOctave,SNoteArr[iNoteIndex]
			indx = 0			
			while indx < lenarray(iAraziArr) do
				if iNoteIndxInt = iAraziArr[indx] then
				Sout sprintf "%d%s-",iOctave,SNoteArr[iNoteIndex+1]
				endif
			indx += 1
			od
		endif
endif
xout Sout
endop

opcode Dastgah, i[],i[]Si
  iInArr[],SbaseNote,iPitch xin
  iMidi ntom SbaseNote
  iFrq mtof iMidi
  iRatio = iPitch/440
  iBaseFrq = iFrq*iRatio
  iBaseMidi ftom iBaseFrq
  iLen lenarray iInArr
  iOutArr[] init iLen
  iNote = iBaseMidi-1.5
  indx = 0
	while indx < iLen do
	iNote = iNote+(iInArr[indx])
	iOutArr[indx] = iNote
	iFrq1 mtof iNote
	iFrq2 = iFrq1*(440/432)
	iMidi ftom iFrq2
	Sname MtoName iMidi
	printf_i  "Note = %s iMidi = %.2f\n", 1, Sname,iNote
	indx += 1
	od
  xout iOutArr
endop


gkTime init 0
gkMoses init 0
seed 0


instr 1
iPicth = 432
SbaseNote ="1G+"
i3gahArr[] fillarray 0,1.5,1.5,2,1.5,1.5,2
iDastgah[] Dastgah i3gahArr,SbaseNote,iPicth
iInstr = p4
iMoses = i(gkMoses)
	if iInstr == 2 then
	iRndIndx = int(random:i(0,lenarray(iDastgah)))
	iRndBase = random:i(0, 100) > iMoses ? 1 : iRndIndx
	iBaseFrq mtof iDastgah[iRndBase]
	elseif iInstr == 4 then
	iBaseFrq mtof iDastgah[1]
	endif
iDur = p5
schedule iInstr,0,iDur,iBaseFrq
endin
instr 2
iFrq = p4
kTime init 0

if metro(kTime) == 1 then
iRndArr[] fillarray 4, 8, 6, 12
kRndIndx = int(random:k(0,4))
kTime = iRndArr[kRndIndx]
kDurRnd random 0.05, (gkMoses/300)+0.05
kDur = random:k(0,100) > gkMoses/2 ? 0.05 : kDurRnd
schedulek 3,0,kDur,iFrq
endif
endin
instr 3
iMoses = i(gkMoses)
iFrqIn = p4
iTimeLine = i(gkTime) 
giCount += 1
iAmp ampdb -20
iOctavArr[] fillarray 1, 2, 4, 8
iOctavIndx = int(random:i(0, lenarray(iOctavArr)))
iOctave = random:i(0,100) > iMoses ? 0 : iOctavArr[iOctavIndx]
iFrq = iFrqIn*iOctave

fprints "dur.txt","%.2f %.2f\n",p3*1000,iTimeLine
fprints "click.txt","%.2f %.2f\n",iFrq,iTimeLine
fprints "count.txt","%d\n",giCount
iAtt  random p3/10, p3/2
;print iAtt
aEnv transeg 0, p3-iAtt, 4, iAmp, iAtt, -6, 0
aSound poscil aEnv, iFrq
outall aSound
iChn = (int(random:i(0,100)) < 50 ) ? 0 : 1
if iChn == 0 then
chnmix aSound, "clkL"
elseif iChn == 1 then
chnmix aSound, "clkR"
endif
endin



zakinit 1, 4

instr 4
kMoses = (gkMoses/2)+10
iFrq = p4
kTime init 0
kCount init 0
iTimeFastArr[] fillarray 1,0.7,2,1.5
if metro(1/kTime) == 1 then
kIndx = int(random:k(0,lenarray(iTimeFastArr)))
kFast = iTimeFastArr[kIndx]
kSlow = random:k(3,7)
kMosesTime = random:k(0, 100) > kMoses ? kSlow : kFast
kTime = kMosesTime
kDurRnd random kTime, kTime*2
kDur = random:k(0,100) > kMoses ? kTime*0.6 : kDurRnd
schedulek 5, 0, kDur,iFrq,kCount
kCount = (kCount+1) % 4
endif
endin
instr 5
iActive active 2
iFrqIn  = p4
iCount = p5+1
if iActive > 4 then
turnoff
endif
iOctave = random:i(0,100) > 30 ? 1 : 2
iFrq = iFrqIn*iOctave
iDb random -25, -17
iAmp ampdb iDb
aAmp  transeg  0, p3/2, 1, iAmp, p3/2, -1, 0
aSound poscil aAmp, iFrq
kAmp  transeg  0, p3/2, 1, iAmp, p3/2, -1, 0
outall aSound
iChn = (int(random:i(0,100)) < 50 ) ? 0 : 1
if iChn == 0 then
chnmix aSound, "lineL"
elseif iChn == 1 then
chnmix aSound, "lineR"
endif
zkw kAmp, iCount
endin





instr 99
gkTime timeinsts
kTime = int(gkTime)
gkMoses linseg 100, p3, 0
aClkL chnget "clkL"
aClkR chnget "clkR"
fout "recordClick.wav", 8, aClkL,aClkR
aLineL chnget "lineL"
aLineR chnget "lineR"
fout "recordLine.wav", 8, aLineL,aLineR
aSumL sum aClkL,aLineL
aSumR sum aClkR,aLineR
fout "recordSum.wav", 8, aSumL,aSumR


;fprints "Amp1.txt","%d %.2f\n",10,-5
;fprints "Amp1.txt","%d %.2f\n",-70,-4
kAmp1 zkr 1
kAmp2 zkr 2
kAmp3 zkr 3
kAmp4 zkr 4
kdB1 dbamp kAmp1
kdB2 dbamp kAmp2
kdB3 dbamp kAmp3
kdB4 dbamp kAmp4

iMindB = -80

if kdB1 < iMindB then
kdB1 = iMindB
endif
if kdB2 < iMindB then
kdB2 = iMindB
endif
if kdB3 < iMindB then
kdB3 = iMindB
endif
if kdB4 < iMindB then
kdB4 = iMindB
endif

if kAmp1 != 0 && kdB1 >= iMindB && changed(int(kdB1)) == 1 then
fprintks "Amp1.txt","%d %.2f\n",kdB1,gkTime
endif
if kAmp2 != 0 &&  kdB2 >= iMindB && changed(int(kdB2)) == 1 then
fprintks "Amp2.txt","%d %.2f\n",kdB2,gkTime
endif
if kAmp3 != 0 &&  kdB3 >= iMindB && changed(int(kdB3)) == 1 then
fprintks "Amp3.txt","%d %.2f\n",kdB3,gkTime
endif
if kAmp4 != 0 &&  kdB4 >= iMindB && changed(int(kdB4)) == 1 then
fprintks "Amp4.txt","%d %.2f\n",kdB4,gkTime
endif


chnclear "clkL"
chnclear "clkR"
chnclear "lineL"
chnclear "lineR"
zkcl 0, 3
zkcl 0, 2
zkcl 0, 3
endin

</CsInstruments>
<CsScore>
;				ins	dur
i1 0 1	 	2 		10
i1 12 1	 	2 		10
i1 22 1	 	2 		10
i1 35 1	 	2 		10
i1 46 1	 	2 		10
i1 57 1	 	2 		10
i1 69 1	 	2 		10
i1 80 1	 	2 		6

i1 0 1		4		80
i99 0 86.4
</CsScore>
</CsoundSynthesizer>


