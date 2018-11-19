print "whana play (Y/N)? "
a = gets.strip.capitalize

if a == "Y"
  puts "play"
elsif a == "N"
  puts "not play"
else
  puts "wrong answer"
end
