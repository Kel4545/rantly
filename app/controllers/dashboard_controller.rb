class DashboardController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @rants = Rant.all
    @follow = Follow.all
    @favorite = Favorite.all
    @comment = Comment.new
  end
end