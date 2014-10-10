class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

   def other_users
    @other_users ||= User.where.not(id: session[:user_id])
   end

   def follow
     @follow ||= Follow.find_by(user_id: current_user[:id], followee_id: user[:id]) == nil
   end

  def full_name(user)
    user.first_name, user.last_name].join(" ")
  end

  helper_method :current_user
  helper_method :other_users
  helper_method :follow
end


