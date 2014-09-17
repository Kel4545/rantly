class UsersController < ApplicationController

  def show
  @user = User.find(params[:id])
  @rants = Rant.all
  end

  def index
  end

  def new
    @user = User.new
    render :layout => "dashboard"
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