arr1 = [:rock, :paper, :scissors]

loop do
  puts "Enter you choise Paper(P)/Rock(R)/Scissors(S)/Enter for exit:"
  uschoise = gets.strip.capitalize

  if uschoise == 'P'
    uschoise = :paper
  elsif uschoise == 'R'
    uschoise = :rock
  elsif uschoise == 'S'
    uschoise = :scissors
  elsif uschoise == ''
    exit
  else
    puts "make you choise"
  end


  pcchoise = arr1[rand(0..2)]

  massiv = [
      [:rock, :rock, :none],
      [:paper, :paper, :none],
      [:scissors, :scissors, :none],

      [:rock, :paper, :computer],
      [:rock, :scissors, :user],

      [:paper, :rock, :user],
      [:paper, :scissors, :computer],

      [:scissors, :rock, :computer],
      [:scissors, :paper, :user],
  ]

  massiv.each do |choise|
    if uschoise == choise[0] && pcchoise == choise[1]
      puts "#{choise[2]} is the winner"
    end
  end


end
