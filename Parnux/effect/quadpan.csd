/*
QuadPan — quadraphonic auto-panner with slow, continuous motion between channels.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2026.
parhamizadyar.net
*/
<Cabbage>
form caption("quadpan") size(350, 350), guiMode("queue") pluginId("qpan") colour(10,20,35)
vmeter bounds(132, 232, 15, 100) channel("meterr1")  outlineColour(0, 0, 0, 255), overlayColour(20, 30, 30, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
vmeter bounds(158, 232, 15, 100) channel("meterr2")  outlineColour(0, 0, 0, 255), overlayColour(20, 30, 30, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)
vmeter bounds(184, 232, 15, 100) channel("meterr3")  outlineColour(0, 0, 0, 255), overlayColour(20, 30, 30, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255) 
vmeter bounds(208, 232, 15, 100) channel("meterr4")  outlineColour(0, 0, 0, 255), overlayColour(20, 30, 30, 255)    outlineThickness(0)    value(0) meterColour:0(0, 193, 250, 255)
rslider bounds(40, 272, 60, 60), channel("maingain"), text("Gain"), range(-25, 20, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(256, 272, 60, 60), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
combobox bounds(246, 36, 77, 27) channel("panmod") colour(74, 77, 79, 255)  value(1) text("norm","MIDI")
rslider bounds(24, 56, 60, 60), channel("spd"), text("speed"), range(0.01, 0.7, 0.5, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(104, 66, 50, 50), channel("spdrnd"), text("spd rnd"), range(0.1, 12, 3, 1, 0.1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 
rslider bounds(156, 66, 50, 50), channel("rngrnd"), text("rng rnd"), range(0.01, 0.2, 0.04, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) 

label bounds(14, 18, 142, 17) channel("title") text("quadro panning")
button bounds(246, 68, 76, 22) channel("reset") text("reset", "reset") colour:0(74, 77, 79, 255) colour:1(74, 77, 79, 255)

checkbox bounds(306, 96, 17, 17) channel("rnd") colour:0(68, 74, 79, 255) colour:1(224, 51, 30, 255) value(1)
image bounds(305, 15, 10, 10) channel("midiled") colour(113, 122, 125, 255)
label bounds(248, 8, 48, 24) channel("showr") text("")
label bounds(192, 8, 48, 24) channel("shows") text("")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 64
;nchnls = 2
0dbfs = 1

seed 0
giY = 135
giRndArr[] init 2
gindx init 0

giRndArrDub[] init 2
gindxDub init 0

//i-rate version
opcode RndNoRep, i,ii
iMin, iMax xin
	start:
	iRnd = int(random:i(iMin,iMax))	
	giRndArr[gindx] = iRnd
	iCheck = (gindx == 0 ) ? 1: 0
	 if iRnd == giRndArr[iCheck] igoto start
	  igoto pass
   pass:
gindx = (gindx+1) % 2
xout iRnd
endop

opcode RndNoRepDub, i,ii
iMin, iMax xin
	start:
	iRnd = int(random:i(iMin,iMax))	
	giRndArr[gindx] = iRnd
	iCheck = (gindx == 0 ) ? 1: 0
	 if iRnd == giRndArr[iCheck] igoto start
	 if iRnd == giRndArrDub[gindxDub] igoto start
	  igoto pass
   pass:
gindx = (gindx+1) % 2
gindxDub = (gindxDub+1) % 2
xout iRnd
endop



instr midiGet
iChnIn notnum
Sshow sprintf "text(r: %d)", iChnIn
cabbageSet "showr", Sshow
Scolor = "colour(44, 243, 255, 255)"
cabbageSet 1,"midiled",Scolor
if release() == 1 then
ScolorOff = "colour(113, 122, 125, 255)"
cabbageSet 1,"midiled",ScolorOff
endif
giRndArrDub[gindx] = iChnIn
endin

instr quadpan

;iCh = nchnls
;if iCh == 1 then
;aIn1 inch 1
;aIn2 inch 1
;aIn3 inch 1
;aIn4 inch 1
;elseif  iCh == 2 then
aIn1 inch 1
aIn2 inch 2
aIn3 = aIn1
aIn4 = aIn2
;elseif  iCh == 4 then
;aIn1 inch 1
;aIn2 inch 2
;aIn3 inch 3
;aIn4 inch 4
;endif
;aIn1,aIn2 diskin2 "../test.wav", 1, 0, 1
;aIn3 = aIn1
;aIn4 = aIn2
aIn sum aIn1,aIn2,aIn3,aIn4

kPanMod cabbageGet "panmod"
kSpd cabbageGet "spd"

kSpdRnd cabbageGet "spdrnd"
kRngRnd cabbageGet "rngrnd"

iArrChn[] fillarray 1,0
indxArr = 0
UPDATE:
kTime line 0,1,1
iDur random i(kSpd)*0.8, i(kSpd)*1.2
   if i(kPanMod) == 1 then
   iChn RndNoRep 1,5
   elseif i(kPanMod) == 2 then
   iChn RndNoRepDub 1,5
   schedule "sendChn", 0, 0.3, iChn
   endif
   
kChn = iChn-1
indxArr = (indxArr+1)%2
iArrChn[indxArr] = iChn
indxPrv = indxArr == 0 ? 1 : 0
iChnPrv = iArrChn[indxPrv]
kChnPrv = iChnPrv-1
;print iChn

kAmpUp linseg 0, 1/iDur, 1
kAmpDown linseg 1, 1/iDur, 0
SmeterOn sprintf "meter%d",iChn
SmeterOff sprintf "meter%d",iChnPrv
Sprint sprintf "%s | %s", SmeterOn,SmeterOff
;puts Sprint,1
rireturn

;printk2 kChn
if cabbageGet:k("rnd") == 0 then
kRnd = 0
elseif cabbageGet:k("rnd") == 1 then
kRnd randi kRngRnd, kSpdRnd
endif
kAmpUp += kRnd
kAmpDown -= kRnd

if kAmpUp > 1 then
kAmpUp = 1
endif

if kAmpDown > 1 then
kAmpDown = 1
endif
	 if kAmpUp == 1 then
	  reinit UPDATE
	 endif


SsizeOn sprintfk "bounds(22, %d, %d, 10)" ,(kChn*18)+giY, kAmpUp*300
SsizeOff sprintfk "bounds(22, %d, %d, 10)" ,(kChnPrv*18)+giY, kAmpDown*300


cabbageSet 1, SmeterOn, SsizeOn
cabbageSet 1, SmeterOff, SsizeOff

if     kChn+1 == 1 then
kAmp1 = kAmpUp
elseif kChn+1 == 2 then
kAmp2 = kAmpUp
elseif kChn+1 == 3 then
kAmp3 = kAmpUp
elseif kChn+1 == 4 then
kAmp4 = kAmpUp
endif
Reset:
kAmp1 init 0
kAmp2 init 0
kAmp3 init 0
kAmp4 init 0
rireturn
if     kChnPrv+1 == 1 then
kAmp1 = kAmpDown
elseif kChnPrv+1 == 2 then
kAmp2 = kAmpDown
elseif kChnPrv+1 == 3 then
kAmp3 = kAmpDown
elseif kChnPrv+1 == 4 then
kAmp4 = kAmpDown
endif


aAmp1 interp kAmp1
aAmp2 interp kAmp2
aAmp3 interp kAmp3
aAmp4 interp kAmp4

aOut1 = aIn*kAmp1
aOut2 = aIn*kAmp2
aOut3 = aIn*kAmp3
aOut4 = aIn*kAmp4

kMix cabbageGet "mix"
kGain cabbageGet "maingain"
 aMix1  ntrpol  aIn1, aOut1*ampdb(kGain), kMix
 aMix2  ntrpol  aIn2, aOut2*ampdb(kGain), kMix
 aMix3  ntrpol  aIn3, aOut3*ampdb(kGain), kMix
 aMix4  ntrpol  aIn4, aOut4*ampdb(kGain), kMix
 kMax1 max_k aMix1, metro(20), 1
 kMax2 max_k aMix2, metro(20), 1
 kMax3 max_k aMix3, metro(20), 1
 kMax4 max_k aMix4, metro(20), 1
 kMeter1 dbfsamp kMax1
 kMeter2 dbfsamp kMax2
 kMeter3 dbfsamp kMax3
 kMeter4 dbfsamp kMax4
 cabbageSetValue "meterr1", kMax1, metro(20)
 cabbageSetValue "meterr2", kMax2, metro(20)
 cabbageSetValue "meterr3", kMax3, metro(20)
 cabbageSetValue "meterr4", kMax4, metro(20)
 
 if release() == 1 then
 Sm1 sprintfk "bounds(22, %d, %d, 10)" ,(1*18)+giY, k(0)
 Sm2 sprintfk "bounds(22, %d, %d, 10)" ,(2*18)+giY, k(0)
 Sm3 sprintfk "bounds(22, %d, %d, 10)" ,(3*18)+giY, k(0)
 Sm4 sprintfk "bounds(22, %d, %d, 10)" ,(4*18)+giY, k(0)


cabbageSet 1, "meter1", Sm1
cabbageSet 1, "meter2", Sm2
cabbageSet 1, "meter3", Sm3
cabbageSet 1, "meter4", Sm4
 endif
 
out aMix1,aMix2,aMix3,aMix4
endin



instr sendChn
Sshow sprintf "text(s: %d)",p4
cabbageSet 1, "shows", Sshow

midion 1, p4, 10
Scolor = "colour(44, 243, 255, 255)"
cabbageSet 1,"midiled",Scolor
if release() == 1 then
ScolorOff = "colour(113, 122, 125, 255)"
cabbageSet 1,"midiled",ScolorOff
endif
endin


instr widgetWrite

 iY = giY
 indx = 0
 while indx < 4 do
 SmeterB    sprintf "bounds(22, %d, 300, 10),\
 channel(\"meterb%d\") colour(30, 40, 50, 255)", iY, indx+1
 cabbageCreate "image", SmeterB 
 Smeter    sprintf "bounds(22, %d, 0, 10),\
 channel(\"meter%d\") colour(69, 171, 226, 255)", iY, indx+1
 cabbageCreate "image", Smeter 

 indx += 1
 iY += 18
 od

endin


instr widget
kReset cabbageGet "reset"

if changed(kReset) == 1 then
turnoff2 "quadpan", 0, 1
schedulek "quadpan", 0, 99999
endif

endin

</CsInstruments>
<CsScore>
i "quadpan" 0 99999
i "widget" 0 99999
i "widgetWrite" 0 1
</CsScore>
</CsoundSynthesizer>


