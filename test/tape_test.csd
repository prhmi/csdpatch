<Cabbage>
form caption("Tape Machine") size(520, 260), guiMode("queue"), colour(21, 24, 28), pluginId("tpm1")

image bounds(0, 0, 520, 180), channel("art"), colour(0, 0, 0, 0), outlineThickness(0), mouseInteraction(0)

; Speed: tape speed (1 = normal, 0 = stopped). Pitch: playback pitch ratio (1 = original, 2 = octave up)
rslider bounds(190, 180, 64, 76), channel("speed"), range(0, 2, 1, 1, 0.01),   text("Speed"), valueTextBox(1), colour(35, 39, 45), trackerColour(199, 122, 69), outlineColour(55, 60, 68), textColour(170, 176, 184)
rslider bounds(266, 180, 64, 76), channel("pitch"), range(0.5, 2, 1, 1, 0.01), text("Pitch"), valueTextBox(1), colour(35, 39, 45), trackerColour(199, 122, 69), outlineColour(55, 60, 68), textColour(170, 176, 184)

checkbox bounds(438, 18, 71, 22), channel("record"), text("Record"), colour:1(199, 122, 69, 255), colour:0(55, 60, 68, 255), fontColour:0(170, 176, 184, 255), fontColour:1(170, 176, 184, 255)
checkbox bounds(438, 48, 71, 22), channel("play"),   text("Play"),   colour:1(199, 122, 69), colour:0(55, 60, 68), fontColour:0(170, 176, 184), fontColour:1(170, 176, 184)
</Cabbage>

<CsoundSynthesizer>
<CsOptions>
-d -+rtmidi=NULL -M0 -m0d
</CsOptions>
<CsInstruments>
ksmps = 32
nchnls = 2
0dbfs = 1

giNumTicks = 8
giTapeLen  = 112
giPitch    = giTapeLen / giNumTicks      ; tick spacing in px

; tape buffer: 60 seconds, one table per channel
giSecs  = 60
giTapeL ftgen 0, 0, -(giSecs * sr), 2, 0
giTapeR ftgen 0, 0, -(giSecs * sr), 2, 0

; ---------------------------------------------------------------
; TapeGUI kSpeed, SChannel
;   kSpeed   : tape speed (1 = normal, higher = faster)
;   SChannel : name of the Cabbage image widget to draw on
; ---------------------------------------------------------------
opcode TapeGUI, 0, kS
    kSpeed, SChan xin

    SBack = {{
        <rect x="195" y="105" width="120" height="3" fill="#2b4186"/>
        <rect x="195" y="32" width="120" height="3" fill="#2b4186"/>
    }}

    SReelFmt = {{
        <g transform="translate(%.1f 70)">
            <circle cx="0" cy="0" r="40" fill="none" stroke="#d5d9de" stroke-width="2"/>
            <circle cx="0" cy="0" r="32" fill="none" stroke="#d5d9de" stroke-opacity="0.2" stroke-width="1"/>
            <g transform="rotate(%.2f)">
                <path d="M0 0 V-40 M0 0 L34.6 20 M0 0 L-34.6 20" fill="none" stroke="#d5d9de" stroke-width="2" stroke-linecap="round"/>
            </g>
            <circle cx="0" cy="0" r="15" fill="#15181c" stroke="#d5d9de" stroke-width="5"/>
        </g>
    }}

    kOmega = kSpeed * 2.4                           ; reel speed in rad/s
    kDeg   init 0
    kPos   init 0
    kDeg   = (kDeg + kOmega * 57.29578 / kr) % 360
    kPos   = (kPos + kOmega * 22 / kr) % giPitch    ; 22 px = effective tape pack radius

    kTrig  metro 50
    if kTrig == 1 then
        STicks  strcpyk ""
        STicks2 strcpyk ""
        kI = 0
        until kI == giNumTicks do
            kX  = 200 + (kI * giPitch + giTapeLen - kPos) % giTapeLen
            kX2 = 200 + (kI * giPitch + giTapeLen + kPos) % giTapeLen
            STk  sprintfk "M%.1f 105 v3 ", kX
            STicks  strcatk STicks, STk
            STk2 sprintfk "M%.1f 32 v3 ", kX2
            STicks2 strcatk STicks2, STk2
            kI += 1
        enduntil
        STickPath  sprintfk {{<path d="%s" fill="none" stroke="#a5d9de" stroke-opacity="0.85" stroke-width="5"/>}}, STicks
        STickPath2 sprintfk {{<path d="%s" fill="none" stroke="#a5d9de" stroke-opacity="0.85" stroke-width="5"/>}}, STicks2

        SReelL sprintfk SReelFmt, 180, kDeg
        SReelR sprintfk SReelFmt, 330, kDeg

        SFrame strcpyk SBack
        SFrame strcatk SFrame, STickPath
        SFrame strcatk SFrame, STickPath2
        SFrame strcatk SFrame, SReelL
        SFrame strcatk SFrame, SReelR
        cabbageSet kTrig, SChan, "svgElement", SFrame
    endif
endop

; ---------- record the input into the tape buffer (starts at 0:00) ----------
instr Record
    aInL inch 1
    aInR inch 2
    aPtr linseg 0, giSecs, giSecs * sr
    tablew aInL, aPtr, giTapeL
    tablew aInR, aPtr, giTapeR
endin

; ---------- play the buffer back: speed (tempo) and pitch are independent ----------
instr Play
    kSpeed cabbageGetValue "speed"
    kPitch cabbageGetValue "pitch"
    aL temposcal kSpeed, 1, kPitch, giTapeL, 1
    aR temposcal kSpeed, 1, kPitch, giTapeR, 1
    outs aL, aR
endin

; ---------- control + gui ----------
instr 1
    kSpeed cabbageGetValue "speed"
    kRec   cabbageGetValue "record"
    kPlay  cabbageGetValue "play"

    if changed(kRec) == 1 then
        if kRec == 1 then
            schedulek "Record", 0, 99999
        else
            turnoff2 "Record", 0, 0
        endif
    endif

    if changed(kPlay) == 1 then
        if kPlay == 1 then
            schedulek "Play", 0, 99999
        else
            turnoff2 "Play", 0, 0
        endif
    endif

    TapeGUI kSpeed, "art"
endin
</CsInstruments>
<CsScore>
i1 0 z
</CsScore>
</CsoundSynthesizer>
