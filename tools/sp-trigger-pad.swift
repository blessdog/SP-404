// sp-trigger-pad — fire one SP-404MKII pad from the Mac over USB MIDI.
//
// usage: swift tools/sp-trigger-pad.swift [channel 1-10] [note 36-51]
//   channel 1-10 = bank A-J, note 36-51 = pad 1-16 (Roland MIDI chart, MIDI Mode A).
//   defaults: channel 1, note 36  (bank A, pad 1)
//
// PRIOR ART: the Roland app and Ableton both send these notes; this exists only so
// a shell script can trigger a pad without a DAW open. It is note on/off only —
// the unit accepts no CC, program change, or sysex (see README "Hard constraint").
import CoreMIDI
import Foundation
var client = MIDIClientRef(); MIDIClientCreate("cc" as CFString, nil, nil, &client)
var port = MIDIPortRef(); MIDIOutputPortCreate(client, "out" as CFString, &port)
var dest: MIDIEndpointRef = 0
for i in 0..<MIDIGetNumberOfDestinations() {
  let d = MIDIGetDestination(i); var s: Unmanaged<CFString>?; MIDIObjectGetStringProperty(d, kMIDIPropertyDisplayName, &s)
  if (s?.takeRetainedValue() as String?) == "SP-404MKII" { dest = d }
}
guard dest != 0 else { print("no SP-404MKII destination"); exit(1) }
func send(_ b: [UInt8]) {
  var pl = MIDIPacketList(); let p = MIDIPacketListInit(&pl)
  _ = MIDIPacketListAdd(&pl, 1024, p, 0, b.count, b)
  MIDISend(port, dest, &pl)
}
let ch: UInt8 = UInt8(CommandLine.arguments.count > 1 ? Int(CommandLine.arguments[1])! - 1 : 0)
let note: UInt8 = UInt8(CommandLine.arguments.count > 2 ? Int(CommandLine.arguments[2])! : 36)
send([0x90 | ch, note, 100]); Thread.sleep(forTimeInterval: 0.6); send([0x80 | ch, note, 0])
print("sent note \(note) ch \(ch+1) -> SP-404MKII")
