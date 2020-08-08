#!/bin/sh

for flac in /home/music/*.flac;
do
mpeg=`echo $flac | cut -f1 -d.`.mp3
cat "$flac" | flac -d -c - | lame --cbr -b 192 - - | cat - > "$mpeg"
done
