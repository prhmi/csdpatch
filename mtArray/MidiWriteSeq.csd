<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giArrNote [] init 4
giArrEmpty [] init lenarray:i(giArrNote)
giWriteNote  init 0



opcode RmvZ, i[],i[]
iArrIn[] xin
iLen lenarray iArrIn
indxc = 0
iLenA = 0
while indxc < iLen do
	if iArrIn[indxc] != 0 then
	iLenA += 1
	endif
indxc += 1
od
		if iLenA == 0 then
		iLenA = 1
		endif
iArrOut [] init iLenA
indx = 0
indxw = 0
while indx < iLen do
	if iArrIn[indx] != 0 then
	iArrOut [indxw] = iArrIn[indx]
	indxw += 1
	endif
indx += 1
od
xout iArrOut
endop


instr GetMidi ;1
 iActive1 active 1
 iHold = 1
 kRel release
 iNum notnum
 iVel veloc 0,127
  if iActive1 == 1 then
 		giArrNote [] = giArrEmpty
  		giWriteNote = 0
  endif
 schedule 2,0,.001,iNum,iVel
 	if kRel == 1 && changed(kRel) == 1 && iHold == 0 then
 	schedulek 2, 0, .001,iNum,0
 	endif
endin
instr WriteMidi ;2
 iActive1 active 1
 iNote = p4
 iVel = p5
 iLen lenarray giArrNote
 ;prints "note: %d, veloc: %d\n", iNote,iVel
 if iVel != 0 then
 
 					indxr = 0
 					iCountZero = 0
					while indxr < iLen do
						if giArrNote [indxr] != 0 then
						iCountZero += 1
						endif
					indxr += 1
					od
		if iCountZero != iLen then
			while giArrNote [giWriteNote] != 0 do
			giWriteNote = (giWriteNote+1) % iLen
			od
		else
			giWriteNote = (giWriteNote+1) % iLen
		endif
 giArrNote [giWriteNote] = iNote
 ;giWriteNote = (giWriteNote+1) % iLen
 elseif iVel == 0 then
		indxw = 0
		while indxw < iLen do
			if giArrNote [indxw] == iNote then
			giArrNote [indxw] = 0
			giWriteNote = indxw-1
			endif
		indxw += 1
		od
 giWriteNote = (giWriteNote-1) <= 0 ? 0 : giWriteNote
 ;print giWriteNote
 endif
			if iActive1 == 0 then
			giWriteNote = 0
			endif
 giNote [] RmvZ giArrNote
 printarray giArrNote,"%d", "Array:"
 printarray giNote,"%d","Note:"
endin


</CsInstruments>
<CsScore>
;i1 0 1
;i 2 0 999
</CsScore>
</CsoundSynthesizer>


<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>609</x>
 <y>191</y>
 <width>400</width>
 <height>300</height>
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
