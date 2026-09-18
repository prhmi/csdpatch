<Cabbage>
form caption("cc-map") size(400, 270), guiMode("queue"), pluginId("cmap") colour(10,30,40)

nslider bounds(308, 14, 75, 40) channel("chnl") range(1, 16, 1, 1, 1) text("channel") colour(48, 66, 77, 255)
button bounds(22, 14, 101, 31) channel("rndall") text("random", "random") colour:0(48, 66, 77, 255) colour:1(48, 66, 77, 255)
nslider bounds(22, 54, 50, 40) channel("rndmin") range(0, 127, 0, 1, 1) text("min") colour(48, 66, 77, 255)
nslider bounds(74, 54, 50, 40) channel("rndmax") range(0, 127, 127, 1, 1) text("max") colour(48, 66, 77, 255)
;vmeter bounds(34, 120, 14, 100) channel("vmeter1000410004")  outlineThickness(0) corners(1) meterColour:0(122, 174, 180, 255) value(0.5)
;vmeter bounds(34, 120, 14, 100) channel("meter1")  outlineColour(0, 0, 0, 255), overlayColour(0, 0, 0, 255)    outlineThickness(0) meterColour:0(10, 120, 40, 255) meterColour:1(10, 120, 40, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

ksmps = 32
nchnls = 2
0dbfs = 1

seed 0


instr widgetWrite
 iX = 0
 iNumb = 9
 indx = 0
 while indx < iNumb do
 Scc    sprintf "bounds(%d, 120, 14, 100) channel(\"cc%d\") outlineThickness(0) corners(1) meterColour:0(122, 174, 180, 255) meterColour:1(122, 174, 180, 255) overlayColour(20, 20, 20, 255) ",iX+30,indx
 cabbageCreate "vmeter", Scc 
 Sn    sprintf "bounds(%d, 230, 30, 18) channel(\"n%d\") text(\"%d\")",iX+22,indx,indx+1
 cabbageCreate "label", Sn
 iX += 40
 indx += 1
 od
endin

instr rndCC
kRndGet cabbageGet "rndall"
kMin cabbageGet "rndmin"
kMax cabbageGet "rndmax"
if changed(kRndGet) == 1 then
kIndx = 0
while kIndx < 9 do
kRndCC = int(random:k(kMin, kMax))
Scc    sprintfk "cc%d", kIndx
schedulek "midiSend", 0, 1, kIndx+1, kRndCC
cabbageSetValue Scc,kRndCC/127
kIndx += 1
od
endif
endin

instr midiSend
iChnIn cabbageGetValue "chnl"
midiout 176,iChnIn, p4, p5
endin




</CsInstruments>
<CsScore>
i "widgetWrite" 0 1
i "rndCC" 0 999999
;i 9 0 1
</CsScore>
</CsoundSynthesizer>
