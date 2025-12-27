<Cabbage>
form caption("CoreLa") size(250, 100), pluginId("CoreLa") guiMode("queue"), style("legacy")  colour:0(20, 30, 82, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1


instr CreateNSliders
    iRyArr [] fillarray 1,4,3,2,1
    iWidget = 0
    
    while iWidget < 5 do
        ; create bank of nslider using cabbageCreate opcode 
        SCode sprintf "nslider bounds(%d, %d, 40, 28), channel(\"check%d\"), velocity(50), range(0.5, 4, %d, 1, 0.01) colour(10, 10, 10, 200) fontColour(200, 200, 250, 250)", iWidget%10*40+25, 30, iWidget+1, iRyArr[iWidget]
        cabbageCreate SCode
        iWidget += 1
    od

endin

instr 1
    iRead = 0
    iSteps[] init 5
    
    while iRead < 5 do 
       iSteps[iRead] cabbageGetValue sprintfk("check%d", iRead+1)
       iRead += 1
    od
    printarray iSteps,"%.1f", "Steps ="
endin



</CsInstruments>
<CsScore>
i "CreateNSliders" 0 [6^6]
i1 0 z
</CsScore>
</CsoundSynthesizer>

