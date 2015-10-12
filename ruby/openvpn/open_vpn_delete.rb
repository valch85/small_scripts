#!/usr/bin/ruby
require 'optparse'
require 'net/ssh'
require 'pp'
require 'readline'
require 'open3'
require 'mail'
require 'net/scp'
require 'optparse'

$fullpath = Dir.pwd

email=$email

def delete_users(email)
  #generate key
  keyname = email.sub(/@.*?$/, '') #remove @domante from email address (needs for name of *.p12 file and for setting in template)
  realname = keyname.to_s.gsub(/(\S+)\.(\S+)/){ $1.to_s.capitalize + " " + $2.to_s.capitalize } #create user name for email with capitalize letter with space
  delete_key(keyname)
  p 'User ' + realname + ' with key ' + keyname + ' was deleted'
end

def delete_key(keyname)
  host = $server
  login = 'orc'
  keys = '/home/rundeck/.ssh/id_rsa_ovpn'
  Net::SSH.start("#{host}", "#{login}", :keys => "#{keys}") do |ssh| #connect to the server
    #execute bash commands for openvpn generating key
    ssh.exec "cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/ && source /usr/share/doc/openvpn/examples/easy-rsa/2.0/vars && yes '' | sudo -E /usr/share/doc/openvpn/examples/easy-rsa/2.0/revoke-full #{keyname}"
  end
end