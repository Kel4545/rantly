class DashboardController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @rants = Rant.order('favorites_count')
    @follow = Follow.all
    @favorite = Favorite.all
    @comment = Comment.new
  end
end