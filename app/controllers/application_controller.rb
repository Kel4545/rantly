class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

   def other_users
    @other_users ||= User.where.not(id: session[:user_id])
   end


  helper_method :current_user
  helper_method :other_users
end


