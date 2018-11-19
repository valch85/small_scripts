x = 0
=begin
def robot
  x = rand (1..4)
  if x == 1
    x = :left
  elsif x == 2
    x = :right
  elsif x == 3
    x = :up
  elsif x == 4
    x = :down
  end
end
=end

def robot
  arr = [:left, :right, :up, :down]
  x = arr[rand(0..3)]
end

x = robot

if x == :left
  puts "robot is goes left"
elsif x == :right
  puts "robot is goes right"
elsif x == :up
  puts "robot is goes up"
elsif x == :down
  puts "robot is goes down"
end
