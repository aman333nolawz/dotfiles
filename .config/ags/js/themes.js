/**
 * A Theme is a set of options that will be applied
 * ontop of the default values. see options.js for possible options
 */
import { Theme, WP, lightColors } from './settings/theme.js';

export default [
  Theme({
    name: "Mocha",
    icon: '󰄛',
    "spacing": 9,
    "padding": 8,
    "radii": 5,
    "popover_padding_multiplier": 1,
    "color.red": "#f38ba8",
    "color.green": "#a6e3a1",
    "color.yellow": "#f9e2af",
    "color.blue": "#b4befe",
    "color.magenta": "#f5c2e7",
    "color.teal": "#94e2d5",
    "color.orange": "#fab387",
    "theme.scheme": "dark",
    "theme.bg": "#1e1e2e",
    "theme.fg": "#cdd6f4",
    "theme.accent.accent": "$blue",
    "theme.accent.fg": "#313244",
    "theme.accent.gradient": "to right, $accent, lighten($accent, 6%)",
    "theme.widget.bg": "$fg-color",
    "theme.widget.opacity": 94,
    "border.color": "$fg-color",
    "border.opacity": 100,
    "border.width": 2,
    "hypr.inactive_border": "#585b70",
    "hypr.wm_gaps_multiplier": 1,
    "font.font": "Noto Sans 10",
    "font.mono": "FiraCode Nerd Font",
    "font.size": 12,
    "applauncher.width": 500,
    "applauncher.height": 360,
    "applauncher.icon_size": 35,
    "bar.position": "top",
    "bar.style": "normal",
    "bar.flat_buttons": false,
    "bar.separators": true,
    "bar.icon": "distro-icon",
    "battery.bar.width": 70,
    "battery.bar.height": 14,
    "battery.low": 30,
    "battery.medium": 50,
    "desktop.wallpaper.fg": "#fff",
    "desktop.wallpaper.img": "/home/nolawz/.config/wallpapers/mushrooms.jpeg",
    "desktop.avatar": "/home/nolawz/Pictures/nolawz.png",
    "desktop.screen_corners": true,
    "desktop.clock.enable": true,
    "desktop.clock.position": "center center",
    "desktop.drop_shadow": true,
    "desktop.shadow": "rgba(0, 0, 0, .6)",
    "desktop.dock.icon_size": 20,
    "desktop.dock.pinned_apps": [
      "firefox",
      "spotify"
    ],
    "notifications.black_list": [
      "Spotify"
    ],
    "notifications.position": [
      "top"
    ],
    "notifications.width": 450,
    "dashboard.sys_info_size": 70,
    "mpris.black_list": [
      "Caprine"
    ],
    "mpris.preferred": "spotify",
    "workspaces": 7
  })

];
