class RantsController < ApplicationController

  def show
    @rant = Rant.find(params[:id])
    @user = User.find(params[:user_id])
    @comment = Comment.new
  end

  def index
    @rant = Rant.new
    @rants = Rant.all
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @rant = Rant.new
  end

  def create
    @user = User.find(params[:user_id])
    @rant = Rant.new(accepted_params)
    if @rant.save
      Keen.publish(:logins, {username: @user.username, date: Time.now}) if Rails.env.production?
      redirect_to dashboard_path(@user.id)
    else
      redirect_to dashboard_path(@user.id)
    end
  end

  def destroy
    @rant = Rant.find(params[:id])
    @rant.destroy!
    redirect_to :back
  end

  def spam
   @rant = Rant.find(params[:rant_id]).update!(spam: true)
    redirect_to :back
  end

  private

  def accepted_params
    params.require(:rant).permit(:about, :rant).merge({user_id: @user.id})
  end

  def search
    @rants = Rant.search params[:search]
  end
end
