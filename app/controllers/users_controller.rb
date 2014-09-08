class UsersController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def index
    @users = User.find(params[:id])
    @rants = Rant.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname],
      bio: params[:user][:bio],
      password: params[:user][:password])

    if @user.save
      flash[:notice] = "Thank you for registering!"
      redirect_to root_path
    else
      render :new
    end
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