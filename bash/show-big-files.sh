#!/bin/bash
#show files on the romote server in specific dir more then entered size
echo "Enter server name"
read server_name
echo "Enter path to the dirrectory for find"
read dir_path
echo "Enter size in bytes 8Gb = 8000000000"
read size

echo "server name = $server_name"
echo "dirrectory for search $dir_path"
echo "file size = $size"

ssh $server_name "find $dir_path -type f -size +${size}c"
ssh $server_name "find $dir_path -type f -size +${size}c | wc -l"
