class RantsController < ApplicationController

  def show
    @rant = Rant.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.new(accepted_params)
    if @rant.save
      redirect_to dashboard_path(@user.id), notice: "Rant was created successfully!"
    else
      redirect_to dashboard_path(@user.id)
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy!
    flash[:notice] = "Rant was deleted successfully!"
    redirect_to dashboard_path(@user.id)
  end


  private

  def accepted_params
    params.require(:rant).permit(:about, :rant).merge({user_id: @user.id})
  end
end