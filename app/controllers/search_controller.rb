class SearchController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @rant = Rant.new
  end

  def index
      @users = User.where("first_name LIKE ? OR last_name LIKE ? OR username LIKE ?", "%#{params[:search]}%","%#{params[:search]}%", "%#{params[:search]}%")
      @search = params[:search]
      @favorite = Favorite.where((:user_id == current_user.id) && (:rant_id == params[:rant_id])).first
      @user = User.find(session[:user_id])
      @rant = Rant.new
    end

  end