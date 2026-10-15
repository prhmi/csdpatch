; ---------------------------------------------------------------
; TapeGUI kSpeed, SChannel
;   kSpeed   : tape speed (1 = normal, higher = faster)
;   SChannel : name of the Cabbage image widget to draw on
; ---------------------------------------------------------------
opcode TapeGUI, 0, kS
    kSpeed, SChan xin

    ; ---- gui settings (all local to this opcode) ----
    iTickGap = 20         ; distance between two ticks in px, always the same: a wider image gets MORE ticks
    iDefW    = 232        ; size used if the image width/height can't be read (set to your image size)
    iDefH    = 82

    ; tape strips: x and width are filled in below, they stretch with the image width
    SBackFmt = {{
        <rect x="%.2f" y="105" width="%.2f" height="3" fill="#2b4186"/>
        <rect x="%.2f" y="32" width="%.2f" height="3" fill="#2b4186"/>
    }}

    SReelFmt = {{
        <g transform="translate(%.1f 70)">
            <circle cx="0" cy="0" r="40" fill="#15181c" stroke="#d5d9de" stroke-width="2"/>
            <circle cx="0" cy="0" r="32" fill="none" stroke="#d5d9de" stroke-opacity="0.2" stroke-width="1"/>
            <g transform="rotate(%.2f)">
                <path d="M0 0 V-40 M0 0 L34.6 20 M0 0 L-34.6 20" fill="none" stroke="#d5d9de" stroke-width="2" stroke-linecap="round"/>
            </g>
            <circle cx="0" cy="0" r="15" fill="#15181c" stroke="#d5d9de" stroke-width="5"/>
        </g>
    }}

    ; size of the image widget, read once at start. Tries a few identifier names; if none
    ; can be read it falls back to iDefW / iDefH (edit those above to resize).
    ; The console prints the size that is actually used, so you can see which case you got.
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
        printks "TapeGUI size used: %f x %f\n", 0, kW, kH
    endif

    ; Ratio rule: the reels are always round, their size follows the image HEIGHT (kS);
    ; the image WIDTH only changes the space between the two reels (kF = distance / 150,
    ; where 150 is the natural centre-to-centre distance). Strips and ticks stretch with it.
    kS = kH / 82                                    ; uniform scale for everything
    kF = max(kW / kS - 82, 15) / 150                ; horizontal spacing factor

    ; strips and ticks run from the centre of one reel to the centre of the other, so both
    ; ends are always hidden behind the (filled) reels, whatever the image size
    kTapeLen = 150 * kF                             ; centre-to-centre distance
    kNumTicks = int(kTapeLen / iTickGap) + 1        ; ticks that fit: more width = more ticks

    kOmega = kSpeed * 2.4                           ; reel speed in rad/s
    kDeg   init 0
    kPos   init 0
    kDeg   = (kDeg + kOmega * 57.29578 / kr) % 360
    kPos   = (kPos + kOmega * 22 / kr) % iTickGap   ; 22 px = effective tape pack radius, same px/s at any width

    kTrig  metro 30
    if kTrig == 1 then
        STicks  strcpyk ""
        STicks2 strcpyk ""
        kI = 0
        ; ticks sit a fixed iTickGap apart and slide along the tape. A tick is only drawn
        ; between the two reel centres, so it enters and leaves behind a reel.
        ; bottom strip moves left, top strip moves right.
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

        ; The drawing is relative to the image widget (0,0 = the image's top-left corner),
        ; so the image x/y already place it. The tape's top-left corner is at 139,29 in the
        ; drawing, so move it to 0,0 and scale uniformly by kS (height / 82). Width is handled
        ; by kF above (spacing between the reels), so circles never turn into ovals.
        SFrame sprintfk {{<g transform="scale(%.5f %.5f) translate(-139 -29)">%s</g>}}, kS, kS, SBody
        cabbageSet kTrig, SChan, "svgElement", SFrame
    endif
endop
