money = 100

puts "\nЯ вижу у тебя есть #{money}$ и тебе не терпиться их проиграть? Ну что же, начнём!"

1000.times do

  puts

  puts "Enter for start game "
  gets

  x = rand (0..5)
  y = rand (0..5)
  z = rand (0..5)


  10.times do |xx|

    meter = rand (000..999)
    if xx < 9
      print meter
      print "\r"
      sleep 0.08
    else print "#{x} #{y} #{z}"
    end
  end


  puts

  # в случае совпадения чисел, начисляются очки
  if x == y && x == z && x > 0 && x != 5
    puts "\nПолное совпадение! Вам зачислено #{x * 10}$."
    money = money + x * 10

    # в случае комбинации 555, очки умножаются в 5 раз
  elsif x == y && x == z && x == 5 && money > 0
    puts "\nДЖЕЕЕЕКПООООТ!!! Ваш счёт удваивается!"
    money = money * 2

    # в случае комбинации 000, очки обнуляются
  elsif x == 0 && y == 0 && z == 0 && money >= 0
    puts "\nПоздравляем! Счёт обнуляется."
    money = 0

    # в случае совпадения двух парных чисел + 5 очков
  elsif x == y || y == z

    puts "\nПарное совпадение! Вам зачислен 1$."

    money = money + 1

    # в случае отсутствие совпадения снимается 5 очков
    # выводится один случайный комментарий
  else money = money - 5
  comment = rand (1..3)
  if comment == 1
    puts "\nWill luck next, - 5$."

  elsif comment == 2
    puts "\nDon't worry 5$ not so much."

  else
    puts "\nMinus 5$. They will go for charity!"
  end
  end

  puts "You have #{money}$"

  # При нулевом счёте игра заканчивается
  if money <= 0
    puts "\nThe end."
    sleep 4
    exit
  end
end