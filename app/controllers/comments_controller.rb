class CommentsController < ApplicationController

  def create
    @rant = Rant.find(params[:rant_id])
    @comment = Comment.new(accepted_params)
    @user = current_user.id
    if @comment.save
      redirect_to dashboard_path(current_user.id)
    else
      redirect_to dashboard_path(current_user.id)
      flash[:notice] = "Your comment was not saved"
    end
  end

  def accepted_params
    params.require(:comment).permit(:comment).merge({user_id: current_user.id, rant_id: @rant.id})
  end
end