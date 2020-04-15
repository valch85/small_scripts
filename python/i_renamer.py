#!/usr/bin/env python3
# the script that rename folders after iPhoto export
# "Place, 24 April 2020" -> "2020-04-24 Place"
# to use run script and provide folder path  /Users/val/Downloads/temp/ with last "/" definitely
import sys
import re
import calendar
from pathlib import Path
from os import listdir
from os.path import isdir, join


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
    location = re.search('^.+?(?=,)', dir_name).group(0)
    dir_name_new = str(date) + ' ' + str(location)
    return dir_name_new

def rename(dir_name):
    data_file = Path(folder_path + dir_name)
    data_file.rename(folder_path + str(get_date(dir_name)))

# check is the path to directory defined
if len(sys.argv) < 2:
        print('Not all variables defined')
        exit(1)
else:
    folder_path = sys.argv[1]

# get all directories name
onlydir = [f for f in listdir(folder_path) if isdir(join(folder_path, f))]
print(onlydir)

# iterate over directories
for i in onlydir:
    pattern = re.compile(
        '^.*,\s\d{1,2}\s(?:<January|February|March|April|May|June|July|August|September|October|November|December)\s\d{4}$')
    if pattern.match(i):
        rename(str(i))
    else:
        print('Dirrectory ' + i + ' is not in a iPhoto format')






