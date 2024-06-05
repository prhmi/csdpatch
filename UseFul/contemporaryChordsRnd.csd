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

instr 1
	indx = 0
	while indx < 5 do
	schedule 2, 0, 1, indx+1
	indx += 1
	od
endin


instr 2
SNoteArray[] fillarray "E", "F", "bG", "bA", "bbB", "C", "D", "E"
	if p4 <= 4 then
	iLenChord = 3
;	SfileName sprintf "%dth.txt", p4+1
	SfileName = "contemporaryChordsRnd.txt"
	elseif p4 == 5 then
	iLenChord = 4
	SfileName = "contemporaryChordsRnd.txt"
	endif
SnoteWriteArr[] init 4
iLen lenarray SNoteArray
	indx = 0
	while indx < iLen-1 do
	Snotes = SNoteArray[indx]
	indxChord = 0
	indxWrite = indx
		if p4 <= 4 then
		iRndChord = p4
		elseif p4 == 5 then
		iRndChord = int(random:i(1,5))
		endif
		while indxChord < iLenChord do
		Snotes = SNoteArray[indxWrite]
		SnoteWriteArr[indxChord] = Snotes
		indxWrite = (indxWrite+iRndChord) % (iLen-1)
		indxChord += 1
		od
	SnoteString1 = SnoteWriteArr[0]
	SnoteString2 = SnoteWriteArr[1]
	SnoteString3 = SnoteWriteArr[2]
	SnoteString4 = SnoteWriteArr[3]
	SNoteString sprintf "%s	%s	%s	%s", SnoteString1,SnoteString2,SnoteString3,\
	SnoteString4
	fprints SfileName, "%d:	%s \n", indx+1, SNoteString
	indx += 1
	od
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
 <bgcolor mode="background">
  <r>240</r>
  <g>240</g>
  <b>240</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
