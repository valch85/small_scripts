#!/usr/bin/env python

import sys, re, datetime
from subprocess import Popen, PIPE

now = datetime.datetime.now()
now = now.strftime("%d-%m")

unrestarted = []

perl_script = Popen(["/usr/local/bin/listInstances", "-s"], stdout=PIPE, stderr=PIPE)
out, ett = perl_script.communicate()
data = out.decode('utf-8')
#print type(data)
#import pdb
#pdb.set_trace()
data_by_line = data.split('\n')
print type(data_by_line)
for item in data_by_line[3:-1]:
#  item = re.sub(' +', ' ',item)
  item = item.split(' ')
  item = [i.strip('').encode('utf-8') for i in item if i != '']
#  myarray = numpy.asarray(item)
  myarray = item
  name = item[0]
  name = name[1:]
  date = item[-4]
  last = item[-1]
  exclude_list = re.search('cxlookup', name, re.I)
  if not exclude_list and date != now:
    unrestarted.append(name)

  #print name, "====", date
  #print len(myarray)

#print unrestarted

if not unrestarted:
  print("No unrestarted servers")
  sys.exit(0)
else:
  print(unrestarted)
  sys.exit(2)


