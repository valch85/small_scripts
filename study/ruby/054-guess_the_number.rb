digit = rand(0..100)
puts "I put forth a number of, guess what?"

1.upto(10) do |x|
puts "try number #{x} u have #{10-x}"

num = gets.to_i
    if num == digit
      puts "U are right"
      exit
    elsif num > digit
      puts"my number is lower"
    else
      puts"my number is higer"
    end
end