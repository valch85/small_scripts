print "How many friends will arrive? "
n = gets.to_i

if n < 0
  puts "May be you are wrong?"
  exit
end

if n != 0
  puts "Perfect someone will come!"
end

if n == 0
  puts "Nobody will come :("
end

if n > 0
  puts "There will be #{n} frients"
end