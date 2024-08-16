<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


opcode strToArr, i[],S
SIn xin
Snote     sprintf "%s ",SIn
iLen strlen SIn
iReadChar = 0
iLenCount = 0
while iReadChar < iLen do
	until strchar(Snote,iReadChar) == 32 do
	iReadChar += 1
	od	
	iReadChar2 = iReadChar+1
			while strchar(Snote,iReadChar2) == 32 do
			iReadChar2 += 1
			iReadChar += 1
			od
iReadChar += 1
iLenCount += 1
od
iArrOut [] init iLenCount

iWrite = 0
iRead = 0
while iRead < iLen do
iCountChr = 0
iStart = iRead 
	until strchar(Snote,iRead) == 32 do
	iRead += 1
	iCountChr += 1
	od	
		Schar     strsub    Snote, iStart, iStart+iCountChr
	if strchar(Schar,0) != 0 then
	inum strtod Schar
	;print inum
	iArrOut [iWrite] = inum
	iWrite += 1
	endif
iRead += 1
od
xout iArrOut
endop

opcode ArrToStrg, S,i[]
  iArrIn [] xin
  Sprint init ""
  indx = 0
  while indx < lenarray(iArrIn) do
    Sscale     sprintf "%d ",iArrIn[indx]
    Sprint strcat Sprint, Sscale
  indx += 1
  od
  xout Sprint
endop

opcode ArrTala, i[], i[]
 iInArr[] xin
 iTalaCount = 1
 iLen lenarray iInArr
 iOutArr [] init iLen
 iRead = 0
 iWrite = iTalaCount
 while iRead < iLen do
 	iOutArr [iRead] = iInArr[iWrite]
	iRead +=1
	iWrite = (iWrite+1)% iLen
 od
 iTalaCount += 1
 xout iOutArr
endop


instr 1
iArr[] fillarray 1,2,3,4,5
Sarr ArrToStrg iArr
schedule 2, 0, 1,Sarr
endin

instr 2
SarrIn = p4
iArrIn[] strToArr SarrIn
printarray iArrIn, "%d"
iArrOut[] strToArr SarrIn
schedule 3, 0, 1,SarrIn
turnoff
endin

instr 3
SarrIn = p4
iArrIn[] strToArr SarrIn
iArrOut[] ArrTala iArrIn
SarrOut ArrToStrg iArrOut
schedule 2, 1, 1, SarrOut
turnoff
endin

</CsInstruments>
<CsScore>
i1 0 999
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
