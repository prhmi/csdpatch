<Cabbage>
form caption("nTap") size(300, 150), pluginId("ntap") style("legacy")
image bounds(0, 0, 300, 150)  file("ntap.jpg")
rslider  bounds(10, 8, 60, 60),  text("FrqSh"),  channel("fdb"),  range(0.001, 0.9, 0, 1, 0.001),colour(164, 120, 166, 255), trackerColour(160, 63, 160, 250) trackerInsideRadius(0.72) textColour(248, 154, 228, 250) outlineColour(0, 0, 0, 255) fontColour(245, 153, 237, 255)
rslider  bounds(86, 6, 50, 50),  text("Filter"),  channel("fltr"),  range(400, 1200, 500, 1, 10),colour(164, 120, 166, 255), trackerColour(160, 63, 160, 250) trackerInsideRadius(0.72) textColour(248, 154, 228, 250) outlineColour(0, 0, 0, 255) fontColour(245, 153, 237, 255)
hslider bounds(78, 60, 210, 28) text("Speed"),channel("spd"), range(0, 100, 10, 1, 0.001) trackerColour(164, 63, 166, 255)textColour(248, 154, 228, 250)
checkbox bounds(256, 10, 25, 25) text("FrqShif"), channel("frqsh"), colour:0(113, 85, 107, 255) colour:1(198, 104, 212, 255) 
checkbox bounds(200, 10, 25, 25) text("FrqShif"), channel("stp"), colour:0(113, 85, 107, 255) colour:1(198, 104, 212, 255) value(1)

keyboard , bounds(10, 94, 285, 50)
;keyboard pos(10, 160), size(285, 50)
;;speed
;;FrqShif
;;



</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 	-dm0 -n -+rtmidi=null -M0
</CsOptions>
<CsInstruments>

sr = 44100
ksmps = 64
nchnls = 2
0dbfs  = 1

seed 0 
giFrq []init 12
giAmp []init 12

gisine		ftgen	0,0,4096,10,1	
giWave	ftgen 0,0,8192,	19,21, 1, 0, 22, 1, 0, 25, 1, 0, 27, 1, 0, 31, 1, 0, 33, 1, 0, 34, 1, 0, 35, 1, 0

;schedule "play",0,-1
;schedule "record",0,-1
;schedule "pulse",0,-1


opcode	FreqShifter,a,akki
	aIn,kfshift,kfback,ifn	xin		
	aFS	init	0
	aSnd	=	aIn + (aFS * kfback)			
	aReal, aImag hilbert aSnd				
	aSin 	oscili       1,    kfshift,     ifn,           0
	aCos 	oscili       1,    kfshift,     ifn,           0.25	
	aMod1	=		aReal * aCos
	aMod2	=		aImag * aSin	
	aFS	= (aMod1 - aMod2)
	aout	= aFS
	xout	aout	
endop


instr play
 kFrqFB chnget "fdb"
 kMoses chnget "spd" ;= 10
 kFrqShift chnget "frqsh"
 kFilter chnget "fltr"
 kStep chnget "stp"
 iFrq		cpsmidi
 if kFrqShift == 0 then
kOnOff = 0
 elseif kFrqShift == 1 then
kOnOff = 1
endif
printk2 iFrq
ivel veloc 0, 1
iAmp = ivel* (-1) / 10
 kTime init 0
 if kStep == 1 then
   schedule "harmonic", 0, 1
   schedule "triger", 0, .1, -5, 60, iFrq*kOnOff,kMoses/100,kFrqFB,kFilter
   schedule "pulse", 0, .2, kMoses/70,iFrq*kOnOff,kFrqFB,kFilter
 
 elseif kStep == 0 then
 if metro(1/kTime) == 1 then
   kTimeShort random 2, 3
   kTimeLong random 3, 5
   kTime =  (random:k( 0, 100 ) < kMoses ) ? kTimeShort : kTimeLong
   schedulek "harmonic", 0, 1
   schedulek "triger", 0, kTime , -5, 60, iFrq*kOnOff,kMoses/100,kFrqFB,kFilter
   schedulek "pulse", 0, kTime, kMoses/70,iFrq*kOnOff,kFrqFB,kFilter
 endif
endif
endin


instr harmonic
 index = 0
 iHarmonic = 1
 iT = 0
 while index < lenarray(giFrq) do
   giFrq[index] = iHarmonic-iT
   iRndAmp = int(random:i( -30, -15))
   iRndHarmonic random .5, 1
   giAmp[index] = (iRndAmp*2)+15
   iHarmonic += .73
   iT += .13
   index += 1
 od
endin


instr triger
 index = 0
 iFrqIn = p6
iAmpRnd = p7
 while index < lenarray(giFrq) do
   iAmp = ampdb(p4)*giAmp[index]
   iFrq = mtof:i(p5)*giFrq[index]
   index += 1
   schedule "sound", 0, p3, iAmp, iFrq, iFrqIn, iAmpRnd,p8,p9
 od

endin

instr sound
 iAmp = ampdb:i(p4)
 ifrq = p5
 iAtt = .01
 iRel = p3/3
 iFrqShIn = p6/2
 kSpeed = iFrqShIn/30
 aEnv	transegr	0,iAtt,3, 1,p3,4,0, iRel,-4,0
 iAmpRnd random 0, p7
 aAM lfo 5, iAmpRnd,2
 kPchRnd randi 2, 13, 2
 aSound  poscil iAmp*aEnv, (ifrq+kPchRnd)*aAM
 aHiFi clfilt aSound, 50, 1,10
 aLoFi clfilt aHiFi, p9, 0,10
 kfshift = jspline:k( iFrqShIn, kSpeed/2,kSpeed)+iFrqShIn
 kfback = p8
 aFL	FreqShifter	aLoFi,kfshift,kfback,gisine	
 aout linen aFL * 10, p3/2,p3,p3/3
 iRndChn = int(random:i(1, 3))
 outch iRndChn, aout
endin


instr pulse
 kSpeed = p4
 kFrqIn = p5/4
 ;;Left
 kRndFrqL = jspline:k(2, 8, 7)
 kRndAmpL = jspline:k(kSpeed, 2, 15)
 aFrqL lfo 50,kRndFrqL,2
 aAmpL lfo .4, kRndAmpL,2
 aSoundL poscil .4*aAmpL, aFrqL, giWave
 aHiFiL clfilt aSoundL, 50, 1,10
 aLoFiL clfilt aHiFiL, 600, 0,10
 ;;Right
 kRndFrqR = jspline:k(1, 2, 5)
 kRndAmpR = jspline:k(kSpeed, 2, 15)
 aFrqR lfo 50,kRndFrqR,2
 aAmpR lfo .4, kRndAmpR,2
 aSoundR poscil .4*aAmpR, aFrqR, giWave
 aHiFiR clfilt aSoundR, 50, 1,10
 aLoFiR clfilt aHiFiR, p7, 0,10
 ;;Frq
 ;kfshift randomh 0, kFrqIn,kSpeed
 kfshift = jspline:k( kFrqIn, kSpeed/2,kSpeed)+kFrqIn
 kfback = p6
 aFL	FreqShifter	aLoFiL,kfshift,kfback,gisine	
 aFR	FreqShifter	aLoFiR,kfshift,kfback,gisine
 ;;out
 aoutL linen aFL, p3/10,p3,p3/10
 aoutR linen aFR, p3/10,p3,p3/10 	
 out aoutL,aoutR
endin

</CsInstruments>
<CsScore>

</CsScore>
</CsoundSynthesizer>

