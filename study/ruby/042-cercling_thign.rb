$e = 1.to_i

def slee
  sleep 0.05
end

while $e < 100.to_i do
print "\r"
print '/'
slee
print "\r"
print '-'
slee
print "\r"
print '\\'
slee
$e += 1
end

