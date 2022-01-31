<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1




giIndx init 0

instr 1
schedule 2, 0, 1
gaAmp linseg 0, 2,0, 5, 0
gaAmp2 linseg 1,23,1,.5,1
index = 0
;Stype = "we would be revealed only in extremis"
Stype = "you and me are the same"
;iString strchar Stype
iLen       strlen     Stype 
giTypeArr [] init iLen	
while index < iLen do
ichr       strchar    Stype, index
giTypeArr [index]  = ichr
index += 1
od
;printarray iTypeArr, "%.f"
print giIndx

endin


instr 2
iChar = giTypeArr [giIndx]
iMorseArr_A [] fillarray 1,2
iMorseArr_B [] fillarray 2,1,1,1
iMorseArr_C [] fillarray 2,1,2,1
iMorseArr_D [] fillarray 2,1,1
iMorseArr_E [] fillarray 1
iMorseArr_F [] fillarray 1,1,2,1
iMorseArr_G [] fillarray 2,2,1
iMorseArr_H [] fillarray 1,1,1,1
iMorseArr_I [] fillarray 1,1
iMorseArr_J [] fillarray 1,2,2,2
iMorseArr_K [] fillarray 2,1,2
iMorseArr_L [] fillarray 1,2,1,1
iMorseArr_M [] fillarray 2,2
iMorseArr_N [] fillarray 2,1
iMorseArr_O [] fillarray 2,2,2
iMorseArr_P [] fillarray 1,2,2,1
iMorseArr_Q [] fillarray 2,2,1,2
iMorseArr_R [] fillarray 1,2,1
iMorseArr_S [] fillarray 1,1,1
iMorseArr_T [] fillarray 2
iMorseArr_U [] fillarray 1,1,2
iMorseArr_V [] fillarray 1,1,1,2
iMorseArr_W [] fillarray 1,2,2
iMorseArr_X [] fillarray 2,1,1,2
iMorseArr_Y [] fillarray 2,1,2,2
iMorseArr_Z [] fillarray 2,2,1,1

if iChar == 97 then
giMorseArr [] = iMorseArr_A
elseif iChar == 98 then
giMorseArr [] = iMorseArr_B
elseif iChar == 99 then
giMorseArr [] = iMorseArr_C
elseif iChar == 100 then
giMorseArr [] = iMorseArr_D
elseif iChar == 101 then
giMorseArr [] = iMorseArr_E
elseif iChar == 102 then
giMorseArr [] = iMorseArr_F
elseif iChar == 103 then
giMorseArr [] = iMorseArr_G
elseif iChar == 104 then
giMorseArr [] = iMorseArr_H
elseif iChar == 105 then
giMorseArr [] = iMorseArr_I
elseif iChar == 106 then
giMorseArr [] = iMorseArr_J
elseif iChar == 107 then
giMorseArr [] = iMorseArr_K
elseif iChar == 108 then
giMorseArr [] = iMorseArr_L
elseif iChar == 109 then
giMorseArr [] = iMorseArr_M
elseif iChar == 110 then
giMorseArr [] = iMorseArr_N
elseif iChar == 111 then
giMorseArr [] = iMorseArr_O
elseif iChar == 112 then
giMorseArr [] = iMorseArr_P
elseif iChar == 113 then
giMorseArr [] = iMorseArr_Q
elseif iChar == 114 then
giMorseArr [] = iMorseArr_R
elseif iChar == 115 then
giMorseArr [] = iMorseArr_S
elseif iChar == 116 then
giMorseArr [] = iMorseArr_T
elseif iChar == 117 then
giMorseArr [] = iMorseArr_U
elseif iChar == 118 then
giMorseArr [] = iMorseArr_V
elseif iChar == 119 then
giMorseArr [] = iMorseArr_W
elseif iChar == 120 then
giMorseArr [] = iMorseArr_X
elseif iChar == 121 then
giMorseArr [] = iMorseArr_Y
elseif iChar == 122 then
giMorseArr [] = iMorseArr_Z
elseif iChar == 32 then
giMorseArr [] fillarray 5
endif


schedule 3,0.3,999,iChar

printarray giMorseArr, "%.f"
endin

instr 3

kTime init 0
kMorseIndx init 0
if metro(1/kTime) == 1 then
kTime = (giMorseArr [kMorseIndx])/8
schedulek 4, 0, kTime*.5,p4
kMorseIndx += 1
endif

if kMorseIndx == lenarray(giMorseArr) && changed(kMorseIndx) == 1 then

giIndx += 1
schedulek 2,0,1
turnoff
endif
;printk2 kMorseIndx

endin


instr 4

if p4 == 32 then
iAmp = 0
else
iAmp = 1
endif
print p3
aSound1 poscil gaAmp, 1100

StapArr [] fillarray "t1.wav","t2.wav","t3.wav","t4.wav","t5.wav","t6.wav","t7.wav",
"t8.wav","t9.wav","t10.wav","t11.wav","t12.wav","t13.wav"
aSound2 diskin2 "t1.wav", 1,0
aSound2 = aSound2* gaAmp2
aSound sum aSound1,aSound2
iAtt = 0.01
iTest = (p3-iAtt)-(iAtt*2)
aEnv linseg 0,iAtt,iAmp,(p3-iAtt)-(iAtt*2),iAmp,iAtt,0
aout = aSound*aEnv
out aout,aout
endin

instr 5
aInL,aInR monitor
fout "sinetp.wav", 8, aInL
endin

</CsInstruments>
<CsScore>
i 1 0 999
i 5 0 999
;i 2 0 7
</CsScore>
</CsoundSynthesizer>
<bsbPanel>
 <label>Widgets</label>
 <objectName/>
 <x>100</x>
 <y>100</y>
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
