class Users < ApplicationController

  def index
    @user = User.all

  end
end