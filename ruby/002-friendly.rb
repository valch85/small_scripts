class Hello
	def howdy
		greeting = "Hello, Matz!"
		puts greeting
	end
end

class Goodbye < Hello
	def solong
		farewell = "Goodbye, Matz."
		puts farewell
	end
end

class GoodbayForever < Hello
	def solong
		puts "GOODBAY FOREVEo"
	end
end


friendly = Goodbye.new
friendly.howdy
friendly.solong