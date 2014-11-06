class AdminsController < ApplicationController
  before_action :check_if_admin
  layout "admins"

  def show
  end

  def rants
    @rants = Rant.order('created_at DESC')
  end

  def users
    if params[:sort]
      @users = User.where(admin: false).sort_by { |user| user.rants.count }.reverse
    else
      @users = User.where(admin: false)
    end
  end

  def spam
    @rants = Rant.where(spam: true)
  end

  def disable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, true)
    redirect_to :back
  end

  def enable
    @user = User.find(params[:id])
    @user.update_attribute(:disabled, false)
    redirect_to :back
  end

  def impersonate
    session[:admin_id] = current_user.id
    session[:user_id] = params[:user_id]
    redirect_to root_path
  end

  def neinimpersonate
    session[:user_id] = session[:admin_id]
    session.delete(:admin_id)
    redirect_to root_path
  end



  private

  def check_if_admin
    unless current_user.admin
      redirect_to root_path
    end
  end
end