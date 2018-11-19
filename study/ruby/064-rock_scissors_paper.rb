puts "the game: rock, scissors, paper\n"

puts "1. rock"
puts "2. scissors"
puts "3. paper"
print "enter your coise, pls:"
answer = gets.strip

if answer == 1 || answer == "rock"
  answer = :rock
elsif answer == 2 || answer == "scissors"
  answer = :scissors
elsif answer == 3 || answer == "paper"
  answer = :paper
else
  puts "Can't understand shat you want, sorry..."
end

array = [:rock, :scissors, :paper]
pc_choise = array[rand(0..2)]

if pc_choise  == answer
  puts "nobody win"
end
if pc_choise == :rock && answer == :scissors
  puts "You are loose"
end
if pc_choise == :rock && answer == :paper
  puts "You are win"
end
if pc_choise == :scissors && answer == :rock
  puts "You are win"
end
if pc_choise == :scissors && answer == :paper
  puts "You are loose"
end
if pc_choise == :paper && answer == :rock
  puts "You are loose"
end
if pc_choise == :paper && answer == :scissors
  puts "You are win"
end
