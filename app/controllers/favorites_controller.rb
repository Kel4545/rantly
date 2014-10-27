class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @favorite = Favorite.where(user_id: current_user.id)
    @rant = Rant.new
    @rants = Rant.all
  end

  def new
    @user = User.find(params[:user_id])
    @favorite = Favorite.new(params[:rant_id])
  end

  def create
   @favorite = Favorite.create!({
                       user_id: current_user.id,
                       rant_id: params[:rant_id],
                     })
    if @favorite.save
    redirect_to :back
  else
    flash[:notice] = "Rant is not favorited"
  end
    end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy!
    redirect_to :back
  end
end
