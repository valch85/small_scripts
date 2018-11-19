file = File.new("books.txt", "w")
file.chmod(0755)
system "ls -la books.txt"
File.delete("books.txt")

file = File.new("books.txt", "w").chmod(0755)
system "ls -la books.txt"
File.delete("books.txt")

file = File.new("books.txt", "w")
file.chown(109, 3333)
system "ls -la books.txt"
File.delete("books.txt")

file = File.new("books.txt", "w").chown(109, 3333)
system "ls -la books.txt"
File.delete("books.txt")