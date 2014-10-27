class UserMailer < ActiveRecord::Base
  default from: 'grumpy@rantly.com'

  def welcome_email(user)
    @user = user
    @url = 'http://nameless-fjord-8757.herokuapp.com/signin'
    mail(to: @user.email, subject 'Welcome to Rant.ly my friend')
  end
end