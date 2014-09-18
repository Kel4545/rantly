class DashboardController < ApplicationController

  def show
    @user = User.find(params[:id])
    @rant = Rant.new
    @rants = Rant.all
  end

end