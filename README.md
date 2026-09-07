# SP-404 — Roland SP-404MKII in the media studio

What this is: the working repo for Ryan's SP-404MKII sampler. First job is a
**clip-to-pad soundboard for video work**; second job is learning the instrument
end to end (sampling, chop, resample, FX, patterns, DJ mode, Serato, Koala).
This README is the front page and the running post-mortem. `knowledge/` holds
the typed claims; `docs/journal/` holds the session narratives.

## Report 2026-09-07 — what the Mac can see and do

Every line below is labelled MEASURED (checked on this machine today),
DOCUMENTED (read from Roland's own manual or guide), or UNVERIFIED.

### On this machine — MEASURED

| thing | state |
|---|---|
| SP-404MKII app | v4.05 (`com.roland.SP404MKII`), running, "Connected", project `10 PROJECT_10` open |
| Unit as USB audio | `SP-404MKII-OUT` is the Mac's default output, 4 channels, 48 kHz; `SP-404MKII-IN` 2 channels |
| Unit as MIDI | CoreMIDI source and destination both named `SP-404MKII` |
| Pad trigger from a script | `swift tools/sp-trigger-pad.swift 1 36` sent note 36 on ch 1 (bank A, pad 1) at 17:00 — whether it sounded is Ryan's call |
| App's local project store | `~/SP404 User/ROLAND/SP-404MKII_LOCAL/` exists and is **empty** — nothing has been exported to PC yet |
| Sample staging folder | `~/Desktop/sp404_samples/` — one file, `dirty_diana.mp3` (the app's last-used folder) |
| Firmware download | `~/Downloads/sp404mk2_sys_v552/` (v5.52, June 15) — what is ON the unit is UNVERIFIED |
| Other audio software | Ableton Live 12 Suite 12.4.3, Serato DJ Lite, Audacity, Roland Cloud Manager |
| CLI tools | ffmpeg, ffprobe, sox, yt-dlp, python3, node, swift (no pdftotext-free PDF path needed: pdftotext present) |
| SD card reader | none mounted today |

### The hard constraint that shapes everything — DOCUMENTED

Roland's MIDI implementation chart: the unit **recognises note on/off for notes
36–51 on channels 1–10 (channel = bank A–J, note = pad 1–16), velocity, and MIDI
clock/transport. It recognises NO control change, NO program change, NO sysex.**

So from the Mac you can **trigger pads, record patterns, and sync tempo**. You
**cannot** set FX, levels, envelopes, or pad assignment remotely, and you cannot
load a sample by MIDI. Sample content and pad parameters move only through:

- the Roland app GUI: drag-and-drop audio onto pads (WAV, AIFF, MP3, FLAC, M4A —
  the app converts), or **Import to MKII** of a whole `ROLAND/SP-404MKII/PROJECT_xx`
  folder that **Export to PC** produced;
- the SD card: 16-bit WAV/AIFF/MP3 in the card's IMPORT folder, then SHIFT+pad 14.

Claim: `knowledge/midi-in-is-notes-only.md`.

### What already exists, so we do not build it — DOCUMENTED

- **Format conversion**: every GitHub "SP-404 converter" found is an ffmpeg wrapper
  producing 48 kHz / 16-bit WAV for the SD-card path. Not needed here: the app
  imports and converts itself, and ffmpeg is installed for the cut-and-name step.
- **Editor / librarian**: the Roland app does waveform trim, chop, normalize,
  envelope, pitch/time, pattern import/export as SMF `.mid`, and runs as an
  AU/VST3 plug-in inside Ableton.
- **DJ**: DJ Mode on the unit (two decks, 8 cue points per sample, fader curves)
  since firmware 4.x; Serato DJ Lite is installed and has an official SP-404MKII
  integration.
- **Koala**: Koala Controller Mode is **mobile only** (iOS / iPadOS / Android,
  Koala ≥ 1.4082) over USB. Banks A–D control Koala, E–J stay SP pads. There is
  no Mac Koala mode.
- **Streaming/soundboard audio**: the unit's USB audio output is already the
  Mac's default output, so anything it plays can be captured by Ableton, OBS,
  or QuickTime with no extra routing.

### Plan — both halves get built, sequenced, each with a completion criterion

**A. Clip-to-pad soundboard (the directive).**

1. **Export the current project to PC and read the folder.** Click Export to PC
   in the app, choose `~/SP404 User`. Done when `~/SP404 User/ROLAND/SP-404MKII/PROJECT_xx/`
   exists and its file listing is in `docs/journal/`. This decides whether pad
   assignment is automated by writing files or by driving the app's GUI.
2. **Cut-and-name tool**: `tools/clip-to-pads` takes a video or audio file plus
   a list of in/out times and labels, writes named WAVs (48 kHz, 16-bit) into a
   staging folder. Done when 16 clips from one video sit in the folder and
   drag onto bank A in the app without an error.
3. **Bank layout convention** written into `knowledge/` as a procedure: which
   bank holds stingers, which holds beds, which holds voice clips.
4. **Fire pads from a timeline**: an Ableton MIDI clip on ch 1–10 triggers the
   unit while the USB audio returns to a track. Done when one 30-second video
   has its soundboard hits recorded this way.

**B. Learning the instrument (the exploration).**

5. Walk each surface at the unit, one session each, with the v5 reference
   manual read on demand: sampling and resampling, chop, FX buses, patterns,
   DJ mode, Serato hand-off, Koala from an iPad. Each session ends with a
   `docs/journal/` entry and any measured claim in `knowledge/`.

Open items: firmware on the unit (UNVERIFIED), MIDI Mode A vs B on the unit
(matters only if the pad-1 trigger did not sound).

### Sources

- Roland MIDI implementation chart: https://static.roland.com/manuals/sp-404mk2_reference/eng/17805468.html
- Roland, MIDI note mapping (Mode A/B): https://support.roland.com/hc/en-us/articles/25793219901851-SP-404MK2-How-are-the-MIDI-notes-mapped
- Roland, SD card import/export (v4 manual): https://static.roland.com/manuals/sp-404mk2_reference_v4/en-US/7958234778537099.html
- SP-404MKII App User's Guide (PDF): https://files.kraftmusic.com/media/ownersmanual/Roland_SP-404MKII_App_Users_Guide.pdf
- Koala Sampler setup guide (PDF): https://files.kraftmusic.com/media/ownersmanual/Roland_SP-404MKII_Koala_Sampler_Setup_Guide.pdf
- Firmware 4.04 feature list (loop capture, Koala, DJ mode): https://synthanatomy.com/2024/04/roland-sp-404mkii-4-04-new-loop-capture-koala-app-integration-and-more.html
- Serato DJ Lite quick start for SP-404MKII: https://support.serato.com/hc/en-us/articles/12196922774031-Roland-SP-404MKII-Quick-Start-Guide
- Community converters (all ffmpeg wrappers): https://github.com/seb-patron/SP404mk2-wav-converter , https://github.com/ConorCorp/sp404-sdcard-wav-converter , https://github.com/pkMinhas/SP404WavConvertor , https://github.com/haoranzhang929/sp404-sample-converter
- SP-404SX pad file format (older model, reference only): https://github.com/MatthewCallis/super-pads
