#english => russian dictionary
hh = {'girl' => ['девушка', 'девочка'], 'cat' => ['кошка', 'кот'], 'dog' => ['собака', 'собака2', 'собака3']}

=begin
loop do
  puts "enter you word: "
  uword = gets.strip
  hh.each do |key, value|
    if uword == key
      puts "Translation #{uword}: "
      value.each_with_index { |name, index| puts " #{index+1} #{name}" }

    end
  end
end
=end

loop do
  print "enter you word: "
  uword = gets.strip
  hh.each do |key, value|
    if uword == key
      puts "Translation #{uword}: "
      puts "Count #{value.count}"
      value.each { |name| puts "#{name}" }
    end
  puts ''
  end

end