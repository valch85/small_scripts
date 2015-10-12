#this script connect to admin reports and send email with notification that two-factor authentication should be on; script use oauth 2.0 for server to web applications
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'
require 'date'
require 'mail'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE #disable SSL check

APPLICATION_NAME = 'project_name' # need to create project in google developers console
CLIENT_SECRETS_PATH = 'client_secret.json' # need to create in Project -> APIs&Auth -> Credentials -> Add OAuth 2.0 client IDs and download it to the dir with this script

# in this dir will save token 
CREDENTIALS_PATH = File.join(Dir.home, '.credentials',
                             "admin-reports_v1-quickstart.json")
SCOPE = 'https://www.googleapis.com/auth/admin.reports.usage.readonly'

date3 = (Date.today - 3)

def authorize
  FileUtils.mkdir_p(File.dirname(CREDENTIALS_PATH))

  file_store = Google::APIClient::FileStore.new(CREDENTIALS_PATH)
  storage = Google::APIClient::Storage.new(file_store)
  auth = storage.authorize

  if auth.nil? || (auth.expired? && auth.refresh_token.nil?)
    app_info = Google::APIClient::ClientSecrets.load(CLIENT_SECRETS_PATH)
    flow = Google::APIClient::InstalledAppFlow.new({
      :client_id => app_info.client_id,
      :client_secret => app_info.client_secret,
      :scope => SCOPE})
    auth = flow.authorize(storage)
    puts "Credentials saved to #{CREDENTIALS_PATH}" unless auth.nil?
  end
  auth
end

#method for sending email
def email_send(email)
  puts "Sending email"
  realname = email.sub(/@.*?$/, '').to_s.gsub(/(\S+)\.(\S+)/){ $1.to_s.capitalize + " " + $2.to_s.capitalize } #remove @domante from email address & create user name for email with capitalize letter with space
  #sent email with 2 files (config.ovpn + uname.p12)
  Mail.defaults {
    delivery_method  :smtp, :address    => "smtp.gmail.com",
                     :port       => 587,
                     :user_name  => 'email@domaine.com',
                     :password   => 'pass',
                     :enable_ssl => true

  }
  mail = Mail.new {
    to      "#{email}"
    from    'email@domaine.com'
    subject '2 factor auth notification'
    text_part {
      body "Dear #{realname},\n
it looks as if you have not turned on the two-factor authentication.
Please see  the link to activation: https://accounts.google.com/SmsAuthConfig.\n"
    }
  }
  mail.deliver
  puts "Email sent"
end


# Initialize the API
client = Google::APIClient.new(:application_name => APPLICATION_NAME)
client.authorization = authorize
reports_api = client.discovered_api('admin', 'reports_v1')

# Save to send_list array all emails without 2 factor auth ON 
results = client.execute!(
  :api_method => reports_api.user_usage_report.get,
  :parameters => { :userKey => 'all',
                   :date => date3.to_s,
                   :filds => 'parameters, entity',
                   :parameters => 'accounts:is_2sv_enrolled'})

black_list = [ "balckmail1@domaine.com", "balckmail2@domaine.com"] #exclude emails from sending emails

send_list = []

results.data.usageReports.each do |user|
  user.parameters.each do  |parameter|
    unless parameter['boolValue']
      send_list << user.entity.user_email
    end
  end
end

#Send emails
send_list.each do |email|
  if black_list.include?(email)
    next
  end
  puts email
  email_send(email)
end
puts date3