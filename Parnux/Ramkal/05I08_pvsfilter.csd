<CsoundSynthesizer>
<CsOptions>
-odac --env:SSDIR+=../../SourceMaterials
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 1
0dbfs = 1

;store the samples in function tables (buffers)
gifilA    ftgen     0, 0, 0, 1, "parhum.wav", 0, 0, 1
gifilB    ftgen     0, 0, 0, 1, "delhum.wav", 0, 0, 1

;general values for the pvstanal opcode
giamp     =         1 ;amplitude scaling
gipitch   =         1 ;pitch scaling
gidet     =         0 ;onset detection
giwrap    =         1 ;loop reading
giskip    =         0 ;start at the beginning
gifftsiz  =         1024 ;fft size
giovlp    =         gifftsiz/4 ;overlap size
githresh  =         5 ;threshold
giSine		ftgen		0, 0, 4096, 10, 1

instr 1
kFrq randomh 200, 1200, 1
ain2		buzz	.8, kFrq, 50, giSine
fsigA		pvsanal	ain2, gifftsiz, giovlp, gifftsiz, 1

;filters "fox.wav" (half speed) by the spectrum of the viola (double speed)
;fsigA     pvstanal  1, 1, gipitch, gifilA, gidet, giwrap, giskip,\
 ;                    gifftsiz, giovlp, githresh
fsigB     pvstanal  1, 1, gipitch, gifilB, gidet, giwrap, giskip,\
                     gifftsiz, giovlp, githresh
                     
fScaleA   pvscale fsigA, 1  
fScaleB   pvscale fsigB, 1       
fmorph		pvsmorph fScaleB, fScaleA, 0, 1       
;fFilt     pvsfilter fScaleA, fScaleB, 1
aout      pvsynth   fmorph
;aout      pvsadsyn	fmorph, 50, 1, 30
aenv      clip     aout, 1, 0.2
          out       aenv
          
          fout "record.wav", 8, aenv
endin

</CsInstruments>
<CsScore>
i 1 0 90
</CsScore>
</CsoundSynthesizer>
;example by joachim heintz














<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>0</x>
 <y>0</y>
 <width>0</width>
 <height>0</height>
 <visible>true</visible>
 <uuid/>
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
