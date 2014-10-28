class UserMailer < ActiveRecord::Base
  default :from => 'default@production-server.com'

  def registration_confirmation(user, login_url)
    @login_url = login_url
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

