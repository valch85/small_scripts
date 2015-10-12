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

def create_users(email)
  #generate key
    keyname = email.sub(/@.*?$/, '') #remove @domante from email address (needs for name of *.p12 file and for setting in template)
    realname = keyname.to_s.gsub(/(\S+)\.(\S+)/){ $1.to_s.capitalize + " " + $2.to_s.capitalize } #create user name for email with capitalize letter with space
    create_key(keyname)
    #exectute system command for directory create
    system ("mkdir -p /home/rundeck/for_send/")
    copy_key(keyname)
    create_config(keyname)
    email_send(email, realname, keyname)
    p 'User ' + realname + ' with key ' + keyname + ' was created.' + ' Keys were sent to email ' +  email
end

def create_key(keyname)
  host = $server
  login = 'orc'
  keys = '/home/rundeck/.ssh/id_rsa_ovpn'
  Net::SSH.start("#{host}", "#{login}", :keys => "#{keys}") do |ssh| #connect to the server
    #execute bash commands for openvpn generating key
    ssh.exec "cd /usr/share/doc/openvpn/examples/easy-rsa/2.0/ && source /usr/share/doc/openvpn/examples/easy-rsa/2.0/vars && yes '' | sudo -E /usr/share/doc/openvpn/examples/easy-rsa/2.0/build-key-pkcs12-v #{keyname} && sudo -E cp /usr/share/doc/openvpn/examples/easy-rsa/2.0/keys/#{keyname}.p12 /home/orc/ && sudo -E chown -R orc: /home/orc"
  end
end

def copy_key(keyname)
  #scp key.p12 file to local mashine
  host = $server
  login = 'orc'
  keys = '/home/rundeck/.ssh/id_rsa_ovpn'
  Net::SCP.download!(host, login, "/home/orc/#{keyname}.p12", "/home/rundeck/for_send/", :ssh => { :keys => keys })
end

def create_config(keyname)
  #create config.ovpn from template
  File.new('/home/rundeck/config_k.ovpn', 'w')
  File.open('/opt/devops-utils/openvpn/template.ovpn').each { |line| #open template and do each line-by-line
    File.open('/home/rundeck/config_k.ovpn', 'a') { |file| file.write line.sub(/\ (.*).p12/, " #{keyname}.p12") } #parss all lines from template for *.p12 setting in the string and change it for username.p12
  }
  File.new('/home/rundeck/config.ovpn', 'w')
  File.open('/home/rundeck/config_k.ovpn').each { |line| #open template and do each line-by-line
    File.open('/home/rundeck/config.ovpn', 'a') { |file| file.write line.sub(/\ (.*).servername.com/, " #{$server}") } #parss all lines from template for server setting in the string and change it for right
  }
  #execute system command move
  system ("mv /home/rundeck/config.ovpn /home/rundeck/for_send/")
end

def email_send(addr, realname, keyname)
  puts "Sending email"
  #sent email with 2 files (config.ovpn + uname.p12)
  Mail.defaults {
    delivery_method  :smtp, :address    => "smtp.gmail.com",
                     :port       => 587,
                     :user_name  => 'admin@gmail.com',
                     :password   => 'password',
                     :enable_ssl => true

  }
  mail = Mail.new {
    to      "#{addr}"
    from    'admin@gmail.com'
    subject 'OpenVPN settings'
    text_part {
      body "Hi, #{realname} this is an instruction for setting up OpenVPN
for MacOS:
to set it up you need to do the following steps in the below order:
- download and install http://sourceforge.net/projects/tunnelblick/files/All%20files/Tunnelblick_3.4beta18.dmg/download
- create a folder with the name grammarly_vpn on your desktop
- save attachments to it
- rename the folder to grammarly_vpn.tblk
- click on the file grammarly_vpn.tblk (this will save the configuration to tunnelblick)
- start using OpenVPN (http://goo.gl/GxWcIb)

for Windows:
need program OpenVPN GUI http://swupdate.openvpn.org/community/releases/openvpn-install-2.3.4-I603-x86_64.exe
copy key and config files to C:\Program Files\OpenVPN\config

Compulsory condition - IPs of DNS servers cannot be set up manually, during connection to VPN they should be able to change to internal OpenVPNs DNS server.\n"
    }
    add_file :filename => 'config.ovpn', :content => File.read("/home/rundeck/for_send/config.ovpn")
    add_file :filename => "#{keyname}.p12", :content => File.read("/home/rundeck/for_send/#{keyname}.p12")
  }
  mail.deliver
  puts "Email sent"
  #exectute system command for directory remove
  system ("rm -rf /home/rundeck/for_send/")
end