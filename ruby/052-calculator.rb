print "Put A "
a = gets.to_f
print "Put B "
b = gets.to_f
print "What should we do (+ - * /)? "
sign = gets.strip
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
