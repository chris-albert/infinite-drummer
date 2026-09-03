// infinite-drummer.js — per-instrument humanizer engine for the Infinite Drummer
// Max for Live device.
//
// Runs inside a [js] object, so this file is ES5 only (Live 11/12 bundle
// Max 8's SpiderMonkey engine — no let/const/arrows).
//
// Wiring (see infinite-drummer.maxpat):
//   [midiparse] note outlet  -> "note vel" list      -> list()
//   [transport] outlet 7     -> "ticks <abs ticks>"  -> ticks()    (480 per beat)
//   [transport] outlet 5     -> "timesig num den"    -> timesig()
//   The transport is banged right before every note, so ticks/timesig are
//   fresh when list() runs.
//   outlet 0: "note vel delayMs" -> [pipe 0 0 0] -> [pack] -> [midiformat]
//   outlet 1: "set <text>"       -> readout message box
//
// Controls are read on demand by scripting name (patcher.getnamed), so
// there is no parameter push/resync plumbing and a hot reload never leaves
// the engine holding stale values. Renaming a control's scripting name in
// Max breaks the lookup — the Max window will say which one.

autowatch = 1;
inlets = 1;
outlets = 2;

var ROWS = 8;
var TICKS_PER_16TH = 120;
var SIXTEENTHS_PER_BEAT = 4;

// Velocity accent by 16th position inside the beat, scaled by the row's
// Accent control: the beat itself is strongest, the "&" gets a touch, the
// "e" and "a" sit back. The bar's downbeat gets an extra half on top.
var GRID_WEIGHT = [1.0, -0.5, 0.25, -0.5];
var DOWNBEAT_BONUS = 0.5;

// TR-8S default note map, for the readout only.
var NOTE_NAMES = {
  36: "BD", 37: "RS", 38: "SD", 39: "HC", 42: "CH", 43: "LT",
  46: "OH", 47: "MT", 49: "CC", 50: "HT", 51: "RC"
};

var transTicks = 0;    // absolute transport position, 480 ticks per beat
var beatsPerBar = 4;
var pendingOffs = {};  // note -> queue of delays used for its note-ons (-1 = hit dropped)
var ctlCache = {};
var warned = {};

// --- transport (arrives right before each note) ---

function ticks(t) { transTicks = t; }

function timesig(num, den) {
  if (num >= 1 && num <= 32) beatsPerBar = num;
}

// --- controls ---

function ctl(name) {
  var o = ctlCache[name];
  if (!o) {
    var p = (typeof patcher !== "undefined") ? patcher : null;
    o = p ? p.getnamed(name) : null;
    if (!o) {
      if (!warned[name]) {
        warned[name] = true;
        post("infinite-drummer: no control named " + name + " (using 0)\n");
      }
      return 0;
    }
    ctlCache[name] = o;
  }
  var v = o.getvalueof();
  if (v && typeof v === "object" && v.length !== undefined) v = v[0];
  return (typeof v === "number") ? v : 0;
}

function findRow(note) {
  for (var i = 1; i <= ROWS; i++) {
    if (Math.round(ctl("r" + i + "_note")) === note) return i;
  }
  return 0;
}

// --- feel ---

function rand(lo, hi) { return lo + Math.random() * (hi - lo); }

function clamp(v, lo, hi) { return v < lo ? lo : (v > hi ? hi : v); }

function mod(a, n) { return ((a % n) + n) % n; }

// Velocity offset for the current grid position.
function accent(amount) {
  if (!amount) return 0;
  var idx16 = Math.round(transTicks / TICKS_PER_16TH);
  var sub = mod(idx16, SIXTEENTHS_PER_BEAT);
  var beat = mod(Math.floor(idx16 / SIXTEENTHS_PER_BEAT), beatsPerBar);
  var w = GRID_WEIGHT[sub];
  if (beat === 0 && sub === 0) w += DOWNBEAT_BONUS;
  return amount * w;
}

// Slow push/drag of the whole kit: a sine over "Drift bars" bars, so the
// drummer leans ahead for a while, then sits back, and it loops with the song.
function drift() {
  var depth = ctl("g_drift");
  if (!depth) return 0;
  var bars = Math.max(1, ctl("g_bars"));
  var ticksPerCycle = TICKS_PER_16TH * SIXTEENTHS_PER_BEAT * beatsPerBar * bars;
  return depth * Math.sin(2 * Math.PI * transTicks / ticksPerCycle);
}

// Soft hits land a little late, hard hits a little early — a real player's
// ghost notes drag and their rimshots dig in.
function softLate(vel) {
  var ms = ctl("g_soft");
  if (!ms) return 0;
  return ms * (64 - vel) / 63;
}

// --- notes ---

function list(note, vel) {
  note = Math.round(note);
  if (vel > 0) noteOn(note, Math.round(vel));
  else noteOff(note);
}

function noteOn(note, vel) {
  var look = ctl("g_look");
  var row = findRow(note);
  if (!row) {                       // not one of ours: pass through, still delayed by
    send(note, vel, look);          // Lookahead so it stays in time with the kit
    queueOff(note, look);
    return;
  }
  var r = "r" + row + "_";
  if (Math.random() * 100 >= ctl(r + "chance")) {
    queueOff(note, -1);
    readout(noteName(note) + "  skipped");
    return;
  }
  var amt = ctl("g_amount") / 100;
  var spread = ctl(r + "vel");
  var jit = ctl(r + "jit");

  var v = vel + amt * (rand(-spread, spread) + accent(ctl(r + "acc")));
  v = clamp(Math.round(v), 1, 127);

  var offset = amt * (ctl(r + "late") + rand(-jit, jit) + drift() + softLate(v));
  var delay = Math.max(0, look + offset);

  send(note, v, delay);
  queueOff(note, delay);
  readout(noteName(note) + "  " + signed(offset, 1) + " ms   v " + v + " (" + signed(v - vel, 0) + ")");
}

function noteOff(note) {
  var q = pendingOffs[note];
  var delay = (q && q.length) ? q.shift() : ctl("g_look");
  if (delay < 0) return;            // the note-on was dropped, so drop its off too
  send(note, 0, delay);
}

function queueOff(note, delay) {
  var q = pendingOffs[note];
  if (!q) q = pendingOffs[note] = [];
  q.push(delay);
  if (q.length > 32) q.shift();     // a stream with no note-offs must not grow forever
}

function send(note, vel, delay) {
  outlet(0, note, vel, delay);
}

// --- readout / housekeeping ---

function noteName(note) {
  return NOTE_NAMES[note] || ("n" + note);
}

function signed(x, decimals) {
  var s = x.toFixed(decimals);
  return (x >= 0 ? "+" : "") + s;
}

function readout(text) {
  outlet(1, "set", text);
}

function reset() {
  pendingOffs = {};
  ctlCache = {};
  warned = {};
}

function status() {
  post("infinite-drummer: ticks " + transTicks + " beatsPerBar " + beatsPerBar +
       " amount " + ctl("g_amount") + " look " + ctl("g_look") + "\n");
  for (var i = 1; i <= ROWS; i++) {
    var r = "r" + i + "_";
    post("  row " + i + ": note " + ctl(r + "note") + " jit " + ctl(r + "jit") +
         " late " + ctl(r + "late") + " vel " + ctl(r + "vel") + " acc " + ctl(r + "acc") +
         " chance " + ctl(r + "chance") + "\n");
  }
}

post("infinite-drummer loaded\n");

// Node test harness only — Max has no `module`.
if (typeof module !== "undefined" && module.exports) {
  module.exports = { list: list, ticks: ticks, timesig: timesig, reset: reset };
}
