export const keybindList = [[
    {
        "icon": "move_group",
        "name": "Windows",
        "binds": [
            { "keys": ["", "+", "0-9"], "action": "Go to workspace" },
            { "keys": ["", "+", "←↑→↓"], "action": "Focus window in direction" },
            { "keys": ["", "+", "Shift", "+", "←↑→↓"], "action": "Swap window in direction" },
            { "keys": ["", "+", "Shift", "+", "0-9"], "action": "Move window to workspace" },
            { "keys": ["", "+", ";"], "action": "Split ratio -" },
            { "keys": ["", "+", "'"], "action": "Split ratio +" },
            { "keys": ["", "+", "F"], "action": "Fullscreen" },
            { "keys": ["", "+", "Alt", "+", "F"], "action": "Fake fullscreen" }
        ],
        "appeartick": 1
    }
],
[
    {
        "icon": "widgets",
        "name": "Widgets (AGS)",
        "binds": [
            { "keys": ["", "+", "/"], "action": "Toggle this cheatsheet" },
            { "keys": ["", "+", "N"], "action": "Toggle system sidebar" },
            { "keys": ["", "+", "B"], "action": "Toggle utilities sidebar" },
            { "keys": ["", "+", "K"], "action": "Toggle virtual keyboard" },
            { "keys": ["Alt", "+", "Tab"], "action": "Toggle overview/launcher" },
        ],
        "appeartick": 2
    },
],
];
