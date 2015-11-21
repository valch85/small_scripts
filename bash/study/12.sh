#!/bin/bash
read number
if ((number <= 0)); then
	echo -1
	exit
fi

if [ $number -eq $((number/2*2)) ]; then 
for ((number; number >= 0; number-=2)); do
		echo $number
	done
else 
	for ((number--; number >= 0; number-=2)); do
		echo $number
	done
fi
