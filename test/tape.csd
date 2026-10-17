<Cabbage>
form caption("Tape Machine") size(420, 230),typeface("parnux.ttf")  guiMode("queue"), colour(20, 25, 35), pluginId("tpm1")
image    bounds(150, 100, 118, 10) channel("timelineb") colour(52, 54, 62, 255)
image    bounds(150, 100, 0, 10) channel("timeliner") colour(52, 104, 162, 255)
image    bounds(150, 100, 0, 10) channel("timelinep") colour(252, 254, 162, 255)

image    bounds(71, 64, 277, 82), channel("art"), colour(0, 0, 0, 0), , mouseInteraction(0)
; ---- popup background (advanced controls take the place of the reels while "+" is on) ----
image    bounds(71, 64, 277, 82) channel("advbg") colour(30, 37, 52, 255) corners(6) mouseInteraction(0) visible(0)
; ---- LEDs: a dark square, and a coloured square on top of it that each mode lights (no names) ----
; Tape = red (dropout), Freeze = green (amp gate open), Loop = blue (a repeat starts)
;image    bounds(180, 10, 10, 10) channel("ledbase") colour(52, 54, 62, 255)  ;mouseInteraction(0)
image    bounds(360, 54, 10, 10) channel("ledw") colour(152, 54, 62, 255) visible(0)
image    bounds(360, 54, 10, 10) channel("leda") colour(182, 184, 52, 255) visible(0)
image    bounds(360, 54, 10, 10) channel("ledl") colour(182, 184, 52, 255) visible(0)
; ---- tab LEDs (square): lit while that section is started (startt / startf / startl), in every tab.
; The label of the tab that is open is white, the others grey.
image    bounds(128, 213, 8, 8)    channel("tabledtb") colour(45, 47, 55, 255) mouseInteraction(0)
image    bounds(128, 213, 8, 8)    channel("tabledt")  colour(235, 70, 60, 255) mouseInteraction(0) visible(0)
label    bounds(139, 211, 40, 12)  channel("tabtxtt")  text("TAPE") align("left") fontColour(240, 240, 240, 255)
image    bounds(184, 213, 8, 8)    channel("tabledfb") colour(45, 47, 55, 255) mouseInteraction(0)
image    bounds(184, 213, 8, 8)    channel("tabledf")  colour(80, 220, 70, 255) mouseInteraction(0) visible(0)
label    bounds(195, 211, 50, 12)  channel("tabtxtf")  text("FREEZE") align("left") fontColour(90, 92, 100, 255)
image    bounds(250, 213, 8, 8)   channel("tabledlb") colour(45, 47, 55, 255) mouseInteraction(0)
image    bounds(250, 213, 8, 8)   channel("tabledl")  colour(60, 160, 255, 255) mouseInteraction(0) visible(0)
label    bounds(261, 211, 40, 12) channel("tabtxtl")  text("LOOP") align("left") fontColour(90, 92, 100, 255)

button   bounds(20, 22, 79, 25)   channel("startt")   text("start tape", "stop tape") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
rslider  bounds(360, 162, 50, 50) channel("mix")     range(0, 1, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("mix")
combobox bounds(246, 22, 86, 23),channel("tapemod")  text("Tape", "Freeze", "Loop"), value(1),  colour(56, 63, 79, 255)
combobox bounds(110, 22, 78, 23),channel("lfomod")  text("LFO mod", "sine", "sqr", "rnd-sine", "rnd-step", "jsp-sine", "jsp-step"), value(1),  colour(56, 63, 79, 255)
nslider  bounds(126, 164, 69, 35) channel("speed")   range(-4, 4, 0.7, 1, 0.01) colour(41, 58, 67, 255) text("speed")
nslider  bounds(230, 164, 69, 35) channel("pitch")   range(-1200, 1200, 0, 1, 1) colour(41, 58, 67, 255) text("cent")
nslider  bounds(194, 16, 45, 29) channel("port")   range(0, 1, 0.3, 1, 0.1) colour(41, 58, 67, 255) text("port")
rslider  bounds(308, 162, 50, 50) channel("makeup")  range(0, 2, 0.1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("makeup")
rslider  bounds(70, 162, 50, 50)  channel("rate")    range(0.3, 12, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("LFO")
rslider  bounds(18, 162, 50, 50)  channel("depth")   range(0, 3, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("dep")
button   bounds(346, 24, 25, 25)  channel("record")  text("R", "R") colour:0(67, 64, 64, 255) colour:1(155, 56, 56, 255)
button   bounds(378, 24, 25, 25)  channel("play")    text("P", "P") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255)
button   bounds(378, 54, 25, 25)  channel("tapmet")   text("M", "M") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)

button   bounds(202, 174, 18, 27) channel("link")    text("L", "L") colour:0(67, 64, 64, 255) colour:1(224, 226, 58, 255)
;button   bounds(378, 54, 25, 25)  channel("noisev")   text("N", "N") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)

;

; ---- Freeze widgets: hidden until tapemod = Freeze, they take the place of the tape widgets ----
button   bounds(20, 22, 79, 25)   channel("startf")   text("start Frz", "stop Frz") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
button   bounds(346, 24, 25, 25)  channel("frznow")    text("F", "F") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255) visible(1)
button   bounds(378, 24, 25, 25)  channel("ampnow")    text("A", "A") colour:0(67, 64, 64, 255) colour:1(180, 170, 46, 255) visible(1)
button   bounds(378, 54, 25, 25)  channel("frzmetro")    text("M", "M") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(1)
button   bounds(378, 84, 25, 25)  channel("tapf")    text("T", "T") colour:0(67, 64, 64, 255) colour:1(80, 170, 146, 255) 
combobox bounds(110, 22, 78, 23),channel("lfomoda")  text("LFO amp", "sine", "rnd-sine","sqr", "rnd-sqr", "ramp", "rnd-ramp"), value(1),  colour(56, 63, 79, 255)
button   bounds(30, 176, 25, 25)  channel("lfomodf")    text("F", "S") colour:0(67, 64, 64, 255) colour:1(55, 126, 26, 255) visible(0)
button   bounds(30, 146, 25, 25)  channel("mwarmf")    text("W", "W") colour:0(67, 64, 64, 255) colour:1(200, 130, 50, 255) visible(0)

button   bounds(202, 172, 22, 28)  channel("frzmd")    text("F", "A") colour:0(55, 126, 26, 255) colour:1(180, 170, 46, 255) 
rslider  bounds(70, 162, 50, 50)  channel("ratef")    range(0.3, 8, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73)text("rate") visible(0)
combobox bounds(192, 24, 50, 20), channel("FFTSize"), text("128", "256", "512", "1024", "2048", "4096", "8192"), value(4), colour(56, 63, 79, 255) visible(1)
nslider  bounds(126, 164, 69, 35) channel("frztme")   range(0.5, 30, 7, 1, 0.1) colour(41, 58, 67, 255) text("Freez") visible(1)
nslider  bounds(230, 164, 69, 35) channel("amptme")   range(5, 50, 12, 1, 1) colour(41, 58, 67, 255) text("Amp")visible(1)
rslider  bounds(70, 162, 50, 50) channel("frzmss") range(0, 100, 40, 1, 1)    popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("F %") 
rslider  bounds(308, 162, 50, 50) channel("ampmss") range(0, 100, 70, 1, 1)    popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("A %") visible(1)

; ---- Loop widgets: hidden until tapemod = Loop, they take the place of the tape widgets ----
button   bounds(20, 22, 79, 25)   channel("startl")   text("start Loop", "stop Loop") colour:0(67, 64, 64, 255) colour:1(123, 56, 56, 255)
nslider  bounds(194, 16, 45, 29)  channel("swft")      range(0, 5, 0, 1, 0.1) colour(41, 58, 67, 255) text("swift") visible(0)
button   bounds(346, 24, 25, 25)  channel("loop")      text("L", "L") colour:0(67, 64, 64, 255) colour:1(190, 170, 40, 255) visible(0)
button   bounds(378, 24, 25, 25)  channel("lpmetro")   text("M", "M") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
button   bounds(378, 54, 25, 25)  channel("tapl")      text("T", "T") colour:0(67, 64, 64, 255) colour:1(80, 170, 146, 255) visible(0)
button   bounds(378, 84, 25, 25)  channel("mwarml")      text("W", "W") colour:0(67, 64, 64, 255) colour:1(200, 130, 50, 255) visible(0)

combobox bounds(110, 22, 70, 23) channel("rshape")    text("line", "adsr", "ramp", "ramp-r", "sine", "Rnd"), value(6), colour(56, 63, 79, 255) visible(0)
button   bounds(30, 176, 25, 25)  channel("machrnd")   text("S", "R") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
button   bounds(30, 146, 25, 25)  channel("rvsl")   text("x", "R") colour:0(67, 64, 64, 255) colour:1(80, 70, 146, 255) visible(0)
rslider  bounds(70, 162, 50, 50)  channel("loopdur")   range(0.01, 3, 0.5, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("dur") visible(0)
rslider  bounds(70, 162, 50, 50)  channel("metrotime") range(0.25, 20, 2, 0.5, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("time") visible(1)
nslider  bounds(126, 164, 34, 35) channel("stepsmin")  range(1, 50, 4, 1, 1) colour(41, 58, 67, 255) text("rep-") visible(0)
nslider  bounds(161, 164, 34, 35) channel("stepsmax")  range(1, 50, 4, 1, 1) colour(41, 58, 67, 255) text("rep+") visible(0)
button   bounds(202, 172, 22, 28) channel("rndptch")   text("P", "P") colour:0(67, 64, 64, 255) colour:1(50, 120, 137, 255) visible(0)
nslider  bounds(230, 164, 60, 35) channel("lpch")      range(0, 700, 100, 1, 50) colour(41, 58, 67, 255) text("pitch") visible(0)
rslider  bounds(300, 162, 50, 50) channel("lpmss")     range(0, 100, 50, 1, 1) popupText("0") colour(0, 0, 0, 0), trackerColour(50, 212, 255, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("M %") visible(0)

; ---- Advanced popup: the "+" button (same place in every mode) shows these in the middle, over the reels ----
button   bounds(378, 114, 25, 25) channel("adv") text("+", "+") colour:0(67, 64, 64, 255) colour:1(200, 130, 50, 255)
; Tape: how the makeup amount is shared between the parts of the analog character (1 = default balance, 0 = off)
button   bounds(378, 84, 25, 25)  channel("noisev")   text("N", "N") colour:0(67, 64, 64, 255) colour:1(80, 170, 146, 255) visible(0)
rslider  bounds(75, 80, 50, 50) channel("wsat") range(0, 5, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("sat") visible(0)
rslider  bounds(130, 80, 50, 50) channel("wtone") range(0, 2, 0.3, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("tone") visible(0)
rslider  bounds(185, 80, 50, 50) channel("wdrift") range(0, 2, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("drift") visible(0)
rslider  bounds(240, 80, 50, 50) channel("wdrop") range(0, 2, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("drop") visible(0)
rslider  bounds(295, 80, 50, 50) channel("whiss") range(0, 2, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("hiss") visible(0)
; Freeze: blur = the frozen frame is an average of the last seconds, fade = how slowly it blooms, slew = amp gate smoothing
rslider  bounds(130, 80, 50, 50) channel("fblur") range(0.05, 2, 0.05, 0.5, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("blur") visible(0)
rslider  bounds(185, 80, 50, 50) channel("ffade") range(0.01, 3, 0.01, 0.4, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("fade") visible(0)
rslider  bounds(240, 80, 50, 50) channel("fslew") range(0.003, 0.5, 0.003, 0.4, 0.001) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("slew") visible(0)
; Loop: decay = every repeat quieter, seam = soft edges on every repeat
rslider  bounds(157, 80, 50, 50) channel("ldecay") range(0.3, 1, 1, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("decay") visible(0)
rslider  bounds(212, 80, 50, 50) channel("lseam") range(0, 1, 0, 1, 0.01) popupText("0") colour(0, 0, 0, 0), trackerColour(255, 176, 64, 255), trackerBackgroundColour(65, 65, 65, 255), outlineColour(0, 0, 0, 0), markerColour(0, 0, 0, 0), trackerInsideRadius(0.73) text("seam") visible(0)

; ---- scope popup: the "~" button shows the scope over the reels (it and "+" close each other).
; The combobox follows the open tab: speed and pitch show every running section, each in its LED colour
; (Tape red, Freeze green, Loop blue). The LFO items are the modulators of that tab only:
;   Tape: LFO (the speed LFO)   Freeze: LFO amp (A), LFO frz (the F gate)   Loop: repeat (where the reader is in a repeat)
; The last 3 seconds, newest on the right. Values of now on the top.
button   bounds(29, 54, 25, 25) channel("viz") text("~", "~") colour:0(67, 64, 64, 255) colour:1(60, 160, 255, 255)
image    bounds(71, 64, 277, 82) channel("vizbg") colour(30, 37, 52, 255) corners(6) mouseInteraction(0) visible(0)
combobox bounds(75, 67, 64, 18) channel("vizselt") text("speed", "pitch", "LFO") value(1) colour(56, 63, 79, 255) visible(0)
combobox bounds(75, 67, 64, 18) channel("vizself") text("speed", "pitch", "LFO amp", "LFO frz") value(1) colour(56, 63, 79, 255) visible(0)
combobox bounds(75, 67, 64, 18) channel("vizsell") text("speed", "pitch", "repeat") value(1) colour(56, 63, 79, 255) visible(0)
label    bounds(142, 70, 64, 12) channel("vizvt") text("") align("left") fontColour(235, 70, 60, 255) visible(0)
label    bounds(208, 70, 64, 12) channel("vizvf") text("") align("left") fontColour(80, 220, 70, 255) visible(0)
label    bounds(274, 70, 70, 12) channel("vizvl") text("") align("left") fontColour(60, 160, 255, 255) visible(0)
label bounds(5, 176, 125, 12) channel("inf") text("parhamizadyar.net") rotate(-1.56,2,2)
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

; SIGNAL FLOW. The sections run on their own, and chain when they run together:
;   source --+----------------------------------------------------------> speaker  (dry x (1 - mix))
;            +--> [Tape + Warm] --T--+
;            +----------------------+--> [Freeze] --> [Loop] --> (Warm) --> wet x mix
;   T in Freeze / Loop: the section listens to the tape instead of the source.
;   While Freeze runs, Loop listens to Freeze (Loop's own T is then ignored) and only Loop is heard.
;   Warm = the analog character (makeup knob + the advanced "+" popup). The tape has it built in. Freeze and Loop add it
;   to the sound they freeze / loop when the tape is not their input, so a frozen or looped sound is as warm as the
;   tape, and what they do not touch stays exactly as clean as the source.

; tape buffer: 1 seconds, one table per channel
giSecs  init 10
giTapeL ftgen 0, 0, -(giSecs * sr), 2, 0
giTapeR ftgen 0, 0, -(giSecs * sr), 2, 0
gkSpd init 0
gkPch init 0

; the source: the "source" instrument fills these every control cycle and every other instrument reads them,
; so they all hear the same position of the file (with a live input there is nothing to line up)
gaSrcL init 0
gaSrcR init 0
gaTapeL init 0
gaTapeR init 0

; loop ring buffer: LoopFx records the source into it all the time (it is a circular buffer) and a loop is a
; slice of the last few seconds. One table per channel. The size is rounded up to a power of 2 on purpose,
; so the table wrap works. giLoopLen is the real length in seconds.
giLoopL ftgen 0, 0, 20*sr, 2, 0
giLoopR ftgen 0, 0, 20*sr, 2, 0
giLoopLen = ftlen(giLoopL) / sr

; wheel (TapeGUI) in Loop mode: the loop reader says how fast the reel turns (it is written into gkSpdTape).
; giWheelBack = 1 -> the reel winds back to its starting point at the end of every repeat, 0 -> it just turns.
giWheelBack = 1

; chain bus: FreezeFx writes here, LoopFx reads it. LEDs: the instruments write, "widgets" shows them.
gaFrzL init 0
gaFrzR init 0
gkLedW init 0
gkLedA init 0
gkLedL init 0
; wheel: every machine writes its own reel speed and says if it is running. "widgets" picks which one the reel shows,
; so switching tabs never stops (or freezes) the reel while something is still playing.
gkWheelF init 0
gkWheelL init 0
gkRunF   init 0
gkRunL   init 0
; scope + pitch on the reel. Only what really moves is stored:
;   gkVz[0] tape speed   [1] tape pitch (cent)   [2] tape LFO (-1..1)
;   gkVz[3] Freeze LFO amp (-1..1)   [4] Freeze LFO frz = the F gate (-1..1)
;   gkVz[5] Loop's own pitch (cent, the random pitch of the repeat)   [6] Loop repeat (saw, -1..1)
; Freeze and Loop have no speed of their own: with T on they get the tape's, so the scope shows the tape (red).
gkVz[]   init 7
gkPlayOn init 0          ; 1 while Play runs (its release, the tape stop glide, too). "widgets" resets it every cycle


#include "tape.udo"

; TapeGUIp kSpeed, kPitch, SChannel : the reels of TapeGUI, and the pitch on them.
;   kPitch : cent. The faint inner ring of each reel lights up from 12 o'clock: clockwise (amber) = up,
;            anticlockwise (blue) = down. 1200 cent (an octave) = half the ring. 0 = nothing lit, as before.
;   The ring does not turn with the reel, it is a gauge.
opcode TapeGUIp, 0, kkS
    kSpeed, kPitch, SChan xin
    iTickGap = 20
    iDefW    = 232
    iDefH    = 82
    SBackFmt = {{<rect x="%.2f" y="105" width="%.2f" height="3" fill="#2b4186"/><rect x="%.2f" y="32" width="%.2f" height="3" fill="#2b4186"/>}}
    SReelFmt = {{<g transform="translate(%.1f 70)"><circle cx="0" cy="0" r="40" fill="#15181c" stroke="#d5d9de" stroke-width="2"/><circle cx="0" cy="0" r="32" fill="none" stroke="#d5d9de" stroke-opacity="0.2" stroke-width="1"/><g transform="rotate(%.2f)"><path d="M0 0 V-40 M0 0 L34.6 20 M0 0 L-34.6 20" fill="none" stroke="#d5d9de" stroke-width="2" stroke-linecap="round"/></g><circle cx="0" cy="0" r="15" fill="#15181c" stroke="#d5d9de" stroke-width="5"/></g>}}
    kW init 0
    kH init 0
    if timeinstk() == 1 then
        kW cabbageGet SChan, "bounds.width"
        kH cabbageGet SChan, "bounds.height"
        if kW <= 0 then
            kW cabbageGet SChan, "width"
        endif
        if kH <= 0 then
            kH cabbageGet SChan, "height"
        endif
        if kW <= 0 then
            kW = iDefW
        endif
        if kH <= 0 then
            kH = iDefH
        endif
    endif
    kS = kH / 82
    kF = max(kW / kS - 82, 15) / 150
    kTapeLen  = 150 * kF
    kNumTicks = int(kTapeLen / iTickGap) + 1
    kOmega = kSpeed * 2.4
    kDeg   init 0
    kPos   init 0
    kDeg   = (kDeg + kOmega * 57.29578 / kr) % 360
    kPos   = (kPos + kOmega * 22 / kr) % iTickGap
    ; pitch arc: smoothed a little so a jump reads as a short swing
    kPchS  port kPitch, 0.03
    kAng   = limit(kPchS * 0.15, -359, 359)          ; 0.15 degree per cent: 1200 cent = 180 degree
    kTrig  metro 30
    if kTrig == 1 then
        STicks  strcpyk ""
        STicks2 strcpyk ""
        kI = 0
        until kI > kNumTicks do
            kX  = 180 + kI * iTickGap - kPos
            kX2 = 180 + kI * iTickGap + kPos
            if kX >= 180 && kX <= 180 + kTapeLen then
                STk  sprintfk "M%.1f 105 v3 ", kX
                STicks  strcatk STicks, STk
            endif
            if kX2 <= 180 + kTapeLen then
                STk2 sprintfk "M%.1f 32 v3 ", kX2
                STicks2 strcatk STicks2, STk2
            endif
            kI += 1
        enduntil
        STickPath  sprintfk {{<path d="%s" fill="none" stroke="#a5d9de" stroke-opacity="0.85" stroke-width="5"/>}}, STicks
        STickPath2 sprintfk {{<path d="%s" fill="none" stroke="#a5d9de" stroke-opacity="0.85" stroke-width="5"/>}}, STicks2
        SReelL sprintfk SReelFmt, 180, kDeg
        SReelR sprintfk SReelFmt, 180 + 150 * kF, kDeg
        SBack  sprintfk SBackFmt, 180, 150 * kF, 180, 150 * kF
        SBody  strcpyk SBack
        SBody strcatk SBody, STickPath
        SBody strcatk SBody, STickPath2
        SBody strcatk SBody, SReelL
        SBody strcatk SBody, SReelR
        if abs(kAng) > 1 then
            kRad = kAng * 0.0174533
            kLg  = (abs(kAng) > 180) ? 1 : 0
            kSw  = (kAng > 0) ? 1 : 0
            SCol strcpyk "#e0a040"
            if kAng < 0 then
                SCol strcpyk "#50a0ff"
            endif
            kCx = 180
            while kCx <= 180 + 150 * kF + 0.5 do
                SArc sprintfk {{<path d="M%.1f 38 A32 32 0 %d %d %.2f %.2f" fill="none" stroke="%s" stroke-width="3" stroke-linecap="round"/>}}, kCx, kLg, kSw, kCx + 32 * sin(kRad), 70 - 32 * cos(kRad), SCol
                SBody strcatk SBody, SArc
                kCx += 150 * kF
            od
        endif
        SFrame sprintfk {{<g transform="scale(%.5f %.5f) translate(-139 -29)">%s</g>}}, kS, kS, SBody
        cabbageSet kTrig, SChan, "svgElement", SFrame
    endif
endop


; makeup: the analog character of ONE channel (Warm calls it for L and R).
;   kDrive saturation, kScale head bump follows it, kFc low pass (slow tape loses highs), kHiss noise level,
;   kVinyl 0 = tape hiss / 1 = vinyl noise,
;   kDly   wow & flutter: a short delay (ms) whose time drifts. A moving delay is a moving pitch.
;   kDrop  dropouts: a gain 0..1 that dips now and then. The noise is not dipped, it belongs to the tape.
opcode makeup, a, akkkkkkk
    aIn, kDrive, kScale, kFc, kHiss, kVinyl, kDly, kDrop xin
    aDl   interp kDly
    aDel  vdelay3 aIn, aDl, 10

    kG    = 0.2 + kDrive * 5
    kBias = 0.12 * kDrive

    ; saturation: divide by the small-signal slope, so quiet signals pass at unity gain
    kSlope = kG * (1 - tanh(kBias) * tanh(kBias))
    aSat  = (tanh(aDel * kG + kBias) - tanh(kBias)) / kSlope
    aSat  dcblock2 aSat

    ; loudness match: drive changes the tone, not the level
    kRmsIn  rms aDel
    kRmsSat rms aSat
    kComp   = (kRmsIn > 0.0001 && kRmsSat > 0.0001) ? kRmsIn / kRmsSat : 1
    kComp   port limit(kComp, 0.25, 8), 0.1, 1
    aSat    = aSat * kComp

    kBump limit 70 * kScale, 20, 1500
    aBump pareq aSat, kBump, 1.35, 0.8, 0
    aDrp  interp kDrop
    aBump = aBump * aDrp
    ; default tape noise
    aN    pinker
    aN    buthp aN, 400
    aNd   = aN * kHiss
    ; vinyl noise: small crackle (many), big pops (few), surface hiss, rumble. More makeup = more of everything.
    aDust1 dust2 1, 2 + kHiss * 600
    aPop1  butbp aDust1 * 6, 2500, 3500
    aDust2 dust2 1, 0.3 + kHiss * 40
    aPop2  butlp aDust2 * 6, 900
    aSurf  rand 1
    aSurf  butbp aSurf, 6000, 5000
    aRum   pinker
    aRum   butlp aRum, 80
    aNv    = (aPop1 * 3 + aPop2 * 2.5 + aSurf * 0.5 + aRum * 6) * kHiss/2
    kVn    port kVinyl, 0.05                          ; no click when N is switched
    aNs    = aNd * (1 - kVn) + aNv * kVn
    aOut  butlp aBump + aNs, kFc
    xout  aOut
endop


; Warm: the analog character of the machine, stereo. ONE amount drives everything: the makeup knob (0..2, 0 = bypass).
; The advanced popup only re-weights the parts: sat (drive), tone (darkness), drift (wow + flutter), drop (dropouts),
; hiss (noise). 1 = default balance, 0 = that part off.
;   kSpd : tape speed (slower = more saturation, darker, more hiss). 1 where there is no tape.
; Used by Play (the tape) and, when the tape is not the input, by Freeze (frozen sound) and Loop (looped sound).
; The 3rd output is 1 while a dropout is happening (the red LED).
opcode Warm, aak, aak
    aInL, aInR, kSpd xin
    kMakeUp cabbageGetValue "makeup"
    kVinyl  cabbageGetValue "noisev"
    kLFOmod cabbageGetValue "lfomod"
    kWSat   cabbageGetValue "wsat"
    kWTone  cabbageGetValue "wtone"
    kWDrift cabbageGetValue "wdrift"
    kWDrop  cabbageGetValue "wdrop"
    kWHiss  cabbageGetValue "whiss"

    kSlow    = 1 / (1 + abs(kSpd))                    ; 1 = stopped ... small = fast tape
    kDriveMx = kMakeUp * 2 * kSlow * kWSat            ; slower = more saturation, makeup = amount
    kSpdDr   scale kSlow * kMakeUp, 2, 0.5            ; LFO rate, also reversed (slow = faster)
        if     kLFOmod == 1 then ;none lfo
        kL = 1
        elseif kLFOmod == 2 then ;sine
        kL lfo 1, kSpdDr, 0
        elseif kLFOmod == 3 then ;square
        kL lfo 1, kSpdDr, 2
        elseif kLFOmod == 4 then ;rnd-sine
        kL randi 1, kSpdDr, 1
        elseif kLFOmod == 5 then ;rnd-step
        kL randh 1, kSpdDr, 1
        elseif kLFOmod == 6 then ;jsp-line
        kL jspline 1, kSpdDr*0.9, kSpdDr*1.1
        elseif kLFOmod == 7 then ;jsp-step
        kRateRnd randomh kSpdDr*0.8, kSpdDr*1.2, kSpdDr
        kL randh 1, kRateRnd, 1
        endif
    ; LFO is -1..1, make it 0..1 so the drive never goes negative, 1 = full drive (mod off = full drive)
    kDrive = kDriveMx * ((kLFOmod == 1) ? 1 : (0.5 + 0.5 * limit(kL, -1, 1)))
    kFilt scale kWTone, 1, 0
    kFilt = (tanh(kFilt) / tanh(2))*kMakeUp
    ;kFilt = limit(kFilt * kWTone, 0, 1.4)
    kScale limit abs(kSpd) * kMakeUp, 0.05, 8
    kBase = 24000 * pow(2, -kFilt * 3.5)
    kFc    limit kBase * abs(kSpd), 200, 0.45 * sr
    kHiss = tanh(abs(kSpd) / 200 * (kMakeUp ^ 0.5)) + tanh(kMakeUp / 50)
    kHiss = tanh(kHiss) * 1.25 * kWHiss

    ; wow (slow, ~0.4-1 Hz) and flutter (fast, ~5-11 Hz): the same drift on L and R, like one transport.
    ; Delay swing 1.2 ms of wow = about 6 cent at makeup 1.
    kA     = sqrt(kMakeUp * 0.5)                      ; 0..1 : how much, makeup 2 = 1
    kWow   jspline 1, 0.4, 1.1
    kFlt   jspline 1, 5, 11
    kDly   = limit(2 + kWDrift * kA * (1.2 * kWow + 0.025 * kFlt), 0.5, 9)

    ; dropouts: now and then the level dips (a quarter to two thirds of it) and comes back in 40-240 ms.
    ; Rate: about one every 3 s at makeup 1.
    kDropLvl init 1
    kDropInc init 0
    kRnd     random 0, 1
    if kRnd < kWDrop * kMakeUp * 0.35 * ksmps / sr then
        kDropLvl = 0.2 + 0.5 * random:k(0, 1)
        kDropInc = (1 - kDropLvl) / (0.04 + 0.2 * random:k(0, 1))
    endif
    kDropLvl = min(1, kDropLvl + kDropInc * ksmps / sr)
    kDropG   port kDropLvl, 0.004

    aMkL makeup aInL, kDrive, kScale, kFc, kHiss, kVinyl, kDly, kDropG
    aMkR makeup aInR, kDrive, kScale, kFc, kHiss, kVinyl, kDly, kDropG

    ; makeup = 0 is a true bypass
    kOnT = (kMakeUp > 0.001) ? 1 : 0
    kOn  port kOnT, 0.05
    aOutL = aInL + (aMkL - aInL) * kOn
    aOutR = aInR + (aMkR - aInR) * kOn
    kLed = (kDropLvl < 0.85) ? 1 : 0
    xout aOutL, aOutR, kLed
endop


; spectral freeze (from freeze.csd). The FFT size is read from kFFTSize, never below index 1 (128).
; kBlur: the frozen frame is the average of the last kBlur seconds (0.05 = almost a snapshot, 2 = a whole wash).
opcode Freeze, aa, aakkk
    aInL, aInR, kTrig, kFFTSize, kBlur xin
    iFFTsize = 2^(max(i(kFFTSize), 1)+6)
    ioverlap = iFFTsize/4
    iwinsize = iFFTsize
    iwintype = 1
    kfreeza = kTrig
    kfreezf = kTrig
    ;;Left
    f_analL   pvsanal aInL, iFFTsize, ioverlap, iwinsize, iwintype
    f_blurL   pvsblur f_analL, kBlur, 2
    f_freezeL pvsfreeze f_blurL, kfreeza, kfreezf
    aFL       pvsynth f_freezeL
    ;;Right
    f_analR   pvsanal aInR, iFFTsize, ioverlap, iwinsize, iwintype
    f_blurR   pvsblur f_analR, kBlur, 2
    f_freezeR pvsfreeze f_blurR, kfreeza, kfreezf
    aFR       pvsynth f_freezeR
    xout aFL, aFR
endop


; show or hide one widget when kTrig = 1
opcode setVis, 0, kSk
    kTrig, SChan, kVis xin
    cabbageSet kTrig, SChan, "visible", kVis
endop

; scope value text: "T 0.70", "F +100 c", "amp 0.80" ... SPre = name, kOn = 0 -> "T -"
opcode VzTxt, S, kkkS
    kKind, kV, kOn, SPre xin
    if kOn == 0 then
        SOut sprintfk "%s  -", SPre
    elseif kKind == 1 then
        SOut sprintfk "%s %+d c", SPre, int(kV)
    else
        SOut sprintfk "%s %.2f", SPre, kV
    endif
    xout SOut
endop

; tab LED: kOn = 1 -> the square is lit (its start button is on). kTab = 1 -> this tab is open (white label).
opcode TabLed, 0, kkSS
    kOn, kTab, SLed, STxt xin
    kPrevOn  init -1
    kPrevTab init -1
    if kOn != kPrevOn then
        cabbageSet 1, SLed, "visible", kOn
    endif
    if kTab != kPrevTab then
        if kTab == 1 then
            cabbageSet 1, STxt, "fontColour(240, 240, 240, 255)"
        else
            cabbageSet 1, STxt, "fontColour(90, 92, 100, 255)"
        endif
    endif
    kPrevOn  = kOn
    kPrevTab = kTab
endop


; the source. It runs first in every control cycle. For a live input use:  gaSrcL inch 1  and  gaSrcR inch 2
instr source
    gaSrcL, gaSrcR diskin2 "../test.wav", 1, 0, 1
    ;gaSrcL inch 1
    ;gaSrcR inch 2
endin


instr RecordMachine
  if metro(1/giSecs) == 1 then
  schedulek "Record", 0, giSecs
  endif
endin

instr Record
aInL = gaSrcL
aInR = gaSrcR
aAtt transeg  0, 0.005, 6, 1
aRel transegr 1, 0.005, -6, 0
    aPtr linseg 0, giSecs, giSecs * sr
    kPtr linseg 0, giSecs, giSecs * sr
    kLine linseg 0, giSecs, 1
    gkWrPos = aPtr / sr  
    tablew aInL*aAtt*aRel, aPtr, giTapeL
    tablew aInR*aAtt*aRel, aPtr, giTapeR
    
SrecLine sprintfk "bounds(150, 100, %f, 10)" ,kLine*118
cabbageSet 1, "timeliner", SrecLine
if release() == 1 then
SrecLineOff sprintfk "bounds(150, 100, %f, 10)" ,k(0)
cabbageSet 1, "timeliner", SrecLineOff
endif

;schedule "Record", giSecs, giSecs
endin

instr Play
    kTapeF  cabbageGetValue "startf"
    kTapeL  cabbageGetValue "startl"
    kMix cabbageGetValue "mix"
    kMixP port kMix, 0.02
    kSpd = (gkSpd == 0) ? 0.005 : gkSpd
    kPch = (gkPch == 0) ? 0.005 : gkPch
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
;    kRecLine linseg 0, giSecs, 118
;    kLine = (kRecLine*kSpd) % kRecLine

  kX = limit(kPos / giSecs, 0, 1)*118
      SrecLine sprintfk "bounds(%f, 98, 3, 14)" ,kX+150
    cabbageSet 1, "timelinep", SrecLine
      
    aTapePos interp kPos
    aTapeL mincer aTapePos, 1, cent(kPch), giTapeL, 1
    aTapeR mincer aTapePos, 1, cent(kPch), giTapeR, 1
    ; makeup: the analog character (see Warm). makeup = 0 is a bypass, it can be raised any time.
    aMkL, aMkR, kDropLed Warm aTapeL, aTapeR, kSpd
    gkLedW = kDropLed
    gkPlayOn = 1
    gaTapeL = aMkL
    gaTapeR = aMkR
    aOutL = aMkL * kMixP                            ; wet only, the dry part comes from speaker
    aOutR = aMkR * kMixP
 ; no release tail: when the tape stops the sound stops (a 10 ms fade only, so it does not click)
 kTapeFa = (kTapeF == 1) ? 0 : 1
 kTapeLa = (kTapeL == 1) ? 0 : 1
 kTapeFa port kTapeFa, 0.05
 kTapeLa port kTapeLa, 0.05
 iRel = max(p4, 0.005)
 aRel transegr 1, iRel, 6, 0
 out aOutL*aRel*kTapeFa*kTapeLa, aOutR*aRel*kTapeFa*kTapeLa
 ;chnmix aOutL*aRel,"snd1"
 ;chnmix aOutR*aRel,"snd2"
 ;chnclear "mic1", "mic2"
    if release() == 1 then
        gkLedW = 0
    cabbageSet 1, "timelinep", "bounds(0, 98, 0, 14)"
    endif
endin

; Freeze mode: only alive while tapemod = Freeze. It reads its own copy of the source (aDryL, aDryR),
; freezes either the source (T off) or the tape output (T on), and mixes frozen against the dry source.
; Must stay between Play and speaker, so it runs after Play and before speaker.


instr FreezeFx

 aDryL = gaSrcL                                  ; the source, always the dry side of the mix
 aDryR = gaSrcR
 kTapF cabbageGetValue "tapf"
 kWarmOnOff cabbageGetValue "mwarmf"
 
    ; (T does not touch P / R here any more: "widgets" runs the tape transport, see "tape transport" there)
 
    if kTapF == 0 then
    aInL = aDryL                                   ; freeze the source directly
    aInR = aDryR
    kSpdOut = 1
    elseif kTapF == 1 then
    aInL = gaTapeL 
    aInR = gaTapeR 
    kSpdOut = gkSpd
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
 kBlur     cabbageGetValue "fblur"
 kFFade    cabbageGetValue "ffade"
 kFSlew    cabbageGetValue "fslew"
 kLoopRun  cabbageGetValue "startl"
if changed(kLFOmodF) == 1 then
    kDurVis = kLFOmodF == 1 ? 0 : 1
    setVis 1, "ratef",  kLFOmodF 
    setVis 1, "frzmss",  kDurVis
endif
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
gkWheelF = kfrznow == 1 ? 0 : kSpdOut
gkRunF   = 1
if release() == 1 then
gkWheelF = 0
gkRunF   = 0
    setVis 1, "ratef",  0 
    setVis 1, "frzmss",  1
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
    ; LED: lit while the amp gate is open (only when the amp effect is working)
    gkLedA = (kAmpRnd == 1 && kFrzM == 1 && kAmp > 0.5) ? 1 : 0
    if release() == 1 then
        gkLedA = 0
        ;cabbageSetValue "tapf", k(0)
    endif
    kAmp portk kAmp, kFSlew                            ; slew: 3 ms = hard gate, longer = swells
    ; scope (Freeze): speed = its reel, pitch = the tape's if the tape is the input, LFO amp (A) and LFO frz (the F gate)
    gkVz[3]  = kAmp * 2 - 1
    gkVz[4]  = limit(kfrznow, 0, 1) * 2 - 1
    aAmp interp kAmp

    kFFTSize init 4
    kFFTSize cabbageGetValue "FFTSize"
    if changed(kFFTSize) == 1 then
        reinit UPDATE
    endif
    UPDATE:
    aFrzL, aFrzR Freeze aInL, aInR, kfrznow, kFFTSize, kBlur
    rireturn

    ; tape to frozen crossfade, then the amplitude effect
    ; the frozen sound goes through the analog character, unless the tape (which has it) is the input.
    ; Only the frozen part is coloured: the unfrozen sound stays as clean as the source.
    
    if kWarmOnOff == 1 then
    aWmL, aWmR, kDum Warm aFrzL, aFrzR, 1
    kWarmT = 1 - kTapF
    kWarm  port kWarmT, 0.05
    aFrzL  = aFrzL + (aWmL - aFrzL) * kWarm
    aFrzR  = aFrzR + (aWmR - aFrzR) * kWarm
    endif
    kFade portk kfrznow, kFFade                        ; fade: how slowly the freeze blooms
    aWetL = (aInL + (aFrzL - aInL) * kFade) * aAmp
    aWetR = (aInR + (aFrzR - aInR) * kFade) * aAmp
    aEnv linsegr 0, 0.01, 1, 0.01, 0
    ; chain: LoopFx listens to this
    gaFrzL = aWetL * aEnv
    gaFrzR = aWetR * aEnv
    aOutL = aWetL * aEnv
    aOutR = aWetR * aEnv
    chnmix aOutL, "snd1"
    chnmix aOutR, "snd2"

    ; while LoopFx runs it listens to gaFrz and makes the sound, so Freeze goes silent (no doubling)
    kPassT = 1 - kLoopRun
    kPass  port kPassT, 0.03
    kMixP port kMix, 0.02
    out aOutL * kMixP * kPass, aOutR * kMixP * kPass     ; wet only, the dry part comes from speaker
endin



instr LoopFx
    aDryL = gaSrcL
    aDryR = gaSrcR

    kLoopW   cabbageGetValue "loop"
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
    kEnvMod  cabbageGetValue "rshape"
    kTapL    cabbageGetValue "tapl"
    kMix     cabbageGetValue "mix"
    kRvL     cabbageGetValue "rvsl"
    kFrzRun  cabbageGetValue "startf"
    kTapF    cabbageGetValue "tapf"
    kDecay   cabbageGetValue "ldecay"
    kSeam    cabbageGetValue "lseam"
    kWarmOnOff    cabbageGetValue "mwarml"
    if changed(kMetro) == 1 then
    kDurVis = kMetro == 1 ? 0 : 1
    setVis 1, "loopdur",  kDurVis
    setVis 1, "metrotime",  kMetro
    endif
    
    kMixP    port kMix, 0.02

    ; ---- input: Freeze (while it runs), else the original (T off) or the tape machine output (T on).
    ; kTapIn says if the tape is in the chain. Loop's own T only drives the tape when Freeze is not running.
    ; (T does not touch P / R here any more: "widgets" runs the tape transport)
    if kFrzRun == 1 then
        aInL = gaFrzL
        aInR = gaFrzR
        kTapIn  = kTapF
        kSpdOut = (kTapF == 1) ? gkSpd : 1
    elseif kTapL == 0 then
        aInL = aDryL
        aInR = aDryR
        kTapIn  = 0
        kSpdOut = 1
    else
        aInL = gaTapeL
        aInR = gaTapeR
        kTapIn  = 1
        kSpdOut = gkSpd
    endif

    ; ---- step clock (M): every "time" seconds kTick = 1 for one control cycle
    kTick   = 0
    kMClock init 0
    kTime   init 2
    if kMetro == 1 then
        kMClock = kMClock - ksmps / sr
        if kMClock <= 0 then
            kTime   = kTimeIn
            kMClock = kMClock + kTime
            kTick   = 1
        endif
    else
        kMClock = 0
    endif

    ; ---- M: which steps are bursts. An accumulator spreads them evenly: "M %" is added every step and a burst
    ; happens each time it reaches 100 (100 = all, 50 = every second, 0 = none). The first step is a burst.
    kAcc    init 0
    kStepOn init 0
    if changed(kMetro) == 1 then
        kAcc    = (kMetro == 1) ? 100 - kMPct : 0
        kStepOn = 0
    endif
    if kMetro == 1 && kTick == 1 then
        kAcc = kAcc + kMPct
        if kAcc >= 100 && kMPct > 0 then
            kStepOn = 1
            kAcc    = kAcc - 100
        else
            kStepOn = 0
        endif
        kAcc = limit(kAcc, 0, 99.999)
    endif

    ; ---- L button: while M is on it only shows the M step (1 = burst running), it does not start a loop itself.
    ; After M is switched off the button is ignored for 0.1 s, until the 0 we sent has arrived.
    cabbageSetValue "loop", kStepOn, changed(kStepOn, kMetro)
    kIgn    init 0
    kIgn    = (changed(kMetro) == 1) ? 0.1 : max(kIgn - ksmps / sr, 0)
    kLoopMan = (kMetro == 0 && kIgn <= 0) ? kLoopW : 0

    ; ---- state: 0 original sound, 1 loop (L button, M off), 2 burst (M step)
    ; kSteps = 1 when the repeats come from rep- / rep+
    kState  = (kLoopMan == 1) ? 1 : ((kMetro == 1 && kStepOn == 1) ? 2 : 0)
    kSteps  = (kState == 2) ? 1 : 0

    ; ---- a new grab is requested: state changed, or the next step of M. From silence, and from one burst to the next
    ; (the burst level is 0 there anyway), it starts at once. Otherwise the level goes down in 5 ms first, so the cut does not click.
    kPrevS  init 0
    kReq    = (kState != 0 && (kState != kPrevS || (kTick == 1 && kSteps == 1))) ? 1 : 0
    kFrom   = kPrevS
    kPrevS  = kState
    kPend   init 0
    kXf     init 1
    kHand   init 0
    kGo     = 0
    if kReq == 1 then
        kHand = (kTick == 0) ? 1 : 0
        if kFrom == 0 || (kFrom == 2 && kState == 2) then
            kGo   = 1
        else
            kPend = 1
        endif
    endif
    if kState == 0 then
        kPend = 0
    endif
    if kPend == 1 then
        kXf = max(kXf - ksmps / (sr * 0.005), 0)
        if kXf <= 0 then
            kPend = 0
            kGo   = 1
        endif
    else
        kXf = min(kXf + ksmps / (sr * 0.005), 1)
    endif

    ; ---- ring buffer: records all the time. Only a very long steady loop stops it (it would be overwritten).
    kHoldT init 0
    kHoldT = (kState == 1 && kGo == 0) ? kHoldT + ksmps / sr : 0
    kHold  = (kHoldT > giLoopLen - 12) ? 1 : 0
    aWr    phasor (1 - kHold) / giLoopLen
    if kHold == 0 then
        tablew aInL, aWr, giLoopL, 1
        tablew aInR, aWr, giLoopR, 1
    endif
    kWr    downsamp aWr                               ; where the ring is written now, 0..1

    ; ---- what a new grab draws: the end of the slice, and for Q / M the number of repeats (rep- .. rep+)
    kEndBase   init 0
    kSliceBase init 0.5                               ; length of one repeat when the repeats come from rep- / rep+
    kBurstT    init 0
    kBurstDur  init 1
    kBurstType init 1
    kBurstT    = kBurstT + ksmps / sr
    if kGo == 1 then
        kEndBase = kWr
        if kSteps == 1 then
            if kState == 2 && kHand == 1 then         ; burst started by hand (L released): the step clock restarts with it
                kTime   = kTimeIn
                kMClock = kTime
            endif
            kN         = limit(int(random:k(min(kStepMin, kStepMax), max(kStepMin, kStepMax) + 1)), 1, 100)
            kSliceBase = limit(kTime / kN, 0.005, 6)
        endif
        if kState == 2 then
            kBurstT    = 0
            kBurstDur  = kTime
            kBurstType = (kEnvMod == 3) ? int(random:k(1, 3)) : kEnvMod
        endif
    endif

    ; ---- burst level (Q only): short attack, short release. line = flat, adsr = small dip after the attack
    kA    = min(0.01, kBurstDur * 0.1)
    kD    = min(0.08, kBurstDur * 0.2)
    kR    = min(0.02, kBurstDur * 0.1)
    kRel  = limit((kBurstDur - kBurstT) / kR, 0, 1)
    kE1   = limit(kBurstT / kA, 0, 1) * kRel
    kE2   = ((kBurstT < kA) ? kBurstT / kA : 1 - 0.15 * limit((kBurstT - kA) / kD, 0, 1)) * kRel
    ; the shape (envmod) is now applied to every repeat, see "repeat shape" below. Here only the crossfade gain.
    kGain = kXf
    aG    interp kGain

    ; ---- the reader: one phasor, once per repeat. A new grab restarts it (reinit).
    kLenRep init 0.5                                  ; length of the playing repeat (seconds of the ring)
    kEndRep init 0                                    ; ring position where the playing repeat ends
    kCur    init 0                                    ; random pitch (cent) of the playing repeat
    kPhPrev init 1
    kRepN   init 0                                    ; repeats since the grab
    kDecG   init 1                                    ; gain of the playing repeat (decay)
    kShp    init 1                                    ; shape of the playing repeat (envmod)
    kEA     init 0.1                                  ; ADSR attack (part of the repeat)
    kED     init 0.1                                  ; ADSR decay
    kES     init 0.7                                  ; ADSR sustain level
    kER     init 0.1                                  ; ADSR release
    kPulse  init 0                                    ; blue LED timer
    kBase   = (kSteps == 1) ? kSliceBase : kLoopDur   ; same S / R rule for L, Q and M
    if kMachRnd == 0 then
        kLenRep = limit(kBase, 0.005, 6)              ; S: every repeat has the base length
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
        kPhPrev = 1                                   ; a new grab is a new repeat
    endif
    if kPh < kPhPrev then                             ; a new repeat starts, draw its own values
        kRepN   = (kGo == 1) ? 0 : min(kRepN + 1, 400)
        kDecG   = pow(kDecay, kRepN)
        kPulse  = 0.06
        if kMachRnd == 1 then                         ; R: its own length, half to double
            kLenRep = limit(kBase * pow(2, random:k(-1, 1)), 0.005, 6)
        endif
        kCur    = (kRndPch == 1) ? random:k(-abs(kLpch), abs(kLpch)) : 0
        kShp    = (kEnvMod == 6) ? int(random:k(1, 5.999)) : kEnvMod   ; repeat shape: 1 line, 2 adsr, 3 ramp up, 4 ramp down, 5 sine, 6 Rnd (picked per repeat)
        kEndRep = kEndBase - random:k(0, kSwift) / giLoopLen
        ; ADSR: random a, d, s, r. machrnd S = once per cycle (a new grab), R = every repeat (like rep- / rep+)
        if kGo == 1 || kMachRnd == 1 then
            kEA = random:k(0.02, 0.3)
            kED = random:k(0.05, 0.3)
            kES = random:k(0.3, 1)
            kER = random:k(0.05, 0.4)
        endif
    endif
    kPhPrev = kPh
    kPulse  = max(kPulse - ksmps / sr, 0)
    gkLedL  = (kPulse > 0 && kState != 0) ? 1 : 0

    kRvL2   = (kRvL == 0) ? 1 : -1
    kRv     = (kRvL == 0) ? 0 : 1
    kLenN   = kLenRep / giLoopLen                     ; slice length as a part of the ring
    aRd     = (1 - kRv) * (1 - aPh) + kRv * aPh       ; forward or backward through the slice
    aPos    = (kEndRep + 1) - aRd * kLenN             ; the +1 keeps it positive, the table wraps it
    aLoopL  table3 aPos, giLoopL, 1, 0, 1
    aLoopR  table3 aPos, giLoopR, 1, 0, 1
    kFd     = max(limit(kLenRep * 0.25, 0.001, 0.006), kSeam * kLenRep * 0.5)   ; fade at the repeat seam: short = no click, seam = soft edges
    aFd1    limit aPh * kLenRep / kFd, 0, 1
    aFd2    limit (1 - aPh) * kLenRep / kFd, 0, 1
    ; repeat shape (envmod): the level inside every repeat. aPh runs 0..1 over the repeat.
    aAdsr   = limit(aPh / kEA, 0, 1) * (1 - (1 - kES) * limit((aPh - kEA) / kED, 0, 1)) * limit((1 - aPh) / kER, 0, 1)
    aSin    = 0.5 - 0.5 * cos(6.2831853 * aPh)
    kW1     = (kShp == 1) ? 1 : 0
    kW2     = (kShp == 2) ? 1 : 0
    kW3     = (kShp == 3) ? 1 : 0
    kW4     = (kShp == 4) ? 1 : 0
    kW5     = (kShp == 5) ? 1 : 0
    aSh     = kW1 + kW2 * aAdsr + kW3 * aPh + kW4 * (1 - aPh) + kW5 * aSin
    ; scope "rep": the same shape, drawn over the repeat (control rate, from the repeat position kPh)
    kAdsrV  = limit(kPh / kEA, 0, 1) * (1 - (1 - kES) * limit((kPh - kEA) / kED, 0, 1)) * limit((1 - kPh) / kER, 0, 1)
    kSinV   = 0.5 - 0.5 * cos(6.2831853 * kPh)
    kShV    = kW1 + kW2 * kAdsrV + kW3 * kPh + kW4 * (1 - kPh) + kW5 * kSinV
    gkVz[6] = (kState != 0) ? kShV * 2 - 1 : 0
    aLpL    = aLoopL * aFd1 * aFd2 * aG * kDecG * aSh
    aLpR    = aLoopR * aFd1 * aFd2 * aG * kDecG * aSh
    ; the loop is a tape loop: it gets the analog character unless the tape (which has it) is in the chain.
    ; Only the loop is coloured, the passing source stays clean.
    
    if kWarmOnOff == 1 then
    aWmL, aWmR, kDum Warm aLpL, aLpR, 1
    kWarmT  = 1 - kTapIn
    kWarm   port kWarmT, 0.05
    aLpL    = aLpL + (aWmL - aLpL) * kWarm
    aLpR    = aLpR + (aWmR - aLpR) * kWarm
    endif
    ; ---- input to loop crossfade
    kActive = (kState != 0) ? 1 : 0
    kFade   port kActive, 0.02, 0
    aWetL   = aInL + (aLpL - aInL) * kFade
    ; scope (Loop): pitch = the repeat's random pitch (+ the tape's when the tape is in the chain),
    ; repeat = where the reader is in the repeat (a saw, one per repeat)
    gkVz[5]  = (kState != 0) ? kCur : 0
    aWetR   = aInR + (aLpR - aInR) * kFade

    ; ---- wheel (TapeGUI): the input's speed while it passes through, the reader's speed while a loop plays.
    ; Every repeat the reel turns at the playback speed and winds back at its end (giWheelBack = 1).
    kT      = kLenRep / kRatio                        ; seconds per repeat
    kRewT   = limit(0.3 * kT, 0.002, 0.25)
    kFr     = limit(kRewT / kT, 0.01, 0.5)
    kWSpd   = (kTapIn == 1) ? kSpdOut : kRatio        ; tape in the chain: speed widget, else reader ratio
    kWheel  = (giWheelBack == 1 && kPh >= 1 - kFr) ? -kWSpd * (1 - kFr) / kFr : kWSpd
    if kState != 0 then
        gkWheelL = kWheel * kRvL2
    elseif gkRunF == 1 then
        gkWheelL = gkWheelF                           ; Freeze is the input: show Freeze's reel
    else
        gkWheelL = kSpdOut
    endif
    gkRunL = 1

    ; ---- wet * mix, with a very short fade in and out. The dry part comes from "speaker".
    aEnv    linsegr 0, 0.01, 1, 0.01, 0
    out     aWetL * kMixP * aEnv, aWetR * kMixP * aEnv

    if release() == 1 then
        gkWheelL = 0
        gkRunL   = 0
        gkLedL = 0
        ;cabbageSetValue "tapl", k(0)
        setVis 1, "loopdur",  0
        setVis 1, "metrotime",  1
    endif
endin


; speaker: the dry source, always at (1 - mix). Play, FreezeFx and LoopFx only output their wet path times mix,
; so the mix slider works the same in Tape, Freeze and Loop, and the dry sound never doubles or drops out
; when an effect starts or stops. (mix = 1 and nothing running = silence, as before.)
instr speaker
    aInL = gaSrcL
    aInR = gaSrcR
    kMix  cabbageGetValue "mix"
    kPortTime linseg 0,0.001, 0.02
    kMix  portk kMix, kPortTime
    out aInL * (1 - kMix), aInR * (1 - kMix)
endin


instr widgets
 kTapeRun init 0                ; the tape really runs (set in "tape transport", used by the TAPE LED above it)
 kStartT cabbageGet "startt"
 kStartF cabbageGet "startf"
 kStartL cabbageGet "startl"
    kSpdIn cabbageGetValue "speed"
    kRec   cabbageGetValue "record"
    kPlay  cabbageGetValue "play"
    kPchIn cabbageGetValue "pitch"
    kLFOmod cabbageGetValue "lfomod"
    kDep    cabbageGetValue "depth"
    kRate    cabbageGetValue "rate"
    kPort cabbageGetValue "port"
    kTapeMod cabbageGetValue "tapemod"
    kAdv     cabbageGetValue "adv"
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
    kPrevAdv  init -1
    kVisChg   = (kTapeMod != kPrevMode || kAdv != kPrevAdv) ? 1 : 0
    kPrevMode = kTapeMod
    kPrevAdv  = kAdv
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
    setVis kVisChg, "noisev",  kTapeVis
    setVis kVisChg, "tapmet",  kTapeVis
    ;
    ;
    ; freeze widgets
    ;
    setVis kVisChg, "mwarmf",  kFrzMode
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
    ;setVis kVisChg, "ratef",   kFrzMode
    setVis kVisChg, "frzmd",   kFrzMode
    setVis kVisChg, "tapf",   kFrzMode
    ; loop widgets
    setVis kVisChg, "mwarml",  kLoopMode
    setVis kVisChg, "startl",  kLoopMode
    setVis kVisChg, "loop",      kLoopMode
    setVis kVisChg, "machrnd",   kLoopMode
    setVis kVisChg, "rndptch",   kLoopMode
    setVis kVisChg, "rshape",    kLoopMode
    ;setVis kVisChg, "loopdur",   kLoopMode
    setVis kVisChg, "metrotime", kLoopMode
    setVis kVisChg, "stepsmin",  kLoopMode
    setVis kVisChg, "stepsmax",  kLoopMode
    setVis kVisChg, "lpch",  kLoopMode
    setVis kVisChg, "swft",      kLoopMode
    setVis kVisChg, "tapl",      kLoopMode
    setVis kVisChg, "lpmetro",   kLoopMode
    setVis kVisChg, "lpmss",     kLoopMode
    setVis kVisChg, "rvsl",     kLoopMode
    ; advanced popup: the "+" button is shared, what it shows depends on the mode
    setVis kVisChg, "advbg",   kAdv
    setVis kVisChg, "noisev",  kAdv * kTapeVis
    setVis kVisChg, "wsat",    kAdv * kTapeVis
    setVis kVisChg, "wtone",   kAdv * kTapeVis
    setVis kVisChg, "wdrift",  kAdv * kTapeVis
    setVis kVisChg, "wdrop",   kAdv * kTapeVis
    setVis kVisChg, "whiss",   kAdv * kTapeVis
    setVis kVisChg, "fblur",   kAdv * kFrzMode
    setVis kVisChg, "ffade",   kAdv * kFrzMode
    setVis kVisChg, "fslew",   kAdv * kFrzMode
    setVis kVisChg, "ldecay",  kAdv * kLoopMode
    setVis kVisChg, "lseam",   kAdv * kLoopMode
    ; LEDs: the coloured square is shown while its mode is on screen and its instrument says lit
    kLedW = (kTapeVis == 1) ? gkLedW : 0
    kLedA = (kFrzMode == 1) ? gkLedA : 0
    kLedL = (kLoopMode == 1) ? gkLedL : 0
    setVis changed(kLedW), "ledw", kLedW
    setVis changed(kLedA), "leda", kLedA
    setVis changed(kLedL), "ledl", kLedL
    ; tab LEDs: lit by the start buttons, whatever tab is open. TAPE = the tape really runs (start tape, or the T of a
    ; running Freeze / Loop), see "tape transport" below
    kTapeOn = (kPlay == 1 || kRec == 1) ? 1 : 0
    kTabT = (kTapeMod == 1) ? 1 : 0
    kTabF = (kTapeMod == 2) ? 1 : 0
    kTabL = (kTapeMod == 3) ? 1 : 0
    TabLed kTapeRun, kTabT, "tabledt", "tabtxtt"
    TabLed kStartF, kTabF, "tabledf", "tabtxtf"
    TabLed kStartL, kTabL, "tabledl", "tabtxtl"
    kMetroTape cabbageGetValue "tapmet"
    
    
    if kMetroTape == 1 then
    kRate = kRate/10
    endif
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
    
    ; ---- tape transport: the GUI follows what the audio really does.
    ; No Freeze / Loop running: start tape runs the tape (P + R), as before.
    ; Freeze or Loop running: the tape only runs if it is in their chain, that is their T
    ; (Freeze's T while Freeze runs, because Loop then listens to Freeze, else Loop's T).
    ;   T on  -> tape runs: P, R, timeline, start tape button and TAPE LED are on.
    ;   T off -> tape cannot start: start tape jumps back off, P / R stay off, no timeline, the reel is not touched.
    kTapFt cabbageGetValue "tapf"
    kTapLt cabbageGetValue "tapl"
    kFxOn  = (kStartF == 1 || kStartL == 1) ? 1 : 0
    kChainT = (kStartF == 1) ? kTapFt : kTapLt
    ; the start tape button is also set by us while Freeze / Loop runs (synced to the tape). So when they stop, it
    ; must not count as a request: the tape goes off, and the button goes off with it.
    kFxPrev init 0
    kWant  = (kFxOn == 1) ? kChainT : ((kFxPrev == 1) ? 0 : kStartT)
    if kFxPrev == 1 && kFxOn == 0 then
        cabbageSetValue "startt", k(0), k(1)
    endif
    kFxPrev = kFxOn
    if kWant != kTapeRun then
        kTapeRun = kWant
        cabbageSetValue "play",   kTapeRun, k(1)
        cabbageSetValue "record", kTapeRun, k(1)
    endif
    ; start tape button shows the real tape state (a press while it is blocked is undone)
    if changed(kStartT, kTapeRun) == 1 && kStartT != kTapeRun then
        cabbageSetValue "startt", kTapeRun, k(1)
    endif
    ; blocked: P / R cannot be switched on by hand either
    if kFxOn == 1 && kChainT == 0 && (kPlay == 1 || kRec == 1) then
        cabbageSetValue "play",   k(0), changed(kPlay, kRec, kFxOn, kChainT)
        cabbageSetValue "record", k(0), changed(kPlay, kRec, kFxOn, kChainT)
    endif
    ; stop tape by hand (no Freeze / Loop running): every transport and effect button goes off, as before
    if changed(kStartT) == 1 && kStartT == 0 && kFxOn == 0 then
        cabbageSetValue "frznow",   0
        cabbageSetValue "ampnow",   0
        cabbageSetValue "frzmetro", 0
        cabbageSetValue "loop",     0
        cabbageSetValue "lpmetro",  0
    endif
        if kMetroTape == 1 && kTapeRun == 1 then
        kOnOff = int(kLFO+1)
        printk2 kOnOff
        cabbageSetValue "play", kOnOff
        cabbageSetValue "record", kOnOff
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
    ;kLoopOn = (kLoopMode == 1 && kStartL == 1) ? 1 : 0
    if changed(kStartL) == 1 && kStartL == 1 then
    schedulek "LoopFx", 0, 99999
    elseif changed(kStartL) == 1 && kStartL == 0 then
    turnoff2 "LoopFx", 0, 1
    endif
    ;;lfo
   

    if kRec == 1 && changed(kRec) == 1 then
    schedulek "RecordMachine", 0, 99999
    elseif kRec == 0 && changed(kRec) == 1 then
    turnoff2 "RecordMachine", 0, 0
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
; ---- wheel: the open tab wins if it is running, else whatever is running (Loop > Freeze > Tape, same as the
; chain), else the tape (which glides to 0 with port when it stops).
; a running Freeze / Loop whose T is off owns the wheel: the tape (its sound is fine) cannot change the reel then.
kTapFw cabbageGetValue "tapf"
kTapLw cabbageGetValue "tapl"
kTapeLock = ((gkRunF == 1 && kTapFw == 0) || (gkRunL == 1 && gkRunF == 0 && kTapLw == 0)) ? 1 : 0
kPchW  init 0
kPchTp = (gkPlayOn == 1) ? gkPch : 0             ; the tape's pitch, only while it really plays
; is the tape in Freeze's / Loop's input (their T)? Loop listens to Freeze while Freeze runs, so then Freeze's T counts
kTInF  = (gkRunF == 1 && kTapFt == 1) ? 1 : 0
kTChL  = (gkRunF == 1) ? kTapFt : kTapLt
kTInL  = (gkRunL == 1 && kTChL == 1) ? 1 : 0
kPchFz = (kTInF == 1) ? kPchTp : 0                ; Freeze does not change pitch: the tape's, if it is the input
kPchLp = gkVz[5] + ((kTInL == 1) ? kPchTp : 0)    ; Loop: its own random pitch + the tape's, if it is the input
if kTapeMod == 1 && kTapeOn == 1 && kTapeLock == 0 then
    gkSpdTape = kSpdTape
    kPchW     = kPchTp
elseif kTapeMod == 2 && gkRunF == 1 then
    gkSpdTape = gkWheelF
    kPchW     = kPchFz
elseif kTapeMod == 3 && gkRunL == 1 then
    gkSpdTape = gkWheelL
    kPchW     = kPchLp
elseif gkRunL == 1 then
    gkSpdTape = gkWheelL
    kPchW     = kPchLp
elseif gkRunF == 1 then
    gkSpdTape = gkWheelF
    kPchW     = kPchFz
else
    gkSpdTape = kSpdTape
    kPchW     = kPchTp
endif

; ---- scope ("~" popup). Tape values are made here, Freeze / Loop write theirs in their instruments.
gkVz[0] = kSpdTape
gkVz[1] = kPchTp
gkVz[2] = (kLFOmod == 1) ? 0 : kLFO / max(kDep, 0.001)
kTOn    = (gkPlayOn == 1 || kRec == 1) ? 1 : 0

kViz  cabbageGetValue "viz"
kSelT cabbageGetValue "vizselt"                   ; Tape:   1 speed, 2 pitch, 3 LFO
kSelF cabbageGetValue "vizself"                   ; Freeze: 1 speed, 2 pitch, 3 LFO amp, 4 LFO frz
kSelL cabbageGetValue "vizsell"                   ; Loop:   1 speed, 2 pitch, 3 repeat
if changed(kViz) == 1 && kViz == 1 then
    cabbageSetValue "adv", k(0), k(1)              ; "~" and "+" share the place, one closes the other
endif
if changed(kAdv) == 1 && kAdv == 1 then
    cabbageSetValue "viz", k(0), k(1)
endif
kVzVis = changed(kViz, kTapeMod)
setVis kVzVis, "vizbg",   kViz
setVis kVzVis, "vizselt", kViz * kTapeVis
setVis kVzVis, "vizself", kViz * kFrzMode
setVis kVzVis, "vizsell", kViz * kLoopMode
setVis kVzVis, "vizvt",   kViz
setVis kVzVis, "vizvf",   kViz
setVis kVzVis, "vizvl",   kViz

; ---- what the open tab draws. Up to 2 lines: history row, 2 flag rows (both must be 1 at that point), colour.
; flag rows: 0 tape runs, 1 Freeze runs, 2 tape is in Freeze (T), 3 Loop runs, 4 tape is in Loop (T), 5 always 1
; colour: 0 red (tape), 1 green (Freeze), 2 blue (Loop)
;   Tape:   speed / pitch / LFO       -> the tape (red)
;   Freeze: speed / pitch             -> the tape (red), only while T is on. T off = nothing: Freeze has none
;           LFO amp / LFO frz         -> green
;   Loop:   speed                     -> the tape (red), only while T is on
;           pitch                     -> the tape (red, T on) + the loop's own random pitch (blue)
;           repeat                    -> blue
kSel  = (kTapeMod == 1) ? kSelT : ((kTapeMod == 2) ? kSelF : kSelL)
kLR[]  init 2
kLA[]  init 2
kLB[]  init 2
kLC[]  init 2
kLK[]  init 2                                     ; 0 speed, 1 pitch, 2 LFO (for the value text)
SLN1   init ""
SLN2   init ""
kNL    = 1
kLB[0] = 5
kLB[1] = 5
if kTapeMod == 1 then
    kTSel  = limit(kSel - 1, 0, 2)
    kLR[0] = kTSel
    kLA[0] = 0
    kLC[0] = 0
    kLK[0] = kTSel
    SLN1   strcpyk "T"
elseif kTapeMod == 2 then
    if kSel <= 2 then
        kLR[0] = kSel - 1
        kLA[0] = 0
        kLB[0] = 2
        kLC[0] = 0
        kLK[0] = kSel - 1
        SLN1   strcpyk "T"
    else
        kLR[0] = (kSel == 3) ? 3 : 4
        kLA[0] = 1
        kLC[0] = 1
        kLK[0] = 2
        if kSel == 3 then
            SLN1 strcpyk "amp"
        else
            SLN1 strcpyk "frz"
        endif
    endif
else
    if kSel == 1 then
        kLR[0] = 0
        kLA[0] = 0
        kLB[0] = 4
        kLC[0] = 0
        kLK[0] = 0
        SLN1   strcpyk "T"
    elseif kSel == 2 then
        kNL    = 2
        kLR[0] = 1
        kLA[0] = 0
        kLB[0] = 4
        kLC[0] = 0
        kLK[0] = 1
        SLN1   strcpyk "T"
        kLR[1] = 5
        kLA[1] = 3
        kLC[1] = 2
        kLK[1] = 1
        SLN2   strcpyk "L"
    else
        kLR[0] = 6
        kLA[0] = 3
        kLC[0] = 2
        kLK[0] = 2
        SLN1   strcpyk "rep"
    endif
endif

; history: 90 points at 30 Hz = the last 3 seconds, every row always, so a new choice shows at once.
; Stored already scaled to -1..1: speed / 2, pitch / 300 (+-300 cent), LFOs as they are.
kHist[][] init 7, 90
kHOn[][]  init 6, 90
kHd       init 0
kVzT      metro 30
if kVzT == 1 then
    kI = 0
    while kI < 7 do
        kV = gkVz[kI]
        if kI == 0 then
            kY = kV / 2
        elseif kI == 1 || kI == 5 then
            kY = kV / 700                ; scope: pitch -300..+300 cent = full height
        else
            kY = kV
        endif
        kHist[kI][kHd] = limit(kY, -1, 1)
        kI += 1
    od
    kHOn[0][kHd] = kTOn
    kHOn[1][kHd] = gkRunF
    kHOn[2][kHd] = kTInF
    kHOn[3][kHd] = gkRunL
    kHOn[4][kHd] = kTInL
    kHOn[5][kHd] = 1
    kHd = (kHd + 1) % 90
endif

; drawing: only while the popup is open
if kVzT == 1 && kViz == 1 then
    SAll strcpyk {{<path d="M4 50 H271" stroke="#323a4c" stroke-width="1"/>}}
    kLn = 0
    while kLn < kNL do
        kRw = kLR[kLn]
        kFa = kLA[kLn]
        kFb = kLB[kLn]
        SPath strcpyk ""
        kPen = 0
        kJ   = 0
        while kJ < 90 do
            kIx = (kHd + kJ) % 90
            if kHOn[kFa][kIx] == 1 && kHOn[kFb][kIx] == 1 then
                kXp = 4 + kJ * 3
                kYp = 50 - kHist[kRw][kIx] * 24
                if kPen == 0 then
                    SPt sprintfk "M%d %.1f ", kXp, kYp
                else
                    SPt sprintfk "L%d %.1f ", kXp, kYp
                endif
                SPath strcatk SPath, SPt
                kPen = 1
            else
                kPen = 0
            endif
            kJ += 1
        od
        if strlenk(SPath) > 0 then
            if kLC[kLn] == 0 then
                SEl sprintfk {{<path d="%s" fill="none" stroke="#eb463c" stroke-width="1.5" stroke-linejoin="round"/>}}, SPath
            elseif kLC[kLn] == 1 then
                SEl sprintfk {{<path d="%s" fill="none" stroke="#50dc46" stroke-width="1.5" stroke-linejoin="round"/>}}, SPath
            else
                SEl sprintfk {{<path d="%s" fill="none" stroke="#3ca0ff" stroke-width="1.5" stroke-linejoin="round"/>}}, SPath
            endif
            SAll strcatk SAll, SEl
        endif
        kLn += 1
    od
    cabbageSet kVzT, "vizbg", "svgElement", SAll
endif

; values of now, 10 times a second, in the colour of their line (the label of that colour is used)
kVzTx metro 10
if kVzTx == 1 && kViz == 1 then
    STxR strcpyk ""
    STxG strcpyk ""
    STxB strcpyk ""
    kLast = (kHd + 89) % 90                       ; the newest point
    kA0   = kLA[0]
    kB0   = kLB[0]
    kR0   = kLR[0]
    kK0   = kLK[0]
    kOn0  = (kHOn[kA0][kLast] == 1 && kHOn[kB0][kLast] == 1) ? 1 : 0
    kV0   = gkVz[kR0]
    STx0 VzTxt kK0, kV0, kOn0, SLN1
    if kLC[0] == 0 then
        STxR strcpyk STx0
    elseif kLC[0] == 1 then
        STxG strcpyk STx0
    else
        STxB strcpyk STx0
    endif
    if kNL == 2 then
        kA1   = kLA[1]
        kB1   = kLB[1]
        kR1   = kLR[1]
        kK1   = kLK[1]
        kOn1  = (kHOn[kA1][kLast] == 1 && kHOn[kB1][kLast] == 1) ? 1 : 0
        kV1   = gkVz[kR1]
        STx1 VzTxt kK1, kV1, kOn1, SLN2
        STxB strcpyk STx1
    endif
    cabbageSet kVzTx, "vizvt", "text", STxR
    cabbageSet kVzTx, "vizvf", "text", STxG
    cabbageSet kVzTx, "vizvl", "text", STxB
endif

TapeGUIp gkSpdTape, kPchW, "art"
gkPlayOn = 0                                     ; Play sets it again next cycle while it runs

 ;TapeGUI kSpdTape, "art"
endin

; runs last in every control cycle: clears the shared audio buses, so a stopped Play / Freeze never leaves
; its last block repeating in the sections that read it.
instr clear
    gaTapeL = 0
    gaTapeR = 0
    gaFrzL  = 0
    gaFrzR  = 0
endin




</CsInstruments>
<CsScore>
i "source" 0 99999
i "widgets" 0 99999
i "speaker" 0 99999
i "clear" 0 99999
</CsScore>
</CsoundSynthesizer>
