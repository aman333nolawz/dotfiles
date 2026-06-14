#!/bin/sh

# yt-music() {
#   dir=$(pwd)
# 	cd ~/Music/
# 	ytfzf -tdmfs
# 	# if [ $? -eq 0 ];
# 	# then
# 	# 	for opus_file in ~/Music/*.opus;
# 	# 	do
# 	# 		ffmpeg -i $opus_file "${opus_file%.*}.mp3" && rm $opus_file
# 	# 	done
# 	#
# 	# 	for webm_file in ~/Music/*.webm;
# 	# 	do
# 	# 		ffmpeg -i $webm_file "${webm_file%.*}.mp3" && rm $webm_file
# 	# 	done
# 	# fi
#   cd $dir
# }
ytmusic() {
    yt-dlp \
        "ytsearch1:$*" \
        -x \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --embed-metadata \
        --parse-metadata "%(artist|uploader)s:%(artist)s" \
        --output "%(title)s.%(ext)s" \
        --ppa "EmbedThumbnail+ffmpeg_o:-c:v mjpeg -id3v2_version 3" \
        --convert-thumbnails jpg
}
