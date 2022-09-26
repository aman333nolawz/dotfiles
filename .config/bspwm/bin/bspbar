#!/usr/bin/env bash

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

CONFIG_DIR=$HOME/.config/bspwm/polybar/config.ini
polybar main -c $CONFIG_DIR &
