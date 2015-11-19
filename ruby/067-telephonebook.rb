phbook = {}

loop do

  puts "Enter name (Enter to stop):"
  name = gets.strip.capitalize
    if name == ''
      break
    end
  puts "Enter phone number"
  number = gets.strip

  phbook[name] = number

end

phbook.each do |key, value|
  puts "Name: #{key}, phone #{value} "
end