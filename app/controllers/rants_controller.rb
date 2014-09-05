class RantsController < ApplicationController

  def show
    @rant = Rant.order(:name)
  end

  def new
    @users = User.find(params[:user_id])
    @rant = Rant.new
  end
end