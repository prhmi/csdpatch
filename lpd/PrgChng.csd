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

giPrgArr[] init 32
giIndx init 0

zakinit 1, 32


instr GetMidi
kstatus, kchan, kdata1, kdata2 midiin 
if kstatus == 192 then
	schedulek "Counter", 0, 0.1,kdata1
endif
endin

instr Counter
iDur = 1.5
iPrgNum = p4
giPrgRepArr[] init 2
iIndxK = iPrgNum
iWriteInstr nstrnum "Write"
iWriteInstr += iIndxK/100
	iTrig = 0
	indx = 0
	while indx < lenarray(giPrgArr) do
		if giPrgArr[indx] == iPrgNum then
		iTrig = 1
		endif 
	indx += 1
	od
	if iTrig == 1 then
	schedule "endTime", 0, 0.1, iPrgNum, iIndxK
	turnoff
	elseif iTrig == 0 then
		indx = 0 
		iTurnoff = 1
		while indx < lenarray(giPrgArr) do
			if giPrgArr[indx] == 0 then
			iTurnoff = 0
			endif
		indx += 1
		od
		if iTurnoff == 1 then
		turnoff
		elseif iTurnoff == 0 then
		schedule iWriteInstr, 0, iDur, iPrgNum, iIndxK
		endif
	endif
endin


instr Write
iActive active "Write"
iIndx = giIndx
while giPrgArr[iIndx] != 0 do
iIndx = (iIndx+1) % lenarray(giPrgArr)
od
iPrgNum = p4
giPrgArr[iIndx] = iPrgNum
giIndx = (giIndx+1) % lenarray(giPrgArr)
if release() == 1 then
schedulek "Remove", 0, 1, iIndx
endif
iIndxK = p5
kStartTime line 0, 1, 1
zkw kStartTime, iIndxK
print 0
endin

instr Remove
giIndx = p4
giPrgArr[p4] = 0
endin

instr endTime
iIndxK = p5
;print 2
kStartTime zkr iIndxK
;if metro(0) == 1 then
printks "number = %d time = %0.3f\n", 1,  k(p5), kStartTime
	if kStartTime <= 0.4 then
	
	elseif kStartTime > 0.4 && kStartTime < 1 then
	
	elseif kStartTime >= 1 then
	
	endif
;print p5
;endif
iWriteInstr nstrnum "Write"
iWriteInstr += iIndxK/100
turnoff2 iWriteInstr,4,0
iPrgNum = p4
indx = 0
while indx < lenarray(giPrgArr) do
if giPrgArr[indx] == iPrgNum then
indxOut = indx
endif
indx += 1
od
schedule "Remove", 0, 1, indxOut
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
