$arr = %w[walt hank jessie jr lessi nick zigmund]


def printarr
  x = 0
  $arr.each do |name|
    x = x + 1
    puts "#{x} #{name}"
  end
end


loop do

  puts "for exit type quit"
  print "Type name to add or press 'Enter' to print all  "
  answer = gets.strip

  if answer == "quit"
    exit
  elsif answer == ""
    printarr
  else
    $arr << answer.to_s
  end
end