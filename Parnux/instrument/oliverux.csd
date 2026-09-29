/*
Deep-listening pad synthesizer after Pauline Oliveros.
Two waveguide physical-modeling voices.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2026
parhamizadyar.net
*/
<Cabbage>
form caption("oliverux") size(550, 300), guiMode("queue") pluginId("olvr") colour(10,20,35)
button bounds(14, 12, 101, 31) channel("start") text("wg", "stop wg") colour:0(48, 66, 77, 255) colour:1(148, 66, 77, 255)

label bounds(370, 258, 102, 16) channel("tit1") text("master gain:") align("left")
image bounds(476, 254, 60, 25) channel("gainl") colour(56, 58, 60, 255)
nslider bounds(476, 250, 59, 31) channel("gain") range(-60, 20, 0, 1, 1) colour(10,20,35, 0) fontColour(176, 219, 231, 255)

label bounds(404, 192, 66, 16) channel("tit2") text("pad dB:") align("left")
image bounds(476, 188, 60, 25) channel("gain1") colour(56, 58, 60, 255)
nslider bounds(476, 184, 59, 31) channel("wggain") range(-60, 20, 0, 1, 1) colour(10,20,35, 0) fontColour(176, 219, 231, 255)

label bounds(392, 224, 72, 16) channel("tit3") text("pluck dB:") align("left")
image bounds(476, 220, 60, 25) channel("gain2") colour(56, 58, 60, 255)
nslider bounds(476, 216, 59, 31) channel("plkgain") range(-60, 20, 0, 1, 1) colour(10,20,35, 0) fontColour(176, 219, 231, 255)

nslider bounds(22, 50, 79, 38) channel("len") range(1, 12, 7, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("Harmonics")
nslider bounds(108, 50, 79, 38) channel("wide") range(10, 50, 17, 1, 5) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("wide")
nslider bounds(196, 50, 79, 38) channel("vibf") range(0, 5, 4.2, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("vib frq")
nslider bounds(284, 50, 79, 38) channel("vibr") range(0, 0.006, 0.002, 1, 0.001) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("vib rng")
nslider bounds(372, 50, 79, 38) channel("pres") range(0.1, 0.3, 0.2, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("pressure")
nslider bounds(458, 50, 79, 38) channel("rate") range(0.1, 0.9, 0.721, 1, 0.001) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("rate")

nslider bounds(22, 124, 79, 38) channel("spd") range(0, 0.9, 0, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("Hz")
nslider bounds(108, 124, 79, 38) channel("dur") range(1, 5, 3, 1, 1) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("dur")
nslider bounds(196, 124, 79, 38) channel("hif") range(0.5, 8, 2, 1, 0.5) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("hi frq")
nslider bounds(284, 124, 79, 38) channel("filt") range(10, 8000, 0.002, 1, 10) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("Filter")
nslider bounds(372, 124, 79, 38) channel("clip") range(0.1, 0.9, 0.1, 1, 0.01) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("clip")
nslider bounds(458, 124, 79, 38) channel("limit") range(700, 2000, 900, 1, 100) colour(49, 64, 79, 255) fontColour(176, 219, 231, 255) text("limit")

image bounds(514, 32, 17, 17) channel("led") colour(60, 150, 200, 255)
image bounds(514, 106, 17, 17) channel("ledp") colour(80, 80, 90, 255)
signaldisplay bounds(22, 192, 331, 83), channel("display") colour("white") displayType("waveform"), backgroundColour(30,40,50), zoom(-2), signalVariable("aShow")


checkbox bounds(124, 24, 20, 20) channel("pad") colour:0(61, 64, 65, 255) colour:1(236, 255, 0, 255) value(1)
checkbox bounds(26, 104, 20, 20) channel("plk") colour:0(61, 64, 65, 255) colour:1(236, 255, 0, 255) value(1)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n --displays -M0  -+rtmidi=null --midi-key=4 -Q0
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
;nchnls = 2
0dbfs = 1

seed 0

giSine ftgen 0,0,2^10, 10, 1

massign 0,0
massign 1,1




opcode scalei, i,iiiii
iIn, iMinOut,iMaxOut, iMinIn,iMaxIn xin
iRngOut = iMaxOut-iMinOut
iRngIn = iMaxIn-iMinIn
iOut =  ((iIn-iMaxIn)*iRngOut / iRngIn)+iMaxOut
xout iOut
endop

instr wgMachine
 ScolorOn = "colour(60,150,200,255)"
 cabbageSet 1, "led", ScolorOn
 iBowNum     nstrnum "bowSound"
 iPlkNum     nstrnum "pluckTrg"
    if p3 == -1 then
    iMidi notnum
    ;iMidi random 30, 40
    elseif p3 != -1 then
    iMidi random 30, 40
    endif
 iFrq mtof iMidi-12
 indx = 0
 iLen  cabbageGetValue "len"
 iWide cabbageGetValue "wide"
 iDelay = 0.3
 iAmp ampdb -10
   while indx < iLen do
   iDelay random 1, iLen
   schedule iBowNum+(iMidi/100), 0, 9999, iFrq, iAmp/(iLen*3.3)
   schedule iPlkNum+(iMidi/100), 0, 9999, iFrq, iAmp/(iLen*0.3),iDelay
   iRnd random 0, 15
   iFrq += (iWide+iRnd)
   indx += 1
   od
   if release() == 1 then
   turnoff2 iBowNum+(iMidi/100), 4, 1
   turnoff2 iPlkNum+(iMidi/100), 4, 1
   ScolorOff = "colour(60,60,70,255)"
   cabbageSet 1, "led", ScolorOff
   endif
endin





instr bowSound
 kvibfIn cabbageGet "vibf"
 kvibrIn cabbageGet "vibr"
 iPres   cabbageGetValue "pres"
 kRateIn cabbageGet "rate"
 iamp    random p5*0.7, p5
 iFrq = p4
 ipres1   random 0.4-iPres, 0.4+iPres
 ipres2   random 0.6-iPres, 0.6+iPres
 kpres    rspline  ipres1,ipres1,0.3,0.7
 iPresR   scalei iPres, 0.001, 0.006, 0.1, 0.3
 krat     rspline  iPresR,kRateIn,0.1,0.4
 kvibf   = kvibfIn+randi:k(0.1, 4)
 kvibr = kvibrIn+randi:k(0.001, 4)
 kLineVib  linseg 0, 2, 0, 1, 1
 kvibamp = kvibr*kLineVib
 iminfreq = 10
 aSig1 wgbow \
 iamp,iFrq,kpres,krat,kvibf,kvibamp,giSine,iminfreq
 kdel     rspline  0.01,0.1,0.1,0.5
 kpres    vdel_k   kpres,kdel,0.2,2
 aSig2 wgbow \
 iamp,iFrq,kpres,krat,kvibf,kvibamp,giSine,iminfreq
 aMix sum aSig1,aSig2
 aRel linsegr 1, 0.2, 0
 aOut clip aMix*aRel,1,  0.9
 chnmix aOut, "snd1"
endin

instr pluckTrg
kTimeIn cabbageGet "spd"
kDurIn cabbageGet "dur"
 iTime random 6, 12
 kTime = (1/iTime)+kTimeIn
   if metro(kTime) == 1 then
   kDur random 0.1, kDurIn
   schedulek "pluckSound", p6, kDur, p4, p5
   endif
endin

instr pluckSound
if active(1) == 0 goto skip
ScolorOn = "colour(200,150,160,255)"
cabbageSet 1, "ledp", ScolorOn
iFrqHi cabbageGetValue "hif"
iClipIn cabbageGetValue "clip"
iLimit cabbageGetValue "limit"
 aIn chnget "snd1"
 icps = p4*iFrqHi
    until icps < iLimit do
    icps /= 2
    enduntil
 iamp = p5
 ipick random 0.1, 0.9
 iplk random 0.1, 0.9
 idamp random 0.1, 0.9
 iClip random 0.1, iClipIn
 ifilt cabbageGetValue "filt"
 apluck wgpluck icps, iamp, ipick, iplk, idamp, ifilt, aIn
 aClip clip apluck, 0, iClip
 aRvrb,aRvrb reverbsc aClip, aClip, 0.6, 2000
 iAmp = abs(iClip-1) 
 iAtt random 0.001, 0.01
 aEnv transeg 0, iAtt, 6, iAmp, p3-iAtt, -2, 0
 aOut = aRvrb*aEnv
 chnmix aOut ,"snd2"
 skip:
 if release() == 1 then
 ScolorOff = "colour(60,60,70,255)"
 cabbageSet 1, "ledp", ScolorOff
 endif
endin

instr output
 kGaindB cabbageGet "gain"
 kWgdB cabbageGet "wggain"
 kPlkdB cabbageGet "plkgain"
 kPad cabbageGet "pad"
 kPlk cabbageGet "plk"
 aIn1 chnget "snd1"
 aIn1 = aIn1*kPad
 aIn2 chnget "snd2"
 aIn2 = aIn2*kPlk
 aRvrb1,aRvrb1 reverbsc aIn1, aIn1, 0.9, 7000
 aMix1 ntrpol aIn1, aRvrb1, 0.85
 aRvrb2,aRvrb2 reverbsc aIn2, aIn2, 0.6, 9000
 aMix2 ntrpol aIn2, aRvrb2, 0.65
 aOut1 = aMix1*ampdb(kWgdB)
 aOut2 = aMix2*ampdb(kPlkdB)
 aOut dcblock2 (aOut1+aOut2)*ampdb(kGaindB)
 aShow = aOut*5
 display aShow, 1/300, 8
cabbageSet "display", "skew", 2
 
 outs aOut,aOut
 chnclear "snd1", "snd2"
endin


instr widget
kStartWg cabbageGet "start"
if kStartWg == 1 && changed(kStartWg) == 1 then
schedulek "wgMachine", 0, 99999
elseif kStartWg == 0 && changed(kStartWg) == 1 then
turnoff2 "wgMachine", 0, 1
turnoff2 "bowSound", 0, 1
turnoff2 "pluckTrg", 0, 1
turnoff2 "pluckSound", 0, 1
endif



endin


</CsInstruments>
<CsScore>
i "widget" 0 99999
i "output" 0 99999
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
 <bgcolor mode="background">
  <r>53</r>
  <g>53</g>
  <b>53</b>
 </bgcolor>
</bsbPanel>
<bsbPresets>
</bsbPresets>
