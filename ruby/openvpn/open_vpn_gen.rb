#!/usr/bin/ruby
require_relative "/opt/devops-utils/openvpn/open_vpn_create.rb"
require_relative "/opt/devops-utils/openvpn/open_vpn_delete.rb"
require_relative "/opt/devops-utils/openvpn/open_vpn_makefile.rb"
require 'optparse'
require 'net/ssh'
require 'pp'
require 'readline'
require 'open3'
require 'mail'
require 'net/scp'
require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: open_vpn_gen.rb [options]"

  opts.on('-u', '--username USERNAME', 'user name') { |v| options[:username_name] = v }
  opts.on('-a', '--action ACTION', 'action') { |v| options[:action] = v }
  opts.on('-s', '--server SERVER', 'server') { |v| options[:server] = v }

end.parse!


$email = options[:username_name]
$server = options[:server]


case options[:action]

#action delete user
  when options[:action] = 'delete'
    delete_users($email)
#   p 'delete ' + options[:username_name] + ' on ' + options[:server]

#action create user
  when options[:action] = 'create'
    create_users($email)
#   p 'create ' + options[:username_name] + ' on ' + options[:server]

end