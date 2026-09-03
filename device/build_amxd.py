#!/usr/bin/env python3
"""Wrap infinite-drummer.maxpat in the .amxd container so Live loads it as a device.

An unfrozen .amxd is a flat sequence of IFF-style chunks
([4-byte tag][uint32 LE length][data]):

  ampf  device type ("mmmm" = MIDI effect)
  meta  format version
  ptch  the patcher JSON, null-terminated

Same layout as Live's own "Max MIDI Effect.amxd" template. The .amxd must
stay next to infinite-drummer.js: an unfrozen device finds the [js] file by
looking beside itself.
"""
import json
import struct
import sys
from pathlib import Path

HERE = Path(__file__).parent
MAXPAT = HERE / "infinite-drummer.maxpat"
AMXD = HERE / "InfiniteDrummer.amxd"


def chunk(tag: bytes, data: bytes) -> bytes:
    return tag + struct.pack("<I", len(data)) + data


def build() -> bytes:
    raw = MAXPAT.read_bytes()
    json.loads(raw)  # fail early on malformed patcher JSON
    return (
        chunk(b"ampf", b"mmmm")
        + chunk(b"meta", struct.pack("<I", 7))
        + chunk(b"ptch", raw + b"\x00")
    )


def verify(blob: bytes) -> None:
    off = 0
    chunks = {}
    while off < len(blob):
        tag = blob[off : off + 4]
        (size,) = struct.unpack("<I", blob[off + 4 : off + 8])
        chunks[tag] = blob[off + 8 : off + 8 + size]
        off += 8 + size
    assert off == len(blob), "trailing bytes after last chunk"
    assert chunks[b"ampf"] == b"mmmm", "device type is not MIDI effect"
    assert chunks[b"ptch"][:-1] == MAXPAT.read_bytes(), "round-trip mismatch"
    json.loads(chunks[b"ptch"][:-1])


def main() -> int:
    blob = build()
    verify(blob)
    AMXD.write_bytes(blob)
    print(f"wrote {AMXD} ({len(blob)} bytes, round-trip verified)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
