---
id: midi-in-is-notes-only
kind: verdict
conflict-key: what-can-the-mac-control-on-the-unit-over-midi
status: live
supersedes: []
scope: SP-404MKII over USB MIDI, per Roland's published MIDI implementation chart (reference manual, checked 2026-09-07); pad 1 trigger measured live from tools/sp-trigger-pad.swift the same day
evidence: https://static.roland.com/manuals/sp-404mk2_reference/eng/17805468.html
verified-on: 2026-09-07
asked-as:
  - can we set effects from the mac over midi
  - can we load samples onto pads over midi
  - how do we control the sp-404 from ableton
  - what midi does the sp-404 accept
  - can a script change pad parameters
---

**The unit accepts note on/off (36–51 on channels 1–10 = pads 1–16 on banks
A–J), velocity, and MIDI clock/transport. It accepts NO control change, NO
program change, and NO system exclusive.** Channel 11 is the vocoder carrier
only.

**What follows:** from the Mac you can TRIGGER pads and RECORD patterns, and you
can sync tempo. You cannot set FX, levels, pad assignment, or sample content
remotely. All of that goes through the Roland app's GUI (drag-and-drop import,
Import to MKII of a `ROLAND/SP-404MKII/PROJECT_xx` folder) or the SD card's
IMPORT folder.

**So the soundboard pipeline has exactly two sides:** files in (ffmpeg cut and
name, then the app's own import, which converts WAV/AIFF/MP3/FLAC/M4A itself),
and notes plus audio out (any MIDI source fires pads; the unit's 4-channel USB
audio output carries the result back to Ableton or a recorder).

Measured: `swift tools/sp-trigger-pad.swift 1 36` reached the unit's CoreMIDI
destination on 2026-09-07. Whether it PLAYED is Ryan's ear to confirm; if it
did not, the unit's MIDI Mode A/B setting is the first suspect, not the script.
Related: [[soundboard-for-video-is-the-first-use]].
