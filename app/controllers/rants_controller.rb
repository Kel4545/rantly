class RantsController < ApplicationController

  def index
    @users = User.find(params[:user_id])
    @user = User.all
    @rants = Rant.new
    @rant = Rant.all
    @other_users = User.where.not(id: session[:user_id])
  end

  def show
    @rants = Rant.find(params[:id])
  end

  def create
    @rant = Rant.new(
      about: params[:rant][:about],
      rant: params[:rant][:rant],
      user_id: params[:user_id]
    )
    if @rant.save
      redirect_to user_rants_path, notice: "Rant was created successfully!"
    else
      redirect_to user_rants_path
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy
    if @rant.save
      flash[:notice] = "Rant was deleted successfully!"
      redirect_to user_rants_path
    else
      render :new
    end
  end
end
