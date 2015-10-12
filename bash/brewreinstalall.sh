#!/bin/bash

for i in `brew list -l | grep -v total| awk '{print $9}'`
do
    if [[ "$i" == python.* ]] || [[ "$i" == ruby.* ]]
    then
        continue
    fi

    brew rm $i && brew install $i
done
