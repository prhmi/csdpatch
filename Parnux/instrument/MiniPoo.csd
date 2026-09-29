/*
Minipoo — a synthesizer tuned to Persian dastgah scales.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2021.
parhamizadyar.net
*/
<Cabbage> 
form caption("MiniPoo") size(430, 220)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("mnpo")
;image bounds(0, 0, 430, 200) channel("img") file("MiniPoo.jpg")
gentable bounds(314, 6, 103, 81), tableNumber(1.0), , , , ampRange(0.0, 1.0, 1.0, 0.0100) active(1)  tableGridColour(87, 62, 84, 255) tableBackgroundColour(58, 31, 55, 255) tableColour:0(142, 122, 159, 255)
combobox bounds(20, 38, 47, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2) colour(61, 46, 70, 255)
combobox bounds(20, 10, 105, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2)  colour(61, 46, 70, 255)
combobox bounds(326, 96, 77, 25) text("Instr", "Dahina", "Wood", "Tibetan", "Albert", "Pick", "VCO") channel("instr") value(2) colour(61, 46, 70, 255)
rslider bounds(10, 98, 45, 45) channel("att") colour(72, 200, 250, 255) range(1, 500, 1, 1, 1) text("Att") trackerColour(250, 150, 250, 255) 
rslider bounds(56, 98, 45, 45) channel("dec") colour(250, 200, 250, 250) range(0.01, 1, 0.5, 1, 0.0001) text("Dec") trackerColour(250, 150, 250, 255) 
rslider bounds(102, 98, 45, 45) channel("sus") colour(250, 200, 250, 250) range(0, 1, 0, 1, 0.0001) text("Sus") trackerColour(250, 150, 250, 255) 
rslider bounds(148, 98, 45, 45) channel("rel") colour(250, 200, 250, 250) range(0.01, 2, 0.3, 1, 0.0001) text("Rel") trackerColour(250, 150, 250, 255) 
rslider bounds(144, 18, 50, 50) channel("fltr") colour(250, 200, 250, 250) range(7, 15, 8, 1, 0.1) text("Filt") trackerColour(250, 150, 250, 255)
button bounds(210, 8, 20, 20) channel("vbr") colour:0(100, 100, 100, 250) colour:1(250, 200, 250, 250) text(" ")
rslider bounds(208, 30, 45, 45) channel("rng") colour(250, 200, 250, 250) range(0, 20, 2, 1, 0.1) text("Rng") trackerColour(250, 150, 250, 255) 
rslider bounds(254, 30, 45, 45) channel("spd") colour(250, 200, 250, 250) range(0.5, 3, 1, 1, 0.1) text("Spd") trackerColour(250, 150, 250, 255) 
rslider bounds(228, 96, 50, 50) channel("gn") colour(250, 200, 250, 250) range(0, 2, 1, 1, 0.001) text("Gain") trackerColour(250, 150, 250, 255) 

keyboard bounds(2, 160, 430, 59) channel("keyboard") mouseOverKeyColour(78, 167, 202, 128) whiteNoteColour(209, 204, 214, 255) blackNoteColour(29, 17, 28, 255) value(40)
label bounds(238, 12, 53, 12) channel("label10013") text("vibration") colour(226, 214, 214, 0) fontColour(219, 210, 210, 255)
label bounds(383, 139, 41, 11) channel("label10015") text("v.2")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

seed 0
massign 1,1



giTableSize    =    131073   
giRtosScale    =    1000  
giwave1        ftgen    0, 0, giTableSize, 9, 1000,1.000,0, 2890,0.500,0,		\
					     4950,0.250,0,     6990,0.125,0,     8010,0.062,0,     			\
					     9020,0.031,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,   	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    	\
					     0,0.000,0
giwave2    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     2572,0.667,0,  	\
						  4644,0.444,0,     6984,0.296,0,     9723,0.198,0,   				\
						   0,0.132,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,    \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0,     0,0.000,0,     0,0.000,0,     0,0.000,0,     \
						   0,0.000,0
giwave3        ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1027,1.000,0,\
					     1422,1.000,0,     1448,1.000,0,     1466,1.000,0,     \
					     1499,1.000,0,     1789,1.000,0,     1877,1.000,0,     \
					     1965,1.000,0,     1979,1.000,0,     2033,1.000,0,     \
					     2145,1.000,0,     2156,1.000,0,     2253,1.000,0,     \
					     2291,1.000,0,     2333,1.000,0,     2457,1.000,0,     \
					     2493,1.000,0,     2566,1.000,0,     2606,1.000,0,     \
					     2669,1.000,0,     2714,1.000,0

giwave4    ftgen    0, 0, giTableSize, 9, 1000,1.000,0,     1002,0.833,0, \
					    1794,0.694,0,     1801,0.579,0,     2520,0.482,0,    \
					    2522,0.402,0,     2991,0.335,0,     2994,0.279,0,     \
					    3786,0.233,0,     3806,0.194,0,     4569,0.162,0,     \
					    4575,0.135,0,     5030,0.112,0,     5046,0.093,0,     \
					    6076,0.078,0,     5909,0.065,0,     6412,0.054,0,     \
					    6443,0.045,0,     7083,0.038,0,     7092,0.031,0,     \
					    7319,0.026,0,     7555,0.022,0

;;scale
opcode pythagorean,i,ii
iBaseNote,iNote xin
iMidi = iNote
		iOct = 0
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		iOct += 1
  		enduntil
 iMidiMin = (iMidi-iBaseNote)
  	iRatio = 1
  	if iMidiMin == 0 then
  	iRatio = 1/1
  	elseif iMidiMin == 1 then
  	iRatio = 2187/2048
  	elseif iMidiMin == 2 then
  	iRatio = 9/8
  	elseif iMidiMin == 3 then
  	iRatio = 32/27
  	elseif iMidiMin == 4 then
  	iRatio = 81/64
  	elseif iMidiMin == 5 then
  	iRatio = 4/3
  	elseif iMidiMin == 6 then
  	iRatio = 729/512
  	elseif iMidiMin == 7 then
  	iRatio = 3/2
  	elseif iMidiMin == 8 then
  	iRatio = 6561/4096
  	elseif iMidiMin == 9 then
  	iRatio = 27/16
  	elseif iMidiMin == 10 then
  	iRatio = 16/9
  	elseif iMidiMin == 11 then
  	iRatio = 243/128
  	elseif iMidiMin == 12 then
  	iRatio = 2/1
  	endif
iBaseFrq mtof iBaseNote+(iOct*12)
iFrq = (iBaseFrq)*iRatio
xout iFrq
endop


opcode shur,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  	iCent = 0
  	iRndPlus random -0.1, 0.2
   if iMidiMin == 2  then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.5+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote-iCent)
xout iFrqOut
endop

opcode homayun,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
   iRndPlus random -0.05, 0.05
  	iCent = 0
   if iMidiMin == 2  then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.25+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote+iCent)
xout iFrqOut
endop


opcode segah,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  iRndPlus random -0.2, 0.2
  	iCent = 0
   if iMidiMin == 4  then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 5 then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 9 then
  	iCent = (0.5+iRndPlus)
  	elseif iMidiMin == 11 then
  	iCent = (0.5+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote-iCent)
xout iFrqOut
endop

opcode chargah,i,ii
iBaseNote,iMidiNote xin
iMidi = iMidiNote
iFrq pythagorean iBaseNote,iMidiNote
iNote ftom iFrq
     until iMidi < iBaseNote+12 do
  		iMidi = iMidi-12
  		enduntil
  		iMidiMin = (iMidi-iBaseNote)
  iRndPlus random -0.05, 0.05
  	iCent = 0
   if iMidiMin == 2  then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 4 then
  	iCent = (0.25+iRndPlus)
  	elseif iMidiMin == 9 then
  	iCent = -(0.5+iRndPlus)
  	elseif iMidiMin == 11 then
  	iCent = (0.25+iRndPlus)
  	endif
  	;print iCent
  	iFrqOut = mtof:i(iNote+iCent)
xout iFrqOut
endop


;;udos
opcode MirrorMe,i,iii
iValue,iMin,iMax xin
iMiddle = iMin+((iMax-iMin)/2)
if iValue == iMiddle then
iOut = iValue
elseif iValue > iMiddle then
iOut = iMiddle - (iValue-iMiddle)
elseif iValue < iMiddle then
iOut = iMiddle + (iMiddle-iValue)
endif
xout iOut

endop






giVelocTable ftgen 1, 0,    127, -7,  1

instr 1
;;Frq
iMidiNote notnum
;print iMidiNote
iScale cabbageGetValue "scale"
iBaseNote cabbageGetValue "BNote"

if iScale == 1 then
iFrq mtof iMidiNote
elseif iScale == 2 then
iFrq pythagorean iBaseNote-2,iMidiNote
elseif iScale == 3 then
iFrq shur iBaseNote-2,iMidiNote
elseif iScale == 4 then
iFrq homayun iBaseNote-2,iMidiNote
elseif iScale == 5 then
iFrq segah iBaseNote-2,iMidiNote
elseif iScale == 6 then
iFrq chargah iBaseNote-2,iMidiNote
endif

;;Env
ivelocIn veloc   0,127
  ires tablei ivelocIn, 1
  iveloc = ires*127
iAmp = 0.3+(iveloc/500)

iCut cabbageGetValue "fltr"
iRsn = (MirrorMe:i( iCut,7,15))-5
;print iCut,iRsn
iFilter = ((iCut*100)*(1+(iveloc/127)))+(iFrq/iRsn)
;print iFilter
iAttIn cabbageGetValue "att"
iAtt = iAttIn/10000
iDec cabbageGetValue "dec"
iSus cabbageGetValue "sus"
iRel cabbageGetValue "rel"
;iDur = 1
aEnv linsegr  0,iAtt,1,iDec,iSus,iRel,0 

;;instrms
iRng cabbageGetValue "rng"
iSpd cabbageGetValue "spd"
iVibr cabbageGetValue "vbr"
if iVibr == 0 then
kRndFrq = 0
elseif iVibr == 1 then
kRndFrq jspline iRng,iSpd,iSpd*5
endif

iModIn cabbageGetValue "instr"
iMod = iModIn-1
;print iMod

if iMod == 0 goto end
if iMod == 1 || iMod == 2 || iMod == 3 || iMod == 4 goto sine
if iMod == 5 goto pick
if iMod == 6 goto VCO

sine:
if iMod == 1 then
giWave = giwave1
elseif iMod == 2 then
giWave = giwave2
elseif iMod == 3 then
giWave = giwave3
elseif iMod == 4 then
giWave = giwave4
endif

aSine poscil3 iAmp, (iFrq+kRndFrq)/giRtosScale,giWave
 aFilS clfilt aSine, iFilter, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnv
goto OUT

pick:
iplk  MirrorMe (iveloc/127)*0.3,0.01,.3
ipick = (iveloc/127)*0.3
irefl MirrorMe iRel,0,1
aPick wgpluck2 iplk,.3, iFrq, ipick, irefl-0.01
aout = aPick*aEnv
goto OUT

VCO:
aVco    vco2   iAmp,iFrq+kRndFrq,0,0.5
 aFilV clfilt aVco, iFilter-500, 0, 10
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnv


OUT:
chnmix aout, "snd"
end:
endin



instr 2
	giVelocTable	ftgen	1, 0,   127, -7, 0, 60, 0.53, 30, 0.75,37, 0.85
kGain cabbageGet "gn"
aGn	interp	kGain

;;sound
aIn chnget "snd"

;;Reverb
  aRvrbL, aRvrbR reverbsc aIn,aIn, 0.45, 800
  aoutL	ntrpol	 aIn,aRvrbL,  0
  aoutR	ntrpol	 aIn,aRvrbR,  0
out aoutL*aGn,aoutR*aGn
chnclear "snd"
endin


</CsInstruments>
<CsScore>
i2 0 [9^9]
</CsScore>
</CsoundSynthesizer>
