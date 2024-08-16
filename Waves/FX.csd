<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


gisine		ftgen	0,0,4096,10,1


opcode PchSh,aa,aakkik
aInL, aInR, kPitch, kTimb, iFFTsize,kMixPch xin
 ioverlap = iFFTsize/4
 ;;Pitch Left
 fSoundL pvsanal aInL, iFFTsize, ioverlap, iFFTsize, 1
 fTempL pvscale fSoundL, cent(kTimb), 1
 fTransposeL pvscale fTempL, cent(kPitch)
 aOutL pvsynth fTransposeL
 ;;Pitch Right
 fSoundR pvsanal aInR, iFFTsize, ioverlap, iFFTsize, 1
 fTempR pvscale fSoundR, cent(kTimb), 1
 fTransposeR pvscale fTempR, cent(kPitch)
 aOutR pvsynth fTransposeR
 	aMixL		ntrpol		aInL, aOutL, kMixPch
	aMixR		ntrpol		aInR, aOutR, kMixPch
	
xout aMixL,aMixR
endop
 
 
 
 opcode FrqSh,aa,aakk
aInL,aInR,kFrq,kMixFrq xin
	;;FrqLeft		
	aRealL, aImagL hilbert aInL			
	aSinL 	oscili       1,    kFrq,     gisine,           0
	aCosL 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1L	=		aRealL * aCosL
	aMod2L =		aImagL * aSinL	
	aFSL	= (aMod1L - aMod2L)
	aOutL	= aFSL
	;;FrqRight		
	aRealR, aImagR hilbert aInR		
	aSinR 	oscili       1,    kFrq,     gisine,           0
	aCosR 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1R	=		aRealR * aCosR
	aMod2R =		aImagR * aSinR	
	aFSR	= (aMod1R - aMod2R)
	aOutR	= aFSR
	aMixL		ntrpol		aInL, aOutL, kMixFrq
	aMixR		ntrpol		aInR, aOutR, kMixFrq
xout aMixL,aMixR
endop


opcode RngMd, aa,aaki
aInL, aInR,kFrq,iMixRng xin 
aRing poscil 1, kFrq
aOutL = aInL*aRing
aOutR = aInR*aRing
	aMixL		ntrpol		aInL, aOutL, iMixRng
	aMixR		ntrpol		aInR, aOutR, iMixRng
xout aMixL,aMixR
endop  



instr 1
aIn diskin2 "fox.wav", 1, 0, 0
kPitch = 100 ;linseg 0, p3, 100 ;cent
kTimb  linseg 0, p3, 500
iFFTSize = 1024
kMixPch = 1
aOutL, aOutR PchSh aIn, aIn, kPitch, kTimb, iFFTSize,kMixPch
out aOutL, aOutR
endin


instr 2
aIn diskin2 "fox.wav", 1, 0, 0
kFrq linseg 0, p3, 500
kMixFrq = 1
aOutL, aOutR FrqSh aIn, aIn, kFrq,kMixFrq
out aOutL, aOutR
endin


instr 3
aIn diskin2 "fox.wav", 1, 0, 0
kFrq linseg 500, p3, 600 
iMixRng = 0.7
aOutL, aOutR RngMd aIn, aIn, kFrq,iMixRng
out aOutL, aOutR
endin



</CsInstruments>
<CsScore>
i1 0 3
i2 4 3
i3 8 3
</CsScore>
</CsoundSynthesizer>




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
