<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1



seed 0
chn_k "slideramp", 1
chn_k "filemenu", 1
chn_S "timeshow", 2
chn_S "lenfile", 2
chn_S "scrolfile", 2
chn_S "ampshow", 2
chn_k "timeline",2
chn_k "timelinein",1
chn_k "out1", 2
chn_k "out2", 2

opcode timeLine, 0, Si
Sfile,iStart xin
iLen filelen Sfile
kLine line 0, 1, 1
chnset (kLine+iStart)/iLen, "timeline"
endop

instr 1
SFilesArr[] directory "./samples", ".wav"
iSamples lenarray SFilesArr
iIndxFile chnget "filemenu"
Sfile = SFilesArr[iIndxFile]
iLenFile filelen Sfile

;;show widgets

iLenMin = int(iLenFile/60)
iLenSec = iLenFile-(iLenMin*60)
 Slenfile sprintf "%2d : %02d", iLenMin, iLenSec
 chnset Slenfile, "lenfile"

iStartFile chnget "timelinein" ;5
iStartFile = iStartFile*iLenFile
iStartMin = int(iStartFile/60)
iStartSec = iStartFile-(iStartMin*60)
 SStrtfile sprintf "%2d : %02d", iStartMin, iStartSec
 chnset SStrtfile, "scrolfile"
;;loop
iLoop = 5
iIndx = 0
iDur = 0.7
iStart = 0
while iIndx < iLoop do
schedule 2, iStart, iDur, Sfile, iStartFile
iStart += iDur*1.01
iIndx += 1
od

endin 


instr 2
iAmpdB chnget "slideramp"
Sfile = p4
iStart = p5
iLenFile filelen Sfile
timeLine Sfile,iStart
;iStart = 2
aInL, aInR diskin2 Sfile, 1, iStart, 1
aOutL linen aInL*ampdb(iAmpdB), p3/10, p3, p3/10 
aOutR linen aInR*ampdb(iAmpdB), p3/10, p3, p3/10 
out aOutL,aOutR
endin



instr Timer
 kSec init 0
 kMin init 0
 if metro(1) == 1 then
 kSec = (kSec+1) % 60
		if kSec == 0 then
		kMin += 1
		endif
 endif
 STimer sprintfk "%2d : %02d", kMin, kSec
 chnset STimer, "timeshow"
endin

instr SelectFile
SFilesArr[] directory "./samples", ".wav"
iSamples lenarray SFilesArr
iIndxFile chnget "filemenu"
Sfile = SFilesArr[iIndxFile]
iLenFile filelen Sfile

;;show widgets

iLenMin = int(iLenFile/60)
iLenSec = iLenFile-(iLenMin*60)
 Slenfile sprintf "%2d : %02d", iLenMin, iLenSec
 chnset Slenfile, "lenfile"
iStartFile chnget "timelinein" ;5
iStartFile = iStartFile*iLenFile
iStartMin = int(iStartFile/60)
iStartSec = iStartFile-(iStartMin*60)
 SStrtfile sprintf "%2d : %02d", iStartMin, iStartSec
 chnset SStrtfile, "scrolfile"
endin


instr OutPuts
kIndxFile chnget "filemenu"
kTimeLineChange chnget "timelinein"
kActive active "SelectFile"
if changed(kIndxFile) == 1 || changed(kTimeLineChange) == 1 && kActive == 0 then
schedulek "SelectFile", 0, 0.1
endif
 kAmpdB chnget "slideramp"
  SAmp sprintfk "Master Gain: %d dB", kAmpdB
 chnset SAmp, "ampshow"
 a1,a2 monitor
 kMax1 max_k a1, metro(20), 1
 kMax2 max_k a2, metro(20), 1
 kMeter1 dbfsamp kMax1
 kMeter2 dbfsamp kMax2
 chnset kMeter1, "out1"
 chnset kMeter2, "out2"
endin

</CsInstruments>
<CsScore>
i "Timer" 0 99999
i "OutPuts" 0 99999
</CsScore>
</CsoundSynthesizer>












<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>85</x>
 <y>149</y>
 <width>878</width>
 <height>557</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>85</r>
  <g>85</g>
  <b>85</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>471</x>
  <y>16</y>
  <width>360</width>
  <height>449</height>
  <uuid>{62601eab-a8ab-4590-b4ef-5530e8b7f19e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label/>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>10</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>49</r>
   <g>52</g>
   <b>54</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>timeline</objectName>
  <x>105</x>
  <y>510</y>
  <width>663</width>
  <height>22</height>
  <uuid>{59a045e3-7882-4a12-8139-6e7ef77369db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>timeline</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.42386146</xValue>
  <yValue>0.42386146</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>176</r>
   <g>234</g>
   <b>194</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>loop</objectName>
  <x>41</x>
  <y>46</y>
  <width>100</width>
  <height>30</height>
  <uuid>{fc17beb0-cb3c-47d4-802d-88943d38c7a1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>loop</text>
  <image>/</image>
  <eventLine>i1 0 1</eventLine>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>filemenu</objectName>
  <x>47</x>
  <y>89</y>
  <width>91</width>
  <height>33</height>
  <uuid>{82130425-7bc1-4d70-98b9-377b76d67b9c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name>sample1</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample2</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample3</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample4</name>
    <value>3</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample5</name>
    <value>4</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample6</name>
    <value>5</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample7</name>
    <value>6</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample8</name>
    <value>7</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample9</name>
    <value>8</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample10</name>
    <value>9</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample11</name>
    <value>10</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name>sample12</name>
    <value>11</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>10</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>timeshow</objectName>
  <x>499</x>
  <y>68</y>
  <width>207</width>
  <height>67</height>
  <uuid>{ff5b6bb5-dc2c-4938-bdbd-d857862cebbe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>33 : 45</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>50</fontsize>
  <precision>0</precision>
  <color>
   <r>235</r>
   <g>235</g>
   <b>235</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>scrolfile</objectName>
  <x>30</x>
  <y>505</y>
  <width>64</width>
  <height>33</height>
  <uuid>{abf2d43b-2f82-426a-906d-ed0bac6470ec}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label> 0 : 40</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>0</precision>
  <color>
   <r>235</r>
   <g>235</g>
   <b>235</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>lenfile</objectName>
  <x>770</x>
  <y>500</y>
  <width>64</width>
  <height>33</height>
  <uuid>{b93ccc58-2f76-41c3-b9f6-6892b387cd14}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label> 0 : 58</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>0</precision>
  <color>
   <r>235</r>
   <g>235</g>
   <b>235</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>out1</objectName>
  <x>559</x>
  <y>360</y>
  <width>238</width>
  <height>26</height>
  <uuid>{d81b439c-4606-4388-85ab-5ddd3504a323}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>out1</objectName2>
  <xMin>-60.00000000</xMin>
  <xMax>0.00000000</xMax>
  <yMin>-60.00000000</yMin>
  <yMax>0.00000000</yMax>
  <xValue>-inf</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>170</r>
   <g>255</g>
   <b>127</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>slideramp</objectName>
  <x>487</x>
  <y>204</y>
  <width>54</width>
  <height>219</height>
  <uuid>{ff865732-6b3e-487d-bb0c-de34ccb45e09}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-60.00000000</minimum>
  <maximum>10.00000000</maximum>
  <value>-18.44748858</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>ampshow</objectName>
  <x>487</x>
  <y>426</y>
  <width>323</width>
  <height>30</height>
  <uuid>{34a72dac-5079-4cd3-8af1-24e0a73d5017}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Master Gain: -18 dB</label>
  <alignment>left</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>25</fontsize>
  <precision>0</precision>
  <color>
   <r>221</r>
   <g>221</g>
   <b>221</b>
  </color>
  <bgcolor mode="nobackground">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>hor11</objectName>
  <x>155</x>
  <y>50</y>
  <width>21</width>
  <height>107</height>
  <uuid>{091884b0-3d71-4560-8e8e-5bc301bdb1dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter11</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.44859813</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>144</r>
   <g>215</g>
   <b>234</b>
  </color>
  <randomizable group="0" mode="both">false</randomizable>
  <bgcolor>
   <r>30</r>
   <g>30</g>
   <b>30</b>
  </bgcolor>
  <bgcolormode>true</bgcolormode>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>560</x>
  <y>256</y>
  <width>236</width>
  <height>94</height>
  <uuid>{317dadfc-a01e-45af-b708-3a595ebc75b9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>5.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>timelinein</objectName>
  <x>105</x>
  <y>485</y>
  <width>663</width>
  <height>20</height>
  <uuid>{326ba4ae-0f02-4deb-bd48-2922bea852cc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>timeline</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.69984917</xValue>
  <yValue>0.42386146</yValue>
  <type>line</type>
  <pointsize>10</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>144</r>
   <g>215</g>
   <b>234</b>
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
  <objectName>out2</objectName>
  <x>559</x>
  <y>388</y>
  <width>238</width>
  <height>26</height>
  <uuid>{8ac7d8ab-74f9-4203-8829-98be0184bbd2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>out2</objectName2>
  <xMin>-60.00000000</xMin>
  <xMax>0.00000000</xMax>
  <yMin>-60.00000000</yMin>
  <yMax>0.00000000</yMax>
  <xValue>-inf</xValue>
  <yValue>-inf</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>170</r>
   <g>255</g>
   <b>127</b>
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
  <objectName>hor11</objectName>
  <x>180</x>
  <y>50</y>
  <width>21</width>
  <height>107</height>
  <uuid>{44f2b2c6-af1f-4644-820b-0bd00c5168b8}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter11</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.44859813</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>144</r>
   <g>215</g>
   <b>234</b>
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
  <objectName>hor11</objectName>
  <x>205</x>
  <y>50</y>
  <width>21</width>
  <height>107</height>
  <uuid>{e5d018f4-7f71-4cef-a062-5bf1f301d344}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter11</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.44859813</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>144</r>
   <g>215</g>
   <b>234</b>
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
  <objectName>hor11</objectName>
  <x>230</x>
  <y>50</y>
  <width>21</width>
  <height>107</height>
  <uuid>{cd7a304b-fdae-403a-ba48-96f53db3dc61}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter11</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00000000</xValue>
  <yValue>0.44859813</yValue>
  <type>fill</type>
  <pointsize>1</pointsize>
  <fadeSpeed>0.00000000</fadeSpeed>
  <mouseControl act="press">jump</mouseControl>
  <bordermode>noborder</bordermode>
  <borderColor>#00ff00</borderColor>
  <color>
   <r>144</r>
   <g>215</g>
   <b>234</b>
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
