print "Put A "
a = gets.to_f
print "Put B "
b = gets.to_f
print "What should we do (+ - * /)? "
sign = gets.strip

if sign == "/" && b == 0
  puts"you can not divide by 0"
  exit
end
if sign == "+"
  rezult = a+b
end
if sign == "-"
  rezult = a-b
end
if sign == "*"
  rezult = a*b
end
if sign == "/"
  rezult = a/b
end



print "Rezult #{rezult}"
