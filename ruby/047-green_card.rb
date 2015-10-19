print "How many times will we play "
z = gets.to_i
print "your digit "
fdigit = gets.to_i

1.upto(z) do |z|
  puts "we are playing for the #{z} time "
  x = rand(1..50)
  if x == fdigit
    puts "you are the winner"
  end
end
