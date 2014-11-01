class UserMailer < ActionMailer::Base
  default :from => "ihaterantly@gmail.com"

  def welcome_email(user)
    @user = user
    @url = 'http://nameless-fjord-8757.herokuapp.com/'
    mail(to: @user.email, from: "ihaterantly@gmail.com", subject: 'Welcome to Rant.ly')
  end

  def send_confirmation_mail(user)
    @user = user
    mail(to: @user.email, from: "ihaterantly@gmail.com", subject: 'User Registration confirmation')
  end
end

