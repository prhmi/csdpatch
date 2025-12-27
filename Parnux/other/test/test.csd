
<Cabbage>
form caption("CoreLa") size(250, 100), pluginid("CoreLa") style("legacy")  colour:0(20, 30, 82, 255)
nslider bounds(-100, -100, 40, 28) velocity(50) range(0.5, 4, 0.5, 1, 0.01) colour(10, 10, 10, 200)fontcolour(200, 200, 250, 250) widgetarray("check", 7) channel("check7") identchannel("check_ident7")



</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0 -d  -m0d -Q0 --midi-key=4
</CsOptions>
<CsInstruments>

;sr = 48000
ksmps = 32
nchnls = 2
0dbfs = 1



instr WidtArrW
 iWidget = 0
 while iWidget < 5 do
   S1 sprintfk "pos(%d, %d)", iWidget%10*40+25, 30
   S2 sprintfk "check_ident%d", iWidget+1
   chnset S1, S2
   iWidget += 1
 od

 iRyArr [] fillarray 1,4,3,2,1
 iWrite = 0
 while iWrite < 5 do
   S2 sprintfk "check%d", iWrite+1
   chnset iRyArr[iWrite], S2
   iWrite += 1
 od 

 iRead = 0
 iSteps[] init 5
 while iRead < 5 do 
   iSteps[iRead] chnget sprintfk("check%d", iRead+1)
   iRead += 1
 od
 printarray iSteps,"%.1f", "Steps ="
endin





</CsInstruments>
<CsScore>
i "WidtArrW" 0 [6^6]
</CsScore>
</CsoundSynthesizer>

