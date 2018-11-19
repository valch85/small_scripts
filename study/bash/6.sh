#!/bin/bash
#touch 6text
#read number1 echo > 6test
#read number2 echo > 6text
#read number3 echo > 6text
#read number4 echo > 6text
#cat 6text
#sort $number1 $number2 $number3 $number4
read n1; read n2; read n3; read n4;
if (($n1 >= $n2)); then
	p1=$n1
else
	p1=$n2
fi
if (($n3 >= $n4)); then
	p2=$n3
else
	p2=$n4
fi
if (($p1 >= $p2)); then
	echo $p1
else
	echo $p2
fi
exit
