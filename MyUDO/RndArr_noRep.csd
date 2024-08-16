<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1


seed 0

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


opcode RndRp, i,i[]
iInArr[] xin
iRnd = iInArr[0]
iRead = 0
	until ArrCheck:i(iRnd,iInArr) == 0 do
	iRnd = int(random:i(0,96))
	iRead = (iRead+1) % lenarray(iInArr)
	enduntil
xout iRnd
endop





instr 1

iLenList = 40
iMinRnd = 10
iMaxRnd = 50

if iMaxRnd-iMinRnd < iLenList then
turnoff
endif


iInArr[] 	init  	iLenList
iOutArr[] 	init 		iLenList
iOutArr2[]	init 		iLenList

iRead = 0
iCheck = 0
itrim = 0
while iRead < lenarray(iInArr) do
iInArr[iRead] = int(random:i(iMinRnd,iMaxRnd))
	if ArrCheck:i(iInArr[iRead],iOutArr) == 0 then
	iOutArr[iCheck] = iInArr[iRead]
	iCheck += 1
	itrim += 1
	endif
	iOutArr2 = iOutArr
	iWrite = iCheck
	while iWrite < lenarray(iOutArr2) do
	iOutArr2[iWrite] = RndRp:i(iOutArr2)
	iWrite +=1
	od
	
iRead +=1
od
	trim iOutArr, itrim
iLen1 lenarray iOutArr
iLen2 lenarray iOutArr2
print iLen1,iLen2
	printarray iOutArr, "%.0f", "withou rep but less than list len"
	printarray iOutArr2, "%.0f", "withou rep same as list len"

endin

</CsInstruments>
<CsScore>
i1 0 .1
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
