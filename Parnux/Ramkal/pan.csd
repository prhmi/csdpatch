; parnux VSTe v5.2, Cabbage v2.9.0
; Written by Parham Izadyar, 2022-2024
; parhamizadyar.net
<Cabbage>
form caption("Pan") size(430, 350)  guiMode("queue")  colour(30,30,50) pluginId("tpan")
;image bounds(0, 142, 300, 150) file("back.jpg") channel("image3")
rslider bounds(338, 236, 75, 75), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
hslider  bounds(2, 172, 300, 30), channel("3dz"), range(-2.5, 2.5, 0.5, 1, 0.01) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255)
xypad bounds(2, 2, 300, 170) channel("3dx", "3dy") ballColour(198, 231, 231, 255)   colour(198, 231, 200, 0) alpha(0.79) rangeX(-2.5, 2.5, -0.7) rangeY(-2.5, 2.5, -1.5)
checkbox bounds(10, 222, 30, 30) channel("mtl") text("MuteL") popupText("MuteL") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
checkbox bounds(64, 222, 30, 30) channel("mtr") text("MuteR") popupText("MuteR") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(2, 206, 100, 12) channel("label10005") text("Mute Left/Right")
checkbox bounds(118, 222, 30, 30) channel("swtch") text("swtch") popupText("swift") colour:0(70, 92, 101, 255) colour:1(100, 180, 253, 255)
label bounds(100, 206, 61, 12) channel("label10006") text("switch")
combobox   bounds(166, 228, 57, 23), text("pan", "org","rnd"), channel("orgmd"), value(3), fontColour(255,255,255) colour(56, 63, 79, 255)
vslider bounds(310, 6, 45, 185) channel("gainl") range(-60, 50, 0, 1, 1) trackerColour(198, 231, 231, 255) text("L") valueTextBox(1)
vslider bounds(358, 6, 45, 185) channel("gainr") range(-60, 50, 0, 1, 1) trackerColour(198, 231, 231, 255) text("R") valueTextBox(1)
rslider bounds(262, 236, 75, 76), channel("gain"), text("Gain"), range(-60, 50, 0, 1, 1) textColour(255, 255, 255, 255) trackerColour(198, 231, 231, 255) outlineColour(0, 0, 0, 255)  fontColour(255, 255, 255, 255) valueTextBox(1)
checkbox  bounds(320, 202, 75, 21), channel("rvrb")  text("Reverb")  , colour:1(236, 255, 0, 255) colour:0(113, 113, 113, 255),  fontColour:0(255, 255, 255, 255) fontColour:1(255, 255, 255, 255)
hslider bounds(10, 260, 251, 25) channel("spdmin") range(0.4, 10, 2, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd min")
hslider bounds(10, 286, 251, 25) channel("spdmax") range(0.7, 17, 5, 1, 0.1) trackerColour(198, 231, 231, 255) valueTextBox(1) text("spd max")

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128
</CsOptions>
<CsInstruments>
;sr 		= 44100	
ksmps 	= 64		
;nchnls 	= 2		
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
kPortTime linseg 0, 0.001, 0.05
;aInL,aInR diskin "../flute.wav",1,0,1

iCh = 2;nchnls
if iCh == 1 then
aInL inch 1
aInR inch 1
elseif  iCh == 2 then
aInL, aInR ins
endif


kX cabbageGet "3dx"
kY cabbageGet "3dy"
kZ cabbageGet "3dz"

kX portk kX, kPortTime*3
kY portk kY, kPortTime*3
kZ portk kZ , kPortTime*2
kMuteL cabbageGet "mtl"
kMuteR cabbageGet "mtr"
kmod cabbageGet "orgmd"
kSwitch cabbageGet "swtch"


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

;printk2 kPnd
kRng = (kZ+3)*3
kSpeedMin cabbageGet "spdmin"
kSpeedMax cabbageGet "spdmax"
kRng = (kZ*2)+5
kPnd = (kX*4)
;printk2 kRng


kRngEnd = kRng-10



kRndPan   = jspline:k( kRng, kSpeedMin, kSpeedMax) + kRngEnd+kPnd
kRndPan portk kRndPan, kPortTime


ambi2D_encode_n	aIn,9,kRndPan
aoutL,aoutR		ambi2D_decode_basic 	10,-10,10
kgoto mix




mix:


kRvrbOnOff cabbageGet "rvrb"
if kRvrbOnOff == 1 && kmod == 3 then
kRrbSize rspline 0.1, 0.7, kSpeedMin, kSpeedMax
kMixRvb rspline 0, 1, kSpeedMin, kSpeedMax
aRvbL, aRvbR  freeverb aoutL, aoutR,kRrbSize/3, kRrbSize;,1
aRvbOutL		ntrpol		aoutL, aRvbL, kMixRvb
aRvbOutR		ntrpol		aoutR, aRvbR, kMixRvb
else
aRvbOutL = aoutL
aRvbOutR = aoutR
endif
kMix cabbageGet "mix"
kGainL cabbageGet "gainl"
kGainL portk kGainL, kPortTime
kGainR cabbageGet "gainr"
kGainR portk kGainR, kPortTime
kGain cabbageGet "gain"	
kGain portk kGain, kPortTime

 kMix portk kMix, kPortTime
 aRvbOutL = aRvbOutL*ampdb(kGainL)*ampdb(kGain)
 aRvbOutR = aRvbOutR*ampdb(kGainR)*ampdb(kGain)
 
	amixL		ntrpol		aInL, aRvbOutL, kMix
	amixR		ntrpol		aInR, aRvbOutR , kMix
	
	

aOutMixL = amixL
aOutMixR = amixR
				
out aOutMixL,aOutMixR
zacl 	0,20
endin
</CsInstruments>
<CsScore>
i1 0 [6^6]
</CsScore>
</CsoundSynthesizer>
