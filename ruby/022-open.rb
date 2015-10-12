file = File.open("017-bmi.rb")
file.each {|line| print "#{file.lineno}. ", line}
file.close