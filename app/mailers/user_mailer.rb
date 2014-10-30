class UserMailer < ActionMailer::Base


  def welcome_email(user)
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to Rant.ly')
  end

  # def registration_confirmation(user)
  #   @user = user
  #   confirmation_token = EmailConfirmer.set_confirmation_token(user)
  #   @confirmation_url = email_confirmation_url(confirmation_token)
  #   mail to: user.email, subject: 'Confirm Rant.ly Registration'
  # end
end

