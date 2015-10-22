$mainarr = []

def additem
  smallarr = []
  print "Enter name to add: "
  name = gets.strip.capitalize
  print "Enter age to add: "
  age = gets.strip.to_i

  smallarr << name << age
  $mainarr << smallarr
end

def printitem
  x = 0
  $mainarr.each do |man|
    x = x + 1
    #puts "#{x} " + "#{man.join " "}"
    puts "#{x} #{man[0]} #{man[1]}"
  end
end

def deleteitem
  puts "Who u whant to delete (number)?"
  answer = gets.chomp.to_i - 1
  $mainarr.delete_at answer
end


loop do
print "What you whant to do additem/deleteitem (A/D/Q)?"
  answer_main = gets.strip.capitalize
  if answer_main == "A"
    additem
  elsif answer_main == "D"
    deleteitem
  elsif answer_main == "Q"
    exit
  end

printitem

end



