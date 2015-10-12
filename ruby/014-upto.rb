1.upto(10){|i| print i, " "}
1.upto(12) { |i| print "2 x " + i.to_s + " = ", i * 2, "\n"}
1.upto(12) { |i| 1.upto(12) { |j| print i.to_s + " x " + j.to_s + " = ", i * j, "\n"}}