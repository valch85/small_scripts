arr = %w[walt hank jessie jr lessi nick zigmund]


loop do


  x = 0
  arr.each do |name|
    x = x+1
    puts "#{x} #{name}"
  end

  puts "Who u whant to delete (number)?"
  answer = gets.chomp.to_i - 1

  arr.delete_at answer

end