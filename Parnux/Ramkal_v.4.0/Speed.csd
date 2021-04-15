<Cabbage>
form caption("Speed") size(280,120), pluginid("Speed")
image            bounds(0, 0, 280, 120), outlinethickness(6), , colour(45, 61, 87, 255) file("speed.jpg")
rslider bounds(12, 14, 85, 85), channel("stime"), text("Speed Time"), range(0, 2, 0.7, 1, 0.001)   trackercolour(147, 207, 207, 255)     valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(180, 14, 85, 85), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001)     trackercolour(147, 207, 207, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
checkbox  bounds(106, 60, 68, 21), text("Record") , channel("record") colour:1(236, 255, 0, 255)  colour:0(103, 103, 103, 255) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
checkbox  bounds(106, 14, 68, 21), text("Metro") , channel("metro"), colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
checkbox  bounds(106, 84, 68, 21), text("Play") , channel("play") colour:1(236, 255, 0, 255) colour:0(103, 103, 103, 255) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
combobox bounds(106, 38, 69, 20),channel("box"), text("Static", "Random"), value(2)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

giSoundFileL      	ftgen   0, 0, 60*sr, 2, 0
giSoundFileR      	ftgen   0, 0, 60*sr, 2, 0
giTableLength = ftlen(giSoundFileL)/ sr

gainL init 0
gainR init 0




instr start
kmetro chnget "metro"
krcrd chnget "record"
kplay chnget "play"

;ainL diskin "test.wav",1,0,1
;ainR = ainL
ainL,ainR ins
if kmetro == 1 then
kenv = 0
elseif kplay == 1 then
kenv = 0
else
kenv = 1
endif
kenv port kenv, 0.1

if     kmetro == 1 	&& changed(kmetro) == 1 && krcrd == 0 && kplay == 0 then
event "i", "Record", 0 , 99999
event "i", "Play", 0.1 , 99999
elseif	kmetro = 0	&& changed(kmetro) == 1 && krcrd == 0 && kplay == 0 then
turnoff2 "Record",0,0
turnoff2 "Play",0,0
	

elseif krcrd == 1 && changed(krcrd) == 1 &&  kmetro == 0 then
event "i", "Record", 0 , 99999
elseif krcrd == 0 && changed(krcrd) == 1 &&  kmetro == 0 then
turnoff2 "Record",0,0


elseif kplay == 1 && changed(kplay) == 1 &&  kmetro == 0 then
event "i", "Play", 0 , 99999
elseif kplay == 0 && changed(kplay) == 1 &&  kmetro == 0 then
turnoff2 "Play",0,0
elseif kplay == 0 && krcrd == 0 && kmetro = 0 then
turnoff2 "Record",0,0
turnoff2 "Play",0,0
endif
aoutL linenr ainL*kenv,0.1,1,0.01
aoutR linenr ainR*kenv,0.1,1,0.01

outs aoutL,aoutR
gainL = ainL
gainR = ainR
endin

instr Record
ainL linenr gainL,0.1,1,0.01
ainR linenr gainR,0.1,1,0.01
aPointer linseg 0, giTableLength, giTableLength*sr
tablew ainL, aPointer, giSoundFileL
tablew ainR, aPointer, giSoundFileR
endin

instr Play
kBox chnget "box"
if kBox == 1 then
ktime chnget "stime"
elseif kBox == 2 then
ktime randomh 0.3, 1.3, 2
endif
iamp = 1
kpitch = 1
ilock = 0
kmix chnget "mix"
ainL linenr gainL,0.1,1,0.01
ainR linenr gainR,0.1,1,0.01

aoutL   temposcal ktime, iamp, kpitch, giSoundFileL, ilock
aoutR   temposcal ktime, iamp, kpitch, giSoundFileR, ilock

amixL ntrpol ainL, aoutL, kmix
amixR ntrpol ainR, aoutR, kmix
outs amixL,amixR
endin

</CsInstruments>
<CsScore>
i "start"     0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>


 
