<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1

seed 0
gisine		ftgen	0,0,4096,10,1	



opcode tuner, k,aai
aInL, aInR,iFFTsize xin 
 kFrq, kamp 	ptrack 		(aInL+aInR), iFFTsize
xout kFrq
endop



opcode PchSh,aa,aakii
aInL, aInR, kPitch, iFFTsize,iMixPch xin

 ioverlap = iFFTsize/8
 iDelay = ((iFFTsize/4096)*0.1)+0.01
 ;;Pitch Left
 fSoundL pvsanal aInL, iFFTsize, ioverlap, iFFTsize, 1
 fTransposeL pvscale fSoundL, cent(kPitch)
 aOutL pvsynth fTransposeL
 ;;Pitch Right
 fSoundR pvsanal aInR, iFFTsize, ioverlap, iFFTsize, 1
 fTransposeR pvscale fSoundR, cent(kPitch)
 aOutR pvsynth fTransposeR
 aDelL delay aInL, iDelay
 aDelR delay aInL, iDelay
 	aMixL		ntrpol		aDelL, aOutL, iMixPch
	aMixR		ntrpol		aDelR, aOutR, iMixPch
	
xout aMixL,aMixR
endop
 
 
 
 opcode FrqSh,aa,aakii
aInL,aInR,kFrq,iFB,iMixFrq xin
	aFS	init	0
	aSndL	=	aInL + (aFS * iFB)			
	aRealL, aImagL hilbert aSndL			
	aSinL 	oscili       1,    kFrq,     gisine,           0
	aCosL 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1L	=		aRealL * aCosL
	aMod2L =		aImagL * aSinL	
	aFSL	= (aMod1L - aMod2L)
	aOutL	= aFSL
	
		aSndR	=	aInR + (aFS * iFB)			
	aRealR, aImagR hilbert aSndR		
	aSinR 	oscili       1,    kFrq,     gisine,           0
	aCosR 	oscili       1,    kFrq,     gisine,           0.25	
	aMod1R	=		aRealR * aCosR
	aMod2R =		aImagR * aSinR	
	aFSR	= (aMod1R - aMod2R)
	aOutR	= aFSR
	aMixL		ntrpol		aInL, aOutL, iMixFrq
	aMixR		ntrpol		aInR, aOutR, iMixFrq
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

opcode Resns, aa,aakkii
aInL, aInR,kFrq,kbw,iAmpResDB,iMixRsns xin 

aResL reson aInL,kFrq, kbw
aResR reson aInR,kFrq, kbw
if iAmpResDB > -30 then
iAmpResDB = -30
endif
iAmp ampdb iAmpResDB
aOutL = aResL*iAmp
aOutR = aResR*iAmp
	aMixL		ntrpol		aInL, aOutL, iMixRsns
	aMixR		ntrpol		aInR, aOutR, iMixRsns
xout aMixL,aMixR
endop





opcode ArrCheck, i, ii[]
 iEl, iArr[] xin
 iRes = 0
 indx = 0
 while indx < lenarray:i(iArr) do
  if iEl == iArr[indx] then
   iRes = 1
   igoto end
  endif
  indx += 1
 od
 end:
 xout iRes
endop


opcode RndRp, i,i[]ii
iInArr[],iMin,iMax xin
iRnd = iInArr[0]
iRead = 0
	until ArrCheck:i(iRnd,iInArr) == 0 do
	iRnd = int(random:i(iMin,iMax))
	iRead = (iRead+1) % lenarray(iInArr)
	enduntil
xout iRnd
endop

opcode RndArrN, i[],iii
iLen,iMin,iMax xin

iInArr [] init  iLen
iOutArr [] init iLen
iOutArr2 [] init iLen

iRead = 0
iCheck = 0
itrim = 0
while iRead < lenarray(iInArr) do
iInArr [iRead] = int(random:i(iMin,iMax))
	if ArrCheck:i(iInArr[iRead],iOutArr) == 0 then
	iOutArr[iCheck] = iInArr [iRead]
	iCheck += 1
	itrim += 1
	endif
	iOutArr2 = iOutArr
	iWrite = iCheck
	while iWrite < lenarray(iOutArr2) do
	iOutArr2 [iWrite] = RndRp:i(iOutArr2,iMin,iMax)
	iWrite +=1
	od
	
iRead +=1
od
	trim iOutArr, itrim

xout iOutArr2
endop




instr 1
SFilenames[] directory ".", ".wav"
iWavesNumber lenarray SFilenames
iWavParts = 0
iArrNumber [] genarray iWavParts,iWavParts+300
;printarray iArrNumber,"%.f"
iLenParts lenarray iArrNumber
iFXnumber = iLenParts/3
iArrFX1 [] RndArrN iFXnumber,iWavParts,iWavParts+300
iArrFX2 [] sorta iArrFX1

iCnt = 0
iRead = 0
until iCnt >= iLenParts do; iLenParts  do
iLenWav filelen SFilenames[iCnt+iWavParts]
Sp4 = SFilenames[iCnt+iWavParts]
Sp4    strsub    Sp4, 2
iSr filesr Sp4
if iArrNumber[iCnt] == iArrFX2[iRead] then
schedule 2,0,iLenWav,Sp4,iCnt
iRead += 1
 if iRead == lenarray(iArrFX2) goto skip
endif
	iCnt = iCnt+1
od
skip:
turnoff 
endin


instr 2
Sname = p4
aInL,aInR diskin Sname, 1, 0

iPchSh_byps = 0 ;int(random:i(0,2))
iFrqSh_byps = 0 ;int(random:i(0,2))
iRngMd_byps = 0 ;nt(random:i(0,2))
iResns_byps = 1 ;int(random:i(0,2))


tuner:
iFFTsize = 1024
kTune tuner aInL,aInR,iFFTsize

shp:
if iPchSh_byps == 0 goto shf
iPitch  random 10, 60
kPitch  = jspline:k(5, 2,7) + iPitch; kTune * iPitch
iMixPch = .4
aOutL,aOutR PchSh, aInL,aInR, kPitch,iFFTsize,iMixPch
;if iFrqSh_byps == 0 && iRngMd_byps == 0 && iResns_byps = 0 goto skip

shf:
if iFrqSh_byps == 0 goto rng
if iPchSh_byps == 1 then
aInL = aOutL
aInR = aOutR
endif
iFrq random 200, 800
kFrq = jspline:k(7,2,7) + iFrq
iFB = .4
iMixFrq = 1
aOutL,aOutR FrqSh, aInL,aInR, kFrq,iFB,iMixFrq

rng:
if iRngMd_byps == 0 goto resns
if iPchSh_byps == 1 || iFrqSh_byps == 1 then
aInL = aOutL
aInR = aOutR
endif

iFrqRng random 400, 800
kFrqRng = jspline:k(10,2,5)+iFrqRng
iMixRng random 0, 0.7
print iMixRng
aOutL,aOutR RngMd, aInL,aInR, kFrqRng,iMixRng



resns:
if iResns_byps == 0 goto skip
if iPchSh_byps == 1  then
aInL = aOutL
aInR = aOutR
endif
iFrqRsn random 500, 1500
kFrqRes = jspline:k( 10, 7,12) + iFrqRsn
kbw random 1, 3
iMixRsns  random 0, 0.2
iAmpResDB = -40
aOutL,aOutR Resns, aInL,aInR, kFrqRes,kbw,iAmpResDB,iMixRsns


skip:
 
 iMix = 1
 	amixL		ntrpol		aInL, aOutL, iMix
	amixR		ntrpol		aInR, aOutR, iMix	
 
ibits filebit Sname
if ibits == 16 then
iBitWrite = 14
elseif ibits == 24 then
iBitWrite = 8
elseif ibits == 32 then
iBitWrite = 25
endif

;;recording
iCnt = p5
SaduioL sprintf "%s%d","audioL",iCnt+1
SaduioR sprintf "%s%d","audioR",iCnt+1
chnmix amixL, SaduioL
chnmix amixR, SaduioR

if iPchSh_byps == 1 then
iDelay = ((iFFTsize/4096)*0.1)
else
iDelay = 0
endif
schedule 3,iDelay,p3,Sname,SaduioL,SaduioR,iBitWrite



;;hearing
iAmp = 0.7
aoutputL = amixL*iAmp
aoutputR = amixR*iAmp
out aoutputL,aoutputR

endin

instr 3
Sname = p4
SaduioL = p5
SaduioR = p6
aInL chnget SaduioL
aInR chnget SaduioR
Swrite sprintf "%s%s","save/",Sname
iBitWrite = p7
fout Swrite, iBitWrite, aInL,aInR
chnclear SaduioL
chnclear SaduioR
endin
</CsInstruments>
<CsScore>
i1 0 1
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
 <bgcolor mode="nobackground">
  <r>255</r>
  <g>255</g>
  <b>255</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
