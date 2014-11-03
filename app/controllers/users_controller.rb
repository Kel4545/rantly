class UsersController < ApplicationController
  respond_to :html, :json

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @follow = Follow.all
    @rants = Rant.order('favorites_count ASC')
    @comment = Comment.new
  end

  def new
    @user = User.new
    render :layout => "root"
  end

  def create
    @user = User.new(accepted_params)
    if @user.save!
      set_cookie
      Keen.publish(:sign_ups, {username: @user.username, date: @user.created_at}) if Rails.env.production?
      UserMailer.welcome_email(@user).deliver
      UserMailer.send_confirmation_mail(@user).deliver
      flash[:notice] = "Thank you for registering! Please confirm your email address to log in"
      redirect_to root_path
    else
      flash[:notice] = "Please try and register again"
      render :new, :layout => "root"
    end
  end

  def edit
    @user = current_user
    render :layout => "edit"
  end

  def update
    @user = current_user
    @user.update_attributes(accepted_params)
    if @user.save
      redirect_to dashboard_path(@user)
    else
      flash[:notice] = "Information not saved"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def account_confirmation
    @user = User.find_by_remember_token(params[:token])
    if @user
      @user.update_column(:confirmed, true)
      redirect_to signin_path, :notice => "Account confirmed"
    else
      redirect_to root_path, :notice => "Account could not be confirmed"
    end
  end
end

private

def accepted_params
  params.require(:user).permit(:username, :password, :firstname, :lastname, :bio, :frequency, :avatar, :email)
end

def set_cookie
  cookies.permanent[:registered] = true
end

def check_signed_in
  if !signed_in?
    flash.alert.now = "Please sign in to continue"
    redirect_to root_url
  else
    @user = current_user
  end
end



