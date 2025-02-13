<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1




opcode morseRead, kkS, Si
Stxt, iBPMIn xin
if iBPMIn >= 300 then
iBPM = 300
elseif iBPMIn <= 30 then
iBPM = 30
else
iBPM = iBPMIn
endif
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
  kMorseIndx init 0
 iChar = iTypeArr[i(kLetterIndx)]
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
    iMorseArr[] fillarray 2
    Schr = " "
    else
    iMorseArr[] fillarray 2
    Schr = " "
    endif
    printarray iMorseArr
    iTempo = iBPM/60  
    if metro(kTime) == 1 then
    	if iChar != 32 then
    	kTrig = 1
    	endif
    kTime = 1/((iMorseArr[kMorseIndx])/(iTempo*4))
    kMorseIndx += 1
    		if kMorseIndx >= lenarray(iMorseArr) then 
    		iLast = iMorseArr[lenarray(iMorseArr)-1]
     		iDelay = (iLast/iTempo)*1.5
    		kTime = 0
		   kMorseIndx = lenarray(iMorseArr)
		   reinit next
    		endif
    endif
next:
kNext delayk 1, iDelay
		if kNext == 1 && kLetterIndx < lenarray(iTypeArr) then
		kLetterIndx += 1
			if kLetterIndx >= lenarray(iTypeArr) then
			kLetterIndx = lenarray(iTypeArr)-1
			kOnOff = 0
			endif
		endif
skip:
xout kTrig,kOnOff, Schr

endop


chn_S("display1", 2)
chn_S("display2", 2)
chn_k("led", 2)
instr morseMachine
iBPM = 160
iTempo = iBPM/60
iDur = (iTempo*0.5)/20
Stxt = "test me"
chnset Stxt,"display1"
    kTrig,kOnOff,Schr morseRead Stxt, iBPM
; printk2 kOnOff
    	if kTrig == 1 && changed(kTrig) == 1 then
    	schedulek "morseSound", 0, iDur,Schr
    	endif    
endin


schedule "morseMachine", 0, 555



instr morseSound
Schr = p4
chnset Schr,"display2"
kLED = 1
	if release() == 1 then
	kLED = 0
	endif
		chnset kLED,"led"
puts Schr,1
iAtt = p3/10
iAmp = 0.1
aEnv transeg 0, iAtt, 6, iAmp, p3-(iAtt*2), 1, iAmp, iAtt, -6, 0
 aSound poscil aEnv, 1200
 outall aSound
endin

</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>














































<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>619</x>
 <y>259</y>
 <width>400</width>
 <height>341</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>display2</objectName>
  <x>143</x>
  <y>125</y>
  <width>83</width>
  <height>86</height>
  <uuid>{6c94853c-390a-4587-9d7b-64668287f5f1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>E</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>50</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBDisplay">
  <objectName>display1</objectName>
  <x>68</x>
  <y>51</y>
  <width>236</width>
  <height>50</height>
  <uuid>{319a3012-c850-4407-bcfa-0f60a38bd767}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>test me</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>30</fontsize>
  <precision>30</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject version="2" type="BSBController">
  <objectName>led</objectName>
  <x>107</x>
  <y>177</y>
  <width>30</width>
  <height>30</height>
  <uuid>{e73d32c3-1031-47ec-8c75-3238f89a3ce2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>led</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.00000000</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>0</r>
   <g>234</g>
   <b>0</b>
  </color>
  <randomizable mode="both" group="0">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
