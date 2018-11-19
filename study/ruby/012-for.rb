for i in 1..5 do
  print i, " "
end

puts "\n"; puts "\n"
=begin
for i in 1..12
  print "2 x" + i.to_s + " = ", i *2, ",\n"
end
=end

for i in 1..12
  for j in 1..12
    print i.to_s + "x" + j.to_s + " = ", i*j, ",\n"
  end
end