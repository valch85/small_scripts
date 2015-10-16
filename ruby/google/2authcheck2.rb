#this script connect to admin reports and send email with notification that two-factor authentication should be on; script use oauth 2.0 for server to server applications
require 'google/api_client'
require 'google/api_client/client_secrets'
require 'google/api_client/auth/installed_app'
require 'google/api_client/auth/storage'
require 'google/api_client/auth/storages/file_store'
require 'fileutils'
require 'date'
require 'googleauth'
require 'mail'
require 'openssl'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

# variables
date3 = (Date.today - 3)
APPLICATION_NAME = 'app_name' # name of the project in developers console https://console.developers.google.com/project
SERVICE_ACCOUNT_EMAIL_ADDRESS = '123@developer.gserviceaccount.com' # email address from developers console -> apis&auth -> credential -> sservice accounts; should looks like 12345@developer.gserviceaccount.com
PATH_TO_KEY_FILE              = './key.p12' # the path to the downloaded .p12 key file
CLIENT_ID = 'clientID.apps.googleusercontent.com' # from developers console
SCOPE = 'https://www.googleapis.com/auth/admin.reports.usage.readonly' # from https://developers.google.com/oauthplayground/
EMAIL = 'email@company.com' # email under which credential was created
key = Google::APIClient::KeyUtils.load_from_pkcs12('key.p12', 'notasecret') # make a key from .p12

# balack list emails arrays
black_list = [ "blacklist1@company.com", "blacklist2@company.com"]
send_list = [] # empty array for emails from api call results
list = []

# get the environment configured authorization
client = Google::APIClient.new({
                                   application_name: APPLICATION_NAME
                               })
# make authorization
client.authorization = Signet::OAuth2::Client.new(
    :token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
    :audience => 'https://accounts.google.com/o/oauth2/token',
    :scope => SCOPE,
    :issuer => SERVICE_ACCOUNT_EMAIL_ADDRESS,
    :sub => EMAIL,
    :signing_key => key)
client.authorization.fetch_access_token!

# api discovery
reports_api = client.discovered_api('admin', 'reports_v1')

# send emails method
def email_send(email)
  puts "Sending email"
  realname = email.sub(/@.*?$/, '').sub(/@.*?$/, '').split(".").map(&:capitalize).join(" ") #remove @domante from email address & create user name for email with capitalize letter with space
  #sent emails
  Mail.defaults {
    delivery_method  :smtp, :address    => "smtp.gmail.com",
                     :port       => 587,
                     :user_name  => 'email@company.com',
                     :password   => 'pass',
                     :enable_ssl => true

  }
  mail = Mail.new {
    to      "#{email}"
    from    'email@company.com'
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

def report_send(list)
  #sent emails
  Mail.defaults {
    delivery_method  :smtp, :address    => "smtp.gmail.com",
                     :port       => 587,
                     :user_name  => 'email@company.com',
                     :password   => 'pass',
                     :enable_ssl => true

  }
  mail = Mail.new {
    to      "email1@company.com, email2@company.com, email3@company.com"
    from    'email@company.com'
    subject "2 factor auth report. #{list.count} users without two-factor authentication."
    text_part {
      body list.join("\n")
    }
  }
  mail.deliver
  puts "Report sent"
end

# make call to api
results = client.execute!(
  :api_method => reports_api.user_usage_report.get,
  :parameters => { :userKey => 'all',
                   :date => date3.to_s,
                   :filds => 'parameters, entity',
                   :parameters => 'accounts:is_2sv_enrolled'})

# put emails without 2 auth to array send_list.
results.data.usageReports.each do |user|
  user.parameters.each do  |parameter|
    unless parameter['boolValue']
      send_list << user.entity.user_email
    end
  end
end

# send notification to emails exclud emails from blacklist
send_list.each do |email|
  if black_list.include?(email)
    next
  end
  list << email.to_s
  puts email
  email_send(email)
end

report_send(list)