
<Cabbage>
form caption("PixyCoreLa")    size(1075, 535)   guiMode("queue") colour(45,10,35) pluginId("pxcr") ; style("legacy")

vslider bounds(786, 366, 50, 150) channel("out1") range(0, 80, 20, 1, 1) trackerColour(219, 120, 120, 255) 
vslider bounds(828, 366, 50, 150) channel("out2") range(0, 80, 20, 1, 1) trackerColour(219, 120, 120, 255)
vslider bounds(868, 366, 50, 150) channel("out3") range(0, 80, 0, 1, 1) trackerColour(219, 120, 120, 255)
vslider bounds(910, 366, 50, 150) channel("out4") range(0, 80, 0, 1, 1) trackerColour(219, 120, 120, 255)
nslider bounds(792, 332, 40, 35) channel("outn1") range(-90, 50, -45, 1, 1) colour(80, 50, 50, 255)
nslider bounds(832, 332, 40, 35) channel("outn2") range(-90, 50, -45, 1, 1) colour(80, 50, 50, 255)
nslider bounds(872, 332, 40, 35) channel("outn3") range(-90, 50, -60, 1, 1) colour(80, 50, 50, 255)
nslider bounds(912, 332, 40, 35) channel("outn4") range(-90, 50, -60, 1, 1) colour(80, 50, 50, 255)
nslider bounds(960, 298, 93, 44) channel("gain") range(-90, 50, 0, 1, 1) colour(80, 50, 50, 255) text("Master Gain (dB)")

label bounds(802, 50, 239, 66) channel("sec") text("00 : 03") fontColour(241, 178, 178, 255)
label bounds(842, 14, 70, 33) channel("data")  fontColour(241, 178, 178, 255) colour(80, 50, 50, 255) text("0")
label bounds(790, 14, 49, 33) channel("datach")  fontColour(241, 178, 178, 255) colour(80, 50, 50, 255) text("0")
button bounds(922, 18, 116, 27) channel("start") value(1) text("S  T  A  R  T", "S  T  O  P")  colour:0(171, 81, 152, 255) colour:1(99, 85, 85, 255)
image bounds(990, 248, 30, 30) channel("sus2light") corners(5) colour(80, 50, 50, 255)
checkbox bounds(782, 280, 20, 20) channel("mic") colour:0(111, 103, 103, 255) colour:1(255, 100, 100, 255) 
checkbox bounds(728, 490, 20, 20) channel("rcrd") colour:0(111, 103, 103, 255) colour:1(255, 100, 100, 255) 

image bounds(776, 248, 30, 30) channel("seqlight") corners(5) colour(80, 50, 50, 255)
image bounds(810, 248, 30, 30) channel("bowlight") corners(5) colour(80, 50, 50, 255)
image bounds(844, 248, 30, 30) channel("flutelight") corners(5) colour(80, 50, 50, 255)
image bounds(878, 248, 30, 30) channel("clarinetlight") corners(5) colour(80, 50, 50, 255)
image bounds(912, 248, 30, 30) channel("wgamblight") corners(5) colour(80, 50, 50, 255)
image bounds(1015, 190, 37, 25) channel("morselight") corners(5) colour(80, 50, 50, 255)
image bounds(993, 194, 20, 20) channel("morseplight") corners(2) colour(80, 50, 50, 255)
image bounds(946, 248, 30, 30) channel("analoglight") corners(5) colour(80, 50, 50, 255)
image bounds(1022, 248, 30, 30) channel("suslight") corners(5) colour(80, 50, 50, 255)
label bounds(398, 266, 187, 33) channel("sampleshow")  fontColour(241, 178, 178, 255) colour(80, 50, 50, 255)  align("left") text("")
image bounds(592, 268, 30, 30) channel("samplelight") corners(5) colour(80, 50, 50, 255)
image bounds(82, 30, 20, 20) channel("dustplight") corners(2) colour(80, 50, 50, 255)
image bounds(106, 30, 20, 20) channel("dustmlight") corners(2) colour(80, 50, 50, 255)
image bounds(144, 30, 20, 20) channel("fblight") corners(2) colour(80, 50, 50, 255)
image bounds(166, 30, 20, 20) channel("fbmlight") corners(2) colour(80, 50, 50, 255)

image bounds(208, 30, 20, 20) channel("seqlight1") corners(2) colour(80, 50, 50, 255)
image bounds(232, 30, 20, 20) channel("seqlight2") corners(2) colour(80, 50, 50, 255)
image bounds(256, 30, 20, 20) channel("seqlight3") corners(2) colour(80, 50, 50, 255)
image bounds(280, 30, 20, 20) channel("seqlight4") corners(2) colour(80, 50, 50, 255)
image bounds(304, 30, 20, 20) channel("seqlight5") corners(2) colour(80, 50, 50, 255)
image bounds(328, 30, 20, 20) channel("seqlight6") corners(2) colour(80, 50, 50, 255)
image bounds(352, 30, 20, 20) channel("seqlight7") corners(2) colour(80, 50, 50, 255)
image bounds(376, 30, 20, 20) channel("seqlight8") corners(2) colour(80, 50, 50, 255)


label bounds(414, 368, 59, 18) channel("label4") text("CC-03") fontColour(224, 219, 219, 255)
label bounds(414, 412, 59, 18) channel("label5") text("CC-07") fontColour(224, 219, 219, 255)
label bounds(414, 454, 59, 18) channel("label6") text("CC-15") fontColour(224, 219, 219, 255)


label bounds(402, 68, 59, 18) channel("label9") text("CC-02") fontColour(224, 219, 219, 255)
label bounds(550, 210, 59, 18) channel("label10") text("CC-01") fontColour(224, 219, 219, 255)
label bounds(608, 182, 59, 18) channel("labes2") text("CC-01") fontColour(224, 219, 219, 255)

label bounds(402, 104, 59, 18) channel("label11") text("CC-11") fontColour(224, 219, 219, 255)
label bounds(402, 144, 59, 18) channel("labelf1") text("CC-11") fontColour(224, 219, 219, 255)
label bounds(402, 184, 59, 18) channel("labelf2") text("CC-11") fontColour(224, 219, 219, 255)

label bounds(416, 490, 59, 18) channel("label12") text("CC-13") fontColour(224, 219, 219, 255)
label bounds(556, 400, 59, 18) channel("label13") text("CC-04") fontColour(224, 219, 219, 255)



label bounds(26, 326, 92, 24) channel("labelm3") text("Machine") fontColour(224, 219, 219, 255)
label bounds(16, 12, 59, 24) channel("labeln3") text("Dust") fontColour(224, 219, 219, 255)




rslider bounds(120, 244, 70, 70) channel("rroomeseq") range(0.1, 0.9, 0.8, 1, 0.01) trackerColour(219, 120, 120, 255) colour(192, 171, 160, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("room")
rslider bounds(50, 244, 70, 70) channel("rsizeseq") range(0.1, 5, 0.5, 1, 0.1) trackerColour(219, 120, 120, 255) colour(192, 171, 160, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("size")
rslider bounds(190, 244, 70, 70) channel("rmixseq") range(0, 1, 0.3, 1, 0.01) trackerColour(219, 120, 120, 255) colour(192, 171, 160, 255) outlineColour(0, 0, 0, 255) markerColour(0, 0, 0, 255) text("mix")

nslider bounds(552, 423, 67, 44) channel("machinespdmin") range(0.1, 10, 5, 1, 0.1) colour(80, 50, 50, 255) text("spd min")
nslider bounds(552, 469, 67, 45) channel("machinespdmax") range(0.2, 15, 7, 1, 0.1) colour(80, 50, 50, 255) text("spd max")


hslider bounds(44, 358, 362, 40) channel("pos") range(0, 1, 1, 1, 0.001) trackerColour(219, 120, 120, 255) text("pos")
hslider bounds(16, 400, 391, 40) channel("spdstrngmin") range(0, 1, 0.1, 1, 0.01) trackerColour(219, 120, 120, 255) text("spd min")
hslider bounds(11, 442, 396, 40) channel("spdstrngmax") range(0, 1, 0.3, 1, 0.01) trackerColour(219, 120, 120, 255) text("spd max")


hslider bounds(43, 482, 364, 40) channel("wgfilt") range(0, 1, 0.2, 1, 0.0001) trackerColour(219, 120, 120, 255) text("Filt")
nslider bounds(478, 358, 72, 35) channel("poss") range(0.001, 10, 1, 1, 0.001) colour(80, 50, 50, 255)
nslider bounds(478, 402, 72, 35) channel("spdstrngmins") range(0.1, 5, 2, 1, 0.1) colour(80, 50, 50, 255)
nslider bounds(478, 444, 72, 35) channel("spdstrngmaxs") range(0.5, 12, 5, 1, 0.1) colour(80, 50, 50, 255)


nslider bounds(478, 480, 72, 35) channel("wgfilts") range(500, 12000, 700, 1, 1) colour(80, 50, 50, 255)

nslider bounds(554, 358, 64, 42) channel("wgcent") range(0, 500, 0, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("wgCent")
label bounds(610, 110, 59, 18) channel("label25") text("CC-00") fontColour(224, 219, 219, 255)
nslider bounds(608, 58, 64, 42) channel("noiserng") range(0, 1200, 50, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("nRng")

vslider bounds(622, 355, 50, 143) channel("wgamp") range(0, 20, 10, 1, 1) trackerColour(219, 120, 120, 255) text("wgAmp")
vslider bounds(556, 56, 50, 150) channel("noiseamp") range(0, 30, 20, 1, 1) trackerColour(219, 120, 120, 255) text("nAmp")
nslider bounds(608, 134, 62, 43) channel("seqamp") range(-90, 20, -15, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("seqAmp")

label bounds(622, 498, 59, 18) channel("labelw10") text("CC-09") fontColour(224, 219, 219, 255)
hslider bounds(40, 96, 357, 40) channel("nfilt") range(200, 9000, 700, 1, 1) trackerColour(219, 120, 120, 255) text("Filt")
hslider bounds(40, 56, 358, 40) channel("noisepress") range(30, 400, 30, 1, 1) trackerColour(219, 120, 120, 255) text("nPres")
nslider bounds(472, 56, 72, 35) channel("noisepresss") range(30, 400, 30, 1, 1) colour(80, 50, 50, 255)
nslider bounds(472, 96, 72, 35) channel("nfilts") range(200, 9000, 700, 1, 1) colour(80, 50, 50, 255)
nslider bounds(472, 136, 72, 35) channel("fbpress") range(200, 9000, 700, 1, 1) colour(80, 50, 50, 255)
nslider bounds(472, 176, 72, 35) channel("fbfilts") range(200, 9000, 700, 1, 1) colour(80, 50, 50, 255)

hslider bounds(40, 136, 356, 40) channel("fbpres") range(0.12, 0.17, 0.12, 1, 0.00001) trackerColour(219, 120, 120, 255) text("fbPres")
hslider bounds(40, 176, 356, 40) channel("fbfilt") range(500, 9000, 700, 1, 1) trackerColour(219, 120, 120, 255) text("fbFilt")

checkbox bounds(726, 96, 30, 30) channel("morsestart") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
checkbox bounds(692, 96, 25, 25) channel("morsesine") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255) 
checkbox bounds(764, 96, 25, 25) channel("morsenoise") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255) 
label bounds(691, 68, 27, 22) channel("labelmorse1") text("S")
label bounds(763, 68, 27, 22) channel("labelmorse2") text("N")

texteditor bounds(687, 134, 364, 40) channel("morsetxt") colour(200, 170, 200, 200) colour:0(200, 170, 200, 200)fontSize(26) text("some one")
nslider bounds(692, 182, 70, 44) channel("morsebpm") range(30, 200, 124, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("Tempo")
nslider bounds(764, 182, 68, 43) channel("morsefrq") range(200, 2000, 1200, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("Frq")
nslider bounds(836, 182, 68, 43) channel("morseamp") range(-90, -15, -22, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("Amp")
nslider bounds(906, 182, 68, 43) channel("morsefilt") range(500, 9000, 5000, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("Frq")



nslider bounds(634, 258, 68, 43) channel("sampleamp") range(-90, 20, -7, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("samAmp")
nslider bounds(328, 258, 68, 43) channel("rm") range(100, 700, -7, 1, 1) colour(80, 50, 50, 255) fontColour(241, 178, 178, 255) text("RM")

combobox bounds(678, 386, 70, 35), populate("*.snaps"), channelType("string") automatable(0) channel("combo99") value("0") colour(80, 50, 50, 255) 
filebutton bounds(678, 358, 70, 25), text("Save", "Save"), populate("*.snaps", "test"), mode("named preset") channel("filebutton8") colour:0(80, 50, 50, 255)
filebutton bounds(679, 424, 69, 25), text("Remove", "Remove"), populate("*.snaps", "test"), mode("remove preset") channel("filebutton101") colour:0(80, 50, 50, 255)
combobox bounds(681, 454, 67, 31)  channel("tune")  text("440", "432")   value(2)  colour(80, 50, 50, 255)


vmeter bounds(964, 366, 15, 150) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(988, 366, 15, 150) channel("meter2")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1012, 366, 15, 150) channel("meter3")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
vmeter bounds(1036, 366, 15, 150) channel("meter4")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(250, 10, 0, 255) meterColour:1(10, 120, 40, 255) meterColour:2(10, 70, 200, 255)
image bounds(964, 352, 15, 15) channel("clip1") colour(0, 0, 0, 255)
image bounds(988, 352, 15, 15) channel("clip2") colour(0, 0, 0, 255)
image bounds(1012, 352, 15, 15) channel("clip3") colour(0, 0, 0, 255)
image bounds(1036, 352, 15, 15) channel("clip4") colour(0, 0, 0, 255)

label bounds(210, 4, 544, 17) channel("inf") align("left") text("1-Nse | 3-nMidi | 5-fB | 7-FbMidi | 8-Bow | 7-Flt | 10-Clr | 12-Smpl")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs = 1


seed 0


opcode CsdMeter, 0, SakS
 SClip, aSig, kTrig, Smeter	xin
 iDbRange = 60 ;shows 60 dB
 iHoldTim = 0.5;seconds to "hold the red light"
 kOn init 0
 kTim init 0
 kStart init 0
 kEnd init 0
 kMax max_k aSig, kTrig, 1
 cabbageSetValue Smeter, kMax, metro(20)
 
 if kTrig == 1 then
 kMeter = (iDbRange + dbfsamp(kMax)) / iDbRange
  if kOn == 0 && kMax > 1 then
   kTim = 0
   kEnd = iHoldTim
   cabbageSet 1,SClip,"colour(250,0, 0)"
   kOn = 1
  endif
  if kOn == 1 && kTim > kEnd then
   cabbageSet 1,SClip,"colour(0,0,0)"
   kOn =	0
  endif
 endif
 kTim += ksmps/sr
endop

opcode limiter, a,ai
aIn, idB xin

xout aIn
endop


;;drum
opcode bass, a,i
iAmpIn xin
p3 = 0.15
iAmp ampdb iAmpIn
aEnv linseg 1,p3,0.001 
iFrq random 120, 150
kFrq expon iFrq,p3,30
aSound poscil aEnv*iAmp,kFrq 
xout aSound
endop


opcode snare, a,i
iAmpIn xin
p3 = 0.3
iAmp ampdb iAmpIn
aEnv expon 1, p3, 0.001
aNse noise 1, 0
iFilt random 700, 8000
aNse tone aNse, iFilt
iFrq random 100, 200
iHigh random 0, 100
kFrq expon iFrq, p3, iFrq+iHigh
aJit randomi 0.2, 1.3, 50000
aSound poscil aEnv, kFrq*aJit
iNoise random 0.01, 0.1
aSum sum aNse*iNoise, aSound
aRes comb aSum, 0.01, 0.003
aOut = aRes*iAmp*aEnv
xout aOut
endop

opcode hihat, a,i
iAmpIn xin
iAmp ampdb iAmpIn
p3 = 0.1
aEnv expon 1,p3,0.001
aNse noise aEnv, 0
iFilt random 10000, 12000
aFilt buthp aNse*iAmp*0.5, iFilt
aSound buthp aFilt, iFilt 
xout aSound
endop

opcode rateCCk, k, kii
kValue, iMin, iMax xin
iDiff = iMax-iMin
kOut = (kValue*iDiff)+iMin
xout kOut
endop 


opcode PchSh,a,ak
aIn, kPitch xin
iFFTsize = 1024
 ioverlap = iFFTsize/8
 ;;Pitch
 fSound pvsanal aIn, iFFTsize, ioverlap, iFFTsize, 1
 fTranspose pvscale fSound, cent(kPitch)
 aOut pvsynth fTranspose
xout aOut
endop


massign 1,1
massign 3,2
massign 5,3
massign 7,4
massign 8,19
massign 10,20
massign 12,21
massign 13,29

massign 2,0
massign 4,0
massign 6,0
massign 9,0
massign 11,0
massign 14,0
massign 15,0

massign 16,32





 giwave1 ftgen 0, 0, 131073, 9, 1000,1.000,0,     1002,0.833,0, \
					    1794,0.694,0,     1801,0.579,0,     2520,0.482,0,    \
					    2522,0.402,0,     2991,0.335,0,     2994,0.279,0,     \
					    3786,0.233,0,     3806,0.194,0,     4569,0.162,0,     \
					    4575,0.135,0,     5030,0.112,0,     5046,0.093,0,     \
					    6076,0.078,0,     5909,0.065,0,     6412,0.054,0,     \
					    6443,0.045,0,     7083,0.038,0,     7092,0.031,0,     \
					    7319,0.026,0,     7555,0.022,0
 giwave2 ftgen 0, 0, 131073, 9, 1000,1.000,0,     1027,1.000,0,\
					     1422,1.000,0,     1448,1.000,0,     1466,1.000,0,     \
					     1499,1.000,0,     1789,1.000,0,     1877,1.000,0,     \
					     1965,1.000,0,     1979,1.000,0,     2033,1.000,0,     \
					     2145,1.000,0,     2156,1.000,0,     2253,1.000,0,     \
					     2291,1.000,0,     2333,1.000,0,     2457,1.000,0,     \
					     2493,1.000,0,     2566,1.000,0,     2606,1.000,0,     \
					     2669,1.000,0,     2714,1.000,0
 giSine ftgen 0, 0, 2^12, 10, 1 	
 
 
 


instr noisePlay
 kAmpdBIn cabbageGet "noiseamp"
 kAmpdB ampdb kAmpdBIn-25
 kPortTime linseg 0, 0.01, 0.1
 kAmpdB portk kAmpdB, kPortTime
 iAtt random 0.2, 0.5
 iRel random 0.2, 0.5
 aEnv linsegr 0, iAtt, 1, iRel, 0
 kSpeedMin cabbageGet "spdstrngmin"
 kSpeedMax cabbageGet "spdstrngmax"
 iDelayTime  random 0.1, 0.25
 kFb cabbageGet "noisepress"
 aNoise noise 1, 0.5
 aNoise = aNoise*5
 aFb init 1
 aNoise = (aNoise*kFb)+aFb
    aSine poscil 1, aNoise
    aPhas phasor aNoise
    aSum sum aSine, aPhas
    aFb delay aSum, iDelayTime
 iMidi notnum
 if p3 != -1 then
 iMidi random 40, 80
 aEnv linseg 0, iAtt, 1, p3-iAtt, 0
 endif
 iFrq mtof iMidi
 kRngIn cabbageGet "noiserng"
 kRng = cent(kRngIn)-1
 kFilterMin = (iFrq*(1-kRng))*2
    if kFilterMin <= 200 then
    kFilterMin = 200
    endif
 kFilterMax = (iFrq*(1+kRng))*2
    if kFilterMax >= 12000 then
    kFilterMax = 12000
    endif
 kFilt cabbageGet "nfilt"
 aFilt clfilt aFb, kFilterMax+kFilt, 0, 10
 aFilt  clfilt aFilt, kFilterMin, 1, 10
 aOut = aFilt*kAmpdB*aEnv*ampdb(-10)
 
 kRms rms aOut
 if kRms > kAmpdB*0.005 then
 cabbageSet 1,"dustmlight","colour(70, 200, 200)"
 else
 cabbageSet 1,"dustmlight","colour(80, 50, 50, 255)"
 endif
; printk2 kRms
 cabbageSet 1,"dustplight","colour(200, 70, 200)"
    if release() == 1 then
    cabbageSet 1,"dustplight","colour(80, 50, 50, 255)"
    cabbageSet 1,"dustmlight","colour(80, 50, 50, 255)"
    endif
 chnmix aOut, "snddust"
endin


instr noiseMidi
iNoiseCopy cabbageGetValue "noisepress"
iFilterCopy cabbageGetValue "nfilt"
iNum notnum
if iNum >= 60 && iNum <= 72 then ;; noise
kNoise = ((iNum-60)*20)+30
cabbageSetValue "noisepress", kNoise
elseif iNum >= 48 && iNum <= 59 then ;;filter
kFilter = ((iNum-48)*600)+200
cabbageSetValue "nfilt", kFilter
endif
    if release() == 1 then
    cabbageSetValue "noisepress", k(iNoiseCopy)
    cabbageSetValue "nfilt", k(iFilterCopy)
    endif
endin


instr fbSound
 iAmp = 0.1
 
  kPoseIn cabbageGet "fbpres"
 kSpdMinIn cabbageGet "spdstrngmin"
 kSpdMaxIn cabbageGet "spdstrngmax"
 kFilterIn cabbageGet "fbfilt"
 kCentIn cabbageGet "noiserng"
 kPose rateCCk kPoseIn, 0.12, 0.17
 kSpdMin rateCCk kSpdMinIn, 0.1, 1
 kSpdMax rateCCk kSpdMaxIn, 0.4, 3
 
 iMidi notnum
; iFrq mtof iMidi ;200
 iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
    if iTuneIn == 1 then
    iTune = 440
    elseif iTuneIn == 2 then
    iTune = 432
    endif
iRatio = iTune/440
iFrq = iFrqIn*iRatio
 
 kCentRnd jspline kCentIn,kSpdMin,kSpdMax
 kFrq = iFrq*cent(kCentRnd)
; printk2 int(kFrq)
 
 aSine      poscil    iAmp, kFrq, giSine
 if changed(kPose) == 1 then
 reinit update
 endif
; adRnd1     randi     0.05, 0.1, 2
 adRnd1     rspline 0.1, kPose, kSpdMin, kSpdMax
; adRnd2     randi     0.05, 0.1, 2
 adRnd2     rspline 0.1, kPose,kSpdMin, kSpdMax
     update:
 aBuffer    delayr    2
 ad1        deltapi   adRnd1;+0.1
 ad2        deltapi   adRnd2;+0.1
 a3 init 0
 krms      rms       a3
           delayw    aSine + exp(-krms) * a3
   rireturn
; a3        reson     ad1, 3000, 7000, 2
 a3        reson     -(ad1+ad2), 500, iFrq*1.5, 2
 
 aFilt clfilt ad1, kFilterIn+(iFrq*0.5), 0, 10
 aFilt clfilt aFilt, 250, 1, 10
 
 iAtt random 0.5, 1
 iRel random 0.7, 1.5
 aEnv linsegr 0, iAtt, 1, iRel, 0
aOut dcblock2 aFilt*aEnv*0.3
chnmix aOut, "sndwg"
endin


instr fbMidi
iNoiseCopy cabbageGetValue "fbpres"
iFilterCopy cabbageGetValue "fbfilt"
iNum notnum
if iNum >= 60 && iNum <= 72 then ;; noise
kNoise = ((iNum-60)/250)+0.12
printk2 kNoise
cabbageSetValue "fbpres", kNoise
elseif iNum >= 48 && iNum <= 59 then ;;filter
kFilter = ((iNum-48)*600)+200
cabbageSetValue "fbfilt", kFilter
endif
    if release() == 1 then
    cabbageSetValue "fbpres", k(iNoiseCopy)
    cabbageSetValue "fbfilt", k(iFilterCopy)
    endif
endin






instr seqMachine
kMic cabbageGet "mic"
printk2 kMic

 SinstrArr[] fillarray "sineSound", "barSound", "bamSound", "shakeSound",\
  "pluckSound", "bangSound", "guiroSound", "drumSound"
 kTime init 1
 kIndxSeq init 0
 kSeqArr[] init 32
 if metro(1/kTime) == 1 && kMic == 0 then
 	if kIndxSeq == 0 then 	
 	kLen = int(random:k(1, 12))
 	trim kSeqArr, kLen
 		kIndx = 0 
 		while kIndx < kLen-1 do
 		kSeqValue random 1, 3
 		kSeqArr[kIndx] = kSeqValue
 		kIndx += 1
 		od
 	kMaxValue random 15, 20
 	kSeqArr[kLen-1] = kMaxValue
 	endif 
 kInstr = int(random:k(0,lenarray(SinstrArr)))
 Sinstr = SinstrArr[kInstr]
    if kIndxSeq == kLen-2 then
    kMod = 1
    else
    kMod = 0
    endif
 schedulek Sinstr, 0, kTime,kMod
 kIndxSeq = (kIndxSeq+1) % kLen
 kTime = kSeqArr[kIndxSeq]/10
 endif
 
 if kMic == 1 then
 aIn inch 1
;kFrq, kAmpdB ptrack aIn, 256
kAmpdB = dbamp:k(rms:k(aIn))
    if kAmpdB >= -40 && changed(kAmpdB) == 1 then
    kDur random 0.2, 1
    kInstr = int(random:k(0,lenarray(SinstrArr)))
    Sinstr = SinstrArr[kInstr]
    schedulek Sinstr, 0, kDur,0
    endif
 endif
 
endin

instr sineSound
 isAmp cabbageGetValue "seqamp"
 iAmp ampdb -15
 iFrq random 200, 1200
 iAtt = 0.005
 iMod = p4 
    if iMod == 0 then
    aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -6, 0
    elseif iMod == 1 then
    aEnv linseg 0, iAtt, iAmp, p3-(iAtt*2), iAmp, iAtt, 0
    endif
 aSound poscil aEnv, iFrq
 aOut = aSound*ampdb(isAmp)
 chnmix aOut, "sndseq"
 ;outall aSound

cabbageSet 1,"seqlight1","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight1","colour(80, 50, 50, 255)"
endif
endin

instr barSound
    giDelayTime random 0.1, 1
    giFeedback random 0.1, 0.5
 p3 random 2, 5
 isAmp cabbageGetValue "seqamp"
 iAmp ampdb -15
 iMod = int(random:i(1, 6))
 iFrq random 10, 200
    if iMod == 1 then
    iDur1 = 0.077
    iscan  = 0.175
    iDur2 = 20
    aRing poscil 1, iFrq
    elseif iMod == 2 then
    iDur1 = 0.4
    iscan  = 70
    iDur2 =  1
    aRing init 1
    elseif iMod == 3 then
    iDur1 random 0.1, 0.7
    iscan  random 50, 70
    iDur2 random 1, 10
    aRing poscil 1, iFrq
    elseif iMod == 4 then
    iDur1 = 1
    iscan = 0.008
    iDur2 random 0.1, 1
    aRing init 1
    elseif iMod == 5 then
    iDur1 = 0.077
    iscan  random 30, 50
    iDur2 random 0.1, 20
    aRing init 1
    endif
 iK = 125
 ipos =  0.837 
 ivel = 18000
 iwid = 0.016
 aSound 	barmodel 	1, 1, iK, iDur1, iscan,   iDur2, ipos, ivel, iwid
 aOut = aSound*aRing*ampdb(isAmp)*iAmp
 chnmix aOut, "sndseq"
 cabbageSet 1,"seqlight2","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight2","colour(80, 50, 50, 255)"
endif
endin

instr guiroSound
    giDelayTime random 0.1, 1
    giFeedback random 0.1, 0.5
 isAmp cabbageGetValue "seqamp"
 iFrqIn random 1000, 9000
 iFrq random iFrqIn, iFrqIn*1.01
 iAmp ampdb -15
 aSound  guiro iAmp, 0, 128, 0, 0, iFrq, iFrq*2
 iLoopDur random 2, 4
 iLoop random 0.1, 0.4
 aComb comb aSound, iLoopDur, iLoop
 iFrqRnd random 0, 100
 iRel = 0.1
 aRes reson aSound, iFrq*1.1+iFrqRnd, 200
 aOut = aRes*iAmp*ampdb(isAmp)
 chnmix aComb, "sndseq"
 ;outall aSound
 cabbageSet 1,"seqlight3","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight3","colour(80, 50, 50, 255)"
endif
endin


instr bamSound
    giDelayTime random 0.1, 1
    giFeedback random 0.1, 0.5
 isAmp cabbageGetValue "seqamp"
 p3 random 0.05, 1
 iAmpdB ampdb -15
 iFrq random 400, 500
 iFilter random 3000, 4000
 iAtt = 0.1
 aEnv transeg 0, iAtt, 6, 1, p3-iAtt, -6, 0
 iAmp = 1000
 iNumber random 0.4, 5
 iDamp = 0.1 ;random 0.0001, 0.05
 iDecay = 0.1 ;random 0.001, 0.1
 aSound  bamboo iAmp, iDecay, iNumber, iDamp, 1, iFrq, 20
 aFilt clfilt aSound, iFilter, 1, 10
 aClip clip aFilt, ampdb(-10), 2
 aOut = aClip*aEnv*iAmpdB*ampdb(isAmp)
 chnmix aOut, "sndseq"
 cabbageSet 1,"seqlight4","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight4","colour(80, 50, 50, 255)"
endif
endin


instr shakeSound
    giDelayTime random 0.1, 1
    giFeedback random 0.1, 0.5
 isAmp cabbageGetValue "seqamp"
 iAmp ampdb -15
 p3 random 0.05, 0.5
 iRel random 0.1, 1
 aEnv linsegr 1, iRel, 0
 knum  rspline 2, 15, 2, 7
 kFrq rspline 700, 3000, 2, 15
 asig shaker .05, kFrq, 8, 0.9, knum
 iFilter random 300, 1200
 aFilt clfilt asig*aEnv, iFilter, 1, 10	
 aOut = aFilt*ampdb(isAmp)*iAmp	
 chnmix aFilt, "sndseq"
 cabbageSet 1,"seqlight5","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight5","colour(80, 50, 50, 255)"
endif
endin


instr pluckSound
    giDelayTime random 0.1, 1
    giFeedback random 0.1, 0.5
    giRvrbTime random 0.7, 0.9
 isAmp cabbageGetValue "seqamp"
 iAmp ampdb -15
 iAtt random 0.008, 0.01
 iRel random 0.1, 1
 SOut = "sndseq"
 iResample random 20, 1500
    if p4 == 0 then
    iFrq random 30, 1500
    elseif p4 == 1 then
    iFrq random 30, 1500
    elseif p4 == 2 then
    iFrq random 1500, 2000
    iResample random 800, 1000
    iAmp ampdb 5
    SOut = "snddust"
    endif  
   aEnv linsegr 0, iAtt, 1, iRel, 0
 iMeth = random:i(0, 100) < 50 ? 1 : 6
 aSound  pluck iAmp, iFrq, iResample, 0, iMeth;, 2, 1
 iFilter random 300, 1500
 aFilt clfilt aSound*aEnv, iFilter, 0, 10	
 aFilt clfilt aSound*aEnv, 200, 1, 10
 aOut = aFilt*ampdb(isAmp)
 chnmix aOut, SOut
 cabbageSet 1,"seqlight6","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight6","colour(80, 50, 50, 255)"
endif
endin

 				
instr bangSound
 isAmp cabbageGetValue "seqamp"
 iAmp ampdb -20
 iFrq random 70, 700
 iAtt = 0.003
 p3 random 0.3, 2
 aEnv transeg 0, iAtt, 4, iAmp, p3-iAtt, -6, 0
    iwave = random:i(0, 100) > 50 ? giwave1 : giwave2
 aSound poscil3 aEnv, iFrq/1000,iwave
 ;Bass
 iAmpBass ampdb -15
 aEnvBass transeg 0, 0.01, 6, iAmpBass, p3*0.3, -6, 0     
 iFrqBass random 100, 200
 kGliss        linseg       iFrqBass,p3/2,iFrqBass*0.7
 aBass        oscil       aEnvBass,kGliss,giSine
 ;Snare 
 iAmpSnare ampdb -15
 aEnvSnare        expon      iAmpSnare, 0.3, 0.001   
 aNse        noise      1, 0 
 iRndFilter random 7000, 8000
 aNseFilter clfilt aNse, iRndFilter*1.1, 0, 10   
 aNseFilter clfilt aNseFilter, iRndFilter*0.9, 1, 10              
 iCps        exprand    20                     
 kCps        expon      250 + iCps,0.3, 200+iCps
 aJit        randomi    0.2, 1.8, 10000         
 aTne        oscil      aEnvSnare, kCps, giSine       
 aSnare = aTne*aNseFilter
 aOut sum aSound,aBass, aSnare
 aOutv = aOut*ampdb(isAmp)
 chnmix aOutv, "sndseq"
 cabbageSet 1,"seqlight7","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight7","colour(80, 50, 50, 255)"
endif
endin

instr drumSound
isAmp cabbageGetValue "seqamp"
iAmpdB ampdb -15
iDrum = int(random:i(2,4))
iMode = int(random:i(0,100)) < 5 ? 1 : iDrum

if iMode == 1 then
aSound bass -15+iAmpdB
elseif iMode == 2 then
aSound snare -12+iAmpdB
elseif iMode == 3 then
aSound hihat -7+iAmpdB
endif
cabbageSet 1,"seqlight8","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"seqlight8","colour(80, 50, 50, 255)"
endif
aOut = aSound*ampdb(isAmp)
chnmix aOut, "sndout"
endin




 gkMidiBow init 0
instr bowMachine
 cabbageSet 1,"bowlight","colour(200, 150, 100)"
 
 kSpeedMin cabbageGet "machinespdmin"
 kSpeedMax cabbageGet "machinespdmax"
    if gkMidiBow == 1 then
    turnoff
    elseif gkMidiBow == 0 then
        kTimeBow init 1
        if metro(1/kTimeBow) == 1 then
        kTimeBow random kSpeedMin, kSpeedMax
        kDurBow = kTimeBow*1.3
        schedulek "bowSound", 0, kDurBow
        endif
    endif
endin

 gkMidiFlt init 0
instr fltMachine
    if gkMidiFlt == 1 then
    turnoff
    elseif gkMidiFlt == 0 then
    cabbageSet 1,"flutelight","colour(100, 200, 100)"
        kTimeFlute init 1
        if metro(1/kTimeFlute) == 1 then
        kTimeFlute random 5, 7
        kDurFlute = kTimeFlute*1.3
        schedulek "fluteSound", 0, kDurFlute
        endif
    endif
endin

 gkMidiClr init 0
instr clrMachine
 cabbageSet 1,"clarinetlight","colour(70, 200, 250)"
  kSpeedMin cabbageGet "machinespdmin"
 kSpeedMax cabbageGet "machinespdmax"
    if gkMidiClr == 1 then
    turnoff
    elseif gkMidiClr == 0 then
        kTimeClr init 1
        if metro(1/kTimeClr) == 1 then
        kTimeClr random kSpeedMin, kSpeedMax
        kDurClr = kTimeClr*1.3
        schedulek "clarinetSound", 0, kDurClr
        endif
    endif
endin


instr ambwgMachine
    cabbageSet 1,"wgamblight","colour(50, 50, 250)"
        kTime init 1
        if metro(1/kTime) == 1 then
        kTime random 7, 12
        kDur = kTime*1.3
        schedulek "wgAmbSound", 0, kDur
        kIndx = 0
        kStart = 0
        kLenPlck random 7, 20
        while kIndx < int(kLenPlck) do
        kDurPluck random 0.2, 0.5
        schedulek "pluckSound", kStart, kDurPluck, 2
        kStartRnd random 0, 0.5
        kStart += kStartRnd
        kIndx += 1
        od
    endif
endin


instr bowSound
 iActive active "bowMachine"
    if p3 == -1 && iActive >= 1 then
    turnoff
    endif
 kGainIn cabbageGet "wgamp"
 kGain ampdb kGainIn-20
 aGain interp kGain
    if p3 == -1 && iActive == 0 then
    cabbageSet 1, "bowlight", "colour(200, 150, 100)"
    gkMidiBow = 1
    iMidi notnum
        if iMidi <= 7 then
        turnoff
        endif
;    iFrq mtof iMidi
    iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
    iRatio = iTune/440
    iFrq = iFrqIn*iRatio
    iAtt = 1
    iRel = 1
    aEnv linsegr 0, iAtt, 1, iRel, 0
    aEnvR init 1
        kRelease release
        if kRelease == 1 then
        gkMidiBow = 0
        cabbageSet 1,"bowlight","colour(80, 50, 50, 255)"
        endif
    elseif p3 != -1 then
    iFrq random 80, 400
    aEnv linseg 0, p3/2, 1, p3/2, 0
    aEnvR linsegr 1, 0.1, 0
    endif
 kSpeedMinIn cabbageGet "spdstrngmin"
 kSpeedMaxIn cabbageGet "spdstrngmax"
 kPoseIn cabbageGet "pos"
 kFilterIn cabbageGet "wgfilt"
 
  kPose rateCCk kPoseIn,0.025, 2.5
   kSpeedMin rateCCk kSpeedMinIn, 0.2, 5
 kSpeedMax rateCCk kSpeedMaxIn, 1, 12
  kFilter rateCCk kFilterIn,700, 10000
  
  cabbageSetValue "poss", kPose
  cabbageSetValue "wgfilts", kFilter
 cabbageSetValue "spdstrngmins", kSpeedMin
 cabbageSetValue "spdstrngmaxs", kSpeedMax
 
 kPortTime linseg 0, 0.01, 0.1
; kPosIn portk kPosIn, kPortTime
 iAmp ampdb -15
 kFrq init 60
 kRate init 0.026
 kCent cabbageGet "wgcent"
 kCentRnd    jspline  kCent, kSpeedMin, kSpeedMax
 kFrq = iFrq*cent(kCentRnd)
 kPres  rspline  2.5, 3.5, kSpeedMin, kSpeedMax ;1-5  (3)
 kRate   rspline 0.026, kPose, kSpeedMin, kSpeedMax  ;0.025 - 0.23  (0.1)
 aBow	wgbow    iAmp,kFrq,kPres,kRate,0,0;,giSine;, iFrqMin
 aFiltBow clfilt aBow, kFilter+(iFrq*0.5), 0, 10
 aFiltBow clfilt aFiltBow, 150, 1, 10
 
 aOut = aFiltBow*aGain*aEnv*aEnvR
 ;outall aOut
 chnmix aOut, "sndwg"
endin



instr fluteSound
 iActive active "fltMachine"
    if p3 == -1 && iActive >= 1 then
    turnoff
    endif
 kGainIn cabbageGet "wgamp"
 kGain ampdb kGainIn-20
 aGain interp kGain
    if p3 == -1 && iActive == 0 then
    cabbageSet 1,"flutelight","colour(100, 200, 100)"
    gkMidiFlt = 1
    iMidi notnum
        if iMidi <= 7 then
        turnoff
        endif
    iAtt = 1
    iRel = 1
    aEnv linsegr 0, iAtt, 1, iRel, 0
    aEnvR init 1
;    iFrq mtof iMidi
    iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
    iRatio = iTune/440
    iFrq = iFrqIn*iRatio
        kRelease release
        if kRelease == 1 then
        cabbageSet 1,"flutelight","colour(80, 50, 50, 255)"
        gkMidiFlt = 0
        endif
    elseif p3 >= 0 then
    aEnv linseg 0, p3/2, 1, p3/2, 0
    aEnvR linsegr 1, 0.1, 0
 	iFrq random 100, 500
    endif
 kJetMaxIn cabbageGet "pos"
 kSpeedMinIn cabbageGet "spdstrngmin"
 kSpeedMaxIn cabbageGet "spdstrngmax"
 kFilterIn cabbageGet "wgfilt"
 
  kJetMax rateCCk kJetMaxIn,0.081,0.56
  kSpeedMin rateCCk kSpeedMinIn,0.4,3
  kSpeedMax rateCCk kSpeedMaxIn,0.7, 10
  kFilter rateCCk kFilterIn,700, 10000
  
  cabbageSetValue "poss", kJetMax
  cabbageSetValue "spdstrngmins", kSpeedMin
  cabbageSetValue "spdstrngmaxs", kSpeedMax
  cabbageSetValue "wgfilts", kFilter
 iAmp ampdb -15 
 kJet init 0.081
 kJet rspline 0.081, kJetMax, kSpeedMin, kSpeedMax
 kAirSound rspline 0, 0.05, kSpeedMin, kSpeedMax
 kCent cabbageGet "wgcent"
 kCentRnd jspline kCent, kSpeedMin, kSpeedMax
 kFrq init 60
 kFrq = iFrq*cent(kCentRnd)
 iAtt = 0.1
 iDecay = 0.1
 aFlute  wgflute iAmp, kFrq, kJet, iAtt, iDecay, kAirSound, 0, 0;, iWave,iFrqMin
 aFiltFlute clfilt aFlute, kFilter+(iFrq*0.5), 0, 10
 aFiltFlute clfilt aFiltFlute, 250, 1, 10
 aOut = aFiltFlute*aGain*aEnv*aEnvR
 chnmix aOut, "sndwg"

endin



instr clarinetSound
 iActive active "clrMachine"
    if p3 == -1 && iActive >= 1 then
    turnoff
    endif
 kGainIn cabbageGet "wgamp"
 kGain ampdb kGainIn-20
 aGain interp kGain
    if p3 == -1 && iActive == 0 then
    cabbageSet 1,"clarinetlight","colour(70, 200, 250)"
    gkMidiClr = 1
    iMidi notnum
        if iMidi <= 7 then
        turnoff
        endif
    iAtt = 1
    iRel = 1
    aEnv linsegr 0, iAtt, 1, iRel, 0
    aEnvR init 1
;    iFrq mtof iMidi
    iFrqIn mtof iMidi
    iTuneIn cabbageGetValue "tune"
        if iTuneIn == 1 then
        iTune = 440
        elseif iTuneIn == 2 then
        iTune = 432
        endif
    iRatio = iTune/440
    iFrq = iFrqIn*iRatio
        kRelease release
        if kRelease == 1 then
        gkMidiClr = 0
        cabbageSet 1,"clarinetlight","colour(80, 50, 50, 255)"
        endif
    elseif p3 >= 0 then
    aEnv linseg 0, p3/2, 1, p3/2, 0
    aEnvR linsegr 1, 0.1, 0
 	iFrq random 200, 700
    endif
    
    
 kSpeedMinIn cabbageGet "spdstrngmin"
 kSpeedMaxIn cabbageGet "spdstrngmax"
 kAirIn cabbageGet "pos"
 kFilterIn cabbageGet "wgfilt"
 
  kAir rateCCk kAirIn,0, 0.5
 kSpeedMin rateCCk kSpeedMinIn, 3, 7
 kSpeedMax rateCCk kSpeedMaxIn, 5, 12
  kFilter rateCCk kFilterIn,700, 10000
  
  cabbageSetValue "poss", kAir
  cabbageSetValue "wgfilts", kFilter
 cabbageSetValue "spdstrngmins", kSpeedMin
 cabbageSetValue "spdstrngmaxs", kSpeedMax
 
 iAmp ampdb -15
 kCent cabbageGet "wgcent" 
 kCentRnd jspline kCent+50, kSpeedMin*1.5, kSpeedMax*2
 kFrq init 60
 kFrq = iFrq*cent(kCentRnd)
 kStiff rspline -0.4, -0.2, kSpeedMin, kSpeedMax
 iAtt1 = 0.1
 iDetk = 0.1
 kAirRnd rspline 0, kAir, kSpeedMin, kSpeedMax
 aClar wgclar iAmp, kFrq, kStiff, iAtt1, iDetk, kAirRnd, 0, 0
 aFiltClr clfilt aClar, kFilter+(iFrq*0.5), 0, 10
 aFiltClr clfilt aFiltClr, 250, 1, 10
 aOut = aFiltClr*aGain*aEnv
 chnmix aOut, "sndwg"
 ;outall aFiltClr
endin




instr wgAmbSound
 kGainIn cabbageGet "wgamp"
 kGain ampdb kGainIn-20
 aGain interp kGain
 iFrqMin cabbageGetValue "wgfrq"
    if p3 == -1 then
    turnoff
    endif
    aEnv linseg 0, p3/2, 1, p3/2, 0
    iFrqBw random 80, 800
    iFrqClr = iFrqBw*0.7
  kSpeedMinIn cabbageGet "spdstrngmin"
 kSpeedMaxIn cabbageGet "spdstrngmax"
 kFilterIn cabbageGet "wgfilt"
 
 kSpeedMin rateCCk kSpeedMinIn, 0.1, 0.7
 kSpeedMax rateCCk kSpeedMaxIn, 0.3, 1
  kFilter rateCCk kFilterIn,200, 12000
  
  cabbageSetValue "wgfilts", kFilter
 cabbageSetValue "spdstrngmins", kSpeedMin
 cabbageSetValue "spdstrngmaxs", kSpeedMax
 
; print iFrqClrIn
    ;;clr
    iAmpClr ampdb -15
    kCentClr jspline 10, 12, 20
    kFrqClr init 60
	kFrqClr = iFrqClr*cent(kCentClr)
    kStiff rspline -0.3, -0.2, kSpeedMin, kSpeedMax
    iAtt = 0.1
    iDetk = 0.1
    kAirRnd rspline 0, 0.3, 0.4, 2
    aClar wgclar iAmpClr, kFrqClr, kStiff, iAtt, iDetk, \
    kAirRnd, 0, 0

    ;;bow
    iAmpBw  ampdb -15
    kFrqBw init 60
    kPres init 0.026
    kCentBw jspline 50, kSpeedMin, kSpeedMax*0.8
    kFrqBw = iFrqBw*cent(kCentBw)
    kPres rspline 2.5, 3.5, kSpeedMin*2, kSpeedMax*2
	kRate rspline 0.026, 0.2, kSpeedMin*3, kSpeedMax*3
    aBow  wgbow iAmpBw, kFrqBw, kPres, kRate, 0, 0
    
    kBwLFO  rspline 0.1, 5, 12, 20
    kClrLFO rspline 0.1, 10, 12, 20
      aBwLFO  lfo 1, kBwLFO
      aClrLFO lfo 1, kClrLFO
   ;;output
    aSum   sum aBow*aBwLFO, aClar*aClrLFO
    kFiltRnd rspline kFilter*0.9, kFilter*1.1, kSpeedMin, kSpeedMax
    aFilt clfilt aSum, kFiltRnd, 0, 10
    aFilt clfilt aFilt, 150, 1, 10
    aDel delay aFilt, 0.4
    aMix ntrpol aFilt, aDel, 0.3  
    aOut = aMix*aGain*aEnv
    chnmix aOut, "sndwg"
;   outall aClar
endin


 ;;morse
 gkMorse init 0
instr morse
    if gkMorse == 0 then
    cabbageSet 1,"morselight","colour(80, 50, 50, 255)"
    elseif gkMorse == 1 then
    cabbageSet 1,"morselight","colour(70, 200, 100)"
    endif
 Stype cabbageGet "morsetxt"
 puts Stype,1
    if changed(Stype) == 1 && gkMorse == 0 then
    schedulek "morseR", 0, 1, Stype
    schedulek "morseLetter", 0.1, 1
    endif
endin

instr morseR
 gkMorse = 1
 giIndx init 0
 index = 0
 Stype = p4
 iLen       strlen     Stype 
 giLen = iLen
 giTypeArr[] init iLen	
 while index < iLen do
 ichr       strchar    Stype, index
 giTypeArr[index]  = ichr
 index += 1
 od
endin

instr morseLetter
 iChar = giTypeArr[giIndx]
 iMorseArr_A[] fillarray 1,2
 iMorseArr_B[] fillarray 2,1,1,1
 iMorseArr_C[] fillarray 2,1,2,1
 iMorseArr_D[] fillarray 2,1,1
 iMorseArr_E[] fillarray 1
 iMorseArr_F[] fillarray 1,1,2,1
 iMorseArr_G[] fillarray 2,2,1
 iMorseArr_H[] fillarray 1,1,1,1
 iMorseArr_I[] fillarray 1,1
 iMorseArr_J[] fillarray 1,2,2,2
 iMorseArr_K[] fillarray 2,1,2
 iMorseArr_L[] fillarray 1,2,1,1
 iMorseArr_M[] fillarray 2,2
 iMorseArr_N[] fillarray 2,1
 iMorseArr_O[] fillarray 2,2,2
 iMorseArr_P[] fillarray 1,2,2,1
 iMorseArr_Q[] fillarray 2,2,1,2
 iMorseArr_R[] fillarray 1,2,1
 iMorseArr_S[] fillarray 1,1,1
 iMorseArr_T[] fillarray 2
 iMorseArr_U[] fillarray 1,1,2
 iMorseArr_V[] fillarray 1,1,1,2
 iMorseArr_W[] fillarray 1,2,2
 iMorseArr_X[] fillarray 2,1,1,2
 iMorseArr_Y[] fillarray 2,1,2,2
 iMorseArr_Z[] fillarray 2,2,1,1
    if iChar == 97 then
    giMorseArr[] = iMorseArr_A
    elseif iChar == 98 then
    giMorseArr[] = iMorseArr_B
    elseif iChar == 99 then
    giMorseArr[] = iMorseArr_C
    elseif iChar == 100 then
    giMorseArr[] = iMorseArr_D
    elseif iChar == 101 then
    giMorseArr[] = iMorseArr_E
    elseif iChar == 102 then
    giMorseArr[] = iMorseArr_F
    elseif iChar == 103 then
    giMorseArr[] = iMorseArr_G
    elseif iChar == 104 then
    giMorseArr[] = iMorseArr_H
    elseif iChar == 105 then
    giMorseArr[] = iMorseArr_I
    elseif iChar == 106 then
    giMorseArr[] = iMorseArr_J
    elseif iChar == 107 then
    giMorseArr[] = iMorseArr_K
    elseif iChar == 108 then
    giMorseArr[] = iMorseArr_L
    elseif iChar == 109 then
    giMorseArr[] = iMorseArr_M
    elseif iChar == 110 then
    giMorseArr[] = iMorseArr_N
    elseif iChar == 111 then
    giMorseArr[] = iMorseArr_O
    elseif iChar == 112 then
    giMorseArr[] = iMorseArr_P
    elseif iChar == 113 then
    giMorseArr[] = iMorseArr_Q
    elseif iChar == 114 then
    giMorseArr[] = iMorseArr_R
    elseif iChar == 115 then
    giMorseArr[] = iMorseArr_S
    elseif iChar == 116 then
    giMorseArr[] = iMorseArr_T
    elseif iChar == 117 then
    giMorseArr[] = iMorseArr_U
    elseif iChar == 118 then
    giMorseArr[] = iMorseArr_V
    elseif iChar == 119 then
    giMorseArr[] = iMorseArr_W
    elseif iChar == 120 then
    giMorseArr[] = iMorseArr_X
    elseif iChar == 121 then
    giMorseArr[] = iMorseArr_Y
    elseif iChar == 122 then
    giMorseArr[] = iMorseArr_Z
    elseif iChar == 32 then
    giMorseArr[] fillarray 5
    endif
 schedule "morseMachine",0.3,99999,iChar
endin



instr morseMachine
 iBPM cabbageGetValue "morsebpm" ; 120
 iTempo = iBPM/60
 kTime init iTempo
 kMorseIndx init 0
    if metro(1/kTime) == 1 then
    kTime = (giMorseArr[kMorseIndx])/(iTempo*4)
    schedulek "morseSound", 0, kTime*0.5,p4
    kMorseIndx += 1
    endif
    if kMorseIndx == lenarray(giMorseArr) && changed(kMorseIndx) == 1 then
    giIndx += 1
	    if giIndx >= giLen then
	    gkMorse = 0
	    turnoff
	    endif
    schedulek "morseLetter",0,1
    turnoff
    endif
endin




instr morseSound
 iFrq cabbageGetValue "morsefrq"
 iMorseNoise cabbageGetValue "morsenoise"
 iMorseSine cabbageGetValue "morsesine"
 iNoiseGain = iMorseNoise
 iSineGain = iMorseSine
 iAmpIn cabbageGetValue "morseamp"
 iAmp ampdb iAmpIn
    if p4 == 32 then
    iGain = 0
    else
    iGain = 1
    endif
 iAtt = 0.01
 iTest = (p3-iAtt)-(iAtt*2)
 aEnv linseg 0,iAtt,iAmp,(p3-iAtt)-(iAtt*2),iAmp,iAtt,0
 aSound poscil aEnv, iFrq
 aNoise noise aEnv, 0.9
 iFilter cabbageGetValue "morsefilt"
 aNoise clfilt  aNoise, iFilter, 0, 10
 aNoiseOut clfilt aNoise*ampdb(3), iFilter*0.9, 1, 10
 aOut = ((aSound*iSineGain)+(aNoise*iNoiseGain))*iGain
 chnmix aOut, "sndout"
 ;outall aOut
 cabbageSet 1,"morseplight","colour(70, 200, 70)"
if release() == 1 then
cabbageSet 1,"morseplight","colour(80, 50, 50, 255)"
endif
endin



instr sampleSound
SFilenames[] directory ".", ".wav"
iFileNumbers lenarray SFilenames
indx = int(random:i(0,iFileNumbers))
Sfile = SFilenames[indx]
iLenFile filelen Sfile
iSlen    strlen   Sfile
Sout strsub    Sfile, 2, iSlen-4
puts Sout,1
    SoutShow     sprintfk "text(%s)", Sout
    cabbageSet 1, "sampleshow",SoutShow
cabbageSet 1,"samplelight","colour(200, 50, 100)"
if release() == 1 then
cabbageSet 1,"samplelight","colour(80, 50, 50, 255)"
        SoutShow     sprintfk "text(%s)", " "
    cabbageSet 1, "sampleshow",SoutShow
endif

kAmp cabbageGet "sampleamp"
aSound diskin2 Sfile, 1, 0, 0
aOut = aSound*ampdb(kAmp)
chnmix aOut, "sndout"
endin


; Effects
instr FxDust
 aIn chnget "snddust"
 aRvrb,aRvrb  reverbsc aIn,aIn, 0.65, 17000, sr, 1, 1
 aMix ntrpol aIn, aRvrb, 0.4
 iRel = 2
 aEnv linsegr 1, iRel, 0
 aOut = aMix*aEnv
 outall aOut
 chnclear "snddust"
endin

instr FxSeq
 aIn chnget "sndseq"
 giDelayTime init 0.4
 giFeedback init 0.3
 aTim	interp	giDelayTime
 abuf	delayr	15
 aDelay	deltapi	aTim	
 delayw	aIn + (aDelay*giFeedback)
 kDelayMix rspline 0.2, 0.7, 1, 3
 aDelayMix ntrpol aIn, aDelay, kDelayMix
 kRvrbSize cabbageGet "rsizeseq"
 kRvrbRoom cabbageGet "rroomeseq"
 ;;
 aRvrb nreverb aDelayMix, kRvrbSize, kRvrbRoom
; aRvrb,aRvrb  reverbsc aDelayMix,aDelayMix, 0.7, 3000, sr, 0.3, 1
 kRvbMix rspline 0.3, 0.7, 2, 5
 aMix ntrpol aIn, aRvrb, kRvbMix
 iRel = 2
 aEnv linsegr 1, iRel, 0
 aOut = aMix*aEnv
 outall aOut
 chnclear "sndseq"
endin


instr FxWg
 aIn chnget "sndwg"
 aRvrb  nreverb aIn, 2, 0.3
 aMix ntrpol aIn, aRvrb, 0.3
 aOut = aMix;*aEnv
 outall aOut
 chnclear "sndwg"
endin


instr FxOut
 aIn chnget "sndout"
 aOut = aIn
outall aOut
 chnclear "sndout"
endin





gkSpeaker1 init -45
gkSpeaker2 init -45
gkSpeaker3 init -60
gkSpeaker4 init -60

gkSpkrCopy1 init -45
gkSpkrCopy2 init -45
gkSpkrCopy3 init -60
gkSpkrCopy4 init -60


instr Speaker
iMidi notnum
iVel veloc
iSpeed = 20
iStart1 = i(gkSpeaker1)
iStart2 = i(gkSpeaker2)
iStart3 = i(gkSpeaker3)
iStart4 = i(gkSpeaker4)

iBaseMidi = 60


if iMidi == iBaseMidi+1 then
print rnd(9)
gkSpeaker1 = gkSpkrCopy1
gkSpeaker2 = gkSpkrCopy2
gkSpeaker3 = gkSpkrCopy3
gkSpeaker4 = gkSpkrCopy4
endif

if iMidi == iBaseMidi then
gkSpeaker1 = int(line:k(iStart1, 1/iSpeed, iStart1-1))
elseif iMidi == iBaseMidi+2 then
gkSpeaker1 = int(line:k(iStart1, 1/iSpeed, iStart1+1))
endif
if iMidi == iBaseMidi+4 then
gkSpeaker2 = int(line:k(iStart2, 1/iSpeed, iStart2-1))
elseif iMidi == iBaseMidi+5 then
gkSpeaker2 = int(line:k(iStart2, 1/iSpeed, iStart2+1))
endif
if iMidi == iBaseMidi+7 then
gkSpeaker3 = int(line:k(iStart3, 1/iSpeed, iStart3-1))
elseif iMidi == iBaseMidi+9 then
gkSpeaker3 = int(line:k(iStart3, 1/iSpeed, iStart3+1))
endif
if iMidi == iBaseMidi+11 then
gkSpeaker4 = int(line:k(iStart4, 1/iSpeed, iStart4-1))
elseif iMidi == iBaseMidi+12 then
gkSpeaker4 = int(line:k(iStart4, 1/iSpeed, iStart4+1))
endif
cabbageSetValue  "out1", gkSpeaker1+65
cabbageSetValue  "outn1", gkSpeaker1
cabbageSetValue  "out2", gkSpeaker2+65
cabbageSetValue  "outn2", gkSpeaker2
cabbageSetValue  "out3", gkSpeaker3+65
cabbageSetValue  "outn3", gkSpeaker3
cabbageSetValue  "out4", gkSpeaker4+65
cabbageSetValue  "outn4", gkSpeaker4
endin

instr record
SFilenames[] directory "./record", ".wav"
iLen lenarray SFilenames
print iLen
SrecordFile sprintf "record/record%d.wav", iLen
aInArr[] monitor
aIn = aInArr[0]
fout SrecordFile, 8, aIn
endin

instr time
 kTimer line 0, 1, 1
 kSec = int(kTimer)
 kMin init 0
 kSec = kSec % 60
    if kSec == 0 && changed(kSec) == 1 then
    kMin += 1
    endif
 STimer sprintfk "%02d : %02d", kMin, kSec
 cabbageSet 1, "sec", "text", STimer
endin

instr Widgets
 iDurMaster = 9^9
;;start
 kStart init 0
 kStart cabbageGet "start"
 kRecord cabbageGet "rcrd"
    if kStart == 1 && changed(kStart) == 1  then
    schedulek "time", 0, iDurMaster
    schedulek "FxWg", 0, iDurMaster
    schedulek "FxDust", 0, iDurMaster
    schedulek "FxSeq", 0, iDurMaster
    schedulek "FxOut", 0, iDurMaster
        if kRecord == 1 then
        schedulek "record", 0, iDurMaster
        endif
    elseif kStart == 0 && changed(kStart) == 1 then
    turnoff2 "time", 0, 0
    turnoff2 "FxDust", 0, 0
    turnoff2 "FxSeq", 0, 0
    turnoff2 "FxWg", 0, 0
    turnoff2 "FxOut", 0, 0
    turnoff2 "record", 0, 0
    endif

;;DustMachine
 kDustMachine ctrl7 10, 57, 0, 1
    if kDustMachine == 1 && changed(kDustMachine) == 1 then
    cabbageSet 1,"dustlight","colour(200, 70, 200)"
    schedulek "dustMachine", 0, iDurMaster
    elseif kDustMachine == 0 && changed(kDustMachine) == 1 then
    cabbageSet 1,"dustlight","colour(80, 50, 50, 255)"
    turnoff2 "dustMachine", 0, 0
    turnoff2 "guiroPlay", 0, 0
    turnoff2 "guiroSound", 0, 0
    endif

;;seqMachine
 kSeqMachine ctrl7 10, 58, 0, 1
    if kSeqMachine == 1 && changed(kSeqMachine) == 1 then
    cabbageSet 1,"seqlight","colour(100, 200, 100)"
    schedulek "seqMachine", 0, iDurMaster
    elseif kSeqMachine == 0 && changed(kSeqMachine) == 1 then
    cabbageSet 1,"seqlight","colour(80, 50, 50, 255)"
    turnoff2 "seqMachine", 0, 0
    turnoff2 "sineSound", 0, 0
    turnoff2 "barSound", 0, 0
    turnoff2 "bamSound", 0, 0
    turnoff2 "shakeSound", 0, 0
    turnoff2 "pluckSound", 0, 0
    endif

;;wgMachin
 kMachineSpdMin   ctrl7     1,28,0.1,10
    if changed(kMachineSpdMin) == 1 then
    cabbageSetValue  "machinespdmin", kMachineSpdMin
    endif
 kMachineSpdMax   ctrl7     1,36,0.2,15
    if changed(kMachineSpdMax) == 1 then
    cabbageSetValue  "machinespdmax", kMachineSpdMax
    endif
 kwgBow ctrl7 10, 59, 0, 1
    if kwgBow == 1 && changed(kwgBow) == 1 then
    schedulek "bowMachine", 0, iDurMaster
    elseif kwgBow == 0 && changed(kwgBow) == 1 then
    cabbageSet 1,"bowlight","colour(80, 50, 50, 255)"
    turnoff2 "bowMachine", 0, 0
    turnoff2 "bowSound", 0, 1
    endif
 kwgFlute ctrl7 10, 60, 0, 1
    if kwgFlute == 1 && changed(kwgFlute) == 1 then
    schedulek "fltMachine", 0, iDurMaster
    elseif kwgFlute == 0 && changed(kwgFlute) == 1 then
    cabbageSet 1,"flutelight","colour(80, 50, 50, 255)"
    turnoff2 "fltMachine", 0, 0
    turnoff2 "fluteSound", 0, 1
    endif
 kwgClr ctrl7 10, 61, 0, 1
    if kwgClr == 1 && changed(kwgClr) == 1 then
    schedulek "clrMachine", 0, iDurMaster
    elseif kwgClr == 0 && changed(kwgClr) == 1 then
    cabbageSet 1,"clarinetlight","colour(80, 50, 50, 255)"
    turnoff2 "clrMachine", 0, 0
    turnoff2 "clarinetSound", 0, 1
    endif
 kwgAmb ctrl7 10, 62, 0, 1
    if kwgAmb == 1 && changed(kwgAmb) == 1 then
    schedulek "ambwgMachine", 0, iDurMaster
    elseif kwgAmb == 0 && changed(kwgAmb) == 1 then
    cabbageSet 1,"wgamblight","colour(80, 50, 50, 255)"
    turnoff2 "ambwgMachine", 0, 0
    turnoff2 "wgAmbSound", 0, 1
    turnoff2 "pluckSound", 0, 1
    endif
    
  ;;kAnalog ctrl7 10, 63, 0, 1

;;noise
  kNoiseRng   ctrl7     1,0,0,500
    if changed(kNoiseRng) == 1 then
    cabbageSetValue  "noiserng", kNoiseRng
    endif
  kAmpNoise   ctrl7    1,21,0,30
    if changed(kAmpNoise) == 1 then
    cabbageSetValue  "noiseamp", kAmpNoise
    endif  
  kNoisePress   ctrl7     1,22,30,400
    if changed(kNoisePress) == 1 then
    cabbageSetValue  "noisepress", kNoisePress
    cabbageSetValue  "noisepresss", kNoisePress
    endif  
  knFilter   ctrl7     1,31,200,9000
    if changed(knFilter) == 1 then
    cabbageSetValue  "nfilt", knFilter
    cabbageSetValue  "nfilts", knFilter
    endif
  
    
 ;;wg setting
 kPos   ctrl7    1,23,0,1
    if changed(kPos) == 1 then
    cabbageSetValue  "pos", kPos
    cabbageSetValue  "poss", kPos
    endif
    
 kSpeedMin   ctrl7    1,27,0,1 
    if changed(kSpeedMin) == 1 then
    cabbageSetValue "spdstrngmin", kSpeedMin
    cabbageSetValue "spdstrngmins", kSpeedMin
    endif
 kSpeedMax   ctrl7     1,35,0,1
    if changed(kSpeedMax) == 1 then
    cabbageSetValue  "spdstrngmax", kSpeedMax
    cabbageSetValue  "spdstrngmaxs", kSpeedMax
    endif
    
  kwgFilter   ctrl7     1,33,0,1
    if changed(kwgFilter) == 1 then
;    cabbageSetValue  "wgfilt", kwgFilter
    cabbageSetValue  "wgfilts", kwgFilter
    endif
    
 kAmpWg   ctrl7    1,29,0,30
    if changed(kAmpWg) == 1 then
    cabbageSetValue  "wgamp", kAmpWg
    endif  

  kwgCent   ctrl7     1,24,0,500
    if changed(kwgCent) == 1 then
    cabbageSetValue  "wgcent", kwgCent
    endif

 ;; morse
 kMorseStart cabbageGet "morsestart"
    if kMorseStart == 1 && changed(kMorseStart) == 1 then
    schedulek "morse", 0, iDurMaster
    elseif kMorseStart == 0 && changed(kMorseStart) == 1 then
    turnoff2 "morse", 0, 0
    turnoff2 "morseLetter", 0, 0
    turnoff2 "morseMachine", 0, 0
    turnoff2 "morseSound", 0, 0
    endif
    
    
    
    kSus1   ctrl7     1,64,0,1
    if kSus1 == 1 && changed(kSus1) == 1 then
    cabbageSet 1, "suslight","colour(250, 150, 200)"
    elseif kSus1 == 0 && changed(kSus1) == 1 then
    cabbageSet 1, "suslight","colour(80, 50, 50, 255)"
    endif
    
    kSus2   ctrl7     3,64,0,1
    if kSus2 == 1 && changed(kSus2) == 1 then
    cabbageSet 1, "sus2light","colour(250, 150, 200)"
    elseif kSus2 == 0 && changed(kSus2) == 1 then
    cabbageSet 1, "sus2light","colour(80, 50, 50, 255)"
    endif
    
    
 kstatus, kchan, kdata1, kdata2  midiin
 if changed(kchan) == 1 then
 SchShow     sprintfk "text(%d)", kchan
 cabbageSet 1, "datach", SchShow
 endif
    if changed(kdata2) == 1 then
    SMidiShow     sprintfk "text(%d)", kdata2
    cabbageSet 1, "data",SMidiShow
    cabbageSetValue "data", kdata2
    endif

endin



</CsInstruments>
<CsScore>
i "Widgets" 0 [9^9]
</CsScore>
</CsoundSynthesizer>

