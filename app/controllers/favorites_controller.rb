class FavoritesController < ApplicationController

  def show
    @rant = Rant.find(params[:rant_id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @favorite = Favorite.new(params[:rant_id])
  end

  def create
    @favorite = Favorite.new(accepted_params)
    if @rant.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
end