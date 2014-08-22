class RegistrationsController < ApplicationController

  skip_before_filter :ensure_authenticated_user

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      username: params[:user][:username],
      firstname: params[:user][:firstname],
      lastname: params[:user][:lastname],
      bio: params[:user][:bio],
      password: params[:user][:password]
    )

    if @user.save
      flash[:notice] = "Thank you for registering!"
      redirect_to root_path
    else
      render :new
    end
  end
end