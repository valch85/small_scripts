require 'net/ssh'
require 'pp'
require 'readline'
require 'open3'
require 'mail'
require 'net/scp'

config = Net::SSH::Config.load('~/.ssh/config', "host.name")
config.empty?
ssh_user = config["user"]
puts ssh_user
host = 'openvpn3.grammarly.com'
keys = '~/.ssh/id_rsa'
public_key = system ("cat ~/.ssh/id_rsa.pub")

Net::SSH.start("#{host}", "#{ssh_user}", :keys => "#{keys}") do |ssh| #connect to the server
  #execute bash commands for openvpn generating key
  ssh.exec "sudo -e sh -c /etc/init.d/chef-client stop && sudo ps aux |grep chef-client |grep -v grep"

  #ssh.exec "sudo print public_key >> /root/.ssh/authorized_keys"  ### ????
end



puts public_key

