class UserMailer < ActionMailer::Base


  def welcome_email(user)
    @user = user
    @url = 'http://nameless-fjord-8757.herokuapp.com/'
    mail(to: user.email, subject: 'Welcome to Rant.ly')
  end

  def send_confirmation_mail(user)
    @user = user
    mail(to: @user.email, subject: 'User Registration confirmation')
  end
end

