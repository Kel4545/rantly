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

  private

  def check_if_admin
    unless current_user.admin
      redirect_to root_path
    end
  end

  def disable_user(user)
    if user.disabled
      user.update_attributes(disabled: true)
      redirect_to :back
    else
      user.update_attributes(disabled: false)
      redirect_to :back
    end
  end
end 