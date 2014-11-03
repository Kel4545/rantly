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

  def new_rant(ranter)
      Following.where(followee_id: ranter.id).each do |following|
      @user = User.find(following.follower_id)
      @ranter = ranter
      @url = Rails.env.production? ? 'http://nameless-fjord-8757.herokuapp.com/' : 'http://localhost:3000'
      mail(to: @user.email, subject: "#{ranter.first_name} 'Ranted'")
    end
  end
end

