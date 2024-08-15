<Cabbage>
form caption("RndFrq") size(280, 200)  guiMode("queue")  colour(30,20,30) style("legacy") pluginId("rndf")

checkbox bounds(20, 14, 30, 30) channel("start") colour:0(111, 103, 103, 255) colour:1(0, 255, 154, 255)
nslider bounds(20, 74, 46, 28) channel("spdmin") range(2, 20, 12, 1, 1) colour(57, 67, 65, 255)
nslider bounds(74, 74, 46, 28) channel("spdmax") range(5, 50, 20, 1, 1) colour(57, 67, 65, 255)

nslider bounds(20, 120, 46, 28) channel("frqmin") range(200, 1000, 700, 1, 1) colour(57, 67, 65, 255)
nslider bounds(76, 120, 46, 28) channel("frqmax") range(500, 2000, 1200, 1, 1) colour(57, 67, 65, 255)

nslider bounds(74, 16, 46, 28) channel("skip") range(0.1, 1.5, 0.3, 1, 0.01) colour(57, 67, 65, 255)

label bounds(136, 82, 80, 16) channel("label10006") text("speed")
label bounds(138, 126, 80, 16) channel("label10007") text("Frq")
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





instr machine
kTime init 0
kSkipIn cabbageGet "skip"
kMinSpeed cabbageGet "spdmin"
kMaxSpeed cabbageGet "spdmax"

kSkip = 1+(kSkipIn)
if metro(kTime) == 1 then
kTime random kMinSpeed, kMaxSpeed
kDur = 1/(kTime*kSkip)
schedulek "play",0,kDur
endif
endin

instr widgets
kStart cabbageGet "start"
if kStart == 1 && changed(kStart) == 1 then
schedulek "machine",0,9999
elseif kStart == 0 && changed(kStart) == 1 then
turnoff2 "machine", 0, 1
endif
endin

instr play
iMinFrq cabbageGetValue "frqmin"
iMaxFrq cabbageGetValue "frqmax"
iFrq random iMinFrq, iMaxFrq
iAtt = 0.01
iAmp = 0.3
aEnv transeg 0, iAtt, 4, iAmp, p3-(iAtt*2),1, iAmp, iAtt, -4, 0
aSound poscil aEnv, iFrq
outall aSound
endin

</CsInstruments>
<CsScore>
i "widgets" 0 9999
</CsScore>
</CsoundSynthesizer>
