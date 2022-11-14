domain="https://wallpapers.com"
topics=(top anime-scenery anime-aesthetic anime-city space aesthetic)
topic=$(printf "%s\n" "${topics[@]}" | rofi -dmenu)

images=($(wget --user-agent "sth" -qO- "${domain}/${topic}" | grep "<img" | grep hd | cut -d'"' -f12))

for img in "${images[@]}"
do
  aria2c -j 25 "${domain}/${img}" -d ~/.config/wallpapers/downloads/
done

sxiv -a ~/.config/wallpapers/downloads/
