/*
parnux VSTi package v6.0
written by parham izadyar | 2020-2025 | cabbage v2.9.0
parhamizadyar.net
*/
<Cabbage>
form caption("MorseCode") size(320, 150)  guiMode("queue")  colour(40,30,40) style("legacy") pluginId("mrse")
texteditor bounds(12, 24, 300, 40) channel("morsetxt") colour(200, 170, 200, 200) colour:0(200, 170, 200, 200)fontSize(26) text("some one")
nslider bounds(18, 72, 70, 44) channel("morsebpm") range(30, 300, 174, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("Tempo")
nslider bounds(90, 72, 68, 43) channel("morsefrq") range(200, 2000, 1200, 1, 1) colour(70, 50, 70, 255) fontColour(241, 178, 178, 255) text("Frq")
nslider bounds(162, 72, 68, 43) channel("morseamp") range(-90, 0, -22, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("Amp")
nslider bounds(232, 72, 68, 43) channel("morsefilt") range(500, 9000, 5000, 1, 1) colour(70, 50, 70) fontColour(241, 178, 178, 255) text("lopF")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n  -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1



opcode morseRead, kkkS, Si
Stxt, iBPM xin
 kTrig = 0
 kOnOff = 1
 iMorseArr_A[] fillarray 1,2
 iMorseArr_B[] fillarray 2,1,1,1
 iMorseArr_C[] fillarray 2,1,2,1
 iMorseArr_D[] fillarray 2,1,1
 iMorseArr_E[] fillarray 1
 iMorseArr_F[] fillarray 1,1,2,1
 iMorseArr_G[] fillarray 2,2,1
 iMorseArr_H[] fillarray 1,1,1,1
 iMorseArr_I[] fillarray 1,1
 iMorseArr_J[] fillarray 1,2,2,2
 iMorseArr_K[] fillarray 2,1,2
 iMorseArr_L[] fillarray 1,2,1,1
 iMorseArr_M[] fillarray 2,2
 iMorseArr_N[] fillarray 2,1
 iMorseArr_O[] fillarray 2,2,2
 iMorseArr_P[] fillarray 1,2,2,1
 iMorseArr_Q[] fillarray 2,2,1,2
 iMorseArr_R[] fillarray 1,2,1
 iMorseArr_S[] fillarray 1,1,1
 iMorseArr_T[] fillarray 2
 iMorseArr_U[] fillarray 1,1,2
 iMorseArr_V[] fillarray 1,1,1,2
 iMorseArr_W[] fillarray 1,2,2
 iMorseArr_X[] fillarray 2,1,1,2
 iMorseArr_Y[] fillarray 2,1,2,2
 iMorseArr_Z[] fillarray 2,2,1,1
 iLenLetter       strlen     Stxt 
if iLenLetter == 0 then
kOnOff = 0
goto skip
endif
 iTypeArr[] init iLenLetter
 indx = 0	
 while indx < iLenLetter do
 ichr       strchar    Stxt, indx
 iTypeArr[indx]  = ichr
 indx += 1
 od
 kTime init 1
 kLetterIndx init 0
 kNextOnOff init 0
 if changed(kLetterIndx) == 1 then
 reinit update
 endif
 update:
 iLetterIndx = i(kLetterIndx)
  kMorseIndx init 0
 iChar = iTypeArr[iLetterIndx]
    if iChar == 97 then
    iMorseArr[] = iMorseArr_A
    Schr = "A"
    elseif iChar == 98 then
    iMorseArr[] = iMorseArr_B
    Schr = "B"
    elseif iChar == 99 then
    iMorseArr[] = iMorseArr_C
    Schr = "C"
    elseif iChar == 100 then
    iMorseArr[] = iMorseArr_D
    Schr = "D"
    elseif iChar == 101 then
    iMorseArr[] = iMorseArr_E
    Schr = "E"
    elseif iChar == 102 then
    iMorseArr[] = iMorseArr_F
    Schr = "F"
    elseif iChar == 103 then
    iMorseArr[] = iMorseArr_G
    Schr = "G"
    elseif iChar == 104 then
    iMorseArr[] = iMorseArr_H
    Schr = "H"
    elseif iChar == 105 then
    iMorseArr[] = iMorseArr_I
    Schr = "I"
    elseif iChar == 106 then
    iMorseArr[] = iMorseArr_J
    Schr = "J"
    elseif iChar == 107 then
    iMorseArr[] = iMorseArr_K
    Schr = "K"
    elseif iChar == 108 then
    iMorseArr[] = iMorseArr_L
    Schr = "L"
    elseif iChar == 109 then
    iMorseArr[] = iMorseArr_M
    Schr = "M"
    elseif iChar == 110 then
    iMorseArr[] = iMorseArr_N
    Schr = "N"
    elseif iChar == 111 then
    iMorseArr[] = iMorseArr_O
    Schr = "O"
    elseif iChar == 112 then
    iMorseArr[] = iMorseArr_P
    Schr = "P"
    elseif iChar == 113 then
    iMorseArr[] = iMorseArr_Q
    Schr = "Q"
    elseif iChar == 114 then
    iMorseArr[] = iMorseArr_R
    Schr = "R"
    elseif iChar == 115 then
    iMorseArr[] = iMorseArr_S
    Schr = "S"
    elseif iChar == 116 then
    iMorseArr[] = iMorseArr_T
    Schr = "T"
    elseif iChar == 117 then
    iMorseArr[] = iMorseArr_U
    Schr = "U"
    elseif iChar == 118 then
    iMorseArr[] = iMorseArr_V
    Schr = "V"
    elseif iChar == 119 then
    iMorseArr[] = iMorseArr_W
    Schr = "W"
    elseif iChar == 120 then
    iMorseArr[] = iMorseArr_X
    Schr = "X"
    elseif iChar == 121 then
    iMorseArr[] = iMorseArr_Y
    Schr = "Y"
    elseif iChar == 122 then
    iMorseArr[] = iMorseArr_Z
    Schr = "Z"
    elseif iChar == 32 then
    iMorseArr[] fillarray 1
    Schr = " "
    else
    iMorseArr[] fillarray 1
    Schr = " "
    endif
    printarray iMorseArr
    iTempo = (iBPM/60)*4
    if metro(kTime) == 1 then
    	if iChar != 32 then
    	kTrig = 1
    	endif
    kTime = 1/(iMorseArr[kMorseIndx]/iTempo)
    kDur = iMorseArr[kMorseIndx]/iTempo
    kMorseIndx += 1
    		if kMorseIndx >= lenarray(iMorseArr) then 
    		iLast = iMorseArr[lenarray(iMorseArr)-1]
;     		iDelay = sumarray(iMorseArr)/iTempo/2
    		kTime = 0
		   kMorseIndx = 0
		   reinit next
    		endif
    endif
;goto skip    
next:
iDelay = (iLast/iTempo)*2.5
;print iDelay
if kTime == 0 then
kNext init 0
kNext = linseg:k( 0, iDelay, 1)
endif
		if kNext == 1 && kLetterIndx < lenarray(iTypeArr) then
		kLetterIndx += 1
			if kLetterIndx >= lenarray(iTypeArr) then
			kLetterIndx = lenarray(iTypeArr)-1
			kOnOff = 0
			endif
		endif
skip:
xout kTrig,kDur, kOnOff, Schr
endop


instr morseMachine
Stxt = p4
    iBPM cabbageGetValue "morsebpm" ; 120
    iTempo = iBPM/60
    kTrig, kDur, kOnOff, Schr morseRead Stxt, iBPM
    	if kTrig == 1 && changed(kTrig) == 1 then
    	schedulek "morseSound", 0, kDur*0.7,Schr
    	endif    
endin





instr morseSound
 iFrq cabbageGetValue "morsefrq"
 iMorseNoise cabbageGetValue "morsenoise"
 iMorseSine cabbageGetValue "morsesine"
 iNoiseGain = iMorseNoise
 iSineGain = iMorseSine
 iAmpIn cabbageGetValue "morseamp"
 iAmp ampdb iAmpIn
    if p4 == 32 then
    iGain = 0
    elseif p4 == 200 then
    iGain = 0
    cabbageSet 1,"morseplight","colour(10, 10, 10)"
    else
     cabbageSet "morseplight","colour(245, 150, 245)"
    iGain = 1
    endif
 iAtt = p3/10
 aEnv transeg 0, iAtt, 6, iAmp, p3-(iAtt*2), 1, iAmp, iAtt, -6, 0
 aSound poscil aEnv, iFrq
 aNoise noise aEnv, 0.5
 iFilter cabbageGetValue "morsefilt"
 aNoiseF clfilt  aNoise, iFilter, 0, 10
 aNoiseOut clfilt aNoiseF, iFilter*0.9, 1, 10
 aOut = ((aSound*0.6)+(aNoiseOut*0.4))*iGain
 ;chnmix aOut, "out"
 outall aOut
if release() == 1 && p4 != 200 then
cabbageSet 1,"morseplight","colour(120, 100, 120)"
endif
endin


instr widget
Stype cabbageGet "morsetxt"
    if changed(Stype) == 1  then
    turnoff2 "morseMachine", 0, 0
    turnoff2 "morseSound", 0, 0
    schedulek "morseMachine", 0, 9999, Stype, 0
    endif 
endin
</CsInstruments>
<CsScore>
i "widget" 0 99999
</CsScore>
</CsoundSynthesizer>

