class FollowsController < ApplicationController

  def index
    render :layout => "followsheader"
    @users = session[:user_id]
    follow_ids = Follow.where(user_id: @users)
    @follow = []
    if follow_ids.class == nil
      @follow << "Nothing to see here"
      # elsif
      #   @follow << User.find(follow_ids.followee_id).username
      #  else
      #   follow_ids.each do |following|
      #     User.where(id: following.follow).each { |user| @follow << user }
      #   end
    end
  end

  def create
    @user = User.find(params[:user_id])
    @follow = Follow.new(accepted_params)
    if @follow.save
      redirect_to dashboard_path(@user.id)
    else
      redirect_to dashboard_path(@user.id)
    end
  end

  def delete
    @follow = Follow.find(params[:id])
    @follow.destroy!
    redirect_to :back
  end

  private

  def accepted_params
    params.require(:follow).merge({followee_id:,  user_id: @user.id})
  end
end


