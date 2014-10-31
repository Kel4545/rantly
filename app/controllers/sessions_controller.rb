class SessionsController < ApplicationController
  # before_action :check_signed_in, except: :destroy

  def new
    @user = User.new
    render :layout => "root"
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user.id)
    else
      flash[:notice] = "Username/ password are incorrect"
      redirect_to signin_path
    end
  end

  def destroy
    session.destroy
    redirect_to signin_path
  end

  # private
  #
  # def check_signed_in
  #   if signed_in?
  #     flash.now.alert = "Already signed in"
  #     redirect_to root_path
  #   end
  # end
end