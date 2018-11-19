#!/bin/bash
read number
if ((number <= 0)); then
	echo -1
exit
fi
for ((number; number >= 0; number--)); do
	echo $number
done
