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


; ===============================================================================================
; TapeRing : a ring around one reel. Returns SVG (drawing units, reel centre y = 70, radius 46).
;   kCx    : x of the reel centre
;   kAng   : lit part of the ring in degrees from 12 o'clock. + = clockwise, - = anticlockwise, 0 = nothing lit
;   kGh    : a dot on the ring at this angle (the knob setting). -999 = no dot
;   SCol   : colour of the lit part
; ===============================================================================================
opcode TapeRing, S, kkkS
    kCx, kAng, kGh, SCol xin
    iR   = 46
    kA   = limit(kAng, -359, 359)
    kRad = kA * 0.0174533
    kEx  = kCx + iR * sin(kRad)
    kEy  = 70 - iR * cos(kRad)
    kLg  = (abs(kA) > 180) ? 1 : 0
    kSw  = (kA > 0) ? 1 : 0
    SOut sprintfk {{<circle cx="%.1f" cy="70" r="46" fill="none" stroke="#283040" stroke-width="4"/><path d="M%.1f 24 v4" stroke="#6a7488" stroke-width="2"/>}}, kCx, kCx
    if abs(kA) > 1 then
        SArc sprintfk {{<path d="M%.1f 24 A46 46 0 %d %d %.1f %.1f" fill="none" stroke="%s" stroke-width="4" stroke-linecap="round"/>}}, kCx, kLg, kSw, kEx, kEy, SCol
        SOut strcatk SOut, SArc
    endif
    if kGh > -999 then
        kGr = limit(kGh, -359, 359) * 0.0174533
        SGh sprintfk {{<circle cx="%.1f" cy="%.1f" r="3.5" fill="#e8ecf2"/>}}, kCx + iR * sin(kGr), 70 - iR * cos(kGr)
        SOut strcatk SOut, SGh
    endif
    xout SOut
endop


; ===============================================================================================
; TapeGUI2 : the reels (as TapeGUI) + the picture of what the machine does right now.
;   kSpeed        : tape speed, turns the reels
;   SChan         : the image widget ("art"), 292 x 108 px in the new layout
;   kAngL, kGhL   : ring around the LEFT reel (speed) and its knob dot
;   kAngR, kGhR   : ring around the RIGHT reel (pitch / gate / burst) and its knob dot
;   kTr[], kHead  : history of the mode's modulator, drawn as a line between the reels. kHead = oldest point
;   kUni          : 0 = kTr is -1..1 (unused now, kept for compatibility)
;   kWarm         : 0..1, strips go from blue (clean) to amber (driven)
;   kFlash        : 1 = a dropout is happening, the strips dim
;   kHide         : 1 = do not draw (the ~ popup is on top), saves the whole redraw
;   SColL, SColR, SColT : colours of the left ring, the right ring and the line
; ===============================================================================================
opcode TapeGUI2, 0, kSkkkkk[]kkkkkSSS
    kSpeed, SChan, kAngL, kGhL, kAngR, kGhR, kTr[], kHead, kUni, kWarm, kFlash, kHide, SColL, SColR, SColT xin

    iTickGap = 20
    iDefW    = 292
    iDefH    = 108

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

    kS        = kH / 96                             ; 96 drawing units tall: reel 80 + rings 8 + 8
    kF        = max(kW / kS - 96, 15) / 150         ; the width only changes the distance between the reels
    kTapeLen  = 150 * kF
    kNumTicks = int(kTapeLen / iTickGap) + 1
    kXR       = 180 + kTapeLen                      ; right reel centre

    kOmega = kSpeed * 2.4
    kDeg   init 0
    kPos   init 0
    kDeg   = (kDeg + kOmega * 57.29578 / kr) % 360
    kPos   = (kPos + kOmega * 22 / kr) % iTickGap

    kTrig  metro 30
    kI init 0
    kJ init 0
    if kTrig == 1 && kHide == 0 then
        kCr = 43 + 187 * kWarm
        kCg = 65 + 85 * kWarm
        kCb = 134 - 94 * kWarm
        kOp = 1 - 0.8 * kFlash
        SBody sprintfk {{<rect x="180" y="105" width="%.1f" height="3" fill="rgb(%d,%d,%d)" fill-opacity="%.2f"/><rect x="180" y="32" width="%.1f" height="3" fill="rgb(%d,%d,%d)" fill-opacity="%.2f"/>}}, kTapeLen, int(kCr), int(kCg), int(kCb), kOp, kTapeLen, int(kCr), int(kCg), int(kCb), kOp

        STicks  strcpyk ""
        STicks2 strcpyk ""
        kI = 0
        until kI > kNumTicks do
            kX  = 180 + kI * iTickGap - kPos
            kX2 = 180 + kI * iTickGap + kPos
            if kX >= 180 && kX <= kXR then
                STk     sprintfk "M%.1f 105 v3 ", kX
                STicks  strcatk STicks, STk
            endif
            if kX2 <= kXR then
                STk2    sprintfk "M%.1f 32 v3 ", kX2
                STicks2 strcatk STicks2, STk2
            endif
            kI += 1
        enduntil
        STickPath sprintfk {{<path d="%s %s" fill="none" stroke="#a5d9de" stroke-opacity="%.2f" stroke-width="5"/>}}, STicks, STicks2, 0.85 * kOp
        SBody strcatk SBody, STickPath

        ; the modulator history, a line between the reels (oldest on the left)
        kX0 = 180 + 48
        kX1 = kXR - 48
        if kX1 - kX0 > 20 then
            kN  = lenarray(kTr)
            kM  = int(kN / 2)
            STr strcpyk ""
            kJ  = 0
            while kJ < kM do
                kV  = kTr[(kHead + kJ * 2) % kN]
                kXp = kX0 + kJ * (kX1 - kX0) / (kM - 1)
                kYp = 70 - limit(kV, -1, 1) * 20
                SPt sprintfk "%d,%d ", int(kXp), int(kYp)
                STr strcatk STr, SPt
                kJ += 1
            od
            STrEl sprintfk {{<path d="M%d 70 H%d" stroke="#323a4c" stroke-width="1"/><polyline points="%s" fill="none" stroke="%s" stroke-width="2" stroke-linejoin="round"/>}}, int(kX0), int(kX1), STr, SColT
            SBody strcatk SBody, STrEl
        endif

        SReelFmt = {{<g transform="translate(%.1f 70)"><circle cx="0" cy="0" r="40" fill="#15181c" stroke="#d5d9de" stroke-width="2"/><circle cx="0" cy="0" r="32" fill="none" stroke="#d5d9de" stroke-opacity="0.2" stroke-width="1"/><g transform="rotate(%.2f)"><path d="M0 0 V-40 M0 0 L34.6 20 M0 0 L-34.6 20" fill="none" stroke="#d5d9de" stroke-width="2" stroke-linecap="round"/></g><circle cx="0" cy="0" r="15" fill="#15181c" stroke="#d5d9de" stroke-width="5"/></g>}}
        SReelL sprintfk SReelFmt, 180, kDeg
        SReelR sprintfk SReelFmt, kXR, kDeg
        SBody strcatk SBody, SReelL
        SBody strcatk SBody, SReelR

        SRingL TapeRing 180, kAngL, kGhL, SColL
        SRingR TapeRing kXR, kAngR, kGhR, SColR
        SBody strcatk SBody, SRingL
        SBody strcatk SBody, SRingR

        ; drawing box: x 132 .. kXR + 48, y 22 .. 118 (scaled to the image)
        SFrame sprintfk {{<g transform="scale(%.5f %.5f) translate(-132 -22)">%s</g>}}, kS, kS, SBody
        cabbageSet kTrig, SChan, "svgElement", SFrame
    endif
endop
