#!/bin/sh
background='#1e1e2e'
selection='#181825'

yellow='#f9e2af'
orange='#fab387'
red='#f38ba8'
lavender='#b4befe'
cyan='#89dceb'
green='#a6e3a1'

image=$(find ~/.config/wallpapers/ -type f | shuf -n1)

swaylock --daemonize \
  --image "$image" \
  --clock --timestr "%H:%M" --datestr "%d/%m/%y" \
  --effect-blur 7x5 \
  --effect-vignette 0.3:0.9 \
  --inside-color=$selection \
  --inside-ver-color=$green \
  --inside-wrong-color=$red \
  --inside-clear-color=$orange \
  --inside-caps-lock-color=$yellow \
  --ring-color=$lavender \
  --ring-ver-color=$green \
  --ring-wrong-color=$red \
  --ring-clear-color=$orange \
  --ring-caps-lock-color=$yellow \
  --key-hl-color=$yellow \
  --bs-hl-color=$orange \
  --caps-lock-bs-hl-color=$orange \
  --caps-lock-key-hl-color=$orange \
  --separator-color=$selection \
  --text-color=$lavender \
  --text-caps-lock-color=$selection \
  --indicator-idle-visible \
  --indicator-caps-lock \
  --indicator-radius=130 \
  --indicator-thickness=5 \
  --layout-bg-color=$background \
  --hide-keyboard-layout
