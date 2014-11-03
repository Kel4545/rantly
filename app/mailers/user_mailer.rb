class UserMailer < ActionMailer::Base
  default from: "ihaterantly@gmail.com"
  default host: Rails.root

  def welcome_email(user)
    @user = user
    @url = Rails.env.production? ? 'http://nameless-fjord-8757.herokuapp.com/' : 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Rant.ly')
  end

  def send_confirmation_mail(user)
    @token = user.remember_token
    @user = user
    @url = Rails.env.production? ? 'http://nameless-fjord-8757.herokuapp.com/' : 'http://localhost:3000'
    mail(to: @user.email, subject: 'User Registration confirmation')
  end

  def new_rant(user)
      Following.where(followee_id: user.id).each do |following|
      @users = User.find(following.follower_id)
      @user = user
      @url = Rails.env.production? ? 'http://nameless-fjord-8757.herokuapp.com/' : 'http://localhost:3000'
      mail(to: @users.email, subject: "#{user.firstname}" 'Ranted')
    end
  end
end

