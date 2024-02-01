#!/bin/bash
#backup target directory to target space in arhive

echo enter pass where save backup arhive, for example /media/internal_disk
read Q
echo enter pass for backuping dirrectory, for example /home/my_homedir
read Z
curdate=`date '+%Y-%m-%d'`
cd $Q
#tar -cvzf $curdate.tar.gz
find $Z |xargs  tar -czvf $curdate.tar.gz
