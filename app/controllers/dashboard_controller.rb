class DashboardController < ApplicationController

  def show
    @user = User.find(session[:user_id])
    @rant = Rant.new
    @rants = Rant.where(spam: false).order('created_at DESC')
    @follow = Follow.all
    @favorite = Favorite.all
  end
end