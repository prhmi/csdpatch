; Ramkal_VSTe_V_5.1, Cabbage_V_2.9.0
; Written by Parham Izadyar, 2024
; github.com/prhmi
<Cabbage>
form caption("Pan") size(300, 290)  guiMode("queue")  colour(30,30,50) pluginId("tpan")
;image bounds(0, 142, 300, 150) file("back.jpg") channel("image3")
rslider bounds(228, 204, 75, 75), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
hslider  bounds(2, 172, 300, 30), channel("3dz"), range(-2.5, 2.5, 0.5, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)
xypad bounds(2, 2, 300, 170) channel("3dx", "3dy") ballColour(198, 231, 231, 255)   colour(198, 231, 200, 0) alpha(0.79) rangeX(-2.5,2. 5, -0.7) rangeY(-2.5, 2.5, -1.5)
checkbox bounds(10, 222, 30, 30) channel("mtl") text("MuteL") popupText("MuteL") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
checkbox bounds(64, 222, 30, 30) channel("mtr") text("MuteR") popupText("MuteR") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(2, 206, 100, 12) channel("label10005") text("Mute Left/Right")
checkbox bounds(118, 222, 30, 30) channel("swtch") text("swtch") popupText("swift") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(100, 206, 61, 12) channel("label10006") text("switch")
combobox   bounds(166, 228, 57, 23), text("pan", "org","rnd"), channel("orgmd"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr 		= 44100	
ksmps 	= 64		
nchnls 	= 2		
0dbfs	= 1		



zakinit 21, 1	

opcode	ambi2D_encode_n, 0, aik		
asnd,iorder,kaz	xin
kaz = $M_PI*kaz/180
kk =	iorder
c1:
   	zawm	cos(kk*kaz)*asnd,2*kk-1
   	zawm	sin(kk*kaz)*asnd,2*kk
kk =		kk-1

if	kk > 0 goto c1
	zawm	asnd,0	
endop

opcode	ambi2D_decode_basic, aa, iii	
iorder,iaz1,iaz2	xin
iaz1 = $M_PI*iaz1/180
iaz2 = $M_PI*iaz2/180
igain	=	2/(2*iorder+1)
kk =	iorder
a1	=	.5*zar(0)
c1:
a1 +=	cos(kk*iaz1)*zar(2*kk-1)
a1 +=	sin(kk*iaz1)*zar(2*kk)
kk =		kk-1
if	kk > 0 goto c1

kk =	iorder
a2	=	.5*zar(0)
c2:
a2 +=	cos(kk*iaz2)*zar(2*kk-1)
a2 +=	sin(kk*iaz2)*zar(2*kk)
kk =		kk-1
if	kk > 0 goto c2
		xout			igain*a1,igain*a2
endop






instr 1

;aInL,aInR diskin "../flute.wav",1,0,1

aInL,aInR ins


kX cabbageGet "3dx"
kY cabbageGet "3dy"
kZ cabbageGet "3dz"
iFade = 0.01
kX port kX, iFade
kY port kY, iFade
kZ port kZ , iFade
kMuteL cabbageGet "mtl"
kMuteR cabbageGet "mtr"
kmod cabbageGet "orgmd"
kSwitch cabbageGet "swtch"

printk2 kmod
aIn = (aInL+aInR)/2

if kmod == 1 kgoto tdpan
if kmod == 2 kgoto org
if kmod == 3 kgoto rndm


tdpan:
imode = 1
aW, aX, aY, aZ  spat3d aIn, kX, kY, kZ, 1, 1, imode, 2, 2
aoutL    =  aW + aY     
aoutR    =  aW - aY
kgoto mix


org:
if kMuteL == 1 then
kAmpL = 0 
elseif kMuteR == 1 then
kAmpR = 0
else
kAmpL = 1
kAmpR = 1
endif


if kSwitch == 0 then
aoutL = aInL*kAmpL
aoutR = aInR*kAmpR
elseif kSwitch == 1 then
aoutL = aInR*kAmpR
aoutR = aInL*kAmpL
endif
kgoto mix






rndm:
kPnd = ((kX+2)*8)-5
kRng = (kZ+3)*3
kSpeedMin = (kY+2.8)
kSpeedMax = kSpeedMin+kRng
kPnD = (kRng+kSpeedMin+kSpeedMax)/3
kRndPan   = jspline:k( kRng, kSpeedMin, kSpeedMax) + kPnd
;printk2 kRng
;kRndPan = kRng
ambi2D_encode_n	aIn,10,kRndPan
aoutL,aoutR		ambi2D_decode_basic 	10,0,20
kgoto mix




mix:

kMix cabbageGet "mix"
	amixL		ntrpol		aInL, aoutL, kMix
	amixR		ntrpol		aInR, aoutR, kMix	
out amixL,amixR
zacl 	0,20
endin
</CsInstruments>
<CsScore>
i1 0 [6^6]
</CsScore>
</CsoundSynthesizer>
