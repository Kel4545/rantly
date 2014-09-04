class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(
      username: params[:user][:username],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname],
      bio: params[:user][:bio],
      password: params[:user][:password])
    redirect_to "/user/#{@user.id}"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end

end