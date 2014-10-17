class CommentsController < ApplicationController

  def create
    @rant = Rant.find(params[:rant_id])
    @comment = Comment.new(accepted_params)
    if @comment.save
      redirect_to :back
    else
      redirect_to :back
      flash[:notice] = "Your comment was not saved"
    end
  end

  def accepted_params
    params.require(:comment).permit(:comment).merge({user_id: current_user.id, rant_id: @rant.id})
  end
end