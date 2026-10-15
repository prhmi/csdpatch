<Cabbage>
form caption("Tape Machine") size(420, 230),typeface("parnux.ttf")  guiMode("queue"), colour(20, 25, 35), pluginId("tpm1")
image    bounds(71, 64, 277, 82), channel("art"), colour(0, 0, 0, 0), , mouseInteraction(0)
button   bounds(20, 22, 79, 25)   channel("startt")   text("start tape", "stop tape") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
rslider  bounds(360, 162, 50, 50) channel("mix")     range(0, 1, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("mix")
combobox bounds(246, 22, 86, 23),channel("tapemod")  text("Tape", "Freeze", "Loop"), value(1),  colour(56, 63, 79, 255)
combobox bounds(110, 22, 78, 23),channel("lfomod")  text("LFO mod", "sine", "sqr", "rnd-sine", "rnd-step", "jsp-sine", "jsp-step"), value(1),  colour(56, 63, 79, 255)
nslider  bounds(126, 164, 69, 35) channel("speed")   range(-4, 4, 0.7, 1, 0.01) colour(41, 58, 67, 255) text("speed")
nslider  bounds(230, 164, 69, 35) channel("pitch")   range(-1200, 1200, 0, 1, 1) colour(41, 58, 67, 255) text("cent")
nslider  bounds(194, 16, 45, 29) channel("port")   range(0, 1, 0.3, 1, 0.1) colour(41, 58, 67, 255) text("port")
rslider  bounds(308, 162, 50, 50) channel("makeup")  range(0, 1, 0.1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("makeup")
rslider  bounds(70, 162, 50, 50)  channel("rate")    range(0.1, 24, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("LFO")
rslider  bounds(18, 162, 50, 50)  channel("depth")   range(0, 3, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("dep")
button   bounds(346, 24, 25, 25)  channel("record")  text("R", "R") colour:0(67, 64, 64, 255) colour:1(155, 56, 56, 255)
button   bounds(378, 24, 25, 25)  channel("play")    text("P", "P") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255)
button   bounds(202, 174, 18, 27) channel("link")    text("L", "L") colour:0(67, 64, 64, 255) colour:1(224, 226, 58, 255)
;

; ---- Freeze widgets: hidden until tapemod = Freeze, they take the place of the tape widgets ----
button   bounds(20, 22, 79, 25)   channel("startf")   text("start Frz", "stop Frz") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
button   bounds(346, 24, 25, 25)  channel("frznow")    text("F", "F") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255) visible(1)
button   bounds(378, 24, 25, 25)  channel("ampnow")    text("A", "A") colour:0(67, 64, 64, 255) colour:1(180, 170, 46, 255) visible(1)
button   bounds(378, 54, 25, 25)  channel("frzmetro")    text("M", "M") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(1)
button   bounds(378, 84, 25, 25)  channel("tapf")    text("T", "T") colour:0(67, 64, 64, 255) colour:1(80, 170, 146, 255) 
combobox bounds(110, 22, 78, 23),channel("lfomoda")  text("LFO amp", "sine", "rnd-sine","sqr", "rnd-sqr", "ramp", "rnd-ramp"), value(1),  colour(56, 63, 79, 255)
;combobox bounds(14, 72, 51, 23),channel("lfomodf")  text("LFO frq","sqr", "rnd-sqr"), value(1),  colour(56, 63, 79, 255)
button   bounds(30, 132, 25, 25)  channel("lfomodf")    text("F", "S") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255) 
button   bounds(202, 172, 22, 28)  channel("frzmd")    text("F", "A") colour:0(55, 126, 26, 255) colour:1(180, 170, 46, 255) 
rslider  bounds(18, 162, 50, 50)  channel("ratef")    range(0.3, 8, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("rate")
combobox bounds(192, 24, 50, 20), channel("FFTSize"), text("128", "256", "512", "1024", "2048", "4096", "8192"), value(4), colour(56, 63, 79, 255) visible(1)
nslider  bounds(126, 164, 69, 35) channel("frztme")   range(0.5, 30, 7, 1, 0.1) colour(41, 58, 67, 255) text("Freez") visible(1)
nslider  bounds(230, 164, 69, 35) channel("amptme")   range(5, 50, 12, 1, 1) colour(41, 58, 67, 255) text("Amp")visible(1)
rslider  bounds(70, 162, 50, 50) channel("frzmss") range(0, 100, 40, 1, 1)    popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("F-m") 
rslider  bounds(308, 162, 50, 50) channel("ampmss") range(0, 100, 70, 1, 1)    popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("A-m") visible(1)

; ---- Loop widgets: hidden until tapemod = Loop, they take the place of the tape widgets ----
button   bounds(20, 22, 79, 25)   channel("startl")   text("start Loop", "stop Loop") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
nslider  bounds(194, 16, 45, 29)  channel("swft")      range(0, 5, 0, 1, 0.1) colour(41, 58, 67, 255) text("swift") visible(0)
button   bounds(346, 24, 25, 25)  channel("loop")      text("L", "L") colour:0(67, 64, 64, 255) colour:1(190, 170, 40, 255) visible(0)
button   bounds(378, 24, 25, 25)  channel("machine")   text("Q", "Q") colour:0(67, 64, 64, 255) colour:1(190, 170, 40, 255) visible(0)
button   bounds(378, 54, 25, 25)  channel("lpmetro")   text("M", "M") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
button   bounds(378, 84, 25, 25)  channel("tapl")      text("T", "T") colour:0(67, 64, 64, 255) colour:1(80, 170, 146, 255) visible(0)
combobox bounds(110, 22, 78, 23) channel("envmod")    text("line", "adsr", "Rnd"), value(3), colour(56, 63, 79, 255) visible(0)
button   bounds(30, 132, 25, 25)  channel("machrnd")   text("S", "R") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
button   bounds(30, 102, 25, 25)  channel("rvsl")   text("x", "R") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
rslider  bounds(18, 162, 50, 50)  channel("loopdur")   range(0.01, 3, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("dur") visible(0)
rslider  bounds(70, 162, 50, 50)  channel("metrotime") range(0.25, 20, 2, 0.5, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("time") visible(0)
nslider  bounds(126, 164, 34, 35) channel("stepsmin")  range(1, 50, 4, 1, 1) colour(41, 58, 67, 255) text("rep-") visible(0)
nslider  bounds(161, 164, 34, 35) channel("stepsmax")  range(1, 50, 4, 1, 1) colour(41, 58, 67, 255) text("rep+") visible(0)
button   bounds(202, 172, 22, 28) channel("rndptch")   text("P", "P") colour:0(67, 64, 64, 255) colour:1(50, 120, 137, 255) visible(0)
nslider  bounds(230, 164, 60, 35) channel("lpch")      range(0, 700, 100, 1, 50) colour(41, 58, 67, 255) text("pitch") visible(0)
rslider  bounds(300, 162, 50, 50) channel("lpmss")     range(0, 100, 50, 1, 1) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("M %") visible(0)

</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-d -+rtmidi=NULL -M0 -m0d
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

seed 0

; tape buffer: 1 seconds, one table per channel
giSecs  init 60
giTapeL ftgen 0, 0, -(giSecs * sr), 2, 0
giTapeR ftgen 0, 0, -(giSecs * sr), 2, 0
gkSpd init 0
gkPch init 0

; the source: the "source" instrument fills these every control cycle and every other instrument reads them,
; so they all hear the same position of the file (with a live input there is nothing to line up)
gaSrcL init 0
gaSrcR init 0

; loop ring buffer: LoopFx records the source into it all the time (it is a circular buffer) and a loop is a
; slice of the last few seconds. One table per channel. The size is rounded up to a power of 2 on purpose,
; so the table wrap works. giLoopLen is the real length in seconds.
giLoopL ftgen 0, 0, 20*sr, 2, 0
giLoopR ftgen 0, 0, 20*sr, 2, 0
giLoopLen = ftlen(giLoopL) / sr

; wheel (TapeGUI) in Loop mode: the loop reader says how fast the reel turns (it is written into gkSpdTape).
; giWheelBack = 1 -> the reel winds back to its starting point at the end of every repeat, 0 -> it just turns.
giWheelBack = 1


#include "tape.udo"


opcode makeup, a, akkkk
    aIn, kDrive, kScale, kFc, kHiss xin
    kG    = 0.2 + kDrive * 5
    kBias = 0.12 * kDrive
    aSat  = (tanh(aIn * kG + kBias) - tanh(kBias)) / kG * sqrt(max(kG, 1))
    aSat  dcblock2 aSat
    kBump limit 70 * kScale, 20, 1500
    aBump pareq aSat, kBump, 1.35, 0.8, 0
    aN    pinker
    aN    buthp aN, 400
    aOut  butlp aBump + aN * kHiss, kFc
    xout  aOut
endop


; spectral freeze (from freeze.csd). The FFT size is read from kFFTSize, never below index 1 (128).
opcode Freeze,aa,aakk
aInL,aInR,kTrig,kFFTSize xin
	iFFTsize = 2^(max(i(kFFTSize), 1)+6)
	ioverlap = iFFTsize/4
	iwinsize = iFFTsize
	iwintype = 1
	kfreeza = kTrig
	kfreezf = kTrig
;;Left
    f_analL  	pvsanal	aInL, iFFTsize, ioverlap, iwinsize, iwintype
	f_freezeL	pvsfreeze f_analL, kfreeza, kfreezf
	aFL		pvsynth f_freezeL
 ;;Right
    f_analR  	pvsanal	aInR, iFFTsize, ioverlap, iwinsize, iwintype
	f_freezeR	pvsfreeze f_analR, kfreeza, kfreezf
	aFR		pvsynth f_freezeR
xout aFL,aFR
endop


; show or hide one widget when kTrig = 1
opcode setVis, 0, kSk
    kTrig, SChan, kVis xin
    cabbageSet kTrig, SChan, "visible", kVis
endop


; the source. It runs first in every control cycle. For a live input use:  gaSrcL inch 1  and  gaSrcR inch 2
instr source
    gaSrcL, gaSrcR diskin2 "../harf4.wav", 1, 0, 1
endin


instr Record
aInL = gaSrcL
aInR = gaSrcR
aAtt transeg  0, 0.005, 6, 1
aRel transegr 1, 0.005, -6, 0
    aPtr linseg 0, giSecs, giSecs * sr
    kPtr linseg 0, giSecs, giSecs * sr
    gkWrPos = aPtr / sr  
    tablew aInL*aAtt*aRel, aPtr, giTapeL
    tablew aInR*aAtt*aRel, aPtr, giTapeR
endin

instr Play
aInL = gaSrcL
aInR = gaSrcR
    kMakeUp cabbageGetValue "makeup"
    iMakeUp cabbageGetValue "makeup"
    kMix cabbageGetValue "mix"
    kSpd = (gkSpd == 0) ? 0.01 : gkSpd
    kPch = (gkPch == 0) ? 0.01 : gkPch
    kSpd  port kSpd, 0.08
    kPch  port kPch, 0.08
    ;;only recorded part
    kPos init 0
    kPos = kPos + kSpd * ksmps / sr
    kEnd = (gkWrPos > 0.05) ? gkWrPos : 0.05
    if kPos >= kEnd then
    kPos = kPos - kEnd
    elseif kPos < 0 then
    kPos = kPos + kEnd
    endif
    aTapePos interp kPos
    aTapeL mincer aTapePos, 1, cent(kPch), giTapeL, 1
    aTapeR mincer aTapePos, 1, cent(kPch), giTapeR, 1
    ;aTapeR temposcal kSpd, 1, cent(kPch)*(-1), giTapeR, 1
 if iMakeUp == 0 goto skip ;skip makeup
 ;makeup tape
    kSpdDr scale abs(kSpd)*kMakeUp, 4, 0.5
    kDrive randi kMakeUp, kSpdDr
    kFilt scale kMakeUp, 1,0
    kFilt = tanh(kFilt) / tanh(2)
    kScale limit abs(kSpd)*kMakeUp, 0.05, 8
    kBase  = 24000 * pow(2, -kFilt * 3.5)
    ;kBase = 36000 * pow(2, -kFilt * 3.5)
    kFc    limit kBase * abs(kSpd), 200, 0.45 * sr
    
kHiss = tanh(abs(kSpd) / 200 * (kMakeUp ^ 0.5)) + tanh(kMakeUp / 50)
kHiss = tanh(kHiss)*1.25
    aMkL makeup aTapeL, kDrive, kScale, kFc,kHiss
    aMkR makeup aTapeR, kDrive, kScale, kFc,kHiss
    aOutL ntrpol  aInL, aMkL, kMix
    aOutR ntrpol  aInR, aMkR, kMix
    goto end
 skip:
 aOutL ntrpol  aInL, aTapeL, kMix
 aOutR ntrpol  aInR, aTapeR, kMix
 end:
 ; no release tail: when the tape stops the sound stops (a 10 ms fade only, so it does not click)
 iRel = max(p4, 0.005)
 aRel transegr 1, iRel, 6, 0
 out aOutL*aRel, aOutR*aRel
 ;chnmix aOutL*aRel,"snd1"
 ;chnmix aOutR*aRel,"snd2"
 ;chnclear "mic1", "mic2"
endin

; Freeze mode: only alive while tapemod = Freeze. It reads its own copy of the source (aDryL, aDryR),
; freezes either the source (T off) or the tape output (T on), and mixes frozen against the dry source.
; Must stay between Play and speaker, so it runs after Play and before speaker.


instr FreezeFx

 aDryL = gaSrcL                                  ; the source, always the dry side of the mix
 aDryR = gaSrcR

 kTapF cabbageGetValue "tapf"
    if kTapF == 0 then
    aInL = aDryL                                   ; freeze the source directly
    aInR = aDryR
    kSpdOut = 1
    elseif kTapF == 1 then
    kSpd cabbageGetValue "speed"
    kPch cabbageGetValue "pitch"
    aInL temposcal kSpd, 1, cent(kPch), giTapeL, 1  ; freeze the tape output
    aInR temposcal kSpd, 1, cent(kPch), giTapeR, 1
    kSpdOut = kSpd
    endif
 kAmpRnd   cabbageGetValue "ampnow"
 kfrznow   cabbageGetValue "frznow"
 kmetro    cabbageGetValue "frzmetro"
 kAmpSpeed cabbageGetValue "amptme"
 kAmpMoses cabbageGetValue "ampmss"
 kFrzSpeed cabbageGetValue "frztme"
 kFrzMoses cabbageGetValue "frzmss"
 kLFOmodA  cabbageGetValue "lfomoda"
 kLFOmodF  cabbageGetValue "lfomodf"
 kFrzMod   cabbageGetValue "frzmd"
 kRate     cabbageGetValue "ratef"
 kMix      cabbageGetValue "mix"

    ; random freezing: the checkbox follows the random generator
    if changed(kmetro) == 1 && kmetro == 0 then
    kfrznow = 0
    cabbageSetValue "frznow", k(0)
    endif
    if kmetro == 1 then
        if kLFOmodF == 0 then
        kfrznow = ((randi:k(50, kFrzSpeed, 2) + 50) < kFrzMoses) ? 0 : 1
        elseif kLFOmodF == 1 then
        kfrznow = lfo:k(0.5, kRate, 2)+0.5
        endif
        cabbageSetValue "frznow", kfrznow, changed(kfrznow)
    endif
gkSpdTape = kfrznow == 1 ? 0 : kSpdOut
if release() == 1 then
gkSpdTape = 0
endif
    if kFrzMod == 0 then          ; on Frz: amplitude effect only while frozen
    kFrzM = kfrznow
    elseif kFrzMod == 1 then                         ; anyway: amplitude effect all the time
    kFrzM = 1
    endif

    kAmp = 1
    if kAmpRnd == 1 && kFrzM == 1 then
       if kLFOmodA == 1 then
       kAmp = ((randi:k(50, kAmpSpeed, 2) + 50) > kAmpMoses) ? 0 : 1
       elseif kLFOmodA == 2 then ;sine
       kAmp = lfo:k(0.5, kRate, 0)+0.5
       elseif kLFOmodA == 3 then ;rnd-sine
       kRate2 randomh (kAmpSpeed/10),kRate, 8
       kAmp = lfo:k(0.5, +kRate2, 0)+0.5
       elseif kLFOmodA == 4 then ;square
       kAmp = lfo:k(0.5, kRate, 2)+0.5
       elseif kLFOmodA == 5 then ;rnd-square
       kRate2 randomh (kAmpSpeed/10),kRate, 8
       kAmp = lfo:k(0.5, +kRate2, 2)+0.5
       elseif kLFOmodA == 6 then ;ramp
       kPhase phasor -kRate
       kAmp = kPhase^(kAmpSpeed/10)
       elseif kLFOmodA == 7 then ;rnd-ramp
       kRate2 randomh (kAmpSpeed/10),kRate, 8
       kPhase phasor -kRate2
       kAmp = kPhase^(kAmpSpeed/10)
       endif
    endif
    kAmp port kAmp, 0.003
    aAmp interp kAmp

    kFFTSize init 4
    kFFTSize cabbageGetValue "FFTSize"
    if changed(kFFTSize) == 1 then
        reinit UPDATE
    endif
    UPDATE:
    aFrzL, aFrzR Freeze aInL, aInR, kfrznow, kFFTSize
    rireturn

    ; tape to frozen crossfade, then the amplitude effect
    kFade port kfrznow, 0.01
    aWetL = (aInL + (aFrzL - aInL) * kFade) * aAmp
    aWetR = (aInR + (aFrzR - aInR) * kFade) * aAmp
    ; short fade in and out, so switching tapemod does not click
;    iRel = max(p4, 0.005)
;    aRel transegr 1, iRel, 6, 0
    aEnv linsegr 0, 0.01, 1, 0.01, 0
    aOutL = aWetL * aEnv
    aOutR = aWetR * aEnv
    chnmix aOutL, "snd1"
    chnmix aOutR, "snd2"

aMixL ntrpol aDryL, aWetL, kMix     ; dry = source, wet = frozen / tape
aMixR ntrpol aDryR, aWetR, kMix
out aMixL * aEnv, aMixR * aEnv
endin


; ---------------------------------------------------------------------------------------------------------
; Loop mode: ONE instrument, LoopFx. Only alive while tapemod = Loop and start = 1 (the widgets instrument starts
; and stops it). It is a loop machine on a ring buffer that always records its input, and a loop is a slice of
; the last few seconds of that ring.
;
;   start     : the input passes through. mix = 1 means you hear only the loop path, mix < 1 adds the dry source.
;   T         : like T in Freeze. T off = the loop machine works on the original input, T on = on the tape
;               machine output (speed and cent widgets, the tape has to be recorded first).
;   L         : steady loop. It grabs the last "dur" seconds and repeats them. "dur" follows the widget while it plays.
;   Q         : loop machine. Every "time" seconds it grabs the end of the input and repeats it rep- to rep+ times,
;               then the next burst starts and grabs again. "envmod" is the burst shape (line = flat gate,
;               adsr = small dip, Rnd = one of them).
;   M         : like M in Freeze. Every "time" seconds the machine throws a dice: with "M %" chance the L loop is
;               switched on (a fresh grab), otherwise you hear the original sound. The L button follows it.
;               Q keeps working in the steps where M says "no loop".
;   S / R     : S = every repeat has the same length. R = every single REPEAT gets its own random length
;               (half to double of the normal one). The bursts (events) keep their steady time.
;   swift     : (0.1 steps, seconds) every repeat grabs its slice up to this much earlier in the past, at random.
;               0 = a clean loop, more = the loop scatters through the past (time and content).
;   P / pitch : every repeat gets a new random pitch, up or down by up to "pitch" cent (the sign is ignored).
;   LFO amp   : an LFO on the level of the loop path (sine, square, ramp, and the random-rate versions),
;               "lfo rate" and "lfo dep" (depth, 1 = down to silence).
;   If L and Q are both on, L wins.
;
; The loop reader is a phasor that walks through the slice once per repeat. When it wraps, a new repeat starts and
; its length, pitch and grab point are drawn. A new loop or burst restarts the phasor (reinit) while the level is at 0.
; ---------------------------------------------------------------------------------------------------------

instr LoopFx
    aDryL = gaSrcL                                    ; the original input, always the dry side of the mix
    aDryR = gaSrcR

    kLoopW   cabbageGetValue "loop"
    kMachine cabbageGetValue "machine"
    kMetro   cabbageGetValue "lpmetro"
    kMPct    cabbageGetValue "lpmss"
    kMachRnd cabbageGetValue "machrnd"
    kLoopDur cabbageGetValue "loopdur"
    kTimeIn  cabbageGetValue "metrotime"
    kStepMin cabbageGetValue "stepsmin"
    kStepMax cabbageGetValue "stepsmax"
    kSwift   cabbageGetValue "swft"
    kRndPch  cabbageGetValue "rndptch"
    kLpch    cabbageGetValue "lpch"
    kEnvMod  cabbageGetValue "envmod"
    kTapL    cabbageGetValue "tapl"
    kMix     cabbageGetValue "mix"
    kRvL     cabbageGetValue "rvsl"

    ; what the loop machine works on: the original input (T off) or the tape machine output (T on), like T in Freeze
    if kTapL == 0 then
        aInL = aDryL
        aInR = aDryR
        kSpdOut = 1
    else
        kSpd cabbageGetValue "speed"
        kPch cabbageGetValue "pitch"
        kSpdT = (kSpd == 0) ? 0.01 : kSpd
        aInL temposcal kSpdT, 1, cent(kPch), giTapeL, 1
        aInR temposcal kSpdT, 1, cent(kPch), giTapeR, 1
        kSpdOut = kSpdT
    endif

    ; ---- the step clock: runs for Q and for M. Every "time" seconds kTick = 1 for one control cycle
    kTick   = 0
    kMClock init 0
    kTime   init 2
    if kMachine == 1 || kMetro == 1 then
        kMClock = kMClock - ksmps / sr
        if kMClock <= 0 then
            kTime   = kTimeIn
            kMClock = kMClock + kTime
            kTick   = 1
        endif
    else
        kMClock = 0
    endif

    ; ---- M: random loop / original sound, like M in Freeze. It presses the L button by itself
    kLoopM init 0
    if changed(kMetro) == 1 && kMetro == 0 then
        kLoopM = 0
        cabbageSetValue "loop", k(0)
    endif
    if kMetro == 1 && kTick == 1 then
        kLoopM = (random:k(0, 100) < kMPct) ? 1 : 0
        cabbageSetValue "loop", kLoopM
    endif
    kLoop = (kMetro == 1) ? kLoopM : kLoopW

    ; 0 = off, 1 = loop, 2 = machine (if both buttons are on, loop wins)
    kState  = (kLoop == 1) ? 1 : ((kMachine == 1) ? 2 : 0)
    kPrevS  init 0
    kChange = (kState != kPrevS) ? 1 : 0

    ; ---- ring buffer: records all the time. Only a very long steady loop (it would be overwritten after about
    ; 10 s) stops the recording, so a loop grabbed from the live input never has a seam in it.
    kHoldT init 0
    kHoldT = (kState == 1) ? kHoldT + ksmps / sr : 0
    kHold  = (kHoldT > giLoopLen - 12) ? 1 : 0
    aWr    phasor (1 - kHold) / giLoopLen
    if kHold == 0 then
        tablew aInL, aWr, giLoopL, 1
        tablew aInR, aWr, giLoopR, 1
    endif
    kWr    downsamp aWr                               ; where the ring is written right now, 0..1

    ; ---- start of a loop or a burst
    ; off -> loop/machine: starts at once. loop <-> machine: the level goes down in 5 ms, then it starts.
    ; Q burst on a tick: starts at once (the burst level is 0 at that moment anyway).
    kStartNow = 0
    kPend  init 0
    kXf    init 1
    if kChange == 1 && kState != 0 then
        if kPrevS == 0 then
            kStartNow = 1
        else
            kPend = 1
        endif
    endif
    if kTick == 1 && kState == 2 && kChange == 0 then
        kStartNow = 1
    endif
    if kPend == 1 then
        kXf = max(kXf - ksmps / (sr * 0.005), 0)
        if kXf <= 0 then
            kPend     = 0
            kStartNow = 1
        endif
    else
        kXf = min(kXf + ksmps / (sr * 0.005), 1)
    endif
    kPrevS = kState

    kEndBase   init 0                                 ; ring position where the slice of this loop / burst ends
    kSliceBase init 0.5                               ; normal repeat length of the burst (seconds)
    kBurstT    init 0
    kBurstDur  init 1
    kBurstType init 1
    kBurstT    = kBurstT + ksmps / sr
    kGo        = 0
    if kStartNow == 1 then
        kGo = 1
        if kState == 1 then
            kEndBase = kWr                            ; grabs the last "dur" seconds
        elseif kState == 2 then
            if kTick == 0 then                        ; started by hand: the step clock starts with the burst
                kTime   = kTimeIn
                kMClock = kTime
            endif
            kLoR       = (kStepMin < kStepMax) ? kStepMin : kStepMax
            kHiR       = (kStepMin < kStepMax) ? kStepMax : kStepMin
            kN         = limit(int(random:k(kLoR, kHiR + 1)), 1, 100)     ; how many repeats fit in this burst
            kSliceBase = limit(kTime / kN, 0.005, 6)
            kEndBase   = kWr                          ; grabs the end of the input
            kBurstT    = 0
            kBurstDur  = kTime
            kBurstType = (kEnvMod == 3) ? int(random:k(1, 3)) : kEnvMod
        endif
    endif

    ; burst level: a short attack, a short release, and nothing decays in between
    kAtt  = (0.01 < kBurstDur * 0.1) ? 0.01 : kBurstDur * 0.1
    kDec  = (0.08 < kBurstDur * 0.2) ? 0.08 : kBurstDur * 0.2
    kRelT = (0.02 < kBurstDur * 0.1) ? 0.02 : kBurstDur * 0.1
    kE1   = limit((kBurstT < kBurstDur - kRelT) ? kBurstT / kAtt : (kBurstDur - kBurstT) / kRelT, 0, 1)
    kE2   = (kBurstT < kAtt) ? kBurstT / kAtt : ((kBurstT < kAtt + kDec) ? 1 - 0.15 * (kBurstT - kAtt) / kDec : 0.85)
    kE2   = kE2 * limit((kBurstDur - kBurstT) / kRelT, 0, 1)
    kBEnv = (kState == 2) ? ((kBurstType == 1) ? kE1 : kE2) : 1
    aBEnv interp kBEnv

    ; ---- the reader: one phasor, once per repeat
    kLenRep init 0.5                                  ; length of the playing repeat (seconds of the ring)
    kEndRep init 0                                    ; ring position where the playing repeat ends
    kCur    init 0                                    ; random pitch (cent) of the playing repeat
    kPhPrev init 1
    kBase   = (kState == 1) ? kLoopDur : kSliceBase
    if kMachRnd == 0 then
        kLenRep = limit(kBase, 0.005, 6)              ; S: follows the dur widget at once
    endif
    kRatio  = cent(kCur)
    if kGo == 1 then
        reinit PHASE
    endif
PHASE:
    aPh     phasor kRatio / kLenRep                   ; 0..1, once per repeat
    rireturn
    kPh     downsamp aPh
    if kGo == 1 then
        kPhPrev = 1                                   ; a new loop is a new repeat
    endif
    if kPh < kPhPrev then                             ; a new repeat starts, draw its own values
        if kMachRnd == 1 then                         ; R: its own length, half to double
            kLenRep = limit(kBase * pow(2, random:k(-1, 1)), 0.005, 6)
        endif
        kCur    = (kRndPch == 1) ? random:k(-abs(kLpch), abs(kLpch)) : 0
        kEndRep = kEndBase - random:k(0, kSwift) / giLoopLen     ; swift: grab point goes back by up to kSwift seconds
    endif
    kPhPrev = kPh
    kRvL2 = (kRvL == 0) ? 1 : -1
    kLenN   = kLenRep / giLoopLen                     ; slice length as a part of the ring
    aPos    = (kEndRep + 1) - (1 - aPh) * kLenN       ; the +1 keeps the position positive, the table wraps it
    aLoopL  table3 aPos*kRvL2, giLoopL, 1, 0, 1
    aLoopR  table3 aPos*kRvL2, giLoopR, 1, 0, 1
    kFd     = limit(kLenRep * 0.25, 0.001, 0.006)     ; short fade at the repeat seam, so it does not click
    aFd1    limit aPh * kLenRep / kFd, 0, 1
    aFd2    limit (1 - aPh) * kLenRep / kFd, 0, 1


    aXf     interp kXf

    aLpL    = aLoopL * aFd1 * aFd2 * aBEnv * aXf
    aLpR    = aLoopR * aFd1 * aFd2 * aBEnv * aXf

    ; ---- input to loop crossfade
    kActive = (kState != 0) ? 1 : 0
    kFade   port kActive, 0.02, 0
    aWetL   = aInL + (aLpL - aInL) * kFade
    aWetR   = aInR + (aLpR - aInR) * kFade

    ; ---- wheel (TapeGUI): the input's speed while it passes through, the reader's speed while a loop plays.
    ; Every repeat the reel turns at the playback speed and winds back at its end (giWheelBack = 1).
    kT      = kLenRep / kRatio                        ; seconds per repeat
    kRewT   = limit(0.3 * kT, 0.002, 0.25)            ; how long the wind back takes
    kFr     = limit(kRewT / kT, 0.01, 0.5)            ; ... as a part of the repeat
    kWheel  = (giWheelBack == 1 && kPh >= 1 - kFr) ? -kRatio * (1 - kFr) / kFr : kRatio
    gkSpdTape = (kState != 0) ? kWheel*kRvL2 : kSpdOut

    ; ---- dry / wet, then a very short fade in and out, so starting and stopping does not click
    aEnv    linsegr 0, 0.01, 1, 0.01, 0
    aMixL   ntrpol aDryL, aWetL, kMix
    aMixR   ntrpol aDryR, aWetR, kMix
    out     aMixL * aEnv, aMixR * aEnv

    if release() == 1 then
        gkSpdTape = 0
    endif
endin


; speaker: start off -> plays the dry source at (1 - mix).
; start on -> Play / FreezeFx already output their own dry/wet mix, so speaker stays silent (no doubling).
instr speaker
aInL = gaSrcL
aInR = gaSrcR

kStart cabbageGetValue "startt"
kMix   cabbageGetValue "mix"

kDryG  = (kStart == 0) ? (1 - kMix) : 0
kDryG  port kDryG, 0.02          ; smooth, no click when start toggles
out aInL*kDryG*kStart, aInR*kDryG*kStart

;chnclear "snd1", "snd2"
endin


instr widgets
 kStartT cabbageGet "startt"
 kStartF cabbageGet "startf"
 kStartL cabbageGet "startl"
    kSpdIn cabbageGetValue "speed"
    kRec   cabbageGetValue "record"
    kPlay  cabbageGetValue "play"
    kPchIn cabbageGetValue "pitch"
    ktLFO   cabbageGetValue "tlfo"
    kLFOmod cabbageGetValue "lfomod"
    kDep    cabbageGetValue "depth"
    kRate    cabbageGetValue "rate"
    kPort cabbageGetValue "port"
    kTapeMod cabbageGetValue "tapemod"
    ;;frz
    kFrz cabbageGetValue "frznow"

    ; ---- tapemod: 1 = Tape, 2 = Freeze, 3 = Loop ----
    ; in Freeze and Loop mode the tape widgets are hidden and that mode's widgets are shown.
    ; The hidden tape widgets keep their values and still work. The LFO selector
    ; and the tape GUI stay in all modes.
    kFrzMode  = (kTapeMod == 2) ? 1 : 0
    kLoopMode = (kTapeMod == 3) ? 1 : 0
    kTapeVis  = 1 - kFrzMode - kLoopMode
    kPrevMode init -1
    kVisChg   = (kTapeMod != kPrevMode) ? 1 : 0
    kPrevMode = kTapeMod
    ; tape widgets
    setVis kVisChg, "startt",  kTapeVis
    setVis kVisChg, "speed",   kTapeVis
    setVis kVisChg, "pitch",   kTapeVis
    setVis kVisChg, "port",    kTapeVis
    setVis kVisChg, "link",    kTapeVis
    setVis kVisChg, "makeup",  kTapeVis
    setVis kVisChg, "play",    kTapeVis
    setVis kVisChg, "record",  kTapeVis
    setVis kVisChg, "rate",    kTapeVis
    setVis kVisChg, "depth",   kTapeVis
    setVis kVisChg, "lfomod",  kTapeVis
    ; freeze widgets
    setVis kVisChg, "startf",  kFrzMode
    setVis kVisChg, "lfomoda",  kFrzMode
    setVis kVisChg, "lfomodf",  kFrzMode
    setVis kVisChg, "frznow",  kFrzMode
    setVis kVisChg, "frzmetro",kFrzMode
    setVis kVisChg, "ampnow",  kFrzMode
    setVis kVisChg, "frztme",  kFrzMode
    setVis kVisChg, "frzmss",  kFrzMode
    setVis kVisChg, "amptme",  kFrzMode
    setVis kVisChg, "ampmss",  kFrzMode
    setVis kVisChg, "FFTSize", kFrzMode
    setVis kVisChg, "ratef",   kFrzMode
    setVis kVisChg, "frzmd",   kFrzMode
    setVis kVisChg, "tapf",   kFrzMode
    ; loop widgets
    setVis kVisChg, "startl",  kLoopMode
    setVis kVisChg, "lfomodl",  kLoopMode
    setVis kVisChg, "loop",      kLoopMode
    setVis kVisChg, "machine",   kLoopMode
    setVis kVisChg, "machrnd",   kLoopMode
    setVis kVisChg, "rndptch",   kLoopMode
    setVis kVisChg, "envmod",    kLoopMode
    setVis kVisChg, "loopdur",   kLoopMode
    setVis kVisChg, "metrotime", kLoopMode
    setVis kVisChg, "stepsmin",  kLoopMode
    setVis kVisChg, "stepsmax",  kLoopMode
    setVis kVisChg, "lpch",  kLoopMode
    setVis kVisChg, "swft",      kLoopMode
    setVis kVisChg, "tapl",      kLoopMode
    setVis kVisChg, "lpmetro",   kLoopMode
    setVis kVisChg, "lfr",       kLoopMode
    setVis kVisChg, "lfd",       kLoopMode
    setVis kVisChg, "lpmss",     kLoopMode
    setVis kVisChg, "rvsl",     kLoopMode
    
    
    if changed(kStartT) == 1 then
        if kStartT == 0 then
            ; stop tape: every transport and effect button goes off
            cabbageSetValue "record",   0
            cabbageSetValue "play",     0
            cabbageSetValue "frznow",   0
            cabbageSetValue "ampnow",   0
            cabbageSetValue "frzmetro", 0
            cabbageSetValue "loop",     0
            cabbageSetValue "machine",  0
            cabbageSetValue "lpmetro",  0
        endif
        if kTapeMod == 1 then
        ;kDelay delayk kStart, 1
        cabbageSetValue "play", kStartT
        cabbageSetValue "record", kStartT
        endif
    endif
    if changed(kStartF) == 1 && kStartF == 1 then
    schedulek "FreezeFx", 0, 99999
    elseif changed(kStartF) == 1 && kStartF == 0 then
    turnoff2 "FreezeFx", 0, 1
    cabbageSetValue "frznow", k(0)
;    cabbageSetValue "frzmetro", k(0)
;    cabbageSetValue "ampnow", k(0)
;    cabbageSetValue "tapf", k(0)
;    cabbageSetValue "lfomodf", k(0)
    endif

    ; ---- Loop mode: LoopFx runs while start = 1 and tapemod = Loop. It also starts when tapemod is switched to
    ; Loop while start is already on. The tape's play stops then (its sound reaches the loop machine with T), record
    ; is left as it is, and nothing is switched on again when you come back to Tape (P and R stay off).
    kLoopOn = (kLoopMode == 1 && kStartL == 1) ? 1 : 0
    if changed(kLoopOn) == 1 then
        if kLoopOn == 1 then
            cabbageSetValue "play", 0
            schedulek "LoopFx", 0, 99999
        else
            turnoff2 "LoopFx", 0, 1
        endif
    endif
    ;;lfo
    if     kLFOmod == 1 then ;none lfo
    kLFO = 0
    elseif kLFOmod == 2 then ;sine
    kLFO lfo kDep, kRate, 0
    elseif kLFOmod == 3 then ;square
    kLFO lfo kDep, kRate, 2
    elseif kLFOmod == 4 then ;rnd-sine
    kLFO randi kDep, kRate, 1
    elseif kLFOmod == 5 then ;rnd-step
    kLFO randh kDep, kRate, 1
    elseif kLFOmod == 6 then ;jsp-line
    kLFO jspline kDep, kRate*0.9, kRate*1.1
    elseif kLFOmod == 7 then ;jsp-step
    kRateRnd randomh kRate*0.8, kRate*1.2, kRate
    kLFO randh kDep, kRateRnd, 1
    endif
    kSpeed = kSpdIn+kLFO

    if kRec == 1 && changed(kRec) == 1 then
    schedulek "Record", 0, 99999
    elseif kRec == 0 && changed(kRec) == 1 then
    turnoff2 "Record", 0, 1
    endif
    if kPlay == 1 && changed(kPlay) == 1 then
    schedulek "Play", 0, 99999,kPort
    elseif kPlay == 0 && changed(kPlay) == 1 then
    turnoff2 "Play", 0, 1
    endif
    
    

    if kRec == 1 && kPlay == 0 then
    kTarget = 1
    elseif kPlay == 1 || (kRec == 1 && kPlay == 1) then
    kTarget = kSpeed
    else
    kTarget = 0
    endif

 kAbs = abs(kTarget)
 kCents = (kAbs <= 1) ? (kAbs - 1) * 300 : (kAbs - 1) * 300/3

kLink cabbageGet "link"
 kPchWant   = (kLink == 1) ? kCents : kPchIn
 kPchTarget = (kPlay == 1) ? kPchWant : -1200

kHold    init 0
kSpdTape init 0
kSpd0    init 0
kPch0    init 0

if changed(kRec, kPlay) == 1 then
    kHold = kPort
    kSpd0 = kSpdTape            ; the glide starts from wherever speed and pitch are now
    kPch0 = gkPch
else
    kHold = max(0, kHold - ksmps / sr)
endif

if kHold == 0 then
    kSpdTape = kTarget
    gkPch    = kPchTarget
else
kPhase phasor kPort
    kPhase = limit(1 - kHold / max(kPort, 0.001), 0, 1)
    iShape = 2     ; 1 = straight line, 2 = gentle S, 3 = steeper middle with flatter ends
    kCurve = kPhase ^ iShape / (kPhase ^ iShape + (1 - kPhase) ^ iShape)
    kSpdTape = kSpd0 + (kTarget - kSpd0) * kCurve
    gkPch    = kPch0 + (kPchTarget - kPch0) * kCurve
endif

 gkSpd = kSpdTape
if kTapeMod == 1 then
gkSpdTape = kSpdTape 
endif
TapeGUI gkSpdTape, "art"
 ;TapeGUI kSpdTape, "art"
endin




</CsInstruments>
<CsScore>
i "source" 0 99999
i "widgets" 0 99999
i "speaker" 0 99999
</CsScore>
</CsoundSynthesizer>
