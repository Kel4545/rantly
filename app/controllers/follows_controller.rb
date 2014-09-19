class FollowsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @rant = Rant.new
    @rants = Rant.all
  end

  def new
    @user = User.find(params[:user_id])
    @follow = Follow.new
  end

  def create
    @user = User.find(params[:user_id])
    @follow = Follow.new(accepted_params)
    if @follow.save
      redirect to dashboard_path(@user.id)
    else
      redirect_to dashboard_path(@user.id)
    end
  end


  private

  def accepted_params
    params.require(:follow).permit.merge({user_id: @user.id})
  end
end