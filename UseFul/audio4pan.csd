<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0

indx = 0
iSmp = 0
iChn = 0
while indx < 16 do
if (indx % 4) == 0 then
iSmp += 1
endif
Sin sprintf "sample%dch%d", iSmp, iChn+1
puts Sin, 1
iChn = (iChn+1)%4
chn_k Sin, 2
indx += 1
od

chn_k "snd1", 3
chn_k "snd2", 3
chn_k "snd3", 3


giRndChnOnArr[] init 4
giAvlbArr[] init 4

instr 1
iActive active p1
iSine      ftgen 0, 0, 2^10, 10, 1
iCoSine    ftgen 0, 0, 2^10, 11, 1


iArrChn[] init 2 ;  1,0

iMin = 1
iMax = 5
indxArr = 0
UPDATE:
iDur random 1, 3
startchn:
;iChn RndNoRep iMin,iMax
iChn = int(random:i(iMin,iMax))	
   iCheckIndx = 0
   while iCheckIndx < lenarray(giRndChnOnArr) do
   if giRndChnOnArr[iCheckIndx] == iChn goto startchn
   iCheckIndx += 1
   od
giRndChnOnArr[iActive-1] = iChn   
;iChnPrv RndNoRep iMin,iMax  
;   
indxArr = (indxArr+1)%2
iArrChn[indxArr] = iChn
indxPrv = indxArr == 0 ? 1 : 0
iChnPrv = iArrChn[indxPrv]



kAmpUp linseg 0, iDur, 1
kAmpDown linseg 1, iDur, 0
;printarray giRndChnOnArr

SmeterOn sprintf "sample%dch%d",iActive,iChn
SmeterOff sprintf "sample%dch%d",iActive,iChnPrv
;Sprint sprintf "%s | %s", SmeterOn,SmeterOff
;puts Sprint,1
;Ssnd sprintf "snd%d", iActive
Srcrd1 sprintf "smp%drcrd%d", iActive, iChn
Srcrd2 sprintf "smp%drcrd%d", iActive, iChnPrv
rireturn
chnset kAmpUp, SmeterOn
chnset kAmpDown, SmeterOff

Sfile sprintf "sample%d.wav", iActive
aIn diskin Sfile, 1, 0, 0

aSnd1 = aIn*kAmpUp
aSnd2 = aIn*kAmpDown
chnmix aSnd1, Srcrd1
chnmix aSnd1, Srcrd2



	 if kAmpUp == 1 then
   ;chnset k(1), Ssnd
   reinit UPDATE
	 endif

;SArr[] init 3
;indx = 1
;iWrite = 0
;while indx < 5 do
;Sin sprintf "snd%d", indx
;if indx != iActive then
;SArr[iWrite] = Sin
;iWrite += 1
;endif
;indx += 1
;od
;k1 chnget SArr[0]
;k2 chnget SArr[1]
;k3 chnget SArr[2]
;if changed(k1,k2,k3) == 1  then
;reinit UPDATE
;endif


endin

instr 2
aSmp1Chn1 chnget "smp1rcrd1"
aSmp1Chn2 chnget "smp1rcrd2"
aSmp1Chn3 chnget "smp1rcrd3"
aSmp1Chn4 chnget "smp1rcrd4"

aSmp2Chn1 chnget "smp2rcrd1"
aSmp2Chn2 chnget "smp2rcrd2"
aSmp2Chn3 chnget "smp2rcrd3"
aSmp2Chn4 chnget "smp2rcrd4"

aSmp3Chn1 chnget "smp3rcrd1"
aSmp3Chn2 chnget "smp3rcrd2"
aSmp3Chn3 chnget "smp3rcrd3"
aSmp3Chn4 chnget "smp3rcrd4"

aChn1 sum aSmp1Chn1, aSmp2Chn1, aSmp3Chn1
aChn2 sum aSmp1Chn2, aSmp2Chn2, aSmp3Chn2
aChn3 sum aSmp1Chn3, aSmp2Chn3, aSmp3Chn3
aChn4 sum aSmp1Chn4, aSmp2Chn4, aSmp3Chn4

fout "record.wav", 8, aChn1,aChn2,aChn3,aChn4
chnclear "smp1rcrd1", "smp1rcrd2", "smp1rcrd3", "smp1rcrd4"
chnclear "smp2rcrd1", "smp2rcrd2", "smp2rcrd3", "smp2rcrd4"
chnclear "smp3rcrd1", "smp3rcrd2", "smp3rcrd3", "smp3rcrd4"
endin

iDur filelen "sample1.wav"
schedule 1, 0, iDur
schedule 1, 0, iDur
schedule 1, 0, iDur
schedule 2, 0, iDur

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>






















































<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>53</r>
  <g>53</g>
  <b>53</b>
 </bgcolor>
 <bsbObject type="BSBController" version="2">
  <objectName>sample1ch1</objectName>
  <x>60</x>
  <y>20</y>
  <width>72</width>
  <height>15</height>
  <uuid>{a7607f86-1a7e-404f-92df-b9f82f70679c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample1ch1</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample1ch2</objectName>
  <x>60</x>
  <y>40</y>
  <width>72</width>
  <height>15</height>
  <uuid>{b60a7639-c090-4067-9397-3095b025f964}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample1ch2</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample1ch3</objectName>
  <x>60</x>
  <y>60</y>
  <width>72</width>
  <height>15</height>
  <uuid>{0623fe60-bfde-4107-9144-986ce02fe9d2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample1ch3</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample2ch1</objectName>
  <x>150</x>
  <y>20</y>
  <width>72</width>
  <height>15</height>
  <uuid>{a7c28910-c1ef-4bbd-b675-9eb7dab8e076}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample2ch1</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample2ch2</objectName>
  <x>150</x>
  <y>40</y>
  <width>72</width>
  <height>15</height>
  <uuid>{645fa0dd-5e1f-4dc4-a90a-c34d81971797}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample2ch2</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample2ch3</objectName>
  <x>150</x>
  <y>60</y>
  <width>72</width>
  <height>15</height>
  <uuid>{bca0dd26-8101-4b1d-ac28-6e5aebfab81a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample2ch3</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample2ch4</objectName>
  <x>150</x>
  <y>80</y>
  <width>72</width>
  <height>15</height>
  <uuid>{55933489-c9ea-4e2e-963d-29226a789402}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample2ch4</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample3ch1</objectName>
  <x>240</x>
  <y>20</y>
  <width>72</width>
  <height>15</height>
  <uuid>{3da36473-a442-4ed2-b431-202188f7c9ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample3ch1</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample3ch2</objectName>
  <x>240</x>
  <y>40</y>
  <width>72</width>
  <height>15</height>
  <uuid>{60c2414f-bbae-4ea2-aeb9-da386e4b8892}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample3ch2</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample3ch3</objectName>
  <x>240</x>
  <y>60</y>
  <width>72</width>
  <height>15</height>
  <uuid>{12774873-5d9a-457a-9748-846de96546a5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample3ch3</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample3ch4</objectName>
  <x>240</x>
  <y>80</y>
  <width>72</width>
  <height>15</height>
  <uuid>{7c8be06f-9f1b-488e-8358-0123877f3910}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample3ch4</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample4ch1</objectName>
  <x>330</x>
  <y>20</y>
  <width>72</width>
  <height>15</height>
  <uuid>{5599cdce-9bac-4888-9ce7-8ab8a6b4e019}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample4ch1</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample4ch2</objectName>
  <x>330</x>
  <y>40</y>
  <width>72</width>
  <height>15</height>
  <uuid>{11421727-6e29-48d7-a9ba-d1379206084a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample4ch2</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample4ch3</objectName>
  <x>330</x>
  <y>60</y>
  <width>72</width>
  <height>15</height>
  <uuid>{9f4cba8a-5d01-442d-86ba-f58ce06d844f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample4ch3</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample4ch4</objectName>
  <x>330</x>
  <y>80</y>
  <width>72</width>
  <height>15</height>
  <uuid>{0c9b4f00-37bb-42e5-ab93-f8151b859419}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample4ch4</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>sample1ch4</objectName>
  <x>60</x>
  <y>80</y>
  <width>72</width>
  <height>15</height>
  <uuid>{94613f58-c47a-41f0-a729-aebf2724f066}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>sample1ch4</objectName2>
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
  <randomizable group="0" mode="both">false</randomizable>
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
