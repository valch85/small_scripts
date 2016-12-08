#!/bin/bash
list=( admin daemon nobody user root )
for a in "${list[@]}"
#for a in $list
do
	echo $a
done
