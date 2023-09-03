#!/bin/sh

theme=$(printf "\n\n" | rofi -dmenu -p "Theme" -l 2 -theme ~/.config/rofi/config/screenshot.rasi -theme-str 'window {width: 185px;} textbox-prompt-colon {str: "󰔎";}')
flavor="Mocha"

if [[ "$theme" == "" ]]
then
  flavor="Mocha"
elif [[ "$theme" == "" ]]
then
  flavor="Latte"
else
  exit
fi

gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-${flavor}"
ln -sf ~/.config/rofi/config/themes/$flavor.rasi ~/.config/rofi/config/colors.rasi
ln -sf ~/.config/kitty/themes/$flavor.conf ~/.config/kitty/current-theme.conf
ln -sf ~/.config/waybar/themes/$flavor.css ~/.config/waybar/theme.css
ln -sf ~/.config/zathura/themes/${flavor} ~/.config/zathura/zathurarc

sed -i "s/catppuccin-flavor '[^)]*/catppuccin-flavor '${flavor,,}/g" ~/.config/emacs/init.el
echo "vim.cmd.colorscheme \"catppuccin-${flavor,,}\"" >> ~/.config/nvim/lua/options.lua

killall waybar; waybar&
