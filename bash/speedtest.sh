#!/bin/bash
#check dowload speed from different amazon S3 buckets
#create backets & files in zones that you need
set -e

echo "Speedtest with Amazon S3 buckets started, it could take up to 10 minutes"
#check internet connection
sh -c 'ping -c 1 google.com > /dev/null 2>&1'
if [[ $? = 0 ]]; then
	echo "Internet is connected"
	echo -ne '#                     (0%)\r'

#from n.virginia us-east (bucket grammarlyspeeduseast)
	speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.amazonaws.com/speednvirginia/download1mb)
	speed1m=$( printf "%.0f" $speed1 )
		echo -ne '##                    (5%)\r'
		if [[ $speed1m -gt 1000000 ]]; then
			#bolshe 1Mb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.amazonaws.com/speednvirginia/download100mb)
			speed1m=$( printf "%.0f" $speed1 )
		elif [[ $speed1m -gt 20000 ]]; then
			#bolshe 20Kb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.amazonaws.com/speednvirginia/download10mb)
			speed1m=$( printf "%.0f" $speed1 )
		else 
			#menshe 20Kb/s
			z=1
		fi
	y=1048576
	speed_mb_nvirginia=$(awk "BEGIN {printf \"%.4f\",${speed1m}/${y}}")
	echo -ne '#####                 (20%)\r'


#from irland eu-west (bucket grammarlyspeedirland)
	speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download1mb)
	speed1m=$( printf "%.0f" $speed1 )
	echo -ne '######                (25%)\r'
		if [[ $speed1m -gt 1000000 ]]; then
			#bolshe 1Mb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download100mb)
			speed1m=$( printf "%.0f" $speed1 )
		elif [[ $speed1m -gt 20000 ]]; then
			#bolshe 20Kb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download10mb)
			speed1m=$( printf "%.0f" $speed1 )
		else 
			#menshe 20Kb/s
			z=1
		fi
	y=1048576
	speed_mb_irland=$(awk "BEGIN {printf \"%.4f\",${speed1m}/${y}}")
	echo -ne '#########             (40%)\r'


#from oregon us-west (bucket grammarlyspeedoregon)
	speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download1mb)
	speed1m=$( printf "%.0f" $speed1 )
	echo -ne '##########            (45%)\r'
		if [[ $speed1m -gt 1000000 ]]; then
			#bolshe 1Mb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download100mb)
			speed1m=$( printf "%.0f" $speed1 )
		elif [[ $speed1m -gt 20000 ]]; then
			#bolshe 20Kb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-eu-west-1.amazonaws.com/speedirland/download10mb)
			speed1m=$( printf "%.0f" $speed1 )
		else 
			#menshe 20Kb/s
			z=1
		fi
	y=1048576
	speed_mb_oregon=$(awk "BEGIN {printf \"%.4f\",${speed1m}/${y}}")
	echo -ne '#############         (60%)\r'


#from frankfurt eu-central (bucket grammarlyspeedfrankfurt)
	speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.eu-central-1.amazonaws.com/speedfrankfurt/download1mb)
	speed1m=$( printf "%.0f" $speed1 )
	echo -ne '##############        (65%)\r'
		if [[ $speed1m -gt 1000000 ]]; then
			#bolshe 1Mb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.eu-central-1.amazonaws.com/speedfrankfurt/download100mb)
			speed1m=$( printf "%.0f" $speed1 )
		elif [[ $speed1m -gt 20000 ]]; then
			#bolshe 20Kb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3.eu-central-1.amazonaws.com/speedfrankfurt/download10mb)
			speed1m=$( printf "%.0f" $speed1 )
		else 
			#menshe 20Kb/s
			z=1
		fi
	y=1048576
	speed_mb_frankfurt=$(awk "BEGIN {printf \"%.4f\",${speed1m}/${y}}")
	echo -ne '#################     (80%)\r'


#from tokyo ap-northeast (bucket grammarlyspeedtokyo)
	speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-ap-northeast-1.amazonaws.com/speedtokyo/download1mb)
	speed1m=$( printf "%.0f" $speed1 )
	echo -ne '##################    (85%)\r'
		if [[ $speed1m -gt 1000000 ]]; then
			#bolshe 1Mb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-ap-northeast-1.amazonaws.com/speedtokyo/download100mb)
			speed1m=$( printf "%.0f" $speed1 )
		elif [[ $speed1m -gt 20000 ]]; then
			#bolshe 20Kb/s
			speed1=$(curl --silent -w %{speed_download} -o /dev/null https://s3-ap-northeast-1.amazonaws.com/speedtokyo/download10mb)
			speed1m=$( printf "%.0f" $speed1 )
		else 
			#menshe 20Kb/s
			z=1
		fi
	y=1048576
	speed_mb_tokyo=$(awk "BEGIN {printf \"%.4f\",${speed1m}/${y}}")
	echo -ne '##################### (100%)\r'

	echo -ne '\n'

	echo ""
	echo 'N.Virginia (us-east)  ' "$speed_mb_nvirginia" Mb/s
	echo 'Irland (eu-west)      ' "$speed_mb_irland" Mb/s	
	echo 'Oregon (us-west)      ' "$speed_mb_oregon" Mb/s
	echo 'Frankfurt (eu-central)' "$speed_mb_frankfurt" Mb/s
	echo 'Tokyo (ap-northeast)  ' "$speed_mb_tokyo" Mb/s

else 
	echo "!!!!!!!!! No Internet connection !!!!!!!!!"	
fi
