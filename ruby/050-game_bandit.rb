print "How old are you? "
age = gets.to_i

print "Do you whana play? (Y/N)?"
status = gets.strip.capitalize

if age >=18 && status == "Y"
  puts "Here we go!!!"

  money = 100


  1000.times do
    puts "Enter for start game "
    gets

    if money >= 0
      x = rand (0..5)
      y = rand (0..5)
      z = rand (0..5)

      puts "#{x} #{y} #{z}"

      # 000
      if x == 0 && y == 0 && z == 0

        puts "Your balance nulled"
        money = 0
      end

      # 111
      if x == 1 && y == 1 && z == 1
        puts "You get $10"
        money = money + 10
      end

      # 222
      if x == 2 && y == 2 && z == 2
        puts "You get $20"
        money = money + 20
      end

      # 333
      if x == 3 && y == 3 && z == 3
        puts "You get $30"
        money = money + 30
      end

      # 444
      if x == 4 && y == 4 && z == 4
        puts "You get $40"
        money = money + 40
      end

      # 555
      if x == 5 && y == 5 && z == 5
        puts "Your balance nulled"
        money = money + 50
      end

      # 777
      if x == 7 && y == 7 && z == 7
        puts "Your balance nulled"
        money = money - 70
      end

      # 888
      if x == 8 && y == 8 && z == 8
        puts "Your balance nulled"
        money = money - 80
      end

      # 999
      if x == 9 && y == 9 && z == 9
        puts "Your balance nulled"
        money = money - 90
      end

      # 123
      if x == 1 && y == 2 && z == 3
        puts "Your balance nulled"
        money = money - 123
      end

      puts "You have $#{money}"

    else
      puts "you lost"
      exit
    end

  end

else
  puts "chao"
end