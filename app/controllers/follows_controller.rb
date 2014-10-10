class FollowsController < ApplicationController

  def index
    @users = session[:user_id]
    @follows = Follow.where(user_id: @users)
    @user = User.find(params[:id])
  end

  def create
    Follow.create!({
                     user_id: @user.id,
                     followee_id: params[:user_id]
                   })
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
end


