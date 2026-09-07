# Lesson 1 — play, sample, chop (SP-404MKII, firmware 5.x)

Every button combo below is from Roland's v5 reference manual (pages fetched
2026-09-07; see Sources). Nothing here is from memory.

## The four buttons you will use most

| button | what it is |
|---|---|
| pads 1–16 | play. Numbered bottom-left = 1, top-right = 16. |
| bank A/F … E/J | press once for the first letter, again for the second. 10 banks × 16 pads. |
| VALUE knob | turn = scroll, push = enter. Every menu. |
| EXIT | back out of anything. Mash it until you are in sample mode (pads orange). |

CTRL 1 / 2 / 3 are context knobs: they edit whatever the screen shows.

## 1. Play (5 minutes)

- Tap pads. Hit harder, it plays louder (velocity).
- **GATE** lit = sound only while held. GATE dark = one press plays the whole sample.
  SHIFT + GATE flips the whole bank at once.
- **HOLD** while holding a pad = latch a gated sample so it keeps playing.
- **LOOP** = repeat. **REVERSE** = backwards. **SUB PAD** = retrigger the last pad.
- **SHIFT + EXIT** = stop everything.
- **SHIFT + pad 8** = MUTE GROUP: pads in a group cut each other off (choke).
  Put every voice clip in one group so a new line always cuts the old one.

## 2. Sample the Mac (the soundboard trick)

The Mac's audio output is already the SP over USB (`SP-404MKII-OUT`). So anything
playing on the Mac, a video in QuickTime, a browser, Ableton, can be sampled
straight into a pad with no file export at all.

1. Press **EXT SOURCE** so you hear the Mac through the SP.
2. Press **REC**. Empty pads blink red. CTRL 3 sets the input level; keep the
   meter out of the red.
3. Press the red pad you want the clip to land on.
4. Start the clip on the Mac, press **REC** to begin. Press **REC** again to stop.
   The sample is saved to that pad.

Cancel any time with EXIT.

**Missed it? SKIP-BACK.** The unit silently records the last 25 seconds of audio
whenever the MARK button is blinking. Press **MARK**, then **REC**, then a red pad,
and the moment you just heard is on a pad. This is the fastest way to grab a
line from a video: watch, hear the line, press MARK.

## 3. Trim and chop

- **START/END** with a pad selected: CTRL knobs move the start and end points.
- **SHIFT + START/END** = marker screen. Two ways to place markers:
  - by ear: press pad 1 to play, tap pads 2–16 where you want cuts;
  - automatic: push VALUE, choose AUTO MARK, then TRANSIENT (hits), LEVEL, or
    TIME DIVISION (equal slices).
- Still on the marker screen: push VALUE, choose **ASSIGN TO PAD**, press the
  empty pads (they blink yellow, go green when picked), then push VALUE to
  commit. The slices land on those pads. Change bank first if you want them
  elsewhere.

## 4. Effects, the short version

- The five effect buttons (FILTER+DRIVE, RESONATOR, DELAY, ISOLATOR, DJFX
  LOOPER) plus MFX switch effects on. CTRL 1–3 tweak them live.
- Effects sit on buses. **BUS FX** lit orange = BUS 1, blinking = BUS 2. Hold
  **REMAIN** and tap a pad to route that pad to the selected bus. Pad colour
  tells you: orange = BUS 1, green = BUS 2, white = dry.
- **RESAMPLE** records what the SP is playing, effects included, onto a new pad.
  That is how a sound gets "baked".

## 5. First pattern (a beat or a cue sequence)

1. **PATTERN SELECT**, then **REC**. Empty pattern pads blink red; pick one.
2. CTRL 1 = BPM, CTRL 2 = length in bars, VALUE = quantize (GRID 16 is a safe
   start). SHIFT + pad 9 toggles the metronome.
3. Press **REC** and play pads. It loops and overdubs. REC again toggles
   rehearsal (plays without recording). SHIFT + PATTERN SELECT = undo last take.
4. **EXIT** once saves the pattern, twice stops it.

## Do this today, in order

1. Bank A: play, GATE on/off, SHIFT+EXIT.
2. Open any video on the Mac, EXT SOURCE, sample 10 seconds of it to pad B1.
3. SHIFT+START/END, AUTO MARK → TRANSIENT, ASSIGN TO PAD across bank B.
4. SHIFT+pad 8, put all of bank B in mute group A. Tap through them: each cuts
   the last.
5. Record a 2-bar pattern of those chops.

When that works you have a working soundboard with zero files moved.

## Sources
- Playing back samples: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7884506778448011.html
- GATE: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7887245978451083.html
- MUTE GROUP: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7895796378459531.html
- Sampling: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7905601178471051.html
- USB audio input (v4 page): https://static.roland.com/manuals/sp-404mk2_reference_v4/en-US/7943821978517899.html
- Skip-back sampling: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7907879578474123.html
- MARK: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7911540378477195.html
- CHOP: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7912513178477963.html
- BUS FX: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7899047578463371.html
- Effects per sample: https://static.roland.com/manuals/sp-404mk2_reference_v4/en-US/7900225178464907.html
- RESAMPLE: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7907213978473355.html
- Pattern real-time recording: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/7920321178487947.html
- SHIFT shortcuts: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/8003597978584715.html
