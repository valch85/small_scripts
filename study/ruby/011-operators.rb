x = 256
if x == 256
  puts "x equals 256"
end

=begin
if queue
  pr = true
else
  pr = false
end
start_printer if pr # start if pr true
=end

lang = :es
if lang == :en; print "dog"
elsif lang == :es; print "perro"
elsif lang == :fp; print "chien"
elsif lang == :de; print "Hund"
else puts "No language set; default = 'dog'."
end

dog = case lang
        when :en; "dog"
        when :es; "perro"
        when :fp; "chien"
        else "dog"
      end
puts dog

lang1 = "fp"
dog1 = case lang1
        when "en"; "dog"
        when "es"; "perro"
        when "fp"; "chien"
        else "dog"
      end
puts dog1

scale = 9
case scale
  when 0; puts "lowest"
  when 1..3; puts "medium-low"
  when 4..6; puts "medium"
  when 7...9; puts "mediuh-high"
  when 10..12; puts "high"
  when 12..14; puts "highest"
  else  puts "off scale"
end

i = 0
breeds = ["quarter", "arabian", "appalosa", "paint", "provance"]
puts breeds.size
temp = []
while i < breeds.size do
  temp << breeds[i].capitalize
  i +=1
end
temp.sort!
breeds.replace(temp)
p breeds

lang2 = "en"
if lang2 == "de"
  dog = "Hund"
else
  dog = "dog"
end
puts dog

unless lang2 == "de"
  cat = "dog"
else
  cat = "Hund"
end
puts cat

age = 6
puts age +=1 unless age > 29

loop do
  print "Type something: "
  line = gets
  break if line =~ /q|Q/
  puts line
end