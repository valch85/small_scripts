print "Enter your name: "
name = gets.strip.capitalize
=begin
nameb = []
namearr = []

namearr = name.to_a
namearr each do |varr| nameb << varr.capitalize
end
puts nameb
=end
puts "Your name: \t\t\t\t#{name}\nYour name consists of: \t#{name.length} letters"
