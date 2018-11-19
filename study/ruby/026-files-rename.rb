p dir = Dir.pwd
File.new("books.txt", "w")
#Dir.entries(dir).each {|list| puts list}

File.rename("books.txt", "books2.txt")
#Dir.entries(dir).each {|list| puts list}
p ver1 = File.readable?("books2.txt")
p ver2 = File.writable?("books2.txt")
p ver3 = File.executable?("books2.txt")
p ver4 = File.size("books2.txt")
p ver5 = File::ftype("books2.txt")
p ver6 = File.exist?("books1.txt") #false
p ver7 = File::ctime("books2.txt")
p ver8 = File::mtime("books2.txt")
p ver9 = File::atime("books2.txt")

File.delete("books2.txt")
#Dir.entries(dir).each {|list| puts list}