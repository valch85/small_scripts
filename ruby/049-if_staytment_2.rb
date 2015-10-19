print "How old are you? "
age = gets.to_i

print "Do you whana play? (Y/N)?"
status = gets.strip.capitalize

if age >=18 && status == "Y"
  puts "Her we go!!!"
else
  puts "good bay"
end