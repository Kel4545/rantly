class UserMailer < ActiveRecord::Base
  default :from => 'admin@rantly.com'

  def welcome_email(user)
    mail(to: user.email, subject: 'Welcome to Rant.ly')
  end

  def registration_confirmation(user)
    @user = user
    confirmation_token = EmailConfirmer.set_confirmation_token(user)
    @confirmation_url = email_confirmation_url(confirmation_token)
    mail to: user.email, subject: 'Confirm Rant.ly Registration'
  end
end

