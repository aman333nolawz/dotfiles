#!/bin/sh
background='#1e1e2e'
selection='#181825'

yellow='#f9e2af'
orange='#fab387'
red='#f38ba8'
lavender='#b4befe'
cyan='#89dceb'
green='#a6e3a1'

swaylock \
  --color=$background \
  --inside-color=$selection$alpha \
  --inside-ver-color=$green$alpha \
  --inside-wrong-color=$red$alpha \
  --inside-clear-color=$orange$alpha \
  --inside-caps-lock-color=$yellow$alpha \
  --ring-color=$lavender$alpha \
  --ring-ver-color=$green$alpha \
  --ring-wrong-color=$red$alpha \
  --ring-clear-color=$orange$alpha \
  --ring-caps-lock-color=$yellow$alpha \
  --key-hl-color=$yellow$alpha \
  --bs-hl-color=$orange$alpha \
  --caps-lock-bs-hl-color=$orange$alpha \
  --caps-lock-key-hl-color=$orange$alpha \
  --separator-color=$selection$alpha \
  --text-color=$selection \
  --text-caps-lock-color=$selection \
  --indicator-idle-visible \
  --indicator-caps-lock \
  --indicator-radius=120 \
  --indicator-thickness=5 \
  --layout-bg-color=$background$alpha
