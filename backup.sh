#!/bin/bash
#backup target directory to target space in arhive
echo enter pass where save backup arhive, for example /media/internal_disk
read Q
echo enter pass for backuping dirrectory, for example /home/my_homedir
read Z
curdate=`date '+%Y-%m-%d'`
cd $Q
#find $Z \( -name "*.doc" -o  -name "*.txt" -o -name "*.html" \) |xargs  tar -czvf $curdate.tar.gz
#tar cvf - `find $Z -name "*.doc" -o  -name "*.txt" -o -name "*.html" -print` > $curdate.tar.gz
/usr/bin/rsync -avz --include='*.jpg' --exclude='*' $Z $Q

