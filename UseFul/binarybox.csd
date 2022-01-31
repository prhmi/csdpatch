
<Cabbage>
form caption("binary") size(500, 500), pluginId("bnry") style("legacy")
image bounds( 0,0,0,0), shape("sharp"), widgetArray("block", 600) colour( 32,98,166)
image bounds( 0,0,0,0), shape("sharp"), widgetArray("diget", 600) colour( 75,400, 75)
;colour( 75,255, 75)
;colour( 32,98,166)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-n -d 
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


opcode dtob, i[],i
iInValue xin
iValueCopy = iInValue
iLenArr = 0
while iValueCopy > 0 do
 iValueCopy = int(iValueCopy / 2)
 iLenArr += 1
od
iInArr [] init iLenArr
iOutArr [] init lenarray:i(iInArr)
iLen lenarray iInArr
iArrIndx = 0
indx = 0
 while iInValue > 0 do
 iInValue = iInValue / 2
 		if iInValue > int(iInValue) then
 		iDec = 1
 		else
 		iDec = 0
 		endif
 iInValue = int(iInValue)
 iInArr [iLen-1] = iDec ;% 2
 indx += 1
 iLen -= 1
 od
xout iInArr
endop



instr 1

Stxt = "nature does not fit nature"
iLentxt       strlen     Stxt 
iArrtxt [] init iLentxt	
itxtIndx = 0
iCount = 0
iIndxIndx = 0

inxt = 0
	
	ix = 0
	iy = 0
while itxtIndx < iLentxt do

ichr       strchar    Stxt, itxtIndx
iArrtxt [itxtIndx]  = ichr

iInput = ichr
iArr [] dtob iInput

iSizeBox = 14
	indx = 0
	iLen lenarray iArr
		if indx == 0 then
		schedule 2,0,0.1,2,ix,iy,indx+(iLen*inxt)
		ix = (ix+20) % (20*iSizeBox)
	    iy = (ix == 0 ? (iy+20) : iy)
	    indx += 1
		endif

	while indx < lenarray(iArr) do
	ichrIn = iArr[indx]
	;print  ichrIn
	schedule 2,0,0.1,ichrIn, ix,iy,indx+(iLen*inxt)
	ix = (ix+20) % (20*iSizeBox)
	iy = (ix == 0 ? (iy+20) : iy)
	indx += 1
	od
	;printarray iArr,"%.f","dec"
itxtIndx += 1
inxt += 1
;printarray iArrtxt, "%.f"
od
print inxt

endin



;instr 2
;print 1
;ix = p4
;iy = p5
;print p6
;printf "x = %d, y = %d\n",1,ix,iy
;endin

instr 2
ichr = p4
ix = p5
iy = p6
index = p7
Sbox     sprintf "bounds(%d,%d,%d,%d)",ix+20,iy+20,18,18
Sblock   sprintf "block_ident%d", index+1

if ichr == 1 then
chnset	Sbox  ,Sblock
endif
if ichr == 2 then
Sdiget   sprintf "diget_ident%d", index+1
chnset	Sbox  ,Sdiget
endif
print index
endin

</CsInstruments>
<CsScore>
i1 0 9999
</CsScore>

</CsoundSynthesizer>


