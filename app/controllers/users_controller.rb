class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @follow = Follow.all
  end

  def new
    @user = User.new
    render :layout => "root"
  end

  def create
    @user = User.new(required_params)
    if @user.save
      # @user.create_image(params[:user][:image])
      set_cookie
      flash[:notice] = "Thank you for registering!"
      redirect_to root_path
    else
      render :new, :layout => "root"
    end
  end

  def edit
    @user = User.find(params[:id])
    @rant = Rant.new
    render :layout => "edit"
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


  private

  def required_params
    params.require(:user).permit(:username, :password, :firstname, :lastname, :bio, :frequency)
  end

  def set_cookie
  cookies.permanent[:registered] = true
  end
end