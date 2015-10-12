title = String.new
title.empty?

title = String.new("Much Ado about Nothing")
title.length
title.size

lear = "King Lear\nA Tradgedy\nby William Shekespeare"

comedy = %!As you like it!
history = %[As you like it]
tradedy = %{As you like it}

sonnet = <<29
For years I have been driving an old used car with a lot of mileage and I hate it.
It gets me where I need to go, but I’m tired of fixing leaks and broken parts all the time.
Its annoying every times I need to take it to the mechanic.Even when they take care of everything,
I know I’ll just end up going back there in a few weeks.
29
puts sonnet

line = "A horse! a horce! my kindom for a horse!"
cite = "Act V, Scene IV"
speaker = "King Richard III"

speaker['King']
line[7] # => 33
line[7].chr  # => "!"
line[18, 23] # => "my kindom for a horse!"
cite[0..4] # => "Act V"
cite[0...4] # => "Act"
line[/horse!$/] # => "horse!"
#hay.eql? nicolay
"a" <=> "a"
"a" <=> "A"
"a" <=> "b"
"a" <=> "`"
3 <=> 4

speaker = "King Richard, 2007"
speaker[", 2007"]= " III"
p speaker
line = "A Porsche! a Porsche! my kindom for a Porsche!"
line[38,8]= "Porsche 911 Turbo!"
p line
speaker[13..15]= "the Third"
p speaker

joe = <<the_end
tra tra tra ta ta test string
123 year of 2005
next year
it is a best part of since. he said "No"
the_end
p joe
joe.chomp!
p joe
joe.chop!
p joe
number = "1234567890"
print number.reverse
puts "\n"
za = "That's alll falks".gsub "alll" , "all"
p za
zb = "That's alll falks".gsub "lll" , "ll"
p zb
p zc = "0123456789".split
zd = "0123456789".split (//)
p zd
c_w = "Garry Garryson, Albert Einshtein, Chuck Norris, Stiven Sigall"
ww = c_w.split(/, /)
print zzz = "A Porsche! a Porsche! my kindom for a Porsche!".capitalize
#"new\nopen\ncloze\nprint".each { |item| puts item.capitalize }
fff ="aBcD7fG".swapcase
print "\n" + fff
title = "Love's Labours Love"
print "\n" + title.size.to_s
print "\n" "2014".next
"a".upto("z") {|i| print i}
print "\n"
line444 = "tram pam pam \n purum pum pum\n"
line555 = line444.lines.grep(/puru/)
print line555