#!/usr/bin/ruby
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: open_vpn_gen.rb [options]"

  opts.on('-u', '--username USERNAME', 'user name') { |v| options[:username_name] = v }
  opts.on('-a', '--action ACTION', 'action') { |v| options[:action] = v }
  opts.on('-s', '--server SERVER', 'server') { |v| options[:server] = v }

end.parse!


case options[:action]
  when options[:action] = 'delete'
    p 'delete ' + options[:username_name] + ' on ' + options[:server]
  when options[:action] = 'create'
    p 'create ' + options[:username_name] + ' on ' + options[:server]
end



# if options[:action] = /^create/
#   puts "create"
# else
#   puts "delete"
# end


p 'user name ' + options[:username_name] + ' action ' + options[:action] + ' server ' + options[:server]
