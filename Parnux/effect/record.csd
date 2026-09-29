/*
Record — live recorder for the bus signal.
Parnux v_6.1 — Cabbage v_2.9 and Csound v_6.18 © 2026.
parhamizadyar.net
*/
<Cabbage>
form size(300, 120), caption("record BUSs"), guiMode("queue"), pluginId("hstr"), guiRefresh(10) colour(20,20,30)
button bounds(170, 66, 120, 31) channel("rcrd") text("record", "recording !") colour:0(48, 66, 77, 255) colour:1(148, 70, 80, 255)
nslider bounds(230, 14, 59, 37) channel("bus") range(1, 16, 1, 1, 1) text("BUS") colour(48, 66, 77, 255)
image bounds(146, 16, 17, 17) channel("led") colour(80, 80, 90, 255)
label bounds(18, 72, 137, 19) channel("show"), text("record No. -") align("left")
label bounds(20, 10, 112, 17) channel("label10004") text("live recording"), align("left")
label bounds(20, 34, 113, 13) channel("label10005")  text("[6-chn supported]"), align("left")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
ksmps = 64
;nchnls = 2
0dbfs = 1

instr gui
kBus cabbageGet "bus"
if changed(kBus) == 1 then
schedulek "check", 0, 0.1, kBus
endif
kPlay cabbageGet "IS_PLAYING"
kRecord cabbageGet "rcrd"
if kRecord == 1 then
if kPlay == 1 && changed(kPlay) == 1 then
schedulek "record", 0, 999999
elseif kPlay == 0 && changed(kPlay) == 1 then
turnoff2 "record", 0, 1
endif
endif
endin


instr check
Sdir sprintf "D:\\myWork\\music\\open\\record\\bus%d", p4
Sarray[] directory Sdir, ".wav"
iLen lenarray Sarray
print iLen
Sshow sprintf "text(\"%d record exist\")", iLen
cabbageSet "show", Sshow
endin


instr record
ScolorOn = "colour(60,150,200,255)"
cabbageSet 1, "led", ScolorOn
iBus cabbageGetValue "bus"

aEnv  madsr 0.1, 0, 1, 0.1
iChn = nchnls
aIn1 = inch:a(1)*aEnv
aIn2 = inch:a(2)*aEnv
aIn3 = inch:a(3)*aEnv
aIn4 = inch:a(4)*aEnv
aIn5 = inch:a(5)*aEnv
aIn6 = inch:a(6)*aEnv

Sdir sprintf "D:\\record\\bus%d", iBus
Sarray[] directory Sdir, ".wav"
Sname sprintf "bus%d_record%d.wav", iBus, lenarray(Sarray)+1
Sfile sprintf "%s\\%s",Sdir, Sname
Sshow sprintf "record No. %d", lenarray(Sarray)+1
cabbageSet "show", Sshow

if iChn == 1 then
fout Sfile, 8, aIn1
elseif iChn == 2 then
fout Sfile, 8, aIn1,aIn2
elseif iChn == 3 then
fout Sfile, 8, aIn1,aIn2,aIn3
elseif iChn == 4 then
fout Sfile, 8, aIn1,aIn2,aIn3,aIn4
elseif iChn == 5 then
fout Sfile, 8, aIn1,aIn2,aIn3,aIn4,aIn5
elseif iChn == 6 then
fout Sfile, 8, aIn1,aIn2,aIn3,aIn4,aIn5,aIn6
endif
  if release() == 1 then
  ScolorOff = "colour(60,60,70,255)"
  cabbageSet 1, "led", ScolorOff
  endif
endin

</CsInstruments>  
<CsScore>
i "gui" 0 999999
</CsScore>
</CsoundSynthesizer>