#!/usr/bin/env python3
# the script that rename folders after iPhoto export
# "Place, 24 April 2020" -> "2020-04-24 Place"
import sys
import re
import calendar
from pathlib import Path
from os import listdir
from os.path import isdir, join

def rename(dir_name):
    #data_file = Path('dirname')
    #get_loc(dir_name)
    get_date(dir_name)
    #data_file.rename('data.txt')

def get_loc(dir_name):
    location = re.search('^.+?(?=,)', dir_name).group(0)
    return location

def get_date(dir_name):
    day = re.search('[a-zA-Z0-9_ ]*,\s(\d{1,2}).*', dir_name).group(0)
    month = re.search('January|February|March|April|May|June|July|August|September|October|November|December', dir_name).group(0)
    year = re.search('\d+$', dir_name).group(0)
    print('day = ' +str(day) + ' month = ' +str(month) + ' year = ' +str(year))

# path to dirrectory
folder_path = sys.argv[1]

onlydir = [f for f in listdir(folder_path) if isdir(join(folder_path, f))]
print(onlydir)


for i in onlydir:
    rename(i)






