class Hello
  def initialize(name)
    @name = name
  end
  def hello_matz
    puts "Hello, " + @name + "!"
  end
end

hi = Hello.new("Matz!!")
hi.hello_matz




class Dog
  attr :bark, true
end

p ttt = Dog.instance_methods - Object.instance_methods
dog = Dog.new
dog.bark = "Woof!"
puts dog.bark