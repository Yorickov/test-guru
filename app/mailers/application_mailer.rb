class ApplicationMailer < ActionMailer::Base
  default from: "TestGuru <#{ENV['HOST_EMAIL']}>"
  layout 'mailer'
end
