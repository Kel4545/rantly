class UserMailer < ActionMailer::Base
  default :from => "ihaterantly@gmail.com"

  def welcome_email(user)
    @user = user
    @url = Rails.env.production? ? 'http://nameless-fjord-8757' : 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Rant.ly')
  end

  def send_confirmation_mail(user)
    @token = 'something'
    @user = user
    @url = Rails.env.production? ? 'http://nameless-fjord-8757'  : 'http://localhost:3000'
    mail(to: @user.email, subject: 'User Registration confirmation')
  end
end

