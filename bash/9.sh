#!/bin/bash
max=0
#read max
for ((n=0; n < 9; n++ ))
do
	read number
	if (($max <= $number)); then
	max=$number
	fi
done
echo = $max
exit
