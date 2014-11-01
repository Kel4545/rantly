class UserMailer < ActionMailer::Base
  default :from => "ihaterantly@gmail.com"

  def welcome_email(user)
    @user = user
    Rails.env.production? ? @url = 'http://example.com/login' : @url = 'http://example.com/login'
    mail(to: @user.email, from: "ihaterantly@gmail.com", subject: 'Welcome to Rant.ly')
  end

  def send_confirmation_mail(user)
    @user = user
    Rails.env.production? ? @url = 'http://example.com/login' : @url = 'http://example.com/login'
    mail(to: @user.email, from: "ihaterantly@gmail.com", subject: 'User Registration confirmation')
  end
end

