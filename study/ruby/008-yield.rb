def gimme
  if block_given?
    yield

  else
    print " I'm blockless!"
  end
  puts " You are welcome"
end

gimme {print "ttt "}

gimme