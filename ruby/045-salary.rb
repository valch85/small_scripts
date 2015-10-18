print "How mach will you give: "
x = gets.to_f
print "How many month will you give: "
n = gets.to_i

1.upto(n) do |mm|
  puts "Founds for #{mm} month: " + (x * mm).to_s
end