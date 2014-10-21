class SearchController < ApplicationController


  def index
    params[:search] ||= "alskdfjlakjsdfihoqw}}KQEPifj"
    @rants = Rant.joins(:user).where('username LIKE ? OR firstname LIKE ? OR lastname LIKE ?', params[:search]+"%", params[:search]+"%", params[:search]+"%")
    @title = Rant.where('title LIKE ?', params[:search]+"%")
    @contents = Rant.where('content LIKE ?', "%"+params[:search]+"%")
    @users = User.where("firstname LIKE ? OR lastname LIKE ? OR username LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    @favorite = Favorite.where((:user_id == current_user.id) && (:rant_id == params[:rant_id])).first
    @user = User.find(session[:user_id])
    @rant = Rant.new
  end

end