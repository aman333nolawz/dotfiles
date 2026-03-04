#!/bin/sh

yt-music() {
  dir=$(pwd)
	cd ~/Music/
	ytfzf -tdmfs
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
