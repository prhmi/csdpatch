 bounds(0, 0, 0, 0)
<Cabbage>
form caption("DoubleCoreLa") size(570, 350)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("crlp")
;;sequencer1
label    bounds(35, 15, 40, 12) text("On/Off") channel("label1")
checkbox bounds(10, 10, 20, 20) colour:0(100, 100, 100, 255) popupText("Start")  channel("sq") colour:1(100, 250, 60, 255) value(1)
checkbox bounds(12, 40, 15, 15) colour:0(100, 100, 100, 255) popupText("Hold")  channel("hold") colour:1(100, 250, 60, 255) value(0)
label    bounds(35, 42, 30, 12) text("Hold") channel("label2")
nslider  bounds(90, 9, 40, 31) range(50, 180, 90, 1, 1)  fontColour(208, 157, 253, 255) text("BPM") channel("BPM1")
nslider  bounds(130, 9, 30, 31) range(1, 10, 4, 1, 1)  fontColour(208, 157, 253, 255) text("DV") channel("DV1") 
nslider  bounds(162, 9, 30, 31) range(1, 28, 7, 1, 1)  fontColour(208, 157, 253, 255) text("Step") channel("steps1")
combobox bounds(322, -4, 65, 25) text("Indian", "Tala", "Rep", "Plus", "Change") channel("tala1") 
label    bounds(236, 12, 50, 12) text("Duration") channel("labe12")
hslider bounds(236, 24, 150, 21) range(0.05, 1.5, 0.2, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) channel("dur")
label    bounds(10, 72, 28, 12) text("seq") channel("label3")
label    bounds(10, 92, 28, 12) text("acc") channel("label4")
label    bounds(10, 112, 28, 12) text("bss") channel("label5")
label    bounds(10, 132, 28, 12) text("rep") channel("label6")
;;synth1
label    bounds(484, 10, 40, 12) text("On/Off") channel("label10")
checkbox bounds(530, 8, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("dng") colour:1(100, 250, 60, 255) value(1)
combobox bounds(396, 30, 77, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote")  value(2)
combobox bounds(396, 4, 77, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale") value(2) 
;sequncer2
label    bounds(35, 187, 40, 12) text("On/Off") channel("label20")
checkbox bounds(12, 186, 15, 15) colour:0(100, 100, 100, 255) popupText("Start")  channel("sq2") colour:1(100, 250, 60, 255) value(1)
checkbox bounds(12, 212, 15, 15) colour:0(100, 100, 100, 255) popupText("Hold")  channel("hold2") colour:1(100, 250, 60, 255) value(0)
label    bounds(35, 214, 30, 12) text("Hold") channel("label21")
nslider  bounds(90, 181, 40, 31) range(50, 180, 90, 1, 1)  fontColour(208, 157, 253, 255) text("BPM") channel("BPM2")
nslider  bounds(130, 181, 30, 31) range(1, 10, 4, 1, 1)  fontColour(208, 157, 253, 255) text("DV") channel("DV2") 
combobox bounds(165, 182, 65, 25) text("Indian", "Tala", "Rep", "Plus", "Change") channel("tala2") 
hslider bounds(236, 196, 150, 21) range(0.05, 1.5, 0.2, 1, 0.01) colour(208, 157, 253, 255) trackerColour(208, 157, 253, 255) channel("dur2")
label    bounds(236, 182, 50, 12) text("Duration") channel("labe19")
label    bounds(10, 242, 28, 12) text("seq") channel("label22")
label    bounds(10, 262, 28, 12) text("acc") channel("label23")
label    bounds(10, 282, 28, 12) text("bss") channel("label24")
label    bounds(10, 302, 28, 12) text("rep") channel("label25")
;;synth2
label    bounds(484, 182, 40, 12) text("On/Off") channel("label30")
checkbox bounds(530, 180, 15, 15) colour:0(100, 100, 100, 255) popupText("Synth")  channel("dng2") colour:1(100, 250, 60, 255) value(1)
combobox bounds(396, 202, 77, 25) text("Note", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B") channel("BNote2")  value(2)
combobox bounds(396, 176, 77, 25) text("Scale", "pythagorean", "shur", "homayun", "segah", "chargah") channel("scale2") value(2) 


;image bounds(92, 160, 10, 10) channel("image10258") colour:0(100, 100, 100, 255)
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


;#include "opcodes.udo"


instr widgetWrite
iX = 0
iWidgetCount = 0
ispcc = 0
ispc = 0
iArrSeq [] fillarray 1,0,0,0,1,1,0,1,0,1
        while iX < 28 do
            Sseq1 sprintf "bounds(%d, 70, 15, 15), channel(\"seq1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ,value(%d),", 50+iX*(17)+ispc, iWidgetCount,0
            Sacc1 sprintf "bounds(%d, 90, 15, 15), channel(\"acc1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Sbss1 sprintf "bounds(%d, 110, 15, 15), channel(\"bss1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Srep1 sprintf "bounds(%d, 130, 15, 15), channel(\"rep1%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Slte1 sprintf "bounds(%d, 150, 12, 12), channel(\"lte1%d\") colour(100, 100, 100, 200) ", 51+iX*(17)+ispc, iWidgetCount
            cabbageCreate "checkbox", Sseq1
            cabbageCreate "checkbox", Sacc1
            cabbageCreate "checkbox", Sbss1
            cabbageCreate "checkbox", Srep1
            cabbageCreate "image"   , Slte1
            Sseq2 sprintf "bounds(%d, 240, 15, 15), channel(\"seq2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Sacc2 sprintf "bounds(%d, 260, 15, 15), channel(\"acc2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Sbss2 sprintf "bounds(%d, 280, 15, 15), channel(\"bss2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Srep2 sprintf "bounds(%d, 300, 15, 15), channel(\"rep2%d\") colour:0(100, 100, 100, 255) colour:1(208, 200, 253, 255) ", 50+iX*(17)+ispc, iWidgetCount
            Slte2 sprintf "bounds(%d, 320, 12, 12), channel(\"lte2%d\") colour(100, 100, 100, 200) ", 51+iX*(17)+ispc, iWidgetCount
            cabbageCreate "checkbox", Sseq2
            cabbageCreate "checkbox", Sacc2
            cabbageCreate "checkbox", Sbss2
            cabbageCreate "checkbox", Srep2
            cabbageCreate "image"   , Slte2
            iWidgetCount += 1
            iX += 1
            ispcc = (ispcc+1) % 4
            if ispcc == 0 then
            ispc += 5
            else
            ;ispc = 0
            endif
        od
endin

instr seq1
kSeqIndx init 0
kBPM cabbageGet "BPM1"
kTempo = kBPM/60
kTms cabbageGet "DV1"
kSteps cabbageGet "steps1"
kTime = (kTempo*kTms)
;printk2 kTime
    if metro(kTime) == 1 then
    SseqValue sprintfk "seq1%d",kSeqIndx
    kSeqValue cabbageGet SseqValue
    
    SaccValue sprintfk "acc1%d",kSeqIndx
    kAccValue cabbageGet SaccValue
    
    SbssValue sprintfk "bss1%d",kSeqIndx
    kBssValue cabbageGet SbssValue
    
    SrepValue sprintfk "rep1%d",kSeqIndx
    kRepValue cabbageGet SrepValue
    printk2 kRepValue
    schedulek "LEDon1",0,0.1,kSeqIndx
    schedulek "LEDoff1",1/kTime,0.1,kSeqIndx
    kSeqIndx = (kSeqIndx+1) % kSteps
    endif
endin

instr LEDon1
Slte sprintf "lte1%d",p4
cabbageSet 1,Slte,"colour(150, 150, 200, 250)"
endin
instr LEDoff1
Slte sprintf "lte1%d",p4
cabbageSet 1,Slte,"colour(100, 100, 100, 200)"
endin


</CsInstruments>
<CsScore>
i "widgetWrite" 0 .1
i "seq1" 0 999
</CsScore>
</CsoundSynthesizer>

