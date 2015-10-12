Dir.chdir ("/Users/val/")
home_dir = Dir.pwd
p "Home dir = " + home_dir

ruby_dir = "/Users/val/Documents/projects/SmallScripts/ruby"
if not Dir.pwd == ruby_dir
  Dir.chdir ruby_dir
end
p "My dir now = " + Dir.pwd

Dir.mkdir("/Users/val/Documents/projects/SmallScripts/ruby/folder", 0755)
Dir.rmdir("/Users/val/Documents/projects/SmallScripts/ruby/folder")
Dir.entries("/Users/val/Documents/projects/SmallScripts/ruby/").each {|e| puts e}
Dir.foreach("/Users/val/Documents/projects/SmallScripts/ruby/").each {|e| puts e}



