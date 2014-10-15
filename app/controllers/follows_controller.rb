class FollowsController < ApplicationController

  def index
    @follows = Follow.where(follower_id: current_user.id)
    @rant = Rant.new
    @user = User.find(params[:user_id])
  end

  def create
   @follow = Follow.create!({
                     follower_id: current_user.id,
                     followee_id: params[:user_id]
                   })
     if @follow.save
       redirect_to :back
    else
      flash[:notice] = "Person is not followed"
      redirect_to :back
    end
   end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy!
    redirect_to :back
  end

end
