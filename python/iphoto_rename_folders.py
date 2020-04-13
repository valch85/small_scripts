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
    day = re.search('[a-zA-Z0-9_ ]*,\s(\d{1,2}).*', dir_name).group(1)
    if len(str(day)) == 1:
        day = "0"+str(day)
    month_letter = re.search('January|February|March|April|May|June|July|August|September|October|November|December', dir_name).group(0)
    month_digit = list(calendar.month_abbr).index(month_letter[:3])
    if len(str(month_digit)) == 1:
        month_digit = "0"+str(month_digit)

    year = re.search('\d+$', dir_name).group(0)
    date = str(year)+'-'+str(month_digit)+'-'+str(day)
    return date

# path to dirrectory
folder_path = sys.argv[1]

onlydir = [f for f in listdir(folder_path) if isdir(join(folder_path, f))]
print(onlydir)


for i in onlydir:
    rename(i)






