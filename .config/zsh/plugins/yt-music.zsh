#!/bin/sh

yt-music() {
  dir=$(pwd)
	cd ~/Music/
  url=$(ytfzf -L)
  yt-dlp --embed-metadata --embed-chapters --embed-thumbnail --audio-format mp3 -x --default-search "ytsearch" "$url"
	# if [ $? -eq 0 ];
	# then
	# 	for opus_file in ~/Music/*.opus;
	# 	do
	# 		ffmpeg -i $opus_file "${opus_file%.*}.mp3" && rm $opus_file
	# 	done
	#
	# 	for webm_file in ~/Music/*.webm;
	# 	do
	# 		ffmpeg -i $webm_file "${webm_file%.*}.mp3" && rm $webm_file
	# 	done
	# fi
  cd $dir
}
