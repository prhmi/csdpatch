<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


SFilenames[] directory ".", ".wav"
iWaves lenarray SFilenames
iCnt init 0
until iCnt >= iWaves  do
giLen filelen SFilenames[iCnt]
Sp4 = SFilenames[iCnt]
Sp4    strsub    Sp4, 2
schedule 1,0,giLen,Sp4
	iCnt = iCnt+1
od


instr 1
SIn = p4
aInL,aInR diskin SIn, 1, 0
Swrite sprintf "%s%s","save/",SIn
fout Swrite, 14, aInL,aInR
aout = aInL
out aout,aout
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>613</x>
 <y>93</y>
 <width>320</width>
 <height>240</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
