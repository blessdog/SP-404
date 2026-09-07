# 2026-09-07 — first look

**Tried:** opened the folder Ryan created, found the SP-404MKII app running and
connected, the unit on USB audio and CoreMIDI, and an empty local project store.
Searched for prior art before proposing anything (four searches, see README
Sources). Sent one MIDI note (ch 1, note 36) to the unit from a Swift script.

**Happened:** the note reached the CoreMIDI destination. Every community tool
found is a format converter for the SD-card path; the Roland app already
converts on import. Koala mode turned out to be mobile-only.

**Mechanism:** Roland's MIDI chart accepts notes and clock only, so remote
control of the unit is limited to triggering. Everything else moves as files
through the app or the SD card.

**Verdict:** written as `knowledge/midi-in-is-notes-only.md` (verdict) and
`knowledge/soundboard-for-video-is-the-first-use.md` (law, Ryan's words).
Open: did pad 1 sound; what an exported PROJECT_xx folder contains.
