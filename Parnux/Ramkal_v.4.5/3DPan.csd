

<Cabbage>

image bounds(0, 0, 300, 150) file("3DPan.jpg")
form caption("3DPan") size(300,150), pluginid("3DPan")

rslider bounds(38, 56, 85, 85), channel("wide"), text("Wide"), range(0, 1, 0.1, 1, 0.001), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) fontcolour(255, 255, 255, 255) textcolour(255, 255, 255, 255) markercolour(13, 88, 103, 255)
rslider bounds(176, 56, 85, 85), channel("mix"), text("Mix"), range(0, 1, 1, 1, 0.001), trackercolour(147, 207, 207, 255) outlinecolour(3, 29, 29, 255) valuetextbox(1) fontcolour(255, 255, 255, 255) textcolour(255, 255, 255, 255)
hslider  bounds(38, 26, 221, 30), channel("pan"), range(0, 1, 0.5, 1, 0.001)  trackercolour(147, 207, 207, 255) , 

label bounds(110, 10, 80, 14) text("Pan") fontcolour(255, 255, 255, 255)
label bounds(0, 34, 51, 14) text("Left") fontcolour(255, 255, 255, 255)
label bounds(246, 34, 51, 14) text("Right") fontcolour(255, 255, 255, 255)

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


instr	1			
gkdat	invalue		"dat"
kmix chnget "mix"
kmix port kmix, 0.1
kPan chnget "pan"		;90
kPan = kPan * 180
kPan = kPan - 90
kPan port kPan,0.1
kWide chnget "wide"	
kWide port kWide, 0.1			;40-90
kWide = kWide * 100
kWide = kWide - 50
			
;ainL diskin2 "test.wav",1,0,1
;ainR = ainL
ainL,ainR ins
ainL linenr ainL,0.1,1,0.01
ainR linenr ainR,0.1,1,0.01

ain sum ainL,ainR			
aoutL, aoutR	hrtfmove2	 ain, kPan, kWide , "3DPan-left.dat","3DPan-right.dat", i(gkdat), sr						

	amixL		ntrpol		ainL, aoutL, kmix
	amixR		ntrpol		ainR, aoutR, kmix	


outs amixL,amixR
				
endin
</CsInstruments>
<CsScore>
i 1 0 [60*60*24*7]
</CsScore>
</CsoundSynthesizer>
