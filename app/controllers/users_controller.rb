class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rant = Rant.all
  end

  def new
    @user = User.new
    render :layout => "root"
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname],
      bio: params[:user][:bio],
      password: params[:user][:password],
      frequency: params[:user][:frequency])
    if @user.save
      flash[:notice] = "Thank you for registering!"
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
    @rant = Rant.new
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(
      username: params[:user][:username],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname],
      bio: params[:user][:bio],
      password: params[:user][:password])
    redirect_to dashboard_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
end