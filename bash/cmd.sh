#!/bin/bash
if [ -z "$1" ]; then
    echo используйте: $0 каталог
    exit
fi
SRCD=$1                      #SRCD - SouRCe Directory - исходный каталог
TGTD="/home/val/bash"         #TGTD - TarGeT Directory - конечный каталог
OF=home-$(date +%Y%m%d).tgz  #OF - Output File - выходной файл
tar -cZf $TGTD$OF $SRCD
