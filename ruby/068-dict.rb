#english => russian dictionary
hh = {'girl' => 'девушка', 'cat' => 'кошка', 'dog' => 'собака'}

loop do
  puts "enter you word: "
  uword = gets.strip
  hh.each do |key, value|
    if uword == key
      puts "Translation #{uword} - #{value}"
    end
  end

end