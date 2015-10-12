#!/bin/bash
#^n i mean number; ^p i mean variable
read number1; read number2; read number3; read number4;
if (($number1 >= $number2)); then
	max=$number1
else
	max=$number2
fi
if (($max >= $number3)); then
	max=$max 
else
	max=$number3
fi
if (($max >= $number4)); then
	echo $max
else
	echo $number4
fi
exit
