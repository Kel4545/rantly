class FavoritesController < ApplicationController

  def show
    @rant = Rant.find(params[:rant_id])
    @user = User.find(params[:user_id])
  end

  def index
    @user = User.find(params[:user_id])
    @favorite = Favorite.all
  end

  def new
    @user = User.find(params[:user_id])
    @favorite = Favorite.new(params[:rant_id])
  end

  def create
    Favorite.create!({
                     user_id: current_user.id,
                     rant_id: params[:rant_id]
                   })
      redirect_to :back
    else
      flash[:notice] = "Rant is not favorited"
      redirect_to :back
    end
  end
