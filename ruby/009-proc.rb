count = Proc.new { [1,2,3,4,5].each do |i| print i end; puts }
your_proc = lambda { puts "Lurch: 'You rang?'" }
my_proc = proc { puts "Mortizia: 'who was at the door, Lurch?'" }

#What type of the objects I created?
puts count.class, your_proc.class, my_proc.class

count.call
your_proc.call
my_proc.call
