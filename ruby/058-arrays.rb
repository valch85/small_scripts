color = []
while 4==4 do
print "Puts your favorit color or type stop for exit:"
  x = gets.strip
  if x != "stop"
    color << x
  else
    puts color.uniq.reverse
    exit
  end
end