// Runs the Max [js] engine under node with stubbed Max globals.
//   node test/engine.test.js
"use strict";
var assert = require("assert");
var path = require("path");

var controls = {};
var out = [];
global.patcher = {
  getnamed: function (name) {
    if (!(name in controls)) return null;
    return { getvalueof: function () { return controls[name]; } };
  }
};
global.outlet = function () { out.push(Array.prototype.slice.call(arguments)); };
global.post = function () {};

var engine = require(path.join(__dirname, "..", "device", "infinite-drummer.js"));

function setup(over) {
  controls = {
    g_amount: 100, g_drift: 0, g_bars: 4, g_look: 10, g_soft: 0,
    r1_name: "", r1_note: 38, r1_jit: 0, r1_late: 5, r1_vel: 0, r1_acc: 0, r1_chance: 100,
    r2_name: "", r2_note: 42, r2_jit: 0, r2_late: 0, r2_vel: 0, r2_acc: 0, r2_chance: 100
  };
  for (var i = 3; i <= 8; i++) {
    controls["r" + i + "_name"] = "";
    controls["r" + i + "_note"] = 0;
    ["jit", "late", "vel", "acc", "chance"].forEach(function (k) { controls["r" + i + "_" + k] = 0; });
  }
  Object.keys(over || {}).forEach(function (k) { controls[k] = over[k]; });
  out = [];
  engine.reset();
  engine.ticks(0);
  engine.timesig(4, 4);
}

function notes() { return out.filter(function (m) { return m[0] !== 1; }); }
function lastReadout() { return out.filter(function (m) { return m[0] === 1; }).pop()[2]; }
function hit(note, vel) { engine.list(note, vel); return notes(); }
function close(a, b, eps) { assert.ok(Math.abs(a - b) <= (eps || 1e-6), a + " != " + b); }

var tests = {
  "matched row: late + lookahead, velocity untouched": function () {
    setup();
    var n = hit(38, 100);
    assert.deepStrictEqual(n, [[0, 38, 100, 15]]);
  },
  "note-off uses the same delay as its note-on": function () {
    setup();
    engine.list(38, 100);
    out = [];
    engine.list(38, 0);
    assert.deepStrictEqual(notes(), [[0, 38, 0, 15]]);
  },
  "unmatched note passes through delayed by lookahead only": function () {
    setup();
    assert.deepStrictEqual(hit(60, 77), [[0, 60, 77, 10]]);
    out = [];
    engine.list(60, 0);
    assert.deepStrictEqual(notes(), [[0, 60, 0, 10]]);
  },
  "chance 0 drops the hit and its note-off": function () {
    setup({ r1_chance: 0 });
    engine.list(38, 100);
    engine.list(38, 0);
    assert.deepStrictEqual(notes(), []);
  },
  "chance 100 never drops": function () {
    setup();
    for (var i = 0; i < 500; i++) engine.list(38, 100);
    assert.strictEqual(notes().length, 500);
  },
  "amount 0 removes every deviation": function () {
    setup({ g_amount: 0, r1_jit: 20, r1_vel: 30, r1_acc: 20, g_drift: 10, g_soft: 10 });
    for (var i = 0; i < 100; i++) {
      out = [];
      var n = hit(38, 100);
      assert.deepStrictEqual(n, [[0, 38, 100, 10]]);
    }
  },
  "jitter stays inside +/- jit around late, and actually varies": function () {
    setup({ r1_jit: 10 });
    var seen = {};
    for (var i = 0; i < 500; i++) {
      out = [];
      var d = hit(38, 100)[0][3];
      assert.ok(d >= 5 && d <= 25, "delay out of range: " + d);
      seen[d.toFixed(2)] = true;
    }
    assert.ok(Object.keys(seen).length > 50, "jitter is not random");
  },
  "velocity spread stays inside +/- vel and clamps to 1..127": function () {
    setup({ r1_vel: 20 });
    for (var i = 0; i < 300; i++) {
      out = [];
      var v = hit(38, 100)[0][2];
      assert.ok(v >= 80 && v <= 120, "vel out of range: " + v);
      out = [];
      assert.ok(hit(38, 127)[0][2] <= 127);
      out = [];
      assert.ok(hit(38, 1)[0][2] >= 1);
    }
  },
  "accent follows the 16th grid": function () {
    setup({ r1_acc: 10 });
    var cases = [
      [0, 115],     // bar downbeat: +10 +5 bonus
      [120, 95],    // "e"
      [240, 103],   // "&" (+2.5 rounds to 3)
      [360, 95],    // "a"
      [480, 110],   // beat 2 on the beat
      [479, 110],   // just ahead of beat 2 rounds onto it
      [1920, 115]   // bar 2 downbeat
    ];
    cases.forEach(function (c) {
      out = [];
      engine.ticks(c[0]);
      assert.strictEqual(hit(38, 100)[0][2], c[1], "ticks " + c[0]);
    });
  },
  "accent respects the time signature for the downbeat": function () {
    setup({ r1_acc: 10 });
    engine.timesig(3, 4);
    engine.ticks(1440); // bar 2 of 3/4
    assert.strictEqual(hit(38, 100)[0][2], 115);
    out = [];
    engine.ticks(1920); // beat 2 of bar 2 in 3/4
    assert.strictEqual(hit(38, 100)[0][2], 110);
  },
  "drift is a sine over Drift bars": function () {
    setup({ g_drift: 10, g_bars: 1 });
    engine.ticks(480);  // quarter cycle
    close(hit(38, 100)[0][3], 25, 1e-6);
    out = [];
    engine.ticks(1440); // three quarters
    close(hit(38, 100)[0][3], 5, 1e-6);
    out = [];
    engine.ticks(1920); // full cycle
    close(hit(38, 100)[0][3], 15, 1e-6);
  },
  "soft hits land late, hard hits early": function () {
    setup({ g_soft: 6 });
    close(hit(38, 1)[0][3], 21, 1e-6);
    out = [];
    close(hit(38, 127)[0][3], 9, 1e-6);
  },
  "delay never goes negative": function () {
    setup({ g_look: 0, r1_late: -30 });
    assert.strictEqual(hit(38, 100)[0][3], 0);
  },
  "overlapping same-note hits keep their own note-off delays": function () {
    setup();
    engine.list(38, 100);
    controls.r1_late = 20;
    engine.list(38, 100);
    out = [];
    engine.list(38, 0);
    engine.list(38, 0);
    assert.deepStrictEqual(notes(), [[0, 38, 0, 15], [0, 38, 0, 30]]);
  },
  "readout goes out outlet 1 as a set message": function () {
    setup();
    engine.list(38, 100);
    var r = out.filter(function (m) { return m[0] === 1; });
    assert.strictEqual(r.length, 1);
    assert.strictEqual(r[0][1], "set");
    assert.ok(/^SD/.test(r[0][2]), r[0][2]);
  },
  "readout uses the row's name when it has one": function () {
    setup({ r1_name: "Snare" });
    engine.list(38, 100);
    assert.ok(/^Snare  /.test(lastReadout()), lastReadout());
    setup({ r1_name: "Snare", r1_chance: 0 });
    engine.list(38, 100);
    assert.strictEqual(lastReadout(), "Snare  skipped");
  },
  "multi-word names arrive as a list and are joined": function () {
    setup({ r1_name: ["Side", "Stick"] });
    engine.list(38, 100);
    assert.ok(/^Side Stick  /.test(lastReadout()), lastReadout());
  },
  "blank name falls back to the TR-8S map, then the note number": function () {
    setup({ r1_name: "  ", r2_note: 99 });
    engine.list(38, 100);
    assert.ok(/^SD  /.test(lastReadout()), lastReadout());
    engine.list(99, 100);
    assert.ok(/^n99  /.test(lastReadout()), lastReadout());
  },
  "missing control reads as 0 instead of throwing": function () {
    setup();
    delete controls.r1_late;
    assert.deepStrictEqual(hit(38, 100), [[0, 38, 100, 10]]);
  }
};

var failed = 0;
Object.keys(tests).forEach(function (name) {
  try {
    tests[name]();
    console.log("ok   " + name);
  } catch (e) {
    failed++;
    console.log("FAIL " + name + "\n     " + (e.message || e));
  }
});
console.log(failed ? failed + " failed" : "all " + Object.keys(tests).length + " passed");
process.exit(failed ? 1 : 0);
