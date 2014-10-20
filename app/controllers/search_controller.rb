class SearchController < ApplicationController

  def new
    @user = User.find(session[:user_id])
    @rant = Rant.new
  end

  def index

  end
end