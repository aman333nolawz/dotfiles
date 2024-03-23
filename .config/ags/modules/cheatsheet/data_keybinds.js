export const keybindList = [[
  {
    "icon": "pin_drop",
    "name": "Workspaces: navigation",
    "binds": [
      { "keys": ["", "+", "#"], "action": "Go to workspace #" },
      { "keys": ["", "+", "(Scroll ↑↓)"], "action": "Go to workspace -1/+1" },
      { "keys": ["Ctrl", "", "+", "←"], "action": "Go to workspace on the left" },
      { "keys": ["Ctrl", "", "+", "→"], "action": "Go to workspace on the right" },
      { "keys": ["", "Shift", "+", "#"], "action": "Move window to workspace #" },
      { "keys": ["", "+", "←↑→↓"], "action": "Focus window in direction" },
      { "keys": ["", "Shift", "+", "←↑→↓"], "action": "Swap window in direction" },
      { "keys": ["", "+", ";"], "action": "Split ratio -" },
      { "keys": ["", "+", "'"], "action": "Split ratio +" },
      { "keys": ["", "+", "Lmb"], "action": "Move window" },
      { "keys": ["", "+", "Rmb"], "action": "Resize window" },
      { "keys": ["", "+", "F"], "action": "Fullscreen" },
    ],
    "id": 1
  },
],
  [
    {
      "icon": "widgets",
      "name": "Widgets (AGS)",
      "binds": [
        { "keys": ["Alt", "+", "Tab"], "action": "Toggle overview/launcher" },
        { "keys": ["Ctrl", "Alt", "", "+", "R"], "action": "Restart AGS" },
        { "keys": ["", "+", "/"], "action": "Toggle this cheatsheet" },
        { "keys": ["", "+", "N"], "action": "Toggle system sidebar" },
        { "keys": ["", "+", "B"], "action": "Toggle utilities sidebar" },
        { "keys": ["", "+", "K"], "action": "Toggle virtual keyboard" },
        { "keys": ["", "+", "X"], "action": "Power/Session menu" },
      ],
      "id": 2
    },
    {
      "icon": "apps",
      "name": "Apps & Utilities",
      "binds": [
        { "keys": ["", "+", "Enter"], "action": "Launch terminal" },
        { "keys": ["", "SHIFT", "+", "W"], "action": "Launch browser" },
        { "keys": ["", "SHIFT", "+", "F"], "action": "Launch GUI file manager" },
        { "keys": ["", "+", "S"], "action": "Screenshot" },
        { "keys": ["", "+", "P"], "action": "Color picker" },
        { "keys": ["", "+", "V"], "action": "Clipboard history" },
      ],
      "id": 3
    },
  ]];
