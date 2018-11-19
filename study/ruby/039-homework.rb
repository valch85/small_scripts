puts "Enter X "
x = gets.to_i
puts "Enter string: "
y = gets.chomp
z = x

puts "\n"
puts "with while loop"
while z > 0 do
  print y
  z -=1
end

puts "\n\n"
puts "with .*"
puts y.to_s * x

puts "\n\n"
puts "with .times"
x.times {print y}
puts "\n\n"

10.times {|i| puts "i = #{i} chetnoe: #{i.even?}"}