class FavoritesController < ApplicationController

  def show
    @rant = Rant.find(params[:rant_id])
    @user = User.find(params[:user_id])
  end
end