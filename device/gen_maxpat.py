#!/usr/bin/env python3
"""Generate infinite-drummer.maxpat: the [js] engine, MIDI/transport plumbing,
and the presentation UI (8 instrument rows x 6 controls, plus globals).

    python3 device/gen_maxpat.py && python3 device/build_amxd.py

This script is the source of the UI layout for now. If you start editing the
UI in Max instead, save the patcher JSON back into infinite-drummer.maxpat
and retire this script — do not keep both alive.
"""
import json
from pathlib import Path

OUT = Path(__file__).parent / "infinite-drummer.maxpat"

# live.* parameter unit styles
U_INT, U_TIME, U_PCT, U_MIDI = 0, 2, 5, 8

# TR-8S default kit: note, jitter ms, late ms, vel +/-, accent, chance %
ROWS = [
    (36, 3, 0, 6, 4, 100),   # BD
    (38, 5, 2, 10, 6, 100),  # SD
    (42, 8, 0, 18, 10, 100), # CH
    (46, 8, 3, 14, 6, 100),  # OH
    (37, 6, 2, 12, 4, 100),  # RS
    (39, 6, 4, 8, 2, 100),   # HC
    (43, 6, 2, 12, 4, 100),  # LT
    (47, 6, 2, 12, 4, 100),  # MT
]
COLS = [
    # key, header, short, min, max, unit
    ("note", "Note", "Note", 0, 127, U_MIDI),
    ("jit", "Jitter", "Jitter", 0, 50, U_TIME),
    ("late", "Late", "Late", -30, 30, U_TIME),
    ("vel", "Vel ±", "Vel", 0, 64, U_INT),
    ("acc", "Accent", "Accent", 0, 30, U_INT),
    ("chance", "Chance", "Chance", 0, 100, U_PCT),
]
GLOBALS = [
    # varname, label, short, min, max, init, unit
    ("g_drift", "Drift", "Drift", 0, 20, 3, U_TIME),
    ("g_bars", "Drift bars", "Bars", 1, 32, 8, U_INT),
    ("g_look", "Lookahead", "Look", 0, 50, 0, U_TIME),
    ("g_soft", "Soft = late", "Soft", 0, 10, 2, U_TIME),
]

# presentation geometry (device is 169 px tall in Live)
GRID_X, GRID_Y, COL_W, COL_PITCH, ROW_PITCH, BOX_H = 126, 20, 50, 54, 17, 15
UI_DX, UI_DY = 420, 30  # where the UI objects sit in patching view

boxes, lines, counter = [], [], [0]


def add(maxclass, rect, **attrs):
    counter[0] += 1
    box = {"id": f"obj-{counter[0]}", "maxclass": maxclass, "patching_rect": list(map(float, rect))}
    box.update(attrs)
    boxes.append({"box": box})
    return box["id"]


def obj(text, x, y, w, nin, nout, types, **attrs):
    return add("newobj", (x, y, w, 22), text=text, numinlets=nin, numoutlets=nout,
               outlettype=types, **attrs)


def connect(src, outlet, dst, inlet):
    lines.append({"patchline": {"source": [src, outlet], "destination": [dst, inlet]}})


def ui(maxclass, prect, **attrs):
    x, y, w, h = prect
    return add(maxclass, (x + UI_DX, y + UI_DY, w, h), presentation=1,
               presentation_rect=list(map(float, prect)), **attrs)


def label(text, prect, size=10.0):
    return ui("live.comment", prect, numinlets=1, numoutlets=0, text=text,
              fontsize=size, textjustification=0)


def param(maxclass, prect, varname, longname, shortname, lo, hi, init, unit):
    return ui(maxclass, prect, numinlets=1, numoutlets=2, outlettype=["", "float"],
              parameter_enable=1, varname=varname,
              saved_attribute_attributes={"valueof": {
                  "parameter_initial": [init], "parameter_initial_enable": 1,
                  "parameter_longname": longname, "parameter_shortname": shortname,
                  "parameter_mmin": float(lo), "parameter_mmax": float(hi),
                  "parameter_type": 1, "parameter_unitstyle": unit}})


def comment(text, x, y, w=260):
    return add("comment", (x, y, w, 20), numinlets=1, numoutlets=0, text=text)


# ---------------------------------------------------------------- plumbing
comment("MIDI from Live -> split notes from everything else", 30, 10)
midiin = obj("midiin", 30, 40, 45, 1, 1, ["int"])
parse = obj("midiparse", 30, 75, 120, 1, 8,
            ["", "", "", "int", "int", "int", "int", ""])
connect(midiin, 0, parse, 0)

comment("bang the transport first (right outlet), then hand the note to the engine", 30, 110, 420)
trig = obj("t l b", 30, 140, 40, 1, 2, ["", "bang"])
connect(parse, 0, trig, 0)
transport = obj("transport", 150, 175, 220, 1, 9,
                ["int", "int", "float", "float", "float", "", "int", "float", ""])
connect(trig, 1, transport, 0)
p_ticks = obj("prepend ticks", 250, 210, 85, 1, 1, [""])
p_sig = obj("prepend timesig", 150, 210, 95, 1, 1, [""])
connect(transport, 7, p_ticks, 0)
connect(transport, 5, p_sig, 0)

js = obj("js infinite-drummer.js", 30, 250, 140, 1, 2, ["", ""],
         saved_object_attributes={"filename": "infinite-drummer.js", "parameter_enable": 0})
connect(trig, 0, js, 0)
connect(p_ticks, 0, js, 0)
connect(p_sig, 0, js, 0)

comment("engine emits \"note vel delayMs\"; pipe holds the note for that long", 30, 285, 380)
pipe = obj("pipe 0 0 0", 30, 315, 80, 3, 2, ["int", "int"])
connect(js, 0, pipe, 0)
pack = obj("pack 0 0", 30, 350, 60, 2, 1, [""])
connect(pipe, 0, pack, 0)
connect(pipe, 1, pack, 1)
fmt = obj("midiformat", 30, 400, 120, 7, 1, ["int"])
connect(pack, 0, fmt, 0)
midiout = obj("midiout", 30, 440, 50, 1, 0, [])
connect(fmt, 0, midiout, 0)

comment("CC / pressure / program / bend pass straight through", 170, 375, 260)
for i in range(1, 6):
    connect(parse, i, fmt, i)

comment("readout (presentation)", 200, 250, 150)
readout = ui("message", (6, 147, 112, 17), numinlets=2, numoutlets=1, outlettype=[""],
             text="waiting for notes")
connect(js, 1, readout, 0)

add("comment", (0.0, 170.0, 133.0, 20.0), numinlets=1, numoutlets=0, hidden=1,
    fontname="Ableton Sans Medium Regular", fontsize=11.0, text="Device vertical limit")

# ---------------------------------------------------------------- UI: globals
label("INFINITE DRUMMER", (6, 3, 112, 15), size=11.0)
param("live.dial", (8, 22, 41, 48), "g_amount", "Amount", "Amount", 0, 200, 100, U_PCT)
for i, (var, text, short, lo, hi, init, unit) in enumerate(GLOBALS):
    y = 20 + i * 28
    label(text, (58, y, 60, 12), size=9.0)
    param("live.numbox", (58, y + 12, 56, BOX_H), var, text, short, lo, hi, init, unit)

# ---------------------------------------------------------------- UI: rows
for c, (key, header, short, lo, hi, unit) in enumerate(COLS):
    label(header, (GRID_X + c * COL_PITCH, 5, COL_W, 12), size=9.0)
for r, defaults in enumerate(ROWS, start=1):
    for c, (key, header, short, lo, hi, unit) in enumerate(COLS):
        rect = (GRID_X + c * COL_PITCH, GRID_Y + (r - 1) * ROW_PITCH, COL_W, BOX_H)
        param("live.numbox", rect, f"r{r}_{key}", f"R{r} {short}", short, lo, hi,
              defaults[c], unit)

comment("UI objects (shown in presentation mode)", UI_DX, 5, 260)

WIDTH = GRID_X + (len(COLS) - 1) * COL_PITCH + COL_W + 6

patcher = {
    "fileversion": 1,
    "appversion": {"major": 8, "minor": 5, "revision": 8, "architecture": "x64", "modernui": 1},
    "classnamespace": "box",
    "rect": [59.0, 106.0, 900.0, 500.0],
    "openrect": [0.0, 0.0, float(WIDTH), 169.0],
    "bglocked": 0,
    "openinpresentation": 1,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [15.0, 15.0],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "boxes": boxes,
    "lines": lines,
    "dependency_cache": [],
    "autosave": 0,
}

OUT.write_text(json.dumps({"patcher": patcher}, indent=1) + "\n")
print(f"wrote {OUT}: {len(boxes)} boxes, {len(lines)} cords, device {WIDTH}x169")
