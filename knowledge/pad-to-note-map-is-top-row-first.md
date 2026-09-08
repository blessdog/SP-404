---
id: pad-to-note-map-is-top-row-first
kind: verdict
conflict-key: which-midi-note-is-which-pad
status: live
supersedes: [usb-midi-note-to-the-unit-did-not-sound-note-36-]
scope: SP-404MKII over USB MIDI on this Mac, unit's own pad presses captured with receivemidi 2026-09-08; the unit is in MIDI Mode A (channel = bank), inferred from bank B pad 1 arriving on channel 2 — Roland's v5 note map puts Mode B's bank B on channel 1 at notes 64–79
evidence: evidence/2026-09-08/pad-note-map-receivemidi.log (Ryan pressed A1, A4, A13, A16, B1 in that order)
verified-on: 2026-09-08
asked-as:
  - which note is pad 1
  - what midi note does pad 13 send
  - why did note 36 not play pad 1
  - which channel is bank B
  - how do I trigger a pad from the deck
  - pad to note mapping sp-404
---

**Channel = bank (A is 1, B is 2). Note runs chromatically from the TOP row
down: pad 13 = 36, pad 1 = 48. So pads 13–16 are 36–39, 9–12 are 40–43,
5–8 are 44–47, 1–4 are 48–51.**

Measured 2026-09-08 with `receivemidi dev SP-404MKII ts nn` while Ryan pressed
pads by name:

| pressed | received |
|---|---|
| bank A pad 1 | ch 1 note 48 |
| bank A pad 4 | ch 1 note 51 |
| bank A pad 13 | ch 1 note 36 |
| bank A pad 16 | nothing logged — see below |
| bank B pad 1 | ch 2 note 48 |

Pad 16 sent nothing on that press; whether an empty pad is silent on MIDI or
the press missed is still to be read from the unit.

Roland's own table (v5 reference manual, MIDI note map): Mode A is one
channel per bank, 16 notes each; Mode B is banks A–E on one channel and F–J on
the next, notes 12–91. The measured channel-2 hit for bank B is only possible
in Mode A. Source: https://static.roland.com/manuals/sp-404mk2_reference_v500/en-US/8012353178593931.html

What this retires: the 2026-09-07 dead end "note 36 did not sound" was not a
broken MIDI path. Note 36 is pad 13, so the script fired the right note at a
pad that may have held nothing. The path is live in both directions:
`sendmidi dev SP-404MKII ch 1 on 48 127` is bank A pad 1.

How to apply: a deck key that fires a pad computes
`note = 36 + (16 - pad)` grouped by row, i.e. `note = 48 + (pad - 1)` for pads
1–4, `44 + (pad - 5)` for 5–8, `40 + (pad - 9)` for 9–12, `36 + (pad - 13)`
for 13–16, on channel = bank index. Never assume ascending from pad 1.
Related: [[midi-in-is-notes-only]].
