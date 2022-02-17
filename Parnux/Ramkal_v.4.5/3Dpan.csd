
<Cabbage>
form caption("3DPan") size(300, 290)  guiMode("queue")  colour(0,0,0) style("legacy") pluginId("3dpn")
image bounds(0, 142, 300, 150) file("3DPan.jpg") channel("image3")
rslider bounds(228, 204, 75, 75), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
hslider  bounds(2, 172, 300, 30), channel("3dz"), range(-2.5, 2.5, 0.5, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)
xypad bounds(2, 2, 300, 170) channel("3dx", "3dy") ballColour(198, 231, 231, 255)   colour(198, 231, 200, 0) alpha(0.79) rangeX(-2.5,2. 5, -0.7) rangeY(-2.5, 2.5, -1.5)
checkbox bounds(10, 222, 30, 30) channel("mtl") text("MuteL") popupText("MuteL") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
checkbox bounds(64, 222, 30, 30) channel("mtr") text("MuteR") popupText("MuteR") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(2, 206, 100, 12) channel("label10005") text("Mute Left/Right")
checkbox bounds(140, 222, 30, 30) channel("swft") text("swift") popupText("swift") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(100, 206, 100, 12) channel("label10006") text("swift Left/Right")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
sr 		= 44100	
ksmps 	= 64		
nchnls 	= 2		
0dbfs	= 1		


instr 1

;aInLi,aInRi diskin "test.wav",1,1,1
aInLi,aInRi ins
imode = 1
kX cabbageGet "3dx"
kX port kX, .01
;printk2 kX
kY cabbageGet "3dy"
kY port kY, .01
kZ cabbageGet "3dz"
kZ port kZ , .01
kMuteL cabbageGet "mtl"
kMuteR cabbageGet "mtr"
kAmpL = 1
kAmpR = 1
if kMuteL == 1 then
kAmpL = 0
endif
if kMuteR == 1 then
kAmpR = 0
endif

kSwift cabbageGet "swft"
if kSwift == 1 then
aInL = aInRi
aInR = aInLi
else
aInL = aInLi
aInR = aInRi
endif
aIn = ((aInL*kAmpL)+(aInR*kAmpR))/2
aW, aX, aY, aZ  spat3d aIn, kX, kY, kZ, 1, 1, imode, 2, 2


aoutL    =  aW + aY     
aoutR    =  aW - aY
kMix cabbageGet "mix"
	amixL		ntrpol		aInL*kAmpL, aoutL, kMix
	amixR		ntrpol		aInR*kAmpR, aoutR, kMix	
out amixL,amixR
endin
</CsInstruments>
<CsScore>
i1 0 [9^9]
</CsScore>
</CsoundSynthesizer>
