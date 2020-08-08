#!/bin/bash
echo "welcome to  archiver script it's archives folders and upload it to remout host"
echo "tvoya papka"
pwd
echo "soderganie foldera"
ls -la
echo "type name of the folder"
read DirName
# bash проверка существования директории
if [ -d $DirName ]; then
	echo DirName = $DirName
	cd $DirName 
	tar -czf $DirName.tar.gz ./*
	scp -i ~/.ssh/valskey-aws.pem $DirName.tar.gz root@aws.valch.name:/home/val
	rm $DirName.tar.gz
else
	echo "Directory does not exists"
fi
