{
 "patcher": {
  "fileversion": 1,
  "appversion": {
   "major": 8,
   "minor": 5,
   "revision": 8,
   "architecture": "x64",
   "modernui": 1
  },
  "classnamespace": "box",
  "rect": [
   59.0,
   106.0,
   900.0,
   500.0
  ],
  "openrect": [
   0.0,
   0.0,
   516.0,
   169.0
  ],
  "bglocked": 0,
  "openinpresentation": 1,
  "default_fontsize": 12.0,
  "default_fontface": 0,
  "default_fontname": "Arial",
  "gridonopen": 1,
  "gridsize": [
   15.0,
   15.0
  ],
  "gridsnaponopen": 1,
  "objectsnaponopen": 1,
  "statusbarvisible": 2,
  "toolbarvisible": 1,
  "boxes": [
   {
    "box": {
     "id": "obj-1",
     "maxclass": "comment",
     "patching_rect": [
      30.0,
      10.0,
      260.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "MIDI from Live -> split notes from everything else"
    }
   },
   {
    "box": {
     "id": "obj-2",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      40.0,
      45.0,
      22.0
     ],
     "text": "midiin",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-3",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      75.0,
      120.0,
      22.0
     ],
     "text": "midiparse",
     "numinlets": 1,
     "numoutlets": 8,
     "outlettype": [
      "",
      "",
      "",
      "int",
      "int",
      "int",
      "int",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-4",
     "maxclass": "comment",
     "patching_rect": [
      30.0,
      110.0,
      420.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "bang the transport first (right outlet), then hand the note to the engine"
    }
   },
   {
    "box": {
     "id": "obj-5",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      140.0,
      40.0,
      22.0
     ],
     "text": "t l b",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "bang"
     ]
    }
   },
   {
    "box": {
     "id": "obj-6",
     "maxclass": "newobj",
     "patching_rect": [
      150.0,
      175.0,
      220.0,
      22.0
     ],
     "text": "transport",
     "numinlets": 1,
     "numoutlets": 9,
     "outlettype": [
      "int",
      "int",
      "float",
      "float",
      "float",
      "",
      "int",
      "float",
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-7",
     "maxclass": "newobj",
     "patching_rect": [
      250.0,
      210.0,
      85.0,
      22.0
     ],
     "text": "prepend ticks",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-8",
     "maxclass": "newobj",
     "patching_rect": [
      150.0,
      210.0,
      95.0,
      22.0
     ],
     "text": "prepend timesig",
     "numinlets": 1,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-9",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      250.0,
      140.0,
      22.0
     ],
     "text": "js infinite-drummer.js",
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      ""
     ],
     "saved_object_attributes": {
      "filename": "infinite-drummer.js",
      "parameter_enable": 0
     }
    }
   },
   {
    "box": {
     "id": "obj-10",
     "maxclass": "comment",
     "patching_rect": [
      30.0,
      285.0,
      380.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "engine emits \"note vel delayMs\"; pipe holds the note for that long"
    }
   },
   {
    "box": {
     "id": "obj-11",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      315.0,
      80.0,
      22.0
     ],
     "text": "pipe 0 0 0",
     "numinlets": 3,
     "numoutlets": 2,
     "outlettype": [
      "int",
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-12",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      350.0,
      60.0,
      22.0
     ],
     "text": "pack 0 0",
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ]
    }
   },
   {
    "box": {
     "id": "obj-13",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      400.0,
      120.0,
      22.0
     ],
     "text": "midiformat",
     "numinlets": 7,
     "numoutlets": 1,
     "outlettype": [
      "int"
     ]
    }
   },
   {
    "box": {
     "id": "obj-14",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      440.0,
      50.0,
      22.0
     ],
     "text": "midiout",
     "numinlets": 1,
     "numoutlets": 0,
     "outlettype": []
    }
   },
   {
    "box": {
     "id": "obj-15",
     "maxclass": "comment",
     "patching_rect": [
      170.0,
      375.0,
      260.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "CC / pressure / program / bend pass straight through"
    }
   },
   {
    "box": {
     "id": "obj-16",
     "maxclass": "comment",
     "patching_rect": [
      200.0,
      250.0,
      150.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "readout (presentation)"
    }
   },
   {
    "box": {
     "id": "obj-17",
     "maxclass": "message",
     "patching_rect": [
      426.0,
      177.0,
      112.0,
      17.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      147.0,
      112.0,
      17.0
     ],
     "numinlets": 2,
     "numoutlets": 1,
     "outlettype": [
      ""
     ],
     "text": "waiting for notes"
    }
   },
   {
    "box": {
     "id": "obj-18",
     "maxclass": "comment",
     "patching_rect": [
      0.0,
      170.0,
      133.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "hidden": 1,
     "fontname": "Ableton Sans Medium Regular",
     "fontsize": 11.0,
     "text": "Device vertical limit"
    }
   },
   {
    "box": {
     "id": "obj-19",
     "maxclass": "live.comment",
     "patching_rect": [
      426.0,
      33.0,
      112.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      6.0,
      3.0,
      112.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "INFINITE DRUMMER",
     "fontsize": 11.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-20",
     "maxclass": "live.dial",
     "patching_rect": [
      428.0,
      52.0,
      41.0,
      48.0
     ],
     "presentation": 1,
     "presentation_rect": [
      8.0,
      22.0,
      41.0,
      48.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "g_amount",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Amount",
       "parameter_shortname": "Amount",
       "parameter_mmin": 0.0,
       "parameter_mmax": 200.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-21",
     "maxclass": "live.comment",
     "patching_rect": [
      478.0,
      50.0,
      60.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      20.0,
      60.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Drift",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-22",
     "maxclass": "live.numbox",
     "patching_rect": [
      478.0,
      62.0,
      56.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      32.0,
      56.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "g_drift",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Drift",
       "parameter_shortname": "Drift",
       "parameter_mmin": 0.0,
       "parameter_mmax": 20.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-23",
     "maxclass": "live.comment",
     "patching_rect": [
      478.0,
      78.0,
      60.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      48.0,
      60.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Drift bars",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-24",
     "maxclass": "live.numbox",
     "patching_rect": [
      478.0,
      90.0,
      56.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      60.0,
      56.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "g_bars",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        8
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Drift bars",
       "parameter_shortname": "Bars",
       "parameter_mmin": 1.0,
       "parameter_mmax": 32.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-25",
     "maxclass": "live.comment",
     "patching_rect": [
      478.0,
      106.0,
      60.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      76.0,
      60.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Lookahead",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-26",
     "maxclass": "live.numbox",
     "patching_rect": [
      478.0,
      118.0,
      56.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      88.0,
      56.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "g_look",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Lookahead",
       "parameter_shortname": "Look",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-27",
     "maxclass": "live.comment",
     "patching_rect": [
      478.0,
      134.0,
      60.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      104.0,
      60.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Soft = late",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-28",
     "maxclass": "live.numbox",
     "patching_rect": [
      478.0,
      146.0,
      56.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      58.0,
      116.0,
      56.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "g_soft",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "Soft = late",
       "parameter_shortname": "Soft",
       "parameter_mmin": 0.0,
       "parameter_mmax": 10.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-29",
     "maxclass": "comment",
     "patching_rect": [
      30.0,
      480.0,
      560.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "row names: textedit in presentation, pattr (Blob parameter) saves the text with the Live set"
    }
   },
   {
    "box": {
     "id": "obj-30",
     "maxclass": "live.comment",
     "patching_rect": [
      546.0,
      35.0,
      60.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      5.0,
      60.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Name",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-31",
     "maxclass": "live.comment",
     "patching_rect": [
      610.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Note",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-32",
     "maxclass": "live.comment",
     "patching_rect": [
      664.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Jitter",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-33",
     "maxclass": "live.comment",
     "patching_rect": [
      718.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Late",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-34",
     "maxclass": "live.comment",
     "patching_rect": [
      772.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Vel \u00b1",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-35",
     "maxclass": "live.comment",
     "patching_rect": [
      826.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Accent",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-36",
     "maxclass": "live.comment",
     "patching_rect": [
      880.0,
      35.0,
      50.0,
      12.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      5.0,
      50.0,
      12.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "Chance",
     "fontsize": 9.0,
     "textjustification": 0
    }
   },
   {
    "box": {
     "id": "obj-37",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      50.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      20.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r1_name",
     "text": "BD",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-38",
     "maxclass": "newobj",
     "patching_rect": [
      30.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r1_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "BD"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-39",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        36
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-40",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-41",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-42",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-43",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-44",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      50.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      20.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r1_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R1 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-45",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      67.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      37.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r2_name",
     "text": "SD",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-46",
     "maxclass": "newobj",
     "patching_rect": [
      135.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r2_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "SD"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-47",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        38
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-48",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        5
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-49",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-50",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        10
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-51",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-52",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      67.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      37.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r2_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R2 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-53",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      84.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      54.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r3_name",
     "text": "CH",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-54",
     "maxclass": "newobj",
     "patching_rect": [
      240.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r3_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "CH"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-55",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        42
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-56",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        8
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-57",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        0
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-58",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        18
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-59",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        10
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-60",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      84.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      54.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r3_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R3 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-61",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      101.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      71.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r4_name",
     "text": "OH",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-62",
     "maxclass": "newobj",
     "patching_rect": [
      345.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r4_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "OH"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-63",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        46
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-64",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        8
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-65",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        3
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-66",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        14
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-67",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-68",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      101.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      71.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r4_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R4 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-69",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      118.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      88.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r5_name",
     "text": "RS",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-70",
     "maxclass": "newobj",
     "patching_rect": [
      450.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r5_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "RS"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-71",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        37
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-72",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-73",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-74",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        12
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-75",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-76",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      118.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      88.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r5_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R5 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-77",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      135.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      105.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r6_name",
     "text": "HC",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-78",
     "maxclass": "newobj",
     "patching_rect": [
      555.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r6_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "HC"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-79",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        39
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-80",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-81",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-82",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        8
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-83",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-84",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      135.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      105.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r6_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R6 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-85",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      152.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      122.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r7_name",
     "text": "LT",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-86",
     "maxclass": "newobj",
     "patching_rect": [
      660.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r7_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "LT"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-87",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        43
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-88",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-89",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-90",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        12
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-91",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-92",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      152.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      122.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r7_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R7 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-93",
     "maxclass": "textedit",
     "patching_rect": [
      546.0,
      169.0,
      60.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      126.0,
      139.0,
      60.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 4,
     "outlettype": [
      "",
      "int",
      "",
      ""
     ],
     "varname": "r8_name",
     "text": "MT",
     "fontsize": 9.0
    }
   },
   {
    "box": {
     "id": "obj-94",
     "maxclass": "newobj",
     "patching_rect": [
      765.0,
      510.0,
      100.0,
      22.0
     ],
     "text": "pattr r8_name_store",
     "numinlets": 1,
     "numoutlets": 3,
     "outlettype": [
      "",
      "",
      ""
     ],
     "parameter_enable": 1,
     "saved_object_attributes": {
      "parameter_enable": 1,
      "parameter_mappable": 0
     },
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        "MT"
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Name",
       "parameter_shortname": "Name",
       "parameter_type": 3
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-95",
     "maxclass": "live.numbox",
     "patching_rect": [
      610.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      190.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_note",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        47
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Note",
       "parameter_shortname": "Note",
       "parameter_mmin": 0.0,
       "parameter_mmax": 127.0,
       "parameter_type": 1,
       "parameter_unitstyle": 8
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-96",
     "maxclass": "live.numbox",
     "patching_rect": [
      664.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      244.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_jit",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        6
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Jitter",
       "parameter_shortname": "Jitter",
       "parameter_mmin": 0.0,
       "parameter_mmax": 50.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-97",
     "maxclass": "live.numbox",
     "patching_rect": [
      718.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      298.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_late",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        2
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Late",
       "parameter_shortname": "Late",
       "parameter_mmin": -30.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 2
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-98",
     "maxclass": "live.numbox",
     "patching_rect": [
      772.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      352.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_vel",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        12
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Vel",
       "parameter_shortname": "Vel",
       "parameter_mmin": 0.0,
       "parameter_mmax": 64.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-99",
     "maxclass": "live.numbox",
     "patching_rect": [
      826.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      406.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_acc",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        4
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Accent",
       "parameter_shortname": "Accent",
       "parameter_mmin": 0.0,
       "parameter_mmax": 30.0,
       "parameter_type": 1,
       "parameter_unitstyle": 0
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-100",
     "maxclass": "live.numbox",
     "patching_rect": [
      880.0,
      169.0,
      50.0,
      15.0
     ],
     "presentation": 1,
     "presentation_rect": [
      460.0,
      139.0,
      50.0,
      15.0
     ],
     "numinlets": 1,
     "numoutlets": 2,
     "outlettype": [
      "",
      "float"
     ],
     "parameter_enable": 1,
     "varname": "r8_chance",
     "saved_attribute_attributes": {
      "valueof": {
       "parameter_initial": [
        100
       ],
       "parameter_initial_enable": 1,
       "parameter_longname": "R8 Chance",
       "parameter_shortname": "Chance",
       "parameter_mmin": 0.0,
       "parameter_mmax": 100.0,
       "parameter_type": 1,
       "parameter_unitstyle": 5
      }
     }
    }
   },
   {
    "box": {
     "id": "obj-101",
     "maxclass": "comment",
     "patching_rect": [
      420.0,
      5.0,
      260.0,
      20.0
     ],
     "numinlets": 1,
     "numoutlets": 0,
     "text": "UI objects (shown in presentation mode)"
    }
   }
  ],
  "lines": [
   {
    "patchline": {
     "source": [
      "obj-2",
      0
     ],
     "destination": [
      "obj-3",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      0
     ],
     "destination": [
      "obj-5",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      1
     ],
     "destination": [
      "obj-6",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      7
     ],
     "destination": [
      "obj-7",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-6",
      5
     ],
     "destination": [
      "obj-8",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-5",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-7",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-8",
      0
     ],
     "destination": [
      "obj-9",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      0
     ],
     "destination": [
      "obj-11",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      0
     ],
     "destination": [
      "obj-12",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-11",
      1
     ],
     "destination": [
      "obj-12",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-12",
      0
     ],
     "destination": [
      "obj-13",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-13",
      0
     ],
     "destination": [
      "obj-14",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      1
     ],
     "destination": [
      "obj-13",
      1
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      2
     ],
     "destination": [
      "obj-13",
      2
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      3
     ],
     "destination": [
      "obj-13",
      3
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      4
     ],
     "destination": [
      "obj-13",
      4
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-3",
      5
     ],
     "destination": [
      "obj-13",
      5
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-9",
      1
     ],
     "destination": [
      "obj-17",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-38",
      1
     ],
     "destination": [
      "obj-37",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-46",
      1
     ],
     "destination": [
      "obj-45",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-54",
      1
     ],
     "destination": [
      "obj-53",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-62",
      1
     ],
     "destination": [
      "obj-61",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-70",
      1
     ],
     "destination": [
      "obj-69",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-78",
      1
     ],
     "destination": [
      "obj-77",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-86",
      1
     ],
     "destination": [
      "obj-85",
      0
     ]
    }
   },
   {
    "patchline": {
     "source": [
      "obj-94",
      1
     ],
     "destination": [
      "obj-93",
      0
     ]
    }
   }
  ],
  "dependency_cache": [],
  "autosave": 0
 }
}
