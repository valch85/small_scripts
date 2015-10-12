#system "echo", "Hello,", "Matz!"
#puts "Hello, " + "Matz!"
#puts "Hello, " << "Matz! I'am runing on "  + `ruby --version`
#
#hi = "Hello, Matz!!!"
#puts hi
#
#
#person = "Matz"
#puts "Hello! #{person}"
#
## ruby 001-hello_matz.rb Val
## will incert "Val" for ARGV[0]
## can try for VPN generating script (read from comandline)
#puts "Hello #{ARGV[0]}!"  
#
#printf("Hallo, %s", "Matz!!") 
#
#puts("Who do you whant to say hallo to?")
#hello = gets
#puts "Hello, " + hello
#
def hello
	yield	
end

yield {puts "Hello, Matzzz!!!"}

