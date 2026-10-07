<Cabbage> 
form caption("miniPoo") size(450, 200)  guiMode("queue")  colour(20,10,20) pluginId("mnpo")
button bounds(138, 12, 30, 25) channel("start") text("p", "p") colour:0(48, 66, 77, 255) colour:1(148, 66, 77, 255)
button bounds(170, 12, 30, 25) channel("res") text("r", "r") colour:0(48, 66, 77, 255) colour:1(148, 66, 77, 255)

combobox bounds(12, 42, 60, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2) colour(61, 46, 70, 255)
combobox bounds(12, 14, 105, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2)  colour(61, 46, 70, 255)
combobox bounds(80, 42, 89, 25) text("Instr", "Dahina", "Wood", "Tibetan", "Albert","sine", "tri", "saw", "square", "Pick", "VCO") channel("instr") value(2) colour(61, 46, 70, 255)
nslider bounds(10, 76, 70, 35) channel("att") range(0.001, 5, 1.3, 1, 0.001) colour(61, 46, 70, 255) text("att") 
nslider bounds(82, 76, 70, 35) channel("rel") range(0.01, 5, 1.5, 1, 0.01) colour(61, 46, 70, 255) text("rel") 
;nslider bounds(154, 96, 70, 35) channel("vibr") range(0.01, 5, 0.03, 1, 0.01) colour(61, 46, 70, 255) text("vib-r") 
nslider bounds(154, 76, 70, 35) channel("vibr") range(0, 50, 3, 1, 1) colour(61, 46, 70, 255) text("vib-r cent") 
nslider bounds(226, 76, 70, 35) channel("vibf") range(0.01, 15, 4.3, 1, 0.01) colour(61, 46, 70, 255) text("vib-f") 
nslider bounds(298, 76, 70, 35) channel("vibdel") range(0.01, 3, 0.3, 1, 0.01) colour(61, 46, 70, 255) text("vib-d") 
nslider bounds(370, 76, 70, 35) channel("fltr") range(100, 8000, 1200, 1, 1) colour(61, 46, 70, 255) text("filt") 
nslider bounds(370, 136, 70, 35) channel("gn") range(-60, 48, -3, 1, 1) colour(61, 46, 70, 255) text("gain dB") 
nslider bounds(226, 136, 70, 35) channel("clip") range(0.1, 1, 1, 1, 0.01) colour(61, 46, 70, 255) text("clip") 
nslider bounds(298, 136, 70, 35) channel("clipgn") range(1, 20, 1, 1, 0.1) colour(61, 46, 70, 255) text("clip gain") 
nslider bounds(226, 24, 70, 35) channel("rsize") range(0.1, 0.9, 0.6, 1, 0.1) colour(61, 46, 70, 255) text("r-size") 
nslider bounds(298, 24, 70, 35) channel("rroom") range(100, 7000, 2800, 1, 10) colour(61, 46, 70, 255) text("r-room") 
nslider bounds(370, 24, 70, 35) channel("rmix") range(0, 1, 0.5, 1, 0.1) colour(61, 46, 70, 255) text("r-mix") 

signaldisplay bounds(12, 124, 171, 64), channel("display") colour("white") displayType("waveform"), backgroundColour(50,30,40), zoom(-2), signalVariable("aShow")
vmeter bounds(186, 124, 15, 65) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(30, 30, 30, 255)    outlineThickness(-1)    value(0) meterColour:0(193, 90, 150, 255) 
vmeter bounds(204, 124, 15, 65) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(30, 30, 30, 255)    outlineThickness(-1)    value(0) meterColour:0(193, 90, 150, 255)


</Cabbage>
<CsoundSynthesizer>
<CsOptions>
;-m128 --displays -dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
;nchnls = 2
0dbfs = 1

seed 0
massign 0,0
massign 1,1


giSine     ftgen   0, 0, 1024, 10, 1
giTri      ftgen   0, 0, 1024, 7, 0, 512, 1, 512, 0
giSaw      ftgen   0, 0, 1024, 7, 1, 512, -1, 0, 1, 512, -1
giSquare   ftgen   0, 0, 1024, 7, 1, 512, 1, 0, -1, 512, -1


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
opcode pythagorean, i, ii
  iBaseNote, iNote xin

  ; Pythagorean ratios for the 12 chromatic steps above the base note
  iRatios[] fillarray 1, 2187/2048, 9/8, 32/27, 81/64, 4/3, \
                      729/512, 3/2, 6561/4096, 27/16, 16/9, 243/128

  iDiff  = round(iNote - iBaseNote)       ; semitones from base (rounded to integer)
  iOct   = floor(iDiff / 12)              ; works for negative values too
  iStep  = int(iDiff - iOct*12)           ; 0..11

  iBaseFrq mtof iBaseNote
  iFrq     = iBaseFrq * iRatios[iStep] * 2^iOct

  iMidiOut ftom iFrq
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







opcode StringPickUp, a, aiiikkk
setksmps 1
aIn, iPlk, iAmp, iFund, kPickup, kFB, kBend   xin
aPlk    linseg   0, (1/iFund)*iPlk, 1, (1/iFund)*(1-iPlk), 0
aPlk    *=       iAmp
iMinFrq =        0.05
iBndScl =        (cpsmidinn(48) / iFund) ^ 0.5                  ; n.b. whammy bend does not affect all notes equally  
kFund   limit    iFund * semitone(kBend*iBndScl), iMinFrq, 15000
aBuf    delayr   1/iMinFrq
aTap1   deltapi  a(kPickup/kFund)
aTap2   deltapi  a(1/kFund)
aTap2   tone     aTap2, (sr*0.5) * 0.3
aIn     tone     aIn, (sr*0.5) * 0.3
        delayw   aPlk + aIn + (aTap2 * kFB)
        xout     aTap2 - aTap1
endop

instr 1
;;Frq

if p3 != -1 then
iMidiNote random 40,80
elseif p3 == -1 then
iMidiNote notnum
endif


iScale cabbageGetValue "scale"
iBaseNote cabbageGetValue "BNote"

if iScale == 1 then
iFrq mtof iMidiNote
elseif iScale == 2 then
iFrq pythagorean iBaseNote-1,iMidiNote
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

iAmp = 0.8

kFilt cabbageGet "fltr"
iAtt cabbageGetValue "att"
iRel cabbageGetValue "rel"
aEnv madsr  iAtt,1,1,iRel
;;instrms
iRng cabbageGetValue "rng"
kVibF cabbageGet "vibf"
kVibR cabbageGet "vibr"
iVibDel cabbageGetValue "vibdel"
kVibDel linseg 0, iVibDel+iAtt, 0, iAtt, 1

 aEnvRndDb randi 1, 5, 2
 kCentRnd lfo kVibR*kVibDel, kVibF
 kRndFrq = iFrq*cent(kCentRnd)
 aEnvRnd = aEnv*ampdb(aEnvRndDb)
iModIn cabbageGetValue "instr"
iMod = iModIn-1


if iMod == 0 goto end
if iMod == 1 || iMod == 2 || iMod == 3 || iMod == 4 goto sine
if iMod == 5 || iMod == 6 || iMod == 7 || iMod == 8 goto mtab
if iMod == 9 goto pick
if iMod == 10 goto VCO

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
aSine poscil3 iAmp, kRndFrq/giRtosScale,giWave
 aFilS clfilt aSine, kFilt, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnvRnd
goto OUT


mtab:
if iMod == 5 then
giWave = giSine
elseif iMod == 6 then
giWave = giTri
elseif iMod == 7 then
giWave = giSaw
elseif iMod == 8 then
giWave = giSquare
endif
aSine poscil iAmp, kRndFrq,giWave
 aFilS clfilt aSine, kFilt, 0, 10
 aFilS clfilt aFilS, 150, 1, 10
aout = aFilS*aEnvRnd
goto OUT

pick:
iplk  random 0.1, 0.9
ipick random 0.1, 0.9
irefl MirrorMe iRel,0,1
aPick wgpluck2 iplk,.3, iFrq, ipick, irefl-0.01
aout = aPick*aEnvRnd
goto OUT

VCO:
aVco    vco2   iAmp,kRndFrq,0,0.5
 aFilV clfilt aVco, kFilt, 0, 50
 aFilV clfilt aFilV, 150, 1, 10
aout = aFilV*aEnvRnd


OUT:

iPlk random 0.1, 0.9
iAmpP = 1
iFund = iFrq*1.5
kPickup = randi:k(0.5, 0.8) + 0.5
kFB  = randi:k(0.4, 0.7) + 0.6
kBend = 1
aRes StringPickUp aout*(1+kFB),iPlk, iAmpP, iFund, kPickup, kFB, kBend
kRes cabbageGet "res"
kRes port kRes, 0.1

aMix ntrpol aout, aRes, kRes

iClip   cabbageGetValue "clip"
kClipGn cabbageGet "clipgn"
aClip clip aMix*kClipGn, 0, iClip
chnmix aClip, "snd"
end:
endin




instr 2
kStrt cabbageGet "start"
if kStrt == 1 && changed(kStrt) == 1 then
schedulek 1, 0, 99999
elseif kStrt == 0 && changed(kStrt) == 1 then
turnoff2 1, 0, 1
endif


kGain cabbageGet "gn"
aGn	interp	ampdb(kGain)

;;sound
aIn1 chnget "snd"
aIn2 dcblock2 aIn1
aIn atone aIn2, 250

;;Reverb
kRvbSize cabbageGet "rsize"
kRvbRoom cabbageGet "rroom"
kRvbMix cabbageGet "rmix"
  aRvrbL, aRvrbR reverbsc aIn,aIn, kRvbSize, kRvbRoom
  aMixL	ntrpol	 aIn,aRvrbL,  kRvbMix
  aMixR	ntrpol	 aIn,aRvrbR,  kRvbMix
  
  aOutL = aMixL*aGn
  aOutR = aMixR*aGn
  aShow = (aOutL+aOutR)/2
 display aShow, 1/700, 5
cabbageSet "display", "skew", 2 
 kMaxL max_k aOutL, metro(20), 1
 kMaxR max_k aOutR, metro(20), 1
 kMeter1 dbfsamp kMaxL
 kMeter2 dbfsamp kMaxR
 cabbageSetValue "meter1", kMaxL, metro(20)
 cabbageSetValue "meter2", kMaxR, metro(20) 
out aOutL,aOutR
chnclear "snd"
endin


</CsInstruments>
<CsScore>
i2 0 [9^9]
</CsScore>
</CsoundSynthesizer>
