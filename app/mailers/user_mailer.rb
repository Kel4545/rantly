class UserMailer < ActiveRecord::Base
  default from: 'grumpy@rantly.com'

  def registration_confirmation(user, login_url)
    @login_url = login_url
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Welcome to Rant.ly")
  end
end

