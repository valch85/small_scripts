month = Array.new(12)
a = month.empty?
puts a
p month.size
p month.length
puts month.inspect
p month
month = Array.new(12, "month")
p month
month.clear
p month.empty?
num = Array.new(10) {|e| e = e * 2}
p num
month_abrv = Array["jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
month = [nil, "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec"]
p month[1]
digits = Array(0..9)
p digits
month = %w[nil jan feb mar apr may jun jul aug sep oct nov dec]
p month
month[0] = nil
p month
hoge_podge = ["January", 1, :year, [2006, 1, 01]]
hoge_podge.each {|e| print e.class, " "}
puts "\n"+ month[-1]
p month.include? "nov"
x = [2, 5, 1, 78, 54, -1, 4 , -2, 0, 1540, -2000]
x.sort!
p x.reverse
year = [2015, 2016, 2017]
month.shift
day = [ 30, [28, 29], 1, 20, 35]
d3 = [year, month, day]
p d3
p month.map! { |x| x + "!"}

