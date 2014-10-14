class CommentsController < ApplicationController

  def create
    @comment = Comment.new(accepted_params)
    if @comment.save
      redirect_to :back
    else
      flash[:notice] = "Your comment was not saved"
    end
  end

  def accepted_params
    params.require(:comment).permit(:comment).merge({user_id: @user.id, rant_id: @rant.id})
  end
end