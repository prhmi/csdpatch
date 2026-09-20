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

chn_k "line1", 2
chn_k "line2", 2
chn_k "line3", 2
chn_k "line4", 2



giRndChnOnArr[] init 4
giRndChnOffArr[] init 4
giAvlArr[] init 4

giRndArr[] init 2 
gindx init 0

opcode RndNoRep, i,ii
iMin, iMax xin
	start:
	iRnd = int(random:i(iMin,iMax))	
	giRndArr[gindx] = iRnd
	iCheck = (gindx == 0 ) ? 1: 0
	 if iRnd == giRndArr[iCheck] igoto start
	  igoto pass
   pass:
gindx = (gindx+1) % 2
xout iRnd
endop

instr quadpan
iSine      ftgen 0, 0, 2^10, 10, 1
iCoSine    ftgen 0, 0, 2^10, 11, 1
UPDATE:
giRndArr[] init 2 
iActive active p1
iMin = 1
iMax = 5
iChnOn  = int(random:i(iMin, iMax))
iChnOff = int(random:i(iMin, iMax))
Schn1 sprintf "chn%d", iChnOn
Schn2 sprintf "chn%d", iChnOff
Sprint sprintf "%s | %s", Schn1, Schn2
puts Sprint, 1
Sshow1 sprintf "line%d", iChnOn
Sshow2 sprintf "line%d", iChnOff
rireturn


iSpeed = 1/3 ;random 0.4, 5
k1  poscil 0.5, iSpeed, iSine, 0.75
;k2 poscil 0.5, iSpeed, iCoSine, 0

chnset k1+0.5, Sshow1
;chnset k2+0.5, Sshow2


;Sfile sprintf "sample%d.wav", iP1
;Ssnd sprintf "snd%d", iP1
aIn poscil 0.1, 900
;aOut1, aOut2 pan2 aIn, kLine

kTrig metro 1/3

if kTrig == 1 then
;chnset k(0), Sshow1
chnset k(0), Sshow2
reinit UPDATE
endif




endin




schedule 1, 0, 9999

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
  <objectName>line1</objectName>
  <x>60</x>
  <y>20</y>
  <width>170</width>
  <height>19</height>
  <uuid>{a7607f86-1a7e-404f-92df-b9f82f70679c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>line1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.99127165</xValue>
  <yValue>0.99127165</yValue>
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
  <objectName>line2</objectName>
  <x>60</x>
  <y>45</y>
  <width>170</width>
  <height>19</height>
  <uuid>{478eb993-aba8-49bb-aa83-965a7d6a1e7d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>line2</objectName2>
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
  <objectName>line3</objectName>
  <x>60</x>
  <y>70</y>
  <width>170</width>
  <height>19</height>
  <uuid>{951bac7b-6c10-443d-ae21-c0812b315ab4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>line3</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00872835</xValue>
  <yValue>0.00872835</yValue>
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
  <objectName>line4</objectName>
  <x>60</x>
  <y>95</y>
  <width>170</width>
  <height>19</height>
  <uuid>{4f9c209c-0886-411d-9b31-77da46ee0e22}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>line4</objectName2>
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
