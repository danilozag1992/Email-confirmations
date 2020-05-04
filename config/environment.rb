# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'portfoliozag',
  :password => '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',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto =>  true
}