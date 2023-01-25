#!/usr/local/bin/bash

mkdir ./temp/

for file in ./*.srt;
do
    base_filename=${file%.*}
    yes | ffmpeg -i "${base_filename}.mp4" -i "${base_filename}.srt" -c copy -c:s mov_text -metadata:s:s:0 language=eng "${base_filename}-temp.mp4"

    mv "${base_filename}.mp4" ./temp/
    mv "${base_filename}.srt" ./temp/
    mv "${base_filename}-temp.mp4" "${base_filename}.mp4"
done
