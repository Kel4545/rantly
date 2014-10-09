class FollowsController < ApplicationController

  def index
    render :layout => "followsheader"
    @users = session[:user_id]
    @follows = Follow.where(user_id: @users)
    end


  def create
    @user = User.find(params[:user_id])
    @follow = Follow.new(accepted_params)
    if @follow.save
      redirect_to :back
    else
      flash[:notice] = "Person is not followed"
      redirect_to :back
    end
  end

  def delete
    @follow = Follow.find(params[:id])
    @follow.destroy!
    redirect_to :back
  end

  private

  def accepted_params
    params.require(:follow).merge({followee_id: @user.user_id,  user_id: @user.id})
  end
end


