<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


massign 0, 0

giCCArr[] init 6
giCCIndx init 0


instr GetMidi
kstatus, kchan, kdata1, kdata2 midiin
if kstatus == 176 then
	if kdata1 >= 51 && kdata1 <= 80 then
		if kdata2 != 0 then
		schedulek "SepCC", 0, 0.1, kdata1
		endif
	elseif  kdata1 >= 81 && kdata1 <= 88 then
		if kdata2 != 0 then
		kdata2 = 1
		endif
	schedulek "CConOff", 0, 0.1, kdata1,kdata2
	endif
endif
endin


instr SepCC
iCCnum = p4
iIndx = giCCIndx
iTurnOff = 0
	indx = 0
	while indx < lenarray(giCCArr) do
		if giCCArr[indx] == iCCnum then
		giCCArr[indx] = 0
		iCConOff = 0
		giCCIndx = indx
		iTurnOff = 1
		endif 
	indx += 1
	od
if iTurnOff == 0 then
		indx = 0 
		iSkip = 1
		while indx < lenarray(giCCArr) do
			if giCCArr[indx] == 0 then
			iSkip = 0
			endif
		indx += 1
		od
	if iSkip == 0 then
		while giCCArr[iIndx] != 0 do
		iIndx = (iIndx+1) % lenarray(giCCArr)
		od
	giCCArr[iIndx] = iCCnum
	iCConOff = 1
	giCCIndx = (giCCIndx+1) % lenarray(giCCArr)
	endif
endif
schedule "CConOff", 0, 0.1, iCCnum,iCConOff
;printarray giCCArr, "%d"
endin


instr CConOff
print p4,p5
endin

</CsInstruments>
<CsScore>
i 1 0 9999 
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
