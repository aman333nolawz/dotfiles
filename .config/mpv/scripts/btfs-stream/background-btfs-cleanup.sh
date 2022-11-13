#!/usr/bin/env bash
script_path=$1
mount_dir=$2
# use nohup so can do in background without blocking mpv from closing
nohup "$script_path"/btfs-cleanup.sh "$mount_dir" &> /dev/null &
