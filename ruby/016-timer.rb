def timer( start )
  puts "Minutes: " + start.to_s
  start_time = Time.now
  puts start_time.strftime("Start_to_time: %I:%M:%S %p")
  start.downto(1) { |i| sleep 60}
  end_time = Time.now
  print end_time.strftime ("Elapsed time: %I:%M:%S %p")
end

timer 1