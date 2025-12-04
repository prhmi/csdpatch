<Cabbage>
form caption("vcf") size(400, 150), guiMode("queue") pluginId("vcfo") colour(30,30,30)
rslider bounds(26, 64, 60, 60), channel("filt"), range(200, 8000, 400, 1, 1), text("Filt"), trackerColour(255, 217, 0, 255), outlineColour(0, 0, 0, 50), textColour(190, 186, 147, 255)
rslider bounds(94, 64, 60, 60), channel("res"), range(1, 100, 0.2, 1, 0.01), text("Res"), trackerColour(255, 217, 0, 255), outlineColour(0, 0, 0, 50), textColour(190, 186, 147, 255)
combobox bounds(162, 66, 74, 27) channel("mod") colour(70, 69, 69, 255) text("LoPass", "HiPass") value(1)
rslider bounds(248, 64, 60, 60), channel("gain"), range(0, 2, 0.2, 1, 0.01), text("Gain"), trackerColour(255, 217, 0, 255), outlineColour(0, 0, 0, 50), textColour(190, 186, 147, 255)
rslider bounds(318, 64, 60, 60), channel("mix"), range(0, 1, 0.2, 1, 0.01), text("Mix"), trackerColour(255, 217, 0, 255), outlineColour(0, 0, 0, 50), textColour(190, 186, 147, 255)
label bounds(152, 12, 105, 18) channel("label10001") text("3320 Filter")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-m128 -n -d
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1


instr 1
kGain cabbageGet "gain"
kFilter cabbageGet "filt"
kMod cabbageGet "mod"
kRes cabbageGet "res"
kMix cabbageGet "mix"

aInL inch 1
aInR inch 2

 if changed(kMod) == 1 then
 reinit    UPDATE
 endif
     UPDATE:
     iMod = i(kMod)-1
    rireturn 

aFiltL bqrez aInL, kFilter, kRes, iMod
aFiltR bqrez aInR, kFilter, kRes, iMod
aOutL ntrpol aInL,aFiltL*kGain, kMix
aOutR ntrpol aInR,aFiltR*kGain, kMix
out aOutL, aOutR
endin

</CsInstruments>
<CsScore>
i1 0 99999
</CsScore>
</CsoundSynthesizer>
