=begin
print "How mach will you give: "
x = gets.to_f
print "How many month will you give: "
n = gets.to_i

1.upto(n) do |mm|
  puts "Founds for #{mm} month: " + (x * mm).to_s
end
=end

print "How many years will save money: "
years = gets.strip.to_i
print "What amount will you save monthly: "
msave = gets.strip.to_f

s = 0

1.upto(years) do |n|
  1.upto(12) do |cmonth|
    s = s + msave
    puts "Year #{n}, month #{cmonth}, saved: #{s}"

  end
end
