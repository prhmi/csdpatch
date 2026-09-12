;--------------------------------------
; I of IV by Pauline Oliveros - 1997
; written by Parham Izadyar   - 2025 
; (Csound 6.18 - CsoundQt 1.1.2)
; Under the guidance of Joachim Heintz
;--------------------------------------
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 48000	;high oversampling is requared to avoid aliasing
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0
giblend  ftgen 2, 0, 1024, -19, 1, 0.5, 270, 0.5


giRndArr[] init 2 
gindx init 0

//i-rate version
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


;;widgets
indx = 0
while indx < 11 do
  SOSC       sprintf "osc%d", indx+1
  SFrq       sprintf "frq%d", indx+1
  SAmp       sprintf "amp%d", indx+1
  chn_k SOSC, 1
  chn_k SFrq, 2
  chn_k SAmp, 2
  indx += 1
od
chn_k "frqmin",     1
chn_k "frqmax",     1
chn_k "lcsr",       1
chn_k "showgliss",  2
chn_k "gliss",      1
chn_k "showlfo1",   2
chn_k "showlfo2",   2
chn_k "showlfo3",   2
chn_k "gendata",    1
chn_k "gendatamod", 1
chn_k "dconoff",    1
chn_k "pm",         1
chn_k "flm",        1
chn_k "lfo1",       1
chn_k "lfo2",       1
chn_k "lfo3",       1
chn_k "rtime",      1
chn_k "rdiff",      1
chn_k "rmix",       1
chn_k "tmix",       1
chn_k "rpulse",     1
chn_k "rnoise",     1
chn_k "sigclear",   1
chn_k "chnmod",     1
chn_k "tamp1",      1
chn_k "tamp2",      1
chn_k "tamp3",      1
chn_k "tamp4",      1
chn_k "tamp5",      1
chn_k "outamp1",    1
chn_k "outamp2",    1
chn_k "outamp3",    1
chn_k "outamp4",    1
chn_k "outamp5",    1
chn_k "meter1",     2
chn_k "meter2",     2
chn_k "meter3",     2
chn_k "meter4",     2
chn_S "timeshow", 2

;;UDOs
opcode lohiFiltk, a, akk
  aIn, kLowCut, kHighCut xin
  aHighCut clfilt aIn, kHighCut, 0, 10
  aOut clfilt aHighCut, kLowCut, 1, 10
  xout aOut
endop
opcode spigot, k,kk ;pass or block values (similar to pd object)
  kIn, kOnOff xin
  kOut init 0
  if kOnOff == 1 then
    kOut = kIn
  endif
  xout kOut
endop


;;run 11 Oscillators
indx = 0
while indx < 11 do
  schedule "oscilators", 0, 99999
  indx += 1
od


instr oscilators
;;widgets
 ;oscillators widgets
  kGenerate     chnget      "gendata"
  kGenMod       chnget      "gendatamod"
  kPortTime     chnget      "gliss"
  iActive       active      p1
  SonOff        sprintf     "osc%d", iActive
  kOnOff        chnget       SonOff
  ;LFO modulation widgtes
  kDCosc        chnget      "dconoff"
  kPchModul     chnget      "pm"
  kFlModul      chnget      "flm"
  kLFO1         chnget      "lfo1"
  kLFO2         chnget      "lfo2"
  kLFO3         chnget      "lfo3"
  kFrqMin       chnget       "frqmin"
  kFrqMax       chnget       "frqmax"
;;generates Freqs and Amps
  if changed(kGenerate) == 1 && kGenerate == 1 then
    if kGenMod == 0 || (kGenMod == 1 && iActive <= 3) then
      kFrqRnd			random kFrqMin, kFrqMax
      kAmpRnd			random 0.1, 0.5
    endif
  endif 
  if kGenMod == 0 then
    kPortTime = 0 	
  endif
  kAmpPort    portk kAmpRnd, kPortTime/10
  kFrqPort    portk kFrqRnd, kPortTime/10
;;show data in widgets
  SfrqShow    sprintf "frq%d", iActive
  SampShow    sprintf "amp%d", iActive
  kFrqShow    spigot, kFrqPort, metro(8)
  kAmpShow    spigot, kAmpPort, metro(8)
  chnset      kPortTime,  "showgliss"
  chnset      kFrqShow,   SfrqShow
  chnset      kAmpShow,   SampShow
;; on/off OSCs
  kAmp = kAmpPort*kOnOff
;;Pitch Modulation 		
  ;changes freqs: ï¿½ 50-1000 Hz
  iRndSwip random -0.2, 0.2
  iRndRng random 50, 1000
  if kPchModul == 1 then
    kPchOsc lfo iRndRng, kLFO2+iRndSwip, 2
  elseif kPchModul == 0 then
    kPchOsc = 0
  endif
  kFrqPM = kFrqPort+kPchOsc
;;Freq Lock modulation
  if kFlModul == 1 then
  kFrqMiddle = kFrqMin+((kFrqMax-kFrqMin)/2)
    kFrq = phasor:k(kLFO3+iRndSwip) > 0.75 ? 4500 : kFrqPM
  elseif kFlModul == 0 then
    kFrq = kFrqPM
  endif
  chnset kLFO1, "showlfo1" 
  chnset kLFO2, "showlfo2" 
  chnset kLFO3, "showlfo3" 
  chnset kPortTime, "showgliss" 
;;sound generating
  aSound 	vco2 kAmp, kFrq, 2, 0.5
;;DC offset to prevent level loss through multiplication
    if kDCosc == 1 && changed(kDCosc) == 1 then
    kDCfrq random 0.01, 0.1
    endif
  if kDCosc == 0 then
    aDC = a(0.5)
  elseif kDCosc == 1 then
    aDC   lfo   0.5, kLFO1+kDCfrq, 2
  endif
;;send and receive audio for amplitude modulation of signals
  SoutChn 	sprintf "snd%d", iActive
  SinChn 	sprintf "snd%d", iActive-1
  kEnv linseg 0, 2, 1
  aOSC	 = (aSound+aDC)*kEnv
  if iActive == 1 then
    chnmix aOSC, SoutChn
  endif
  aIn chnget SinChn
  chnmix aOSC*aIn, SoutChn
  if iActive == 11 then
    chnmix aOSC*aIn, "sndOut"
  endif
  chnclear SinChn
endin



instr tapeMachine
;inputs
  aInput          chnget      "sndOut"
;reverb widgets
  kRvrbTimeIn     chnget      "rtime"
  kRvrbDiffIn     chnget      "rdiff"
  kRvrbMixIn      chnget      "rmix"
  kPulse          chnget      "rpulse"
  kNoise          chnget      "rnoise"
;amplitude widgets
  kClearSig       chnget      "sigclear"
  kChnSet         chnget      "chnmod"
  kAmp1 = ampdb:k(chnget:k("tamp1")) 
  kAmp2 = ampdb:k(chnget:k("tamp2"))
  kAmp3 = ampdb:k(chnget:k("tamp3")) 
  kAmp4 = ampdb:k(chnget:k("tamp4")) 
  kAmp5 = ampdb:k(chnget:k("tamp5")) 
  kOut1 = ampdb:k(chnget:k("outamp1")) 
  kOut2 = ampdb:k(chnget:k("outamp2"))
  kOut3 = ampdb:k(chnget:k("outamp3")) 
  kOut4 = ampdb:k(chnget:k("outamp4")) 
  kAmp1  port kAmp1, 0.1
;;DC offset block
  aInDC dcblock2 aInput*kAmp1 
;;reverb
  kRvrbTime     port kRvrbTimeIn, 	0.1
  kRvrbDiff     port kRvrbDiffIn, 	0.1
  kRvrbMix     port kRvrbMixIn,	0.1
  if kPulse == 1 then	;sends a short pulse to the reverb
    kPulseFrq rspline 1, 10, 7, 15
    kPulseFlt randomh 800, 5000, 3
    aPuls vco2 0.1, kPulseFrq , 0, 0.2
  endif
     aFb init 0
  if kNoise == 1 then	;sends a short pulse to the reverb
 aNoise noise 30, 0.5
 aNoise = (aNoise*10)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, 0.2
    elseif kNoise == 0 then
    aFb = 0
  endif
  aNoiseSum sum aFb*0.3,aPuls*0.7
  aRvrb          nreverb   aInDC, kRvrbTime, kRvrbDiff
  aRvrbMix       ntrpol    aInDC, (aRvrb+aNoiseSum)/2, kRvrbMix
  clearSignal: 
;;tape feedback
  aRec1B init 0
  aRec2A init 0
  aRec2B init 0
  aRec1A delay aRvrbMix+(aRec1B*kAmp2)+(aRec2A*kAmp3), 0.1
  aRec1B delay (aRec1A*kAmp4)+(aRec2B*kAmp5), 0.07
  aRec2A delay aRec1A, 7.7
  aRec2B delay aRec1B, 7.7
;;output filter
  aFilt1 lohiFiltk aRec1A+aInDC,  k(50), 18000
  aFilt2 lohiFiltk aRec1B+aInDC,  k(50), 18000
  aFilt3 lohiFiltk aRec2A,          k(50), 18000
  aFilt4 lohiFiltk aRec2B,          k(50), 18000
;;clear audio
  if changed(kClearSig) == 1 then
    reinit clearSignal
  endif 
;;outputs
    kOutMix chnget "tmix"
kStartEnv = 1 ;transeg 0, 1, 6, 1
  aOut1       clip     aFilt1*kOut1*kStartEnv, 2, 0.9
  aOut2       clip     aFilt2*kOut2*kStartEnv, 2, 0.9
  aOut3       clip     aFilt3*kOut3*kStartEnv, 2, 0.9
  aOut4       clip     aFilt4*kOut4*kStartEnv, 2, 0.9
  aOutMix1   ntrpol aRvrbMix, aOut1, kOutMix
  aOutMix2   ntrpol aRvrbMix, aOut2, kOutMix
  aOutMix3   ntrpol aRvrbMix, aOut3, kOutMix
  aOutMix4   ntrpol aRvrbMix, aOut4, kOutMix
;;select Channels
  if kChnSet == 0 then       ;mono
    ;outch 1, (aOutMix1+aOutMix2+aOutMix3+aOutMix4)/4
  elseif kChnSet == 1 then   ;stereo
    ;out (aOutMix1+aOutMix3)/2, (aOutMix2+aOutMix4)/2
  elseif kChnSet == 2 then   ;quadrophonic
    ;outs aOutMix1, aOutMix2, aOutMix3, aOutMix4
  endif
 ;;record
  chnmix aOutMix1, "oliv1"
  chnmix aOutMix2, "oliv2"
  chnmix aOutMix3, "oliv3"
  chnmix aOutMix4, "oliv4"
  chnclear "sndOut"
endin




instr bass
kTime init 1 
if metro(1/kTime) == 1 then
kTime random 8, 12
kDur random 2, 4
schedulek "bassplay", 0, kDur
endif
endin

instr bassplay


ktone rspline 0.1, 4, 3, 12
aSound vco2 0.2, ktone, 2, 0.5
iRatio random 10, 50
iFrq random 100, 250
aFilt clfilt aSound, iFrq, 0, iRatio

iAtt random 0.01, 0.02
iRel random 0.4,0.7
aOut linen aFilt, iAtt, p3, iRel
;iCh random 1, 4
iCh RndNoRep 1,5
Schn sprintf "bass%d", iCh
chnmix aOut, Schn

endin
instr pad
kTime init 1 
if metro(1/kTime) == 1 then
kTime random 8, 12
kDur random 3, 7
schedulek "padplay", 0, kTime+kDur
endif
endin

instr padplay

iMod = random:i( 0, 100) > 50 ? 2 : 9 
iShape ftgen 0, 0, 1024, iMod, 1,0, 0.1, 0, 0.4, 0.7, 0.2, 0, 0.3, 0.7

  kamp rspline 0.2, 0.5, .2, .7
  kbrite rspline 0, 4, .2, .7
  ibasfreq random 1, 4
  ioctcnt random 1, 3

  ktone rspline 0.1, 0.32, .1, .3

aSound hsboscil kamp, ktone, kbrite, ibasfreq, iShape, giblend, ioctcnt

iplk random 0.1, 0.9
icps1 random 1, 5
ipick random 0.3, 0.7
irefl random 0.3, 0.8
iLFO random 2, 6
aLFO lfo 0.1, iLFO, 2

aReSound repluck iplk, kamp, icps1, ipick, irefl, aSound+aLFO
kMix rspline 0, 1, .2, 3
aMix ntrpol aSound, aReSound, kMix

aDC dcblock2 aMix

iAtt random 0.5, 2
iRel random 2, 3
aOut linen aDC, iAtt, p3, iRel
;iCh random 1, 4
iCh RndNoRep 1,5
Schn sprintf "pad%d", iCh
chnmix aOut, Schn

endin


instr timer
schedule "record",0,-1
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

instr output
 kOutMaster = ampdb:k(chnget:k("outamp5")) 
aOliv1 chnget "oliv1"
aOliv2 chnget "oliv2"
aOliv3 chnget "oliv3"
aOliv4 chnget "oliv4"

aBass1 chnget "bass1"
aBass2 chnget "bass2"
aBass3 chnget "bass3"
aBass4 chnget "bass4"

aPad1 chnget "pad1"
aPad2 chnget "pad2"
aPad3 chnget "pad3"
aPad4 chnget "pad4"
kRTime rspline 2,3,1,4
kRdiff rspline 0.1, 0.9, 2, 3
kRMix = int(randomh:k( 0, 2, 2))
kRMix port kRMix, 0.05     
aRvrbPad1 = ntrpol:a(aPad1, nreverb:a(aPad1, kRTime, kRdiff), kRMix)
aRvrbPad2 = ntrpol:a(aPad2, nreverb:a(aPad2, kRTime, kRdiff), kRMix)
aRvrbPad3 = ntrpol:a(aPad3, nreverb:a(aPad3, kRTime, kRdiff), kRMix)
aRvrbPad4 = ntrpol:a(aPad4, nreverb:a(aPad4, kRTime, kRdiff), kRMix)

aMix1 = (aOliv1+aBass1+aRvrbPad1)*kOutMaster
aMix2 = (aOliv2+aBass2+aRvrbPad2)*kOutMaster
aMix3 = (aOliv3+aBass3+aRvrbPad3)*kOutMaster
aMix4 = (aOliv4+aBass4+aRvrbPad4)*kOutMaster
  kMeter1  max_k    aMix1, metro(20), 1
  kMeter2  max_k    aMix2, metro(20), 1
  kMeter3  max_k    aMix3, metro(20), 1
  kMeter4  max_k    aMix4, metro(20), 1
  chnset kMeter1,   "meter1"
  chnset kMeter2,   "meter2"
  chnset kMeter3,   "meter3"
  chnset kMeter4,   "meter4"
out (aMix1+aMix3)/2, (aMix2+aMix4)/2

chnmix aMix1, "rcrd1"
chnmix aMix2, "rcrd2"
chnmix aMix3, "rcrd3"
chnmix aMix4, "rcrd4"
chnclear "oliv1", "oliv2", "oliv3", "oliv4"
chnclear "bass1", "bass2", "bass3", "bass4"
chnclear "pad1", "pad2", "pad3", "pad4"

endin

instr record
print 1
aIn1 chnget "rcrd1"
aIn2 chnget "rcrd2"
aIn3 chnget "rcrd3"
aIn4 chnget "rcrd4"
Sarray[] directory "./record", ".wav"
Srecord sprintf "./record/record%d.wav", lenarray(Sarray)+1
fout Srecord, 8, aIn1,aIn2,aIn3,aIn4
chnclear "rcrd1", "rcrd2", "rcrd3", "rcrd4"
endin
 ;schedule "timer",0,-1
 schedule "pad",0,-1
 schedule "bass",0,-1
 schedule "output",0,-1
 schedule "tapeMachine",0,-1
 


</CsInstruments>
<CsScore>
</CsScore>
</CsoundSynthesizer>















<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>136</x>
 <y>153</y>
 <width>1189</width>
 <height>685</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>203</r>
  <g>199</g>
  <b>185</b>
 </bgcolor>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>65</x>
  <y>15</y>
  <width>124</width>
  <height>49</height>
  <uuid>{8759c15f-a28a-4436-a7de-c5eb69c685e2}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>R of IV</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>35</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>45</x>
  <y>65</y>
  <width>312</width>
  <height>613</height>
  <uuid>{f5564aae-da51-42ca-9179-653e9f6dc457}</uuid>
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
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc1</objectName>
  <x>55</x>
  <y>270</y>
  <width>40</width>
  <height>30</height>
  <uuid>{40af4895-cdeb-4f56-a733-a156e9b96a96}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc1</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq1</objectName>
  <x>105</x>
  <y>270</y>
  <width>94</width>
  <height>29</height>
  <uuid>{e870ad90-38c0-48b9-a96c-c05be735c4db}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>5723.80</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>osc2</objectName>
  <x>55</x>
  <y>305</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c03e8efa-319e-4a26-9876-510851e82498}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc2</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq2</objectName>
  <x>105</x>
  <y>305</y>
  <width>94</width>
  <height>29</height>
  <uuid>{5d37af77-811c-40f6-af24-f06fbb7629f7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1435.53</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc3</objectName>
  <x>55</x>
  <y>340</y>
  <width>40</width>
  <height>30</height>
  <uuid>{1a62eee8-2efc-4295-a8c8-2ed65914259a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc3</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq3</objectName>
  <x>105</x>
  <y>340</y>
  <width>94</width>
  <height>29</height>
  <uuid>{8250c871-ac4c-4ed8-9f56-845499bc532b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>6784.02</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc4</objectName>
  <x>55</x>
  <y>375</y>
  <width>40</width>
  <height>30</height>
  <uuid>{ca8be606-c53c-4b39-ac4b-144c25fd6c22}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc4</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq4</objectName>
  <x>105</x>
  <y>375</y>
  <width>94</width>
  <height>29</height>
  <uuid>{112f2bb8-3e93-471e-9446-e9e1919350c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>2947.39</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc5</objectName>
  <x>55</x>
  <y>410</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c6914375-99cf-4d1b-93e1-a3cc371ec6eb}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc5</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq5</objectName>
  <x>105</x>
  <y>410</y>
  <width>94</width>
  <height>29</height>
  <uuid>{b3c13578-4012-4d62-a2e6-68dc60470646}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>6093.76</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc6</objectName>
  <x>55</x>
  <y>445</y>
  <width>40</width>
  <height>30</height>
  <uuid>{215777db-1df3-4b98-b814-2ff9218101ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc6</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq6</objectName>
  <x>105</x>
  <y>445</y>
  <width>94</width>
  <height>29</height>
  <uuid>{228b3ba4-6d35-4bbd-8f98-301b3bb3c72a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>3147.89</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc7</objectName>
  <x>55</x>
  <y>480</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c58b139d-cccc-4a1c-873d-87dfda7839ee}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc7</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq7</objectName>
  <x>105</x>
  <y>480</y>
  <width>94</width>
  <height>29</height>
  <uuid>{98fde23e-6805-484d-a63c-ae92afc15ef9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>1493.08</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc8</objectName>
  <x>55</x>
  <y>515</y>
  <width>40</width>
  <height>30</height>
  <uuid>{af843fed-f93e-4b15-9096-4445da9d0318}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc8</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq8</objectName>
  <x>105</x>
  <y>515</y>
  <width>94</width>
  <height>29</height>
  <uuid>{66c83f26-9dbc-4ece-bed1-2e362b454388}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>2357.21</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc9</objectName>
  <x>55</x>
  <y>550</y>
  <width>40</width>
  <height>30</height>
  <uuid>{7f54cf17-a243-408f-b672-ef87a82974fe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc9</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq9</objectName>
  <x>105</x>
  <y>550</y>
  <width>94</width>
  <height>29</height>
  <uuid>{571a2bde-9059-4374-9dbf-96ff91ecead5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>4070.95</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc10</objectName>
  <x>55</x>
  <y>585</y>
  <width>40</width>
  <height>30</height>
  <uuid>{ba748f72-16dc-437f-95d3-842a35c134df}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc10</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>8</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq10</objectName>
  <x>105</x>
  <y>585</y>
  <width>94</width>
  <height>29</height>
  <uuid>{639d1dbc-b3ed-4442-8be9-610a61ba8792}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>6803.36</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBButton" version="2">
  <objectName>osc11</objectName>
  <x>55</x>
  <y>620</y>
  <width>40</width>
  <height>30</height>
  <uuid>{c437e209-39b4-4bf3-a1f8-5957c9b71d86}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>osc11</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>8</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>frq11</objectName>
  <x>105</x>
  <y>620</y>
  <width>94</width>
  <height>29</height>
  <uuid>{25c06902-a08d-4bb9-8b3e-5546f056dc50}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>5487.63</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>2</precision>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>270</y>
  <width>30</width>
  <height>29</height>
  <uuid>{9a0bff48-6fd3-46a9-af79-0d9d7293dfc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>305</y>
  <width>30</width>
  <height>29</height>
  <uuid>{d2ff2f44-3a0a-4148-adb3-a4e8b04dece0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>340</y>
  <width>30</width>
  <height>29</height>
  <uuid>{90507ab7-85a1-4588-b664-2702cf15db83}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>375</y>
  <width>30</width>
  <height>29</height>
  <uuid>{5b765ed2-8c62-412c-9f93-8c22e32d8b51}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>410</y>
  <width>30</width>
  <height>29</height>
  <uuid>{647972ee-f53a-4f24-a07e-65151738f622}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>445</y>
  <width>30</width>
  <height>29</height>
  <uuid>{a568cdf7-4046-4d19-a90a-35fae203d390}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>480</y>
  <width>30</width>
  <height>29</height>
  <uuid>{26eac5b5-48cd-4734-9d7f-f557e0a00691}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>515</y>
  <width>30</width>
  <height>29</height>
  <uuid>{cd53e0b3-e77a-4b31-aeb2-f275d782933c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>550</y>
  <width>30</width>
  <height>29</height>
  <uuid>{beb15b61-af17-44bf-a8de-97b91d89d948}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>585</y>
  <width>30</width>
  <height>29</height>
  <uuid>{f0ff5183-f9cb-4aa7-9063-fe59f28d8973}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>200</x>
  <y>620</y>
  <width>30</width>
  <height>29</height>
  <uuid>{07d21318-5751-4f60-82cd-6e0ec8ad24c3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>gendata</objectName>
  <x>55</x>
  <y>135</y>
  <width>204</width>
  <height>43</height>
  <uuid>{65ed68b4-a536-4fe8-8752-1dcba23206a7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Rnd Frq / Amp</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>10</fontsize>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp1</objectName>
  <x>235</x>
  <y>270</y>
  <width>60</width>
  <height>29</height>
  <uuid>{01aa02ce-ad3d-4859-9fdd-3ecb3a8b99ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.348</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>270</y>
  <width>50</width>
  <height>29</height>
  <uuid>{f8b1dc2b-0feb-4e35-bb5b-74c126017d41}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp2</objectName>
  <x>235</x>
  <y>305</y>
  <width>60</width>
  <height>29</height>
  <uuid>{9384dc59-4079-42bd-aaef-f056e529be7f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.459</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>305</y>
  <width>50</width>
  <height>29</height>
  <uuid>{26b44fcc-40c1-4c9a-931e-20c697eab196}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp3</objectName>
  <x>235</x>
  <y>340</y>
  <width>60</width>
  <height>29</height>
  <uuid>{da996c72-3973-4070-94cf-e4a8cac0e138}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.324</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>340</y>
  <width>50</width>
  <height>29</height>
  <uuid>{cd59a0b5-b64f-41b4-8f2b-332e088ef5d0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp4</objectName>
  <x>235</x>
  <y>375</y>
  <width>60</width>
  <height>29</height>
  <uuid>{5c86cec3-7a47-474d-9f59-e5d1108648fd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.401</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>375</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5c3c7476-efa3-4db7-b8ae-4c0ac1058cc5}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp5</objectName>
  <x>235</x>
  <y>410</y>
  <width>60</width>
  <height>29</height>
  <uuid>{f51aa24b-e4d8-455e-b064-1276d514b061}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.214</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>410</y>
  <width>50</width>
  <height>29</height>
  <uuid>{48f38195-49dc-402a-86d0-d589d2017402}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp6</objectName>
  <x>235</x>
  <y>445</y>
  <width>60</width>
  <height>29</height>
  <uuid>{6268a547-f365-4bd6-9f2e-069f2d66a278}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.459</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>445</y>
  <width>50</width>
  <height>29</height>
  <uuid>{67d26236-b4b5-4741-8cd8-d1738ac2484f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp7</objectName>
  <x>235</x>
  <y>480</y>
  <width>60</width>
  <height>29</height>
  <uuid>{4bed5bc4-a57f-46cd-a0da-37d83d92f0ba}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.485</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>480</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5da8d131-11bb-48bf-ad4a-285ba4d3a19a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp8</objectName>
  <x>235</x>
  <y>515</y>
  <width>60</width>
  <height>29</height>
  <uuid>{076b35be-1d27-42f5-8d3d-cf9feccd14dd}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.288</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>515</y>
  <width>50</width>
  <height>29</height>
  <uuid>{3b002b2f-60ef-4e54-a497-b8b2a611ea72}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp9</objectName>
  <x>235</x>
  <y>550</y>
  <width>60</width>
  <height>29</height>
  <uuid>{7ca12812-a265-44ad-b21a-7f668199e2c0}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.222</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>550</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5ccb3e92-c512-42ba-8404-fa9dc15d6282}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp10</objectName>
  <x>235</x>
  <y>585</y>
  <width>60</width>
  <height>29</height>
  <uuid>{f38de8cb-a9f6-46d4-97a7-767bc16cd5e4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.162</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>585</y>
  <width>50</width>
  <height>29</height>
  <uuid>{5b4a6b28-f37b-4aa0-a16a-b2cda3782d08}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>amp11</objectName>
  <x>235</x>
  <y>620</y>
  <width>60</width>
  <height>29</height>
  <uuid>{9e66a59a-38ce-4495-81dd-28b917263597}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.412</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
  <precision>3</precision>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="nobackground">
   <r>159</r>
   <g>159</g>
   <b>159</b>
  </bgcolor>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>295</x>
  <y>620</y>
  <width>50</width>
  <height>29</height>
  <uuid>{f77c2666-106c-4322-ab29-bf5688032f54}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Volume</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>start</objectName>
  <x>930</x>
  <y>65</y>
  <width>157</width>
  <height>37</height>
  <uuid>{f170cbde-9b02-4f0f-947e-9501d5225d3a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>event</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>S T A R T</text>
  <image>/</image>
  <eventLine>i "timer" 0 99999</eventLine>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>14</fontsize>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>gendatamod</objectName>
  <x>265</x>
  <y>145</y>
  <width>78</width>
  <height>32</height>
  <uuid>{bd7da968-2660-45cb-aaea-da19432d3d2b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name> all OSCs </name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 3 OSCs</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>gliss</objectName>
  <x>60</x>
  <y>225</y>
  <width>212</width>
  <height>26</height>
  <uuid>{11385011-1c59-4fee-a8a9-61ab4561d815}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.50000000</maximum>
  <value>0.21933962</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>60</x>
  <y>195</y>
  <width>67</width>
  <height>28</height>
  <uuid>{b94ff3bd-6f6c-4ef2-9e80-0668e570eb6b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>gliss time</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>13</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>53</x>
  <y>102</y>
  <width>215</width>
  <height>28</height>
  <uuid>{07a57072-227f-4fcf-bd3a-fc5b9e2cb06b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq: 30 khz - 60 khz  |  Amp: 0.1 - 0.5</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showgliss</objectName>
  <x>280</x>
  <y>220</y>
  <width>61</width>
  <height>29</height>
  <uuid>{02074d67-5c3b-4b70-90b4-0cabef2eef15}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.219</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>128</x>
  <y>196</y>
  <width>136</width>
  <height>26</height>
  <uuid>{a6d084a2-ee25-4e20-8390-45f66687de19}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>(only for 1st-3rd OSCs)</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>51</x>
  <y>73</y>
  <width>103</width>
  <height>29</height>
  <uuid>{7494f0e2-3eb7-4722-b2f3-7f5b89d2ee42}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Freq / Amp</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>190</x>
  <y>31</y>
  <width>295</width>
  <height>31</height>
  <uuid>{9bce112c-8a57-4349-8529-335a382fa45d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>by Parham Izadyar after Pauline Oliveros</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>MS Shell Dlg 2</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>115</y>
  <width>715</width>
  <height>141</height>
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
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>dconoff</objectName>
  <x>390</x>
  <y>160</y>
  <width>145</width>
  <height>35</height>
  <uuid>{c4664ee9-cc7c-44ff-8008-bc70bee67ee4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>DC osc: on/Off</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>265</y>
  <width>716</width>
  <height>244</height>
  <uuid>{c367b88e-6425-449d-8548-fc5580e5fd3e}</uuid>
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
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp1</objectName>
  <x>410</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{24b9a1ba-cb63-45c2-ac86-730d84e7bf29}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>60.00000000</maximum>
  <value>29.46564885</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp2</objectName>
  <x>480</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{d4cf3e8c-6bd5-45ec-8447-2ed7ce6b4ea9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-23.72519084</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp3</objectName>
  <x>525</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{b37e1ccf-264d-4d91-8ca6-f4a040d310cf}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-22.53435115</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp4</objectName>
  <x>600</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{e6e44b51-82ef-4e74-9e18-5e46c6ed049c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-11.81679389</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tamp5</objectName>
  <x>645</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{6cec007c-e5a5-4b5b-8935-dcc6ecedf1c9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-15.78625954</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>sigclear</objectName>
  <x>515</x>
  <y>280</y>
  <width>154</width>
  <height>36</height>
  <uuid>{4a011e6d-cb2a-4585-b5b1-0da149d56612}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Clear tape</text>
  <image>/</image>
  <eventLine/>
  <latch>false</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>385</x>
  <y>465</y>
  <width>78</width>
  <height>24</height>
  <uuid>{96b82d7f-4876-41d8-9a4d-0b898f9d68e1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>input signal</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>470</x>
  <y>465</y>
  <width>97</width>
  <height>41</height>
  <uuid>{c51f3f03-ed9d-4be6-8a50-050619487c27}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rec1B - Rec2A
0.1 sec delay</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>590</x>
  <y>465</y>
  <width>95</width>
  <height>42</height>
  <uuid>{bbcbf5c0-541c-4fbd-9bee-6f1c2dec1e4f}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Rec1A - Rec2B
7.7 sec delay</label>
  <alignment>center</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>375</x>
  <y>285</y>
  <width>56</width>
  <height>30</height>
  <uuid>{390dd754-f256-4e16-80b0-9c462f4398e3}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Tape</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>370</x>
  <y>525</y>
  <width>715</width>
  <height>154</height>
  <uuid>{dd883719-d8e2-4ce4-adbd-cf9c34849761}</uuid>
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
   <r>169</r>
   <g>185</g>
   <b>191</b>
  </bgcolor>
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScope" version="2">
  <objectName/>
  <x>680</x>
  <y>550</y>
  <width>231</width>
  <height>110</height>
  <uuid>{114947ec-d20d-4726-bd41-14eb8dbf9cff}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <value>-255.00000000</value>
  <type>scope</type>
  <zoomx>2.00000000</zoomx>
  <zoomy>1.00000000</zoomy>
  <dispx>1.00000000</dispx>
  <dispy>1.00000000</dispy>
  <mode>0.00000000</mode>
  <triggermode>NoTrigger</triggermode>
 </bsbObject>
 <bsbObject type="BSBController" version="2">
  <objectName>meter1</objectName>
  <x>925</x>
  <y>545</y>
  <width>25</width>
  <height>120</height>
  <uuid>{8b9e85e9-74ab-4266-9c92-2302717378f4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter1</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00130501</xValue>
  <yValue>0.00130501</yValue>
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
 <bsbObject type="BSBController" version="2">
  <objectName>meter2</objectName>
  <x>960</x>
  <y>545</y>
  <width>25</width>
  <height>120</height>
  <uuid>{1f96550a-0c50-41e3-867f-84602c0d3f81}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter2</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00002671</xValue>
  <yValue>0.00002671</yValue>
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
 <bsbObject type="BSBController" version="2">
  <objectName>meter3</objectName>
  <x>995</x>
  <y>545</y>
  <width>25</width>
  <height>120</height>
  <uuid>{510eef34-264e-4af9-b41f-56e0ade644ef}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter3</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00006339</xValue>
  <yValue>0.00006339</yValue>
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
 <bsbObject type="BSBController" version="2">
  <objectName>meter4</objectName>
  <x>1030</x>
  <y>545</y>
  <width>25</width>
  <height>120</height>
  <uuid>{dcd1c848-3645-410e-8cd1-b1a6025f0ece}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <objectName2>meter4</objectName2>
  <xMin>0.00000000</xMin>
  <xMax>1.00000000</xMax>
  <yMin>0.00000000</yMin>
  <yMax>1.00000000</yMax>
  <xValue>0.00004187</xValue>
  <yValue>0.00004187</yValue>
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
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp1</objectName>
  <x>485</x>
  <y>540</y>
  <width>25</width>
  <height>110</height>
  <uuid>{ba4190f8-65b8-4a78-915d-98d83ffbfd9a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-0.29090909</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp2</objectName>
  <x>515</x>
  <y>540</y>
  <width>25</width>
  <height>110</height>
  <uuid>{39c92c71-f70b-4154-bb8b-7c5f1b3642ad}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-1.23636364</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp3</objectName>
  <x>545</x>
  <y>540</y>
  <width>25</width>
  <height>110</height>
  <uuid>{73e6df94-24d9-44ae-8acc-866697712857}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>0.65454545</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp4</objectName>
  <x>575</x>
  <y>540</y>
  <width>25</width>
  <height>110</height>
  <uuid>{58487319-c865-47ce-8487-07d30071fbb1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-0.76363636</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>375</x>
  <y>530</y>
  <width>65</width>
  <height>31</height>
  <uuid>{5860bcf7-7986-47e1-90c7-ee339fc4da0e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>output</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>380</x>
  <y>125</y>
  <width>47</width>
  <height>29</height>
  <uuid>{ea213e68-48b8-45ff-81ee-af2dea09cb59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>LFO</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>18</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>430</x>
  <y>130</y>
  <width>170</width>
  <height>27</height>
  <uuid>{ee4e4f02-9bd7-4092-a553-dd1c929b548b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>(12th osc =  0.1 - 1 Hz )</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>14</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDropdown" version="2">
  <objectName>chnmod</objectName>
  <x>375</x>
  <y>640</y>
  <width>84</width>
  <height>30</height>
  <uuid>{86c97cea-a28f-466c-a748-c9f7d2a252bc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <bsbDropdownItemList>
   <bsbDropdownItem>
    <name> mono</name>
    <value>0</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 2 channels</name>
    <value>1</value>
    <stringvalue/>
   </bsbDropdownItem>
   <bsbDropdownItem>
    <name> 4 channels</name>
    <value>2</value>
    <stringvalue/>
   </bsbDropdownItem>
  </bsbDropdownItemList>
  <selectedIndex>1</selectedIndex>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>lfo1</objectName>
  <x>380</x>
  <y>205</y>
  <width>174</width>
  <height>31</height>
  <uuid>{dc1dfcef-e9c8-4101-9f2e-86ead7de6f00}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.01000000</minimum>
  <maximum>2.00000000</maximum>
  <value>0.14724138</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showlfo1</objectName>
  <x>555</x>
  <y>205</y>
  <width>61</width>
  <height>29</height>
  <uuid>{6cd747d3-4f4d-4b7e-ad52-1e835fafd86b}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.147</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>610</x>
  <y>205</y>
  <width>28</width>
  <height>25</height>
  <uuid>{8583cfb5-8f55-46d5-b454-184844ea6892}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>rpulse</objectName>
  <x>890</x>
  <y>330</y>
  <width>93</width>
  <height>32</height>
  <uuid>{25c280fa-f400-4edd-a0c2-e6ff3f286a24}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Pulse</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>rnoise</objectName>
  <x>890</x>
  <y>365</y>
  <width>93</width>
  <height>32</height>
  <uuid>{f953ed09-9cf7-46df-8e00-250f551a25f1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Noise</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>tmix</objectName>
  <x>1030</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{5198af61-6bb4-499d-8219-1f39c93932d4}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.83206107</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1015</x>
  <y>465</y>
  <width>61</width>
  <height>25</height>
  <uuid>{6f803ea2-6a15-4ec9-bdeb-4f1a8bcc3d4c}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>tape mix</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rtime</objectName>
  <x>755</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{568143cb-3899-4c8d-bfe0-0a34918105fc}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.50000000</minimum>
  <maximum>8.00000000</maximum>
  <value>6.85496183</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rdiff</objectName>
  <x>800</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{bf7d3f03-c6b7-4a2c-af56-01f93da5cd59}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.10000000</minimum>
  <maximum>0.95000000</maximum>
  <value>0.60610687</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>750</x>
  <y>465</y>
  <width>127</width>
  <height>26</height>
  <uuid>{d51abeb2-7c7f-4bb3-91f1-9a96224a190d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>time   -   Size   -   mix</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>rmix</objectName>
  <x>845</x>
  <y>330</y>
  <width>26</width>
  <height>131</height>
  <uuid>{68ee0ee2-7bc3-4c35-87f7-098372325bb9}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.00000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.66412214</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>765</x>
  <y>295</y>
  <width>104</width>
  <height>26</height>
  <uuid>{c699a790-1a0e-4dfa-85f8-ac76adb0d50a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>--- Reverb ---</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>480</x>
  <y>650</y>
  <width>182</width>
  <height>25</height>
  <uuid>{bba16896-c79a-4a8a-b71a-f7dd46a5d85e}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>ch1 - ch2 - ch3 - ch4  -  master</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>12</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBVSlider" version="2">
  <objectName>outamp5</objectName>
  <x>615</x>
  <y>540</y>
  <width>25</width>
  <height>110</height>
  <uuid>{87a71839-9ae2-4629-95f3-b810737fc2ca}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>-40.00000000</minimum>
  <maximum>12.00000000</maximum>
  <value>-40.00000000</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>pm</objectName>
  <x>670</x>
  <y>135</y>
  <width>145</width>
  <height>36</height>
  <uuid>{aebad113-dea4-42ea-bcfc-006a2f413d82}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>Pitch Modul</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBButton" version="2">
  <objectName>flm</objectName>
  <x>670</x>
  <y>175</y>
  <width>145</width>
  <height>36</height>
  <uuid>{546094ef-6f13-4ccd-b878-9d1c35a5b6ed}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <type>value</type>
  <pressedValue>1.00000000</pressedValue>
  <stringvalue/>
  <text>FL Modul</text>
  <image>/</image>
  <eventLine/>
  <latch>true</latch>
  <momentaryMidiButton>false</momentaryMidiButton>
  <latched>false</latched>
  <fontsize>12</fontsize>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>lfo2</objectName>
  <x>820</x>
  <y>140</y>
  <width>174</width>
  <height>31</height>
  <uuid>{ed5452d4-4169-4075-a646-7adef85f639a}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.01000000</minimum>
  <maximum>1.50000000</maximum>
  <value>0.45528736</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showlfo2</objectName>
  <x>995</x>
  <y>140</y>
  <width>61</width>
  <height>29</height>
  <uuid>{6147ca34-3535-4ff6-bdd7-61f998ec10d1}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.455</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1050</x>
  <y>145</y>
  <width>28</width>
  <height>25</height>
  <uuid>{c0d18940-7556-4f0c-a50f-350fd43f5475}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBHSlider" version="2">
  <objectName>lfo3</objectName>
  <x>820</x>
  <y>180</y>
  <width>174</width>
  <height>31</height>
  <uuid>{b60dd3ce-47e6-4905-bc47-900494a8b25d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <minimum>0.01000000</minimum>
  <maximum>1.00000000</maximum>
  <value>0.22620690</value>
  <mode>lin</mode>
  <mouseControl act="jump">continuous</mouseControl>
  <resolution>-1.00000000</resolution>
  <randomizable group="0">false</randomizable>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>showlfo3</objectName>
  <x>995</x>
  <y>180</y>
  <width>61</width>
  <height>29</height>
  <uuid>{54320961-014b-4f2d-a5f5-7a95aa685627}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>0.226</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>17</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>0</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>1050</x>
  <y>185</y>
  <width>28</width>
  <height>25</height>
  <uuid>{5e832c4f-a061-49a2-b9c9-5c322601ce3d}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Hz</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBDisplay" version="2">
  <objectName>timeshow</objectName>
  <x>700</x>
  <y>40</y>
  <width>207</width>
  <height>67</height>
  <uuid>{ff5b6bb5-dc2c-4938-bdbd-d857862cebbe}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>20 : 32</label>
  <alignment>center</alignment>
  <valignment>center</valignment>
  <font>Arial</font>
  <fontsize>50</fontsize>
  <precision>0</precision>
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
 <bsbObject type="BSBLabel" version="2">
  <objectName/>
  <x>645</x>
  <y>60</y>
  <width>49</width>
  <height>26</height>
  <uuid>{089bba5d-e3d2-4553-9cf0-4c349d266001}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>-3</midicc>
  <description/>
  <label>Timer:</label>
  <alignment>left</alignment>
  <valignment>top</valignment>
  <font>Arial</font>
  <fontsize>15</fontsize>
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
  <bordermode>false</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>0</borderwidth>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>frqmin</objectName>
  <x>370</x>
  <y>70</y>
  <width>72</width>
  <height>39</height>
  <uuid>{9cc56f9a-4198-4b7e-afa1-c3a9750640d7}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>22</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>200.00000000</value>
  <resolution>0.00000000</resolution>
  <minimum>200.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
 <bsbObject type="BSBScrollNumber" version="2">
  <objectName>frqmax</objectName>
  <x>450</x>
  <y>70</y>
  <width>72</width>
  <height>39</height>
  <uuid>{576365f4-c62e-436c-ac85-d0d4a8c18876}</uuid>
  <visible>true</visible>
  <midichan>0</midichan>
  <midicc>0</midicc>
  <description/>
  <alignment>left</alignment>
  <font>Arial</font>
  <fontsize>22</fontsize>
  <color>
   <r>0</r>
   <g>0</g>
   <b>0</b>
  </color>
  <bgcolor mode="background">
   <r>255</r>
   <g>255</g>
   <b>255</b>
  </bgcolor>
  <value>8000.00000000</value>
  <resolution>0.00000000</resolution>
  <minimum>200.00000000</minimum>
  <maximum>20000.00000000</maximum>
  <bordermode>true</bordermode>
  <borderradius>1</borderradius>
  <borderwidth>1</borderwidth>
  <randomizable group="0">false</randomizable>
  <mouseControl act=""/>
 </bsbObject>
</bsbPanel>
<bsbPresets>
</bsbPresets>
