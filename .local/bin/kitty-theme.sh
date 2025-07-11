#!/bin/sh
theme=$(grep "include" ~/.config/kitty/hyde.conf | cut -d' ' -f 2)
if [[ "$theme" == "theme.conf" ]]; then
  sed -i -e 's/theme.conf/tokyo-night.conf/g' ~/.config/kitty/hyde.conf
else
  sed -i -e 's/tokyo-night.conf/theme.conf/g' ~/.config/kitty/hyde.conf
fi

killall -SIGUSR1 kitty
