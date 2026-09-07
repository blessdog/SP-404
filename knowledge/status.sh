#!/usr/bin/env bash
# What THIS project counts. Inlined into STATE.md by state-report.py.
set -u
printf "  SP-404MKII app running: "; pgrep -x SP-404MKII >/dev/null && echo yes || echo no
printf "  unit on USB audio:      "; system_profiler SPAudioDataType 2>/dev/null | grep -q "SP-404MKII-OUT" && echo yes || echo no
printf "  exported projects:      "; find "$HOME/SP404 User/ROLAND" -maxdepth 3 -type d -name 'PROJECT_*' 2>/dev/null | wc -l | tr -d ' '
printf "  tools/:                 "; ls tools 2>/dev/null | wc -l | tr -d ' '
