#!/bin/bash
# n1 - number1; n2 - number2; n3 - number3
read n1
read n2
read n3
if [ "$n1" -ge "$n2" ] 
then
n4=$n1 
	if [ "$n3" -ge "$n4" ]
       	then
		echo $n3
	else 
		echo $n4
	fi
else 
	n5=$n2
	if [ "$n3" -ge "$n5" ] 
	then
		echo $n3 
	else 
		echo $n5
	fi

fi	
exit
