class RantsController < ApplicationController

  def index
    @users = User.find(params[:user_id])
    @rants = Rant.new
    @rant = Rant.all
  end



  def create
    rant_params = params.require(:rant).permit(:about, :rant).merge(user_id: params[:user_id])
    @rant = Rant.new(rant_params)
    if @rant.save
      redirect_to user_rants_path, notice: "Rant was created successfully!"
    else
      render :new
    end
  end

end
