<Cabbage>
form caption("Loop") size(280,180), pluginid("Loop")
image  bounds(0, 0, 350, 200), outlinethickness(6), , colour(45, 61, 87, 255) file("loop.jpg")
checkbox  bounds(12, 10, 68, 21), text("Loop") , channel("loop"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
checkbox  bounds(90, 10, 68, 21), text("Metro") , channel("metro"),   , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255) fontcolour:0(255, 255, 255, 255) fontcolour:1(255, 255, 255, 255)
rslider bounds(186, 48, 85, 85), channel("mix"), text("mix"), range(0, 1, 1, 1, 0.001), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(10, 48, 85, 85), channel("looptime"), text("Time"), range(0.2, 10, 6, 1, 0.001), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
hslider bounds(12, 138, 260, 31), channel("steps"), text("Steps"), range(1, 6, 2, 1, 1), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255)
rslider bounds(98, 48, 85, 85), channel("pitch"), text("Pitch"), range(-2, 2, 1, 1, 0.001), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) textcolour(255, 255, 255, 255) fontcolour(255, 255, 255, 255) identchannel("pitchID")
button bounds(172, 8, 80, 26) text("Reset Pitch", "Reset Pitch") channel("rstpch") colour:0(80, 83, 94, 255) colour:1(80, 83, 94, 255)
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>

;sr = 48000
ksmps = 64
nchnls = 2
0dbfs = 1

 seed 0

giSoundFileL      	ftgen   0, 0, 20*sr, 2, 0
giSoundFileR      	ftgen   0, 0, 20*sr, 2, 0
giTableLength = ftlen(giSoundFileL)/ sr


instr start
;ainL diskin2 "test.wav",1,0,1
;ainR = ainL
ainL,ainR ins
kLoop     chnget "loop" ; 1
kMetro    chnget "metro" ; 1
kmix      chnget "mix"
kSteps    chnget "steps" ; 1
gkpitch   chnget "pitch"
kLoopTime chnget "looptime" ; 2 ; 0.1-10
kRstPch   chnget "rstpch"
kreset = 1
if changed(kRstPch) == 1 then
chnset kreset, "pitch"
endif
kMetSpd = 1/kLoopTime
;kLoop = (randi:k(50,7,2)+50 > 90) ? 0 : 1
kTime init 1

if kMetro == 1 then
	if metro:k(kTime) == 1 then
	turnoff2 "Record",0,1
	turnoff2 "Play",0,1
	kTime random kMetSpd, kMetSpd*2
	kDur = 1/kTime
	schedulek "Record", 0 ,30
	schedulek "Play",kDur+0.1 ,30,kDur/kSteps
	endif
elseif kLoop == 1 && changed(kLoop) == 1 && kMetro == 0 then
    turnoff2 "Record",0,1
	turnoff2 "Play",0,1
	schedulek "Record", 0 ,30
	schedulek "Play",kLoopTime+0.1 ,30,kLoopTime/kSteps
elseif kLoop == 0  && kMetro == 0 then
	turnoff2 "Record",0,1
	turnoff2 "Play",0,1
endif


chnmix	ainL,"SendL"
chnmix	ainR,"SendL"

aLoopL		chnget	"LoopL"
aLoopR		chnget	"LoopR"
aLoopL clip aLoopL, 0, 0.5
aLoopR clip aLoopR, 0, 0.5
amixL ntrpol ainL, aLoopL*0.5, kmix
amixR ntrpol ainR, aLoopR*0.5, kmix
out amixL,amixR

chnclear	"LoopL"
chnclear	"LoopL"
endin

instr Record

iAtt = 0.1
iRel = 0.1
;print iAtt
aEnv	transegr	0,iAtt,6, 1,p3,4,0, iRel,-6,0
ainL chnget "SendL"
ainR chnget "SendR"
aPointer linseg 0, giTableLength, giTableLength*sr
tablew ainL*aEnv, aPointer, giSoundFileL
tablew ainR*aEnv, aPointer, giSoundFileR
chnclear	"SendL"
chnclear	"SendR"
endin

instr Play
iAtt = 0.1
iRel = 0.1
aEnv	transegr	0,iAtt,6, 1,p3,4,0, iRel,-6,0
kamp = 1
kpitch  = gkpitch
ainL chnget "SendL"
ainR chnget "SendR"
istart = 0.1
idur  =  p4
ifad = 0.1
ktrig = 1
aoutL flooper kamp, kpitch, istart, idur, ifad, giSoundFileL 
aoutR flooper kamp, kpitch, istart, idur, ifad, giSoundFileR
;aoutL,krec sndloop ainL*aEnv, kpitch, ktrig, idur, ifad
;aoutR,krec sndloop ainR*aEnv, kpitch, ktrig, idur, ifad

chnmix	aoutL*aEnv,"LoopL"
chnmix	aoutR*aEnv,"LoopR"
chnclear	"SendL"
chnclear	"SendR"
endin

</CsInstruments>
<CsScore>
i "start" 0 999
;i "Record" 0 99
;i "Play" 0.4 99
</CsScore>
</CsoundSynthesizer>

